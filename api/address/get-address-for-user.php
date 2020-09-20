<?php
include_once '../../config/Database.php';
include_once '../../models/Address.php';

$data = json_decode(file_get_contents("php://input"));
$OtherId= $data->OtherId;

//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get OtherId
$address = new Address($db);

$result = $address->getAddressByOtherId($OtherId);

echo json_encode($result);