<?php
include_once '../../config/Database.php';
include_once '../../models/Users.php';

$data = json_decode(file_get_contents("php://input"));

$UserId = $data->UserId;
$Password = $data->Password;
$database = new Database();
$db = $database->connect();

$users = new Users($db);
$result = $users->UpdateUserPassword(
    $UserId,
    $Password
);

echo json_encode($result);
