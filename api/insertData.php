<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
	echo "Error: Unable to connected to MySQL.".PHP_EOL;
	echo "Debugging errno: ". mysqli_connect_errno().PHP_EOL;
	echo "Debugging error: ". mysqli_connect_error().PHP_EOL;

	exit();
}

if (!$link->set_charset("utf8")) {
	// code...
	print("Error loading character set utf8: %s\n", $link->error);
	exit();
}

if (isset($_GET)) {
	// code...
	if ($_GET['isAdd'] == 'true') {
		// code...
		$name = $_GET['name'];
		$email = $_GET['email'];
		$password = $_GET['password'];
		$usertype = $_GET['usertype'];
		$address = $_GET['address'];
		$contact = $_GET['contact'];
		$avatar = $_GET['avatar'];
		$lat = $_GET['lat'];
		$lng = $_GET['lng'];

		$sql = "INSERT INTO `user`(`id`, `name`, `email`, `password`, `usertype`, `address`, `contact`, `avatar`, `lat`, `lng`) VALUES (Null,'$name','$email','$password','$usertype','$address','$contact','$avatar','$lat','$lng')";

		$result = mysql_query($link, $sql);

		if ($result) {
			// code...
			echo "true";
		}else{
			echo "false";
		}
	}else echo "Welcome The Next Exotic";
}
	mysqli_close($link);
	?>