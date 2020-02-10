<?php

class Roles
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function getRoles(
        $StatusId
    ) {
        $query = "SELECT * FROM role WHERE StatusId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($StatusId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function getByRoleName($RoleName)
    {
        $query = "SELECT * FROM role WHERE RoleName =?";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($RoleName));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getRoleById($Id)
    {
        $query = "SELECT * FROM role WHERE Id =?";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($Id));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function AddRole(
        $RoleName,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {

        if ($this->getByRoleName($RoleName) > 0) {
            return "role name already exists";
        }
        $query = "INSERT INTO  role 
       ( 
         RoleName ,     
         CreateUserId , 
         ModifyUserId ,  
         StatusId ) 
         VALUES (?,?,?,?)";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $RoleName,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getByRoleName($RoleName);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
}
