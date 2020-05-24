<?php
include_once '../../config/Database.php';
include_once '../../models/Orders.php';
include_once '../../models/Order_products.php';
include_once '../../models/Order_options.php';

$data = json_decode(file_get_contents("php://input"));

$products = $data->products;
$order = $data->order;
$Charges = $order->Charges;


//connect to db
$database = new Database();
$db = $database->connect();

// create user first to get UserId
$orders = new Orders($db);

$result = $orders->add(
    $order->CompanyId,
    $order->ParntersId,
    $order->ParntersEmail,
    $order->OrderType,
    $order->Total,
    $order->Paid,
    $order->Due,
    $order->CreateUserId,
    $order->ModifyUserId,
    $order->Status,
    $order->StatusId
);

$OrderId =  $result['OrdersId'];

foreach ($products as $product) {
    $order_products = new Order_products($db);

    $products_result = $order_products->add(
        $OrderId,
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
    $options = $product->Options;
    $OrderProductId =  $products_result['Id'];

    // product options
    if ($options) {

        foreach ($options as $opt) {
            $attribute = new Order_options($db);
            $attribute_attribute = $attribute->add(
                $OrderId,
                $opt->ProductId,
                $OrderProductId,
                $opt->OptionId,
                $opt->ValueId,
                $opt->OptionValue,
                $opt->OptionName,
                $opt->ValuePrice,
                $opt->ValueIdQty,
                $opt->CompanyId,
                $opt->CreateUserId,
                $opt->ModifyUserId,
                $opt->StatusId

            );
        }
    }

    
// charges
if ($Charges) {

    foreach ($Charges as $charge) {
        $connn = new Config($db);
        $configs = $connn->add(
            $OrderId,
            $charge->Name,
            $charge->Type,
            'this is the order shipping',
            $charge->Label,
            $charge->Value,
            $charge->IsRequired,
            $charge->FieldType,
            $charge->CreateUserId,
            $charge->ModifyUserId,
            $charge->StatusId

        );
    }
}

}



$allorders = $orders->getDetailedCampanyById($order->CompanyId);
echo json_encode($allorders);
