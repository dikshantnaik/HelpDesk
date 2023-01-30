-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2023 at 10:39 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `help-desk`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `taskName` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `dueDate` varchar(500) NOT NULL,
  `priority` varchar(500) NOT NULL,
  `status` varchar(500) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `taskName`, `description`, `dueDate`, `priority`, `status`) VALUES
(6, 5, 'awawddad', 'awdawdawd', 'awdad', 'Medium', 'closed'),
(8, 5, 'awawddad', 'awdawdawd', 'awdad', 'Medium', 'running'),
(9, 6, 'kaam hai', 'bohot kaam hai', 'kal', 'High', 'pending'),
(10, 7, 'Android Project', 'Create an app for organ donation', '03/01/2023', 'Medium', 'running');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `userType` varchar(500) NOT NULL,
  `company` varchar(500) NOT NULL,
  `dept` varchar(500) NOT NULL,
  `jobRole` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `userType`, `company`, `dept`, `jobRole`) VALUES
(5, 'Kanika Naik', 'kanu@gmail.com', 'pass', 'admin', 'Google', 'IT', 'IT Support'),
(6, 'Subhalaxmi mohanty', 'susu@gmail.com', 'susu', 'user', 'Susu Corp', 'IT', 'Web DEsigner'),
(7, 'Prathamesh Kulkarni', 'prathameshkulkarni952@gmail.com', 'pratham', 'admin', 'Microsoft Corporation', 'Tech Support', 'Software  Developer'),
(8, 'Dikshant Naik', 'dik@gmail.com', 'pass', 'user', 'awdawd', 'dwad', 'awda');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
