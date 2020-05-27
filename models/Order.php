<?php

include_once 'Orderproduct.php';

class Order
{
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function add(
        $OrderId,
        $CustomerId,
        $SupplierId,
        $Total,
        $DeliveryDate,
        $CrateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
        INSERT INTO order(
            OrderId,
            CustomerId,
            SupplierId,
            Total,
            DeliveryDate,
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
                $OrderId,
                $CustomerId,
                $SupplierId,
                $Total,
                $DeliveryDate,
                $CrateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($OrderId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function update(
        $OrderId,
        $CustomerId,
        $SupplierId,
        $Total,
        $DeliveryDate,
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
                    order
                        SET
                        OrderId =  ? ,
                        CustomerId =  ? ,
                        SupplierId =  ? ,
                        Total =  ? ,
                        DeliveryDate =  ? ,
                        CrateUserId =  ? ,
                        ModifyUserId =  ? ,
                        StatusId =  ? ,
                        ModifyDate = NOW()
                        WHERE
                        orderId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CustomerId,
                $SupplierId,
                $Total,
                $DeliveryDate,
                $CrateUserId,
                $ModifyUserId,
                $StatusId,
                $OrderId


            ))) {
                return $this->getById($OrderId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($OrderId)
    {
        $query = "SELECT * FROM order WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    
    public function getBySupplierId($SupplierId)
    {
        $query = "SELECT * FROM order WHERE SupplierId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($SupplierId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getByCustomerId($CustomerId)
    {
        $query = "SELECT * FROM order WHERE CustomerId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CustomerId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
}
