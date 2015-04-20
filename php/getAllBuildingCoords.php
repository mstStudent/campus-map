<?php

  require("basicFunctions.php");

   
#  $buildingName = $_GET['bName'];
$query = "select latitude, longitude from coordinates where buildingID in "
			. "( select id from buildings where name = '" . $buildingName . "' );";
  echo queryDB($query);
?>