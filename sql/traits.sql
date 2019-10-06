-- MySQL dump 10.16  Distrib 10.2.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dspdb
-- ------------------------------------------------------
-- Server version	10.2.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `traits`
--

DROP TABLE IF EXISTS `traits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traits` (
  `traitid` tinyint(3) unsigned NOT NULL,
  `name` text NOT NULL,
  `job` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(2) unsigned NOT NULL DEFAULT 99,
  `rank` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `modifier` smallint(5) unsigned NOT NULL DEFAULT 0,
  `value` smallint(5) NOT NULL DEFAULT 0,
  `content_tag` varchar(7) DEFAULT NULL,
  `meritid` smallint(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`traitid`,`job`,`level`,`rank`,`modifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traits`
--
-- ORDER BY:  `traitid`,`job`,`level`,`rank`,`modifier`

LOCK TABLES `traits` WRITE;
/*!40000 ALTER TABLE `traits` DISABLE KEYS */;
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,10,1,25,10,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,10,1,26,10,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,30,2,25,22,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,30,2,26,22,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,50,3,25,35,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,50,3,26,35,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,70,4,25,48,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,70,4,26,48,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,86,5,25,60,'ABYSSEA',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',11,86,5,26,60,'ABYSSEA',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',14,30,1,25,10,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',14,30,1,26,10,NULL,0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',14,50,2,25,22,'TOAU',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',14,50,2,26,22,'TOAU',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',14,78,3,25,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',14,78,3,26,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',19,30,1,25,10,'WOTG',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',19,30,1,26,10,'WOTG',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',19,60,2,25,22,'WOTG',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',19,60,2,26,22,'WOTG',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',19,80,3,25,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (1,'accuracy bonus',19,80,3,26,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',6,10,1,68,10,NULL,0);
INSERT INTO `traits` VALUES (2,'evasion bonus',6,30,2,68,22,NULL,0);
INSERT INTO `traits` VALUES (2,'evasion bonus',6,50,3,68,35,NULL,0);
INSERT INTO `traits` VALUES (2,'evasion bonus',6,70,4,68,48,NULL,0);
INSERT INTO `traits` VALUES (2,'evasion bonus',6,76,5,68,60,'ABYSSEA',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',6,88,6,68,72,'ABYSSEA',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',18,20,1,68,10,'TOAU',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',18,40,2,68,22,'TOAU',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',18,60,3,68,35,'TOAU',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',18,76,4,68,48,'TOAU',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',19,15,1,68,10,'WOTG',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',19,45,2,68,22,'WOTG',0);
INSERT INTO `traits` VALUES (2,'evasion bonus',19,75,3,68,35,'WOTG',0);
INSERT INTO `traits` VALUES (3,'attack bonus',1,30,1,23,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',1,30,1,24,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',1,65,2,23,22,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',1,65,2,24,22,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',1,90,3,23,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',1,90,3,24,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,10,1,23,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,10,1,24,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,30,2,23,22,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,30,2,24,22,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,50,3,23,35,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,50,3,24,35,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,70,4,23,48,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,70,4,24,48,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,76,5,23,60,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,76,5,24,60,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,83,6,23,72,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,83,6,24,72,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,91,7,23,84,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,91,7,24,84,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,99,8,23,96,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',8,99,8,24,96,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,15,1,23,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,15,1,24,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,35,2,23,22,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,35,2,24,22,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,55,3,23,35,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,55,3,24,35,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,75,4,23,48,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',10,75,4,24,48,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',14,10,1,23,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',14,10,1,24,10,NULL,0);
INSERT INTO `traits` VALUES (3,'attack bonus',14,91,2,23,22,'ABYSSEA',0);
INSERT INTO `traits` VALUES (3,'attack bonus',14,91,2,24,22,'ABYSSEA',0);
INSERT INTO `traits` VALUES (4,'defense bonus',1,10,1,1,10,NULL,0);
INSERT INTO `traits` VALUES (4,'defense bonus',1,45,2,1,22,NULL,0);
INSERT INTO `traits` VALUES (4,'defense bonus',1,86,3,1,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (4,'defense bonus',7,10,1,1,10,NULL,0);
INSERT INTO `traits` VALUES (4,'defense bonus',7,30,2,1,22,NULL,0);
INSERT INTO `traits` VALUES (4,'defense bonus',7,50,3,1,35,NULL,0);
INSERT INTO `traits` VALUES (4,'defense bonus',7,70,4,1,48,NULL,0);
INSERT INTO `traits` VALUES (4,'defense bonus',7,76,5,1,60,'ABYSSEA',0);
INSERT INTO `traits` VALUES (4,'defense bonus',7,91,6,1,72,'ABYSSEA',0);
INSERT INTO `traits` VALUES (4,'defense bonus',10,15,1,1,10,NULL,0);
INSERT INTO `traits` VALUES (4,'defense bonus',10,55,2,1,22,NULL,0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',4,10,1,28,20,NULL,0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',4,30,2,28,24,NULL,0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',4,50,3,28,28,NULL,0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',4,70,4,28,32,NULL,0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',4,81,5,28,36,'ABYSSEA',0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',4,91,6,28,40,'ABYSSEA',0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',5,20,1,28,20,NULL,0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',5,40,2,28,24,NULL,0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',5,86,3,28,28,'ABYSSEA',0);
INSERT INTO `traits` VALUES (5,'magic atk. bonus',13,15,1,28,20,NULL,0); -- NIN MAB
INSERT INTO `traits` VALUES (5,'magic atk. bonus',13,45,2,28,24,NULL,0); -- NIN MAB
INSERT INTO `traits` VALUES (5,'magic atk. bonus',13,90,3,28,28,NULL,0); -- NIN MAB
INSERT INTO `traits` VALUES (6,'magic def. bonus',3,10,1,29,10,NULL,0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',3,30,2,29,12,NULL,0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',3,50,3,29,14,NULL,0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',3,70,4,29,16,NULL,0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',3,81,5,29,18,'ABYSSEA',0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',3,91,6,29,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',5,25,1,29,10,NULL,0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',5,45,2,29,12,NULL,0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',5,96,3,29,14,'ABYSSEA',0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',22,10,1,29,10,'SOA',0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',22,30,2,29,12,'SOA',0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',22,50,3,29,14,'SOA',0);
INSERT INTO `traits` VALUES (6,'magic def. bonus',22,70,4,29,16,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',1,30,1,2,30,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',1,50,2,2,60,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',1,70,3,2,120,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',1,90,4,2,180,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',2,15,1,2,30,NULL,0);
INSERT INTO `traits` VALUES (7,'max hp boost',2,35,2,2,60,NULL,0);
INSERT INTO `traits` VALUES (7,'max hp boost',2,55,3,2,120,NULL,0);
INSERT INTO `traits` VALUES (7,'max hp boost',2,70,4,2,180,NULL,0);
INSERT INTO `traits` VALUES (7,'max hp boost',2,86,5,2,240,'ABYSSEA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',2,96,6,2,300,'ABYSSEA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',7,45,1,2,30,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',7,85,2,2,60,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',13,20,1,2,30,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',13,40,2,2,60,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',13,60,3,2,120,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',13,80,4,2,180,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',13,99,5,2,240,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',22,20,1,2,30,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',22,40,2,2,60,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',22,60,3,2,120,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',22,80,4,2,180,'SOA',0);
INSERT INTO `traits` VALUES (7,'max hp boost',22,99,5,2,240,'SOA',0);
INSERT INTO `traits` VALUES (8,'max mp boost',15,10,1,5,10,NULL,0);
INSERT INTO `traits` VALUES (8,'max mp boost',15,30,2,5,20,NULL,0);
INSERT INTO `traits` VALUES (8,'max mp boost',15,50,3,5,40,NULL,0);
INSERT INTO `traits` VALUES (8,'max mp boost',15,70,4,5,60,NULL,0);
INSERT INTO `traits` VALUES (8,'max mp boost',15,76,5,5,80,'ABYSSEA',0);
INSERT INTO `traits` VALUES (8,'max mp boost',15,96,6,5,100,'ABYSSEA',0);
INSERT INTO `traits` VALUES (8,'max mp boost',20,30,1,5,10,'WOTG',0);
INSERT INTO `traits` VALUES (8,'max mp boost',20,88,2,5,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (8,'max mp boost',21,30,1,5,10,'SOA',0);
INSERT INTO `traits` VALUES (8,'max mp boost',21,60,2,5,20,'SOA',0);
INSERT INTO `traits` VALUES (9,'auto regen',3,25,1,370,1,NULL,0);
INSERT INTO `traits` VALUES (9,'auto regen',3,76,2,370,2,'ABYSSEA',0);
INSERT INTO `traits` VALUES (9,'auto regen',22,35,1,370,1,'SOA',0);
INSERT INTO `traits` VALUES (9,'auto regen',22,65,2,370,2,'SOA',0);
INSERT INTO `traits` VALUES (10,'auto refresh',7,35,1,369,1,NULL,0);  -- PLD Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',15,20,1,369,1,NULL,0); -- SMN Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',3,30,1,369,1,NULL,0); -- WHM Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',4,30,1,369,1,NULL,0); -- BLM Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',5,30,1,369,1,NULL,0); -- RDM Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',21,35,1,369,1,NULL,0); -- GEO Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',22,50,1,369,1,'SOA',0); -- RUN Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',8,40,1,369,1,'SOA',0); -- DRK Auto Ref
INSERT INTO `traits` VALUES (10,'auto refresh',15,55,2,369,2,'ABYSSEA',0);  -- SMN Auto Ref II
INSERT INTO `traits` VALUES (11,'rapid shot',11,15,1,359,10,NULL,0);
INSERT INTO `traits` VALUES (11,'rapid shot',17,15,1,359,10,'TOAU',0);
INSERT INTO `traits` VALUES (12,'fast cast',5,15,1,170,10,NULL,0);
INSERT INTO `traits` VALUES (12,'fast cast',5,35,2,170,15,NULL,0);
INSERT INTO `traits` VALUES (12,'fast cast',5,55,3,170,20,NULL,0);
INSERT INTO `traits` VALUES (12,'fast cast',5,76,4,170,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (12,'fast cast',5,89,5,170,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (12,'fast cast',13,30,1,170,10,NULL,0); -- NIN 'fast cast' I

INSERT INTO `traits` VALUES (12,'fast cast',13,70,2,170,15,NULL,0); -- NIN 'fast cast' II
INSERT INTO `traits` VALUES (12,'fast cast',7,40,1,170,10,NULL,0); -- PLD 'fast cast' I
INSERT INTO `traits` VALUES (12,'fast cast',7,75,2,170,15,NULL,0); -- PLD 'fast cast' II
INSERT INTO `traits` VALUES (13,'conserve mp',4,20,1,296,25,NULL,0);
INSERT INTO `traits` VALUES (13,'conserve mp',4,76,2,296,28,'ABYSSEA',0);
INSERT INTO `traits` VALUES (13,'conserve mp',4,86,3,296,31,'ABYSSEA',0);
INSERT INTO `traits` VALUES (13,'conserve mp',20,25,1,296,25,'WOTG',0);
INSERT INTO `traits` VALUES (13,'conserve mp',21,10,1,296,25,'SOA',0);
INSERT INTO `traits` VALUES (13,'conserve mp',21,25,2,296,28,'SOA',0);
INSERT INTO `traits` VALUES (13,'conserve mp',21,40,3,296,31,'SOA',0);
INSERT INTO `traits` VALUES (13,'conserve mp',21,55,4,296,34,'SOA',0);
INSERT INTO `traits` VALUES (13,'conserve mp',21,70,5,296,37,'SOA',0);
INSERT INTO `traits` VALUES (14,'store tp',12,10,1,73,10,NULL,0);
INSERT INTO `traits` VALUES (14,'store tp',12,30,2,73,15,NULL,0);
INSERT INTO `traits` VALUES (14,'store tp',12,50,3,73,20,NULL,0);
INSERT INTO `traits` VALUES (14,'store tp',12,70,4,73,25,NULL,0);
INSERT INTO `traits` VALUES (14,'store tp',12,90,5,73,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (15,'double attack',1,25,1,288,10,NULL,0);
INSERT INTO `traits` VALUES (15,'double attack',1,50,2,288,12,NULL,0);
INSERT INTO `traits` VALUES (15,'double attack',1,75,3,288,14,NULL,0);
INSERT INTO `traits` VALUES (15,'double attack',1,85,4,288,16,'ABYSSEA',0);
INSERT INTO `traits` VALUES (15,'double attack',1,99,5,288,18,'ABYSSEA',0);
INSERT INTO `traits` VALUES (16,'triple attack',6,55,1,302,5,NULL,0);
INSERT INTO `traits` VALUES (16,'triple attack',6,95,2,302,6,'ABYSSEA',0);
INSERT INTO `traits` VALUES (17,'counter',2,10,1,291,8,NULL,0);
INSERT INTO `traits` VALUES (17,'counter',2,81,2,291,12,'ABYSSEA',0);
INSERT INTO `traits` VALUES (18,'dual wield',6,83,1,259,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (18,'dual wield',6,90,2,259,15,'ABYSSEA',0);
INSERT INTO `traits` VALUES (18,'dual wield',6,98,3,259,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (18,'dual wield',13,10,1,259,10,NULL,0);
INSERT INTO `traits` VALUES (18,'dual wield',13,25,2,259,15,NULL,0);
INSERT INTO `traits` VALUES (18,'dual wield',13,45,3,259,25,NULL,0);
INSERT INTO `traits` VALUES (18,'dual wield',13,65,4,259,30,NULL,0);
INSERT INTO `traits` VALUES (18,'dual wield',13,85,5,259,35,NULL,0);
INSERT INTO `traits` VALUES (18,'dual wield',19,20,1,259,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (18,'dual wield',19,40,2,259,15,'ABYSSEA',0);
INSERT INTO `traits` VALUES (18,'dual wield',19,60,3,259,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (18,'dual wield',19,80,4,259,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (19,'treasure hunter',6,15,1,303,1,NULL,0);
INSERT INTO `traits` VALUES (20,'gilfinder',6,5,1,897,50,NULL,0);
INSERT INTO `traits` VALUES (21,'alertness',11,5,1,0,0,NULL,0);
INSERT INTO `traits` VALUES (22,'stealth',13,5,1,358,3,NULL,0);

INSERT INTO `traits` VALUES (23,'martial arts',2,1,1,173,80,NULL,0);
INSERT INTO `traits` VALUES (23,'martial arts',2,16,2,173,100,NULL,0);
INSERT INTO `traits` VALUES (23,'martial arts',2,31,3,173,120,NULL,0);
INSERT INTO `traits` VALUES (23,'martial arts',2,46,4,173,140,NULL,0);
INSERT INTO `traits` VALUES (23,'martial arts',2,61,5,173,160,NULL,0);
INSERT INTO `traits` VALUES (23,'martial arts',2,75,6,173,180,NULL,0);
INSERT INTO `traits` VALUES (23,'martial arts',2,82,7,173,200,'ABYSSEA',0);
INSERT INTO `traits` VALUES (23,'martial arts',18,25,1,173,80,'TOAU',0);
INSERT INTO `traits` VALUES (23,'martial arts',18,50,2,173,100,'TOAU',0);
INSERT INTO `traits` VALUES (23,'martial arts',18,75,3,173,120,'TOAU',0);
INSERT INTO `traits` VALUES (23,'martial arts',18,87,4,173,140,'ABYSSEA',0);
INSERT INTO `traits` VALUES (23,'martial arts',18,97,5,173,160,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',3,20,1,71,3,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',3,35,2,71,6,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',3,50,3,71,9,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',3,50,3,295,1,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',3,65,4,71,12,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',3,80,5,71,15,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',3,80,5,295,2,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',3,96,6,71,18,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',3,96,6,295,3,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',4,15,1,71,3,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',4,30,2,71,6,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',4,45,3,71,9,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',4,45,3,295,1,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',4,60,4,71,12,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',4,75,5,71,15,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',4,75,5,295,2,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',4,96,6,71,18,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',4,96,6,295,3,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',5,31,1,71,3,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',5,53,2,71,6,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',5,75,3,71,9,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',5,75,3,295,1,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',5,91,4,71,12,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',5,91,4,295,1,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',15,15,1,71,3,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',15,30,2,71,6,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',15,45,3,71,9,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',15,45,3,295,1,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',15,60,4,71,12,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',15,70,5,71,15,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',15,70,5,295,2,NULL,0);
INSERT INTO `traits` VALUES (24,'clear mind',15,91,6,71,18,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',15,91,6,295,3,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,20,1,71,3,'WOTG',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,35,2,71,6,'WOTG',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,50,3,71,9,'WOTG',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,50,3,295,1,'WOTG',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,65,4,71,12,'WOTG',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,76,5,71,15,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,76,5,295,2,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,96,6,71,18,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',20,96,6,295,3,'ABYSSEA',0);
INSERT INTO `traits` VALUES (24,'clear mind',21,20,1,71,3,'SOA',0);
INSERT INTO `traits` VALUES (24,'clear mind',21,40,2,71,6,'SOA',0);
INSERT INTO `traits` VALUES (24,'clear mind',21,60,3,71,9,'SOA',0);
INSERT INTO `traits` VALUES (24,'clear mind',21,60,3,295,1,'SOA',0);
INSERT INTO `traits` VALUES (25,'shield mastery',1,80,1,485,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (25,'shield mastery',1,87,2,485,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (25,'shield mastery',1,94,3,485,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (25,'shield mastery',5,87,1,485,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (25,'shield mastery',5,97,2,485,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (25,'shield mastery',7,25,1,485,10,NULL,0);
INSERT INTO `traits` VALUES (25,'shield mastery',7,50,2,485,20,NULL,0);
INSERT INTO `traits` VALUES (25,'shield mastery',7,75,3,485,30,NULL,0);
INSERT INTO `traits` VALUES (25,'shield mastery',7,96,4,485,40,'ABYSSEA',0);
INSERT INTO `traits` VALUES (32,'beast killer',9,70,1,230,8,NULL,0);
INSERT INTO `traits` VALUES (33,'plantoid killer',9,60,1,229,8,NULL,0);
INSERT INTO `traits` VALUES (34,'vermin killer',9,10,1,224,8,NULL,0);
INSERT INTO `traits` VALUES (35,'lizard killer',9,40,1,227,8,NULL,0);
INSERT INTO `traits` VALUES (36,'bird killer',9,20,1,225,8,NULL,0);
INSERT INTO `traits` VALUES (37,'amorph killer',9,30,1,226,8,NULL,0);
INSERT INTO `traits` VALUES (38,'aquan killer',9,50,1,228,8,NULL,0);
INSERT INTO `traits` VALUES (39,'undead killer',7,5,1,231,8,NULL,0);
INSERT INTO `traits` VALUES (39,'undead killer',7,86,2,231,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (41,'arcana killer',8,25,1,232,8,NULL,0);
INSERT INTO `traits` VALUES (41,'arcana killer',8,86,2,232,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (42,'demon killer',12,40,1,234,8,NULL,0);
INSERT INTO `traits` VALUES (42,'demon killer',12,86,2,234,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (43,'dragon killer',14,25,1,233,8,NULL,0);
INSERT INTO `traits` VALUES (43,'dragon killer',14,86,1,233,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (48,'resist sleep',7,20,1,240,10,NULL,0);
INSERT INTO `traits` VALUES (48,'resist sleep',7,40,2,240,15,NULL,0);
INSERT INTO `traits` VALUES (48,'resist sleep',7,60,3,240,20,NULL,0);
INSERT INTO `traits` VALUES (48,'resist sleep',7,75,4,240,25,NULL,0);
INSERT INTO `traits` VALUES (48,'resist sleep',7,81,5,240,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (49,'resist poison',11,20,1,241,2,NULL,0);
INSERT INTO `traits` VALUES (49,'resist poison',11,40,2,241,3,NULL,0);
INSERT INTO `traits` VALUES (49,'resist poison',11,60,3,241,5,NULL,0);
INSERT INTO `traits` VALUES (50,'resist paralyze',8,20,1,242,10,NULL,0);
INSERT INTO `traits` VALUES (50,'resist paralyze',8,40,2,242,15,NULL,0);
INSERT INTO `traits` VALUES (50,'resist paralyze',8,50,3,242,20,NULL,0);
INSERT INTO `traits` VALUES (50,'resist paralyze',8,75,4,242,25,NULL,0);
INSERT INTO `traits` VALUES (50,'resist paralyze',8,81,5,242,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (50,'resist paralyze',17,5,1,242,2,'TOAU',0);
INSERT INTO `traits` VALUES (50,'resist paralyze',17,25,2,242,3,'TOAU',0);
INSERT INTO `traits` VALUES (50,'resist paralyze',17,45,3,242,5,'TOAU',0);
INSERT INTO `traits` VALUES (50,'resist paralyze',17,65,4,242,6,'TOAU',0);
INSERT INTO `traits` VALUES (51,'resist blind',12,5,1,243,10,NULL,0);
INSERT INTO `traits` VALUES (51,'resist blind',12,25,2,243,15,NULL,0);
INSERT INTO `traits` VALUES (51,'resist blind',12,45,3,243,20,NULL,0);
INSERT INTO `traits` VALUES (51,'resist blind',12,65,4,243,25,NULL,0);
INSERT INTO `traits` VALUES (51,'resist blind',12,81,5,243,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (52,'resist silence',10,5,1,244,2,NULL,0);
INSERT INTO `traits` VALUES (52,'resist silence',10,25,2,244,3,NULL,0);
INSERT INTO `traits` VALUES (52,'resist silence',10,45,3,244,5,NULL,0);
INSERT INTO `traits` VALUES (52,'resist silence',10,65,4,244,6,NULL,0);
INSERT INTO `traits` VALUES (52,'resist silence',10,81,5,244,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (52,'resist silence',20,10,1,244,2,'WOTG',0);
INSERT INTO `traits` VALUES (52,'resist silence',20,40,2,244,3,'WOTG',0);
INSERT INTO `traits` VALUES (52,'resist silence',20,70,3,244,5,'WOTG',0);
INSERT INTO `traits` VALUES (52,'resist silence',20,81,4,244,6,'ABYSSEA',0);
INSERT INTO `traits` VALUES (53,'resist petrify',5,10,1,246,10,NULL,0);
INSERT INTO `traits` VALUES (53,'resist petrify',5,30,2,246,15,NULL,0);
INSERT INTO `traits` VALUES (53,'resist petrify',5,50,3,246,20,NULL,0);
INSERT INTO `traits` VALUES (53,'resist petrify',5,70,4,246,25,NULL,0);
INSERT INTO `traits` VALUES (53,'resist petrify',5,81,5,246,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (54,'resist virus',1,5,1,245,10,NULL,0);
INSERT INTO `traits` VALUES (54,'resist virus',1,35,2,245,15,NULL,0);
INSERT INTO `traits` VALUES (54,'resist virus',1,55,3,245,20,NULL,0);
INSERT INTO `traits` VALUES (54,'resist virus',1,70,4,245,25,NULL,0);
INSERT INTO `traits` VALUES (54,'resist virus',1,81,5,245,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (55,'resist curse',0,0,1,248,2,NULL,0);
INSERT INTO `traits` VALUES (56,'resist stun',0,0,1,251,2,NULL,0);
INSERT INTO `traits` VALUES (57,'resist bind',13,10,1,247,10,NULL,0);
INSERT INTO `traits` VALUES (57,'resist bind',13,30,2,247,15,NULL,0);
INSERT INTO `traits` VALUES (57,'resist bind',13,50,3,247,20,NULL,0);
INSERT INTO `traits` VALUES (57,'resist bind',13,70,4,247,25,NULL,0);
INSERT INTO `traits` VALUES (57,'resist bind',13,90,5,247,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (58,'resist gravity',6,20,1,249,10,NULL,0);
INSERT INTO `traits` VALUES (58,'resist gravity',6,40,2,249,15,NULL,0);
INSERT INTO `traits` VALUES (58,'resist gravity',6,66,3,249,20,NULL,0);
INSERT INTO `traits` VALUES (58,'resist gravity',6,75,4,249,25,NULL,0);
INSERT INTO `traits` VALUES (58,'resist gravity',6,81,5,249,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (59,'resist slow',9,15,1,250,2,NULL,0);
INSERT INTO `traits` VALUES (59,'resist slow',9,35,2,250,3,NULL,0);
INSERT INTO `traits` VALUES (59,'resist slow',9,55,3,250,5,NULL,0);
INSERT INTO `traits` VALUES (59,'resist slow',9,75,4,250,6,NULL,0);

INSERT INTO `traits` VALUES (59,'resist slow',9,81,5,250,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (59,'resist slow',15,20,1,250,10,NULL,0);
INSERT INTO `traits` VALUES (59,'resist slow',15,40,2,250,15,NULL,0);
INSERT INTO `traits` VALUES (59,'resist slow',15,60,3,250,20,NULL,0);
INSERT INTO `traits` VALUES (59,'resist slow',15,81,4,250,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (59,'resist slow',18,10,1,250,10,'TOAU',0);
INSERT INTO `traits` VALUES (59,'resist slow',18,50,2,250,15,'TOAU',0);
INSERT INTO `traits` VALUES (59,'resist slow',18,70,3,250,20,'TOAU',0);
INSERT INTO `traits` VALUES (59,'resist slow',18,81,4,250,25,'TOAU',0);
INSERT INTO `traits` VALUES (59,'resist slow',19,20,1,250,2,'WOTG',0);
INSERT INTO `traits` VALUES (59,'resist slow',19,55,2,250,3,'WOTG',0);
INSERT INTO `traits` VALUES (59,'resist slow',19,81,3,250,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (60,'resist charm',0,0,1,252,2,NULL,0);
INSERT INTO `traits` VALUES (63,'resist amnesia',9,15,1,253,2,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',9,35,2,253,3,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',9,55,3,253,5,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',9,75,4,253,6,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',17,30,1,253,2,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',17,50,2,253,3,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',17,70,3,253,5,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',18,15,1,253,10,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',18,35,2,253,15,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',18,55,3,253,20,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',18,75,4,253,25,'SOA',0);
INSERT INTO `traits` VALUES (63,'resist amnesia',18,95,5,253,30,'SOA',0);
INSERT INTO `traits` VALUES (64,'treasure hunter ii',6,45,2,303,1,NULL,0);
INSERT INTO `traits` VALUES (65,'treasure hunter iii',6,90,3,303,1,'ABYSSEA',0);
INSERT INTO `traits` VALUES (66,'kick attacks',2,51,1,292,10,NULL,0);
INSERT INTO `traits` VALUES (66,'kick attacks',2,71,2,292,12,NULL,0);
INSERT INTO `traits` VALUES (66,'kick attacks',2,76,3,292,14,'ABYSSEA',0);
INSERT INTO `traits` VALUES (67,'subtle blow',2,5,1,289,5,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',2,25,2,289,10,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',2,40,3,289,15,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',2,65,4,289,20,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',2,91,5,289,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (67,'subtle blow',13,15,1,289,5,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',13,30,2,289,10,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',13,45,3,289,15,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',13,60,4,289,20,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',13,75,5,289,25,NULL,0);
INSERT INTO `traits` VALUES (67,'subtle blow',13,91,6,289,27,'ABYSSEA',0);
INSERT INTO `traits` VALUES (67,'subtle blow',19,25,1,289,5,'WOTG',0);
INSERT INTO `traits` VALUES (67,'subtle blow',19,45,2,289,10,'WOTG',0);
INSERT INTO `traits` VALUES (67,'subtle blow',19,65,3,289,15,'WOTG',0);
INSERT INTO `traits` VALUES (67,'subtle blow',19,86,4,289,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (68,'assassin',6,60,1,0,0,'COP',0);
INSERT INTO `traits` VALUES (69,'divine veil',3,50,1,0,0,'COP',0);
INSERT INTO `traits` VALUES (70,'zanshin',12,20,1,306,15,'COP',0);
INSERT INTO `traits` VALUES (70,'zanshin',12,35,2,306,25,'COP',0);
INSERT INTO `traits` VALUES (70,'zanshin',12,50,3,306,35,'COP',0);
INSERT INTO `traits` VALUES (70,'zanshin',12,75,4,306,45,'COP',0);
INSERT INTO `traits` VALUES (70,'zanshin',12,95,5,306,50,'ABYSSEA',0);
INSERT INTO `traits` VALUES (71,'savagery',1,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (72,'aggressive aim',1,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (73,'invigorate',2,75,1,0,24,'TOAU',0);
INSERT INTO `traits` VALUES (74,'penance',2,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (75,'aura steal',6,75,1,0,0,'TOAU',2372);
INSERT INTO `traits` VALUES (76,'ambush',6,75,1,0,0,'TOAU',2374);
INSERT INTO `traits` VALUES (77,'iron will',7,75,1,0,0,'TOAU',2436);
INSERT INTO `traits` VALUES (78,'guardian',7,75,1,0,0,'TOAU',2438);
INSERT INTO `traits` VALUES (79,'muted soul',8,75,1,0,0,'TOAU',2500);
INSERT INTO `traits` VALUES (80,'desperate blows',8,15,1,906,500,'TOAU',0);
INSERT INTO `traits` VALUES (80,'desperate blows',8,30,2,906,1000,'TOAU',0);
INSERT INTO `traits` VALUES (80,'desperate blows',8,45,3,906,1500,'TOAU',0);
INSERT INTO `traits` VALUES (81,'beast affinity ',9,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (82,'beast healer',9,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (83,'snapshot',11,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (84,'recycle',11,20,1,305,10,'TOAU',0);
INSERT INTO `traits` VALUES (84,'recycle',11,35,2,305,20,'TOAU',0);
INSERT INTO `traits` VALUES (84,'recycle',11,50,3,305,30,'TOAU',0);
INSERT INTO `traits` VALUES (84,'recycle',17,35,1,305,10,'TOAU',0);
INSERT INTO `traits` VALUES (84,'recycle',17,65,1,305,20,'TOAU',0);
INSERT INTO `traits` VALUES (85,'ikishoten',12,75,1,0,0,'TOAU',2756);
INSERT INTO `traits` VALUES (86,'overwhelm',12,75,1,0,0,'TOAU',2758);

INSERT INTO `traits` VALUES (87,'ninja tool expert.',13,75,1,308,0,'TOAU',2818);
INSERT INTO `traits` VALUES (88,'empathy',14,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (89,'strafe',14,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (90,'enchainment',16,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (91,'assimilation',16,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (92,'winning streak',17,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (93,'loaded deck',17,75,1,0,0,'TOAU',0);
INSERT INTO `traits` VALUES (94,'fine-tuning',18,75,1,0,0,'TOAU',3140);
INSERT INTO `traits` VALUES (95,'optimization',18,75,1,0,0,'TOAU',3142);
INSERT INTO `traits` VALUES (96,'closed position',19,75,1,0,0,'WOTG',0);
INSERT INTO `traits` VALUES (97,'stormsurge',20,75,1,0,0,'WOTG',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',1,78,1,421,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',1,86,2,421,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',6,78,1,421,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',6,84,2,421,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',6,91,3,421,11,'ABYSSEA',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',6,97,4,421,14,'ABYSSEA',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',8,85,1,421,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (98,'crit. atk. bonus',8,95,2,421,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (99,'crit. def. bonus',7,79,1,908,5,'ABYSSEA',0);   -- Paladin
INSERT INTO `traits` VALUES (99,'crit. def. bonus',7,85,2,908,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (99,'crit. def. bonus',7,91,3,908,11,'ABYSSEA',0);
INSERT INTO `traits` VALUES (99,'crit. def. bonus',7,96,4,908,14,'ABYSSEA',0);
INSERT INTO `traits` VALUES (99,'crit. def. bonus',10,80,1,908,5,'ABYSSEA',0);   -- Bard
INSERT INTO `traits` VALUES (99,'crit. def. bonus',10,91,2,908,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (99,'crit. def. bonus',14,85,1,908,5,'ABYSSEA',0);   -- Dragoon
INSERT INTO `traits` VALUES (99,'crit. def. bonus',14,95,2,908,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (99,'crit. def. bonus',18,85,1,908,5,'ABYSSEA',0);   -- Puppetmaster
INSERT INTO `traits` VALUES (99,'crit. def. bonus',18,95,2,908,8,'ABYSSEA',0);

INSERT INTO `traits` VALUES (100,'tactical parry',8,88,1,486,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',8,98,2,486,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',13,77,1,486,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',13,87,2,486,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',13,97,3,486,40,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',19,77,1,486,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',19,84,2,486,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',19,91,3,486,40,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',19,97,4,486,50,'ABYSSEA',0);
INSERT INTO `traits` VALUES (100,'tactical parry',22,40,1,486,20,NULL,0);
INSERT INTO `traits` VALUES (100,'tactical parry',22,60,2,486,30,NULL,0);
INSERT INTO `traits` VALUES (100,'tactical parry',22,97,3,486,40,NULL,0);
INSERT INTO `traits` VALUES (101,'tactical guard',2,77,1,899,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (101,'tactical guard',2,87,2,899,45,'ABYSSEA',0);
INSERT INTO `traits` VALUES (101,'tactical guard',2,97,3,899,60,'ABYSSEA',0);
INSERT INTO `traits` VALUES (101,'tactical guard',18,80,1,899,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (101,'tactical guard',18,90,2,899,45,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',1,80,1,905,2,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',1,88,2,905,4,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',1,99,3,905,6,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',3,85,1,905,2,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',3,95,2,905,4,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',7,77,1,905,2,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',7,82,2,905,4,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',7,88,3,905,6,'ABYSSEA',0);
INSERT INTO `traits` VALUES (102,'shield def. bonus',7,93,4,905,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',9,78,1,0,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',9,88,2,0,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',9,98,3,0,9,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',15,85,1,0,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',15,95,2,0,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',18,78,1,0,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',18,88,2,0,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (103,'stout servant',18,98,3,0,9,'ABYSSEA',0);
INSERT INTO `traits` VALUES (105,'blood boon',15,60,1,913,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (105,'blood boon',15,70,2,913,23,'ABYSSEA',0);
INSERT INTO `traits` VALUES (105,'blood boon',15,80,3,913,26,'ABYSSEA',0);
INSERT INTO `traits` VALUES (105,'blood boon',15,90,4,913,29,'ABYSSEA',0);


INSERT INTO `traits` VALUES (106,'skillchain bonus',2,85,1,174,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',2,95,2,174,12,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',12,78,1,174,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',12,88,2,174,12,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',12,98,3,174,16,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',13,85,1,174,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',13,95,2,174,12,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',19,45,1,174,8,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',19,58,2,174,12,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',19,71,3,174,16,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',19,84,4,174,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (106,'skillchain bonus',19,97,4,174,23,'ABYSSEA',0);

INSERT INTO `traits` VALUES (107,'fencer',1,45,1,903,200,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,45,1,904,3,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,58,2,903,300,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,58,2,904,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,71,3,903,400,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,71,3,904,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,84,4,903,450,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,84,4,904,9,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,97,5,903,500,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',1,97,5,904,10,'ABYSSEA',0);

INSERT INTO `traits` VALUES (107,'fencer',10,10,1,903,200,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,10,1,904,3,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,25,2,903,300,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,25,2,904,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,45,3,903,400,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,45,3,904,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,65,4,903,450,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,65,4,904,9,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,85,5,903,500,'ABYSSEA',0);
INSERT INTO `traits` VALUES (107,'fencer',10,85,5,904,10,'ABYSSEA',0);

INSERT INTO `traits` VALUES (109,'occult acumen',4,85,1,902,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (109,'occult acumen',4,95,2,902,50,'ABYSSEA',0);
INSERT INTO `traits` VALUES (109,'occult acumen',8,45,1,902,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (109,'occult acumen',8,58,2,902,50,'ABYSSEA',0);
INSERT INTO `traits` VALUES (109,'occult acumen',8,71,3,902,75,'ABYSSEA',0);
INSERT INTO `traits` VALUES (109,'occult acumen',8,84,4,902,100,'ABYSSEA',0);
INSERT INTO `traits` VALUES (109,'occult acumen',8,97,5,902,125,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',4,45,1,487,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',4,58,2,487,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',4,71,3,487,9,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',4,84,4,487,11,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',4,97,5,487,13,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',5,85,1,487,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',5,95,2,487,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',13,80,1,487,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',13,90,2,487,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',20,79,1,487,5,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',20,89,2,487,7,'ABYSSEA',0);
INSERT INTO `traits` VALUES (110,'mag. burst bonus',20,99,3,487,9,'ABYSSEA',0);
INSERT INTO `traits` VALUES (111,'divine benison',3,50,1,910,10,'ABYSSEA',0);
INSERT INTO `traits` VALUES (111,'divine benison',3,60,2,910,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (111,'divine benison',3,70,3,910,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (111,'divine benison',3,80,4,910,40,'ABYSSEA',0);
INSERT INTO `traits` VALUES (111,'divine benison',3,90,5,910,50,'ABYSSEA',0);
INSERT INTO `traits` VALUES (112,'elemental celerity',4,50,1,901,10,'SOA',0);
INSERT INTO `traits` VALUES (112,'elemental celerity',4,60,2,901,15,'SOA',0);
INSERT INTO `traits` VALUES (112,'elemental celerity',4,70,3,901,20,'SOA',0);
INSERT INTO `traits` VALUES (112,'elemental celerity',4,80,4,901,25,'SOA',0);
INSERT INTO `traits` VALUES (112,'elemental celerity',4,90,5,901,30,'SOA',0);
INSERT INTO `traits` VALUES (114,'tranquil heart',3,21,1,0,0,'ABYSSEA',0);
INSERT INTO `traits` VALUES (114,'tranquil heart',5,26,1,0,0,'ABYSSEA',0);
INSERT INTO `traits` VALUES (114,'tranquil heart',20,30,1,0,0,'ABYSSEA',0);
INSERT INTO `traits` VALUES (115,'stalwart soul',8,45,1,907,15,'TOAU',0);
INSERT INTO `traits` VALUES (115,'stalwart soul',8,60,2,907,30,'TOAU',0);
INSERT INTO `traits` VALUES (115,'stalwart soul',8,75,3,907,40,'TOAU',0);
INSERT INTO `traits` VALUES (115,'stalwart soul',8,90,4,907,50,'ABYSSEA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,240,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,241,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,242,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,243,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,244,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,245,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,246,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,247,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,5,1,248,5,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,240,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,241,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,242,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,243,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,244,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,245,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,246,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,247,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,25,2,248,7,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,240,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,241,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,242,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,243,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,244,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,245,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,246,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,247,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,45,3,248,9,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,240,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,241,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,242,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,243,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,244,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,245,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,246,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,247,11,'SOA',0);
INSERT INTO `traits` VALUES (117,'tenacity',22,75,4,248,11,'SOA',0);
INSERT INTO `traits` VALUES (118,'inquartata',22,15,1,948,5,'SOA',0);
INSERT INTO `traits` VALUES (118,'inquartata',22,45,2,948,7,'SOA',0);
INSERT INTO `traits` VALUES (118,'inquartata',22,75,3,948,9,'SOA',0);
INSERT INTO `traits` VALUES (123,'daken',13,25,1,911,20,'ABYSSEA',0);
INSERT INTO `traits` VALUES (123,'daken',13,40,2,911,25,'ABYSSEA',0);
INSERT INTO `traits` VALUES (123,'daken',13,55,3,911,30,'ABYSSEA',0);
INSERT INTO `traits` VALUES (123,'daken',13,70,4,911,35,'ABYSSEA',0);
INSERT INTO `traits` VALUES (123,'daken',13,95,5,911,40,'ABYSSEA',0);
INSERT INTO `traits` VALUES (127,'smite',1,35,1,898,25,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',1,65,2,898,38,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',1,95,3,898,51,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',2,40,1,898,25,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',2,80,2,898,38,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',8,15,1,898,25,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',8,35,2,898,38,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',8,55,3,898,51,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',8,75,4,898,64,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',8,95,5,898,76,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',14,40,1,898,25,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',14,80,2,898,38,'SOA',0);
INSERT INTO `traits` VALUES (127,'smite',18,60,1,898,25,'SOA',0);
INSERT INTO `traits` VALUES (108,'conserve tp',14,45,1,944,15,'ABYSSEA',0); -- Conserve TP I, DRG45, 15%
INSERT INTO `traits` VALUES (108,'conserve tp',19,77,1,944,15,'ABYSSEA',0); -- Conserve TP I, DNC77, 15%
INSERT INTO `traits` VALUES (108,'conserve tp',11,80,1,944,15,'ABYSSEA',0); -- Conserve TP I, RNG80, 15%
INSERT INTO `traits` VALUES (108,'conserve tp',14,58,2,944,18,'ABYSSEA',0); -- Conserve TP II, DRG58, 18%
INSERT INTO `traits` VALUES (108,'conserve tp',19,87,2,944,18,'ABYSSEA',0); -- Conserve TP II, DNC87, 18%
INSERT INTO `traits` VALUES (108,'conserve tp',11,91,2,944,18,'ABYSSEA',0); -- Conserve TP II, RNG91, 18%
INSERT INTO `traits` VALUES (108,'conserve tp',14,71,3,944,21,'ABYSSEA',0); -- Conserve TP III, DRG71, 21%
INSERT INTO `traits` VALUES (108,'conserve tp',19,97,3,944,21,'ABYSSEA',0); -- Conserve TP III, DNC97, 21%
INSERT INTO `traits` VALUES (108,'conserve tp',14,84,4,944,24,'ABYSSEA',0); -- Conserve TP IV, DRG84, 24%
INSERT INTO `traits` VALUES (108,'conserve tp',14,97,4,944,26,'ABYSSEA',0); -- Conserve TP V, DRG97, 26%
/*!40000 ALTER TABLE `traits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-02 10:14:01