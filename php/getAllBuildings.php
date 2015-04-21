<?php
  require("basicFunctions.php");
  $query = "select name from buildings;";
  echo queryDB($query);
?>