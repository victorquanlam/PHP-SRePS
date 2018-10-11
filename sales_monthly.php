<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$sql = "SELECT * FROM `sale`";
$result = $connect->query($sql);

echo "<h2>Monthly Sales Report</h2><hr \>";
echo "<p>Choose a month:</p>";

for ($i=1; $i < 13; $i++) 
{ 
	$monthName = date("F", strtotime("2018-".$i."-01"));
	echo "<a href='sales_monthly.php?month=$i'>$monthName</a>";
	echo " / ";
}
echo"<table border='1em' class='table table-bordered table-striped table-hover'>";
echo"
<tr>
  <td>Sale ID</td>
  <td>Date</td>
  <td>Name</td>
  <td>Product ID</td>
  <td>Amount</td>
  <td>Discount</td>
  <td>Payment Type</td>
  <td>Status</td>
  <td>Price</td>
</tr>";
#$monthresults = array(7);
#$i = 0;
while($row = $result->fetch_assoc())
{
	$month = date("n",strtotime($row["sale_date"]));
	if (isset($_GET['month'])) 
	{
		if ($month == ($_GET['month'])) 
		{
			echo"
   			<tr>
       		<td>".$row["sale_id"]."</td>
        	<td>".$row["sale_date"]."</td>
        	<td>".$row["sale_name"]."</td>
        	<td>".$row["product_id"]."</td>
       		<td>".$row["quantity"]."</td>
        	<td>".$row["discount"]."</td>
        	<td>".$row["payment_type"]."</td>
        	<td>".$row["payment_status"]."</td>
        	<td>".$row["total"]."</td>
    		</tr>";
    		#$monthresults[$i] = array($row["sale_id"],$row["sale_date"],$row["sale_name"],$row["total_amount"],$row["discount"],$row["payment_type"],$row["payment_status"],$row["product_price"]);
    		#echo "$monthresults[0][0]";
		}
	}
    $i++;
}
echo"</table>";


if (isset($_GET['csvm'])) 
{
	ob_end_clean();
	header('Content-Type: text/csv; charset=utf-8');
	header('Content-Disposition: attachment; filename=monthly_sales_report.csv');
	$output = fopen('php://output', 'w');
	
	#$monthhName = array();
	#if (isset($_GET['month'])) 
	#{$monthhName[0] = $_GET['month'];}
	$title = array("Monthly Sales Report");
	$headers = array('Sale ID','Sale Date','Sale name','Total Amount','Discount','Payment Type','Payment Status','Product Price');
	
	#array_unshift($totalmonth, 'Total Sales Amount');
	#array_unshift($numbermonth, 'Number of Sales');
	#fputcsv($output, $monthhName);
	fputcsv($output, $title);
	fputcsv($output, $headers);
	
	exit();
}
echo "<a href='sales_monthly.php?csvm=true'>Export to csv</a>";
?>

<!--put your content hereeeeeeeeeeeeeee-->

<?php
require_once("includes/footer.php"); 
?>