<?php
function getGuid($conn)
{
    $stmt = $conn->prepare("SELECT uuid() as ID from dual");
    $stmt->execute(array());

    if ($stmt->rowCount()) {
        $uuid = $stmt->fetch(PDO::FETCH_ASSOC);
        return $uuid['Id'];
    }
}
