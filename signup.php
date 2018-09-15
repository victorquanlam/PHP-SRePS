<?php 
require_once("action/dp_connect.php");
require_once("includes/header.php");
session_start();
$errors = array();
$redirect = false;

if($_POST) {		

	
	$username = $_POST['username'];
	$password = $_POST['password'];

	if(empty($username) || empty($password)) {
		if($username == "") {
			$errors[] = "Username is required";
		} 

		if($password == "") {
			$errors[] = "Password is required";
		}
	} else {
		$sql = "INSERT INTO users (username, password) VALUES ('$username', '$password')";
		$result = $connect->query($sql);
		
		if($connect->affected_rows == 1) {
			$errors[] = "Registration completed successfully. Redirecting now...";
			$redirect = true;
			
					
		} else {	$errors[] = "Something went wrong";		}
		}
	if ($redirect == true)
	{
		header("Refresh:3; url=http://localhost/sales_system/dashboard.php");	
	}	
}
	
	
?>

<html>
<body>
	<div class="container">
		<div class="row vertical">
			<div class="col-md-9 col-md-offset-1">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Please Enter Registration Information</h3>
					</div>
					<div class="panel-body">

						<div class="messages">
							
							<?php if($errors) {
								foreach ($errors as $key => $value) {
									echo '<div class="alert alert-warning" role="alert">
									<i class="glyphicon glyphicon-exclamation-sign"></i>
									'.$value.'</div>';										
									}
								} ?>
						</div>

						<form class="form-horizontal" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" id="RegisterForm">
							<fieldset>
							
							  <div class="form-group">
									<label for="username" class="col-sm-2 control-label">Please enter a Username</label>
									<div class="col-sm-6">
									  <input type="text" class="form-control" id="username" name="username" placeholder="Username" autocomplete="off" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="password" class="col-sm-2 control-label">Please enter a Password</label>
									<div class="col-sm-6">
									  <input type="password" class="form-control" id="password" name="password" placeholder="Password" autocomplete="off" />
									</div>
								</div>	
								
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
									  <button type="submit" class="btn btn-default"> <i class="glyphicon glyphicon-log-in"></i> Register</button>
									</div>									
								</div>		
								
							</fieldset>
						</form>
					</div>
					<!-- panel-body -->
				</div>
				<!-- /panel -->
			</div>
			<!-- /col-md-4 -->
		</div>
		<!-- /row -->
	</div>
	<!-- container -->	

</body>
</html>



<?php 

require_once("includes/footer.php"); ?>

