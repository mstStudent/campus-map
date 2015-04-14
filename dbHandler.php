<?php

	// Lance Pendergrass
	// mySQL Database Handler

	// Database Constants
	define("DB_SERVER", "localhost");
	define("DB_USER", "mapuser");
	define("DB_PASS", "MinerMapper15!");
	define("DB_NAME", "campus_map");

	// Database Handler Class
	class mySQLDatabase {

		// Attributes
		private $connection;

		// Constructor
		function __construct() {
			$this->openConnection();
		}

		// METHOD DEFINITIONS

		// Create mySQL Connection
		public function openConnection() {

			$this->connection = mysqli_connect( DB_SERVER, DB_USER, DB_PASS, DB_NAME )
				OR die( "Database connection failed: " . mysqli_connect_error() );

			// Set the encoding
			mysqli_set_charset( $this->connection, 'utf8' );
		}

		
		// get BuildingID by Name
		getBuildingID( $buildingName ) {
		
			$query = "select ID from buildings where name = '" . $buildingName . "';";
			return $this->queryDB( $query );
		}
		
		// get all coordinates for a building, by name
		getBuildingCoords( $buildingName ) {
		
			$query = "select latitude, longitude from coordinates where buildingID in "
			. "( select id from buildings where name = '" . $buildingName . "' );";
		
			return $this->queryDB( $query );
		}
		
		// Query Database
		private function queryDB( $sqlQuery ) {

			// Perform Query
			$result = mysqli_query( $this->connection, $sqlQuery );

			// If msqli_query object is desired...
			#return $result;

			// If JSON is desired...
			return $this->result2JSON( $result );
		}

		// Convert result resource into JSON
		private function result2JSON( $result ) {
			
			$array = array();

			// Convert result object to array
			while( $row = mysqli_fetch_object( $result ) )
				$array[] = $row;

			// Convert array to json, return
			return json_encode( $array );
		}

		// Close Connection
		public function closeConnection() {

			if( isset( $this->connection ) ) {
				mysqli_close( $this->connection );
				unset( $this->connection );
			}
		}


	}

	// Instantiate Database Handler
	$database = new mySQLDatabase();
?>
