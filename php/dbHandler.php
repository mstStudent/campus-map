<?php

/*
	Developer: Lance Pendergrass
	File: dbHandler.php
	Version: 1.3.3
	Desc: PHP mySQL database hanndler.
	Makes use of newer PHP Data Objects (PDOs)
*/

// http://127.0.0.1/dbHandler.php?function=getBuildingCoords&buildingName=Rolla+Building
$debug = true;
if( $debug ) print_r($_GET);

// Database Constants (to be relocated)
define("DB_SERVER", "localhost");
define("DB_USER", "mapuser");
define("DB_PASS", "MinerMapper15!");
define("DB_NAME", "campus_map");

// Set JSON MIME Type
header("Content-type: application/json");

// Create PDO Data Source Name
$dsn = 'mysql:host=' . DB_SERVER . ';dbname=' . DB_NAME;

// Create DB Connection
try { $db = new PDO($dsn, DB_USER, DB_PASS); }
catch(PDOException $e) { die('DB Connection Failed:' . $e); }

// For sanitizing input
function cleanInput( $data ) {
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}


/* QUERY DEFINITIONS */

// get BuildingID by Name
function getBuildingID() {
	global $db;
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

function getAllBuildings(){
  global $db;

  $query_building = 'SELECT ID, name FROM buildings';
  $buildings = $db->prepare( $query_building );
  $buildings->execute();
  $buildings_results = $buildings->fetchAll(PDO::FETCH_ASSOC);
  
  return $buildings_results;
}


/*
                        geometry: {
                            coordinates: [latlng],
                            type: "Polygon"
                        },
                        id: feature.name,
                        properties: {
                            color: "grey",
                            level: 0
                        },
                        type: "Feature"
*/

// get all coordinates for a building, by name
function getBuildingCoords() {
  global $db;
	$buildings = getAllBuildings();
  
  $buildArray = [];  
    
   foreach ($buildings as $building){
     $object = new stdClass();
     $object->bname = $building['name'];
     $object->rooms = [];
     $queryAllRoomsInBuilding = 'SELECT roomID FROM coordinates WHERE buildingID = \''; //:bname';
     //var_dump($queryAllRoomsInBuilding);
     $queryAllRoomsInBuilding .= (string)$building['ID'];
     $queryAllRoomsInBuilding .= '\'';
     
     $allRoomInBuildings = $db->prepare( $queryAllRoomsInBuilding );

     $allRoomInBuildings->execute();
     $roomResults = $allRoomInBuildings->fetchAll(PDO::FETCH_ASSOC);
     
     //var_dump($roomResults);
     foreach ($roomResults as $room){
       $rooms = new stdClass();
       $rooms->roomName = $room['roomID'];
       
       $query_latlng = 'SELECT latitude, longitude, pointOrder FROM coordinates WHERE roomID = \'';
       $query_latlng .= (string)$room['roomID'];
       $query_latlng .= '\' Group by roomID, pointOrder';
       
       $latlng = $db->prepare( $query_latlng );
       $latlng->execute();
       $latlng_results = $latlng->fetchAll(PDO::FETCH_ASSOC);
       
       $rooms->coordinates = $latlng_results;
       
       $myArray[] = $rooms;
       
       array_push($object->rooms,$rooms);
     }
     
     //$object->roomlist = $roomResults;
    // 


    array_push($buildArray,$object);
   }
   foreach ($buildArray as $element){
     var_dump($element);
     print_r (json_encode($element));
   }
 // print $object->property;
  //}else{echo mysql_error();}
  
  /*
  if($buildings->execute()){
      while($row = mysqli_fetch_array($buildings->execute())) {
        echo $row;
      }
  }else{echo mysql_error();}
  
  /*
  
	
  $stmt = $db->prepare( $query );
	//$stmt->bindParam(':buildingName', $buildingName, PDO::PARAM_STR);
	
	$stmt->execute();
	$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	array_multisort($results);
	//return json_encode( $results );
  print json_encode( $results );
  
  */
}

// get roomID by room name
function getRoomID() {
	global $db;
	
	$query = 'SELECT rooms.ID FROM rooms, buildings WHERE '
	. 'rooms.buildingID = buildings.ID AND buildings.name = '
	. ':buildingName AND rooms.number = :roomNumber';
	
	if( isSet( $_GET['buildingName'] ) and isSet( $_GET['roomNumber'] ) ) {
		$buildingName = cleanInput( $_GET['buildingName'] );
		$roomNumber = cleanInput( $_GET['roomNumber'] );
		
		$stmt = $db->prepare( $query );
		$stmt->bindParam(':buildingName', $buildingName, PDO::PARAM_STR);
		$stmt->bindParam(':roomNumber', $roomNumber, PDO::PARAM_STR);
		
		$stmt->execute();
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
	
	return json_encode( $results );
}

// get all events associated with room ID
function getRoomEvents() {
	global $db;
	
	$query = 'SELECT * FROM events WHERE room = :roomID';
	
	if( isSet( $_GET['roomID'] ) ) {
		$roomID = cleanInput( $_GET['roomID'] );
		
		$stmt = $db->prepare( $query );
		$stmt->bindParam(':roomID', $roomID, PDO::PARAM_STR);
		
		$stmt->execute();
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
	
	return json_encode( $results );
}

// get event by name
function getEvent() {
	global $db;
	
	$query = 'SELECT * FROM events WHERE name LIKE :eventName';
	
	if( isSet( $_GET['eventName'] ) ) {
		$eventName = cleanInput( $_GET['eventName'] );
		
		$stmt = $db->prepare( $query );
		$stmt->bindParam(':eventName', $eventName, PDO::PARAM_STR);
		
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
		print getBuildingID();
		
	elseif($function == 'getBuildingCoords')
		//print 
	  getBuildingCoords();
	elseif($function == 'getRoomID')
		print getRoomID();
		
	elseif($function == 'getRoomEvents')
		print getRoomEvents();
		
	elseif($function == 'getEvent')
		print getEvent();

	//elseif...other query request
}

// Close DB Connection
$db = null;

?>
