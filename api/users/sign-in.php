<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';

$data = json_decode(file_get_contents("php://input"));

$Email = $data->Email;
$Password = $data->Password; 

$database = new Database();
$db = $database->connect();

$user = new Users($db);

$result = $user->getUserByEmailAndPassword($Email,$Password);
$result['Password'] = null;

echo json_encode($result);