<?php

/*
	Developer: Lance Pendergrass
	File: dbHandler.php
	Desc: PHP mySQL database hanndler.
	Makes use of newer PHP Data Objects (PDOs)
*/


// Database Constants (to be relocated)
define("DB_SERVER", "localhost");
define("DB_USER", "mapuser");
define("DB_PASS", "MinerMapper15!");
define("DB_NAME", "campus_map");

// Set JSON MIME Type
header("Content-type: application/json");

// Create PDO Data Source Name
$dsn = 'mysql:host=' . DB_SERVER . ';dbname=' . DB_Name;

// Create DB Connection
try { $db = new PDO($dsn, $username, $password); }
catch(PDOException $e) { die('DB Connection Failed:' . $e); }

// For sanitizing input
function cleanInput( $data ) {
	$data = stripslashes($data);
	$data = real_escape_string($data);
	$data = htmlspecialchars($data);
	return $data;
}


/* QUERY DEFINITIONS */

// get BuildingID by Name
function getBuildingID() {

	$query = 'SELECT id FROM buildings WHERE name = :buildingName';

	if( isSet( $_GET['buildingName'] ) ) {

		$buildingName = cleanInput( $_GET['buildingName'] );
	
		$stmt = $db->prepare( $query );
		$stmt->bindParam(':buildingName', $buildingName, PDO::PARAM_STR);
	
		$stmt->execute();
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
	
	return json_encode( $results );
}


// get all coordinates for a building, by name
function getBuildingCoords() {

	$query = 'SELECT latitude, longitude FROM coordinates WHERE buildingID IN '
		. '( SELECT id FROM buildings WHERE name = :buildingName)';

	if( isSet( $_GET['buildingName'] ) ) {

		$buildingName = cleanInput( $_GET['buildingName'] );
	
		$stmt = $db->prepare( $query );
		$stmt->bindParam(':buildingName', $buildingName, PDO::PARAM_STR);
	
		$stmt->execute();
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
	
	return json_encode( $results );
}


/* MAIN ENTRY LOGIC */

// Determine which query to invoke
if( isset( $_GET['function'] ) ) {

	$function = cleanInput( $_GET['function'] );

    if( $function == 'getBuildingID' )
		return getBuildingID();
		
    elseif($function == 'getBuildingCoords')
		return getBuildingCoords();
		
	//elseif...other query request
}


// Close DB Connection
$db = null;

?>