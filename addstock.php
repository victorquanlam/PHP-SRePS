<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$sql = "SELECT * FROM `product`";
$result = $connect->query($sql);
?>
<!--put your content hereeeeeeeeeeeeeee-->
<html>
<head>
</head>

<body>
  <h2><span></span>Add Stock</h2>
  <hr/>
  <form method="post" action="stock.php">
    <fieldset>
    <div>
    <label for="product_name">Product Name:</label>
    <select name="product_name" id="product_name">
      <?php while($row = mysqli_fetch_array($result)):;?>
      <option value = "<?php echo $row["product_name"];?>"><?php echo $row["product_name"];?></option>
      <?php endwhile?>
    </select></p>
    </div>
    <div>
      <label for="quantity">Quantity:</label>
      <input type="text"  name="quantity" id="quantity">
    </div>
    <div class="edit_button">
      <input type="submit" id="submit" value="Submit" />
  	  <input type="reset"   id="cancel" value="Cancel" />
      <input type="hidden" name="page_form" value="add">
    </div>
  </fieldset>
  </form>
</body>
</html>
<?php

require_once("includes/footer.php"); ?>
