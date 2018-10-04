<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$id = $_GET['id'];
$sql = "SELECT * FROM `sale` WHERE `sale_id` = $id";
$result = $connect->query($sql);
$row = $result->fetch_assoc();
$sql1 = "SELECT * FROM `product`";
$result1 = $connect->query($sql1);
?>
<!--put your content hereeeeeeeeeeeeeee-->
<html>
<head>
<link rel="stylesheet" type="text/css" src="custom/css/custom.css" />
</head>

<body>
  <h2><span ></span>Edit Sale</h2>
  <hr/>
  <form method="post"  action="sales.php">
    <fieldset>
    <div>
      <label for="sale_id">Item ID:</label>
      <input type="text"  value = <?php echo $row["sale_id"]; ?> onfocus="this.blur()" name="sale_id" id="sale_id" readonly>
    </div>
    <div>
      <label for="sale_date">Date:</label>
      <input type="text"  value = <?php echo $row["sale_date"]; ?> onfocus="this.blur()" name="sale_date" id="sale_date" readonly>
    </div>
    <div>
      <label for="sale_name">Name:</label>
      <input type="text"  value = <?php echo $row["sale_name"]; ?> onfocus="this.blur()" name="sale_name" id="sale_name" readonly>
    </div>
    <div>
    <label for="product_name">Product Name:</label>
    <select name="product_name" id="product_name">
      <?php while($row1 = mysqli_fetch_array($result1)):;?>
      <option value = "<?php echo $row1["product_name"];?>"><?php echo $row1["product_name"];?></option>
      <?php endwhile?>
    </select>
    <div>
      <label for="quantity">Quantity:</label>
      <input type="text"  value = <?php echo $row["quantity"]; ?> name="quantity" id="quantity">
    </div>
    <div>
      <label for="discount">Discount:</label>
      <input type="text"  value = <?php echo $row["discount"]; ?> name="discount" id="discount">
    </div>
    <div>
      <label for="payment_type">Payment Type:</label>
      <select name = "payment_type">
        <option value="Credit Card" <?php if($row["payment_type"]=="Credit Card") echo"selected='selected'"?>>Credit Card</option>
        <option value="Eftpos"<?php if($row["payment_type"]=="Eftpos") echo"selected='selected'"?>>Eftpos</option>
        <option value="Cash"<?php if($row["payment_type"]=="Cash") echo"selected='selected'"?>>Cash</option>
      </select>
    </div>
    <div>
      <label for="payment_status">Payment Status:</label>
      <select name = "payment_status">
        <option id="Pending" value="Pending" <?php if($row["payment_status"]=="Pending") echo"selected='selected'"?>>Pending</option>
        <option id="Processing" value="Processing" <?php if($row["payment_status"]=="Processing") echo"selected='selected'"?>>Processing</option>
        <option id="Completed" value="Completed" <?php if($row["payment_status"]=="Completed") echo"selected='selected'"?>>Completed</option>
      </select>
    </div>
    <div>
      <input type="submit" id="submit" value="Submit" />
      <input type="hidden" name="page_from" value="edit">
  	  <input type="button" id="cancel" value="Cancel" onClick="document.location.href='sales.php'" />
    </div>
  </fieldset>
  </form>
</body>

</html>


<?php

require_once("includes/footer.php"); ?>
