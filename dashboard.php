<?php 
require_once("action/dp_connect.php");
require_once("includes/header1.php");


$selected_year = "2018";

















  $sales_query = "SELECT MONTHNAME(sale_date)AS selected_date,SUM(quantity) AS quantity,product_id FROM sale WHERE YEAR(sale_date) = '$selected_year' GROUP BY MONTH(sale_date)";
  $result1 = $connect->query($sales_query);

$sales_query2 = "SELECT s.saleQty AS quantity, p.product_name AS name FROM product p INNER JOIN (SELECT SUM(quantity) AS saleQty, product_id FROM sale GROUP BY product_id ) s ON s.product_id=p.product_id ORDER BY quantity DESC";
  $result4 = $connect->query($sales_query2);
  $result6 = $connect->query($sales_query2);
  $result7 = $connect->query($sales_query2);

  $sales_query3 = "SELECT s.saleQty AS quantity, s.month as month, p.product_name AS name FROM product p INNER JOIN (SELECT SUM(quantity) AS saleQty, MONTHNAME(sale_date) as month, product_id FROM sale GROUP BY product_id,month) s ON s.product_id=p.product_id  ";
  $result5 = $connect->query($sales_query3);

  $rows = array();
    $rows2 = array();
  $table = array();

  $table['cols'] = array(
  array(
    'label' => 'Month Name', 
    'type' => 'string'
  ),
  array(
    'label' => 'Estimated', 
    'type' => 'number'
  ),
  array(
    'label' => 'Actual', 
    'type' => 'number'
  )
  );

  $table2['cols'] = array(
  array(
    'label' => 'Products', 
    'type' => 'string'
  ),
  array(
    'label' => 'Sold', 
    'type' => 'number'
  )
  );
 
  $total_units= 0;
  $month_list =array(
		array("Jan",0,0),
 		array("Feb",0,0),
 		array("Mar",0,0),
  		array("Apr",0,0),
  		array("May",0,0),
 		array("Jun",0,0),
 		array("Jul",0,0),
  		array("Aug",0,0),
  		array("Sep",0,0),
 		array("Oct",0,0),
 		array("Nov",0,0),
  		array("Dec",0,0)
  );
  $predict_sale=array();
 

 
 	while($row = $result4->fetch_assoc())
  {

 $sub_array = array();
  
  $sub_array[] = array("v" => $row["name"]);
 
  $sub_array[] = array("v" => intval($row["quantity"]));

  $rows2[] = array("c" => $sub_array);
  
 
  

  }
 
  while($row = $result1->fetch_assoc())
  {
  	
    
    $month = explode(".",$row["selected_date"]);
   

   
			
			switch ($month[0]) {
		case "January":
			
			$month_list[0][2] +=$row["quantity"];
			$month_list[0][1] =$month_list[0][2];

			break;
		case "February":
			
			
			$month_list[1][2] +=$row["quantity"];
			$month_list[1][1] =$month_list[0][2];
			break;
		case "March":
			$month_list[2][2] +=$row["quantity"];
			$month_list[2][1] =($month_list[0][2]+$month_list[1][2])/2;
			break;
		case "April":
			$month_list[3][2] +=$row["quantity"];
			$month_list[3][1] =($month_list[0][2]+$month_list[1][2]+$month_list[2][2])/3;
			break;
		case "May":
			$month_list[4][2] +=$row["quantity"];
			$month_list[4][1] =($month_list[3][2]+$month_list[1][2]+$month_list[2][2])/3;
			break;
		case "June":
			$month_list[5][2] +=$row["quantity"];
			$month_list[5][1]=($month_list[3][2]+$month_list[4][2]+$month_list[2][2])/3;
			break;
		case "July":
			$month_list[6][2] +=$row["quantity"];
			$month_list[6][1]=($month_list[3][2]+$month_list[4][2]+$month_list[5][2])/3;
			break;
		case "August":
			$month_list[7][2] +=$row["quantity"];
			$month_list[7][1] =($month_list[6][2]+$month_list[4][2]+$month_list[5][2])/3;
			
			break;
		case "September":
			$month_list[8][2] +=$row["quantity"];
			$month_list[8][1]=($month_list[6][2]+$month_list[7][2]+$month_list[5][2])/3;
			break;
		case "October":
			$month_list[9][2] +=$row["quantity"];
			$month_list[9][1]=($month_list[6][2]+$month_list[7][2]+$month_list[8][2])/3;
			break;
		case "November":
			$month_list[10][2] +=$row["quantity"];
			$month_list[10][1]=($month_list[9][2]+$month_list[7][2]+$month_list[8][2])/3;
			break;
		case "December":
			$month_list[11][2] +=$row["quantity"];
			$month_list[0][1]=($month_list[9][2]+$month_list[10][2]+$month_list[8][2])/3;
			break;								
		default:
			
			break;
	}
	
	
}
foreach ($month_list as &$value) {
    $sub_array = array();
    
    	$sub_array[] = array("v" => $value[0]);
   		 $sub_array[] = array("v" => $value[1]);
   		 $sub_array[] = array("v" => $value[2]);
   		

    
     $rows[] = array("c" => $sub_array);
}

$table['rows'] = $rows;
    $table2['rows'] = $rows2;
  $jsontable = json_encode($table);

  $jsontable2 = json_encode($table2);










$selected_month1="June";
$selected_month2="July";



if(isset($_POST["selected_month1"])){
	$selected_month1=$_POST["selected_month1"];
}

if(isset($_POST["selected_month2"])){
	$selected_month2=$_POST["selected_month2"];
}

$month1_sale=array();
$month2_sale=array();

$rows4 = array();
  $table4 = array();

$table4['cols'] = array(
  array(
    'label' => 'Products', 
    'type' => 'string'
  ),
  array(
    'label' => $selected_month1, 
    'type' => 'number'
  ),
  array(
    'label' => $selected_month2, 
    'type' => 'number'
  ),
  array(
    'label' => 'Percentage Changes', 
    'type' => 'number'
  )
  );




while($row = $result5->fetch_assoc())
  {

  	if($row["month"]==$selected_month1){
  		
  		$month1_sale[]=array($row["name"],$row["quantity"]);
  		
  	}
  	if($row["month"]==$selected_month2){
  		$month2_sale[]=array($row["name"],$row["quantity"]);
  	}

  }

while($row = $result6->fetch_assoc())
  {
  	$no1=0;
  	$no2=0;
  	
	foreach ($month1_sale as &$one) {
	    if($one[0]==$row["name"]){
	    	
	    	$no1=$one[1];
	    }
	}


	foreach ($month2_sale as &$two) {
	     if($two[0]==$row["name"]){
	    	$no2=$two[1];
	    }
	}
	$percentage=(($no1-$no2)/$no1)*100;


	 $sub_array = array();
  
   
    
    $sub_array[] = array("v" => $row["name"]);
    $sub_array[] = array("v" => $no1);
    $sub_array[] = array("v" => $no2);
    $sub_array[] = array("v" => number_format((float)$percentage, 2, '.', ''));
    $rows4[] = array("c" => $sub_array);

}


 $table4['rows'] = $rows4;
  $jsontable4 = json_encode($table4);









$selected_product = "";
$product_name;
$get_name;
if(!isset($_POST["product_name"])){
	$get_name="Ultiboost High Strength Cranberry 90 Capsules";
}
else{
	
	$get_name=$_POST["product_name"];
}

  $query1 = "SELECT * FROM product WHERE product_name = '$get_name'";
  $result2 = $connect->query($query1);
  $row = $result2->fetch_assoc();
  $selected_product = $row["product_id"];
  $product_name = $row["product_name"];

$datePoints= array();


if($selected_product!="")
{
  $sales_query3 = "SELECT MONTHNAME(sale_date) AS month_name,SUM(quantity) AS total_units,product_id FROM sale WHERE YEAR(sale_date) = 2018 AND product_id = '$selected_product' GROUP BY MONTH(sale_date),product_id";
  $result5 = $connect->query($sales_query3);
  $rows3 = array();
  $table3 = array();

  $table3['cols'] = array(
  array(
    'label' => 'Month Name', 
    'type' => 'string'
  ),
  array(
    'label' => 'Units', 
    'type' => 'number'
  )
  );
 while($row = $result5->fetch_assoc())
  {
    
    $sub_array = array();
    $month = explode(".",$row["month_name"]);
   
    
    $sub_array[] = array("v" => $month);
    $sub_array[] = array("v" => $row["total_units"]);
    $rows3[] = array("c" => $sub_array);

    
    
  }
   $table3['rows'] = $rows3;
  $jsontable3 = json_encode($table3);

}























$sql = "SELECT * FROM `product`";
$result = $connect->query($sql);

$sql1 = "SELECT YEAR(sale_date) as years  FROM `sale` GROUP BY YEAR(sale_date)";
$result3 = $connect->query($sql1);


$sql2 = "SELECT MONTHNAME(sale_date) as months FROM `sale` GROUP BY MONTH(sale_date)";
$month_sql = $connect->query($sql2);
$month_sql1 = $connect->query($sql2);

?>

<!--put your content hereeeeeeeeeeeeeee-->








<script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart1);
   google.charts.setOnLoadCallback(drawChart2);
	google.charts.setOnLoadCallback(drawChart3);
	google.charts.setOnLoadCallback(drawChart4);
	
   function drawChart1()
   {
    var data = new google.visualization.DataTable(<?php echo $jsontable; ?>);

   var options = {
        title: 'Prediction vs Actual',
        hAxis: {
          title: 'Months',
           height: 300,
          
        },
        vAxis: {
          title: 'Total Units'
        }
      };

    var chart = new google.visualization.ColumnChart(document.getElementById('column_chart'));

    chart.draw(data, options);

   }

   	  function drawChart2()
   {
    var data2 = new google.visualization.DataTable(<?php echo $jsontable2; ?>);

   var options2 = {
        title: 'Compare quantity of sold products'
      };

    var chart2 = new google.visualization.PieChart(document.getElementById('pie_chart'));

    chart2.draw(data2, options2);

   }


   function drawChart3()
   {
    var data = new google.visualization.DataTable(<?php echo $jsontable3; ?>);

    var options = {
     title:'Monthly Trend Sale'
     
    
    };

    var chart = new google.visualization.LineChart(document.getElementById('line_chart'));

    chart.draw(data, options);

   }
  
  function drawChart4()
   {
    var data = new google.visualization.DataTable(<?php echo $jsontable4; ?>);

    var options = {
     title:'Compare Months',
          curveType: 'function',
          legend: { position: 'bottom' }
      
          
      };
     
    
    

    var chart = new google.visualization.LineChart(document.getElementById('table_chart'));

    chart.draw(data, options);

   }





   google.charts.load('current', {'packages':['table']});
   google.charts.setOnLoadCallback(drawTable);

   function drawTable()
   {
    var data = new google.visualization.DataTable(<?php echo $jsontable4; ?>);

    var options = {
     showRowNumber: true, width: '100%', height: '100%'
     
    
    };

    var table = new google.visualization.Table(document.getElementById('table'));

    table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});

   }


  </script>



    
    <div style="overflow: hidden; padding-right: .5em;">
      
    <label for="product_name" class="edit_label">Year:</label>
    <select name="selected_year" id="selected_year">
      <?php while($row = mysqli_fetch_array($result3)):;?>
      <option value = "<?php echo $row["years"];?>"<?php if($row["years"]==$selected_year)echo "selected = selected";?>><?php echo $row["years"];?></option>
      <?php endwhile?>
    </select></p>
    </div>
  

      
     
      <div class="col-lg-6" id="column_chart" style=" height: 400px"> </div>
		<div class="col-lg-6" id="pie_chart" style=" height: 400px"> </div>
		<div class="col-lg-4"  style=" height: 400px">





							<form method="post" action="dashboard.php">
				    
				    <div style="overflow: hidden; padding-right: .5em;">
				      <input type="submit" id="submit" value="Show" style="float: right; margin: auto; margin-right: 10px; font-size: 13px; "/>
				    <label for="product_name" class="edit_label">Product Name:</label>
				    <select name="product_name" id="product_name">
				      <?php while($row = mysqli_fetch_array($result)):;?>
				      <option value = "<?php echo $row["product_name"];?>"<?php if($row["product_id"]==$selected_product)echo "selected = selected";?>><?php echo $row["product_name"];?></option>
				      <?php endwhile?>
				    </select></p>
				    
				    </div>
				</form>
				    <div id="line_chart" style=" height: 350px"> </div>


		 </div>
		

			



			

			
				<div class="col-lg-4"  style=" height: 400px" >
					
				<form method="post" action="dashboard.php">
				    
				    <div style="overflow: hidden; ">
				      <input type="submit" id="submit" value="Compare" style="float: right; margin: auto;  font-size: 10px; "/>
				    <label for="selected_month1" class="edit_label">Month: </label>
				    <select name="selected_month1" id="selected_month1">
				      <?php while($row = mysqli_fetch_array($month_sql)):;?>
				      <option value = "<?php echo $row["months"];?>"<?php if($row["months"]==$selected_month1)echo "selected = selected";?>><?php echo $row["months"];?></option>
				      <?php endwhile?>
				    </select>
				    <label for="selected_month2" class="edit_label">Compare to: </label>
				    <select name="selected_month2" id="selected_month2">
				      <?php while($row1 = mysqli_fetch_array($month_sql1)):;?>
				      <option value = "<?php echo $row1["months"];?>"<?php if($row1["months"]==$selected_month2)echo "selected = selected";?>><?php echo $row1["months"];?></option>
				      <?php endwhile?>
				    </select>




				    
				    </div>
				</form>

					<div id="table"></div>
				</div>
				<div class="col-lg-4" style=" height: 400px "id="table_chart"></div>
			








     


<?php 
require_once("includes/footer.php"); ?>



