<?php


class Productproperty
{
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function add(
        $ProductpropertyId,
        $ProductId,
        $Name,
        $Code,
        $Type,
        $Value,
        $Cost,
        $Units,
        $CrateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
        INSERT INTO productproperty(
            ProductpropertyId,
            ProductId,
            Name,
            Code,
            Type,
            Value,
            Cost,
            Units,
            CrateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $ProductpropertyId,
                $ProductId,
                $Name,
                $Code,
                $Type,
                $Value,
                $Cost,
                $Units,
                $CrateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($ProductpropertyId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function update(
        $ProductpropertyId,
        $ProductId,
        $Name,
        $Code,
        $Value,
        $Units,
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
                    productproperty
                        SET
                        ProductId =  ? ,
                        Name =  ? ,
                        Code =  ? ,
                        Value =  ? ,
                        Units =  ? ,
                        CrateUserId =  ? ,
                        ModifyUserId =  ? ,
                        StatusId =  ?,
                        ModifyDate = NOW()
                        WHERE
                        ProductpropertyId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $ProductId,
                $Name,
                $Code,
                $Value,
                $Units,
                $CrateUserId,
                $ModifyUserId,
                $StatusId,
                $ProductpropertyId


            ))) {
                return $this->getById($ProductpropertyId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($ProductpropertyId)
    {
        $query = "SELECT * FROM productproperty WHERE ProductpropertyId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($ProductpropertyId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    public function getByProductId($ProductId)
    {
        $query = "SELECT * FROM productproperty WHERE ProductId =? and StatusId = ?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($ProductId, 1));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}
