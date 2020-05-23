<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';

$UserId = $_GET['UserId'];

//connect to db
$database = new Database();
$db = $database->connect();


// create user first to get UserId
$users = new Users($db);

$result = $users->getUserDetailedByUserId($UserId);

echo json_encode($result);

 
 


