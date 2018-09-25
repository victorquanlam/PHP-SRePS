<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$id = $_GET['id'];
$sql = "SELECT * FROM `sale` WHERE `sale_id` = $id";
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
  <form method="post"  action="sales.php">
    <fieldset>
    <div>
      <label for="sale_id" class="edit_label">Item ID:</label>
      <input type="text" class="edit_input" value = <?php echo $row["sale_id"]; ?> onfocus="this.blur()" name="sale_id" id="sale_id" readonly>
    </div>
    <div>
      <label for="sale_date" class="edit_label">Date:</label>
      <input type="text" class="edit_input" value = <?php echo $row["sale_date"]; ?> onfocus="this.blur()" name="sale_date" id="sale_date" readonly>
    </div>
    <div>
      <label for="sale_name" class="edit_label">Name:</label>
      <input type="text" class="edit_input" value = <?php echo $row["sale_name"]; ?> onfocus="this.blur()" name="sale_name" id="sale_name" readonly>
    </div>
    <div>
      <label for="total_amount" class="edit_label">Amount:</label>
      <input type="text" class="edit_input" value = <?php echo $row["total_amount"]; ?> name="total_amount" id="total_amount">
    </div>
    <div>
      <label for="discount" class="edit_label">Discount:</label>
      <input type="text" class="edit_input" value = <?php echo $row["discount"]; ?> name="discount" id="discount">
    </div>
    <div>
      <label for="payment_type" class="edit_label">Payment Type:</label>
      <select name = "payment_type">
        <option value="Credit Card" <?php if($row["payment_type"]=="Credit Card") echo"selected='selected'"?>>Credit Card</option>
        <option value="Eftpos"<?php if($row["payment_type"]=="Eftpos") echo"selected='selected'"?>>Eftpos</option>
        <option value="Cash"<?php if($row["payment_type"]=="Cash") echo"selected='selected'"?>>Cash</option>
      </select>
    </div>
    <div>
      <label for="payment_status" class="edit_label">Payment Status:</label>
      <select name = "payment_status">
        <option value="Completed" <?php if($row["payment_status"]=="Completed") echo"selected='selected'"?>>Completed</option>
        <option value="Waiting"<?php if($row["payment_status"]=="Waiting") echo"selected='selected'"?>>Waiting</option>
      </select>
    </div>
    <div>
      <label for="product_price" class="edit_label">Price:</label>
      <input type="text" class="edit_input" value = <?php echo $row["product_price"]; ?> name="product_price" id="product_price">
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
