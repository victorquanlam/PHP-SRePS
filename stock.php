<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
    $product_name = $_POST["product_name"];
    $quantity = $_POST["quantity"];
    $price = $_POST["price"];
    if( $_POST["page_form"]== "add")
    {
        $query = "INSERT INTO `order_stock` (`product_name`, `quantity`, `price`) VALUES ('$product_name', '$quantity', '$price')";
    }
    else if($_POST["page_form"] == "edit")
    {
        $orders_stock_id = $_POST["orders_stock_id"];
        $query = "UPDATE  order_stock SET product_name = '$product_name', quantity = '$quantity',price = '$price' WHERE orders_stock_id = '$orders_stock_id'";
    }

    mysqli_query($connect, $query);
}
$sql = "SELECT * FROM `order_stock`";
$result = $connect->query($sql);
echo "<h2>Stock Orders</h2>";
echo "<input class=\"button_normal right_align_button\"  type=\"button\" value=\"Add Stock\" onclick=\"window.location.href='addstock.php'\">";
echo "<hr \>";

echo"<table border='1em' class='table table-bordered table-striped table-hover'>";
echo"
<tr>
  <td>Stock ID</td>
  <td>Product Name</td>
  <td>Quantity</td>
  <td>Price</td>
  <td>Action</td>
</tr>";
while($row = $result->fetch_assoc())
{
    echo"
    <tr>
        <td>".$row["orders_stock_id"]."</td>
        <td>".$row["product_name"]."</td>
        <td>".$row["quantity"]."</td>
        <td>".$row["price"]."</td>
        <td><a href='editstock.php?id=".$row["orders_stock_id"]."' target = '_blank'/a>Edit</td>
    </tr>";
}
echo"</table>";
?>
<?php

require_once("includes/footer.php"); ?>
