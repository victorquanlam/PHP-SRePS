<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
    $sql = "SELECT * FROM `product`";
    $result = $connect->query($sql);
?>

<form id="addsalesform" method="post" action="insertsale.php" validate="validate">
    <fieldset id="saleinfo">
        <legend>Add Sale: </legend>
        <p><label for="sale_date">Sale Date: </label>
        <input type="date" name="sale_date" id="sale_date" maxlength="50" required="required"/></p>
        <p><label for="product_name">Product Name: </label>
        <select name="product_name" id="product_name">
        <?php while($row = mysqli_fetch_array($result)):;?>
        <option value = "<?php echo $row["product_name"];?>"><?php echo $row["product_name"];?></option>
        <?php endwhile?>
        </select></p></p>
        <p><label for="sale_name">Sale Name: </label>
        <input type="text" name="sale_name" id="sale_name" required="required"/></p>
        <p><label for="quantity">Quantity: </label>
        <input type="text" name="quantity" id="quantity" maxlength="3" required="required" size="5"/></p>
        <p><label for="quantity">Discount: </label>
        <input type="text" name="discount" id="discount" maxlength="3" required="required" size="5" placeholder="%"/></p>
        <p><label for="payment_type">Payment Type: </label>
            <select name="payment_type" id="payment_type">
                <option value="">Please Select</option>
                <option id="Credit Card" value="Credit Card">Credit Card</option>
                <option id="Cash" value="Cash">Cash</option>
                <option id="Eftpos" value="Eftpos">Eftpos</option>
            </select></p>
        <p><label for="payment_status">Payment Status: </label>
            <select name="payment_status" id="payment_status">
                <option value="">Please Select</option>
                <option id="Pending" value="Pending">Pending</option>
                <option id="Processing" value="Processing">Processing</option>
                <option id="Completed" value="Completed">Completed</option>
            </select></p>
    </fieldset>

    <input id="submitbutton" type="submit" value="Add Sale"/>
	<input type="reset" value="Reset"/>

</form>




<?php 
    require_once("includes/footer.php"); 
?>

