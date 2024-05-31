-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: water_supply
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `domanda`
--

DROP TABLE IF EXISTS `domanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domanda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posizione` int(11) DEFAULT NULL,
  `testo` text DEFAULT NULL,
  `is_int` tinyint(1) DEFAULT NULL,
  `questionario_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domanda_questionario_id_fk` (`questionario_fk`),
  CONSTRAINT `domanda_questionario_id_fk` FOREIGN KEY (`questionario_fk`) REFERENCES `questionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domanda`
--

LOCK TABLES `domanda` WRITE;
/*!40000 ALTER TABLE `domanda` DISABLE KEYS */;
INSERT INTO `domanda` VALUES (1,1,'How many hours per day do you have access to water?',1,1),(2,2,'How satisfied are you with the quality of your water supply? (1-7)',1,1),(3,3,'How often do you experience interruptions in your water supply? (times per week)',1,1),(4,4,'On a scale of 1 to 7, how would you rate the taste of your tap water?',1,1),(5,5,'Do you use any filtration system for your drinking water?',0,1),(6,6,'How would you rate on a scale of 1 to 7 the price-quality ratio of your water supply?',1,1),(7,7,'How would you rate the safety of your water supply? (1-7)',1,1),(8,8,'What is the main source of your water supply?',0,1),(9,9,'Have you experienced any water contamination issues in the past year?',0,1),(10,10,'What improvements would you like to see in your water supply system?',0,1);
/*!40000 ALTER TABLE `domanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionario`
--

DROP TABLE IF EXISTS `questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `durata_gg` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionario`
--

LOCK TABLES `questionario` WRITE;
/*!40000 ALTER TABLE `questionario` DISABLE KEYS */;
INSERT INTO `questionario` VALUES (1,'Water Supply','2024-05-20',30);
/*!40000 ALTER TABLE `questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risposta`
--

DROP TABLE IF EXISTS `risposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ris_int` int(11) DEFAULT NULL,
  `ris_text` text DEFAULT NULL,
  `utente_fk` int(11) DEFAULT NULL,
  `domanda_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risposta_domanda_id_fk` (`domanda_fk`),
  KEY `risposta_utente_id_fk` (`utente_fk`),
  CONSTRAINT `risposta_domanda_id_fk` FOREIGN KEY (`domanda_fk`) REFERENCES `domanda` (`id`),
  CONSTRAINT `risposta_utente_id_fk` FOREIGN KEY (`utente_fk`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risposta`
--

LOCK TABLES `risposta` WRITE;
/*!40000 ALTER TABLE `risposta` DISABLE KEYS */;
INSERT INTO `risposta` VALUES (54,5,NULL,1,1),(55,4,NULL,1,2),(56,4,NULL,1,3),(57,4,NULL,1,4),(58,NULL,'S',1,5),(59,4,NULL,1,6),(60,4,NULL,1,7),(61,NULL,'S',1,8),(62,NULL,'S',1,9),(63,NULL,'S',1,10),(64,3,NULL,3,1),(65,7,NULL,3,2),(66,2,NULL,3,3),(67,7,NULL,3,4),(68,NULL,'No',3,5),(69,7,NULL,3,6),(70,7,NULL,3,7),(71,NULL,'River',3,8),(72,NULL,'No',3,9),(73,NULL,'Better taste',3,10),(74,5,NULL,4,1),(75,6,NULL,4,2),(76,1,NULL,4,3),(77,7,NULL,4,4),(78,NULL,'Yes',4,5),(79,7,NULL,4,6),(80,7,NULL,4,7),(81,NULL,'Well',4,8),(82,NULL,'Yes',4,9),(83,NULL,'More supply',4,10),(84,4,NULL,5,1),(85,7,NULL,5,2),(86,3,NULL,5,3),(87,7,NULL,5,4),(88,NULL,'No',5,5),(89,7,NULL,5,6),(90,7,NULL,5,7),(91,NULL,'Spring',5,8),(92,NULL,'No',5,9),(93,NULL,'Lower cost',5,10),(94,6,NULL,6,1),(95,5,NULL,6,2),(96,4,NULL,6,3),(97,7,NULL,6,4),(98,NULL,'Yes',6,5),(99,7,NULL,6,6),(100,7,NULL,6,7),(101,NULL,'Municipal',6,8),(102,NULL,'Yes',6,9),(103,NULL,'Consistent supply',6,10),(104,4,NULL,7,1),(105,7,NULL,7,2),(106,2,NULL,7,3),(107,7,NULL,7,4),(108,NULL,'No',7,5),(109,7,NULL,7,6),(110,7,NULL,7,7),(111,NULL,'River',7,8),(112,NULL,'No',7,9),(113,NULL,'Better taste',7,10),(114,5,NULL,8,1),(115,6,NULL,8,2),(116,1,NULL,8,3),(117,7,NULL,8,4),(118,NULL,'Yes',8,5),(119,7,NULL,8,6),(120,7,NULL,8,7),(121,NULL,'Well',8,8),(122,NULL,'Yes',8,9),(123,NULL,'More supply',8,10),(124,4,NULL,9,1),(125,7,NULL,9,2),(126,3,NULL,9,3),(127,7,NULL,9,4),(128,NULL,'No',9,5),(129,7,NULL,9,6),(130,7,NULL,9,7),(131,NULL,'Spring',9,8),(132,NULL,'No',9,9),(133,NULL,'Lower cost',9,10),(134,6,NULL,10,1),(135,5,NULL,10,2),(136,4,NULL,10,3),(137,7,NULL,10,4),(138,NULL,'Yes',10,5),(139,7,NULL,10,6),(140,7,NULL,10,7),(141,NULL,'Municipal',10,8),(142,NULL,'Yes',10,9),(143,NULL,'Consistent supply',10,10),(144,4,NULL,11,1),(145,7,NULL,11,2),(146,2,NULL,11,3),(147,7,NULL,11,4),(148,NULL,'No',11,5),(149,7,NULL,11,6),(150,7,NULL,11,7),(151,NULL,'River',11,8),(152,NULL,'No',11,9),(153,NULL,'Better taste',11,10),(154,5,NULL,12,1),(155,6,NULL,12,2),(156,1,NULL,12,3),(157,7,NULL,12,4),(158,NULL,'Yes',12,5),(159,7,NULL,12,6),(160,7,NULL,12,7),(161,NULL,'Well',12,8),(162,NULL,'Yes',12,9),(163,NULL,'More supply',12,10),(164,4,NULL,13,1),(165,7,NULL,13,2),(166,3,NULL,13,3),(167,7,NULL,13,4),(168,NULL,'No',13,5),(169,7,NULL,13,6),(170,7,NULL,13,7),(171,NULL,'Spring',13,8),(172,NULL,'No',13,9),(173,NULL,'Lower cost',13,10),(174,6,NULL,14,1),(175,5,NULL,14,2),(176,4,NULL,14,3),(177,7,NULL,14,4),(178,NULL,'Yes',14,5),(179,7,NULL,14,6),(180,7,NULL,14,7),(181,NULL,'Municipal',14,8),(182,NULL,'Yes',14,9),(183,NULL,'Consistent supply',14,10),(184,4,NULL,15,1),(185,7,NULL,15,2),(186,2,NULL,15,3),(187,7,NULL,15,4),(188,NULL,'No',15,5),(189,7,NULL,15,6),(190,7,NULL,15,7),(191,NULL,'River',15,8),(192,NULL,'No',15,9),(193,NULL,'Better taste',15,10),(194,5,NULL,16,1),(195,6,NULL,16,2),(196,1,NULL,16,3),(197,7,NULL,16,4),(198,NULL,'Yes',16,5),(199,7,NULL,16,6),(200,7,NULL,16,7),(201,NULL,'Well',16,8),(202,NULL,'Yes',16,9),(203,NULL,'More supply',16,10),(204,4,NULL,17,1),(205,7,NULL,17,2),(206,3,NULL,17,3),(207,7,NULL,17,4),(208,NULL,'No',17,5),(209,7,NULL,17,6),(210,7,NULL,17,7),(211,NULL,'Spring',17,8),(212,NULL,'No',17,9),(213,NULL,'Lower cost',17,10),(214,6,NULL,18,1),(215,5,NULL,18,2),(216,4,NULL,18,3),(217,7,NULL,18,4),(218,NULL,'Yes',18,5),(219,7,NULL,18,6),(220,7,NULL,18,7),(221,NULL,'Municipal',18,8),(222,NULL,'Yes',18,9),(223,NULL,'Consistent supply',18,10),(224,4,NULL,19,1),(225,7,NULL,19,2),(226,2,NULL,19,3),(227,7,NULL,19,4),(228,NULL,'No',19,5),(229,7,NULL,19,6),(230,7,NULL,19,7),(231,NULL,'River',19,8),(232,NULL,'No',19,9),(233,NULL,'Better taste',19,10),(234,5,NULL,20,1),(235,6,NULL,20,2),(236,1,NULL,20,3),(237,7,NULL,20,4),(238,NULL,'Yes',20,5),(239,7,NULL,20,6),(240,7,NULL,20,7),(241,NULL,'Well',20,8),(242,NULL,'Yes',20,9),(243,NULL,'More supply',20,10),(244,4,NULL,21,1),(245,7,NULL,21,2),(246,3,NULL,21,3),(247,7,NULL,21,4),(248,NULL,'No',21,5),(249,7,NULL,21,6),(250,7,NULL,21,7),(251,NULL,'Spring',21,8),(252,NULL,'No',21,9),(253,NULL,'Lower cost',21,10),(254,6,NULL,22,1),(255,5,NULL,22,2),(256,4,NULL,22,3),(257,7,NULL,22,4),(258,NULL,'Yes',22,5),(259,7,NULL,22,6),(260,7,NULL,22,7),(261,NULL,'Municipal',22,8),(262,NULL,'Yes',22,9),(263,NULL,'Consistent supply',22,10);
/*!40000 ALTER TABLE `risposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `indirizzo` varchar(30) DEFAULT NULL,
  `CAP` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Water Eco','noancheno9@gmail.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Via Mario Romolo 34','25079'),(2,'Safe Hydration','safehydrations@gmail.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Via dei Santi 9','25080'),(3,'User1','user1@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 1','10001'),(4,'User2','user2@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 2','10002'),(5,'User3','user3@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 3','10003'),(6,'User4','user4@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 4','10004'),(7,'User5','user5@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 5','10005'),(8,'User6','user6@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 6','10006'),(9,'User7','user7@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 7','10007'),(10,'User8','user8@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 8','10008'),(11,'User9','user9@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 9','10009'),(12,'User10','user10@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 10','10010'),(13,'User11','user11@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 11','10011'),(14,'User12','user12@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 12','10012'),(15,'User13','user13@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 13','10013'),(16,'User14','user14@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 14','10014'),(17,'User15','user15@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 15','10015'),(18,'User16','user16@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 16','10016'),(19,'User17','user17@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 17','10017'),(20,'User18','user18@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 18','10018'),(21,'User19','user19@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 19','10019'),(22,'User20','user20@example.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Address 20','10020');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31  9:14:10
