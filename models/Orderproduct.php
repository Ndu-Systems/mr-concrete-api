<?php


class Orderproduct
{
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function add(
        $OrderProductId,
        $OrderId,
        $ProductId,
        $ProductName,
        $Price,
        $Quantity,
        $Units,
        $CrateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
        INSERT INTO orderproduct(
            OrderProductId,
            OrderId,
            ProductId,
            ProductName,
            Price,
            Quantity,
            Units,
            CrateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $OrderProductId,
                $OrderId,
                $ProductId,
                $ProductName,
                $Price,
                $Quantity,
                $Units,
                $CrateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($OrderProductId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function update(
        $OrderProductId,
        $OrderId,
        $ProductId,
        $ProductName,
        $Price,
        $Quantity,
        $Units,
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
                    orderproduct
                        SET
                            OrderProductId  = ? ,
                            OrderId  = ? ,
                            ProductId  = ? ,
                            ProductName  = ? ,
                            Price  = ? ,
                            Quantity  = ? ,
                            Units  = ? ,
                            CrateUserId  = ? ,
                            ModifyUserId  = ? ,
                            StatusId = ? 
                        ModifyDate = NOW()
                        WHERE
                        OrderProductId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $OrderId,
                $ProductId,
                $ProductName,
                $Price,
                $Quantity,
                $Units,
                $CrateUserId,
                $ModifyUserId,
                $StatusId,
                $OrderProductId


            ))) {
                return $this->getById($OrderProductId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($OrderProductId)
    {
        $query = "SELECT * FROM orderproduct WHERE OrderProductId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderProductId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getByOrderId($OrderId)
    {
        $query = "SELECT * FROM orderproduct WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}
