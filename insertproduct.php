<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
 
?>

<?php

    $productname = $_POST["product_name"];
    $price = $_POST["price"];

    $sql="INSERT INTO `product`(`product_name`, `price`)
    VALUES ('$productname', '$price')";

    if ($connect->query($sql) === TRUE) {
        echo "New product added successfully";
        echo "<p><a href='sales.php'><button>Return to Sales Page</button></a></p>";
    } 
    else {
        echo "Error: " . $sql . "<br>" . $connect->error;
    }

?>

<?php 
    require_once("includes/footer.php"); 
?>
