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
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `cuisineType` varchar(100) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `eta` int DEFAULT NULL,
  `adminUserId` int DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurantId`),
  KEY `adminUserId` (`adminUserId`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`adminUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Spicy Hub','Bangalore','8000000001',4.5,'Indian',1,30,4,'https://images.unsplash.com/photo-1552566626-52f8b828add9?auto=format&fit=crop&w=800&q=80'),(2,'Pizza Palace','Hyderabad','8000000002',4.2,'Italian',1,25,10,'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&w=800&q=80'),(3,'Burger Town','Chennai','8000000003',4,'Fast Food',1,20,4,'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?auto=format&fit=crop&w=800&q=80'),(4,'Biryani House','Delhi','8000000004',4.8,'Hyderabadi',1,35,10,'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?auto=format&fit=crop&w=800&q=80'),(5,'Chinese Bowl','Mumbai','8000000005',4.1,'Chinese',1,30,4,'https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?auto=format&fit=crop&w=800&q=80'),(6,'South Treat','Mysore','8000000006',4.3,'South Indian',1,20,10,'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=800&q=80'),(7,'North Feast','Jaipur','8000000007',4.6,'North Indian',1,40,4,'https://images.unsplash.com/photo-1578474846511-04ba529f0b88?auto=format&fit=crop&w=800&q=80'),(8,'Tandoori Night','Pune','8000000008',4.4,'Tandoori',1,30,10,'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=800&q=80'),(9,'Cafe Coffee','Vizag','8000000009',4.2,'Cafe',1,15,4,'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?auto=format&fit=crop&w=800&q=80'),(10,'Sweet Tooth','Kolkata','8000000010',4.7,'Desserts',1,25,10,'https://images.unsplash.com/photo-1445116572660-236099ec97a0?auto=format&fit=crop&w=800&q=80'),(11,'BBQ Nation','Indore','8000000011',4.5,'BBQ',1,45,4,'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&w=800&q=80'),(12,'Grill Master','Patna','8000000012',4.3,'Grill',1,30,10,'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=800&q=80'),(13,'Veg Delight','Lucknow','8000000013',4.1,'Vegetarian',1,20,4,'https://images.unsplash.com/photo-1559339352-11d035aa65de?auto=format&fit=crop&w=800&q=80'),(14,'Sea Food Bay','Chennai','8000000014',4.6,'Seafood',1,35,10,'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=800&q=80'),(15,'Royal Dine','Bangalore','8000000015',4.9,'Multi Cuisine',1,50,4,'https://images.unsplash.com/photo-1544148103-0773bf10d330?auto=format&fit=crop&w=800&q=80');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-26 22:00:16
