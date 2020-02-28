<?php
include_once 'Category.php';
include_once 'Measurement.php';
include_once 'Supplier.php';

class Counter
{
    private $conn;

    public function __construct($db)
    {
        $this->conn =$db;
    }

    public function getSummaryCounts()
    {
       $item["SupplierCount"] = $this->supplierCount();
       $item["CategoryCount"] = $this->categoryCount();
       $item["MeasurementCount"] = $this->measurementCount();
       return $item;        
    }

    public function supplierCount()
    {
        $query ="SELECT COUNT(*) AS Count FROM `supplier` WHERE 1";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());
         return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function categoryCount()
    {
        $query ="SELECT COUNT(*) AS Count FROM `category` WHERE 1";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());
         return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function measurementCount()
    {
        $query ="SELECT COUNT(*) AS Count FROM `measurement` WHERE 1";
        $stmt = $this->conn->prepare($query);
        $stmt->execute(array());
         return $stmt->fetch(PDO::FETCH_ASSOC);
    }

}
