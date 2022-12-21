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
-- Table structure for table `team_in_math`
--

DROP TABLE IF EXISTS `team_in_math`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_in_math` (
  `Team` int NOT NULL,
  `Match` int NOT NULL,
  PRIMARY KEY (`Team`,`Match`),
  KEY `Match` (`Match`),
  CONSTRAINT `team_in_math_ibfk_1` FOREIGN KEY (`Team`) REFERENCES `tournament_teams` (`Team`),
  CONSTRAINT `team_in_math_ibfk_2` FOREIGN KEY (`Match`) REFERENCES `match` (`id_Match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_in_math`
--

LOCK TABLES `team_in_math` WRITE;
/*!40000 ALTER TABLE `team_in_math` DISABLE KEYS */;
INSERT INTO `team_in_math` VALUES (5,1),(6,1),(1,2),(8,2),(3,3),(6,3),(7,4),(8,4),(6,5),(8,5),(29,7),(30,7),(27,8),(28,8),(25,9),(26,9),(23,10),(24,10),(21,11),(22,11),(19,12),(20,12),(17,13),(18,13),(31,14),(32,14),(30,15),(32,15),(25,16),(27,16),(21,17),(23,17),(18,18),(19,18),(27,19),(30,19),(19,20),(21,20),(19,21),(27,21);
/*!40000 ALTER TABLE `team_in_math` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21  9:31:33
