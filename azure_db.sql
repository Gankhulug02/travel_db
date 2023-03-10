-- Active: 1677660477547@@127.0.0.1@3306@azure_db
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 10, 2023 at 06:30 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azure_db`
--
CREATE DATABASE IF NOT EXISTS `azure_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `azure_db`;

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` text DEFAULT NULL,
  `role` enum('USER','ADMIN') DEFAULT 'USER',
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `agent`
--

TRUNCATE TABLE `agent`;
-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `images` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `categories`
--

TRUNCATE TABLE `categories`;
--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `images`, `description`) VALUES
(1, 'Asia', 'URL', '.'),
(2, 'Africa', 'URL', '.'),
(3, 'America', 'URL', '.'),
(4, 'Europe', 'URL', '.');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `list_id` int(11) DEFAULT NULL,
  `order_type` varchar(255) NOT NULL,
  `status` enum('CANCEL','PENDING','APPROVED') DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `order`
--

TRUNCATE TABLE `order`;
-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `tra_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `cat_id` (`cat_id`),
  KEY `tra_id` (`tra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `rating`
--

TRUNCATE TABLE `rating`;
-- --------------------------------------------------------

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
CREATE TABLE IF NOT EXISTS `travel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `images` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `location` text DEFAULT NULL,
  `day` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `travel`
--

TRUNCATE TABLE `travel`;
--
-- Dumping data for table `travel`
--

INSERT INTO `travel` (`id`, `title`, `images`, `detail`, `price`, `cat_id`, `location`, `day`) VALUES
(1, 'Bali', 'https://images.unsplash.com/photo-1533029030467-904d7bbd602b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2969&q=80', 'Traveling to Bali offers visitors a chance to experience a unique blend of culture, history, and natural beauty. The island is known for its stunning beaches, lush rice paddies, and iconic temples. Visitors can indulge in delicious cuisine, explore traditional markets, and participate in cultural ceremonies and festivities.', 999, 1, 'BALI', 2),
(2, 'HONG KONG', 'https://images.unsplash.com/photo-1533029030467-904d7bbd602b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2969&q=80', 'Traveling to Hong Kong offers a vibrant mix of culture, history, and modernity. Visitors can explore the city\'s iconic skyscrapers, indulge in delicious Cantonese cuisine, and immerse themselves in the local markets and shopping districts. The city also offers stunning natural scenery, including Victoria Peak and the surrounding islands.', 420, 2, 'HONG KONG', 3),
(3, 'USA, WA', 'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8VVNBfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60', 'Traveling to the state of Washington in the USA offers a variety of activities and experiences. Known for its natural beauty, visitors can explore the Olympic National Park, Mount Rainier, and the San Juan Islands. Seattle offers a vibrant city experience with its iconic Space Needle, Pike Place Market, and diverse food scene.', 900, 3, 'USA', 5),
(4, 'Switzerland', 'https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2970&q=80', 'Traveling to Switzerland offers visitors a chance to explore stunning alpine landscapes, quaint villages, and world-renowned cities. The country is known for its skiing and hiking opportunities, as well as its delicious chocolate and cheese. Visitors can also explore historic landmarks such as the Matterhorn and the Swiss Alps Jungfrau-Aletsch UNESCO World Heritage Site.', 247, 4, 'EU, Switzerland', 999),
(5, 'Paris', 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2973&q=80', 'Traveling to Paris offers a romantic and iconic experience with its charming streets, stunning architecture, and world-renowned landmarks such as the Eiffel Tower and Notre Dame Cathedral. Visitors can indulge in delicious French cuisine, explore art museums such as the Louvre, and shop in high-end boutiques along the Champs-Élysées.', 420, 4, 'EU, Paris', 7);

-- --------------------------------------------------------

--
-- Table structure for table `travel_list`
--

DROP TABLE IF EXISTS `travel_list`;
CREATE TABLE IF NOT EXISTS `travel_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adult` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_id` (`travel_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `travel_list`
--

TRUNCATE TABLE `travel_list`;
-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `role` varchar(10) DEFAULT 'user',
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `phone_number` text NOT NULL,
  `profile_img` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `role`, `email`, `password`, `id`, `phone_number`, `profile_img`) VALUES
('999999', 'user', 'ganaa', '$2b$10$y/eXTVsT6sH0zmqvwR9gNuAUdVf9vC0KZdtCMXpsrBzhy/Yn0pIwq', 1, 'ganaa@gmail.com', 'url'),
('ganaaa', NULL, 'ganaaa@gmail.com', '$2b$10$Py7Qpy9FnpfB2pHuPUH6eOUq.zU48jSULiuZ99uPKYsLo1eWEEXHG', 2, '88888', 'url'),
('ganaaqa', 'user', 'ganaaqa@gmail.com', '$2b$10$QP/l4BmuIfOQ4ZCArvl5kuLVZxo8c0a7WsZUjo/bIHNj6kXVowDXK', 3, '88888', 'url'),
('hello', 'user', 'asd@gmail.com', '$2b$10$N1e3OjytIbVHxfFcD1XoD.jbtQoxmURiDSAAHvjLnDEXp8wHHdw1S', 4, '88228822', 'url');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `travel_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_5` FOREIGN KEY (`tra_id`) REFERENCES `travel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_6` FOREIGN KEY (`tra_id`) REFERENCES `travel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `travel_list`
--
ALTER TABLE `travel_list`
  ADD CONSTRAINT `travel_list_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travel_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
