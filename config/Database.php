<?php
include_once 'Headers.php';
include_once '../../common/common.php';

class Database
{
    private $isLocal = true;
    public function connect()
    {
        $conn = null;

        try {
            if ($this->isLocal) {
                $conn = new PDO('mysql:host=localhost;dbname=mrconcretedb', 'root', '');
            } else {
                 $conn = new PDO('mysql:host=127.0.0.1;dbname=ivpiqxtq_mrconcretedb', 'ivpiqxtq_sysadmin', 'ivpiqxtq_sysadmin');  
            }

            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo json_encode($e->getMessage());
        }

        return $conn;
    }

    public function getGuid($conn)
    {
        $stmt = $conn->prepare("SELECT uuid() as ID from dual");
        $stmt->execute(array());

        if ($stmt->rowCount()) {
            $uuid = $stmt->fetch(PDO::FETCH_ASSOC);
            return $uuid['ID'];
        }
    }
}
