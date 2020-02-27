<?php
include_once '../../config/Database.php';
include_once '../../models/Concreteorder.php';

$data = json_decode(file_get_contents("php://input"));

$database = new Database();
$db = $database->connect();

$concreteorder = new Concreteorder($db);
$result = $concreteorder->getOrderCounters();

echo json_encode($result);
