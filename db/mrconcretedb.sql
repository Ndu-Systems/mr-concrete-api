-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2020 at 08:44 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

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
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CrateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
(25, 'Heavy', '2020-01-27 23:29:49', 'test', '2020-01-27 23:29:49', 'test', 1),
(26, 'News Coms', '2020-02-02 18:42:06', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 18:42:06', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1),
(27, 'Better', '2020-02-02 18:42:46', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 18:42:46', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1);

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
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `SupplierId` varchar(225) NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeliveryDate` datetime NOT NULL,
  `TruckArrivalTime` varchar(11) NOT NULL,
  `Directions` varchar(225) NOT NULL,
  `SpecialInstructions` varchar(225) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concreteorder`
--

INSERT INTO `concreteorder` (`OrderId`, `UserId`, `ProjectCode`, `OrderNumber`, `SupplierId`, `OrderDate`, `DeliveryDate`, `TruckArrivalTime`, `Directions`, `SpecialInstructions`, `CategoryId`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('15c1d82b-4935-11ea-b7e8-c8f7501047dc', '8217b572-3c7d-11ea-8876-c8f7501047dc', 'PROJ995412', 'O782372', '1b5b7944-4ab3-11ea-b387-c8f7501047dc', '2020-02-06 22:00:00', '2020-02-28 22:00:00', '', 'Get walking', 'Now', 20, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1),
('56b344ac-4a85-11ea-b387-c8f7501047dc', '8217b572-3c7d-11ea-8876-c8f7501047dc', 'PGDJ1112', 'O782372', '1b5b7944-4ab3-11ea-b387-c8f7501047dc', '2020-02-06 22:00:00', '2020-02-06 22:00:00', '', '', '', 2, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 3),
('6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', '8217b572-3c7d-11ea-8876-c8f7501047dc', '', 'O782372', '1b5b7944-4ab3-11ea-b387-c8f7501047dc', '2020-02-08 22:00:00', '0000-00-00 00:00:00', '', '', '', 22, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 2),
('a00af359-4b6d-11ea-ad8f-c8f7501047dc', '8217b572-3c7d-11ea-8876-c8f7501047dc', 'PHT52113', 'O782372', '1b5b7944-4ab3-11ea-b387-c8f7501047dc', '2020-02-08 22:00:00', '2020-02-27 22:00:00', '', 'Neh', 'ejehy', 22, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `concreteordermeasurement`
--

CREATE TABLE `concreteordermeasurement` (
  `Id` varchar(225) NOT NULL,
  `OrderId` varchar(225) NOT NULL,
  `MeasurementId` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concreteordermeasurement`
--

INSERT INTO `concreteordermeasurement` (`Id`, `OrderId`, `MeasurementId`, `Value`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('15c2b4bf-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 1, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c36bfa-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 2, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c42649-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 3, 14, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c50922-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 4, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c5eb3c-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 5, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c69f19-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 6, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c75d5c-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 7, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c817db-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 8, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c8ce5e-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 9, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15c98abf-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 10, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15ca477a-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 11, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15cb0065-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 12, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15cbb672-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 13, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15cc6e14-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 14, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('15cd281e-4935-11ea-b7e8-c8f7501047dc', '15c1d82b-4935-11ea-b7e8-c8f7501047dc', 15, 500, '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-07 01:04:53', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b400a2-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 1, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b4a870-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 2, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b54ab8-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 3, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b5d317-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 4, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b665c1-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 5, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b70e9b-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 6, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b7c02c-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 7, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b86ea1-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 8, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56b95072-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 9, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56ba2452-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 10, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56bad9f0-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 11, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56bb8840-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 12, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56bc3e61-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 13, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56bceed8-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 14, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('56bd955c-4a85-11ea-b387-c8f7501047dc', '56b344ac-4a85-11ea-b387-c8f7501047dc', 15, 0, '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:11:47', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636495ab-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 1, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('63651f3f-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 2, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('6365a642-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 3, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('63665d20-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 4, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('6366e2e3-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 5, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('63676d09-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 6, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('6367f757-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 7, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('63687bd7-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 8, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636900c5-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 9, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636983b9-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 10, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636a0e08-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 11, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636acdc6-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 12, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636b925a-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 13, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636c1237-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 14, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('636c97a5-4b6d-11ea-ad8f-c8f7501047dc', '6363fe3c-4b6d-11ea-ad8f-c8f7501047dc', 15, 0, '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:52:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('80136c4e-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 1, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('801444cd-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 2, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('80152136-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 3, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('8015d04d-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 4, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('8016863c-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 5, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('80173d78-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 6, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('8017f095-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 7, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('80189988-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 8, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('80194259-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 9, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('8019eecf-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 10, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('801ace58-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 11, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('801baf3b-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 12, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('801c459a-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 13, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('801ce63d-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 14, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('801d7ec6-4a85-11ea-b387-c8f7501047dc', '80129680-4a85-11ea-b387-c8f7501047dc', 15, 300, '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:12:56', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00b9299-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 1, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00c4a65-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 2, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00d0e34-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 3, 20, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00d91be-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 4, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00e14ea-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 5, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00e95e6-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 6, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00f152a-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 7, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a00f91ec-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 8, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a010970c-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 9, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a01155aa-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 10, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a011d6f4-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 11, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a0125644-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 12, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a0132802-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 13, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a013ab59-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 14, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a01431ba-4b6d-11ea-ad8f-c8f7501047dc', 'a00af359-4b6d-11ea-ad8f-c8f7501047dc', 15, 300, '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-09 20:54:39', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9e93cef-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 1, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9e9bd33-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 2, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9ea475e-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 3, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9eac5e0-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 4, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9eb46c5-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 5, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9ebcdc9-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 6, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9eca96e-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 7, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9ed8ca4-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 8, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9ee30fb-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 9, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9eec53c-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 10, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9ef6444-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 11, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9f004ab-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 12, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9f0a7b2-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 13, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9f1488e-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 14, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('a9f1f2dd-4a84-11ea-b387-c8f7501047dc', 'a9e86351-4a84-11ea-b387-c8f7501047dc', 15, 0, '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:06:57', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d69d7721-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 1, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d69e5834-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 2, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d69f1eab-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 3, 14, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d69fb87e-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 4, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a04a81-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 5, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a0d3c1-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 6, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a17cb0-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 7, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a24dea-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 8, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a3284b-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 9, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a3c421-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 10, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a47606-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 11, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a52f68-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 12, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a5dea3-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 13, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a69b02-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 14, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
('d6a7543c-4a84-11ea-b387-c8f7501047dc', 'd69c9c3c-4a84-11ea-b387-c8f7501047dc', 15, 300, '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-08 17:08:12', '8217b572-3c7d-11ea-8876-c8f7501047dc', 0),
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
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement`
--

INSERT INTO `measurement` (`MeasurementId`, `Name`, `UnitOfMeasurement`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, 'Compressive strength', 'test', '2020-01-27 23:00:04', 'test', '2020-01-27 23:00:04', 'test', 1),
(2, 'Casting date', 'test', '2020-01-27 23:00:48', 'test', '2020-01-27 23:00:48', 'test', 1),
(3, 'Truck arrival time', 'test', '2020-01-27 23:00:55', 'test', '2020-01-27 23:00:55', 'test', 1),
(4, 'cubic yards needed', 'test', '2020-01-27 23:02:03', 'test', '2020-01-27 23:02:03', 'test', 1),
(5, 'Mix design number', 'test', '2020-01-27 23:02:31', 'test', '2020-01-27 23:02:31', 'test', 1),
(6, 'Compressive strength', 'Mpa', '2020-01-27 23:02:54', 'test', '2020-01-27 23:02:54', 'test', 1),
(7, 'Maximum size coarse aggregate', 'Mpa', '2020-01-27 23:04:24', 'test', '2020-01-27 23:04:24', 'test', 1),
(8, 'fly ash', 'kg', '2020-01-27 23:04:25', 'test', '2020-01-27 23:04:25', 'test', 1),
(9, 'air Entrainment', 'kg', '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(10, 'retardant', 'mpa', '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(11, 'Supermerplasticizer', 'kg', '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(12, 'Slump', 'mm', '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1),
(13, 'TestMeasure', 'TEST', '2020-02-02 19:04:54', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 19:04:54', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1),
(14, 'testMeasurement', 'TEST', '2020-02-02 19:10:56', 'test', '2020-02-02 19:10:56', 'test', 1),
(15, 'TestNoew', 'TEST', '2020-02-02 19:11:08', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 19:11:08', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `StatusId` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(5) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `RoleName`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
(1, 'Admin', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1),
(2, 'Engineer', '2020-01-21 20:41:37', 'sys', '2020-01-21 20:41:37', 'sys', 1),
(3, 'Supplier', '2020-02-08 17:22:50', 'sys', '2020-02-08 17:22:50', 'sys', 1),
(4, 'Assistant', '2020-02-08 21:39:07', 'sys', '2020-02-08 21:39:07', 'sys', 1);

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
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierId`, `SupplierName`, `ContactNumber`, `EmailAddress`, `ContactPerson`, `SupplierAddress`, `City`, `PostalCode`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('0f84d16d-45cf-11ea-bfe3-c8f7501047dc', 'Bronders', '0133245244', 'bronders@sa.co.za', 'Graig', 'not-set', 'Cape Town', '10001', '2020-02-02 17:17:00', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 17:17:00', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1),
('15c1d82b-4935-11ea-b7e8-c8f7501047dc', 'Becker', 'na', 'becker@mail.com', 'Becker', 'na', 'na', 'na', '2020-02-08 22:39:24', 'sys', '2020-02-08 22:39:24', 'sys', 1),
('26d927af-45db-11ea-bfe3-c8f7501047dc', 'Stoner Supplies', '0144521142', 'stoner@mail.com', 'Jimmy', 'not-set', 'Bank Street', '500', '2020-02-02 18:43:34', '8217b572-3c7d-11ea-8876-c8f7501047dc', '2020-02-02 18:43:34', '8217b572-3c7d-11ea-8876-c8f7501047dc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliercategory`
--

CREATE TABLE `suppliercategory` (
  `Id` int(11) NOT NULL,
  `SupplierId` varchar(225) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreateUserId` varchar(225) NOT NULL,
  `ModifyDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifyUserId` varchar(225) NOT NULL,
  `StatusId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Cellphone`, `RoleId`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`, `StatusId`) VALUES
('0d9678af-4ab0-11ea-b387-c8f7501047dc', 'test', 'user', 'Engineer@mail.com', '12345', 'na', 2, '2020-02-08 22:17:32', 'sys', '2020-02-08 22:17:32', 'sys', 1),
('1b5b7944-4ab3-11ea-b387-c8f7501047dc', 'Becker', 'News', 'becker@mail.com', '12345', 'na', 3, '2020-02-08 22:39:24', 'sys', '2020-02-08 22:39:24', 'sys', 1),
('36e8d88f-4ab3-11ea-b387-c8f7501047dc', 'Steve', 'Nkosi', 'steven@mail.com', '12345', 'na', 2, '2020-02-08 22:40:10', 'sys', '2020-02-08 22:40:10', 'sys', 1),
('5cea9755-4aaf-11ea-b387-c8f7501047dc', 'test', 'user', 'signup@mail.com', '12345', 'na', 3, '2020-02-08 22:12:36', 'sys', '2020-02-08 22:12:36', 'sys', 1),
('8118d997-4b3d-11ea-ad8f-c8f7501047dc', 'minister', 'Government', 'mini@mail.com', '12345', 'na', 3, '2020-02-09 15:10:11', 'sys', '2020-02-09 15:10:11', 'sys', 1),
('8217b572-3c7d-11ea-8876-c8f7501047dc', 'test', 'user', 'test@mail.com', '12345', '071455588774', 1, '2020-01-21 20:40:33', 'sys', '2020-01-21 20:40:33', 'sys', 1),
('b579c478-4b3d-11ea-ad8f-c8f7501047dc', 'Sir', 'Mngadi', 'sir@mail.com', '12345', 'na', 2, '2020-02-09 15:11:39', 'sys', '2020-02-09 15:11:39', 'sys', 1);

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
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`StatusId`);

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
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `measurement`
--
ALTER TABLE `measurement`
  MODIFY `MeasurementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `StatusId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
