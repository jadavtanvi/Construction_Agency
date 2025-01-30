-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 24, 2025 at 08:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `construction_agency`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceId` bigint(10) NOT NULL,
  `Worker_ID` int(11) NOT NULL,
  `TimeIn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `OutTime` datetime DEFAULT NULL,
  `CreatedDTStamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceId`, `Worker_ID`, `TimeIn`, `OutTime`, `CreatedDTStamp`) VALUES
(1, 2, '2024-12-15 09:11:16', '2024-12-15 18:11:16', '2024-12-15 18:11:09'),
(2, 3, '2024-11-01 08:17:00', '2024-11-01 18:14:54', '2024-11-01 18:14:18'),
(4, 2, '2024-11-30 09:19:54', '2024-11-30 18:19:54', '2024-12-15 18:21:02'),
(5, 3, '2024-12-01 08:22:01', '2024-12-01 16:19:54', '2024-12-15 18:22:45'),
(7, 4, '2024-12-15 09:32:31', '2024-12-15 17:02:31', '2024-12-15 22:31:55'),
(8, 3, '2024-12-16 08:29:48', '2024-12-16 16:59:47', '2024-12-16 00:27:57'),
(9, 2, '2024-12-16 08:04:41', '2024-12-16 13:04:41', '2024-12-16 00:42:26'),
(10, 2, '2024-12-18 08:24:10', '2024-12-18 16:24:10', '2024-12-18 13:14:32'),
(13, 3, '2024-12-21 08:39:59', '2024-12-21 18:57:58', '2024-12-21 00:26:05'),
(15, 2, '2024-12-19 07:02:47', '2024-12-19 17:02:47', '2024-12-19 12:32:46'),
(16, 4, '2024-12-21 12:29:10', '2024-12-21 06:59:09', '2024-12-19 19:39:42'),
(17, 4, '2024-12-21 12:29:10', '2024-12-21 06:59:09', '2024-12-21 10:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `loginreg`
--

CREATE TABLE `loginreg` (
  `Worker_ID` int(4) NOT NULL,
  `First_Name` varchar(10) NOT NULL,
  `Last_Name` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Gender` varchar(7) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Phone_no` varchar(11) NOT NULL,
  `Age` varchar(3) NOT NULL,
  `AdharNumber` varchar(12) NOT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Address` varchar(30) NOT NULL,
  `Role` varchar(8) NOT NULL,
  `Status` varchar(10) DEFAULT 'Pending',
  `CreatedDTStamp` datetime NOT NULL DEFAULT current_timestamp(),
  `Is_Active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loginreg`
--

INSERT INTO `loginreg` (`Worker_ID`, `First_Name`, `Last_Name`, `DOB`, `Email`, `Gender`, `Password`, `Phone_no`, `Age`, `AdharNumber`, `Salary`, `Address`, `Role`, `Status`, `CreatedDTStamp`, `Is_Active`) VALUES
(1, 'Admin', 'AD', '1987-12-02', 'admin@gmail.com', 'Male', 'admin123', '1236547896', '33', '789456123654', NULL, 'Ahemdabad', 'Admin', 'Approved', '2024-12-15 17:59:21', 1),
(2, 'Krutik', 'Jadav', '1999-08-12', 'abs@gmail.com', 'Male', '123', '9874896556', '25', '987456324159', 150, 'Ahmedabad', 'Worker', 'Approved', '2024-12-15 18:07:41', 1),
(3, 'Tanvi', 'Shah', '2003-03-15', 'tanvi@gmail.com', 'Female', 'tan12', '1234566848', '21', '455987456321', 150, 'Baroda', 'Worker', 'Approved', '2024-12-15 18:13:41', 1),
(4, 'Mohan', 'Vadher', '2000-01-03', 'abcd@gmail.com', 'Male', 'mv1', '4548634646', '24', '987654321456', 300, 'Surat', 'Worker', 'Approved', '2024-12-15 22:24:39', 1),
(5, 'Digish', 'Upadhyay', '1999-08-01', 'digish@gmail.com', 'Male', '12345', '9994562236', '25', '98745663258', 350, 'Mumbai', 'Worker', 'Approved', '2024-12-15 23:58:42', 1),
(6, 'Sahil', 'Rai', '1996-11-14', 'sai@gmail.com', 'Male', 'sai', '945623145', '28', '789658424789', NULL, 'Ahmedabad', 'Worker', 'Pending', '2024-12-19 19:24:21', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceId`);

--
-- Indexes for table `loginreg`
--
ALTER TABLE `loginreg`
  ADD PRIMARY KEY (`Worker_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `AttendanceId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `loginreg`
--
ALTER TABLE `loginreg`
  MODIFY `Worker_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
