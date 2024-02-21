<?php

    $host = "localhost";
    $username = "camgirln_developer";
    $password = "8%mQt8jpzxXG";
    $database = "camgirln_blitzwin";
    
    $conn = mysqli_connect($host, $username, $password, $database);

    if(!$conn ){
        echo 'Could not connect to database ';
    }
?>