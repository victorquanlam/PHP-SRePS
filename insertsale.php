<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
    $sql1 = "SELECT * FROM product where product_name =  '$_POST[product_name]'";
    $result = $connect->query($sql1);
    $row = mysqli_fetch_array($result);
?>

<?php
$total = $_POST["quantity"] * $row["price"];
$sale_date = $_POST["sale_date"];
$sale_name = $_POST["sale_name"];
$quantity = $_POST["quantity"];
$discount = $_POST["discount"];
$payment_type = $_POST["payment_type"];
$payment_status = $_POST["payment_status"];
$product_id = $row["product_id"];

$sql="INSERT INTO `sale`(`sale_date`, `sale_name`, `quantity`, `discount`, `payment_type`, `payment_status`, `total`, `product_id`) 
VALUES ('$sale_date', '$sale_name', '$quantity', '$discount', '$payment_type', '$payment_status','$total','$product_id')";

if ($connect->query($sql) === TRUE) {
    echo "New sale added successfully";
    echo "<p><a href='sales.php'><button>Return to Sales Page</button></a></p>";
} 
else {
    echo "Error: " . $sql . "<br>" . $connect->error;
}

?>

<?php 
    require_once("includes/footer.php"); 
?>
