<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
?>
<!--put your content hereeeeeeeeeeeeeee-->
<html>
<head>
<link rel="stylesheet" type="text/css" src="custom/css/custom.css" />
</head>

<body>
  <div class ="edit_sale_box">
  <h2><span></span>Add Stock</h2>
  <form method="post" action="stock.php">
    <fieldset>
    <div>
      <label for="product_name" class="edit_label">Product Name:</label>
      <input type="text" class="edit_input" name="product_name" id="product_name">
    </div>
    <div>
      <label for="quantity" class="edit_label">Quantity:</label>
      <input type="text" class="edit_input" name="quantity" id="quantity">
    </div>
    <div>
      <label for="price" class="edit_label">Price:</label>
      <input type="text" class="edit_input" name="price" id="price">
    </div>
    <div>
      <label for="total" class="edit_label">Total:</label>
      <input type="text" class="edit_input" name="total" id="total">
    </div>
    <div>
    <label for="order_status" class="edit_label">Payment Type:</label>
      <select name = "order_status">
        <option value="Pending" selected = "selected" >Pending</option>
        <option value="Processing">Processing</option>
        <option value="Completed">Completed</option>
      </select>
    </div>
    <div class="edit_button">
      <input type="submit" class="button_primary" id="submit" value="Submit" />
  	  <input type="reset" class="button_primary"  id="cancel" value="Cancel" />
      <input type="hidden" name="page_form" value="add">
    </div>
  </fieldset>
  </form>
  </div>
</body>

</html>


<?php

require_once("includes/footer.php"); ?>
