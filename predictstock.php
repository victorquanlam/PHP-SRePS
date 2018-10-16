<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$sql = "SELECT * FROM `product`";
$result = $connect->query($sql);

$sql2 = "SELECT * FROM `sale`";
$result2 = $connect->query($sql2);

echo "<h2>Predicted Stock Orders for Next Month</h2><hr \>";
echo"<table border='1em' class='table table-bordered table-striped table-hover'>";
echo"
<tr>
  <td>Product ID</td>
  <td>Product Name</td>
  <td>Predicted Order</td>
</tr>";
$quantities = array();
$ids = array();
$months = array();
while($row2 = $result2->fetch_assoc())
    {
        array_unshift($ids, $row2["product_id"]);
        array_unshift($quantities, $row2["quantity"]);
        $month = date("n",strtotime($row2["sale_date"]));
        array_unshift($months, $month);
    }

$order=0;
$thismonth=date("n");
while($row = $result->fetch_assoc())
{
    for ($i=0; $i < count($ids); $i++) 
    { 
        if (($months[$i]>=($thismonth-2))&&($months[$i]<=$thismonth)) 
        {
            if ($row["product_id"] == $ids[$i]) 
            {
                $order += $quantities[$i];
            }
        }
    }
    $average = round($order/3);
    echo"
        <tr>
        <td>".$row["product_id"]."</td>
        <td>".$row["product_name"]."</td>
        <td>".$average."</td>
        </tr>";
    $order = 0;
}
echo"</table>";
?>

<!--put your content hereeeeeeeeeeeeeee-->

<?php
require_once("includes/footer.php"); 
?>