
-- 25/02/25
ALTER TABLE `concreteordermeasurement` CHANGE `Value` `Value` VARCHAR(150) NOT NULL;
ALTER TABLE `measurement` ADD `Type` VARCHAR(30) NULL AFTER `UnitOfMeasurement`;


-- 2020/02/03
ALTER TABLE `concreteorder` ADD `SupplierId` VARCHAR(225) NOT NULL AFTER `OrderNumber`;


