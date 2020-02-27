<?php
include_once 'Concreteordermeasurement.php';
include_once 'Category.php';
include_once 'Supplier.php';

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
        $query = "UPDATE
        concreteorder
    SET
        UserId= ?,
        ProjectCode= ?,
        OrderNumber= ?,
        SupplierId= ?,
        OrderDate= ?,
        DeliveryDate= ?,
        TruckArrivalTime= ?,
        Directions= ?,
        SpecialInstructions= ?,
        CategoryId= ?,
        CreateUserId= ?,
        ModifyUserId= ?,
        StatusId= ?,
        ModifyDate = NOW()

        WHERE
        OrderId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
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
        $query = "SELECT * FROM concreteorder WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getUserById($UserId)
    {
        $query = "SELECT
      *
        FROM
            concreteorder WHERE UserId=? order by CreateDate desc";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($UserId));
        $detailedOrders = array();

        if ($stmt->rowCount()) {
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($data as $item) {
                $concreteordermeasurement = new Concreteordermeasurement($this->conn);
                $category = new Category($this->conn);
                $supplier = new Supplier($this->conn);

                $item['measurements'] = $concreteordermeasurement->getByOrderId(($item['OrderId']));
                $item['category'] = $category->getById(($item['CategoryId']));
                $item['supplier'] = $supplier->getById(($item['SupplierId']));
                array_push($detailedOrders, $item);
            }
        }
        return $detailedOrders;
    }

    public function getOneById($OrderId)
    {
        $query = "SELECT
      *
        FROM
            concreteorder WHERE OrderId=?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));
        if ($stmt->rowCount()) {
            $item = $stmt->fetch(PDO::FETCH_ASSOC);

            $concreteordermeasurement = new Concreteordermeasurement($this->conn);
            $category = new Category($this->conn);
            $supplier = new Supplier($this->conn);
            $item['measurements'] = $concreteordermeasurement->getByOrderId(($item['OrderId']));
            $item['category'] = $category->getById(($item['CategoryId']));
            $item['supplier'] = $supplier->getById(($item['SupplierId']));
            return  $item;
        }
        return null;
    }

    public function getOrdersForSupplier($SupplierId)
    {
        $query = "SELECT * FROM `concreteorder` WHERE SupplierId= ? order by CreateDate desc";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($SupplierId));

        $detailedOrders = array();
        if ($stmt->rowCount()) {

            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($data as $item) {

                $concreteordermeasurement = new Concreteordermeasurement($this->conn); 
                $category = new Category($this->conn);
                $supplier = new Supplier($this->conn);

                $item['measurements'] = $concreteordermeasurement->getByOrderId(($item['OrderId']));
                $item['category'] = $category->getById(($item['CategoryId']));
                $item['supplier'] = $supplier->getById(($item['SupplierId']));

                array_push($detailedOrders, $item);

            }            
        }

        return  $detailedOrders;
    }

    public function getOrderCounters()
    {
        $allCounters = array();
        $item["pending"] =  $this->getCount(1);
        $item["inProgress"] =  $this->getCount(3);
        $item["completed"] =  $this->getCount(5);
        $item["cancelled"] =  $this->getCount(6); 
        return $item;
     }

    public function getCount($StatusId)
    {
       $query = "SELECT COUNT(o.OrderId) As Count FROM concreteorder o WHERE o.StatusId = ?";
       $stmt = $this->conn->prepare($query);
       $stmt->execute(array($StatusId));
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
