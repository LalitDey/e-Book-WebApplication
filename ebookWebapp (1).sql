-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ebook-webapp
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `bookdetails`
--

DROP TABLE IF EXISTS `bookdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookdetails` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookdetails`
--

LOCK TABLES `bookdetails` WRITE;
/*!40000 ALTER TABLE `bookdetails` DISABLE KEYS */;
INSERT INTO `bookdetails` VALUES (54,'tfyiuy','bhkl,gh','123','New Book','Active','passport.jpeg','admin');
/*!40000 ALTER TABLE `bookdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookorder`
--

DROP TABLE IF EXISTS `bookorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookorder` (
  `id` int NOT NULL,
  `oder_id` varchar(455) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(505) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `book_name` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookorder`
--

LOCK TABLES `bookorder` WRITE;
/*!40000 ALTER TABLE `bookorder` DISABLE KEYS */;
INSERT INTO `bookorder` VALUES (14,'BOOK-ORD-00449','lalitdey','lalit@gmail.com','bchhak,B.Chaak,BPD,odisha,757086','23333','General Knowledge 2022','Manohar Pandey ','35.0','COD','2021-07-18 15:09:05','on-the-way'),(15,'BOOK-ORD-00861','lalitdey','lalit@gmail.com','bchhak,B.Chaak,BPD,odisha,757086','23333','Panchatantra','Om Books Editorial Team','300.0','COD','2021-07-18 15:09:05','on-the-way'),(16,'BOOK-ORD-00649','lalitdey','lalit@gmail.com','bchhak,B.Chaak,BPD,odisha,757086','23333','Treasure Island','Treasure Island','299.0','COD','2021-07-18 15:09:05','on-the-way'),(17,'BOOK-ORD-00389','lalitdey','lalit@gmail.com','bchhak,B.Chaak,BPD,odisha,757086','23333','Chacha Chaudhary and Surgical Strike','Pran','95.0','COD','2021-07-18 15:09:05','on-the-way'),(18,'BOOK-ORD-00798','lalitdey','lalit@gmail.com',',,,,','23333','Panchatantra','Om Books Editorial Team','300.0','COD','2021-07-18 15:09:05','on-the-way'),(19,'BOOK-ORD-00502','LND','1234@gmail.com',',,,,','9583911973','C++','Balagurusamy','399.0','COD','2021-07-18 15:09:05','on-the-way'),(20,'BOOK-ORD-00646','lalitnarayan','1234@gmail.com','BLR,blr,BLR,Karnataka,854667','9583911973','Treasure Island','Treasure Island','299.0','COD','2021-07-18 15:09:05','on-the-way'),(21,'BOOK-ORD-00320','LND','1234@gmail.com','DC,dc,dc,dc,123456','9583911973','Chacha Chaudhary and Surgical Strike','Pran','95.0','COD','2021-07-18 15:09:05','on-the-way'),(22,'BOOK-ORD-00275','Ld','1234@gmail.com','yrdrf,fdssg,gsrxfx,fdxdsg,123456','9583911973','Treasure Island','Treasure Island','299.0','COD','2021-07-18 15:10:15','on-the-way'),(23,'BOOK-ORD-00113','lalitdey','lalit@gmail.com','Bangriposi,Bus stand,B.Posi,Odisha,757032','9583911973','General Knowledge 2022','Manohar Pandey ','35.0','COD','2021-07-25 07:38:38','on-the-way'),(24,'BOOK-ORD-00536','lalitdey','lalit@gmail.com','syj,cxfgj,dj,dgj,dfj','9583911973','General Knowledge 2022','Manohar Pandey ','35.0','COD','2021-07-27 08:51:23','on-the-way'),(25,'BOOK-ORD-00352','lalitdey','lalit@gmail.com','syj,cxfgj,dj,dgj,dfj','9583911973','Panchatantra','Om Books Editorial Team','400.0','COD','2021-07-27 08:51:23','on-the-way'),(26,'BOOK-ORD-00840','lalitdey','lalit@gmail.com','syj,cxfgj,dj,dgj,dfj','9583911973','Java','Balagurusamy','599.0','COD','2021-07-27 08:51:23','on-the-way'),(27,'BOOK-ORD-00504','lalitdey','lalit@gmail.com','steh,ryjhej,dtyujtyed,dyjdtry,123456','9583911973','General Knowledge 2022','Manohar Pandey ','35.0','COD','2021-08-03 06:52:03','on-the-way'),(28,'BOOK-ORD-00287','lalitdey','lalit@gmail.com','steh,ryjhej,dtyujtyed,dyjdtry,123456','9583911973','Treasure Island','Treasure Island','299.0','COD','2021-08-03 06:52:03','on-the-way'),(29,'BOOK-ORD-00649','lalitdey','lalit@gmail.com','steh,ryjhej,dtyujtyed,dyjdtry,123456','9583911973','Panchatantra','Om Books Editorial Team','400.0','COD','2021-08-03 06:52:03','on-the-way'),(30,'BOOK-ORD-00662','lalitdey','lalit@gmail.com','steh,ryjhej,dtyujtyed,dyjdtry,123456','9583911973','General Knowledge 2022','Manohar Pandey ','35.0','COD','2021-08-03 06:52:03','on-the-way');
/*!40000 ALTER TABLE `bookorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (93,34,14,'Treasure Island','Treasure Island',299,299),(132,54,11,'tfyiuy','bhkl,gh',123,123);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contactId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (4,'lalit','dey','lalit@gmail.com','Hello, You need to be an valid user.'),(5,'hup;hio','bjkljkl','xcfujdyhjds@gma','bjhljkju');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `landmark` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'Lalitnarayan Dey','lalitnarayandey@gmail.com','7978294594','password',NULL,NULL,NULL,NULL,NULL),(11,'lalitdey','lalit@gmail.com','9583911973','1234',NULL,NULL,NULL,NULL,NULL),(12,'Biswajit Kumar Dey','biswjitkumardey@gmail.com','9583911973','Lalit99@',NULL,NULL,NULL,NULL,NULL),(14,'LalitNarayanDey','12345@gmail.com','9583911973','12345',NULL,NULL,NULL,NULL,NULL),(41,'Jeet','jeet@gmail.com','9683911972','lalit99@',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ebook-webapp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-07 10:52:24
