<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$id = $_GET['id'];
$sql = "SELECT * FROM `order_stock` WHERE `orders_stock_id` = $id";
$result = $connect->query($sql);
$row = $result->fetch_assoc();
?>
<!--put your content hereeeeeeeeeeeeeee-->
<html>
<head>
<link rel="stylesheet" type="text/css" src="custom/css/custom.css" />
</head>

<body>
  <div class ="edit_sale_box">
  <h2><span ></span>Edit Sale</h2>
  <form method="post"  action="stock.php">
    <fieldset>
    <input type="hidden" name="page_form"  id="page_form" value="edit">
    <div>
      <label for="orders_stock_id" class="edit_label">Order ID:</label>
      <input type="text" class="edit_input" value = <?php echo $row["orders_stock_id"]; ?> onfocus="this.blur()" name="orders_stock_id" id="orders_stock_id" readonly>
    </div>
    <div>
      <label for="product_name" class="edit_label">Product Name:</label>
      <input type="text" class="edit_input" value = <?php echo $row["product_name"]; ?>  name="product_name" id="product_name">
    </div>
    <div>
      <label for="quantity" class="edit_label">Quantity:</label>
      <input type="text" class="edit_input" value = <?php echo $row["quantity"]; ?>  name="quantity" id="quantity">
    </div>
    <div>
      <label for="price" class="edit_label">Price:</label>
      <input type="text" class="edit_input" value = <?php echo $row["price"]; ?> name="price" id="price">
    </div>
    <div>
      <label for="total" class="edit_label">Total:</label>
      <input type="text" class="edit_input" value = <?php echo $row["total"]; ?> name="total" id="total">
    </div>
    <div>
      <label for="orders_stock_status" class="edit_label">Payment Type:</label>
      <select name = "orders_stock_status">
        <option value="Pending" <?php if($row["orders_stock_status"]=="Pending") echo"selected='selected'"?>>Pending</option>
        <option value="Processing"<?php if($row["orders_stock_status"]=="Processing") echo"selected='selected'"?>>Processing</option>
        <option value="Completed"<?php if($row["orders_stock_status"]=="Completed") echo"selected='selected'"?>>Completed</option>
      </select>
    </div>
    <div class="edit_button">
      <input type="submit" class="button_primary" id="submit" value="Submit" />
  	  <input type="reset" class="button_primary"  id="cancel" value="Cancel" />
    </div>
  </fieldset>
  </form>
  </div>
</body>

</html>


<?php

require_once("includes/footer.php"); ?>
