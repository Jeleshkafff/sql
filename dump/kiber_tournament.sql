-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: kiber
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `id_Tournament` int NOT NULL AUTO_INCREMENT,
  `Discipline` int NOT NULL,
  `date_of_beginning` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `End_date` datetime NOT NULL,
  `Organization` int NOT NULL,
  `Count_team` int NOT NULL DEFAULT '0',
  `exit_game` tinyint(1) NOT NULL DEFAULT '0',
  `Venue` int DEFAULT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Tournament`),
  KEY `Discipline` (`Discipline`),
  KEY `Organization` (`Organization`),
  KEY `Venue` (`Venue`),
  CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`Discipline`) REFERENCES `discipline` (`id`),
  CONSTRAINT `tournament_ibfk_3` FOREIGN KEY (`Organization`) REFERENCES `organization` (`id`),
  CONSTRAINT `tournament_ibfk_4` FOREIGN KEY (`Venue`) REFERENCES `venue` (`id_venue`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (1,1,'2022-12-14 00:00:00','2022-12-18 00:00:00',1,8,1,1,0,'BLAST Premier: World Final 2022'),(2,2,'2022-12-01 00:00:00','2022-12-18 00:00:01',2,0,1,NULL,1,'D-Roar x Dota 2 League'),(3,3,'2021-07-31 00:00:00','2021-08-01 00:00:00',1,16,0,NULL,1,'BLAST Titans - Arenas');
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21  1:43:02
