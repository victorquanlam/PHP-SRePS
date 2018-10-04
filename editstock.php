<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$id = $_GET['id'];
$sql = "SELECT * FROM order_stock WHERE orders_stock_id = '$id'";
$result = $connect->query($sql);
$row = $result->fetch_assoc();
$product_id = $row["product_id"];
$sql2 = "SELECT * FROM product WHERE product_id = '$product_id'";
$result2 = $connect->query($sql2);
$row2 = $result2->fetch_assoc();
$sql3 = "SELECT * FROM product";
$result3 = $connect->query($sql3);
echo $row2["product_name"];
?>
<!--put your content hereeeeeeeeeeeeeee-->
<html>
<head>
<link rel="stylesheet" type="text/css" src="custom/css/custom.css" />
</head>

<body>
  <h2><span ></span>Edit Stock</h2>
  <form method="post"  action="stock.php">
    <fieldset>
    <input type="hidden" name="page_form"  id="page_form" value="edit">
    <div>
      <label for="orders_stock_id" class="edit_label">Order ID:</label>
      <input type="text" class="edit_input" value = <?php echo $row["orders_stock_id"]; ?> onfocus="this.blur()" name="orders_stock_id" id="orders_stock_id" readonly>
    </div>
    <div>
    <label for="product_name" class="edit_label">Product Name:</label>
    <select name="product_name" id="product_name">
      <?php while($row3 = mysqli_fetch_array($result3)):;?>
      <option value = "<?php echo $row3["product_name"];?>"<?php if($row2["product_name"]==$row3["product_name"])echo "selected = selected";?>><?php echo $row3["product_name"];?></option>
      <?php endwhile?>
    </select></p>
    </div>
    <div>
      <label for="quantity" class="edit_label">Quantity:</label>
      <input type="text"  value = <?php echo $row["quantity"]; ?>  name="quantity" id="quantity">
    </div>
    <div class="edit_button">
      <input type="submit" id="submit" value="Submit" />
  	  <input type="reset"  id="cancel" value="Cancel" />
    </div>
  </fieldset>
  </form>
</body>

</html>


<?php

require_once("includes/footer.php"); ?>
