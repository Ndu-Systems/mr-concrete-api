<?php

class Address
{
    //DB Stuff
    private $conn;


    public function __construct($db)
    {
        $this->conn = $db;
    }


    public function getAddressByOtherId($OtherId)
    {
        $query = "SELECT * FROM address WHERE OtherId =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($OtherId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    public function getAddressIdById($AddressId)
    {
        $query = "SELECT * FROM address WHERE AddressId =?";
        $stmt = $this->conn->prepare($query);

        $stmt->execute(array($AddressId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function AddAddress(
        $AddressId,
        $UserId,
        $AddressType,
        $AddressLine1,
        $AddressLine2,
        $AddressLine3,
        $City,
        $Province,
        $PostalCode,
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {

        $query = "INSERT INTO  address(        
          AddressId,
          UserId,
          AddressType,
          AddressLine1,
          AddressLine2,
          AddressLine3,
          City,
          Province,
          PostalCode,
          CrateUserId,
          ModifyUserId,
          StatusId
            ) 
                        VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $AddressId,
                $UserId,
                $AddressType,
                $AddressLine1,
                $AddressLine2,
                $AddressLine3,
                $City,
                $Province,
                $PostalCode,
                $CrateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getAddressIdById($AddressId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
    public function UpdateAddress(
        $AddressId,
        $UserId,
        $AddressType,
        $AddressLine1,
        $AddressLine2,
        $AddressLine3,
        $City,
        $Province,
        $PostalCode,
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {

        $query = "UPDATE  address      
           SET 
           UserId = ?,
           AddressType = ?,
           AddressLine1 = ?,
           AddressLine2 = ?,
           AddressLine3 = ?,
           City = ?,
           Province = ?,
           PostalCode = ?,
           CrateUserId = ?,
            ModifyDate = now(),
            ModifyUserId = ?,
            StatusId = ?
            WHERE 
            AddressId = ?
            ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $UserId,
                $AddressType,
                $AddressLine1,
                $AddressLine2,
                $AddressLine3,
                $City,
                $Province,
                $PostalCode,
                $CrateUserId,
                $ModifyUserId,
                $StatusId,
                $AddressId
            ))) {
                return $this->getAddressIdById($AddressId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }
}
