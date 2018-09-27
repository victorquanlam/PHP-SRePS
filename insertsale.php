<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
?>

<?php

$sql="INSERT INTO sale (sale_date, sale_name, product_price, total_amount, discount, payment_type, payment_status)
    VALUES ('$_POST[saledate]', '$_POST[productname]', '$_POST[price]', '$_POST[quantity]', '$_POST[discount]', '$_POST[paymenttype]', '$_POST[paymentstatus]')";

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
