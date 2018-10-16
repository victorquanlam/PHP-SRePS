<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
?>

<form id="addproductsform" method="post" action="insertproduct.php" validate="validate">
    <fieldset id="productinfo">
        <legend>Add Product: </legend>
        <p><label for="product_name">Product Name: </label>
        <input type="text" name="product_name" id="product_name" required="required"/></p>
        <p><label for="price">Price: </label>
        <input type="text" name="price" id="price" maxlength="3" required="required" size="5"/></p>
    </fieldset>    

    <input id="submitbutton" type="submit" value="Add Product"/>
	<input type="reset" value="Reset"/>

</form>

<?php 
    require_once("includes/footer.php"); 
?>