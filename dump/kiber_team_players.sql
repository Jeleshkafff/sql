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
-- Table structure for table `team_players`
--

DROP TABLE IF EXISTS `team_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_players` (
  `Player` int NOT NULL,
  `Team` int NOT NULL,
  `Date_of_membership` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Does_it_play` tinyint(1) NOT NULL DEFAULT '1',
  KEY `Player` (`Player`),
  KEY `Team` (`Team`),
  CONSTRAINT `team_players_ibfk_1` FOREIGN KEY (`Player`) REFERENCES `players` (`id_Players`),
  CONSTRAINT `team_players_ibfk_2` FOREIGN KEY (`Team`) REFERENCES `team` (`id_Team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_players`
--

LOCK TABLES `team_players` WRITE;
/*!40000 ALTER TABLE `team_players` DISABLE KEYS */;
INSERT INTO `team_players` VALUES (1,1,'2016-07-04 00:00:00',1),(2,1,'2017-11-06 00:00:00',1),(3,1,'2020-12-20 00:00:00',1),(4,1,'2020-01-24 00:00:00',1),(5,1,'2022-07-03 00:00:00',1),(6,2,'2020-04-05 00:00:00',1),(7,2,'2020-04-08 00:00:00',1),(8,2,'2021-02-26 00:00:00',1),(9,2,'2022-06-21 00:00:00',1),(10,2,'2022-10-10 00:00:00',1),(11,3,'2016-01-20 00:00:00',1),(12,3,'2019-09-26 00:00:00',1),(13,3,'2021-01-30 00:00:00',1),(14,3,'2021-02-15 00:00:00',1),(15,3,'2022-01-03 00:00:00',1),(16,3,'2021-03-13 00:00:00',1),(17,4,'2019-12-16 00:00:00',1),(18,4,'2019-12-16 00:00:00',1),(19,4,'2019-12-16 00:00:00',1),(20,4,'2021-10-22 00:00:00',1),(21,4,'2022-05-31 00:00:00',1),(22,4,'2022-05-31 00:00:00',1),(23,5,'2021-02-18 00:00:00',1),(24,5,'2018-10-08 00:00:00',1),(25,5,'2022-01-05 00:00:00',1),(26,5,'2022-01-05 00:00:00',1),(27,5,'2022-08-15 00:00:00',1),(28,5,'2022-01-05 00:00:00',1),(29,6,'2020-10-28 00:00:00',1),(30,6,'2019-09-30 00:00:00',1),(31,6,'2022-01-03 00:00:00',1),(32,6,'2022-08-16 00:00:00',1),(33,6,'2022-08-16 00:00:00',1),(34,6,'2022-10-29 00:00:00',1),(35,7,'2021-04-09 00:00:00',1),(36,7,'2022-01-23 00:00:00',1),(37,7,'2022-05-27 00:00:00',1),(38,7,'2022-05-27 00:00:00',1),(39,7,'2022-07-15 00:00:00',1),(40,7,'2020-01-29 00:00:00',1),(41,8,'2015-03-22 00:00:00',1),(42,8,'2018-02-05 00:00:00',1),(43,8,'2021-12-27 00:00:00',1),(44,8,'2022-01-15 00:00:00',1),(45,8,'2022-10-18 00:00:00',1),(46,8,'2022-06-20 00:00:00',1),(49,17,'2022-03-26 00:00:00',1),(50,17,'2022-11-04 00:00:00',1),(51,17,'2022-02-04 00:00:00',1),(52,18,'2020-09-09 00:00:00',0),(53,18,'2020-11-04 00:00:00',1),(54,18,'2019-04-09 00:00:00',0),(54,19,'2022-07-26 00:00:00',1),(55,19,'2019-03-15 00:00:00',1),(56,19,'2021-03-24 00:00:00',1),(57,19,'2022-07-15 00:00:00',0),(58,19,'2022-11-03 00:00:00',1),(59,20,'2020-04-28 00:00:00',1),(60,20,'2020-07-02 00:00:00',1),(61,20,'2022-05-09 00:00:00',1),(62,21,'2021-07-06 00:00:00',1),(63,21,'2021-06-01 00:00:00',1),(64,21,'2021-06-01 00:00:00',1),(65,22,'2020-12-25 00:00:00',0),(66,22,'2020-12-25 00:00:00',0),(67,22,'2021-02-18 00:00:00',0),(68,23,'2021-05-10 00:00:00',0),(69,23,'2021-05-10 00:00:00',0),(70,23,'2021-05-10 00:00:00',0),(71,24,'2020-07-13 00:00:00',0),(72,24,'2020-09-29 00:00:00',0),(73,24,'2021-07-20 00:00:00',0),(74,25,'2020-10-27 00:00:00',0),(75,25,'2020-10-27 00:00:00',0),(76,25,'2020-10-27 00:00:00',0),(77,26,'2020-11-21 00:00:00',0),(78,26,'2020-11-21 00:00:00',0),(79,26,'2021-08-03 00:00:00',0),(80,27,'2021-05-27 00:00:00',0),(81,27,'2021-05-27 00:00:00',0),(82,27,'2021-05-27 00:00:00',0),(83,28,'2019-03-05 00:00:00',1),(84,28,'2021-01-12 00:00:00',1),(85,28,'2021-05-17 00:00:00',1),(86,29,'2020-10-01 00:00:00',0),(87,29,'2020-10-01 00:00:00',0),(88,29,'2021-06-14 00:00:00',0),(89,30,'2021-03-19 00:00:00',0),(90,30,'2022-08-08 00:00:00',0),(91,30,'2021-06-14 00:00:00',0),(92,31,'2021-02-26 00:00:00',1),(93,31,'2021-02-26 00:00:00',1),(94,31,'2021-02-26 00:00:00',1),(95,32,'2021-03-20 00:00:00',1),(96,32,'2021-03-20 00:00:00',0),(97,32,'2021-03-20 00:00:00',1);
/*!40000 ALTER TABLE `team_players` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21  1:43:07
