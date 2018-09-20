<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
  $id = $_POST["sale_id"];
  $total_amount = $_POST["total_amount"];
  $discount = $_POST["discount"];
  $payment_type = $_POST["payment_type"];
  $payment_status = $_POST["payment_status"];
  $price = $_POST["product_price"];
  mysqli_query($connect, "UPDATE sale SET total_amount = '$total_amount', discount ='$discount', payment_type = '$payment_type', payment_status = '$payment_status', product_price='$price' WHERE sale_id='$id'");
}
$sql = "SELECT * FROM `sale`";
$result = $connect->query($sql);
echo "<h2>Sales Records</h2><hr \>";
echo '<a href="monthly_sales.php">Monthly Sales Report</a>';
echo"<table border='1em' class='table table-bordered table-striped table-hover'>";
echo"
<tr>
  <td>Sale ID</td>
  <td>Date</td>
  <td>Name</td>
  <td>Amount</td>
  <td>Discount</td>
  <td>Payment Type</td>
  <td>Status</td>
  <td>Price</td>
  <td>Action</td>
</tr>";
while($row = $result->fetch_assoc())
{
    echo"
    <tr>
        <td>".$row["sale_id"]."</td>
        <td>".$row["sale_date"]."</td>
        <td>".$row["sale_name"]."</td>
        <td>".$row["total_amount"]."</td>
        <td>".$row["discount"]."</td>
        <td>".$row["payment_type"]."</td>
        <td>".$row["payment_status"]."</td>
        <td>".$row["product_price"]."</td>
        <td><a href='edit.php?id=".$row["sale_id"]."' target = '_blank'/a>Edit</td>
    </tr>";
}
echo"</table>";
?>

<!--put your content hereeeeeeeeeeeeeee-->

<?php

require_once("includes/footer.php"); ?>
