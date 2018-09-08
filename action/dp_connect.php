<?php
	$localhost = "127.0.0.1";
	$username = "root";
	$password ="";
	$dbname="sale_record";
//db connection
	$connect = new mysqli($localhost,$username,$password,$dbname);

	//check
	if($connect -> connect_error){
		die("".$connect -> connect_error);

	}
	
?>