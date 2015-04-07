<?php
// The credentials need to be provided in a more secure way.
$servername = "localhost";
$username = ""
$password = ""
$database = "campus_map"


$building = $_GET['bname'];
$floorCount = $_GET['fCount'];
$defFloor = $_GET['defFloor'];

$connection = new mysqli($servername,$username,$password,$database);

if ($connection->connect_error){
	die('Error: ' . $connection->connect_error);
}

// For now we have to manually increment id

$getId = "SELECT MAX(id) FROM buildings";

$id = $connection->query($getId);

if(is_null($id)){
  $id = 1;
}else{
  $id = $id + 1;
}

$sqlInsert = "INSERT INTO 'campus_map.buildings' VALUES ('{$id}', '{$building}', '{$floorCount}', '{$defFloor}')"

if (!mysqli_query($connection,$sqlInsert)){
	die('Error: ' . mysqli_error($connection));
}

?>
