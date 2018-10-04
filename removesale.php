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
      <input type="text" type="hidden"  value = <?php echo $row["sale_id"]; ?> onfocus="this.blur()" name="sale_id" id="sale_id" readonly>
    </div>
    <input type="hidden" name="page_from" id ="page_from" value="remove">
    <P>Are you sure you want to remove this sale?</p>
    <div>
      <input type="submit" id="submit" value="Yes" />
  	  <input type="button" id="cancel" value="Cancel" onClick="document.location.href='sales.php'" />
    </div>
  </fieldset>
  </form>
</body>

</html>


<?php

require_once("includes/footer.php"); ?>
