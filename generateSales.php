<?php
require_once("action/dp_connect.php");
require_once("includes/header.php");
$begin = new DateTime('2018-01-01');
$end = new DateTime('2018-10-17');
$interval = DateInterval::createFromDateString('1 day');
$period = new DatePeriod($begin, $interval, $end);
$names = array('Sam William','Michael Smith','James Johnson');
$payment_types = array('Credit Card','Cash','Eftpos');
foreach ($period as $dt) 
{
  $num_sales = rand(2,4);
  for($i = 0; $i < $num_sales; $i++)
  {
    $name = $names[rand(0,2)];
    $date = $dt->format('Y-m-d');
    $product_id = rand(1000001,1000010);
    $quantity = rand(1,5);
    $payment_type = $payment_types[rand(0,2)];
    $payment_status = 'Completed';
    $product_price=  $connect->query("SELECT* FROM `product` WHERE `product_id` = '$product_id'");
    $row = $product_price->fetch_assoc();
    echo $date;
    $total = (float)$row["price"] * $quantity;
    $query = "INSERT INTO `sale` (`sale_id`, `sale_date`, `sale_name`, `quantity`, `discount`, `payment_type`, `payment_status`, `total`, `product_id`) VALUES (NULL, '$date', '$name', '$quantity', '', '$payment_type', '$payment_status', '$total', '$product_id')";
    mysqli_query($connect, $query);
  }
  }

?>

<?php

require_once("includes/footer.php"); ?>
