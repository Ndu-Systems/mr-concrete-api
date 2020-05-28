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
        $Value,
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
            Value,
            CrateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $ProductpropertyId,
                $ProductId,
                $Name,
                $Code,
                $Value,
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
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
                    productproperty
                        SET
                        ProductpropertyId =  ? ,
                        ProductId =  ? ,
                        Name =  ? ,
                        Code =  ? ,
                        Value =  ? ,
                        CreateDate =  ? ,
                        CrateUserId =  ? ,
                        ModifyDate =  ? ,
                        ModifyUserId =  ? ,
                        StatusId =  ?
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
        $query = "SELECT * FROM productproperty WHERE ProductId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($ProductId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}
