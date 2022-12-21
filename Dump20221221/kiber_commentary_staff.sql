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
-- Table structure for table `commentary_staff`
--

DROP TABLE IF EXISTS `commentary_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentary_staff` (
  ` employee_code` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `patronymic` varchar(30) DEFAULT NULL,
  `Speciality` int NOT NULL,
  `Nickname` varchar(45) NOT NULL,
  PRIMARY KEY (` employee_code`),
  UNIQUE KEY `Nickname_UNIQUE` (`Nickname`),
  KEY `Speciality` (`Speciality`),
  CONSTRAINT `commentary_staff_ibfk_1` FOREIGN KEY (`Speciality`) REFERENCES `speciality` (`id_Speciality`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentary_staff`
--

LOCK TABLES `commentary_staff` WRITE;
/*!40000 ALTER TABLE `commentary_staff` DISABLE KEYS */;
INSERT INTO `commentary_staff` VALUES (1,'Freya ','Spiers',NULL,4,'Freya'),(2,'Jason ','O\'Toole',NULL,1,'moses '),(3,'Harry ','Russell',NULL,1,'JustHarry'),(4,'Conner ','Girvan',NULL,1,'Scrawny '),(5,'Mohan ','Govindasamy',NULL,1,'launders'),(6,'James','Banks',NULL,5,'James Banks'),(7,'Mads ','Pedersen',NULL,5,'CouldBeMassive'),(8,'Mathieu ','Quiquerez',NULL,2,'Maniac '),(9,'Danny ','Hsieh',NULL,2,'Mahone '),(10,'Jacob ','Winneche',NULL,2,'Pimp '),(11,'Markus ','Eliasen',NULL,3,'Pinqu'),(12,'Jake ','Karakouzian',NULL,3,'zarx'),(13,'Marko ','Krajčeski',NULL,3,'shev'),(14,'Bastian ','Faber',NULL,3,'UnknownFME'),(24,'Kate ','Yeager',NULL,6,'Kate Yeager'),(25,'Mark ','Hatcher',NULL,7,'Onset '),(26,'Dan ','Gaskin',NULL,7,'Gaskin'),(27,'Conner ','Girvan',NULL,7,'Scrawny'),(28,'Will ','Marks',NULL,3,'bear'),(29,'Emil ','Nachtweij',NULL,3,'Ansvar'),(30,'Michał ','Warchał',NULL,3,'Warchawk'),(31,'Alexis','Barbannaud',NULL,3,'Science');
/*!40000 ALTER TABLE `commentary_staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21  9:31:35
