<?php

class Order_options
{
    //DB Stuff
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    //Add user
    public function add(
        $OrderId,
        $ProductId,
        $OrderProductId,
        $OptionId,
        $ValueId,
        $OptionValue,
        $OptionName,
        $ValuePrice,
        $ValueIdQty,
        $CompanyId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
        INSERT INTO order_options(
            OrderId,
            ProductId,
            OrderProductId,
            OptionId,
            ValueId,
            OptionValue,
            OptionName,
            ValuePrice,
            ValueIdQty,
            CompanyId,
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
                $OrderId,
                $ProductId,
                $OrderProductId,
                $OptionId,
                $ValueId,
                $OptionValue,
                $OptionName,
                $ValuePrice,
                $ValueIdQty,
                $CompanyId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                $Id = $this->conn->lastInsertId();
                return $this->getById($Id);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function updateOrder_options(
        $Id,
        $OrderId,
        $ProductId,
        $OrderProductId,
        $OptionId,
        $ValueId,
        $OptionValue,
        $OptionName,
        $ValuePrice,
        $ValueIdQty,
        $CompanyId,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        order_options
    SET
        OrderId =  ? ,
        ProductId =  ? ,
        OrderProductId =  ? ,
        OptionId =  ? ,
        ValueId =  ? ,
        OptionValue =  ? ,
        OptionName =  ? ,
        ValuePrice =  ? ,
        ValueIdQty =  ? ,
        CompanyId =  ? ,
        CreateDate =  ? ,
        CreateUserId =  ? ,
        ModifyDate =  ? ,
        ModifyUserId =  ? ,
        StatusId = ?
    WHERE
    Id = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $OrderId,
                $ProductId,
                $OrderProductId,
                $OptionId,
                $ValueId,
                $OptionValue,
                $OptionName,
                $ValuePrice,
                $ValueIdQty,
                $CompanyId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $Id


            ))) {
                return $this->getById($Id);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($Id)
    {
        $query = "SELECT * FROM order_options WHERE Id =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($Id));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }


    public function getByOrderId($OrderId)
    {
        $query = "SELECT * FROM order_options WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function getByOrderProductId($OrderProductId)
    {
        $query = "SELECT * FROM order_options WHERE OrderProductId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderProductId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}
