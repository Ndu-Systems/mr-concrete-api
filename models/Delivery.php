<?php

include_once 'Order.php';
include_once 'Users.php';

class OrderDelivery
{
    private $conn;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function GetById(
        $Id,
        $IsDeleted,
        $StatusId
    ) {
        $query = "SELECT * FROM orderdeliveries where Id = ? AND IsDeleted = ? AND StatusId = ?";
        try {
            $stmt = $this->conn->prepare($query);
            $stmt->execute(array(
                $Id,
                $IsDeleted,
                $StatusId
            ));
            $order = new Order($this->conn);

            if ($stmt->rowCount()) {
                $delivery = $stmt->fetch(PDO::FETCH_ASSOC);
                $delivery["Order"] =  $order->getDetailsOrderById($delivery["OrderId"]);
                return $delivery;
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function GetAll(
        $IsDeleted,
        $StatusId
    ) {
        $query = "SELECT * FROM orderdeliveries where IsDeleted = ? AND StatusId = ?";
         try {
            $stmt = $this->conn->prepare($query);
            $stmt->execute(array(
                $IsDeleted,
                $StatusId
            ));

            if ($stmt->rowCount()) {
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function GetOrderDeliveriesByUserId(
        $UserId,
        $IsDeleted,
        $StatusId
    ) {
        $query = "SELECT * FROM orderdeliveries od
        INNER JOIN orders o ON od.OrderId = o.OrderId
        where 
        od.UserId = ?
        AND od.IsDeleted = ? 
        AND od.StatusId = ?";

        $stmt = $this->conn->prepare($query);

        try {
            $stmt = $this->conn->prepare($query);
            $stmt->execute(array(
                $UserId,
                $IsDeleted,
                $StatusId
            ));

            $order = new Order($this->conn);
            $detailedOrderDeliveries = array();

            if ($stmt->rowCount()) {
                $deliveries =  $stmt->fetchAll(PDO::FETCH_ASSOC);
                foreach ($deliveries as $delivery) {
                    $delivery["Order"] = $order->getDetailsOrderById($delivery["OrderId"]);
                    array_push($detailedOrderDeliveries, $delivery);
                }
            }

            return $detailedOrderDeliveries;
            
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function GetOrderDeliveriesByCompanyId(
        $CompanyId,
        $IsDeleted,
        $StatusId
    ) {
        $query = "SELECT * FROM orderdeliveries od
        INNER JOIN orders o ON od.OrderId = o.OrderId
        where 
        o.SupplierId = ?
        AND od.IsDeleted = ? 
        AND od.StatusId = ?";

        $stmt = $this->conn->prepare($query);

        try {
            $stmt = $this->conn->prepare($query);
            $stmt->execute(array(
                $CompanyId,
                $IsDeleted,
                $StatusId
            ));

            $order = new Order($this->conn);
            $detailedOrderDeliveries = array();

            if ($stmt->rowCount()) {
                $deliveries =  $stmt->fetchAll(PDO::FETCH_ASSOC);
                foreach ($deliveries as $delivery) {
                    $delivery["Order"] = $order->getDetailsOrderById($delivery["OrderId"]);
                    array_push($detailedOrderDeliveries, $delivery);
                }
            }
            
            return $detailedOrderDeliveries;
            
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function AddOrderDelivery(
        $Id,
        $OrderId,
        $UserId,
        $DriverId,
        $DeliveryStartDateTime,
        $DeliveryEndDateTime,
        $IsDeleted,
        $StatusId
    ) {
        $query = "INSERT INTO orderdeliveries(
           Id, 
           OrderId, 
           UserId, 
           DriverId, 
           DeliveryStartDateTime, 
           DeliveryEndDateTime, 
           IsDeleted,
           StatusId) 
           VALUES (?,?,?,?,?,?,?,?)";

        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(
                $Id,
                $OrderId,
                $UserId,
                $DriverId,
                $DeliveryStartDateTime,
                $DeliveryEndDateTime,
                $IsDeleted,
                $StatusId
            ))) {
                return $this->GetById($Id, $IsDeleted, $StatusId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
    }

    public function UpdateOrderDelivery(
        $Id,
        $OrderId,
        $UserId,
        $DriverId,
        $DeliveryStartDateTime,
        $DeliveryEndDateTime,
        $IsDeleted,
        $StatusId
    )
    {
       $query = "UPDATE orderdeliveries SET                 
                OrderId=?,
                UserId=?,
                DriverId=?,
                DeliveryStartDateTime=?,
                DeliveryEndDateTime=?,
                IsDeleted=?,
                StatusId=? 
                WHERE Id= ?";
        try {
            $stmt = $this->conn->prepare($query);
            if ($stmt->execute(array(                
                $OrderId,
                $UserId,
                $DriverId,
                $DeliveryStartDateTime,
                $DeliveryEndDateTime,
                $IsDeleted,
                $StatusId,
                $Id
            ))) {
                return $this->GetById($Id, $IsDeleted, $StatusId);
            }
        } catch (Exception $e) {
            return array("ERROR", $e);
        }
        
    }
}
