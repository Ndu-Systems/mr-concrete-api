<?php
include_once '../../config/Database.php';
include_once '../../models/Order_products.php';

$data = json_decode(file_get_contents("php://input"));

$products = $data->products;


//connect to db
$database = new Database();
$db = $database->connect();


foreach ($products as $product) {
    $order_products = new Order_products($db);

    $result = $order_products->add(
        $product->OrderId,
        $product->ProductId,
        $product->CompanyId,
        $product->ProductName,
        $product->UnitPrice,
        $product->Quantity,
        $product->subTotal,
        $product->CreateUserId,
        $product->ModifyUserId,
        $product->StatusId
    );
}
    echo json_encode(true);

 
 


