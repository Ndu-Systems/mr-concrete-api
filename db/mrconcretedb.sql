-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2020 at 09:49 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrconcretedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressId` varchar(225) NOT NULL,
  `UserId` varchar(225) NOT NULL,
  `AddressLine1` varchar(50) NOT NULL,
  `AddressLine2` varchar(50) NOT NULL,
  `AddressLine3` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PostalCode` varchar(20) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `CategoryName`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(2, 'residential', '2020-01-27 23:29:56', 'residential', '2020-01-27 23:29:56', 'test', 1),
(20, 'Commercial and institutional', '2020-01-27 23:29:41', 'test', '2020-01-27 23:29:41', 'test', 1),
(21, 'Industrial', '2020-01-27 23:29:42', 'test', '2020-01-27 23:29:42', 'test', 1),
(22, 'Highway', '2020-01-27 23:29:44', 'test', '2020-01-27 23:29:44', 'test', 1),
(23, 'Building', '2020-01-27 23:29:46', 'test', '2020-01-27 23:29:46', 'test', 1),
(25, 'Heavy', '2020-01-27 23:29:49', 'test', '2020-01-27 23:29:49', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CompanyId` varchar(225) NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `CompanyAddress` varchar(225) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `concreteorder`
--

CREATE TABLE `concreteorder` (
  `OrderId` varchar(225) NOT NULL,
  `UserId` varchar(225) NOT NULL,
  `ProjectCode` varchar(50) NOT NULL,
  `OrderNumber` varchar(50) NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT current_timestamp(),
  `DeliveryDate` datetime NOT NULL,
  `TruckArrivalTime` varchar(11) NOT NULL,
  `Directions` varchar(225) NOT NULL,
  `SpecialInstructions` varchar(225) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concreteorder`
--

INSERT INTO `concreteorder` (`OrderId`, `UserId`, `ProjectCode`, `OrderNumber`, `OrderDate`, `DeliveryDate`, `TruckArrivalTime`, `Directions`, `SpecialInstructions`, `CategoryId`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('1c41c7d7-4140-11ea-abf7-48f17f8d4d88', 'test', 'test', 'test', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'test', 'test', 'test', 0, '2020-01-27 22:03:39', 'test', '2020-01-27 22:03:39', 'test', 1),
('42c707cc-413f-11ea-abf7-48f17f8d4d88', 'test', 'test', 'test', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'test', 'test', 'test', 0, '2020-01-27 21:57:34', 'test', '2020-01-27 21:57:34', 'test', 1),
('589b8956-4140-11ea-abf7-48f17f8d4d88', 'test', 'test', 'test', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'test', 'test', 'test', 0, '2020-01-27 22:05:20', 'test', '2020-01-27 22:05:20', 'test', 1),
('f4bca3b0-413f-11ea-abf7-48f17f8d4d88', 'test', 'test', 'test', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'test', 'test', 'test', 0, '2020-01-27 22:02:33', 'test', '2020-01-27 22:02:33', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `concreteordermeasurement`
--

CREATE TABLE `concreteordermeasurement` (
  `Id` varchar(225) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `MeasurementId` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concreteordermeasurement`
--

INSERT INTO `concreteordermeasurement` (`Id`, `OrderId`, `MeasurementId`, `Value`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('f798fdf4-414a-11ea-abf7-48f17f8d4d88', 'test', 0, 0, '2020-01-27 23:21:22', 'test', '2020-01-27 23:21:22', 'test', 1),
('f9d5cd76-414a-11ea-abf7-48f17f8d4d88', 'test', 0, 0, '2020-01-27 23:21:26', 'test', '2020-01-27 23:21:26', 'test', 1),
('fa5b454f-414a-11ea-abf7-48f17f8d4d88', 'test', 0, 0, '2020-01-27 23:21:27', 'test', '2020-01-27 23:21:27', 'test', 1),
('fae9d2bf-414a-11ea-abf7-48f17f8d4d88', 'test', 0, 0, '2020-01-27 23:21:28', 'test', '2020-01-27 23:21:28', 'test', 1),
('fb304dc7-414a-11ea-abf7-48f17f8d4d88', 'test', 0, 0, '2020-01-27 23:21:28', 'test', '2020-01-27 23:21:28', 'test', 1),
('fc29c8df-414a-11ea-abf7-48f17f8d4d88', 'test', 0, 0, '2020-01-27 23:21:30', 'test', '2020-01-27 23:21:30', 'test', 1),
('fc85d42a-414a-11ea-abf7-48f17f8d4d88', 'test', 0, 0, '2020-01-27 23:21:30', 'test', '2020-01-27 23:21:30', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `measurement`
--

CREATE TABLE `measurement` (
  `MeasurementId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UnitOfMeasurement` varchar(20) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement`
--

INSERT INTO `measurement` (`MeasurementId`, `Name`, `UnitOfMeasurement`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, 'test', 'test', '2020-01-27 23:00:04', 'test', '2020-01-27 23:00:04', 'test', 1),
(2, 'test', 'test', '2020-01-27 23:00:48', 'test', '2020-01-27 23:00:48', 'test', 1),
(3, 'test', 'test', '2020-01-27 23:00:55', 'test', '2020-01-27 23:00:55', 'test', 1),
(4, 'test', 'test', '2020-01-27 23:02:03', 'test', '2020-01-27 23:02:03', 'test', 1),
(5, 'test', 'test', '2020-01-27 23:02:31', 'test', '2020-01-27 23:02:31', 'test', 1),
(6, 'test', 'test', '2020-01-27 23:02:54', 'test', '2020-01-27 23:02:54', 'test', 1),
(7, 'test', 'test', '2020-01-27 23:04:24', 'test', '2020-01-27 23:04:24', 'test', 1),
(8, 'test', 'test', '2020-01-27 23:04:25', 'test', '2020-01-27 23:04:25', 'test', 1),
(9, 'test', 'test', '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(10, 'test', 'test', '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(5) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `RoleName`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, 'Engineer', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1),
(2, 'Supplier', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierId` varchar(225) NOT NULL,
  `SupplierName` varchar(50) NOT NULL,
  `ContactNumber` varchar(50) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `ContactPerson` varchar(225) NOT NULL,
  `SupplierAddress` varchar(225) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PostalCode` varchar(10) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierId`, `SupplierName`, `ContactNumber`, `EmailAddress`, `ContactPerson`, `SupplierAddress`, `City`, `PostalCode`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('8c8fe2df-43a1-11ea-8908-48f17f8d4d88', 'Mr JJ ', '0114557878', 'mrjj@mail.com', 'Mr JJ Sales', 'na', 'Durban', '8745', '2020-01-30 22:46:11', 'postman', '2020-01-30 22:46:11', 'postman', 1),
('b57897bb-43a1-11ea-8908-48f17f8d4d88', 'Wolies Home', '0114557878', 'wolls@mail.com', 'Zandi', 'na', 'Durban', '8745', '2020-01-30 22:47:20', 'postman', '2020-01-30 22:47:20', 'postman', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliercategory`
--

CREATE TABLE `suppliercategory` (
  `Id` int(11) NOT NULL,
  `SupplierId` varchar(225) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` varchar(225) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Cellphone` varchar(15) NOT NULL,
  `RoleId` int(10) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Cellphone`, `RoleId`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('8217b572-3c7d-11ea-8876-c8f7501047dc', 'test', 'user', 'test@mail.com', '12345', '071455588774', 1, '2020-01-21 20:40:33', 'sys', '2020-01-21 20:40:33', 'sys', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyId`);

--
-- Indexes for table `concreteorder`
--
ALTER TABLE `concreteorder`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `concreteordermeasurement`
--
ALTER TABLE `concreteordermeasurement`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`MeasurementId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierId`);

--
-- Indexes for table `suppliercategory`
--
ALTER TABLE `suppliercategory`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29479979;

--
-- AUTO_INCREMENT for table `measurement`
--
ALTER TABLE `measurement`
  MODIFY `MeasurementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
