<?php
class Concreteorder
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
       $UserId,
       $ProjectCode,
       $OrderNumber,
       $SupplierId,
       $OrderDate,
       $DeliveryDate,
       $TruckArrivalTime,
       $Directions,
       $SpecialInstructions,
       $CategoryId,
       $CreateUserId,
       $ModifyUserId,
       $StatusId

    ) {


        $query = "
        INSERT INTO concreteorder(
            OrderId,
            UserId,
            ProjectCode,
            OrderNumber,
            SupplierId,
            OrderDate,
            DeliveryDate,
            TruckArrivalTime,
            Directions,
            SpecialInstructions,
            CategoryId,
            CreateUserId,
            ModifyUserId,
            StatusId
        )
        VALUES(
        ?,?,?,?,?,?,?,?,?,?,?,?,?,?
         )
";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $OrderId,
                $UserId,
                $ProjectCode,
                $OrderNumber,
                $SupplierId,
                $OrderDate,
                $DeliveryDate,
                $TruckArrivalTime,
                $Directions,
                $SpecialInstructions,
                $CategoryId,
                $CreateUserId,
                $ModifyUserId,
                $StatusId
            ))) {
                return $this->getById($OrderId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }




    public function updateconcreteorder(
        $ConcreteorderId,
        $CompanyId,
        $Name,
        $CreateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
        concreteorder
    SET
        CompanyId = ?,
        Name = ?,
        CreateUserId = ?,
        ModifyUserId = ?,
        StatusId = ?,
        ModifyDate = NOW()
        WHERE
        ConcreteorderId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(               
                $CompanyId,
                $Name,
                $CreateUserId,
                $ModifyUserId,
                $StatusId,
                $ConcreteorderId

            ))) {
                return $this->getById($ConcreteorderId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function getById($OrderId)
    {
        $query = "SELECT * FROM concreteorder WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getCampanyById($CompanyId)
    {
        $query = "SELECT
      *
        FROM
            concreteorder WHERE 1";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());

        if ($stmt->rowCount()) {
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}
