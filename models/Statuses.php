<?php

class Statuses
{
    //DB Stuff
    private $conn;


    public function __construct($db)
    {
        $this->conn = $db;
    }


    public function getUserByUserId($UserId)
    {
        $query = "SELECT * FROM statuses WHERE UserId =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($UserId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    public function getById($StatusId)
    {
        $query = "SELECT * FROM statuses WHERE StatusId =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($StatusId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getAllActive()
    {
        $query = "SELECT * FROM statuses WHERE IsActive =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array(1));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function add(
        $StatusId,
        $StatusCode,
        $Description,
        $CreateUserId,
        $ModifyUserId,
        $IsActive,
        $Type
    ) {

        $query = "INSERT INTO  statuses(        
        StatusId,
        StatusCode,
        Description,
        CreateUserId,
        ModifyUserId,
        IsActive,
        Type
            ) 
                        VALUES (?,?,?,?,?,?,?)";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $StatusId,
                $StatusCode,
                $Description,
                $CreateUserId,
                $ModifyUserId,
                $IsActive,
                $Type
            ))) {
                return $this->getById($StatusId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
    public function Updatestatuses(
        $statusesId,
        $UserId,
        $statusesLine1,
        $statusesLine2,
        $statusesLine3,
        $City,
        $PostalCode,
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {

        $query = "UPDATE  statuses      
           SET 
           UserId = ?,
           statusesLine1 = ?,
           statusesLine2 = ?,
           statusesLine3 = ?,
           City = ?,
           PostalCode = ?,
           CrateUserId = ?,
            ModifyDate = now(),
            ModifyUserId = ?,
            StatusId = ?
            WHERE 
            statusesId = ?
            ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $UserId,
                $statusesLine1,
                $statusesLine2,
                $statusesLine3,
                $City,
                $PostalCode,
                $CrateUserId,
                $ModifyUserId,
                $StatusId,
                $statusesId
            ))) {
                return $this->getById($statusesId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
}
