<?php
    ini_set('display_errors', '1');
    error_reporting(E_ALL);
    // Connect to the Database
    $dsn = 'mysql:host=cssgate.insttech.washington.edu;dbname=mmdahir';
    $username = 'mmdahir';
    $password = 'PydGeu';
      
    $gymUser = $_GET['username'];
    
    try {
        $db = new PDO($dsn, $username, $password);

        $insert_sql = "SELECT * FROM Address WHERE AddressID = (SELECT AddressID FROM GymUser WHERE Username='".$gymUser."')";
        $user_query = $db->query($insert_sql);
        $address = $user_query->fetchAll(PDO::FETCH_ASSOC);
        
        if ($address) {
            echo json_encode($address);
        } else {
            echo 'no address saved';
        }
        
        $db = null;
        
    }
    catch (PDOException $e) {
        $error_message = $e->getMessage();
        echo 'There was an error connecting to the database.';
        echo $error_message;
        exit();
    }
?>