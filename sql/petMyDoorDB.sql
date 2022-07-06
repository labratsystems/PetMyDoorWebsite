CREATE DATABASE  IF NOT EXISTS `petmydoor` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petmydoor`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: petmydoor
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `cpf_cnpj_cliente` varchar(20) NOT NULL,
  `codProduto` int NOT NULL,
  `nomeProduto` varchar(50) NOT NULL,
  `qtdeProduto` int NOT NULL DEFAULT '1',
  `precoProduto` decimal(5,2) NOT NULL,
  `descricaoProduto` varchar(600) NOT NULL,
  `imagemProduto` varchar(50) NOT NULL,
  PRIMARY KEY (`cpf_cnpj_cliente`,`codProduto`),
  UNIQUE KEY `nomeProduto` (`nomeProduto`),
  KEY `codProduto` (`codProduto`),
  CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`cpf_cnpj_cliente`) REFERENCES `cliente` (`cpf_cnpj`),
  CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
INSERT INTO `carrinho` VALUES ('449.464.768-30',1,'Porta para animais de estimação',2,99.90,'A Porta Pet é recomendada para gatos, mas também podem ser utilizadas para cães de pequeno porte até aproximadamente 8 quilogramas. Possui quatro formas de controle de acesso, podendo ser bloqueada em ambos os lados para entrada ou saída, dar acesso de entrada e saída livre, liberar apenas para saída, não permitindo mais a entrada, ou liberar apenas para entrada, não permitindo mais a saída.','img/Catflap-SUR001-angled-White.png');
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cpf_cnpj` varchar(20) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(75) NOT NULL,
  PRIMARY KEY (`cpf_cnpj`),
  UNIQUE KEY `usuario` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('449.464.768-30','Lab Rat Systems','$2y$10$t1r1XOhAmmE3jZihbfUj6uUDtriyh9TpAmQVXExN9zs9B0whmgq/a','(19) 98721-3927','Rua professora Angelina de Felice Mesanelli, 152');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passagem`
--

DROP TABLE IF EXISTS `passagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passagem` (
  `dataHoraPassagem` datetime NOT NULL,
  `idPorta` int NOT NULL,
  `idTag` varchar(20) NOT NULL,
  `direcao` enum('entrada','saída') DEFAULT NULL,
  PRIMARY KEY (`dataHoraPassagem`),
  UNIQUE KEY `idTag` (`idTag`),
  KEY `idPorta` (`idPorta`),
  CONSTRAINT `passagem_ibfk_1` FOREIGN KEY (`idPorta`) REFERENCES `porta` (`idPorta`),
  CONSTRAINT `passagem_ibfk_2` FOREIGN KEY (`idTag`) REFERENCES `pet` (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passagem`
--

LOCK TABLES `passagem` WRITE;
/*!40000 ALTER TABLE `passagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `passagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `codPedido` int NOT NULL AUTO_INCREMENT,
  `codVenda` int NOT NULL,
  `codProduto` int NOT NULL,
  `nomeProduto` varchar(50) NOT NULL,
  `qtdeProduto` int NOT NULL DEFAULT '1',
  `precoProduto` decimal(5,2) NOT NULL,
  `descricaoProduto` varchar(600) NOT NULL,
  `imagemProduto` varchar(50) NOT NULL,
  PRIMARY KEY (`codPedido`,`codVenda`,`codProduto`),
  KEY `codVenda` (`codVenda`),
  KEY `codProduto` (`codProduto`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `idTag` varchar(20) NOT NULL,
  `nomePet` varchar(30) NOT NULL,
  PRIMARY KEY (`idTag`),
  UNIQUE KEY `idTag` (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porta`
--

DROP TABLE IF EXISTS `porta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `porta` (
  `idPorta` int NOT NULL AUTO_INCREMENT,
  `localizacao` varchar(30) NOT NULL,
  PRIMARY KEY (`idPorta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porta`
--

LOCK TABLES `porta` WRITE;
/*!40000 ALTER TABLE `porta` DISABLE KEYS */;
/*!40000 ALTER TABLE `porta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codProduto` int NOT NULL AUTO_INCREMENT,
  `nomeProduto` varchar(50) NOT NULL,
  `precoProduto` decimal(5,2) NOT NULL,
  `descricaoProduto` varchar(600) NOT NULL,
  `imagemProduto` varchar(50) NOT NULL,
  PRIMARY KEY (`codProduto`),
  UNIQUE KEY `nomeProduto` (`nomeProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Porta para animais de estimação',99.90,'A porta pet é recomendada para gatos, mas também pode ser utilizada para cães de pequeno porte até, aproximadamente, 8 quilogramas. Possui quatro formas de controle de acesso, podendo ser bloqueada em ambos os lados para entrada e saída, dar acesso livre à entrada e saída, liberar apenas a saída, não permitindo mais a entrada, ou liberar apenas a entrada, não permitindo mais a saída.','img/Catflap-SUR001-angled-White.png'),(2,'Coleira com sensor para porta',39.90,'A coleira é indicada para gatos e cães de pequeno porte por ser um produto extremamente leve, compacto e confortável para o animal. Possui uma durabilidade de bateria muito superior e um sistema que avisa ao dono quando a bateria deve ser trocada. Ideal para registrar e controlar a passagem dos animais pela porta e evitar outros visitantes em momentos indesejados.','img/Coleira-removebg.png');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `login` varchar(30) NOT NULL,
  `idPorta` int NOT NULL,
  `idTag` varchar(20) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `idTag` (`idTag`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `idPorta` (`idPorta`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idPorta`) REFERENCES `porta` (`idPorta`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idTag`) REFERENCES `pet` (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `codVenda` int NOT NULL AUTO_INCREMENT,
  `cpfCnpjCliente` varchar(20) NOT NULL,
  `precoTotal` decimal(5,2) NOT NULL,
  `dataVenda` date NOT NULL,
  PRIMARY KEY (`codVenda`),
  KEY `cpfCnpjCliente` (`cpfCnpjCliente`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`cpfCnpjCliente`) REFERENCES `cliente` (`cpf_cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-02 19:21:44
