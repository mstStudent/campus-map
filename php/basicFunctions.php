<?php

// Convert result resource into JSON
function result2JSON( $result ) {
  $array = array();
  // Convert result object to array
  while( $row = mysqli_fetch_object( $result ) )
     array_push($array,$row);
    // Convert array to json, return
	return json_encode( $array );
}

// Query Database
function queryDB( $sqlQuery ) {
  $configs = include("config.php");
  $connection = mysqli_connect( $configs['host'], $configs['username'], $configs['pass'], $configs['dbname'] );

  // Check connection
  if (mysqli_connect_errno())
  {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
  
  // Perform Query
  $result = mysqli_query( $connection, $sqlQuery );
  
  // If msqli_query object is desired...
  #return $result;

// If JSON is desired...
  return result2JSON( $result );
}
?>