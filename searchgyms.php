<?php
    ini_set('display_errors', '1');
    error_reporting(E_ALL);
    // Connect to the Database
    $dsn = 'mysql:host=cssgate.insttech.washington.edu;dbname=mmdahir';
    $username = 'mmdahir';
    $password = 'PydGeu';
    
    $gymName = $_GET['name'];
    
    try {
        $db = new PDO($dsn, $username, $password);
        
        $select_sql = "SELECT * FROM Gym WHERE GymName='".$gymName."'";
        $user_query = $db->query($select_sql);
        $gyms = $user_query->fetchAll(PDO::FETCH_ASSOC);
        if ($gyms) {
            echo $gyms;
        } else {
            echo 'invalid';
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