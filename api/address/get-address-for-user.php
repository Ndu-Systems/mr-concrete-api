<?php
include_once '../../config/Database.php';
include_once '../../models/Address.php';

$data = json_decode(file_get_contents("php://input"));
$UserId= $data->UserId;

//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$address = new Address($db);

$result = $address->getAddressByUserId($UserId);

echo json_encode($result);