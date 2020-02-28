<?php
include_once '../../config/Database.php';
include_once '../../models/Counter.php';

$data = json_decode(file_get_contents("php://input"));

$database = new Database();

$db = $database->connect();

$counter = new Counter($db);
$result = $counter->getSummaryCounts();

echo json_encode($result);