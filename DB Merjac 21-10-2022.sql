-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: merjac
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `aset`
--

DROP TABLE IF EXISTS `aset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aset` (
  `n_set` bigint unsigned NOT NULL AUTO_INCREMENT,
  `puntaje` bigint unsigned NOT NULL,
  `puntos_local` int NOT NULL,
  `puntos_visitante` int NOT NULL,
  PRIMARY KEY (`n_set`,`puntaje`),
  UNIQUE KEY `n_set` (`n_set`),
  KEY `puntaje` (`puntaje`),
  CONSTRAINT `aset_ibfk_1` FOREIGN KEY (`puntaje`) REFERENCES `sets` (`puntaje`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aset`
--

LOCK TABLES `aset` WRITE;
/*!40000 ALTER TABLE `aset` DISABLE KEYS */;
INSERT INTO `aset` VALUES (1,3,1,3);
/*!40000 ALTER TABLE `aset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deportes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipo` bigint unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `deportes_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipos_resultados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES (1,1,'Futbol'),(2,3,'Tenis');
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(20) NOT NULL,
  `nombre_dt` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Uruguay','Diego Alonzo'),(2,'Argentina','Lionel Scaloni'),(3,'Nacional','Pablo Repetto'),(4,'Peñarol','Leonardo Ramos');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas`
--

DROP TABLE IF EXISTS `estadisticas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas`
--

LOCK TABLES `estadisticas` WRITE;
/*!40000 ALTER TABLE `estadisticas` DISABLE KEYS */;
INSERT INTO `estadisticas` VALUES (1,'Faltas'),(2,'Tiro de esquina'),(3,'Pases'),(4,'Tarjeta Roja'),(5,'Tarjeta Amarilla'),(6,'Posicion Adelantada');
/*!40000 ALTER TABLE `estadisticas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_eventos_local`
--

DROP TABLE IF EXISTS `estadisticas_eventos_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas_eventos_local` (
  `estadistica` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  `evento` bigint unsigned NOT NULL,
  `puntaje` int NOT NULL,
  PRIMARY KEY (`estadistica`,`evento`),
  KEY `evento` (`evento`),
  CONSTRAINT `estadisticas_eventos_local_ibfk_1` FOREIGN KEY (`estadistica`) REFERENCES `estadisticas` (`id`),
  CONSTRAINT `estadisticas_eventos_local_ibfk_2` FOREIGN KEY (`evento`) REFERENCES `eventos_local` (`evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_eventos_local`
--

LOCK TABLES `estadisticas_eventos_local` WRITE;
/*!40000 ALTER TABLE `estadisticas_eventos_local` DISABLE KEYS */;
INSERT INTO `estadisticas_eventos_local` VALUES (1,1,1,20),(2,1,1,7),(3,1,1,302),(4,1,1,0),(5,1,1,1),(6,1,1,2);
/*!40000 ALTER TABLE `estadisticas_eventos_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_eventos_visitante`
--

DROP TABLE IF EXISTS `estadisticas_eventos_visitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas_eventos_visitante` (
  `estadistica` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  `evento` bigint unsigned NOT NULL,
  `puntaje` int NOT NULL,
  PRIMARY KEY (`estadistica`,`evento`),
  KEY `evento` (`evento`),
  CONSTRAINT `estadisticas_eventos_visitante_ibfk_1` FOREIGN KEY (`estadistica`) REFERENCES `estadisticas` (`id`),
  CONSTRAINT `estadisticas_eventos_visitante_ibfk_2` FOREIGN KEY (`evento`) REFERENCES `eventos_visitante` (`evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_eventos_visitante`
--

LOCK TABLES `estadisticas_eventos_visitante` WRITE;
/*!40000 ALTER TABLE `estadisticas_eventos_visitante` DISABLE KEYS */;
INSERT INTO `estadisticas_eventos_visitante` VALUES (1,2,1,14),(2,2,1,2),(3,2,1,586),(4,2,1,0),(5,2,1,1),(6,2,1,1);
/*!40000 ALTER TABLE `estadisticas_eventos_visitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deporte` bigint unsigned NOT NULL,
  `titulo` varchar(70) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `lugar` varchar(40) NOT NULL,
  `nombre_arbitro` varchar(30) NOT NULL,
  PRIMARY KEY (`id`,`deporte`),
  UNIQUE KEY `id` (`id`),
  KEY `deporte` (`deporte`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`deporte`) REFERENCES `deportes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,1,'Uruguay vs Argentina','2022-08-25 03:00:00','Estadio Centenario','Mirtha Legrand'),(2,1,'Nacional vs Peñarol','2022-08-25 03:00:00','Estadio Campeon del Siglo','Pepe Mujica'),(3,1,'Aguada vs Wanders','2022-08-25 03:00:00','Estadio Centenario','Benito Camelo'),(4,2,'Pepe vs Mirtha','2022-08-25 03:00:00','Parque Rodo','Yao Cabrera'),(5,2,'Agustin Casanova vs El Gordo Verde','2022-08-25 03:00:00','Parque Rodo','Jorge Puglia');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_jugadores_equipos`
--

DROP TABLE IF EXISTS `eventos_jugadores_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_jugadores_equipos` (
  `jugador` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  `evento` bigint unsigned NOT NULL,
  PRIMARY KEY (`jugador`,`equipo`,`evento`),
  KEY `evento` (`evento`),
  CONSTRAINT `eventos_jugadores_equipos_ibfk_1` FOREIGN KEY (`jugador`, `equipo`) REFERENCES `jugadores_equipos` (`jugador`, `equipo`),
  CONSTRAINT `eventos_jugadores_equipos_ibfk_2` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_jugadores_equipos`
--

LOCK TABLES `eventos_jugadores_equipos` WRITE;
/*!40000 ALTER TABLE `eventos_jugadores_equipos` DISABLE KEYS */;
INSERT INTO `eventos_jugadores_equipos` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1);
/*!40000 ALTER TABLE `eventos_jugadores_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_local`
--

DROP TABLE IF EXISTS `eventos_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_local` (
  `evento` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  PRIMARY KEY (`evento`),
  KEY `equipo` (`equipo`),
  CONSTRAINT `eventos_local_ibfk_1` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`),
  CONSTRAINT `eventos_local_ibfk_2` FOREIGN KEY (`equipo`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_local`
--

LOCK TABLES `eventos_local` WRITE;
/*!40000 ALTER TABLE `eventos_local` DISABLE KEYS */;
INSERT INTO `eventos_local` VALUES (1,1),(2,3);
/*!40000 ALTER TABLE `eventos_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_torneos`
--

DROP TABLE IF EXISTS `eventos_torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_torneos` (
  `evento` bigint unsigned NOT NULL,
  `torneo` bigint unsigned DEFAULT NULL,
  `nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`evento`),
  KEY `torneo` (`torneo`),
  CONSTRAINT `eventos_torneos_ibfk_1` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`),
  CONSTRAINT `eventos_torneos_ibfk_2` FOREIGN KEY (`torneo`) REFERENCES `torneos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_torneos`
--

LOCK TABLES `eventos_torneos` WRITE;
/*!40000 ALTER TABLE `eventos_torneos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos_torneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_visitante`
--

DROP TABLE IF EXISTS `eventos_visitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_visitante` (
  `evento` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  PRIMARY KEY (`evento`),
  KEY `equipo` (`equipo`),
  CONSTRAINT `eventos_visitante_ibfk_1` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`),
  CONSTRAINT `eventos_visitante_ibfk_2` FOREIGN KEY (`equipo`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_visitante`
--

LOCK TABLES `eventos_visitante` WRITE;
/*!40000 ALTER TABLE `eventos_visitante` DISABLE KEYS */;
INSERT INTO `eventos_visitante` VALUES (1,2),(2,4);
/*!40000 ALTER TABLE `eventos_visitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupal`
--

DROP TABLE IF EXISTS `grupal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupal` (
  `deporte` bigint unsigned NOT NULL,
  `cantidad_jugador_plantel` int NOT NULL,
  PRIMARY KEY (`deporte`),
  CONSTRAINT `grupal_ibfk_1` FOREIGN KEY (`deporte`) REFERENCES `deportes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupal`
--

LOCK TABLES `grupal` WRITE;
/*!40000 ALTER TABLE `grupal` DISABLE KEYS */;
INSERT INTO `grupal` VALUES (1,11);
/*!40000 ALTER TABLE `grupal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual` (
  `deporte` bigint unsigned NOT NULL,
  PRIMARY KEY (`deporte`),
  CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`deporte`) REFERENCES `deportes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

LOCK TABLES `individual` WRITE;
/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` VALUES (2);
/*!40000 ALTER TABLE `individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracciones`
--

DROP TABLE IF EXISTS `infracciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infracciones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracciones`
--

LOCK TABLES `infracciones` WRITE;
/*!40000 ALTER TABLE `infracciones` DISABLE KEYS */;
INSERT INTO `infracciones` VALUES (1,'Tarjeta Amarilla'),(2,'Tarjeta Roja'),(3,'Falta');
/*!40000 ALTER TABLE `infracciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(30) NOT NULL,
  `n_camiseta` int NOT NULL,
  `posicion` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Fernando Muslera',1,'Arquero'),(2,'José María Giménez',2,'Defensa'),(3,'Diego Godín',3,'Defensa'),(4,'Ronald Araújo',4,'Defensa'),(5,'Matías Vecino',5,'Mediocentro'),(6,'Manuel Ugarte',6,'Pivote'),(7,'Diego Rossi',8,'Extremo izquierdo'),(8,'Facundo Pellistri',8,'Extremo derecho'),(9,'Giorgian de Arrascaeta',10,'Mediocentro'),(10,'Sergio Rochet',12,'Arquero'),(11,'Lucas Torreira',14,'Pivote'),(12,'Federico Valverde',15,'Mediocentro'),(13,'Maxi Gómez',18,'Delantero'),(14,'Sebastián Coates',19,'Defensa'),(15,'Edinson Cavani',21,'Delantero'),(16,'Luiz Suarez',9,'Delantero');
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores_equipos`
--

DROP TABLE IF EXISTS `jugadores_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores_equipos` (
  `jugador` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  PRIMARY KEY (`jugador`,`equipo`),
  KEY `equipo` (`equipo`),
  CONSTRAINT `jugadores_equipos_ibfk_1` FOREIGN KEY (`jugador`) REFERENCES `jugadores` (`id`),
  CONSTRAINT `jugadores_equipos_ibfk_2` FOREIGN KEY (`equipo`) REFERENCES `equipos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores_equipos`
--

LOCK TABLES `jugadores_equipos` WRITE;
/*!40000 ALTER TABLE `jugadores_equipos` DISABLE KEYS */;
INSERT INTO `jugadores_equipos` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1);
/*!40000 ALTER TABLE `jugadores_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores_infracciones`
--

DROP TABLE IF EXISTS `jugadores_infracciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores_infracciones` (
  `jugador` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  `evento` bigint unsigned NOT NULL,
  `infraccion` bigint unsigned NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`jugador`,`equipo`,`evento`,`infraccion`),
  KEY `infraccion` (`infraccion`),
  CONSTRAINT `jugadores_infracciones_ibfk_1` FOREIGN KEY (`jugador`, `equipo`, `evento`) REFERENCES `eventos_jugadores_equipos` (`jugador`, `equipo`, `evento`),
  CONSTRAINT `jugadores_infracciones_ibfk_2` FOREIGN KEY (`infraccion`) REFERENCES `infracciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores_infracciones`
--

LOCK TABLES `jugadores_infracciones` WRITE;
/*!40000 ALTER TABLE `jugadores_infracciones` DISABLE KEYS */;
INSERT INTO `jugadores_infracciones` VALUES (4,1,1,1,1),(8,1,1,2,1),(15,1,1,1,1);
/*!40000 ALTER TABLE `jugadores_infracciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores_marca`
--

DROP TABLE IF EXISTS `jugadores_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores_marca` (
  `puntaje` bigint unsigned NOT NULL,
  `jugador` bigint unsigned NOT NULL,
  `equipo` bigint unsigned NOT NULL,
  `evento` bigint unsigned NOT NULL,
  `marca` int NOT NULL,
  PRIMARY KEY (`puntaje`),
  KEY `jugador` (`jugador`,`equipo`,`evento`),
  CONSTRAINT `jugadores_marca_ibfk_1` FOREIGN KEY (`puntaje`) REFERENCES `por_marca` (`puntaje`),
  CONSTRAINT `jugadores_marca_ibfk_2` FOREIGN KEY (`jugador`, `equipo`, `evento`) REFERENCES `eventos_jugadores_equipos` (`jugador`, `equipo`, `evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores_marca`
--

LOCK TABLES `jugadores_marca` WRITE;
/*!40000 ALTER TABLE `jugadores_marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugadores_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `por_marca`
--

DROP TABLE IF EXISTS `por_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `por_marca` (
  `puntaje` bigint unsigned NOT NULL,
  PRIMARY KEY (`puntaje`),
  CONSTRAINT `por_marca_ibfk_1` FOREIGN KEY (`puntaje`) REFERENCES `puntajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `por_marca`
--

LOCK TABLES `por_marca` WRITE;
/*!40000 ALTER TABLE `por_marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `por_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntajes`
--

DROP TABLE IF EXISTS `puntajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntajes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `evento` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `evento` (`evento`),
  CONSTRAINT `puntajes_ibfk_1` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntajes`
--

LOCK TABLES `puntajes` WRITE;
/*!40000 ALTER TABLE `puntajes` DISABLE KEYS */;
INSERT INTO `puntajes` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `puntajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntos`
--

DROP TABLE IF EXISTS `puntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntos` (
  `puntaje` bigint unsigned NOT NULL,
  `puntos_local` int NOT NULL,
  `puntos_visitante` int NOT NULL,
  PRIMARY KEY (`puntaje`),
  CONSTRAINT `puntos_ibfk_1` FOREIGN KEY (`puntaje`) REFERENCES `puntajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntos`
--

LOCK TABLES `puntos` WRITE;
/*!40000 ALTER TABLE `puntos` DISABLE KEYS */;
INSERT INTO `puntos` VALUES (1,3,1),(2,2,0);
/*!40000 ALTER TABLE `puntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_suscribe`
--

DROP TABLE IF EXISTS `se_suscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `se_suscribe` (
  `usuario` bigint unsigned NOT NULL,
  `evento` bigint unsigned NOT NULL,
  PRIMARY KEY (`usuario`,`evento`),
  KEY `evento` (`evento`),
  CONSTRAINT `se_suscribe_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `users` (`id`),
  CONSTRAINT `se_suscribe_ibfk_2` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_suscribe`
--

LOCK TABLES `se_suscribe` WRITE;
/*!40000 ALTER TABLE `se_suscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_suscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sets`
--

DROP TABLE IF EXISTS `sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sets` (
  `puntaje` bigint unsigned NOT NULL,
  PRIMARY KEY (`puntaje`),
  CONSTRAINT `sets_ibfk_1` FOREIGN KEY (`puntaje`) REFERENCES `puntajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sets`
--

LOCK TABLES `sets` WRITE;
/*!40000 ALTER TABLE `sets` DISABLE KEYS */;
INSERT INTO `sets` VALUES (3);
/*!40000 ALTER TABLE `sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_resultados`
--

DROP TABLE IF EXISTS `tipos_resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_resultados` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipo_resultado` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_resultados`
--

LOCK TABLES `tipos_resultados` WRITE;
/*!40000 ALTER TABLE `tipos_resultados` DISABLE KEYS */;
INSERT INTO `tipos_resultados` VALUES (1,'Puntos'),(2,'Por_Marcas'),(3,'Sets');
/*!40000 ALTER TABLE `tipos_resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_usuarios`
--

DROP TABLE IF EXISTS `tipos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_usuarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_usuarios`
--

LOCK TABLES `tipos_usuarios` WRITE;
/*!40000 ALTER TABLE `tipos_usuarios` DISABLE KEYS */;
INSERT INTO `tipos_usuarios` VALUES (1,'Usuario'),(2,'Usuario_Premium');
/*!40000 ALTER TABLE `tipos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneos`
--

DROP TABLE IF EXISTS `torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos`
--

LOCK TABLES `torneos` WRITE;
/*!40000 ALTER TABLE `torneos` DISABLE KEYS */;
INSERT INTO `torneos` VALUES (1,'Copa Mundial Qatar 2022');
/*!40000 ALTER TABLE `torneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` bigint unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipos_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ezequiel Rapetto','ezeofficeprueba@gmail.com',NULL,'$2y$10$3TXQI8D.DHHTT64x1GjGjOJL3ezk49EdVUAC9uob0Bbm6Z5yUNxNq',1,NULL,'2022-10-14 05:10:43','2022-10-19 18:42:36'),(2,'Pancho','panchozugarra@gmail.com',NULL,'$2y$10$so3YxburWqIZTARYfJG5z.vUuyN9wjeW9XMjpdr2qwL.rPr.AgO2G',2,NULL,'2022-10-19 17:59:30','2022-10-19 18:04:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21  3:10:22
