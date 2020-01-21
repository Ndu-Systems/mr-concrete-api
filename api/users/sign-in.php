<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';

$data = json_decode(file_get_contents("php://input"));

$Email = $data->email;
$Password = $data->password; 

$database = new Database();
$db = $database->connect();

$user = new Users($db);

$result = $user->getUserByEmailAndPassword($Email,$Password);

echo json_encode($result);