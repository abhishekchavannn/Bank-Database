-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: mpb
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accno` int NOT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`accno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (2001,98364),(2002,274321),(2003,50000),(2004,8469),(2005,54284),(2006,14590),(2007,5002734),(2008,6402),(2009,346364),(2010,314813);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `b_avg`
--

DROP TABLE IF EXISTS `b_avg`;
/*!50001 DROP VIEW IF EXISTS `b_avg`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `b_avg` AS SELECT 
 1 AS `bname`,
 1 AS `avg(c.balance)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `borrows`
--

DROP TABLE IF EXISTS `borrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrows` (
  `c_id` int NOT NULL,
  `loan_no` int NOT NULL,
  PRIMARY KEY (`c_id`,`loan_no`),
  KEY `loan_no` (`loan_no`),
  CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loanno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrows`
--

LOCK TABLES `borrows` WRITE;
/*!40000 ALTER TABLE `borrows` DISABLE KEYS */;
INSERT INTO `borrows` VALUES (3,60001),(4,60002),(7,60003),(10,60004);
/*!40000 ALTER TABLE `borrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `bid` int NOT NULL,
  `bname` varchar(20) DEFAULT NULL,
  `bcity` varchar(20) DEFAULT NULL,
  `basset` int DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Co-operative Bank','Raipur',40000000),(2,'Basaveshwara Bank','Chikodi',20004790),(3,'Kotiling Bank','Gulbarga',90000000),(4,'siddeshwara Bank','Garsangi',34078930),(5,'Panchimsali Bank','Kamatagi',40857350);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cb`
--

DROP TABLE IF EXISTS `cb`;
/*!50001 DROP VIEW IF EXISTS `cb`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cb` AS SELECT 
 1 AS `cname`,
 1 AS `ccity`,
 1 AS `bname`,
 1 AS `bcity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ce`
--

DROP TABLE IF EXISTS `ce`;
/*!50001 DROP VIEW IF EXISTS `ce`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ce` AS SELECT 
 1 AS `cname`,
 1 AS `ename`,
 1 AS `title`,
 1 AS `telno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` int NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `ccity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Siddaram','Raipur'),(2,'Pundlik','Chikodi'),(3,'Paul Jakob','Gulbarga'),(4,'Shekar Singh','Garsangi'),(5,'Jeetain kattimani','Kamatagi'),(6,'Somasid Rao','Raipur'),(7,'Kaarim saheb','Chikodi'),(8,'Pritam Dodmani','Gulbarga'),(9,'Sneha Patil','Garsangi'),(10,'Lily Jack','Kamatagi');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `eid` int NOT NULL,
  `ename` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `telno` int DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Aditi Musunur','Manager',123456),(2,'Advitiya Sujeet','Manager',122916),(3,'Alagesan Poduri','Manager',113223),(4,'Amrish Ilyasu','Manager',186752),(5,'Vijai Sritharan','Manager',936225),(6,'Kalyan Veerender','Accountant',987622),(7,'Jitendra Choudhary','Accountant',987654),(8,'Jayadev Mitali','Accountant',765432),(9,'Hardeep Suksma','Accountant',678910),(10,'Dhritiman Salim','Accountant',135791),(11,'Dharmadhrt Ramila','Cashier',246801),(12,'Devasru Subramanyan','Cashier',159378),(13,'Avidosa Vaisakhi','Cashier',951739),(14,'Barsati Sandipa','Cashier',377377),(15,'Avantas Ghosal','Cashier',778028);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `haschecking`
--

DROP TABLE IF EXISTS `haschecking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `haschecking` (
  `acc_no` int NOT NULL,
  `c_id` int NOT NULL,
  PRIMARY KEY (`acc_no`,`c_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `haschecking_ibfk_1` FOREIGN KEY (`acc_no`) REFERENCES `account` (`accno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `haschecking_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `haschecking`
--

LOCK TABLES `haschecking` WRITE;
/*!40000 ALTER TABLE `haschecking` DISABLE KEYS */;
INSERT INTO `haschecking` VALUES (2001,1),(2002,2),(2003,3),(2004,4),(2005,5),(2006,6),(2007,7),(2008,8),(2009,9),(2010,10);
/*!40000 ALTER TABLE `haschecking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loanno` int NOT NULL,
  `loanamt` int DEFAULT NULL,
  `b_id` int DEFAULT NULL,
  PRIMARY KEY (`loanno`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `branch` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (60001,25000,2),(60002,40000,4),(60003,10000,3),(60004,200000,1);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ownedby`
--

DROP TABLE IF EXISTS `ownedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ownedby` (
  `acc_no` int NOT NULL,
  `b_id` int NOT NULL,
  PRIMARY KEY (`acc_no`,`b_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `ownedby_ibfk_1` FOREIGN KEY (`acc_no`) REFERENCES `account` (`accno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ownedby_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `branch` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ownedby`
--

LOCK TABLES `ownedby` WRITE;
/*!40000 ALTER TABLE `ownedby` DISABLE KEYS */;
INSERT INTO `ownedby` VALUES (2001,1),(2006,1),(2002,2),(2007,2),(2003,3),(2008,3),(2004,4),(2009,4),(2005,5),(2010,5);
/*!40000 ALTER TABLE `ownedby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `loan_no` int NOT NULL,
  `payno` int NOT NULL,
  `date` date DEFAULT NULL,
  `amt` int DEFAULT NULL,
  PRIMARY KEY (`loan_no`,`payno`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loanno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (60001,1,'2019-12-22',10000),(60002,2,'2020-03-27',5000),(60004,3,'2020-04-07',50000);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `remain`
--

DROP TABLE IF EXISTS `remain`;
/*!50001 DROP VIEW IF EXISTS `remain`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `remain` AS SELECT 
 1 AS `cname`,
 1 AS `loanno`,
 1 AS `total_loan`,
 1 AS `remaining_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `rich`
--

DROP TABLE IF EXISTS `rich`;
/*!50001 DROP VIEW IF EXISTS `rich`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rich` AS SELECT 
 1 AS `accno`,
 1 AS `cname`,
 1 AS `ccity`,
 1 AS `balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worksat`
--

DROP TABLE IF EXISTS `worksat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worksat` (
  `e_id` int NOT NULL,
  `b_id` int NOT NULL,
  PRIMARY KEY (`e_id`,`b_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `worksat_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employee` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `worksat_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `branch` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worksat`
--

LOCK TABLES `worksat` WRITE;
/*!40000 ALTER TABLE `worksat` DISABLE KEYS */;
INSERT INTO `worksat` VALUES (1,1),(11,1),(2,2),(6,2),(7,2),(12,2),(3,3),(8,3),(13,3),(4,4),(9,4),(14,4),(5,5),(10,5),(15,5);
/*!40000 ALTER TABLE `worksat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workswith`
--

DROP TABLE IF EXISTS `workswith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workswith` (
  `c_id` int NOT NULL,
  `e_id` int NOT NULL,
  PRIMARY KEY (`c_id`,`e_id`),
  KEY `e_id` (`e_id`),
  CONSTRAINT `workswith_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workswith_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `employee` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workswith`
--

LOCK TABLES `workswith` WRITE;
/*!40000 ALTER TABLE `workswith` DISABLE KEYS */;
INSERT INTO `workswith` VALUES (1,6),(6,6),(2,7),(7,7),(3,8),(8,8),(4,9),(9,9),(5,10),(10,10);
/*!40000 ALTER TABLE `workswith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `b_avg`
--

/*!50001 DROP VIEW IF EXISTS `b_avg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `b_avg` AS select `a`.`bname` AS `bname`,avg(`c`.`balance`) AS `avg(c.balance)` from ((`branch` `a` join `ownedby` `b`) join `account` `c` on(((`a`.`bid` = `b`.`b_id`) and (`c`.`accno` = `b`.`acc_no`)))) group by `a`.`bname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cb`
--

/*!50001 DROP VIEW IF EXISTS `cb`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cb` AS select `a`.`cname` AS `cname`,`a`.`ccity` AS `ccity`,`d`.`bname` AS `bname`,`d`.`bcity` AS `bcity` from (((`customer` `a` join `haschecking` `b`) join `ownedby` `c`) join `branch` `d` on(((`a`.`cid` = `b`.`c_id`) and (`b`.`acc_no` = `c`.`acc_no`) and (`c`.`b_id` = `d`.`bid`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ce`
--

/*!50001 DROP VIEW IF EXISTS `ce`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ce` AS select `a`.`cname` AS `cname`,`c`.`ename` AS `ename`,`c`.`title` AS `title`,`c`.`telno` AS `telno` from ((`customer` `a` join `workswith` `b`) join `employee` `c` on(((`a`.`cid` = `b`.`c_id`) and (`b`.`e_id` = `c`.`eid`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `remain`
--

/*!50001 DROP VIEW IF EXISTS `remain`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `remain` AS select `a`.`cname` AS `cname`,`b`.`loanno` AS `loanno`,`b`.`loanamt` AS `total_loan`,(`b`.`loanamt` - `d`.`amt`) AS `remaining_amount` from (((`customer` `a` join `loan` `b`) join `borrows` `c`) join `payment` `d` on(((`a`.`cid` = `c`.`c_id`) and (`c`.`loan_no` = `b`.`loanno`) and (`c`.`loan_no` = `d`.`loan_no`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rich`
--

/*!50001 DROP VIEW IF EXISTS `rich`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rich` AS select `c`.`accno` AS `accno`,`a`.`cname` AS `cname`,`a`.`ccity` AS `ccity`,`c`.`balance` AS `balance` from ((`customer` `a` join `haschecking` `b`) join `account` `c` on(((`c`.`accno` = `b`.`acc_no`) and (`a`.`cid` = `b`.`c_id`)))) where (`c`.`balance` > 50000) */;
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

-- Dump completed on 2021-04-30 16:03:50
