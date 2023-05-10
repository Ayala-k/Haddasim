-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: hmodb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `corona_table`
--

DROP TABLE IF EXISTS `corona_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corona_table` (
  `patient_id` int NOT NULL,
  `positive_result_date` datetime NOT NULL,
  `recovery_date` datetime NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`),
  CONSTRAINT `fk_patient_id_corona_table` FOREIGN KEY (`patient_id`) REFERENCES `patients_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corona_table`
--

LOCK TABLES `corona_table` WRITE;
/*!40000 ALTER TABLE `corona_table` DISABLE KEYS */;
INSERT INTO `corona_table` VALUES (111111111,'2023-04-10 00:00:00','2023-04-20 00:00:00'),(222222222,'2023-05-01 00:00:00','2023-05-08 00:00:00'),(333333333,'2023-04-28 00:00:00','2023-05-03 00:00:00');
/*!40000 ALTER TABLE `corona_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers_table`
--

DROP TABLE IF EXISTS `manufacturers_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers_table` (
  `manufacturer_id` int NOT NULL,
  `manufacturer_name` varchar(45) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers_table`
--

LOCK TABLES `manufacturers_table` WRITE;
/*!40000 ALTER TABLE `manufacturers_table` DISABLE KEYS */;
INSERT INTO `manufacturers_table` VALUES (333,'M333'),(334,'M334'),(335,'M335');
/*!40000 ALTER TABLE `manufacturers_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients_table`
--

DROP TABLE IF EXISTS `patients_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients_table` (
  `patient_id` int NOT NULL,
  `patient_name` varchar(45) NOT NULL,
  `patient_address` varchar(45) DEFAULT NULL,
  `patients_date_of_birth` datetime NOT NULL,
  `patient_phone_number` int NOT NULL,
  `patient_celphone_number` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_table`
--

LOCK TABLES `patients_table` WRITE;
/*!40000 ALTER TABLE `patients_table` DISABLE KEYS */;
INSERT INTO `patients_table` VALUES (111111111,'P1','P11','2012-03-27 00:00:00',111111111,NULL),(222222222,'P2','P22','2010-02-01 00:00:00',222222222,222222222),(333333333,'P3','P33','2022-10-10 00:00:00',333333333,NULL);
/*!40000 ALTER TABLE `patients_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccinations_table`
--

DROP TABLE IF EXISTS `vaccinations_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccinations_table` (
  `patient_id` int NOT NULL,
  `vaccination_date` datetime NOT NULL,
  `manufacturer_id` int NOT NULL,
  PRIMARY KEY (`patient_id`,`vaccination_date`),
  KEY `fk_manufacturer_id_vaccinations_table` (`manufacturer_id`),
  CONSTRAINT `fk_manufacturer_id_vaccinations_table` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers_table` (`manufacturer_id`),
  CONSTRAINT `fk_patient_id_vaccinations_table` FOREIGN KEY (`patient_id`) REFERENCES `patients_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccinations_table`
--

LOCK TABLES `vaccinations_table` WRITE;
/*!40000 ALTER TABLE `vaccinations_table` DISABLE KEYS */;
INSERT INTO `vaccinations_table` VALUES (111111111,'2022-10-05 00:00:00',333),(222222222,'2023-03-12 00:00:00',333),(111111111,'2022-12-03 00:00:00',334);
/*!40000 ALTER TABLE `vaccinations_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-10 18:23:01
