-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 06, 2023 at 10:18 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25


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
-- Table structure for table `azure_user`
--

DROP TABLE IF EXISTS `azure_user`;
CREATE TABLE IF NOT EXISTS `azure_user` (
  `aid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ovog` varchar(50) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `azure_user`
--

TRUNCATE TABLE `azure_user`;
--
-- Dumping data for table `azure_user`
--

INSERT INTO `azure_user` (`aid`, `name`, `ovog`) VALUES
(1, 'asd', 'qwe'),
(2, 'asd', 'qwe'),
(3, 'asd', 'qwe'),
(4, 'rrr', 'wwww');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `rating`
--

TRUNCATE TABLE `rating`;
--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rate_id`, `user_id`, `cat_id`, `tra_id`, `rating`) VALUES
(1, '0f526f5c-7bec-4153-b7ed-828a4403e49b', 1, 1, 5),
(2, '98132f40-c3d0-4d82-87c0-659a2651d0cd', 1, 1, 5),
(3, 'c259e94a-7a31-4d49-8714-0264a0531708', 1, 2, 4);

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
Truncate table before insert `travel`
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` varchar(10) DEFAULT 'user',
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `role`, `email`, `password`) VALUES
('0f526f5c-7bec-4153-b7ed-828a4403e49b', 'namsrai', 'user', 'namsrai.yo@gmail.com', '$2b$10$dkkfkZ0L3HD8RpP/Ln6v8OH9WP1DJOpp2VfDgu4n71XtYyWsmoTna'),
('98132f40-c3d0-4d82-87c0-659a2651d0cd', 'Уртнасан', 'user', '@gmail.com', '$2b$10$Hj0VvN6UWy75zDcmUq30dOrTj.Y/fd0l092JwBmkydYFlLVZx0GVq'),
('c259e94a-7a31-4d49-8714-0264a0531708', 'Gankhulug', 'user', 'Huluguu0202@gmail.com', '$2b$10$aSt2h9quZEJEQLBvUJWkh.yi0hWjn4B97GIDL.hpxT5GDSXx.GYCe'),
('daec7716-61f6-402c-bbdb-5342f7267fb8', 'ganaa', 'user', 'Ganaa@gmail.com', '$2b$10$XNvvUjVs.KPeLV.G1hPOB.5O0ph1axi9FzN82AaI0NmOLK15TyuTe');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`tra_id`) REFERENCES `travel` (`id`);

--
-- Constraints for table `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
