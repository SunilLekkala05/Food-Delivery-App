-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `orderItemId` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `menuId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `orderId` (`orderId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,1,250),(2,2,3,1,300),(3,3,5,1,180),(4,4,6,1,320),(5,5,7,1,150),(6,6,8,1,90),(7,7,9,1,40),(8,8,10,1,280),(9,9,11,1,120),(10,10,12,1,150),(11,11,13,1,350),(12,12,14,1,400),(13,13,15,1,200),(14,14,2,1,220),(15,15,4,2,500),(16,16,4,1,350),(17,17,4,2,700),(18,18,22,1,140),(19,19,2,2,440),(20,20,22,2,280),(21,21,22,1,140),(22,22,4,2,700),(23,23,22,1,140);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-26 22:00:17
