-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dwh_powerfuel
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `pf_clientes`
--

DROP TABLE IF EXISTS `pf_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_clientes` (
  `id` int NOT NULL,
  `idf_usu` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idf_usu` (`idf_usu`),
  CONSTRAINT `pf_clientes_ibfk_1` FOREIGN KEY (`idf_usu`) REFERENCES `pf_usu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_clientes`
--

LOCK TABLES `pf_clientes` WRITE;
/*!40000 ALTER TABLE `pf_clientes` DISABLE KEYS */;
INSERT INTO `pf_clientes` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(19,13),(14,20),(15,21),(16,22),(17,23),(18,24),(20,32);
/*!40000 ALTER TABLE `pf_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_contaban`
--

DROP TABLE IF EXISTS `pf_contaban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_contaban` (
  `id` int NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  `agencia` varchar(4) DEFAULT NULL,
  `numero_conta` varchar(20) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pf_contaban_chk_1` CHECK ((`tipo` in (_utf8mb4'C',_utf8mb4'S')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_contaban`
--

LOCK TABLES `pf_contaban` WRITE;
/*!40000 ALTER TABLE `pf_contaban` DISABLE KEYS */;
INSERT INTO `pf_contaban` VALUES (1,'C','2847','5192004-3','Tio Patinhas S.A.'),(2,'S','1357','9876543-1','Pato Donald Bank'),(3,'C','7890','1234567-8','Tio Patinhas Bank'),(4,'C','2468','9876543-2','Patolino & Co. Bank'),(5,'S','9753','2468135-7','Perna Longa Trust'),(6,'C','8642','1357924-6','Pateta Saving Bank'),(7,'S','7531','2468135-8','Louro José Financeira'),(8,'C','9514','9876543-3','Eufrazino Corretora S.A'),(9,'C','3579','1234567-9','Papaleguas Credit Union'),(10,'S','6248','1357924-7','Rei do Pix Empréstimos LTDA.'),(11,'C','8023','9876543-4','Pato Rouco Financial');
/*!40000 ALTER TABLE `pf_contaban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_cpa`
--

DROP TABLE IF EXISTS `pf_cpa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_cpa` (
  `id` int NOT NULL,
  `idf_nfcOrigem` int DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `numero_parcelas` tinyint DEFAULT NULL,
  `idf_conta` int DEFAULT NULL,
  `moeda` varchar(20) DEFAULT NULL,
  `observacao` text,
  `data_emissao` date DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idf_nfcOrigem` (`idf_nfcOrigem`),
  KEY `idf_conta` (`idf_conta`),
  CONSTRAINT `pf_cpa_ibfk_1` FOREIGN KEY (`idf_nfcOrigem`) REFERENCES `pf_nfc` (`id`),
  CONSTRAINT `pf_cpa_ibfk_2` FOREIGN KEY (`idf_conta`) REFERENCES `pf_contaban` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_cpa`
--

LOCK TABLES `pf_cpa` WRITE;
/*!40000 ALTER TABLE `pf_cpa` DISABLE KEYS */;
INSERT INTO `pf_cpa` VALUES (1,1,1902.7,3,4,'BRL','Se não pagar, o agiota do fornecedor irá nos cobrar!','2023-05-20','2023-08-20'),(2,2,2278.51,7,4,'EUR','Quando o gato pagar o aluguel, a vida será perfeita!','2023-05-20','2023-12-20'),(3,3,2265.47,1,4,'BRL','O contador sumiu com os números!','2023-05-20','2023-06-20'),(4,4,2430,10,4,'US','Nunca mais empresto dinheiro ao cunhado!','2023-05-20','2024-03-20'),(5,5,962.1,6,4,'Criptomoeda','Aquele investimento em tulipas foi uma péssima ideia...','2023-05-20','2023-11-20'),(6,6,2139.5,4,4,'BRL','Comprei um unicórnio e ele fugiu!','2023-05-20','2023-09-20'),(7,7,1832.15,12,4,'EUR','Se eu ganhasse 1 centavo para cada vez que alguém me pede dinheiro emprestado...','2023-05-20','2024-05-20'),(8,8,1520.2,2,4,'US','Quando eu morrer, me enterre com todo o meu dinheiro!','2023-05-20','2023-07-20'),(9,9,530.75,9,4,'BRL','Não se preocupe, os juros do cartão de crédito são só uma ilusão!','2023-05-20','2024-02-20'),(10,10,221.75,5,4,'Criptomoeda','Se eu fosse um banco, meu lema seria \"Enriqueça-me e me pague juros!\"','2023-05-20','2023-10-20'),(11,11,945.2,8,4,'EUR','Se dinheiro não traz felicidade, me dê o seu e seja feliz!','2023-05-20','2023-06-20'),(12,12,1630.75,3,4,'US','Quando eu crescer, vou ser rico!','2023-05-20','2023-08-20'),(13,13,1645.25,11,4,'BRL','A vida é como uma caixa de chocolates... cheia de contas para pagar!','2023-05-20','2024-04-20'),(14,14,1767.5,1,4,'Criptomoeda','Não sei o que é pior, pagar impostos ou fazer contas de matemática!','2023-05-20','2023-06-20'),(15,15,1020.5,7,4,'EUR','O banco me empresta um guarda-chuva quando está sol e pede de volta quando começa a chover!','2023-05-20','2023-12-20'),(16,16,1490.25,10,4,'BRL','Meu sonho é ter dinheiro suficiente para construir uma piscina de notas de 100 reais!','2023-05-20','2024-03-20'),(17,17,550.75,5,4,'US','Dinheiro não traz felicidade, mas compra muita coisa que faz a gente feliz!','2023-05-20','2023-11-20'),(18,18,1105.75,4,4,'Criptomoeda','Ganhar dinheiro é bom, mas ganhar dinheiro sem fazer nada é ainda melhor!','2023-05-20','2023-09-20'),(19,19,820.5,12,4,'EUR','Dinheiro não traz felicidade, mas pelo menos compra uma ilusão de felicidade!','2023-05-20','2024-05-20'),(20,20,2107.25,2,4,'BRL','Meu orçamento está tão apertado que acho que os juros estão me pagando para ficar com meu dinheiro!','2023-05-20','2023-07-20'),(21,21,390.5,9,4,'US','O dinheiro não traz felicidade, mas pelo menos a gente chora em Paris!','2023-05-20','2024-02-20'),(22,22,1535.75,6,4,'BRL','Dinheiro não é tudo, mas é 99%!','2023-05-20','2023-11-20'),(23,23,1030.5,4,4,'Criptomoeda','Descobri que sou rico... em dívidas!','2023-05-20','2023-09-20'),(24,24,1012.25,8,4,'EUR','Dinheiro não traz felicidade, mas traz pacote de viagem!','2023-05-20','2024-05-20'),(25,25,1550.75,3,4,'US','Investir em ações é como jogar dinheiro no mar... com esperança de que vire um navio!','2023-05-20','2023-08-20'),(26,26,1495.5,11,4,'BRL','Quem nunca teve a sensação de que o dinheiro vai embora mais rápido do que vem?','2023-05-20','2024-04-20'),(27,27,1480.75,1,4,'Criptomoeda','Dinheiro não traz felicidade, mas traz o sorriso do gerente do banco!','2023-05-20','2023-06-20'),(28,28,2420.75,7,4,'EUR','Dinheiro é como um perfume, só é bom quando se espalha!','2023-05-20','2023-12-20'),(29,29,600.5,5,4,'US','Quem disse que dinheiro não traz felicidade, nunca pagou todas as contas!','2023-05-20','2023-11-20'),(30,30,1210.25,4,4,'BRL','Dinheiro não é tudo na vida, mas facilita muito!','2023-05-20','2023-09-20'),(31,31,1015.5,12,4,'Criptomoeda','Dinheiro não traz felicidade, mas eu ainda prefiro chorar em um iate!','2023-05-20','2024-05-20'),(32,32,535.75,9,4,'EUR','Dinheiro não traz felicidade, mas traz um pouco de conforto!','2023-05-20','2024-02-20'),(33,33,355.5,2,4,'BRL','Meu salário parece um atleta olímpico... desaparece em segundos!','2023-05-20','2023-07-20'),(34,34,1808.25,6,4,'US','Dinheiro não é tudo, mas ajuda a comprar tudo!','2023-05-20','2023-11-20'),(35,35,925.75,4,4,'Criptomoeda','Dinheiro não traz felicidade, mas traz um pouco de paz de espírito!','2023-05-20','2023-09-20'),(36,36,1170.5,10,4,'EUR','Quanto mais eu ganho, mais longe eu fico do meu dinheiro!','2023-05-20','2024-03-20'),(37,37,900.75,5,4,'BRL','Dinheiro não traz felicidade, mas traz um pouco de liberdade!','2023-05-20','2023-11-20'),(38,38,740.75,4,4,'US','Dinheiro não é tudo, mas é uma ótima desculpa!','2023-05-20','2023-09-20'),(39,39,2250.5,12,4,'Criptomoeda','Dinheiro não traz felicidade, mas traz um pouco de segurança!','2023-05-20','2024-05-20'),(40,40,1755.25,2,4,'EUR','Dinheiro não é tudo, mas é uma ótima ferramenta!','2023-05-20','2023-07-20'),(41,41,315.5,9,4,'BRL','Dinheiro não traz felicidade, mas traz um pouco de tranquilidade!','2023-05-20','2024-02-20'),(42,42,1835.75,6,4,'EUR','Dinheiro não traz felicidade, mas traz um pouco de estabilidade!','2023-05-20','2024-02-20'),(43,43,800.5,2,4,'BRL','Se o dinheiro falasse, o meu diria adeus rapidinho!','2023-05-20','2023-07-20'),(44,44,1362.25,6,4,'US','Dinheiro não é tudo, mas é uma ótima companhia!','2023-05-20','2023-11-20'),(45,45,950.75,4,4,'Criptomoeda','Dinheiro não traz felicidade, mas traz um pouco de alívio!','2023-05-20','2023-09-20'),(46,46,350.5,10,4,'EUR','Quem disse que o dinheiro não compra felicidade, nunca viu um pacote de viagem!','2023-05-20','2024-03-20'),(47,47,1430.75,5,4,'BRL','Dinheiro não traz felicidade, mas traz um pouco de conforto!','2023-05-20','2023-11-20'),(48,48,1050.75,4,4,'US','Dinheiro não é tudo, mas é uma ótima desculpa!','2023-05-20','2023-09-20'),(49,49,1650.5,12,4,'Criptomoeda','Dinheiro não traz felicidade, mas traz um pouco de segurança!','2023-05-20','2024-05-20'),(50,50,807.25,2,4,'EUR','Dinheiro não é tudo, mas é uma ótima ferramenta!','2023-05-20','2023-07-20'),(51,51,1135.5,9,4,'BRL','Dinheiro não traz felicidade, mas traz um pouco de tranquilidade!','2023-05-20','2023-12-20'),(52,52,1715.75,6,4,'US','Dinheiro não é tudo, mas é uma ótima motivação!','2023-05-20','2023-10-20'),(53,53,320.5,3,4,'EUR','Planejamento financeiro é essencial para garantir estabilidade.','2023-05-20','2023-08-20'),(54,54,1112.25,4,4,'BRL','Mantenha um controle rigoroso dos seus gastos para evitar problemas futuros.','2023-05-20','2023-09-20');
/*!40000 ALTER TABLE `pf_cpa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_cre`
--

DROP TABLE IF EXISTS `pf_cre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_cre` (
  `id` int NOT NULL,
  `idf_nfvOrigem` int DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `numero_parcelas` tinyint DEFAULT NULL,
  `idf_conta` int DEFAULT NULL,
  `moeda` varchar(20) DEFAULT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idf_nfvOrigem` (`idf_nfvOrigem`),
  KEY `idf_conta` (`idf_conta`),
  CONSTRAINT `pf_cre_ibfk_1` FOREIGN KEY (`idf_nfvOrigem`) REFERENCES `pf_nfv` (`id`),
  CONSTRAINT `pf_cre_ibfk_2` FOREIGN KEY (`idf_conta`) REFERENCES `pf_contaban` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_cre`
--

LOCK TABLES `pf_cre` WRITE;
/*!40000 ALTER TABLE `pf_cre` DISABLE KEYS */;
INSERT INTO `pf_cre` VALUES (1,1,240,2,1,'BRL','O cliente (cleiton) vai pagar com 2 bodes porque 1 deles comeu a sua carteira com dinheiro dentro','2023-05-06','2023-07-06'),(2,2,240,6,3,'US','O cliente (maria) vai pagar em notas de monopoly, porque acha que é dinheiro de verdade','2023-04-15','2023-10-15'),(3,3,500,3,5,'EUR','O cliente (joão) vai pagar com um saco de moedas antigas que ele encontrou no sótão','2023-05-01','2023-08-01'),(4,4,1000,9,2,'Criptomoeda','O cliente (ana) vai pagar com bitcoins que ela ganhou jogando Minecraft','2023-06-10','2023-09-10'),(5,5,70,1,4,'BRL','será pago com moedas raras e curiosas, como as de um centavo com imagem do Mickey Mouse.','2023-07-25','2023-08-25'),(6,6,800,8,7,'US','O cliente (sandra) vai pagar com um cheque escrito em uma folha de couve','2023-03-12','2023-11-12'),(7,7,300,4,9,'EUR','O cliente (paulo) vai pagar com uma mala cheia de moedas de 1 centavo','2023-05-30','2023-09-30'),(8,8,300,7,1,'Criptomoeda','O cliente (luciana) vai pagar com Dogecoins, porque acha que vai ficar rica','2023-08-08','2023-09-08'),(9,9,250,5,6,'BRL','O cliente (fernando) vai pagar com uma nota de R$ 3,14, porque acha que isso faz sentido','2023-04-22','2023-09-22'),(10,10,3000,5,6,'EUR','o cliente vai pagar com moedas do Tio Patinhas','2023-03-22','2023-09-22'),(11,11,2970,1,3,'US','O cliente vai pagar com uma moeda de 1 centavo dos EUA','2023-06-05','2023-07-05'),(12,12,300,5,2,'BRL','O cliente vai pagar com uma nota de 1 real dobrada em formato de origami','2023-07-10','2023-12-10'),(13,13,200,4,4,'EUR','O cliente vai pagar com uma moeda antiga de 1 euro que encontrou no fundo de um lago','2023-08-15','2023-12-15'),(14,14,290,2,7,'Criptomoeda','O cliente (pedro) vai pagar com uma fração minúscula de um bitcoin','2023-05-20','2023-07-20'),(15,15,480,3,9,'US','O cliente vai pagar com uma nota de 1 dólar autografada por um famoso jogador de futebol','2023-06-25','2023-09-25'),(16,16,800,6,1,'BRL','O cliente  vai pagar com um vale-presente de 1 real que ele mesmo confeccionou','2023-09-01','2024-02-01'),(17,17,800,3,3,'EUR','O cliente  vai pagar com uma moeda antiga de 1 euro que ela usa como amuleto da sorte','2023-07-05','2023-10-05'),(18,18,1000,7,6,'Criptomoeda','O cliente vai pagar com um token de uma nova criptomoeda que ele acredita ser a próxima Bitcoin','2023-08-10','2023-09-10'),(19,19,120,5,10,'BRL','O cliente vai pagar com uma nota de 1 real que tem a estampa de seu animal de estimação','2023-05-30','2023-09-30'),(20,20,900,4,2,'US','O cliente disse que poderia pagar com cartas raras do jogo de tabuleiro Monopoly','2024-04-10','2024-08-10'),(21,21,250,2,4,'EUR','O cliente quer pagar com uma coleção de figurinhas do álbum da Copa do Mundo de 1982','2024-05-15','2024-07-15'),(22,22,1000,3,7,'Criptomoeda','O cliente sugeriu pagar com uma moeda digital criada por um gênio da lâmpada','2024-06-20','2024-09-20'),(23,23,50,6,9,'US','O cliente prometeu pagar com uma caixa cheia de cupcakes feitos por sua avó','2024-07-25','2025-01-25'),(24,24,990,1,1,'BRL','O cliente disse que poderia lavar o carro do meu chefe como forma de pagamento','2024-08-01','2024-08-01'),(25,25,1200,4,3,'EUR','O cliente propôs pagar com um pacote de ingressos para um show de mágica','2024-09-05','2024-12-05'),(26,26,3000,3,6,'Criptomoeda','O cliente quer pagar com uma moeda virtual que só existe em um universo paralelo','2024-10-10','2025-01-10'),(27,27,450,5,10,'BRL','O cliente sugeriu pagar com uma máquina do tempo que ele inventou','2024-11-15','2025-04-15'),(28,28,450,2,2,'US','O cliente propôs pagar com uma escultura de areia feita por um famoso artista de praia','2024-12-20','2025-02-20');
/*!40000 ALTER TABLE `pf_cre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_fabricante`
--

DROP TABLE IF EXISTS `pf_fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_fabricante` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `data_fundacao` date DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_fabricante`
--

LOCK TABLES `pf_fabricante` WRITE;
/*!40000 ALTER TABLE `pf_fabricante` DISABLE KEYS */;
INSERT INTO `pf_fabricante` VALUES (1,'Power Fuel','Produz produtos fitness, especialmente whey','1990-05-01','contato@powerfuel.com','Brasil','São Paulo - SP'),(2,'Universal Nutrition','Fabricante de suplementos alimentares','1980-01-01','contato@universalnutrition.com','Estados Unidos','Florida'),(3,'Integralmédica','Empresa de suplementos alimentares','1999-05-01','contato@integralmedica.com.br','Brasil','São Paulo - SP'),(4,'Power Food','Marca de alimentos saudáveis','2005-06-15','contato@powerfood.com','Brasil','Rio de Janeiro - RJ'),(5,'Probiótica','Fabricante de suplementos nutricionais','1986-08-21','contato@probiotica.com.br','Brasil','São Paulo - SP'),(6,'Naturovos','Produtora de ovos orgânicos','2009-11-11','contato@naturovos.com.br','Brasil','Santa Catarina - SC'),(7,'Optimum Nutrition','Marca de suplementos nutricionais','1986-05-10','contato@optimumnutrition.com','Estados Unidos','Illinois'),(8,'Power Supplements','Empresa de suplementos alimentares','2001-07-10','contato@powersupplements.com.br','Brasil','Minas Gerais - MG'),(9,'Dymatize','Fabricante de suplementos alimentares','1994-03-10','contato@dymatize.com','Estados Unidos','Texas'),(10,'Now Foods','Empresa de suplementos alimentares','1968-09-01','contato@nowfoods.com','Estados Unidos','Illinois'),(11,'Nature Made','Marca de suplementos alimentares','1971-01-01','contato@naturemade.com','Estados Unidos','California'),(12,'Sunwarrior','Fabricante de suplementos nutricionais','2008-05-01','contato@sunwarrior.com','Estados Unidos','Utah');
/*!40000 ALTER TABLE `pf_fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_fornecedores`
--

DROP TABLE IF EXISTS `pf_fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_fornecedores` (
  `id` int NOT NULL,
  `idf_usu` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idf_usu` (`idf_usu`),
  CONSTRAINT `pf_fornecedores_ibfk_1` FOREIGN KEY (`idf_usu`) REFERENCES `pf_usu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_fornecedores`
--

LOCK TABLES `pf_fornecedores` WRITE;
/*!40000 ALTER TABLE `pf_fornecedores` DISABLE KEYS */;
INSERT INTO `pf_fornecedores` VALUES (1,14),(2,15),(3,16),(4,17),(5,18),(6,19),(7,25),(8,26),(9,27),(10,28),(11,29),(12,30),(13,33);
/*!40000 ALTER TABLE `pf_fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_itemdoctocompra`
--

DROP TABLE IF EXISTS `pf_itemdoctocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_itemdoctocompra` (
  `id` int NOT NULL,
  `ida` int NOT NULL,
  `idf_prod` int DEFAULT NULL,
  `preco_unitario` float DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ida` (`ida`),
  KEY `idf_prod` (`idf_prod`),
  CONSTRAINT `pf_itemdoctocompra_ibfk_1` FOREIGN KEY (`ida`) REFERENCES `pf_nfc` (`id`),
  CONSTRAINT `pf_itemdoctocompra_ibfk_2` FOREIGN KEY (`idf_prod`) REFERENCES `pf_prod` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_itemdoctocompra`
--

LOCK TABLES `pf_itemdoctocompra` WRITE;
/*!40000 ALTER TABLE `pf_itemdoctocompra` DISABLE KEYS */;
INSERT INTO `pf_itemdoctocompra` VALUES (1,1,20,60,30),(2,2,10,100,25),(3,3,5,150,15),(4,4,1,120,20),(5,5,15,90,10),(6,6,20,60,35),(7,7,7,60,30),(8,8,3,50,40),(9,9,12,30,15),(10,10,8,40,5),(11,11,18,80,12),(12,12,6,90,18),(13,13,14,200,8),(14,14,4,80,22),(15,15,19,140,7),(16,16,11,110,14),(17,17,9,10,50),(18,18,13,90,12),(19,19,16,200,5),(20,20,2,70,30),(21,21,17,15,25),(22,22,10,100,15),(23,23,8,40,28),(24,24,3,50,20),(25,25,7,60,25),(26,26,5,150,10),(27,27,1,120,12),(28,28,20,60,40),(29,29,15,90,8),(30,30,16,200,6),(31,31,14,200,5),(32,32,9,10,50),(33,33,12,30,15),(34,34,6,90,20),(35,35,13,90,10),(36,36,18,80,15),(37,37,11,110,8),(38,38,19,140,5),(39,39,4,80,30),(40,40,2,70,25),(41,41,17,15,20),(42,42,5,150,12),(43,43,8,40,22),(44,44,15,90,15),(45,45,3,50,18),(46,46,17,15,30),(47,47,14,200,7),(48,48,10,100,10),(49,49,1,120,15),(50,50,16,200,4),(51,51,19,140,8),(52,52,7,60,28),(53,53,9,10,40),(54,54,11,110,10);
/*!40000 ALTER TABLE `pf_itemdoctocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_itemdoctovenda`
--

DROP TABLE IF EXISTS `pf_itemdoctovenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_itemdoctovenda` (
  `id` int NOT NULL,
  `ida` int NOT NULL,
  `idf_prod` int DEFAULT NULL,
  `preco_unitario` float DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `estoque` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ida` (`ida`),
  KEY `idf_prod` (`idf_prod`),
  CONSTRAINT `pf_itemdoctovenda_ibfk_1` FOREIGN KEY (`ida`) REFERENCES `pf_nfv` (`id`),
  CONSTRAINT `pf_itemdoctovenda_ibfk_2` FOREIGN KEY (`idf_prod`) REFERENCES `pf_prod` (`id`),
  CONSTRAINT `pf_itemdoctovenda_chk_1` CHECK ((`estoque` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_itemdoctovenda`
--

LOCK TABLES `pf_itemdoctovenda` WRITE;
/*!40000 ALTER TABLE `pf_itemdoctovenda` DISABLE KEYS */;
INSERT INTO `pf_itemdoctovenda` VALUES (1,6,4,80,10,'B'),(2,14,9,10,29,'C'),(3,27,14,90,5,'A'),(4,12,3,50,6,'B'),(6,42,19,140,2,'A'),(7,19,9,10,12,'C'),(8,51,20,60,25,'B'),(9,22,10,100,10,'C'),(10,16,4,80,10,'A'),(11,40,18,80,3,'B'),(12,7,5,150,2,'C'),(13,11,6,90,33,'A'),(14,9,3,50,20,'B'),(15,30,12,30,10,'C'),(16,29,12,30,10,'A'),(17,2,1,120,2,'B'),(18,5,2,70,1,'C'),(19,52,20,60,8,'A'),(20,18,8,40,25,'B'),(21,15,7,60,8,'C'),(22,10,5,150,20,'A'),(24,24,11,110,9,'C'),(25,26,13,200,15,'A'),(26,44,19,140,8,'B'),(27,35,14,90,12,'C'),(28,39,16,90,1,'A'),(29,1,1,120,2,'B'),(31,34,13,200,20,'B'),(32,31,12,30,10,'C'),(33,35,14,90,12,'A'),(34,32,13,200,15,'B'),(35,38,15,200,15,'C'),(36,37,15,200,15,'A'),(38,36,14,90,5,'C'),(39,31,12,30,10,'A'),(40,33,14,90,12,'B'),(41,31,12,30,10,'C'),(42,34,13,200,20,'A'),(43,31,12,30,10,'B'),(44,32,13,200,15,'C'),(45,39,16,90,1,'A'),(46,31,12,30,10,'B'),(47,37,15,200,15,'C'),(48,31,12,30,10,'A'),(49,35,14,90,12,'B'),(50,33,14,90,12,'C'),(51,31,12,30,10,'B'),(52,39,16,90,1,'C'),(53,34,13,200,20,'A'),(54,32,13,200,15,'B'),(55,37,15,200,15,'C'),(56,31,12,30,10,'A'),(57,35,14,90,12,'B'),(58,33,14,90,12,'C'),(59,31,12,30,10,'B'),(60,39,16,90,1,'A');
/*!40000 ALTER TABLE `pf_itemdoctovenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_nfc`
--

DROP TABLE IF EXISTS `pf_nfc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_nfc` (
  `id` int NOT NULL,
  `numero_docto` mediumint NOT NULL,
  `dataemi` date DEFAULT NULL,
  `idf_fornecedor` int NOT NULL,
  `valor_mercadoria` float NOT NULL,
  `valor_imposto` float NOT NULL,
  `valor_desconto` float NOT NULL,
  `valor_liquido` float DEFAULT NULL,
  `status_nfe` varchar(50) NOT NULL,
  `forma_pgto` varchar(50) NOT NULL,
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `idf_fornecedor` (`idf_fornecedor`),
  CONSTRAINT `pf_nfc_ibfk_1` FOREIGN KEY (`idf_fornecedor`) REFERENCES `pf_fornecedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_nfc`
--

LOCK TABLES `pf_nfc` WRITE;
/*!40000 ALTER TABLE `pf_nfc` DISABLE KEYS */;
INSERT INTO `pf_nfc` VALUES (1,1,'2023-05-20',11,1800,1000,897.3,1902.7,'Aprovada','Cartão Crédito','Fornecedor disse que iria chegar rápido pois transporte será de avião'),(2,2,'2023-05-21',8,2500,129.21,350.7,2278.51,'Aprovada','Cartão Crédito','Fornecedor esqueceu do pacote da encomenda porque ficou bêbado na última noite'),(3,3,'2023-05-23',2,2250,15.47,0,2265.47,'Rejeitada','Cartão Crédito','Compra negada pelo fornecedor'),(4,4,'2023-05-24',3,2400,30,0,2430,'Em Análise','Dinheiro','Fornecedor irá verificar a possibilidade da venda pelo preço ofertado'),(5,5,'2023-05-25',9,900,62.1,0,962.1,'Aprovada','Pix','Fornecedor disse que aceita pagamento em bitcoins'),(6,6,'2023-05-26',6,2100,89.5,50,2139.5,'Aprovada','Cartão Débito','O fornecedor prometeu um brinde surpresa'),(7,7,'2023-05-27',4,1800,32.15,0,1832.15,'Em Análise','Dinheiro','Fornecedor sugeriu um desconto adicional se eu trouxer meu gato para a loja'),(8,8,'2023-05-28',7,2000,320.2,800,1520.2,'Rejeitada','Cheque','Fornecedor descobriu que não sabe mais como usar cheques'),(9,9,'2023-05-29',10,450,80.75,0,530.75,'Aprovada','Cartão Crédito','Fornecedor disse que fará a entrega vestido de palhaço'),(10,10,'2023-05-30',5,200,21.75,0,221.75,'Rejeitada','Pix','O fornecedor garante que a compra vem com um unicórnio de brinquedo'),(11,11,'2023-05-31',1,960,15.2,30,945.2,'Aprovada','Cartão Débito','Fornecedor disse que tem desconto especial para quem souber cantar ópera'),(12,12,'2023-06-01',11,1620,10.75,0,1630.75,'Em Análise','Dinheiro','Fornecedor prometeu entregar a compra pessoalmente montado em um cavalo branco'),(13,13,'2023-06-02',3,1600,45.25,0,1645.25,'Rejeitada','Cheque','Fornecedor disse que só aceita pagamento em moedas antigas'),(14,14,'2023-06-03',8,1760,7.5,0,1767.5,'Aprovada','Cartão Crédito','O fornecedor prometeu entregar a compra de paraquedas'),(15,15,'2023-06-04',2,980,40.5,0,1020.5,'Em Análise','Dinheiro','Fornecedor sugeriu que eu pague com notas de dominó'),(16,16,'2023-06-05',9,1540,150.25,200,1490.25,'Aprovada','Cartão Crédito','O fornecedor prometeu incluir um passeio de helicóptero na compra'),(17,17,'2023-06-06',6,500,50.75,0,550.75,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em doces'),(18,18,'2023-06-07',10,1080,25.75,0,1105.75,'Aprovada','Cartão Débito','Fornecedor prometeu embalar a compra em papel de presente de unicórnio'),(19,19,'2023-06-08',5,1000,120.5,300,820.5,'Aprovada','Pix','O fornecedor disse que vai enviar a compra junto com um bolo de aniversário'),(20,20,'2023-06-09',11,2100,7.25,0,2107.25,'Rejeitada','Dinheiro','Fornecedor garantiu que a compra vem acompanhada de um golfinho treinado'),(21,21,'2023-06-10',3,375,15.5,0,390.5,'Em Análise','Cartão Crédito','Fornecedor prometeu uma serenata na entrega da compra'),(22,22,'2023-06-11',8,1500,35.75,0,1535.75,'Aprovada','Pix','O fornecedor disse que vai enviar a compra com um arco-íris de balões'),(23,23,'2023-06-12',7,1120,60.5,150,1030.5,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em conchas de praia'),(24,24,'2023-06-13',4,1000,12.25,0,1012.25,'Aprovada','Cartão Débito','O fornecedor prometeu entregar a compra vestido de super-herói'),(25,25,'2023-06-14',1,1500,50.75,0,1550.75,'Em Análise','Dinheiro','Fornecedor sugeriu que eu pague com moedas de chocolate'),(26,26,'2023-06-15',9,1500,15.5,20,1495.5,'Aprovada','Cartão Crédito','O fornecedor prometeu incluir um passeio de montanha-russa na compra'),(27,27,'2023-06-16',6,1440,40.75,0,1480.75,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em notas musicais'),(28,28,'2023-06-17',10,2400,20.75,0,2420.75,'Aprovada','Cartão Débito','Fornecedor prometeu embalar a compra em papel de presente com estampas de astronauta'),(29,29,'2023-06-18',5,720,80.5,200,600.5,'Aprovada','Pix','O fornecedor disse que vai enviar a compra junto com um show de fogos de artifício'),(30,30,'2023-06-19',11,1200,10.25,0,1210.25,'Rejeitada','Dinheiro','Fornecedor garantiu que a compra vem acompanhada de um panda de pelúcia'),(31,31,'2023-06-20',3,1000,15.5,0,1015.5,'Em Análise','Cartão Crédito','Fornecedor prometeu uma dança na entrega da compra'),(32,32,'2023-06-21',8,500,35.75,0,535.75,'Aprovada','Pix','O fornecedor disse que vai enviar a compra com um arco-íris de balões'),(33,33,'2023-06-22',7,450,55.5,150,355.5,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em folhas de outono'),(34,34,'2023-06-23',4,1800,8.25,0,1808.25,'Aprovada','Cartão Débito','O fornecedor prometeu entregar a compra vestido de pirata'),(35,35,'2023-06-24',1,900,25.75,0,925.75,'Em Análise','Dinheiro','Fornecedor sugeriu que eu pague com notas de papel coloridas'),(36,36,'2023-06-25',9,1200,70.5,100,1170.5,'Aprovada','Cartão Crédito','O fornecedor prometeu incluir um passeio de barco na compra'),(37,37,'2023-06-26',6,880,20.75,0,900.75,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em desenhos'),(38,38,'2023-06-27',10,700,40.75,0,740.75,'Aprovada','Cartão Débito','Fornecedor prometeu embalar a compra em papel de presente com estampas de animais selvagens'),(39,39,'2023-06-28',5,2400,150.5,300,2250.5,'Aprovada','Pix','O fornecedor disse que vai enviar a compra junto com um show de malabarismo'),(40,40,'2023-06-29',11,1750,5.25,0,1755.25,'Rejeitada','Dinheiro','Fornecedor garantiu que a compra vem acompanhada de um unicórnio de verdade'),(41,41,'2023-06-30',3,300,15.5,0,315.5,'Em Análise','Cartão Crédito','Fornecedor prometeu fazer um truque de mágica na entrega da compra'),(42,42,'2023-07-01',8,1800,35.75,0,1835.75,'Aprovada','Pix','O fornecedor disse que vai enviar a compra com um balão gigante'),(43,43,'2023-07-02',7,880,20.5,100,800.5,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em cartas de amor'),(44,44,'2023-07-03',4,1350,12.25,0,1362.25,'Aprovada','Cartão Débito','O fornecedor prometeu entregar a compra vestido de palhaço'),(45,45,'2023-07-04',1,900,50.75,0,950.75,'Em Análise','Dinheiro','Fornecedor sugeriu que eu pague com notas de origami'),(46,46,'2023-07-05',9,450,100.5,200,350.5,'Aprovada','Cartão Crédito','O fornecedor prometeu incluir um passeio de limusine na compra'),(47,47,'2023-07-06',6,1400,30.75,0,1430.75,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em abraços'),(48,48,'2023-07-07',10,1000,50.75,0,1050.75,'Aprovada','Cartão Débito','Fornecedor prometeu embalar a compra em papel de presente com estampas de flores'),(49,49,'2023-07-08',5,1800,150.5,300,1650.5,'Aprovada','Pix','O fornecedor disse que vai enviar a compra junto com um show de malabarismo'),(50,50,'2023-07-09',11,800,7.25,0,807.25,'Rejeitada','Dinheiro','Fornecedor garantiu que a compra vem acompanhada de um cachorro treinado'),(51,51,'2023-07-10',3,1120,15.5,0,1135.5,'Em Análise','Cartão Crédito','Fornecedor prometeu cantar uma música na entrega da compra'),(52,52,'2023-07-11',8,1680,35.75,0,1715.75,'Aprovada','Pix','O fornecedor disse que vai enviar a compra com um balão gigante'),(53,53,'2023-07-12',7,400,20.5,100,320.5,'Rejeitada','Cheque','Fornecedor disse que aceita pagamento em sorrisos'),(54,54,'2023-07-13',4,1100,12.25,0,1112.25,'Aprovada','Cartão Débito','O fornecedor prometeu entregar a compra vestido de astronauta');
/*!40000 ALTER TABLE `pf_nfc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_nfv`
--

DROP TABLE IF EXISTS `pf_nfv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_nfv` (
  `id` int NOT NULL,
  `numero_docto` mediumint NOT NULL,
  `dataemi` date DEFAULT NULL,
  `idf_cliente` int NOT NULL,
  `valor_mercadoria` float NOT NULL,
  `valor_imposto` float NOT NULL,
  `valor_desconto` float NOT NULL,
  `valor_liquido` float DEFAULT NULL,
  `status_nfe` varchar(50) NOT NULL,
  `forma_pgto` varchar(50) NOT NULL,
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `idf_cliente` (`idf_cliente`),
  CONSTRAINT `pf_nfv_ibfk_1` FOREIGN KEY (`idf_cliente`) REFERENCES `pf_clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_nfv`
--

LOCK TABLES `pf_nfv` WRITE;
/*!40000 ALTER TABLE `pf_nfv` DISABLE KEYS */;
INSERT INTO `pf_nfv` VALUES (1,1,'2023-05-06',2,240,48,0,288,'Emitida','Pix','Entregar na mão do Cleiton próximo ao posto de gasolina'),(2,2,'2023-05-07',1,240,20,5,255,'Rejeitado','Cartão débito','Enviar para o endereço do cliente'),(3,3,'2023-05-08',5,500,50,50,500,'Autorizada','Boleto','Retirar na loja física'),(4,4,'2023-05-09',9,1000,100,100,1000,'Rascunho','Cartão crédito','Entregar no escritório do cliente'),(5,5,'2023-05-10',12,70,75,0,145,'Emitida','Cheque','Enviar para o endereço do cliente'),(6,6,'2023-05-11',7,800,80,20,860,'Rejeitado','Dinheiro','Retirar na loja física'),(7,7,'2023-05-12',13,300,150,50,400,'Autorizada','Pix','Entregar no escritório do cliente'),(8,8,'2023-05-13',19,250,25,10,265,'Emitida','Cartão débito','Enviar para o endereço do cliente'),(9,9,'2023-05-14',4,1000,40,10,1030,'Denegada','Cartão crédito','Retirar na loja física'),(10,10,'2023-05-15',18,3000,120,0,3120,'Rascunho','Boleto','Entregar no escritório do cliente'),(11,11,'2023-05-16',8,2970,45,0,3015,'Emitida','Pix','Entregar na casa do cliente'),(12,12,'2023-05-17',3,300,300,0,600,'Autorizada','Cartão crédito','Enviar para o endereço do cliente'),(13,13,'2023-05-18',10,200,20,5,215,'Rejeitado','Cheque','Retirar na loja física'),(14,14,'2023-05-19',7,290,100,0,390,'Emitida','Dinheiro','Entregar na casa do cliente'),(15,15,'2023-05-20',16,480,15,0,495,'Autorizada','Boleto','Retirar no escritório do cliente'),(16,16,'2023-05-21',11,800,18,0,818,'Emitida','Cartão débito','Enviar para o endereço do cliente'),(17,17,'2023-05-22',20,800,80,10,870,'Rascunho','Cartão crédito','Entregar na casa do cliente'),(18,18,'2023-05-23',5,1000,400,0,1400,'Autorizada','Pix','Enviar para o endereço do cliente'),(19,19,'2023-05-24',9,120,65,0,185,'Rejeitado','Cheque','Retirar na loja física'),(20,20,'2023-05-25',14,900,90,20,970,'Emitida','Boleto','Entregar na casa do cliente'),(21,21,'2023-05-26',6,250,25,0,275,'Emitida','Boleto','Retirar na loja física'),(22,22,'2023-05-27',19,1000,150,0,1150,'Autorizada','Cartão crédito','Enviar para o endereço do cliente'),(23,23,'2023-05-28',12,50,5,0,55,'Emitida','Pix','Entregar na casa do cliente'),(24,24,'2023-05-29',15,990,70,0,1060,'Rascunho','Cheque','Retirar no escritório do cliente'),(25,25,'2023-05-30',2,1200,120,0,1320,'Autorizada','Cartão débito','Entregar na casa do cliente'),(26,26,'2023-05-31',13,3000,95,0,3095,'Emitida','Boleto','Enviar para o endereço do cliente'),(27,27,'2023-06-01',8,450,8,0,458,'Autorizada','Dinheiro','Retirar na loja física'),(28,28,'2023-06-02',7,450,45,0,495,'Emitida','Pix','Entregar na casa do cliente'),(29,29,'2023-06-03',16,300,35,0,335,'Rejeitado','Boleto','Retirar no escritório do cliente'),(30,30,'2023-06-04',4,300,200,50,450,'Emitida','Cartão crédito','Enviar para o endereço do cliente'),(31,31,'2023-06-05',11,300,50,0,350,'Emitida','Boleto','Agendado para entrega em horário comercial'),(32,32,'2023-06-06',9,3000,7.5,0,3007.5,'Autorizada','Cartão crédito','Necessário confirmação por e-mail antes da entrega'),(33,33,'2023-06-07',18,1080,100,50,1130,'Emitida','Cartão débito','Endereço de entrega diferente do endereço de cobrança'),(34,34,'2023-06-08',5,4000,20,0,4020,'Rascunho','Cheque','Pagamento parcelado em 3 vezes'),(35,35,'2023-06-09',3,1080,150,0,1230,'Autorizada','Pix','Endereço de entrega não possui numeração'),(36,36,'2023-06-10',14,450,25,0,475,'Emitida','Boleto','Entrega agendada para o dia seguinte'),(37,37,'2023-06-11',10,3000,80,0,3080,'Autorizada','Cartão crédito','Pedido com entrega urgente'),(38,38,'2023-06-12',1,3000,30,0,3030,'Emitida','Cheque','Necessário apresentar documento com foto na entrega'),(39,39,'2023-06-13',6,90,5,0,95,'Rejeitado','Boleto','Endereço de entrega incompleto'),(40,40,'2023-06-14',20,240,60,0,300,'Emitida','Cartão débito','Pedido com brinde exclusivo para essa compra'),(41,41,'2023-07-01',2,350,35,0,385,'Emitida','Cartão crédito','Pedido com envio de beijo virtual de agradecimento'),(42,42,'2023-07-02',7,280,200,0,480,'Autorizada','Boleto','Entrega com pom-pom de torcida organizada'),(43,43,'2023-07-03',8,100,10,0,110,'Rascunho','Cartão débito','Pedido com inclusão de música no estilo jazz na entrega'),(44,44,'2023-07-04',10,1120,80,0,1200,'Emitida','Pix','Necessário entregar pedido com um abraço apertado'),(45,45,'2023-07-05',11,500,50,0,550,'Autorizada','Cheque','Pedido com mensagem de amor escrita em papel perfumado'),(46,46,'2023-07-06',13,150,15,0,165,'Rejeitado','Boleto','Pedido com entrega de poema personalizado'),(47,47,'2023-07-07',14,1200,120,0,1320,'Emitida','Cartão crédito','Entrega com fantasia de super-herói'),(48,48,'2023-07-08',17,2500,250,0,2750,'Autorizada','Cheque','Pedido com declamação de poesia na entrega'),(49,49,'2023-07-09',18,75,7.5,0,82.5,'Emitida','Pix','Pedido com entrega de balão em formato de coração'),(50,50,'2023-07-10',19,400,40,0,440,'Rascunho','Cartão débito','Entrega com mensagem de agradecimento em vídeo personalizado'),(51,51,'2023-08-01',5,1500,100,0,1600,'Emitida','Cartão crédito','Pedido com entrega de uma piada ruim grátis'),(52,52,'2023-08-02',9,480,15,0,495,'Autorizada','Boleto','Pedido com entrega de um sorriso bobo como cortesia'),(53,53,'2023-08-03',12,500,50,0,550,'Rascunho','Cartão débito','Entrega com uma imitação malfeita do Scooby-Doo'),(54,54,'2023-08-04',15,800,80,0,880,'Emitida','Pix','Pedido com entrega de um trocadilho infame'),(55,55,'2023-08-05',19,250,25,0,275,'Autorizada','Cheque','Pedido com entrega de uma performance de stand-up comedy'),(56,56,'2023-08-06',3,70,7,0,77,'Rejeitado','Boleto','Entrega com uma piada de duplo sentido'),(57,57,'2023-08-07',6,400,40,0,440,'Emitida','Cartão crédito','Pedido com entrega de um meme exclusivo'),(58,58,'2023-08-08',14,1200,120,0,1320,'Autorizada','Cheque','Entrega com uma charada para resolver'),(59,59,'2023-08-09',20,1500,150,0,1650,'Emitida','Pix','Pedido com entrega de um enigma indecifrável'),(60,60,'2023-08-10',1,200,20,0,220,'Rascunho','Cartão débito','Entrega com um truque de mágica.');
/*!40000 ALTER TABLE `pf_nfv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_papel_usu`
--

DROP TABLE IF EXISTS `pf_papel_usu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_papel_usu` (
  `id` int NOT NULL,
  `tipo` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pf_papel_usu_chk_1` CHECK ((`tipo` in (_utf8mb4'Cliente',_utf8mb4'Fornecedor')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_papel_usu`
--

LOCK TABLES `pf_papel_usu` WRITE;
/*!40000 ALTER TABLE `pf_papel_usu` DISABLE KEYS */;
INSERT INTO `pf_papel_usu` VALUES (10,'Cliente'),(20,'Fornecedor');
/*!40000 ALTER TABLE `pf_papel_usu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_prod`
--

DROP TABLE IF EXISTS `pf_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_prod` (
  `id` int NOT NULL,
  `nmprod` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `importado` tinyint(1) NOT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `peso_liq` mediumint DEFAULT NULL,
  `volume` mediumint DEFAULT NULL,
  `estoque` char(1) DEFAULT NULL,
  `idf_fabricante` int DEFAULT NULL,
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idf_fabricante` (`idf_fabricante`),
  CONSTRAINT `pf_prod_ibfk_1` FOREIGN KEY (`idf_fabricante`) REFERENCES `pf_fabricante` (`id`),
  CONSTRAINT `pf_prod_chk_1` CHECK ((`estoque` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_prod`
--

LOCK TABLES `pf_prod` WRITE;
/*!40000 ALTER TABLE `pf_prod` DISABLE KEYS */;
INSERT INTO `pf_prod` VALUES (1,'Whey banana','Whey sabor banana com essência de baunilha','Max Iron',0,'Power Fuel',1000,NULL,'C',1,120),(2,'BCAA','Aminoácidos de cadeia ramificada','Max Iron',0,'Power Fuel',500,NULL,'A',1,70),(3,'Whey Morango','Whey sabor morango com essência de baunilha','Max Iron',0,'Power Fuel',1000,NULL,'B',1,50),(4,'Creatina','Suplemento para ganho de massa muscular','Universal Nutrition',1,'Universal Nutrition',300,NULL,'C',2,80),(5,'Glutamina','Aminoácido essencial para a recuperação muscular','Integralmédica',0,'Integralmédica',250,NULL,'A',3,150),(6,'Hipercalórico','Suplemento para ganho de massa muscular','Max Titanium',0,'Power Food',3000,NULL,'C',4,90),(7,'Termogênico','Suplemento para queima de gordura corporal','Probiótica',1,'Probiótica',120,NULL,'B',5,60),(8,'Albumina','Proteína de alta qualidade para o ganho de massa muscular','Naturovos',0,'Naturovos',500,NULL,'A',6,40),(9,'Multivitamínico','Suplemento vitamínico para reposição de nutrientes','Optimum Nutrition',1,'Optimum Nutrition',90,NULL,'B',7,10),(10,'Barra de Proteína','Snack rico em proteínas para consumo pós-treino','Integralmédica',0,'Integralmédica',60,NULL,'A',3,100),(11,'Pre-Workout','Suplemento para melhorar o desempenho nos treinos','Black Skull',0,'Power Supplements',300,NULL,'C',8,110),(12,'Caseína','Proteína de absorção lenta ideal para consumo noturno','Dymatize',1,'Dymatize',500,NULL,'B',9,30),(13,'Omega 3','Suplemento com ácidos graxos essenciais','Now Foods',1,'Now Foods',120,NULL,'A',10,200),(14,'Cafeína','Suplemento para aumentar a energia e foco nos treinos','Integralmédica',0,'Integralmédica',100,NULL,'C',3,90),(15,'Gainer','Suplemento para ganho de massa muscular','Max Titanium',0,'Power Food',2500,NULL,'B',4,200),(16,'HMB','Suplemento para reduzir a quebra muscular durante o treino','Optimum Nutrition',1,'Optimum Nutrition',60,NULL,'A',7,90),(17,'Vitamina C','Suplemento vitamínico para fortalecimento do sistema imunológico','Nature Made',1,'Nature Made',60,NULL,'C',11,15),(18,'ZMA','Suplemento para melhor recuperação e crescimento muscular durante o sono','Optimum Nutrition',1,'Optimum Nutrition',120,NULL,'B',7,80),(19,'Proteína Vegana','Suplemento de proteína vegetal para veganos','Sunwarrior',1,'Sunwarrior',500,NULL,'A',12,140),(20,'Tribulus Terrestris','Suplemento para aumentar os níveis de testosterona','Max Titanium',0,'Power Food',100,NULL,'C',4,60);
/*!40000 ALTER TABLE `pf_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_usu`
--

DROP TABLE IF EXISTS `pf_usu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_usu` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idade` tinyint DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `cpf_cnpj` varchar(14) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `estado_sigla` char(2) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero_casa` smallint NOT NULL,
  `papel_usu` varchar(50) DEFAULT NULL,
  `idf_papel_usu` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idf_papel_usu` (`idf_papel_usu`),
  CONSTRAINT `pf_usu_ibfk_1` FOREIGN KEY (`idf_papel_usu`) REFERENCES `pf_papel_usu` (`id`),
  CONSTRAINT `pf_usu_chk_1` CHECK ((`sexo` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_usu`
--

LOCK TABLES `pf_usu` WRITE;
/*!40000 ALTER TABLE `pf_usu` DISABLE KEYS */;
INSERT INTO `pf_usu` VALUES (1,'Cleiton Jimin','cleiton@hotmail.com',26,'M','12345678900','Brasil','SP','São Paulo','Limoeiro','Avenida Europa',500,'Cliente',10),(2,'Ana Maria Silva','ana.silva@gmail.com',33,'F','23456789012','Brasil','MG','Belo Horizonte','Savassi','Rua Alagoas',123,'Cliente',10),(3,'Pedro Souza Santos','psouza@hotmail.com',45,'M','34567890123','Brasil','BA','Salvador','Barra','Avenida Oceânica',555,'Cliente',10),(4,'Juliana Lima Alves','juliana.lima@gmail.com',28,'F','45678901234','Brasil','RJ','Rio de Janeiro','Copacabana','Rua Barata Ribeiro',789,'Cliente',10),(5,'Lucas Ferreira Costa','lucasfc@yahoo.com',22,'M','56789012345','Brasil','SP','São Paulo','Itaim Bibi','Rua Joaquim Floriano',321,'Cliente',10),(6,'Amanda Santos Oliveira','amandaso@hotmail.com',31,'F','67890123456','Brasil','RS','Porto Alegre','Moinhos de Vento','Rua Padre Chagas',456,'Cliente',10),(7,'Diego Araujo Almeida','diegoaraujo@gmail.com',39,'M','78901234567','Brasil','SC','Florianópolis','Centro','Rua Conselheiro Mafra',654,'Cliente',10),(8,'Gabriel Souza','gabriel.souza@gmail.com',24,'M','23456789012','Brasil','RJ','Rio de Janeiro','Ipanema','Rua Vinícius de Moraes',123,'Cliente',10),(9,'Mariana Costa','mariana_costa@hotmail.com',31,'F','34567890123','Brasil','SP','São Paulo','Jardim Paulista','Rua Estados Unidos',789,'Cliente',10),(10,'Lucas Oliveira','lucas_oliveira@yahoo.com',27,'M','45678901234','Brasil','SC','Florianópolis','Trindade','Rua Lauro Linhares',321,'Cliente',10),(11,'Isabela Santos','isabela_santos@gmail.com',30,'F','56789012345','Brasil','PR','Curitiba','Batel','Rua Coronel Dulcídio',456,'Cliente',10),(12,'Marcelo Pereira','marcelo_pereira@hotmail.com',35,'M','67890123456','Brasil','RS','Porto Alegre','Moinhos de Vento','Rua 24 de Outubro',654,'Cliente',10),(13,'Carolina Silva','carolina_silva@yahoo.com',28,'F','78901234567','Brasil','BA','Salvador','Rio Vermelho','Rua Fonte do Boi',321,'Cliente',10),(14,'Vitrine de Moda LTDA','contato@vitrinedemoda.com.br',NULL,NULL,'12345678901230','Brasil','RS','Porto Alegre','Centro Histórico','Rua dos Andradas',1500,'Fornecedor',20),(15,'TechMaster Informática','contato@techmaster.com.br',NULL,NULL,'23456789012340','Brasil','SP','São Paulo','Moema','Avenida Ibirapuera',2000,'Fornecedor',20),(16,'Delícias do Campo Alimentos','contato@deliciasdocampo.com.br',NULL,NULL,'34567890123450','Brasil','PR','Curitiba','Cabral','Rua Prof. Guido Straube',100,'Fornecedor',20),(17,'Ecoenergia Sustentabilidade','contato@ecoenergia.com.br',NULL,NULL,'45678901234560','Brasil','RJ','Rio de Janeiro','Centro','Avenida Rio Branco',100,'Fornecedor',20),(18,'Festas Incríveis Decorações','contato@festasincriveis.com.br',NULL,NULL,'56789012345670','Brasil','SP','Campinas','Jardim Santa Genebra','Avenida José de Souza Campos',1600,'Fornecedor',20),(19,'Cosméticos Beauty Care','contato@beautycare.com.br',NULL,NULL,'67890123456780','Brasil','MG','Belo Horizonte','Savassi','Rua Paraíba',1000,'Fornecedor',20),(20,'Günther Wilhelm Schwarz','gunther@hotmail.com',28,'M','12345678900','Alemanha','EX','München','Maxvorstadt','Englischer Garten',500,'Cliente',10),(21,'Anna Schmidt','anna.schmidt@gmail.com',35,'F','98765432100','Alemanha','EX','Berlim','Mitte','Friedrichstraße',123,'Cliente',10),(22,'Lars Müller','larsmueller@yahoo.de',42,'M','45678912300','Alemanha','EX','Hamburgo','St. Pauli','Reeperbahn',456,'Cliente',10),(23,'Julia Braun','julia.braun@web.de',27,'F','32165498700','Alemanha','EX','Frankfurt','Sachsenhausen','Schweizer Straße',789,'Cliente',10),(24,'Hans Wagner','hans_wagner@hotmail.com',50,'M','74185296300','Alemanha','EX','Munique','Schwabing','Leopoldstraße',987,'Cliente',10),(25,'Stefan Huber','shuber@fornecedor.com',38,'M','65498732100','Suíça','EX','Zurique','Altstadt','Bahnhofstrasse',321,'Fornecedor',20),(26,'Monika Meier','mmeier@fornecedor.com',45,'F','14785236900','Suíça','EX','Genebra','Plainpalais','Rue de Carouge',654,'Fornecedor',20),(27,'Roland Fischer','rfischer@fornecedor.com',32,'M','36985214700','Suíça','EX','Basileia','Grossbasel','Steinenvorstadt',987,'Fornecedor',20),(28,'Heidi Schmid','hschmid@fornecedor.com',55,'F','25836914700','Suíça','EX','Lucerna','Alstadt','Kapellplatz',258,'Fornecedor',20),(29,'ABC Inc.','abc.inc@empresas.com',NULL,NULL,'12345678901234','Estados Unidos','EX','Nova York','Midtown','5th Avenue',100,'Fornecedor',20),(30,'XYZ Company','xyz.co@empresas.com',NULL,NULL,'56789012345678','Estados Unidos','EX','Los Angeles','Beverly Hills','Rodeo Drive',200,'Fornecedor',20),(31,'Smith & Co.','smith.co@empresas.com',NULL,NULL,'90123456789012','Estados Unidos','EX','Chicago','Loop','Michigan Avenue',300,'Cliente',10),(32,'Green Energy LLC','green.energy@empresas.com',NULL,NULL,'34567890123456','Estados Unidos','EX','Houston','Downtown','Main Street',400,'Cliente',10),(33,'Global Enterprises Inc.','global.ent@empresas.com',NULL,NULL,'78901234567890','Estados Unidos','EX','Miami','Brickell','South Miami Avenue',500,'Fornecedor',20);
/*!40000 ALTER TABLE `pf_usu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_caixaempresa`
--

DROP TABLE IF EXISTS `vw_caixaempresa`;
/*!50001 DROP VIEW IF EXISTS `vw_caixaempresa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_caixaempresa` AS SELECT 
 1 AS `TIPO_OPERACAO`,
 1 AS `ID`,
 1 AS `DoctoOrigem`,
 1 AS `Valor_Liquido_Moeda`,
 1 AS `NUMERO_PARCELAS`,
 1 AS `MOEDA`,
 1 AS `OBSERVACAO`,
 1 AS `DATA_EMISSAO`,
 1 AS `DATA_VENCIMENTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cashflow`
--

DROP TABLE IF EXISTS `vw_cashflow`;
/*!50001 DROP VIEW IF EXISTS `vw_cashflow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cashflow` AS SELECT 
 1 AS `Tipo_Operacao`,
 1 AS `ID`,
 1 AS `DoctoOrigem`,
 1 AS `VALOR`,
 1 AS `NUMERO_PARCELAS`,
 1 AS `MOEDA`,
 1 AS `OBSERVACAO`,
 1 AS `DATA_EMISSAO`,
 1 AS `DATA_VENCIMENTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_entradasaida`
--

DROP TABLE IF EXISTS `vw_entradasaida`;
/*!50001 DROP VIEW IF EXISTS `vw_entradasaida`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_entradasaida` AS SELECT 
 1 AS `Tipo_Registro`,
 1 AS `TIPO_OPERACAO`,
 1 AS `ID_NF`,
 1 AS `DOCTO_NF`,
 1 AS `DATAEMI`,
 1 AS `VALOR_LIQUIDO`,
 1 AS `Valor_Liquido_Moeda`,
 1 AS `VALOR_IMPOSTO`,
 1 AS `STATUS_NFE`,
 1 AS `FORMA_PGTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_resultadosliquidoanalitico`
--

DROP TABLE IF EXISTS `vw_resultadosliquidoanalitico`;
/*!50001 DROP VIEW IF EXISTS `vw_resultadosliquidoanalitico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_resultadosliquidoanalitico` AS SELECT 
 1 AS `Tipo_Registro`,
 1 AS `TIPO_OPERACAO`,
 1 AS `Val_Liq`,
 1 AS `Val_Liq_Moeda`,
 1 AS `Val_Imposto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_resultadosliquidosintetico`
--

DROP TABLE IF EXISTS `vw_resultadosliquidosintetico`;
/*!50001 DROP VIEW IF EXISTS `vw_resultadosliquidosintetico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_resultadosliquidosintetico` AS SELECT 
 1 AS `Result_Liq`,
 1 AS `Val_Imp`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_caixaempresa`
--

/*!50001 DROP VIEW IF EXISTS `vw_caixaempresa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_caixaempresa` AS select `vw_cashflow`.`Tipo_Operacao` AS `TIPO_OPERACAO`,`vw_cashflow`.`ID` AS `ID`,`vw_cashflow`.`DoctoOrigem` AS `DoctoOrigem`,cast((case when (`vw_cashflow`.`MOEDA` = 'BRL') then `vw_cashflow`.`VALOR` when (`vw_cashflow`.`MOEDA` = 'US') then (`vw_cashflow`.`VALOR` * 5) when (`vw_cashflow`.`MOEDA` = 'EUR') then (`vw_cashflow`.`VALOR` * 5.41) when (`vw_cashflow`.`MOEDA` = 'Criptomoeda') then (`vw_cashflow`.`VALOR` * 11.71) else 'Não há índice' end) as decimal(12,2)) AS `Valor_Liquido_Moeda`,`vw_cashflow`.`NUMERO_PARCELAS` AS `NUMERO_PARCELAS`,`vw_cashflow`.`MOEDA` AS `MOEDA`,`vw_cashflow`.`OBSERVACAO` AS `OBSERVACAO`,`vw_cashflow`.`DATA_EMISSAO` AS `DATA_EMISSAO`,`vw_cashflow`.`DATA_VENCIMENTO` AS `DATA_VENCIMENTO` from `vw_cashflow` order by `vw_cashflow`.`DATA_EMISSAO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cashflow`
--

/*!50001 DROP VIEW IF EXISTS `vw_cashflow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cashflow` AS select 'Contas a Receber' AS `Tipo_Operacao`,`pf_cre`.`id` AS `ID`,`pf_cre`.`idf_nfvOrigem` AS `DoctoOrigem`,`pf_cre`.`valor` AS `VALOR`,`pf_cre`.`numero_parcelas` AS `NUMERO_PARCELAS`,`pf_cre`.`moeda` AS `MOEDA`,`pf_cre`.`observacao` AS `OBSERVACAO`,`pf_cre`.`data_emissao` AS `DATA_EMISSAO`,`pf_cre`.`data_vencimento` AS `DATA_VENCIMENTO` from `pf_cre` union all select 'Contas a Pagar' AS `Tipo_Operacao`,`pf_cpa`.`id` AS `ID`,`pf_cpa`.`idf_nfcOrigem` AS `DoctoOrigem`,`pf_cpa`.`valor` AS `VALOR`,`pf_cpa`.`numero_parcelas` AS `NUMERO_PARCELAS`,`pf_cpa`.`moeda` AS `MOEDA`,`pf_cpa`.`observacao` AS `OBSERVACAO`,`pf_cpa`.`data_emissao` AS `DATA_EMISSAO`,`pf_cpa`.`data_vencimento` AS `DATA_VENCIMENTO` from `pf_cpa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entradasaida`
--

/*!50001 DROP VIEW IF EXISTS `vw_entradasaida`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entradasaida` AS select 'Venda' AS `Tipo_Registro`,`b`.`TIPO_OPERACAO` AS `TIPO_OPERACAO`,`a`.`id` AS `ID_NF`,`a`.`numero_docto` AS `DOCTO_NF`,`a`.`dataemi` AS `DATAEMI`,`a`.`valor_liquido` AS `VALOR_LIQUIDO`,`b`.`Valor_Liquido_Moeda` AS `Valor_Liquido_Moeda`,`a`.`valor_imposto` AS `VALOR_IMPOSTO`,`a`.`status_nfe` AS `STATUS_NFE`,`a`.`forma_pgto` AS `FORMA_PGTO` from (`pf_nfv` `a` join `vw_caixaempresa` `b` on(((`a`.`id` = `b`.`DoctoOrigem`) and (`b`.`TIPO_OPERACAO` = 'Contas a Receber')))) where ((`a`.`status_nfe` in ('Emitida','Autorizada')) and (year(`a`.`dataemi`) = 2023)) union all select 'Compra' AS `Tipo_Registro`,`f`.`TIPO_OPERACAO` AS `TIPO_OPERACAO`,`aa`.`id` AS `ID_NF`,`aa`.`numero_docto` AS `DOCTO_NF`,`aa`.`dataemi` AS `DATAEMI`,`aa`.`valor_liquido` AS `VALOR_LIQUIDO`,`f`.`Valor_Liquido_Moeda` AS `Valor_Liquido_Moeda`,`aa`.`valor_imposto` AS `VALOR_IMPOSTO`,`aa`.`status_nfe` AS `status_nfe`,`aa`.`forma_pgto` AS `FORMA_PGTO` from (`pf_nfc` `aa` join `vw_caixaempresa` `f` on(((`aa`.`id` = `f`.`DoctoOrigem`) and (`f`.`TIPO_OPERACAO` = 'Contas a Pagar')))) where ((`aa`.`status_nfe` = 'Aprovada') and (year(`aa`.`dataemi`) = 2023)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_resultadosliquidoanalitico`
--

/*!50001 DROP VIEW IF EXISTS `vw_resultadosliquidoanalitico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_resultadosliquidoanalitico` AS select `vw_entradasaida`.`Tipo_Registro` AS `Tipo_Registro`,`vw_entradasaida`.`TIPO_OPERACAO` AS `TIPO_OPERACAO`,sum(`vw_entradasaida`.`VALOR_LIQUIDO`) AS `Val_Liq`,sum(`vw_entradasaida`.`Valor_Liquido_Moeda`) AS `Val_Liq_Moeda`,sum(`vw_entradasaida`.`VALOR_IMPOSTO`) AS `Val_Imposto` from `vw_entradasaida` where (`vw_entradasaida`.`STATUS_NFE` in ('Aprovada','Autorizada')) group by `vw_entradasaida`.`Tipo_Registro`,`vw_entradasaida`.`TIPO_OPERACAO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_resultadosliquidosintetico`
--

/*!50001 DROP VIEW IF EXISTS `vw_resultadosliquidosintetico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_resultadosliquidosintetico` AS select cast(sum(if((`vw_resultadosliquidoanalitico`.`Tipo_Registro` = 'Compra'),(`vw_resultadosliquidoanalitico`.`Val_Liq_Moeda` * -(1)),`vw_resultadosliquidoanalitico`.`Val_Liq_Moeda`)) as decimal(12,2)) AS `Result_Liq`,cast(sum(`vw_resultadosliquidoanalitico`.`Val_Imposto`) as decimal(12,2)) AS `Val_Imp` from `vw_resultadosliquidoanalitico` */;
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

-- Dump completed on 2023-05-20 14:27:51
