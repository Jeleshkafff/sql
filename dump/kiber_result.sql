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
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `Match` int NOT NULL,
  `Team` int NOT NULL,
  `win` tinyint(1) NOT NULL DEFAULT '0',
  KEY `Team` (`Team`),
  KEY `Match` (`Match`),
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`Team`) REFERENCES `team_in_math` (`Team`),
  CONSTRAINT `result_ibfk_3` FOREIGN KEY (`Match`) REFERENCES `match` (`id_Match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,5,0),(1,6,1),(2,1,0),(2,8,1),(3,3,0),(3,6,1),(4,7,0),(4,8,1),(5,6,1),(5,8,0),(14,31,0),(14,32,1),(7,29,0),(7,30,1),(8,28,0),(8,27,1),(9,26,0),(9,25,1),(10,24,0),(10,23,1),(11,22,0),(11,21,1),(12,20,0),(12,19,1),(13,18,1),(13,17,0),(15,30,1),(15,32,0),(16,27,1),(16,25,0),(17,21,1),(17,23,0),(18,18,0),(18,19,1),(19,30,0),(19,27,1),(20,21,0),(20,19,1),(21,19,0),(21,27,1);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `change_info_result` BEFORE INSERT ON `result` FOR EACH ROW BEGIN 
    DECLARE math INT UNSIGNED;
    DECLARE Team INT UNSIGNED;
    DECLARE win INT UNSIGNED;
    Set  @math = new.`Match`;
    Set  @Team = new.Team;
    Set  @win = new.win;
    IF ((select tournament.exit_game  from tournament,`match` 
		where `match`.Tournament = tournament.id_Tournament 
		and id_Match= @math group by id_Tournament )=1 )THEN
	   insert into result(`Match`,Team,win) values (@math,@Team,@win);	
end if; 
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21  1:43:09
