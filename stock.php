<?php 
require_once("action/dp_connect.php");
require_once("includes/header.php");



$sql = "SELECT * FROM `order_stock`";
$result = $connect->query($sql);
echo "<h2>Stock Orders</h2><hr \>";
echo"<table border='1em' class='table table-bordered table-striped table-hover'>";
echo"
<tr>
  <td>Order ID</td>
  <td>Product ID</td>
  <td>Quantity</td>
  <td>Price</td>
  <td>Total</td>
  <td>Status</td>
  <td>Action</td>
</tr>";
while($row = $result->fetch_assoc())
{
    echo"
    <tr>
        <td>".$row["orders_stock_id"]."</td>
        <td>".$row["product_id"]."</td>
        <td>".$row["quantity"]."</td>
        <td>".$row["price"]."</td>
        <td>".$row["total"]."</td>
        <td>".$row["orders_stock_status"]."</td>
        <td></td>
    </tr>";
}
echo"</table>";



?>








<?php 

require_once("includes/footer.php"); ?>

