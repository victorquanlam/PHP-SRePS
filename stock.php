<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
    $quantity = $_POST["quantity"];
    $product_name = $_POST["product_name"];
    $query1 = "SELECT * FROM product WHERE product_name = '$product_name'";
    $result2 = $connect->query($query1);
    $row = $result2->fetch_assoc();
    $product_id = $row["product_id"];
    $total = $quantity * $row["price"];
    if( $_POST["page_form"]== "add")
    {
        $query2 = "INSERT INTO `order_stock`(`product_id`, `quantity`, `total`) VALUES ('$product_id','$quantity','$total')";
        $connect->query($query2);
    }
    else if($_POST["page_form"] == "edit")
    {
        $orders_stock_id = $_POST["orders_stock_id"];
        $query = "UPDATE  order_stock SET product_id = '$product_id', quantity = '$quantity',total = '$total' WHERE orders_stock_id = '$orders_stock_id'";
        mysqli_query($connect, $query);
    }

    
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
  <td>Product ID</td>
  <td>Product Name</td>
  <td>Quantity</td>
  <td>Total</td>
  <td>Action</td>
</tr>";
while($row3 = $result->fetch_assoc())
{
    echo"
    <tr>
        <td>".$row3["orders_stock_id"]."</td>
        <td>".$row3["product_id"]."</td>
        <td>";
        $product_id = $row3["product_id"];
        $query2 = "SELECT * FROM product WHERE product_id = '$product_id '";
        $result3 = $connect->query($query2);
        $row1 = $result3->fetch_assoc();
        echo $row1["product_name"];
        echo "</td><td>".$row3["quantity"]."</td>
        <td>".$row3["total"]."</td>
        <td><a href='editstock.php?id=".$row3["orders_stock_id"]."''/a>Edit</td>
    </tr>";
}
echo"</table>";
?>
<?php

require_once("includes/footer.php"); ?>
