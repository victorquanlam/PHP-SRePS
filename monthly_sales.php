<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");


$sql = "SELECT * FROM `sale`";
$result = $connect->query($sql);
echo "<h2>Monthly Sales Report</h2><hr \>";
echo"<table border='1em' class='table table-bordered table-striped table-hover'>";
echo"
<tr>
  <td>Month</td>
  <td>Number of Sales</td>
  <td>Total Sales Amount</td>
</tr>";
while($row = $result->fetch_assoc())
{
    $monthly_total = $monthly_total + $row["total_amount"];
    echo"
    <tr>
        <td>".."</td>
        <td>".."</td>
        <td>".."</td>
    </tr>";
}
echo"</table>";
?>

<!--put your content hereeeeeeeeeeeeeee-->

<?php

require_once("includes/footer.php"); ?>