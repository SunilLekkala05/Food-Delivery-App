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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuId` int NOT NULL AUTO_INCREMENT,
  `restaurantId` int DEFAULT NULL,
  `itemName` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `ratings` double DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `restaurantId` (`restaurantId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Chicken Biryani','Spicy chicken biryani',250,4.5,1,'https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a?auto=format&fit=crop&w=800&q=80'),(2,1,'Paneer Butter Masala','Creamy paneer curry',220,4.2,1,'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=800&q=80'),(3,2,'Margherita Pizza','Classic cheese pizza',300,4.3,1,'https://source.unsplash.com/800x600/?margherita,pizza'),(4,2,'Veg Supreme','Loaded veg pizza',350,4.4,1,'https://source.unsplash.com/800x600/?vegetable,pizza'),(5,3,'Cheese Burger','Juicy beef burger',180,4.1,1,'https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=800&q=80'),(6,4,'Mutton Biryani','Hyderabadi style',320,4.8,1,'https://source.unsplash.com/800x600/?mutton,biryani'),(7,5,'Fried Rice','Veg fried rice',150,4,1,'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=800&q=80'),(8,6,'Masala Dosa','Crispy dosa',90,4.6,1,'https://source.unsplash.com/800x600/?masala,dosa'),(9,7,'Butter Naan','Soft naan',40,4.3,1,'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=800&q=80'),(10,8,'Tandoori Chicken','Grilled chicken',280,4.5,1,'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?auto=format&fit=crop&w=800&q=80'),(11,9,'Cold Coffee','Iced coffee',120,4.2,1,'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=800&q=80'),(12,10,'Chocolate Cake','Rich cake slice',150,4.7,1,'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=800&q=80'),(13,11,'BBQ Chicken','Barbecue chicken',350,4.6,1,'https://images.unsplash.com/photo-1558030006-450675393462?auto=format&fit=crop&w=800&q=80'),(14,12,'Grilled Fish','Fresh grilled fish',400,4.4,1,'https://images.unsplash.com/photo-1559847844-5315695dadae?auto=format&fit=crop&w=800&q=80'),(15,15,'Veg Thali','Complete meal',200,4.5,1,'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=80'),(16,1,'Egg Biryani','Flavorful egg biryani',200,4.3,1,'https://images.unsplash.com/photo-1604908176997-4319b1d45a69?w=800'),(17,1,'Chicken 65','Spicy deep fried chicken',180,4.4,1,'https://source.unsplash.com/800x600/?chicken65,fried,chicken'),(18,1,'Veg Pulao','Aromatic veg rice',170,4.1,1,'https://images.unsplash.com/photo-1596797038530-2c107229654b?auto=format&fit=crop&w=800&q=80'),(19,2,'Farmhouse Pizza','Pizza with fresh veggies',380,4.5,1,'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80'),(20,2,'Chicken Pizza','Loaded chicken pizza',420,4.6,1,'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=800&q=80'),(21,2,'Garlic Bread','Toasted garlic bread',120,4.2,1,'https://images.unsplash.com/photo-1608198093002-ad4e005484ec?auto=format&fit=crop&w=800&q=80'),(22,3,'Veg Burger','Crispy veg patty burger',140,4,1,'https://images.unsplash.com/photo-1525059696034-4967a8e1dca2?auto=format&fit=crop&w=800&q=80'),(23,3,'Chicken Burger','Grilled chicken burger',200,4.3,1,'https://images.unsplash.com/photo-1606755962773-d324e0a13086?auto=format&fit=crop&w=800&q=80'),(24,3,'French Fries','Crispy potato fries',110,4.2,1,'https://images.unsplash.com/photo-1576107232684-1279f390859f?auto=format&fit=crop&w=800&q=80'),(25,3,'Chicken Wrap','Spicy chicken wrap',160,4.1,1,'https://source.unsplash.com/800x600/?chicken,wrap'),(26,4,'Chicken Haleem','Traditional haleem',280,4.7,1,'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=800&q=80'),(27,4,'Mutton Kebab','Juicy mutton kebabs',350,4.6,1,'https://source.unsplash.com/800x600/?mutton,kebab'),(28,4,'Chicken Curry','Spicy chicken curry',260,4.4,1,'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=800&q=80'),(29,5,'Chicken Fried Rice','Chicken mixed rice',190,4.3,1,'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?auto=format&fit=crop&w=800&q=80'),(30,5,'Veg Noodles','Stir fried noodles',160,4.1,1,'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=800&q=80'),(31,5,'Chicken Manchurian','Spicy manchurian',210,4.4,1,'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=800&q=80'),(32,6,'Plain Dosa','Simple crispy dosa',70,4.2,1,'https://source.unsplash.com/800x600/?plain,dosa'),(33,6,'Onion Dosa','Dosa with onion topping',100,4.5,1,'https://source.unsplash.com/800x600/?onion,dosa'),(34,6,'Idli Sambar','Soft idli with sambar',60,4.3,1,'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?auto=format&fit=crop&w=800&q=80'),(35,6,'Vada','Crispy medu vada',50,4.4,1,'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?auto=format&fit=crop&w=800&q=80');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
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
