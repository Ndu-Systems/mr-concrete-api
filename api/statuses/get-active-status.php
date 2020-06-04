<?php
include_once '../../config/Database.php';
include_once '../../models/Statuses.php';

$database = new Database();
$db = $database->connect();

$statuses = new Statuses($db);
$StatusId = $database->getGuid($db);
$result = $statuses->getAllActive();

echo json_encode($result);
