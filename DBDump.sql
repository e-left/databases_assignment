-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: Formula1DB
-- ------------------------------------------------------
-- Server version	8.2.0

DROP SCHEMA IF EXISTS `Formula1DB`;
CREATE SCHEMA `Formula1DB`;
USE `Formula1DB`;

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
-- Table structure for table `circuit`
--

DROP TABLE IF EXISTS `circuit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuit` (
  `id` int unsigned NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `track_distance` int unsigned DEFAULT NULL,
  `num_of_drs_zones` int unsigned DEFAULT NULL,
  `lap_record` time DEFAULT NULL,
  `elevation` float(5,2) unsigned DEFAULT NULL,
  `num_of_turns` int unsigned DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuit`
--

LOCK TABLES `circuit` WRITE;
/*!40000 ALTER TABLE `circuit` DISABLE KEYS */;
INSERT INTO `circuit` VALUES (1,'Red Bull Ring',4318,3,'01:06:01',63.50,10,'Austria','Spielberg'),(2,'Hungaroring',4381,2,'01:17:00',34.60,14,'Hungary','Budapest'),(3,'Silverstone Circuit',5891,2,'01:27:00',11.30,18,'UK','Silverstone'),(4,'Circuit de Barcelona-Catalunya',4655,2,'01:18:00',19.60,16,'Spain','Barcelona'),(5,'Circuit of Spa-Francorchamps',7004,2,'01:46:00',102.20,19,'Belgium','Spa-Francorchamps'),(6,'Autodromo Nazionale Monza',5793,2,'01:21:00',12.80,11,'Italy','Monza'),(7,'Autodromo Enzo e Dino Ferrari',4909,1,'01:13:01',34.40,19,'Italy','Imola');
/*!40000 ALTER TABLE `circuit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int unsigned NOT NULL,
  `website` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'https://www.petronas.com/'),(2,'https://www.teamviewer.com/'),(3,'https://www.iwc.com/'),(4,'https://www.bybit.com/'),(5,'https://www.tagheuer.com/'),(6,'https://crypto.com/'),(7,'https://www.tiktok.com/'),(8,'https://www.whatsapp.com/');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company-sponsors-team`
--

DROP TABLE IF EXISTS `company-sponsors-team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company-sponsors-team` (
  `company_id` int unsigned NOT NULL,
  `team_id` int unsigned NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`team_id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `company_id_for_companySponsorsTeam` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `team_id_for_companySponsorsTeam` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company-sponsors-team`
--

LOCK TABLES `company-sponsors-team` WRITE;
/*!40000 ALTER TABLE `company-sponsors-team` DISABLE KEYS */;
INSERT INTO `company-sponsors-team` VALUES (1,1,'Oil Provider'),(2,1,'Monetary'),(3,1,'Watches'),(4,3,'Monetary'),(5,3,'Watches'),(6,6,'Monetary'),(7,6,'Monetary'),(8,2,'Oil Provider');
/*!40000 ALTER TABLE `company-sponsors-team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `id` int unsigned NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `weight` int unsigned DEFAULT NULL,
  `salary` float(11,2) unsigned DEFAULT NULL,
  `team_id` int unsigned DEFAULT NULL,
  `age` int GENERATED ALWAYS AS (((to_days(_utf8mb4'20231213') - to_days(`birthday`)) / 365)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `team_id_for_driver` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` (`id`, `first_name`, `last_name`, `gender`, `country`, `city`, `birthday`, `height`, `weight`, `salary`, `team_id`) VALUES (1,'Lewis Carl Davidson','Hamilton','Male','UK','Stevenage','1985-01-07',174,73,35000000.00,1),(2,'Michael','Schumacher','Male','Germany','Hermulheim','1969-01-03',174,75,50000000.00,1),(3,'Ayrton','Senna','Male','Brazil','Sao Paolo','1960-03-21',176,65,20000000.00,5),(4,'Alain','Prost','Male','France','Lorette','1955-02-24',165,68,2200000.00,5),(5,'Sebastian','Vettel','Male','Germany','Heppenheim','1987-07-03',175,62,16000000.00,3),(6,'Fernando','Alonso','Male','Spain','Oviedo','1981-07-29',171,68,5000000.00,6),(7,'Niki','Lauda','Male','Austria','Vienna','1949-02-22',175,65,20000000.00,2),(8,'Max Emilian','Verstappen','Male','Belgium','Hasselt','1997-09-30',181,72,55000000.00,3);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver-ranks-race`
--

DROP TABLE IF EXISTS `driver-ranks-race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver-ranks-race` (
  `race_number` int unsigned NOT NULL,
  `year` year NOT NULL,
  `driver_id` int unsigned NOT NULL,
  `position` int unsigned DEFAULT NULL,
  `points` int GENERATED ALWAYS AS ((case when (`position` = 1) then 25 else (case when (`position` = 2) then 18 else (case when (`position` = 3) then 15 else (case when (`position` = 4) then 12 else (case when (`position` = 5) then 10 else (case when (`position` = 6) then 8 else (case when (`position` = 7) then 6 else (case when (`position` = 8) then 4 else (case when (`position` = 9) then 2 else (case when (`position` = 10) then 1 else 0 end) end) end) end) end) end) end) end) end) end)) STORED,
  PRIMARY KEY (`race_number`,`year`,`driver_id`),
  KEY `year_idx` (`year`),
  KEY `driver_id_idx` (`driver_id`),
  CONSTRAINT `driver_id_for_driverRanksRace` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `race_number_for_driverRanksRace` FOREIGN KEY (`race_number`) REFERENCES `race` (`race_number`),
  CONSTRAINT `year_for_driverRanksRace` FOREIGN KEY (`year`) REFERENCES `season` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver-ranks-race`
--

LOCK TABLES `driver-ranks-race` WRITE;
/*!40000 ALTER TABLE `driver-ranks-race` DISABLE KEYS */;
INSERT INTO `driver-ranks-race` (`race_number`, `year`, `driver_id`, `position`) VALUES (1,2020,1,1),(2,2022,2,2),(3,2016,4,1),(4,2019,4,2),(9,2021,1,1),(10,2020,3,3),(12,2021,2,4);
/*!40000 ALTER TABLE `driver-ranks-race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_lap`
--

DROP TABLE IF EXISTS `driver_lap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_lap` (
  `lap_number` int unsigned NOT NULL,
  `lap_time` time DEFAULT NULL,
  `tyre_age` int unsigned DEFAULT NULL,
  `tyre_compound` enum('C0','C1','C2','C3','C4','I','W') DEFAULT NULL,
  `is_valid` bit(1) DEFAULT NULL,
  `is_under_sc` bit(1) DEFAULT NULL,
  `race_number` int unsigned NOT NULL,
  `year` year NOT NULL,
  `driver_id` int unsigned NOT NULL,
  PRIMARY KEY (`lap_number`,`race_number`,`year`,`driver_id`),
  KEY `race_number_idx` (`race_number`),
  KEY `year_idx` (`year`),
  KEY `driver_id_idx` (`driver_id`),
  CONSTRAINT `driver_id_for_driverLap` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `race_number_for_driverLap` FOREIGN KEY (`race_number`) REFERENCES `race` (`race_number`),
  CONSTRAINT `year_for_driverLap` FOREIGN KEY (`year`) REFERENCES `season` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_lap`
--

LOCK TABLES `driver_lap` WRITE;
/*!40000 ALTER TABLE `driver_lap` DISABLE KEYS */;
INSERT INTO `driver_lap` VALUES (42,'01:17:00',5,'C2',_binary '',_binary '\0',2,2022,3),(50,'01:06:01',12,'C2',_binary '',_binary '\0',2,2016,1),(58,'01:13:01',2,'I',_binary '',_binary '',1,2022,3),(63,'01:46:00',0,'C4',_binary '\0',_binary '\0',10,2020,2),(63,'01:21:00',20,'C0',_binary '',_binary '\0',12,2021,4),(69,'01:27:00',1,'W',_binary '',_binary '',3,2016,4),(71,'01:18:00',0,'C3',_binary '\0',_binary '\0',4,2019,1);
/*!40000 ALTER TABLE `driver_lap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `drivers_with_teams`
--

DROP TABLE IF EXISTS `drivers_with_teams`;
/*!50001 DROP VIEW IF EXISTS `drivers_with_teams`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `drivers_with_teams` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `salary`,
 1 AS `team_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `official`
--

DROP TABLE IF EXISTS `official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `official` (
  `id` int unsigned NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `circuit_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`,`circuit_id`),
  KEY `circuit_id_idx` (`circuit_id`),
  CONSTRAINT `circuits_id_for_official` FOREIGN KEY (`circuit_id`) REFERENCES `circuit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official`
--

LOCK TABLES `official` WRITE;
/*!40000 ALTER TABLE `official` DISABLE KEYS */;
INSERT INTO `official` VALUES (31,'Female','Olivia','Mercer','1990-04-15','Australia','Sydney','Paddock Coordinator',2),(32,'Male','Adrian','Ramirez','1988-09-23','Mexico','Mexico City','Track Marshall',2),(33,'Male','Harper','Thompson','1995-11-07','Canada','Vancouver','Pit Lane Marshall',4),(34,'Other','Elijah','Foster','1987-06-12','Ireland','Dublin','Communications Director',5),(35,'Female','Maya','Rodriguez','1993-02-28','Egypt','Cairo','Medical Delegate',5),(36,'Male','Owen','Mitchell','1989-08-05','Turkey','Istanbul','Track Marshall',1),(37,'Male','Luke','Reynolds','1992-12-20','USA','Miami','Track Marshall',3);
/*!40000 ALTER TABLE `official` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `officials_roles`
--

DROP TABLE IF EXISTS `officials_roles`;
/*!50001 DROP VIEW IF EXISTS `officials_roles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `officials_roles` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `role`,
 1 AS `circuit_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `race_number` int unsigned NOT NULL,
  `sc_brand` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `num_of_laps` int unsigned DEFAULT NULL,
  `tyre_compounds` set('C0','C1','C2','C3','C4','I','W') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `year` year NOT NULL,
  `weather_id` int unsigned DEFAULT NULL,
  `circuit_id` int unsigned DEFAULT NULL,
  `fastest_lap_driver_id` int unsigned DEFAULT NULL,
  `driver_of_the_day_id` int unsigned DEFAULT NULL,
  `fastest_lap_time` time DEFAULT NULL,
  PRIMARY KEY (`race_number`,`year`),
  KEY `year_idx` (`year`),
  KEY `weather_id_idx` (`weather_id`),
  KEY `circuit_id_idx` (`circuit_id`),
  KEY `fastest_lap_driver_id_idx` (`fastest_lap_driver_id`),
  KEY `driver_of_the_day_id_idx` (`driver_of_the_day_id`),
  CONSTRAINT `circuit_id_for_race` FOREIGN KEY (`circuit_id`) REFERENCES `circuit` (`id`),
  CONSTRAINT `driver_of_the_day_id_for_race` FOREIGN KEY (`driver_of_the_day_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `fastest_lap_driver_id_for_race` FOREIGN KEY (`fastest_lap_driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `weather_id_for_race` FOREIGN KEY (`weather_id`) REFERENCES `weather` (`id`),
  CONSTRAINT `year_for_race` FOREIGN KEY (`year`) REFERENCES `season` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (1,'AMG','Austrian GP',71,'C2,C3,C4','2020-05-07','15:00:00','16:30:00',2020,1,1,1,4,'01:15:00'),(2,'AMG','Austrian GP',69,'C0,C1,C2','2022-04-22','15:00:00','16:30:00',2022,2,1,1,5,'01:18:01'),(3,'AMG','Emilia Romagna GP',50,'C2,C3,C4,I,W','2016-09-10','10:00:00','11:30:00',2016,3,7,1,4,'01:16:00'),(4,'AMG','Hungarian GP',52,'C2,C3,C4','2019-08-03','11:00:00','12:30:00',2019,4,2,1,3,'01:43:00'),(9,'Aston Martin','Austrian GP',59,'I,W','2021-05-07','15:00:00','16:30:00',2021,7,1,3,1,'01:27:00'),(10,'AMG','British GP',67,'C2,C3,C4','2020-04-16','12:00:00','13:30:00',2020,5,3,2,5,'01:32:01'),(12,'AMG','British GP',55,'C2,C3,C4','2021-03-15','12:00:00','13:30:00',2021,6,3,3,6,'01:05:01');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `race_results`
--

DROP TABLE IF EXISTS `race_results`;
/*!50001 DROP VIEW IF EXISTS `race_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `race_results` AS SELECT 
 1 AS `race_number`,
 1 AS `year`,
 1 AS `driver_of_the_day_id`,
 1 AS `fastest_lap_driver_id`,
 1 AS `fastest_lap_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `races_with_circuit_and_weather`
--

DROP TABLE IF EXISTS `races_with_circuit_and_weather`;
/*!50001 DROP VIEW IF EXISTS `races_with_circuit_and_weather`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `races_with_circuit_and_weather` AS SELECT 
 1 AS `race_number`,
 1 AS `year`,
 1 AS `name`,
 1 AS `date`,
 1 AS `circuit_name`,
 1 AS `country`,
 1 AS `city`,
 1 AS `temperature`,
 1 AS `humidity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `year` year NOT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (2016),(2017),(2018),(2019),(2020),(2021),(2022),(2023);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `season_standing`
--

DROP TABLE IF EXISTS `season_standing`;
/*!50001 DROP VIEW IF EXISTS `season_standing`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `season_standing` AS SELECT 
 1 AS `year`,
 1 AS `driver_id`,
 1 AS `driver_points`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `team_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `season_winner_drivers`
--

DROP TABLE IF EXISTS `season_winner_drivers`;
/*!50001 DROP VIEW IF EXISTS `season_winner_drivers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `season_winner_drivers` AS SELECT 
 1 AS `year`,
 1 AS `driver_id`,
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `season_winner_teams`
--

DROP TABLE IF EXISTS `season_winner_teams`;
/*!50001 DROP VIEW IF EXISTS `season_winner_teams`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `season_winner_teams` AS SELECT 
 1 AS `year`,
 1 AS `team_id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sponsors_with_teams_count`
--

DROP TABLE IF EXISTS `sponsors_with_teams_count`;
/*!50001 DROP VIEW IF EXISTS `sponsors_with_teams_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sponsors_with_teams_count` AS SELECT 
 1 AS `company_id`,
 1 AS `sponsored_teams_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int unsigned NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Mercedes AMG Petronas F1','Toto','Wolff','Brackley','UK'),(2,'Scuderia Ferrari','Mattia','Binotto','Maranello','Italy'),(3,'Red Bull Racing','Christian','Horner','Milton Keynes','UK'),(4,'Scuderia Alpha Tauri','Marko','Helmut','Faenza','Italy'),(5,'Williams F1 Team','James','Vowles','Grove','UK'),(6,'Aston Martin F1 Team','Mike','Krack','Silverstone','UK'),(7,'Alfa Romeo F1 Team','Alessandro','Alunni Bravi','Zurich','Switzerland');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team-competes-season`
--

DROP TABLE IF EXISTS `team-competes-season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team-competes-season` (
  `team_id` int unsigned NOT NULL,
  `season_year` year NOT NULL,
  `car_ name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`team_id`,`season_year`),
  KEY `season_year_idx` (`season_year`),
  CONSTRAINT `season_year_for_teamCompetesSeason` FOREIGN KEY (`season_year`) REFERENCES `season` (`year`),
  CONSTRAINT `team_id_for_teamCompetesSeason` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team-competes-season`
--

LOCK TABLES `team-competes-season` WRITE;
/*!40000 ALTER TABLE `team-competes-season` DISABLE KEYS */;
INSERT INTO `team-competes-season` VALUES (1,2020,'W11 EQ Performance'),(2,2020,'SF1000'),(3,2020,'RB16'),(4,2020,'AT01'),(5,2020,'FW43'),(6,2021,'AMR2021'),(7,2020,'C39');
/*!40000 ALTER TABLE `team-competes-season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `teams_with_total_drivers_and_total_sponsors`
--

DROP TABLE IF EXISTS `teams_with_total_drivers_and_total_sponsors`;
/*!50001 DROP VIEW IF EXISTS `teams_with_total_drivers_and_total_sponsors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teams_with_total_drivers_and_total_sponsors` AS SELECT 
 1 AS `name`,
 1 AS `city`,
 1 AS `country`,
 1 AS `number_of_drivers`,
 1 AS `number_of_sponsors`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `id` int unsigned NOT NULL,
  `temperature` float(5,2) DEFAULT NULL,
  `conditions` enum('Sunny','Cloudy','Rainy','Snowy') DEFAULT NULL,
  `humidity` decimal(5,2) unsigned DEFAULT NULL,
  `speed` float(5,2) unsigned DEFAULT NULL,
  `direction` enum('NE','N','W','NW','SE','E','S','SW') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (1,22.45,'Sunny',65.75,10.20,'NW'),(2,18.92,'Cloudy',72.40,8.75,'N'),(3,12.60,'Rainy',80.15,6.90,'NW'),(4,1.75,'Snowy',90.20,3.50,'NW'),(5,27.80,'Sunny',58.20,12.45,'SE'),(6,14.30,'Cloudy',75.80,7.25,'E'),(7,5.10,'Rainy',85.30,4.80,'S');
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `drivers_with_teams`
--

/*!50001 DROP VIEW IF EXISTS `drivers_with_teams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `drivers_with_teams` AS select `driver`.`first_name` AS `first_name`,`driver`.`last_name` AS `last_name`,`driver`.`salary` AS `salary`,`team`.`name` AS `team_name` from (`driver` join `team` on((`driver`.`team_id` = `team`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `officials_roles`
--

/*!50001 DROP VIEW IF EXISTS `officials_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `officials_roles` AS select `official`.`first_name` AS `first_name`,`official`.`last_name` AS `last_name`,`official`.`role` AS `role`,`circuit`.`name` AS `circuit_name` from (`official` join `circuit` on((`official`.`circuit_id` = `circuit`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `race_results`
--

/*!50001 DROP VIEW IF EXISTS `race_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `race_results` AS select `race`.`race_number` AS `race_number`,`race`.`year` AS `year`,`race`.`driver_of_the_day_id` AS `driver_of_the_day_id`,`race`.`fastest_lap_driver_id` AS `fastest_lap_driver_id`,`race`.`fastest_lap_time` AS `fastest_lap_time` from `race` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `races_with_circuit_and_weather`
--

/*!50001 DROP VIEW IF EXISTS `races_with_circuit_and_weather`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `races_with_circuit_and_weather` AS select `race`.`race_number` AS `race_number`,`race`.`year` AS `year`,`race`.`name` AS `name`,`race`.`date` AS `date`,`circuit`.`name` AS `circuit_name`,`circuit`.`country` AS `country`,`circuit`.`city` AS `city`,`weather`.`temperature` AS `temperature`,`weather`.`humidity` AS `humidity` from ((`race` join `circuit` on((`race`.`circuit_id` = `circuit`.`id`))) join `weather` on((`race`.`weather_id` = `weather`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `season_standing`
--

/*!50001 DROP VIEW IF EXISTS `season_standing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `season_standing` AS select `S`.`year` AS `year`,`driver`.`id` AS `driver_id`,`S`.`driver_points` AS `driver_points`,`driver`.`first_name` AS `first_name`,`driver`.`last_name` AS `last_name`,`driver`.`team_id` AS `team_id` from ((select `driver-ranks-race`.`year` AS `year`,`driver-ranks-race`.`driver_id` AS `driver_id`,sum(`driver-ranks-race`.`points`) AS `driver_points` from `driver-ranks-race` group by `driver-ranks-race`.`year`,`driver-ranks-race`.`driver_id`) `S` join `driver` on((`S`.`driver_id` = `driver`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `season_winner_drivers`
--

/*!50001 DROP VIEW IF EXISTS `season_winner_drivers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `season_winner_drivers` AS select `season_standing`.`year` AS `year`,`season_standing`.`driver_id` AS `driver_id`,`season_standing`.`first_name` AS `first_name`,`season_standing`.`last_name` AS `last_name` from (`season_standing` join (select `season_standing`.`year` AS `year`,max(`season_standing`.`driver_points`) AS `max_points` from `season_standing` group by `season_standing`.`year`) `T` on(((`season_standing`.`driver_points` = `T`.`max_points`) and (`season_standing`.`year` = `T`.`year`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `season_winner_teams`
--

/*!50001 DROP VIEW IF EXISTS `season_winner_teams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `season_winner_teams` AS select `R`.`year` AS `year`,`R`.`team_id` AS `team_id`,`team`.`name` AS `name` from ((select `S`.`year` AS `year`,`S`.`team_id` AS `team_id` from ((select `season_standing`.`year` AS `year`,`season_standing`.`team_id` AS `team_id`,sum(`season_standing`.`driver_points`) AS `team_points` from `season_standing` group by `season_standing`.`year`,`season_standing`.`team_id`) `S` join (select `S`.`year` AS `year`,max(`S`.`team_points`) AS `max_points` from (select `season_standing`.`year` AS `year`,`season_standing`.`team_id` AS `team_id`,sum(`season_standing`.`driver_points`) AS `team_points` from `season_standing` group by `season_standing`.`year`,`season_standing`.`team_id`) `S` group by `S`.`year`) `T` on(((`S`.`year` = `T`.`year`) and (`S`.`team_points` = `T`.`max_points`))))) `R` join `team` on((`R`.`team_id` = `team`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sponsors_with_teams_count`
--

/*!50001 DROP VIEW IF EXISTS `sponsors_with_teams_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sponsors_with_teams_count` AS select `A`.`company_id` AS `company_id`,count(0) AS `sponsored_teams_count` from (select `company`.`id` AS `id`,`company`.`website` AS `website`,`company-sponsors-team`.`company_id` AS `company_id`,`company-sponsors-team`.`team_id` AS `team_id` from (`company` join `company-sponsors-team` on((`company`.`id` = `company-sponsors-team`.`company_id`)))) `A` group by `A`.`company_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teams_with_total_drivers_and_total_sponsors`
--

/*!50001 DROP VIEW IF EXISTS `teams_with_total_drivers_and_total_sponsors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teams_with_total_drivers_and_total_sponsors` AS select `team`.`name` AS `name`,`team`.`city` AS `city`,`team`.`country` AS `country`,count(distinct `driver`.`id`) AS `number_of_drivers`,count(distinct `company-sponsors-team`.`company_id`) AS `number_of_sponsors` from ((`team` left join `driver` on((`team`.`id` = `driver`.`team_id`))) left join `company-sponsors-team` on((`team`.`id` = `company-sponsors-team`.`team_id`))) group by `team`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 12:31:36
