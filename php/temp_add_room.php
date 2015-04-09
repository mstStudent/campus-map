<?php
// The credentials need to be provided in a more secure way.
$servername = "localhost";
$username = ""
$password = ""
$database = "campus_map"

$roomNumber = $_GET['roomNumber'];
$building = $_GET['bname'];
$floor = $_GET['floor'];
$latlngs = $_GET['latlngs'];

$connection = new mysqli($servername,$username,$password,$database);

if ($connection->connect_error){
	die('Error: ' . $connection->connect_error);
}

// ADDING INTO ROOMS

// For now we have to manually increment id

// NOT SURE IF THIS IS QUITE RIGHT BUT WILL SEE SOON.
$getId = "SELECT MAX(id) FROM rooms";
$id = $connection->query($getId);
//$id = $id->fetch_assoc();

if(is_null($id)){
  $id = 1;
}else{
  $id = $id + 1;
}

$sqlInsert = "INSERT INTO 'campus_map.rooms' VALUES ('{$id}', '{$roomNumber}', '{$building}', '{$floor}')";

if($connection->query($sqlInsert) === TRUE){
  echo "Insert into rooms successfully";
}else{
    die("Instert into rooms failed: " . $connection->error);
}


// ADDING LAT / LNGS FOR ROOM

$getBuildingID = "SELECT id FROM 'campus_map.buildings' WHERE name = '{$building}'";
$buildingID = $connection->query($getBuildingID);
//$buildingID = $getBuildingID->fetch_assoc();

$arrayLen = count($latlngs);

for ($x = 0; $x < $arrayLen; $x++){
  $sqlInsertIntoCoordinates = "INSERT INTO 'campus_map.coordinates' VALUES ('True', 'False', '{$buildingID}', '{$id}', '{$latlngs[x][0]}', '{$latlngs[x][1]}')";

  if($connection->query($sqlInsertIntoCoordinates) === TRUE){
    echo "Insert into rooms successfully";
  }else{
    die("Instert into rooms failed: " . $connection->error);
  }
}

?>
