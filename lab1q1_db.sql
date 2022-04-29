-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2022 at 08:40 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab1q1_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint_form`
--

CREATE TABLE `complaint_form` (
  `Complaint_id` int(10) DEFAULT NULL,
  `Complaint_title` varchar(100) DEFAULT NULL,
  `Complaint_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Complaint_id` int(10) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `uid` int(10) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_password` varchar(50) NOT NULL,
  `repeat_password` varchar(50) DEFAULT NULL CHECK (`user_password` = `repeat_password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint_form`
--
ALTER TABLE `complaint_form`
  ADD KEY `Complaint_id` (`Complaint_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Complaint_id`),
  ADD KEY `user_name` (`user_name`,`user_password`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`user_name`,`user_password`),
  ADD UNIQUE KEY `uid` (`uid`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `Complaint_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint_form`
--
ALTER TABLE `complaint_form`
  ADD CONSTRAINT `complaint_form_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `login` (`Complaint_id`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`user_name`,`user_password`) REFERENCES `register` (`user_name`, `user_password`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
