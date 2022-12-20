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
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id_Team` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `date_of_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_Team`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'NaVi','2009-12-17 00:00:00'),(2,'Heroic','2016-08-26 00:00:00'),(3,'FaZe Clan','2016-01-20 00:00:00'),(4,'Outsiders','2022-03-04 00:00:00'),(5,'Team Vitality','2018-10-08 00:00:00'),(6,'G2 Esports','2015-02-11 00:00:00'),(7,'OG','2019-12-04 00:00:00'),(8,'Team Liquid','2015-01-13 00:00:00'),(9,'Team Hanuman','2022-12-20 22:52:05'),(10,'Team Max KH','2022-12-20 22:53:19'),(11,'Team D-Roar.Seed','2022-12-20 22:53:19'),(12,'Team ABC','2022-12-20 22:53:19'),(13,'Team D-Roar','2022-12-20 22:53:19'),(14,'Team Skun','2022-12-20 22:53:19'),(15,'Team Giga Chat','2022-12-20 22:53:19'),(16,'Team Nakama Power','2022-12-20 22:53:19'),(17,'Magicians','2020-10-31 00:00:00'),(18,'Natus Vincere','2009-12-18 00:00:00'),(19,'Fire Beavers','2019-03-15 00:00:00'),(20,'Fenerbahçe Esports','2020-04-28 00:00:00'),(21,'Aqualix','2020-01-15 00:00:00'),(22,'Endeavour','2020-12-25 00:00:00'),(23,'Myztro Gaming','2019-02-08 00:00:00'),(24,'NEW Esports','2020-07-13 00:00:00'),(25,'789','2019-02-24 00:00:00'),(26,'UNDERRATED','2020-11-21 00:00:00'),(27,'Kungarna','2021-05-27 00:00:00'),(28,'Morning Stars','2019-03-05 00:00:00'),(29,'Orgless and Hungry','2020-10-01 00:00:00'),(30,'MajorPushers','2020-01-26 00:00:00'),(31,'Forg Gang','2021-02-26 00:00:00'),(32,'SCARZ','2019-09-28 00:00:00');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21  1:43:10
