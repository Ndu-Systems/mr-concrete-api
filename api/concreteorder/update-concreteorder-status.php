<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';
include_once '../../models/Concreteordermeasurement.php';

$data = json_decode(file_get_contents("php://input"));

$ProjectCode = $data->OrderId;
$ModifyUserId = $data->ModifyUserId;
$StatusId = $data->StatusId;

//connect to db
$database = new Database();
$db = $database->connect();

$concreteorder = new Concreteorder($db);
