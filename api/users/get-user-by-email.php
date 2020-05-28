<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';
$data = json_decode(file_get_contents("php://input"));

$Email = $data->Email;

//connect to db
$database = new Database();
$db = $database->connect();


// create user first to get UserId
$users = new Users($db);

$result = $users->getUserByEmail($Email);
$result['Password'] = null;
echo json_encode($result);

 
 
