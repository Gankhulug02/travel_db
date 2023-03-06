-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: azure_db
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `azure_user`
--

DROP TABLE IF EXISTS `azure_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `azure_user` (
  `aid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ovog` varchar(50) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `azure_user`
--

LOCK TABLES `azure_user` WRITE;
/*!40000 ALTER TABLE `azure_user` DISABLE KEYS */;
INSERT INTO `azure_user` VALUES (1,'asd','qwe'),(2,'asd','qwe'),(3,'asd','qwe'),(4,'rrr','wwww');
/*!40000 ALTER TABLE `azure_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `images` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `tra_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `cat_id` (`cat_id`),
  KEY `tra_id` (`tra_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`),
  CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`tra_id`) REFERENCES `travel` (`tra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `tra_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `images` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `location` text DEFAULT NULL,
  `day` int(11) NOT NULL,
  PRIMARY KEY (`tra_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` varchar(10) DEFAULT 'user',
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0f526f5c-7bec-4153-b7ed-828a4403e49b','namsrai','user','namsrai.yo@gmail.com','$2b$10$dkkfkZ0L3HD8RpP/Ln6v8OH9WP1DJOpp2VfDgu4n71XtYyWsmoTna'),('98132f40-c3d0-4d82-87c0-659a2651d0cd','Уртнасан','user','@gmail.com','$2b$10$Hj0VvN6UWy75zDcmUq30dOrTj.Y/fd0l092JwBmkydYFlLVZx0GVq'),('c259e94a-7a31-4d49-8714-0264a0531708','Gankhulug','user','Huluguu0202@gmail.com','$2b$10$aSt2h9quZEJEQLBvUJWkh.yi0hWjn4B97GIDL.hpxT5GDSXx.GYCe'),('daec7716-61f6-402c-bbdb-5342f7267fb8','ganaa','user','Ganaa@gmail.com','$2b$10$XNvvUjVs.KPeLV.G1hPOB.5O0ph1axi9FzN82AaI0NmOLK15TyuTe');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 13:56:13
