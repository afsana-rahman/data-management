-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: users
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `adminuser` varchar(255) NOT NULL,
  `adminpass` varchar(255) NOT NULL,
  PRIMARY KEY (`adminuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('admin','admin'),('admin105','admin105');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraft_id` varchar(20) NOT NULL,
  PRIMARY KEY (`aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('111'),('117'),('123'),('2448'),('321'),('3211'),('4142'),('4759'),('731'),('7348'),('9573');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airline_id` varchar(2) NOT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('AA'),('DA'),('FA'),('HA'),('JB');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_id` varchar(50) NOT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('Frankfurt Airport'),('Haneda Airport'),('Istanbul Airport'),('JFK Airport'),('OHare Airport');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerreps`
--

DROP TABLE IF EXISTS `customerreps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerreps` (
  `repuser` varchar(255) NOT NULL,
  `reppass` varchar(255) NOT NULL,
  PRIMARY KEY (`repuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `customerreps`
--

LOCK TABLES `customerreps` WRITE;
/*!40000 ALTER TABLE `customerreps` DISABLE KEYS */;
INSERT INTO `customerreps` VALUES ('CBing','bird'),('JTribbiani','panda'),('MGeller','zebra'),('RGeller','monkey'),('RGreen','dog');
/*!40000 ALTER TABLE `customerreps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('ARahman','cookies and creme','Afsana','Rahman'),('AWu','vanilla','Aileen','Wu'),('DBandu','chocolate','Divya','Bandu'),('FOcean','coffee','Frank','Ocean'),('GSalas','mint chip','Gloria','Salas');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `airline_id` varchar(20) NOT NULL,
  `aircraft_id` varchar(20) NOT NULL,
  `airport_id` varchar(50) NOT NULL,
  `departure_airport` varchar(50) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_airport` varchar(50) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `triptype` varchar(20) DEFAULT NULL,
  `num_stops` int DEFAULT NULL,
  `econ_price` int DEFAULT NULL,
  `business_price` int DEFAULT NULL,
  `firstclass_price` int DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`airline_id`,`aircraft_id`,`departure_date`),
  KEY `arrival_airport` (`arrival_airport`),
  KEY `aircraft_id` (`aircraft_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES ('AA','111','JFK Airport','JFK Airport','2021-12-29','00:03:00','Istanbul Airport','2021-12-30','00:21:00','one way',1,9823,10299,12003,0),('DA','321','Istanbul Airport','Istanbul Airport','2021-12-25','00:12:00','Haneda Airport','2021-12-25','00:20:00','round trip',2,4367,5987,7923,1),('HA','123','JFK Airport','JFK Airport','2021-12-19','00:09:00','Haneda Airport','2021-12-19','00:21:00','one way',1,9823,10299,12003,0),('JB','117','JFK Airport','JFK Airport','2021-12-09','00:09:00','OHare Airport','2021-12-09','00:21:00','one way',0,9823,10299,12003,1),('JB','117','JFK Airport','JFK Airport','2021-12-29','00:04:00','Frankfurt Airport','2021-12-30','00:11:00','one way',0,111,34242,1232,1);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `qa`
--

DROP TABLE IF EXISTS `qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa` (
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `qa`
--

LOCK TABLES `qa` WRITE;
/*!40000 ALTER TABLE `qa` DISABLE KEYS */;
INSERT INTO `qa` VALUES ('How long is flight from la to istand bull',NULL),('This is a test question.',NULL);
/*!40000 ALTER TABLE `qa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `username` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `airline_id` varchar(20) NOT NULL,
  `aircraft_id` varchar(20) NOT NULL,
  `departure_airport` varchar(50) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_airport` varchar(50) NOT NULL,
  `class` varchar(20) NOT NULL,
  `seat_number` int NOT NULL,
  `totalfare` int NOT NULL,
  `triptype` varchar(20) DEFAULT NULL,
  `ticket_id` varchar(20) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `airline_id` (`airline_id`),
  KEY `aircraft_id` (`aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('AWu','Aileen','Wu','HA','111','JFK Airport','2021-12-29','00:03:00','Istanbul Airport','Economy',103,3923,'round trip','1'),('ARahman','Afsana','Rahman','AA','321','Haneda Airport','2021-12-23','00:18:00','JFK Airport','Business Class',281,5923,'round trip','2'),('DBandu','Divya','Bandu','DA','123','OHare Airport','2021-12-19','00:12:00','JFK Airport','Economy',922,8923,'round trip','3'),('GSalas','Gloria','Salas','AA','117','Frankfurt Airport','2021-12-20','00:06:00','OHareAirport','First Class',543,14923,'one way','4'),('ARahman','Afsana','Rahman','DA','123','JFK Airport','2022-01-10','01:00:00','OHare Airport','Business Class',8,9432,'one way','5');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitinglist` (
  `username` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `airline_id` varchar(20) NOT NULL,
  `aircraft_id` varchar(20) NOT NULL,
  `departure_airport` varchar(50) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_airport` varchar(50) NOT NULL,
  `class` varchar(20) NOT NULL,
  `triptype` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `fare` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
--
-- Dumping data for table `waitinglist`
--

LOCK TABLES `waitinglist` WRITE;
/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
INSERT INTO `waitinglist` VALUES ('AWu','Aileen','Wu','AA','111','JFK Airport','2021-12-29','00:03:00','Istanbul Airport','null','null',0,NULL);
/*!40000 ALTER TABLE `waitinglist` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2021-12-10 16:58:36
