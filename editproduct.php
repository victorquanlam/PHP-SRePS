<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
    $sql = "SELECT * FROM `product`";
    $result = $connect->query($sql);
?>

<form id="editproductsform" method="post" action="updateproduct.php" validate="validate">
    <fieldset id="editproductinfo">
    <legend>Edit Product: </legend>
        <p><label for="select_product">Select Product: </label>
        <select name="select_product" id="select_product">
        <?php while($row = mysqli_fetch_array($result)):;?>
        <option value = "<?php echo $row["product_name"];?>"><?php echo $row["product_name"];?></option>
        <?php endwhile?>
        </select></p></p>

        <p><label for="new_name">New Product Name: </label>
        <input type="text" name="new_name" id="new_name" required="required"/></p>
        <p><label for="new_price">New Price: </label>
        <input type="text" name="new_price" id="new_price" maxlength="3" required="required" size="5"/></p>
    </fieldset>    

    <input id="submitbutton" type="submit" value="Commit Edit"/>
	<input type="reset" value="Reset"/>

</form>


<?php 
    require_once("includes/footer.php"); 
?>
