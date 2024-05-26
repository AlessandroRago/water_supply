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
INSERT INTO `domanda` VALUES (1,1,'How many hours per day do you have access to water?',1,1),(2,2,'How satisfied are you with the quality of your water supply? (1-10)',1,1),(3,3,'How often do you experience interruptions in your water supply? (times per week)',1,1),(4,4,'On a scale of 1 to 10, how would you rate the taste of your tap water?',1,1),(5,5,'Do you use any filtration system for your drinking water?',0,1),(6,6,'How much do you pay for water per month? (in currency)',1,1),(7,7,'How often do you receive your water bill? (times per year)',1,1),(8,8,'What is the main source of your water supply?',0,1),(9,9,'Have you experienced any water contamination issues in the past year?',0,1),(10,10,'What improvements would you like to see in your water supply system?',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risposta`
--

LOCK TABLES `risposta` WRITE;
/*!40000 ALTER TABLE `risposta` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Water Eco','noancheno9@gmail.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Via Mario Romolo 34','25079'),(2,'Safe Hydration','safehydration@gmail.com','$2y$10$LjKJfIV7eFpMUQq/ALD5N..3ul9bZN.5B/58Y/cKHxuA4CuVcp4Ai','Via dei Santi 9','25080');
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

-- Dump completed on 2024-05-26 22:08:44
