<?php
    ini_set('display_errors', '1');
    error_reporting(E_ALL);
    // Connect to the Database
    $dsn = 'mysql:host=cssgate.insttech.washington.edu;dbname=mmdahir';
    $username = 'mmdahir';
    $password = 'PydGeu';
    
    $addUser = $_GET['username'];
    $addPass = $_GET['password'];
    $addLName = $_GET['lastname'];
    $addFName = $_GET['firstname'];
    $type = $_GET['type'];
    
    try {
        $db = new PDO($dsn, $username, $password);
        
        $select_sql = "SELECT Username FROM Account WHERE Username='".$addUser."'";
        $user_query = $db->query($select_sql);
        $users = $user_query->fetchAll(PDO::FETCH_ASSOC);
        if ($users) {
            echo 'user already exists';
        } else {
            $insert_sql = "INSERT INTO Account (Username, Password) VALUES ('".$addUser."', '".$addPass."')";
            $user_query = $db->query($insert_sql);
            $select_sql = "SELECT Username FROM Account WHERE Username='".$addUser."'";
            $user_query = $db->query($select_sql);
            $users1 = $user_query->fetchAll(PDO::FETCH_ASSOC);
            if ($users1) {
                echo 'register successful';
                if ($type == 0) {
                     $insert_sql = "INSERT INTO GymUser (Username, LastName, FirstName) VALUES ('".$addUser."', '".$addLName."', '".$addFName."')";
                    $user_query = $db->query($insert_sql);

                } else if ($type == 1) {
                     $insert_sql = "INSERT INTO PersonalTrainer (Username, LastName, FirstName) VALUES ('".$addUser."', '".$addLName."', '".$addFName."')";
                     $user_query = $db->query($insert_sql);
                }
            }
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