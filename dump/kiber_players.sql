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
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id_Players` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Nickname` varchar(40) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Country` int NOT NULL,
  PRIMARY KEY (`id_Players`),
  UNIQUE KEY `Nickname` (`Nickname`),
  KEY `Country` (`Country`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`Country`) REFERENCES `country` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Sasha ','s1mple','Kostyliev','1997-10-02',2),(2,'Denis ','electronic','Sharipov','1998-09-02',1),(3,'Valerii ','b1t','Vakhovskyi','2003-01-05',2),(4,'Ilya ','Perfecto','Zalutskiy','1999-11-24',1),(5,'Viktor','sdy','Orudzhev','1997-03-14',2),(6,'Casper','cadiaN','Møller','1995-06-26',3),(7,'René','TeSeS','Madsen','2000-12-12',3),(8,'Rasmus','sjuush','Beck','1999-01-03',3),(9,'Jakob','Jabbi','Nygaard','2003-06-23',3),(10,'Kristian','k0nfig','Wienecke','1997-04-19',3),(11,'Håvard','rain','Liset ','1994-08-27',4),(12,'Helvijs','broky','Saukants','2001-02-14',5),(13,'Russel','Twistzz','Dulken','1999-11-14',6),(14,'Finn ','karrigan','Andersen','1990-04-14',3),(15,'Robin','ropz','Kool','1999-12-22',7),(16,'Robert','RobbaN','Dahlström','1985-01-05',8),(17,'Aleksei','Qikert','Golubev','1999-01-01',9),(18,'Dastan','dastan','Aqbaev','1993-08-05',9),(19,'Dzhami','Jame','Ali','1998-05-23',1),(20,'Evgeniy','FL1T','Lebedev','2000-12-21',1),(21,'David','n0rb3r7','Daniyelyan','2001-03-11',1),(22,'Pyotr','fame','Bolyshev','2003-03-03',1),(23,'Dan','apEX','Madesclaire','1993-02-22',10),(24,'Mathieu','ZywOo','Herbaut','2000-11-09',10),(25,'Peter','dupreeh','Rothmann ','1993-03-26',3),(26,'Emil','Magisk','Hoffmann ','1998-03-05',3),(27,'Lotan','Spinx','Giladi','2000-09-13',11),(28,'Danny','zonic','Selim ','1986-07-30',3),(29,'Nikola','NiKo','Kovač','1997-02-16',12),(30,'Nemanja','huNter-','Kovač','1996-01-03',12),(31,'Ilya','m0NESY','Osipov','2005-05-01',1),(32,'Justin','jks','Savage','1995-12-12',13),(33,'Rasmus','HooXi','Nielsen','1995-05-21',3),(34,'Jan','Swani','Müller','1995-03-13',14),(35,'Shahar','flameZ','Shushan','2003-07-22',11),(36,'Nemanja','nexa','Isaković','1997-04-25',15),(37,'Adam','NEOFRAG','Zouhar','2001-05-19',16),(38,'Maciej','F1KU','Miklas','2003-05-29',17),(39,'Abdulkhalik','degster','Gasanov','2001-07-21',1),(40,'Casper','ruggah','Due','1988-09-01',3),(41,'Jonathan','EliGE','David ','1997-07-16',18),(42,'Keith','NAF','Markovic','1997-08-24',6),(43,'Joshua','oSee','Ohm','1999-05-31',18),(44,'Nicholas','nitr0','Cannella','1995-08-16',18),(45,'Mareks','YEKINDAR','Gaļinskis','1999-10-04',5),(46,'Damian','daps','Steele','1993-07-29',6),(49,'David','dsblf','Khachapuridze','1993-02-01',1),(50,'Alexey','Maliwan','Rusinov','1998-03-22',1),(51,'Vladimir','7ozzzus','Vorotilov','2003-08-06',1),(52,'Maksym','Max-Strafe','Stadniuk','1996-06-07',2),(53,'Herman','Nesh','Kobrin','1996-06-26',14),(54,'Nikita','clawz','Marchinsky','1998-03-31',22),(55,'Kirill','9impulse','Kostiv','1999-10-31',22),(56,'Lev','taskmast33r','Grigoriev','1999-01-29',1),(57,'Danila','Sunset','Soloviov','2001-07-06',1),(58,'Svyatoslav','ojrein','Korochinsky','2001-01-20',1),(59,'Alperen','lDraconiaN','Mehmet ','1998-10-11',20),(60,'Umut','PinkyFinkyTinky','Zeytünlü','1998-10-11',20),(61,'Gökhan','Cathryan','Saral','1993-09-28',20),(62,'Casper Emil','Gnaske','Præstensgaard','2001-06-23',3),(63,'Matthew','SirDel','Biggins','2000-07-12',23),(64,'Oscar Jiang','Yuki','Ming-liang','1995-11-19',23),(65,'Brynn','brynn','Crompton ','2001-09-04',23),(66,'Jamie','Blasts','Levine','2003-03-12',23),(67,'Cameron','Noiises','Walker','1999-07-07',23),(68,'Oleksander','Sanya','Bokuchava','2002-01-05',2),(69,'Anatoly','Wrugb','Belousov','1995-11-27',1),(70,'Dmytro','Xron','Sakharuk','1996-03-08',2),(71,'Francisco Miguel','k4shera','Nogueira Alves','1998-06-03',24),(72,'Rafael da','PostKiLL','Silva Jesus','1998-09-23',24),(73,'Denis','Denzaay','Brendstrup','1998-09-23',17),(74,'Aleksandr','believerxk','Voytov','2000-03-26',1),(75,'Elvira','Esdesu','Temirova','1996-04-13',1),(76,'Anton','xaniya','Shkuratov','1999-07-29',1),(77,'Elwin','KSWINNIIE','Echeveria','1995-07-07',10),(78,'Joshua','Dazoh','Alston Davis','2001-06-25',23),(79,'Jake','jaazzaz','Lock','2000-08-04',23),(80,'Martin','Graceful','Wongphrom ','1994-03-16',8),(81,'Jake','Jmw','Walters','1998-11-16',23),(82,'Rasmus','maydeelol','Zettergren','1997-03-21',8),(83,'Federico','Nisa','Portolani','1995-08-10',25),(84,'Ruggero','Mox600','Mossenta','1997-01-23',25),(85,'Roger','Mask','Boni','1997-01-23',25),(86,'Matej ','MaTaFe','Fekonja','1995-05-29',26),(87,'Juho','Silta','Sillanpää','1998-10-19',27),(88,'Oliver','Badoli','Kurtuldu','2000-09-29',3),(89,'Kirill','RANCHES','Rulin','1998-09-01',1),(90,'Artem','fitoo','Ivanov','1998-05-24',1),(91,'None','Togetherq','None','1998-05-24',1),(92,'Jordan ','Legitlolly','Matthews','1999-01-08',23),(93,'Kai van','Faenex','Duppen','1997-04-26',28),(94,'Romain','row','Daly','1997-04-26',10),(95,'Dan ','rpr','Ušić','1996-08-07',29),(96,'Mikkel Halle ','Mande','Hestbek','1997-08-11',3),(97,'Can','Taisheen','Öztürk','2000-07-20',14);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21  1:43:12
