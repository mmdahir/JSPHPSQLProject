<?php
    ini_set('display_errors', '1');
    error_reporting(E_ALL);
    // Connect to the Database
    $dsn = 'mysql:host=cssgate.insttech.washington.edu;dbname=mmdahir';
    $username = 'mmdahir';
    $password = 'PydGeu';
      
    $gymUser = $_GET['username'];  
    $address1 = $_GET['address1'];
    $city = $_GET['city'];
    $state = $_GET['state'];
    $zip = $_GET['zip'];
    
    try {
        $db = new PDO($dsn, $username, $password);
        
        $insert_sql = "INSERT INTO Address (Address1, City, State, Zip) VALUES ('".$address1."', '".$city."', '".$state."', ".$zip.")";
        $user_query = $db->query($insert_sql);
        $query = $user_query->fetchAll(PDO::FETCH_ASSOC);
        
        $insert_sql2 = "UPDATE GymUser SET AddressID = (SELECT AddressID FROM Address WHERE Address1 = '".$address1."') WHERE Username='".$gymUser."'";
        $user_query2 = $db->query($insert_sql2);
        $address = $user_query2->fetchAll(PDO::FETCH_ASSOC);
        echo 'success';
        
        $db = null;
        
    }
    catch (PDOException $e) {
        $error_message = $e->getMessage();
        echo 'There was an error connecting to the database.';
        echo $error_message;
        exit();
    }
?>