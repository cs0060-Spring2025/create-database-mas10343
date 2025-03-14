-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_description` varchar(255) NOT NULL,
  `item_value` decimal(10,2) DEFAULT NULL,
  `quantity_on_hand` int DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Canned Beans',1.25,10000),(2,'Bottled Water',0.50,20000),(3,'Bandages',2.00,5000),(4,'Pain Reliever',3.50,3000),(5,'Baby Formula',10.00,2000),(6,'Diapers',8.00,4000),(7,'Toys',5.00,6000),(8,'Blankets',15.00,2000),(9,'First Aid Kit',25.00,1000),(10,'Flashlight',7.00,3000),(11,'Canned Tuna',2.00,8000),(12,'Rice',1.50,12000);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `package_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`package_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,3),(1,2,5),(1,11,2),(2,1,4),(2,2,6),(2,12,1),(3,3,10),(3,4,5),(4,3,12),(4,4,6),(5,6,10),(5,7,3),(6,6,12),(6,7,4),(7,1,2),(7,2,3),(7,8,1),(8,1,3),(8,2,4),(8,8,2),(9,1,4),(9,2,5),(9,11,3),(10,3,11),(10,4,7);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `package_type_id` int NOT NULL AUTO_INCREMENT,
  `package_type_name` varchar(255) NOT NULL,
  `package_type_description` text,
  PRIMARY KEY (`package_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical','Basic medical supplies'),(2,'child-care','Child care supplies'),(3,'food','Food supplies');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `task_code` int DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`package_id`),
  KEY `task_code` (`task_code`),
  CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`task_code`) REFERENCES `tasks` (`task_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,102,'2023-10-27',5.50),(2,102,'2023-10-27',6.00),(3,103,'2023-10-28',4.20),(4,103,'2023-10-28',4.80),(5,106,'2023-10-28',3.70),(6,106,'2023-10-28',3.90),(7,110,'2023-11-01',5.10),(8,110,'2023-11-01',5.30),(9,102,'2023-11-02',5.80),(10,103,'2023-11-03',4.50);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packing_list_id` int NOT NULL AUTO_INCREMENT,
  `packing_list_name` varchar(255) NOT NULL,
  `packing_list_description` text,
  PRIMARY KEY (`packing_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Food Package','Contains canned beans, bottled water, and canned tuna.'),(2,'Medical Package','Contains bandages and pain relievers.'),(3,'Child-care Package','Contains diapers and toys.'),(4,'Basic Package','Contains canned beans, bottled water, and blankets.');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_code` int NOT NULL,
  `task_description` varchar(255) NOT NULL,
  `task_type` varchar(50) NOT NULL,
  `task_status` varchar(50) NOT NULL,
  `packing_list_id` int DEFAULT NULL,
  PRIMARY KEY (`task_code`),
  KEY `packing_list_id` (`packing_list_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`packing_list_id`) REFERENCES `packing_list` (`packing_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (101,'Answer the telephone','recurring','ongoing',NULL),(102,'Prepare 5000 food packages','packing','open',1),(103,'Prepare 2000 medical packages','packing','open',2),(104,'Data Entry','administrative','ongoing',NULL),(105,'Warehouse organization','logistics','ongoing',NULL),(106,'Prepare 1000 Child-care packages','packing','open',3),(107,'Distribute food packages','distribution','ongoing',NULL),(108,'Distribute medical packages','distribution','ongoing',NULL),(109,'Manage volunteer signups','administrative','ongoing',NULL),(110,'Prepare 1500 basic packages','packing','open',4);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer_tasks`
--

DROP TABLE IF EXISTS `volunteer_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer_tasks` (
  `volunteer_id` int NOT NULL,
  `task_code` int NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteer_id`,`task_code`),
  KEY `task_code` (`task_code`),
  CONSTRAINT `volunteer_tasks_ibfk_1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`volunteer_id`),
  CONSTRAINT `volunteer_tasks_ibfk_2` FOREIGN KEY (`task_code`) REFERENCES `tasks` (`task_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer_tasks`
--

LOCK TABLES `volunteer_tasks` WRITE;
/*!40000 ALTER TABLE `volunteer_tasks` DISABLE KEYS */;
INSERT INTO `volunteer_tasks` VALUES (1,101,'2025-02-19 09:00:00','2025-02-19 12:00:00'),(1,102,'2025-02-20 10:00:00','2025-02-20 16:00:00'),(1,103,'2025-03-03 12:00:00','2025-03-03 18:00:00'),(2,102,'2025-02-21 10:00:00','2025-02-21 16:00:00'),(2,103,'2025-02-22 08:00:00','2025-02-22 14:00:00'),(2,110,'2025-03-04 13:00:00','2025-03-04 17:00:00'),(3,104,'2025-02-23 08:00:00','2025-02-23 17:00:00'),(4,105,'2025-02-24 09:00:00','2025-02-24 18:00:00'),(5,106,'2025-02-25 10:00:00','2025-02-25 17:00:00'),(6,107,'2025-02-26 11:00:00','2025-02-26 16:00:00'),(7,108,'2025-02-27 12:00:00','2025-02-27 18:00:00'),(8,109,'2025-02-28 09:00:00','2025-02-28 17:00:00'),(9,110,'2025-03-01 10:00:00','2025-03-01 16:00:00'),(10,102,'2025-03-02 11:00:00','2025-03-02 15:00:00');
/*!40000 ALTER TABLE `volunteer_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteers` (
  `volunteer_id` int NOT NULL AUTO_INCREMENT,
  `volunteer_name` varchar(255) NOT NULL,
  `volunteer_address` varchar(255) DEFAULT NULL,
  `volunteer_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`volunteer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
INSERT INTO `volunteers` VALUES (1,'Alice Smith','123 Main St','555-1234'),(2,'Bob Johnson','456 Oak Ave','555-5678'),(3,'Carol Williams','789 Pine Ln','555-9012'),(4,'David Brown','101 Elm Rd','555-3456'),(5,'Eve Davis','202 Maple Dr','555-7890'),(6,'Frank Miller','303 Birch Ct','555-2345'),(7,'Grace Wilson','404 Cedar Pl','555-6789'),(8,'Henry Moore','505 Willow St','555-0123'),(9,'Ivy Taylor','606 Redwood Ave','555-4567'),(10,'Jack Anderson','707 Spruce Ln','555-8901');
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 13:19:24
