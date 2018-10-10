<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
  if($_POST["page_from"] == "edit")
  {
    $id = $_POST["sale_id"];
    $discount = $_POST["discount"];
    $payment_type = $_POST["payment_type"];
    $payment_status = $_POST["payment_status"];
    $quantity = $_POST["quantity"];
    $sql1 = "SELECT * FROM `product` where product_name = '$_POST[product_name]'";
    $result1 = $connect->query($sql1);
    $row1 = $result1->fetch_assoc();
    $total = $row1["price"] * $quantity;
    mysqli_query($connect, "UPDATE sale SET quantity = '$quantity', discount ='$discount', payment_type = '$payment_type', total = '$total', payment_status = '$payment_status', product_id='$row1[product_id]' WHERE sale_id='$id'");
  }
  else if($_POST["page_from"] == "remove")
  {
    $id = $_POST["sale_id"];
    mysqli_query($connect,"DELETE FROM sale WHERE sale_id = '$id'");
  }
}
$sql = "SELECT * FROM `sale`";
$result = $connect->query($sql);
echo "<h2>Sales Records</h2><hr \>";
echo '<a href="add_sales.php"><button>Add Sales</button></a>';
echo '<a href="yearly_sales.php"><button>2018 Sales Report</button></a>';
echo '<a href="sales_monthly.php"><button>Monthly Sales Reports</button></a>';
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
  <td>Action</td>
</tr>";
while($row = $result->fetch_assoc())
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
        <td><a href='edit.php?id=".$row["sale_id"]."'>Edit</a> /
        <a href='removesale.php?id=".$row["sale_id"]."'>Remove</a>
        </td>
    </tr>";
}
echo"</table>";
?>

<?php

require_once("includes/footer.php"); ?>
