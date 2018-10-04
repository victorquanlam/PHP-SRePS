<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$selected_product = "";
$product_name;
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
  $query1 = "SELECT * FROM product WHERE product_name = '$_POST[product_name]'";
  $result2 = $connect->query($query1);
  $row = $result2->fetch_assoc();
  $selected_product = $row["product_id"];
  $product_name = $row["product_name"];
}
$datePoints= array();

if($selected_product!="")
{
  $sales_query = "SELECT MONTHNAME(sale_date) AS month_name,SUM(quantity) AS total_units,product_id FROM sale WHERE YEAR(sale_date) = 2018 AND product_id = '$selected_product' GROUP BY MONTH(sale_date),product_id";
  $result1 = $connect->query($sales_query);
  $rows = array();
  $table = array();

  $table['cols'] = array(
  array(
    'label' => 'Month Name', 
    'type' => 'string'
  ),
  array(
    'label' => 'Units', 
    'type' => 'number'
  )
  );
  $total_month= 0;
  $total_units= 0;
  while($row = $result1->fetch_assoc())
  {
    $sub_array = array();
    $month = explode(".",$row["month_name"]);
    $sub_array[] = array("v" => $month);
    $sub_array[] = array("v" => $row["total_units"]);
    $rows[] = array("c" => $sub_array);
    $total_month++;
    $total_units+=$row["total_units"];
  }
  $sub_array = array();
  $month = explode(".","October");
  $sub_array[] = array("v" => $month);
  $predict_unit = (int)($total_units/$total_month);
  $sub_array[] = array("v" => $predict_unit);
  $rows[] = array("c" => $sub_array);
  
  $table['rows'] = $rows;
  $jsontable = json_encode($table);
}

$sql = "SELECT * FROM `product`";
$result = $connect->query($sql);
?>
<html>
  <head>
  <head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart);
   function drawChart()
   {
    var data = new google.visualization.DataTable(<?php echo $jsontable; ?>);

    var options = {
     title:'Units',
     legend:{position:'bottom'},
     chartArea:{width:'95%', height:'65%'}
    };

    var chart = new google.visualization.LineChart(document.getElementById('line_chart'));

    chart.draw(data, options);
   }
  </script>
  <style>
  .page-wrapper
  {
   width:1000px;
   margin:0 auto;
  }
  </style>
  </head>
  <body>
    <h2>Predict Sale</h2>
    <hr \>
    <form method="post" action="predictsale.php">
    <input type="submit" id="submit" value="Predict" style="float: right; margin: auto; margin-right: 380px; font-size: 13px; "/>
    <div style="overflow: hidden; padding-right: .5em;">
    <label for="product_name" class="edit_label">Product Name:</label>
    <select name="product_name" id="product_name">
      <?php while($row = mysqli_fetch_array($result)):;?>
      <option value = "<?php echo $row["product_name"];?>"<?php if($row["product_id"]==$selected_product)echo "selected = selected";?>><?php echo $row["product_name"];?></option>
      <?php endwhile?>
    </select></p>
    </div>
    <div class="page-wrapper">
      <br />
      <h2 align="center">Prediction</h2>
      <div id="line_chart" style="width: 100%; height: 500px"></div>
      </div>
    </body>
  </body>
</html>

<?php

require_once("includes/footer.php"); ?>
