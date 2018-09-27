<?php 
    require_once("action/dp_connect.php");
    require_once("includes/header.php");
?>

<form id="addsalesform" method="post" action="insertsale.php" novalidate="novalidate">
    <fieldset id="saleinfo">
        <legend>Add Sale: </legend>
        <p><label for="saleid">Sale ID: </label>
        <input type="text" name="saleid" id="saleid" maxlength="50" required="required" value="100001"/></p>
        <p><label for="saledate">Sale Date: </label>
        <input type="date" name="saledate" id="saledate" maxlength="50" required="required"/></p>
        <p><label for="productname">Product Name: </label>
        <input type="text" name="productname" id="productname" maxlength="50" required="required"/></p>
        <p><label for="price">Price: $</label>
        <input type="text" name="price" id="price" maxlength="5" required="required" size="10"/></p>
        <p><label for="quantity">Quantity: </label>
        <input type="text" name="quantity" id="quantity" maxlength="3" required="required" size="5"/></p>
        <p><label for="quantity">Discount: </label>
        <input type="text" name="discount" id="discount" maxlength="3" required="required" size="5" placeholder="%"/></p>
        <p><label for="paymenttype">Payment Type: </label>
            <select name="paymenttype" id="paymenttype">
                <option value="">Please Select</option>
                <option id="cash" value="cash">Cash</option>
                <option id="card" value="card">Card</option>
                <option id="cheque" value="cheque">Cheque</option>
                <option id="other" value="other">Other</option>
            </select></p>
        <p><label for="paymenttype">Payment Status: </label>
            <select name="paymentstatus" id="paymentstatus">
                <option value="">Please Select</option>
                <option id="paid" value="paid">Paid</option>
                <option id="unpaid" value="unpaid">Unpaid</option>
                <option id="processing" value="processing">Processing</option>
            </select></p>
    </fieldset>

    <input id="submitbutton" type="submit" value="Add Sale"/>
	<input type="reset" value="Reset"/>

</form>




<?php 
    require_once("includes/footer.php"); 
?>

