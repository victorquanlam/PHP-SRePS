<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
?>

<?php 
    $selectproduct = $_POST["select_product"];
    $newname = $_POST["new_name"];
    $newprice = $_POST["new_price"];

    $sql="UPDATE product 
    SET product_name = '$newname', price = '$newprice'
    WHERE product_name = '$selectproduct'";

    if ($connect->query($sql) === TRUE) {
        echo "Product edited successfully";
        echo "<p><a href='sales.php'><button>Return to Sales Page</button></a></p>";
    } 
    else {
        echo "Error: " . $sql . "<br>" . $connect->error;
    }
?>

<?php 
    require_once("includes/footer.php"); 
?>