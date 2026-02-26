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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastLoginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Sunil Kumar','sunil1','pass123','sunil1@gmail.com','9000000001','Bangalore','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(2,'Ravi Teja','ravi1','pass123','ravi1@gmail.com','9000000002','Hyderabad','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(3,'Anjali','anjali1','pass123','anjali1@gmail.com','9000000003','Chennai','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(4,'Kiran','kiran1','pass123','kiran1@gmail.com','9000000004','Mumbai','ADMIN','2026-02-24 10:53:40','2026-02-24 10:53:40'),(5,'Meena','meena1','pass123','meena1@gmail.com','9000000005','Delhi','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(6,'Arjun','arjun1','pass123','arjun1@gmail.com','9000000006','Pune','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(7,'Sneha','sneha1','pass123','sneha1@gmail.com','9000000007','Kolkata','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(8,'Rahul','rahul1','pass123','rahul1@gmail.com','9000000008','Vizag','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(9,'Divya','divya1','pass123','divya1@gmail.com','9000000009','Mysore','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(10,'Vikram','vikram1','pass123','vikram1@gmail.com','9000000010','Coimbatore','ADMIN','2026-02-24 10:53:40','2026-02-24 10:53:40'),(11,'Pooja','pooja1','pass123','pooja1@gmail.com','9000000011','Jaipur','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(12,'Suresh','suresh1','pass123','suresh1@gmail.com','9000000012','Indore','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(13,'Neha','neha1','pass123','neha1@gmail.com','9000000013','Lucknow','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(14,'Ramesh','ramesh1','pass123','ramesh1@gmail.com','9000000014','Patna','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40'),(15,'Lakshmi','lakshmi1','pass123','lakshmi1@gmail.com','9000000015','Trichy','CUSTOMER','2026-02-24 10:53:40','2026-02-24 10:53:40');
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

-- Dump completed on 2026-02-26 22:00:17
