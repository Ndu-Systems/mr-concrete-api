<?php

include_once 'Orderproduct.php';
include_once 'Address.php';
include_once 'Users.php';

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
        $ProjectNumber,
        $DeliveryDate,
        $DeliveryTime,
        $DeliveryAddress,
        $SpecialInstructions,
        $Total,
        $CrateUserId,
        $ModifyUserId,
        $StatusId

    ) {

        $query = "
                INSERT INTO orders(
                    OrderId,
                    CustomerId,
                    SupplierId,
                    ProjectNumber,
                    DeliveryDate,
                    DeliveryTime,
                    DeliveryAddress,
                    SpecialInstructions,
                    Total,
                    CrateUserId,
                    ModifyUserId,
                    StatusId
                    )
                    VALUES(
                    ?,?,?,?,?,?,?,?,?,?,?,?
                    )
                ";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $OrderId,
                $CustomerId,
                $SupplierId,
                $ProjectNumber,
                $DeliveryDate,
                $DeliveryTime,
                $DeliveryAddress,
                $SpecialInstructions,
                $Total,
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
        $ProjectNumber,
        $DeliveryDate,
        $DeliveryTime,
        $DeliveryAddress,
        $SpecialInstructions,
        $Total,
        $CrateUserId,
        $ModifyUserId,
        $StatusId
    ) {
        $query = "UPDATE
                    orders
                        SET
                        CustomerId = ? ,
                        SupplierId = ? ,
                        ProjectNumber = ? ,
                        DeliveryDate = ? ,
                        DeliveryTime = ? ,
                        DeliveryAddress = ? ,
                        SpecialInstructions = ? ,
                        Total = ? ,
                        CrateUserId = ? ,
                        ModifyUserId = ? ,
                        StatusId = ? ,
                        ModifyDate = NOW()
                        WHERE
                        OrderId = ?
         ";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $CustomerId,
                $SupplierId,
                $ProjectNumber,
                $DeliveryDate,
                $DeliveryTime,
                $DeliveryAddress,
                $SpecialInstructions,
                $Total,
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
        $query = "SELECT * FROM orders WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }

    public function getBySupplierId($SupplierId)
    {
        $query = "SELECT * FROM orders WHERE SupplierId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($SupplierId));
        $orderproducts = new Orderproduct($this->conn);
        $address = new Address($this->conn);
        $users = new Users($this->conn);
        $detailedOrders = array();

        if ($stmt->rowCount()) {
            $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($orders as $order) {
                $order["Orderroducts"] =  $orderproducts->getByOrderId($order["OrderId"]);
                $order["Customer"] =  $users->getUserByUserId($order["CustomerId"]);
                $order["Address"] =  $address->getAddressIdById($order["DeliveryAddress"]);
                $order["Supplier"] =  $users->getUserByUserId($order["SupplierId"]);
                array_push($detailedOrders, $order);
            }
        }
        return $detailedOrders;
    }

    public function getDetailsOrderById($OrderId)
    {
        $query = "SELECT * FROM orders WHERE OrderId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($OrderId));
        $orderproducts = new Orderproduct($this->conn);
        $address = new Address($this->conn);
        $users = new Users($this->conn);
        if ($stmt->rowCount()) {
            $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($orders as $order) {
                $order["Orderroducts"] =  $orderproducts->getByOrderId($order["OrderId"]);
                $order["Customer"] =  $users->getUserByUserId($order["CustomerId"]);
                $order["Address"] =  $address->getAddressIdById($order["DeliveryAddress"]);
                $order["Supplier"] =  $users->getUserByUserId($order["SupplierId"]);
                return $order;
            }
        }
        return null;
    }

    public function getByCustomerId($CustomerId)
    {
        $query = "SELECT * FROM orders WHERE CustomerId =?";

        $stmt = $this->conn->prepare($query);
        $stmt->execute(array($CustomerId));

        if ($stmt->rowCount()) {
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
}
