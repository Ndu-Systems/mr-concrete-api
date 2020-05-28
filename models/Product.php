<?php


class Product
{
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function add(
        $ProductId,
        $UserId,
        $ProductName,
        $ShortDescription,
        $Description,
        $ProductCode,
        $Price,
        $Quantity,
        $Units,
        $CategoryId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
        INSERT INTO product(
            ProductId,
            UserId,
            ProductName,
            ShortDescription,
            Description,
            ProductCode,
            Price,
            Quantity,
            Units,
            CategoryId,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $ProductId,
                $UserId,
                $ProductName,
                $ShortDescription,
                $Description,
                $ProductCode,
                $Price,
                $Quantity,
                $Units,
                $CategoryId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($ProductId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function update(
        $ProductId,
        $UserId,
        $ProductName,
        $ShortDescription,
        $Description,
        $ProductCode,
        $Price,
        $Quantity,
        $Units,
        $CategoryId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
                    product
                        SET
                        UserId =  ? ,
                        ProductName =  ? ,
                        ShortDescription=?,
                        Description=?,
                        ProductCode =  ? ,
                        Price =  ? ,
                        Quantity =  ? ,
                        Units =  ? ,
                        CategoryId =  ? ,
                        CreateUserId =  ? ,
                        ModifyUserId =  ? ,
                        StatusId=  ?,
                        ModifyDate = NOW()
                        WHERE
                        ProductId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $UserId,
                $ProductName,
                $ShortDescription,
                $Description,
                $ProductCode,
                $Price,
                $Quantity,
                $Units,
                $CategoryId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $ProductId


            ))) {
                return $this->getById($ProductId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($ProductId)
    {
        $query = "SELECT * FROM product WHERE ProductId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($ProductId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    public function getByUserId($UserId)
    {
        $query = "SELECT * FROM product WHERE UserId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($UserId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}
