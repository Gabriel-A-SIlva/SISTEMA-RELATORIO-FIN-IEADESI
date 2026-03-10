-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: sistemaFinanceiro
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area_numero` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congregacao`
--

DROP TABLE IF EXISTS `congregacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congregacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_area` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_area` (`id_area`),
  CONSTRAINT `congregacao_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congregacao`
--

LOCK TABLES `congregacao` WRITE;
/*!40000 ALTER TABLE `congregacao` DISABLE KEYS */;
INSERT INTO `congregacao` VALUES (1,1,'Gileade');
/*!40000 ALTER TABLE `congregacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_congregacao` int NOT NULL,
  `saldo_anterior` decimal(12,2) DEFAULT '0.00',
  `oferta_ordinaria` decimal(12,2) DEFAULT '0.00',
  `oferta_voto` decimal(12,2) DEFAULT '0.00',
  `oferta_escola` decimal(12,2) DEFAULT '0.00',
  `oferta_construcao` decimal(12,2) DEFAULT '0.00',
  `oferta_extra` decimal(12,2) DEFAULT '0.00',
  `oferta_missao` decimal(12,2) DEFAULT '0.00',
  `dizimo` decimal(12,2) DEFAULT '0.00',
  `total_entradas` decimal(12,2) GENERATED ALWAYS AS ((((((((`saldo_anterior` + `oferta_ordinaria`) + `oferta_voto`) + `oferta_escola`) + `oferta_construcao`) + `oferta_extra`) + `oferta_missao`) + `dizimo`)) STORED,
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_congregacao` (`id_congregacao`),
  CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`id_congregacao`) REFERENCES `congregacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas_extras`
--

DROP TABLE IF EXISTS `entradas_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_extras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrada` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00',
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_extra` (`id_entrada`),
  CONSTRAINT `fk_entrada_extra` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_extras`
--

LOCK TABLES `entradas_extras` WRITE;
/*!40000 ALTER TABLE `entradas_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidas`
--

DROP TABLE IF EXISTS `saidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saidas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_congregacao` int NOT NULL,
  `energia_agua` decimal(12,2) DEFAULT '0.00',
  `material_limpeza` decimal(12,2) DEFAULT '0.00',
  `manutencao` decimal(12,2) DEFAULT '0.00',
  `evangelizacao` decimal(12,2) DEFAULT '0.00',
  `construcao_saida` decimal(12,2) DEFAULT '0.00',
  `aluguel` decimal(12,2) DEFAULT '0.00',
  `despesas_extras` decimal(12,2) DEFAULT '0.00',
  `total_saidas` decimal(12,2) GENERATED ALWAYS AS (((((((`energia_agua` + `material_limpeza`) + `manutencao`) + `evangelizacao`) + `construcao_saida`) + `aluguel`) + `despesas_extras`)) STORED,
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_congregacao` (`id_congregacao`),
  CONSTRAINT `saidas_ibfk_1` FOREIGN KEY (`id_congregacao`) REFERENCES `congregacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidas`
--

LOCK TABLES `saidas` WRITE;
/*!40000 ALTER TABLE `saidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `saidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidas_extras`
--

DROP TABLE IF EXISTS `saidas_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saidas_extras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_saida` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `valor` decimal(12,2) NOT NULL DEFAULT '0.00',
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_saida_extra` (`id_saida`),
  CONSTRAINT `fk_saida_extra` FOREIGN KEY (`id_saida`) REFERENCES `saidas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidas_extras`
--

LOCK TABLES `saidas_extras` WRITE;
/*!40000 ALTER TABLE `saidas_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `saidas_extras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-10 19:53:32
