-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2020 at 02:26 PM
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
(12, 'Slump', 'mm', '2020-01-27 23:04:26', 'test', '2020-01-27 23:04:26', 'test', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`MeasurementId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `measurement`
--
ALTER TABLE `measurement`
  MODIFY `MeasurementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
