-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: central_ledger
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `amountType`
--

DROP TABLE IF EXISTS `amountType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amountType` (
  `amountTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`amountTypeId`),
  UNIQUE KEY `amounttype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amountType`
--

LOCK TABLES `amountType` WRITE;
/*!40000 ALTER TABLE `amountType` DISABLE KEYS */;
INSERT INTO `amountType` VALUES (1,'SEND','Amount the Payer would like to send; that is, the amount that should be withdrawn from the Payer account including any fees','2023-08-24 12:47:33'),(2,'RECEIVE','Amount the Payer would like the Payee to receive; that is, the amount that should be sent to the receiver exclusive fees','2023-08-24 12:47:33');
/*!40000 ALTER TABLE `amountType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balanceOfPayments`
--

DROP TABLE IF EXISTS `balanceOfPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `balanceOfPayments` (
  `balanceOfPaymentsId` int unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL COMMENT 'Possible values and meaning are defined in https://www.imf.org/external/np/sta/bopcode/',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`balanceOfPaymentsId`),
  UNIQUE KEY `balanceofpayments_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='See https://www.imf.org/external/np/sta/bopcode/guide.htm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balanceOfPayments`
--

LOCK TABLES `balanceOfPayments` WRITE;
/*!40000 ALTER TABLE `balanceOfPayments` DISABLE KEYS */;
INSERT INTO `balanceOfPayments` VALUES (100,'100','A. Goods','2023-08-24 12:47:33'),(110,'110','1. General merchandise','2023-08-24 12:47:33'),(150,'150','2. Goods for processing','2023-08-24 12:47:33'),(151,'151','2.1 Processing abroad','2023-08-24 12:47:33'),(152,'152','2.2 Processing in the compiling economy','2023-08-24 12:47:33'),(160,'160','3. Repairs on goods','2023-08-24 12:47:33'),(170,'170','4. Goods procured in ports by carriers','2023-08-24 12:47:33'),(171,'171','4.1 In seaports','2023-08-24 12:47:33'),(172,'172','4.2 In airports','2023-08-24 12:47:33'),(173,'173','4.3 In other ports','2023-08-24 12:47:33'),(180,'180','5. Nonmonetary gold','2023-08-24 12:47:33'),(181,'181','5.1 Held as a store of value','2023-08-24 12:47:33'),(182,'182','5.2 Other','2023-08-24 12:47:33'),(200,'200','B. Services','2023-08-24 12:47:33'),(205,'205','1. Transportation','2023-08-24 12:47:33'),(206,'206','1.1 Sea transport','2023-08-24 12:47:33'),(207,'207','1.1.1 Passenger','2023-08-24 12:47:33'),(208,'208','1.1.2 Freight','2023-08-24 12:47:33'),(209,'209','1.1.3 Other','2023-08-24 12:47:33'),(210,'210','1.2 Air transport','2023-08-24 12:47:33'),(211,'211','1.2.1 Passenger','2023-08-24 12:47:33'),(212,'212','1.2.2 Freight','2023-08-24 12:47:33'),(213,'213','1.2.3 Other','2023-08-24 12:47:33'),(214,'214','1.3 Other transport','2023-08-24 12:47:33'),(215,'215','1.3.1 Passenger','2023-08-24 12:47:33'),(216,'216','1.3.2 Freight','2023-08-24 12:47:33'),(217,'217','1.3.3 Other','2023-08-24 12:47:33'),(218,'218','1.4 Space transport','2023-08-24 12:47:33'),(219,'219','1.5 Rail transport','2023-08-24 12:47:33'),(220,'220','1.5.1 Passenger','2023-08-24 12:47:33'),(221,'221','1.5.2 Freight','2023-08-24 12:47:33'),(222,'222','1.5.3 Other','2023-08-24 12:47:33'),(223,'223','1.6 Road transport','2023-08-24 12:47:33'),(224,'224','1.6.1 Passenger','2023-08-24 12:47:33'),(225,'225','1.6.2 Freight','2023-08-24 12:47:33'),(226,'226','1.6.3 Other','2023-08-24 12:47:33'),(227,'227','1.7 Inland waterway transport','2023-08-24 12:47:33'),(228,'228','1.7.1 Passenger','2023-08-24 12:47:33'),(229,'229','1.7.2 Freight','2023-08-24 12:47:33'),(230,'230','1.7.3 Other','2023-08-24 12:47:33'),(231,'231','1.8 Pipeline transport and electricity transmission','2023-08-24 12:47:33'),(232,'232','1.9 Other supporting and auxiliary transport services','2023-08-24 12:47:33'),(236,'236','2. Travel','2023-08-24 12:47:33'),(237,'237','2.1 Business travel','2023-08-24 12:47:33'),(238,'238','2.1.1 Expenditure by seasonal and border workers','2023-08-24 12:47:33'),(239,'239','2.1.2 Other','2023-08-24 12:47:33'),(240,'240','2.2 Personal travel','2023-08-24 12:47:33'),(241,'241','2.2.1 Health-related expenditure','2023-08-24 12:47:33'),(242,'242','2.2.2 Education-related expenditure','2023-08-24 12:47:33'),(243,'243','2.2.3 Other','2023-08-24 12:47:33'),(245,'245','3. Communications services','2023-08-24 12:47:33'),(246,'246','3.1 Postal and courier services','2023-08-24 12:47:33'),(247,'247','3.2 Telecommunications Services','2023-08-24 12:47:33'),(249,'249','4. Construction services','2023-08-24 12:47:33'),(250,'250','4.1 Construction abroad','2023-08-24 12:47:33'),(251,'251','4.2 Construction in the compiling economy','2023-08-24 12:47:33'),(253,'253','5. Insurance services','2023-08-24 12:47:33'),(254,'254','5.1 Life insurance and pension funding','2023-08-24 12:47:33'),(255,'255','5.2 Freight insurance','2023-08-24 12:47:33'),(256,'256','5.3 Other direct insurance','2023-08-24 12:47:33'),(257,'257','5.4 Reinsurance','2023-08-24 12:47:33'),(258,'258','5.5 Auxiliary services','2023-08-24 12:47:33'),(260,'260','6. Financial services','2023-08-24 12:47:33'),(262,'262','7. Computer and information services','2023-08-24 12:47:33'),(263,'263','7.1 Computer services','2023-08-24 12:47:33'),(264,'264','7.2 Information services','2023-08-24 12:47:33'),(266,'266','8. Royalties and license fees','2023-08-24 12:47:33'),(268,'268','9. Other business services','2023-08-24 12:47:33'),(269,'269','9.1 Merchanting and other trade-related services','2023-08-24 12:47:33'),(270,'270','9.1.1 Merchanting','2023-08-24 12:47:33'),(271,'271','9.1.2 Other trade-related services','2023-08-24 12:47:33'),(272,'272','9.2 Operational leasing services','2023-08-24 12:47:33'),(273,'273','9.3 Miscellaneous business, professional, and technical services','2023-08-24 12:47:33'),(274,'274','9.3.1 Legal, accounting, management consulting, and public relations','2023-08-24 12:47:33'),(275,'275','9.3.1.1 Legal services','2023-08-24 12:47:33'),(276,'276','9.3.1.2 Accounting, auditing, bookkeeping, and tax consulting services','2023-08-24 12:47:33'),(277,'277','9.3.1.3 Business and management consulting and public relations services','2023-08-24 12:47:33'),(278,'278','9.3.2 Advertising, market research, and public opinion polling','2023-08-24 12:47:33'),(279,'279','9.3.3 Research and development','2023-08-24 12:47:33'),(280,'280','9.3.4 Architectural, engineering, and other technical services','2023-08-24 12:47:33'),(281,'281','9.3.5 Agricultural, mining, and on-site processing services','2023-08-24 12:47:33'),(282,'282','9.3.5.1 Waste treatment and depollution','2023-08-24 12:47:33'),(283,'283','9.3.5.2 Agricultural, mining, and other on-site processing services','2023-08-24 12:47:33'),(284,'284','9.3.6 Other business services','2023-08-24 12:47:33'),(285,'285','9.3.7 Services between related enterprises, n.i.e.','2023-08-24 12:47:33'),(287,'287','10. Personal, cultural, and recreational services','2023-08-24 12:47:33'),(288,'288','10.1 Audiovisual and related services','2023-08-24 12:47:33'),(289,'289','10.2 Other personal, cultural, and recreational services','2023-08-24 12:47:33'),(291,'291','11. Government services, n.i.e.','2023-08-24 12:47:33'),(292,'292','11.1 Embassies and consulates','2023-08-24 12:47:33'),(293,'293','11.2 Military units and agencies','2023-08-24 12:47:33'),(294,'294','11.3 Other government services','2023-08-24 12:47:33'),(300,'300','C. Income','2023-08-24 12:47:33'),(310,'310','1. Compensation of employees including border, seasonal, and other workers','2023-08-24 12:47:33'),(320,'320','2. Investment income','2023-08-24 12:47:33'),(330,'330','2.1 Direct investment','2023-08-24 12:47:33'),(331,'331','2.1.1 Income on equity','2023-08-24 12:47:33'),(332,'332','2.1.1.1 Dividends and distributed branch profits','2023-08-24 12:47:33'),(333,'333','2.1.1.2 Reinvested earnings and undistributed branch profits','2023-08-24 12:47:33'),(334,'334','2.1.2 Income on debt (interest)','2023-08-24 12:47:33'),(339,'339','2.2 Portfolio investment','2023-08-24 12:47:33'),(340,'340','2.2.1 Income on equity (dividends)','2023-08-24 12:47:33'),(341,'341','2.2.1.1 Monetary authorities','2023-08-24 12:47:33'),(342,'342','2.2.1.2 General government','2023-08-24 12:47:33'),(343,'343','2.2.1.3 Banks','2023-08-24 12:47:33'),(344,'344','2.2.1.4 Other sectors','2023-08-24 12:47:33'),(349,'349','2.2.2 Income on debt (interest)','2023-08-24 12:47:33'),(350,'350','2.2.2.1 Bonds and notes','2023-08-24 12:47:33'),(351,'351','2.2.2.1.1 Monetary authorities','2023-08-24 12:47:33'),(352,'352','2.2.2.1.2 General government','2023-08-24 12:47:33'),(353,'353','2.2.2.1.3 Banks','2023-08-24 12:47:33'),(354,'354','2.2.2.1.4 Other sectors','2023-08-24 12:47:33'),(360,'360','2.2.2.2 Money-market instruments','2023-08-24 12:47:33'),(361,'361','2.2.2.2.1 Monetary authorities','2023-08-24 12:47:33'),(362,'362','2.2.2.2.2 General government','2023-08-24 12:47:33'),(363,'363','2.2.2.2.3 Banks','2023-08-24 12:47:33'),(364,'364','2.2.2.2.4 Other sectors','2023-08-24 12:47:33'),(370,'370','2.3 Other investment','2023-08-24 12:47:33'),(371,'371','2.3.1 Monetary authorities','2023-08-24 12:47:33'),(372,'372','2.3.2 General government','2023-08-24 12:47:33'),(373,'373','2.3.3 Banks','2023-08-24 12:47:33'),(374,'374','2.3.4 Other sectors','2023-08-24 12:47:33'),(379,'379','D. Current transfers','2023-08-24 12:47:33'),(380,'380','1. General government','2023-08-24 12:47:33'),(390,'390','2. Other sectors','2023-08-24 12:47:33'),(391,'391','2.1 Workers\' remittances','2023-08-24 12:47:33'),(392,'392','2.2 Other transfers','2023-08-24 12:47:33'),(400,'400','1. Capital transfers','2023-08-24 12:47:33'),(401,'401','1.1 General government','2023-08-24 12:47:33'),(402,'402','1.1.1 Debt forgiveness','2023-08-24 12:47:33'),(410,'410','1.1.2 Other','2023-08-24 12:47:33'),(430,'430','1.2 Other sectors','2023-08-24 12:47:33'),(431,'431','1.2.1 Migrants\' transfers','2023-08-24 12:47:33'),(432,'432','1.2.2 Debt forgiveness','2023-08-24 12:47:33'),(440,'440','1.2.3 Other','2023-08-24 12:47:33'),(480,'480','2. Acquisitions/disposal of non-produced nonfinancial assets','2023-08-24 12:47:33'),(500,'500','1. Direct investment','2023-08-24 12:47:33'),(505,'505','1.1 Abroad','2023-08-24 12:47:33'),(510,'510','1.1.1 Equity capital','2023-08-24 12:47:33'),(515,'515','1.1.1.1 Claims on affiliated enterprises','2023-08-24 12:47:33'),(520,'520','1.1.1.2 Liabilities to affiliated enterprises','2023-08-24 12:47:33'),(525,'525','1.1.2 Reinvested earnings','2023-08-24 12:47:33'),(526,'526','1.1.2.1 Claims','2023-08-24 12:47:33'),(527,'527','1.1.2.2 Liabilities','2023-08-24 12:47:33'),(530,'530','1.1.3 Other capital','2023-08-24 12:47:33'),(535,'535','1.1.3.1 Claims on affiliated enterprises','2023-08-24 12:47:33'),(540,'540','1.1.3.2 Liabilities to affiliated enterprises','2023-08-24 12:47:33'),(555,'555','1.2 In reporting economy','2023-08-24 12:47:33'),(560,'560','1.2.1 Equity capital','2023-08-24 12:47:33'),(565,'565','1.2.1.1 Claims on direct investors','2023-08-24 12:47:33'),(570,'570','1.2.1.2 Liabilities to direct investors','2023-08-24 12:47:33'),(575,'575','1.2.2 Reinvested earnings','2023-08-24 12:47:33'),(576,'576','1.2.2.1 Claims','2023-08-24 12:47:33'),(577,'577','1.2.2.2 Liabilities','2023-08-24 12:47:33'),(580,'580','1.2.3 Other capital','2023-08-24 12:47:33'),(585,'585','1.2.3.1 Claims on direct investors','2023-08-24 12:47:33'),(590,'590','1.2.3.2 Liabilities to direct investors','2023-08-24 12:47:33'),(600,'600','2. Portfolio investment','2023-08-24 12:47:33'),(602,'602','2.1 Assets','2023-08-24 12:47:33'),(610,'610','2.1.1 Equity securities','2023-08-24 12:47:33'),(611,'611','2.1.1.1 Monetary authorities','2023-08-24 12:47:33'),(612,'612','2.1.1.2 General government','2023-08-24 12:47:33'),(613,'613','2.1.1.3 Banks','2023-08-24 12:47:33'),(614,'614','2.1.1.4 Other sectors','2023-08-24 12:47:33'),(619,'619','2.1.2 Debt securities','2023-08-24 12:47:33'),(620,'620','2.1.2.1 Bonds and notes','2023-08-24 12:47:33'),(621,'621','2.1.2.1.1 Monetary authorities','2023-08-24 12:47:33'),(622,'622','2.1.2.1.2 General government','2023-08-24 12:47:33'),(623,'623','2.1.2.1.3 Banks','2023-08-24 12:47:33'),(624,'624','2.1.2.1.4 Other sectors','2023-08-24 12:47:33'),(630,'630','2.1.2.2 Money market instruments','2023-08-24 12:47:33'),(631,'631','2.1.2.2.1 Monetary authorities','2023-08-24 12:47:33'),(632,'632','2.1.2.2.2 General government','2023-08-24 12:47:33'),(633,'633','2.1.2.2.3 Banks','2023-08-24 12:47:33'),(634,'634','2.1.2.2.4 Other sectors','2023-08-24 12:47:33'),(652,'652','2.2 Liabilities','2023-08-24 12:47:33'),(660,'660','2.2.1 Equity securities','2023-08-24 12:47:33'),(663,'663','2.2.1.1 Banks','2023-08-24 12:47:33'),(664,'664','2.2.1.2 Other sectors','2023-08-24 12:47:33'),(669,'669','2.2.2 Debt securities','2023-08-24 12:47:33'),(670,'670','2.2.2.1 Bonds and notes','2023-08-24 12:47:33'),(671,'671','2.2.2.1.1 Monetary authorities','2023-08-24 12:47:33'),(672,'672','2.2.2.1.2 General government','2023-08-24 12:47:33'),(673,'673','2.2.2.1.3 Banks','2023-08-24 12:47:33'),(674,'674','2.2.2.1.4 Other sectors','2023-08-24 12:47:33'),(680,'680','2.2.2.2 Money market instruments','2023-08-24 12:47:33'),(681,'681','2.2.2.2.1 Monetary authorities','2023-08-24 12:47:33'),(682,'682','2.2.2.2.2 General government','2023-08-24 12:47:33'),(683,'683','2.2.2.2.3 Banks','2023-08-24 12:47:33'),(684,'684','2.2.2.2.4 Other sectors','2023-08-24 12:47:33'),(700,'700','4. Other investment','2023-08-24 12:47:33'),(703,'703','4.1 Assets','2023-08-24 12:47:33'),(706,'706','4.1.1 Trade credits','2023-08-24 12:47:33'),(707,'707','4.1.1.1 General government','2023-08-24 12:47:33'),(708,'708','4.1.1.1.1 Long-term','2023-08-24 12:47:33'),(709,'709','4.1.1.1.2 Short-term','2023-08-24 12:47:33'),(710,'710','4.1.1.2 Other sectors','2023-08-24 12:47:33'),(711,'711','4.1.1.2.1 Long-term','2023-08-24 12:47:33'),(712,'712','4.1.1.2.2 Short-term','2023-08-24 12:47:33'),(714,'714','4.1.2 Loans','2023-08-24 12:47:33'),(715,'715','4.1.2.1 Monetary authorities','2023-08-24 12:47:33'),(717,'717','4.1.2.1.1 Long-term','2023-08-24 12:47:33'),(718,'718','4.1.2.1.2 Short-term','2023-08-24 12:47:33'),(719,'719','4.1.2.2 General government','2023-08-24 12:47:33'),(720,'720','4.1.2.2.1 Long-term','2023-08-24 12:47:33'),(721,'721','4.1.2.2.2 Short-term','2023-08-24 12:47:33'),(722,'722','4.1.2.3 Banks','2023-08-24 12:47:33'),(723,'723','4.1.2.3.1 Long-term','2023-08-24 12:47:33'),(724,'724','4.1.2.3.2 Short-term','2023-08-24 12:47:33'),(725,'725','4.1.2.4 Other sectors','2023-08-24 12:47:33'),(726,'726','4.1.2.4.1 Long-term','2023-08-24 12:47:33'),(727,'727','4.1.2.4.2 Short-term','2023-08-24 12:47:33'),(730,'730','4.1.3 Currency and deposits','2023-08-24 12:47:33'),(731,'731','4.1.3.1 Monetary authorities','2023-08-24 12:47:33'),(732,'732','4.1.3.2 General government','2023-08-24 12:47:33'),(733,'733','4.1.3.3 Banks','2023-08-24 12:47:33'),(734,'734','4.1.3.4 Other sectors','2023-08-24 12:47:33'),(736,'736','4.1.4 Other assets','2023-08-24 12:47:33'),(737,'737','4.1.4.1 Monetary authorities','2023-08-24 12:47:33'),(738,'738','4.1.4.1.1 Long-term','2023-08-24 12:47:33'),(739,'739','4.1.4.1.2 Short-term','2023-08-24 12:47:33'),(740,'740','4.1.4.2 General government','2023-08-24 12:47:33'),(741,'741','4.1.4.2.1 Long-term','2023-08-24 12:47:33'),(742,'742','4.1.4.2.2 Short-term','2023-08-24 12:47:33'),(743,'743','4.1.4.3 Banks','2023-08-24 12:47:33'),(744,'744','4.1.4.3.1 Long-term','2023-08-24 12:47:33'),(745,'745','4.1.4.3.2 Short-term','2023-08-24 12:47:33'),(746,'746','4.1.4.4 Other sectors','2023-08-24 12:47:33'),(747,'747','4.1.4.4.1 Long-term','2023-08-24 12:47:33'),(748,'748','3.1.4.4.2 Short-term','2023-08-24 12:47:33'),(753,'753','4.2 Liabilities','2023-08-24 12:47:33'),(756,'756','4.2.1 Trade credits','2023-08-24 12:47:33'),(757,'757','4.2.1.1 General government','2023-08-24 12:47:33'),(758,'758','4.2.1.1.1 Long-term','2023-08-24 12:47:33'),(759,'759','4.2.1.1.2 Short-term','2023-08-24 12:47:33'),(760,'760','4.2.1.2 Other sectors','2023-08-24 12:47:33'),(761,'761','4.2.1.2.1 Long-term','2023-08-24 12:47:33'),(762,'762','4.2.1.2.2 Short-term','2023-08-24 12:47:33'),(764,'764','4.2.2 Loans','2023-08-24 12:47:33'),(765,'765','4.2.2.1 Monetary authorities','2023-08-24 12:47:33'),(766,'766','4.2.2.1.1 Use of Fund credit and loans from the Fund','2023-08-24 12:47:33'),(767,'767','4.2.2.1.2 Other long-term','2023-08-24 12:47:33'),(768,'768','4.2.2.1.3 Short-term','2023-08-24 12:47:33'),(769,'769','4.2.2.2 General government','2023-08-24 12:47:33'),(770,'770','4.2.2.2.1 Long-term','2023-08-24 12:47:33'),(771,'771','4.2.2.2.2 Short-term','2023-08-24 12:47:33'),(772,'772','4.2.2.3 Banks','2023-08-24 12:47:33'),(773,'773','4.2.2.3.1 Long-term','2023-08-24 12:47:33'),(774,'774','4.2.2.3.2 Short-term','2023-08-24 12:47:33'),(775,'775','4.2.2.4 Other sectors','2023-08-24 12:47:33'),(776,'776','4.2.2.4.1 Long-term','2023-08-24 12:47:33'),(777,'777','4.2.2.4.2 Short-term','2023-08-24 12:47:33'),(780,'780','4.2.3 Currency and deposits','2023-08-24 12:47:33'),(781,'781','4.2.3.1 Monetary authorities','2023-08-24 12:47:33'),(782,'782','4.2.3.2 General government','2023-08-24 12:47:33'),(783,'783','4.2.3.3 Banks','2023-08-24 12:47:33'),(784,'784','4.2.3.4 Other sectors','2023-08-24 12:47:33'),(786,'786','4.2.4 Other liabilities','2023-08-24 12:47:33'),(787,'787','4.2.4.1 Monetary authorities','2023-08-24 12:47:33'),(788,'788','4.2.4.1.1 Long-term','2023-08-24 12:47:33'),(789,'789','4.2.4.1.2 Short-term','2023-08-24 12:47:33'),(790,'790','4.2.4.2 General government','2023-08-24 12:47:33'),(791,'791','4.2.4.2.1 Long-term','2023-08-24 12:47:33'),(792,'792','4.2.4.2.2 Short-term','2023-08-24 12:47:33'),(793,'793','4.2.4.3 Banks','2023-08-24 12:47:33'),(794,'794','4.2.4.3.1 Long-term','2023-08-24 12:47:33'),(795,'795','4.2.4.3.2 Short-term','2023-08-24 12:47:33'),(796,'796','4.2.4.4 Other sectors','2023-08-24 12:47:33'),(797,'797','4.2.4.4.1 Long-term','2023-08-24 12:47:33'),(798,'798','4.2.4.4.2 Short-term','2023-08-24 12:47:33'),(802,'802','5. Official reserve assets','2023-08-24 12:47:33'),(803,'803','5.4 Foreign exchange','2023-08-24 12:47:33'),(806,'806','5.4.2 Securities','2023-08-24 12:47:33'),(808,'808','5.4.1 Currency and deposits','2023-08-24 12:47:33'),(810,'810','5.3 Reserve position in the Fund','2023-08-24 12:47:33'),(811,'811','5.2 SDRs','2023-08-24 12:47:33'),(812,'812','5.1 Monetary gold (including gold deposits and, if appropriate, gold swapped)','2023-08-24 12:47:33'),(813,'813','5.6 Other claims','2023-08-24 12:47:33'),(850,'850','Total passenger','2023-08-24 12:47:33'),(851,'851','Total freight','2023-08-24 12:47:33'),(852,'852','Total other services','2023-08-24 12:47:33'),(858,'858','1.3 Other freight','2023-08-24 12:47:33'),(862,'862','1.4 Space freight','2023-08-24 12:47:33'),(863,'863','1.5 Rail freight','2023-08-24 12:47:33'),(865,'865','1.7 Inland waterway freight','2023-08-24 12:47:33'),(868,'868','1.8 Pipeline freight','2023-08-24 12:47:33'),(871,'871','2.3 All other travel expenditure','2023-08-24 12:47:33'),(887,'887','5. Financial intermediation services indirectly measured (FISIM)','2023-08-24 12:47:33'),(888,'888','6. Financial services including FISIM','2023-08-24 12:47:33'),(889,'889','7.2.1 News agency services','2023-08-24 12:47:33'),(890,'890','7.2.2 Other information provision services','2023-08-24 12:47:33'),(891,'891','8.1 Franchises and similar rights','2023-08-24 12:47:33'),(892,'892','8.2 Other royalties and license fees','2023-08-24 12:47:33'),(894,'894','8. Audiovisual transactions','2023-08-24 12:47:33'),(895,'895','10.2.1 Education services','2023-08-24 12:47:33'),(896,'896','10.2.2 Health services','2023-08-24 12:47:33'),(897,'897','10.2.3 Other','2023-08-24 12:47:33'),(900,'900','3.1 Financial derivatives assets','2023-08-24 12:47:33'),(901,'901','3.1.1 Monetary authorities','2023-08-24 12:47:33'),(902,'902','3.1.2 General government','2023-08-24 12:47:33'),(903,'903','3.1.3 Banks','2023-08-24 12:47:33'),(904,'904','3.1.4 Other sectors','2023-08-24 12:47:33'),(905,'905','3.2 Financial derivatives liabilities','2023-08-24 12:47:33'),(906,'906','3.2.1 Monetary authorities','2023-08-24 12:47:33'),(907,'907','3.2.2 General government','2023-08-24 12:47:33'),(908,'908','3.2.3 Banks','2023-08-24 12:47:33'),(909,'909','3.2.4 Other sectors','2023-08-24 12:47:33'),(910,'910','3. Financial derivatives (net)','2023-08-24 12:47:33'),(911,'911','3.0.1 Monetary authorities','2023-08-24 12:47:33'),(912,'912','3.0.2 General government','2023-08-24 12:47:33'),(913,'913','3.0.3 Banks','2023-08-24 12:47:33'),(914,'914','3.0.4 Other sectors','2023-08-24 12:47:33'),(920,'920','Exceptional financing transactions (Total)','2023-08-24 12:47:33'),(950,'950','1. Freight transportation on merchandise, valued on a transaction basis','2023-08-24 12:47:33'),(951,'951','1.1 Sea freight','2023-08-24 12:47:33'),(952,'952','1.2 Air freight','2023-08-24 12:47:33'),(953,'953','1.6 Road freight','2023-08-24 12:47:33'),(956,'956','2.1 Expenditure on goods','2023-08-24 12:47:33'),(957,'957','2.2 Expenditure on accommodation and food and beverage serving services','2023-08-24 12:47:33'),(960,'960','3. Gross insurance premiums','2023-08-24 12:47:33'),(961,'961','4. Gross insurance claims','2023-08-24 12:47:33'),(962,'962','7. Merchanting gross flows','2023-08-24 12:47:33'),(972,'972','3.1 Gross premiums-life insurance','2023-08-24 12:47:33'),(973,'973','4.1 Gross claims-life insurance','2023-08-24 12:47:33'),(974,'974','3.2 Gross premiums-freight insurance','2023-08-24 12:47:33'),(975,'975','4.2 Gross claims-freight insurance','2023-08-24 12:47:33'),(976,'976','3.3 Gross premiums-other direct insurance','2023-08-24 12:47:33'),(977,'977','4.3 Gross claims-other direct insurance','2023-08-24 12:47:33'),(982,'982','Current and capital transfers','2023-08-24 12:47:33'),(983,'983','Current + capital + financial accounts','2023-08-24 12:47:33'),(984,'984','Current + capital + financial accounts + net errors and omissions','2023-08-24 12:47:33'),(991,'991','Goods and services','2023-08-24 12:47:33'),(992,'992','Goods, services, and income','2023-08-24 12:47:33'),(993,'993','1. Current account','2023-08-24 12:47:33'),(994,'994','E. Capital Account','2023-08-24 12:47:33'),(995,'995','F. Financial Account','2023-08-24 12:47:33'),(996,'996','Capital and Financial Account','2023-08-24 12:47:33'),(998,'998','Net errors and omissions','2023-08-24 12:47:33'),(11010,'110 B','1.1 Export/import of goods in trade statistics','2023-08-24 12:47:33'),(11020,'110 C','1.2 Adjustments to trade statistics','2023-08-24 12:47:33'),(11030,'110 CA','1.3 For coverage','2023-08-24 12:47:33'),(11040,'110 CB','1.4 For classification','2023-08-24 12:47:33'),(11050,'110 CC','1.5 For valuation','2023-08-24 12:47:33'),(11060,'110 CD','1.6 For timing','2023-08-24 12:47:33'),(38010,'380 EC','Exc. Fin. - Intergovernmental grants','2023-08-24 12:47:33'),(38020,'380 ED','Exc. Fin. - Grants received from Fund subsidy accounts','2023-08-24 12:47:33'),(38030,'380 Z','Other','2023-08-24 12:47:33'),(40210,'402 EB','Exceptional Financing','2023-08-24 12:47:33'),(40220,'402 Z','Other','2023-08-24 12:47:33'),(57010,'570 EF','Exc. Fin. - Investment associated with debt reduction','2023-08-24 12:47:33'),(57020,'570 EG','Exc. Fin. - Other','2023-08-24 12:47:33'),(57030,'570 Z','1.2.1.3 Other','2023-08-24 12:47:33'),(67110,'671 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(67120,'671 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(67130,'671 Z','Other','2023-08-24 12:47:33'),(67210,'672 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(67220,'672 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(67230,'672 Z','Other','2023-08-24 12:47:33'),(67310,'673 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(67320,'673 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(67330,'673 Z','Other','2023-08-24 12:47:33'),(67410,'674 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(67420,'674 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(67430,'674 Z','Other','2023-08-24 12:47:33'),(68110,'681 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(68120,'681 Z','Other','2023-08-24 12:47:33'),(68210,'682 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(68220,'682 Z','Other','2023-08-24 12:47:33'),(68310,'683 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(68320,'683 Z','Other','2023-08-24 12:47:33'),(68410,'684 EH','Exc. Fin. - Issues','2023-08-24 12:47:33'),(68420,'684 Z','Other','2023-08-24 12:47:33'),(76710,'767 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors onauthorities\' behalf','2023-08-24 12:47:33'),(76720,'767 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(76730,'767 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(76740,'767 Z','Other','2023-08-24 12:47:33'),(76810,'768 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors on authorities\' behalf','2023-08-24 12:47:33'),(76820,'768 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(76830,'768 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(76840,'768 Z','Other','2023-08-24 12:47:33'),(77010,'770 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors on authorities\' behalf','2023-08-24 12:47:33'),(77020,'770 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(77030,'770 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(77040,'770 Z','Other','2023-08-24 12:47:33'),(77110,'771 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors on authorities\' behalf','2023-08-24 12:47:33'),(77120,'771 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(77130,'771 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(77140,'771 Z','Other','2023-08-24 12:47:33'),(77310,'773 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors on authorities\' behalf','2023-08-24 12:47:33'),(77320,'773 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(77330,'773 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(77340,'773 Z','Other','2023-08-24 12:47:33'),(77410,'774 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors on authorities\' behalf','2023-08-24 12:47:33'),(77420,'774 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(77430,'774 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(77440,'774 Z','Other','2023-08-24 12:47:33'),(77610,'776 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors on authorities\' behalf','2023-08-24 12:47:33'),(77620,'776 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(77630,'776 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(77640,'776 Z','Other','2023-08-24 12:47:33'),(77710,'777 EJ','Exc. Fin. - Drawings on new loans by authorities or other sectors on authorities\' behalf','2023-08-24 12:47:33'),(77720,'777 EK','Exc. Fin. - Rescheduling of existing debt','2023-08-24 12:47:33'),(77730,'777 EM','Exc. Fin. - Advance repayments','2023-08-24 12:47:33'),(77740,'777 Z','Other','2023-08-24 12:47:33'),(78905,'789 F','Exc. Fin. - Total arrears','2023-08-24 12:47:33'),(78910,'789 FA','Exc. Fin. - Accumulation of arrears','2023-08-24 12:47:33'),(78915,'789 FB','Exc. Fin. - Principal on short-term debt','2023-08-24 12:47:33'),(78920,'789 FC','Exc. Fin. - Principal on long-term debt','2023-08-24 12:47:33'),(78925,'789 FD','Exc. Fin. - Original interest','2023-08-24 12:47:33'),(78930,'789 FE','Exc. Fin. - Penalty interest','2023-08-24 12:47:33'),(78935,'789 FF','Exc. Fin. - Repayments of arrears','2023-08-24 12:47:33'),(78940,'789 FG','Exc. Fin. - Principal','2023-08-24 12:47:33'),(78945,'789 FH','Exc. Fin. - Interest','2023-08-24 12:47:33'),(78950,'789 FI','Exc. Fin. - Rescheduling of arrears','2023-08-24 12:47:33'),(78955,'789 FJ','Exc. Fin. - Principal','2023-08-24 12:47:33'),(78960,'789 FK','Exc. Fin. - Interest','2023-08-24 12:47:33'),(78965,'789 FM','Exc. Fin. - Cancellation of arrears','2023-08-24 12:47:33'),(78970,'789 FN','Exc. Fin. - Principal','2023-08-24 12:47:33'),(78975,'789 FO','Exc. Fin. - Interest','2023-08-24 12:47:33'),(78980,'789 Z','Other','2023-08-24 12:47:33'),(79205,'792 F','Exc. Fin. - Total arrears','2023-08-24 12:47:33'),(79210,'792 FA','Exc. Fin. - Accumulation of arrears','2023-08-24 12:47:33'),(79215,'792 FB','Exc. Fin. - Principal on short-term debt','2023-08-24 12:47:33'),(79220,'792 FC','Exc. Fin. - Principal on long-term debt','2023-08-24 12:47:33'),(79225,'792 FD','Exc. Fin. - Original interest','2023-08-24 12:47:33'),(79230,'792 FE','Exc. Fin. - Penalty interest','2023-08-24 12:47:33'),(79235,'792 FF','Exc. Fin. - Repayments of arrears','2023-08-24 12:47:33'),(79240,'792 FG','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79245,'792 FH','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79250,'792 FI','Exc. Fin. - Rescheduling of arrears','2023-08-24 12:47:33'),(79255,'792 FJ','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79260,'792 FK','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79265,'792 FM','Exc. Fin. - Cancellation of arrears','2023-08-24 12:47:33'),(79270,'792 FN','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79275,'792 FO','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79280,'792 Z','Other','2023-08-24 12:47:33'),(79505,'795 F','Exc. Fin. - Total arrears','2023-08-24 12:47:33'),(79510,'795 FA','Exc. Fin. - Accumulation of arrears','2023-08-24 12:47:33'),(79515,'795 FB','Exc. Fin. - Principal on short-term debt','2023-08-24 12:47:33'),(79520,'795 FC','Exc. Fin. - Principal on long-term debt','2023-08-24 12:47:33'),(79525,'795 FD','Exc. Fin. - Original interest','2023-08-24 12:47:33'),(79530,'795 FE','Exc. Fin. - Penalty interest','2023-08-24 12:47:33'),(79535,'795 FF','Exc. Fin. - Repayments of arrears','2023-08-24 12:47:33'),(79540,'795 FG','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79545,'795 FH','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79550,'795 FI','Exc. Fin. - Rescheduling of arrears','2023-08-24 12:47:33'),(79555,'795 FJ','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79560,'795 FK','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79565,'795 FM','Exc. Fin. - Cancellation of arrears','2023-08-24 12:47:33'),(79570,'795 FN','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79575,'795 FO','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79580,'795 Z','Other','2023-08-24 12:47:33'),(79805,'798 F','Exc. Fin. - Total arrears','2023-08-24 12:47:33'),(79810,'798 FA','Exc. Fin. - Accumulation of arrears','2023-08-24 12:47:33'),(79815,'798 FB','Exc. Fin. - Principal on short-term debt','2023-08-24 12:47:33'),(79820,'798 FC','Exc. Fin. - Principal on long-term debt','2023-08-24 12:47:33'),(79825,'798 FD','Exc. Fin. - Original interest','2023-08-24 12:47:33'),(79830,'798 FE','Exc. Fin. - Penalty interest','2023-08-24 12:47:33'),(79835,'798 FF','Exc. Fin. - Repayments of arrears','2023-08-24 12:47:33'),(79840,'798 FG','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79845,'798 FH','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79850,'798 FI','Exc. Fin. - Rescheduling of arrears','2023-08-24 12:47:33'),(79855,'798 FJ','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79860,'798 FK','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79865,'798 FM','Exc. Fin. - Cancellation of arrears','2023-08-24 12:47:33'),(79870,'798 FN','Exc. Fin. - Principal','2023-08-24 12:47:33'),(79875,'798 FO','Exc. Fin. - Interest','2023-08-24 12:47:33'),(79880,'798 Z','Other','2023-08-24 12:47:33'),(80610,'806 S','5.4.2.1 Equities','2023-08-24 12:47:33'),(80620,'806 T','5.4.2.2 Bonds and notes','2023-08-24 12:47:33'),(80630,'806 U','5.4.2.3 Money market instruments','2023-08-24 12:47:33'),(80810,'808 A','5.4.1.1 With monetary authorities','2023-08-24 12:47:33'),(80820,'808 B','5.4.1.2 With banks','2023-08-24 12:47:33'),(81440,'814 A','5.5 Financial derivatives, net','2023-08-24 12:47:33');
/*!40000 ALTER TABLE `balanceOfPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkProcessingState`
--

DROP TABLE IF EXISTS `bulkProcessingState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkProcessingState` (
  `bulkProcessingStateId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkProcessingStateId`),
  UNIQUE KEY `bulkprocessingstate_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkProcessingState`
--

LOCK TABLES `bulkProcessingState` WRITE;
/*!40000 ALTER TABLE `bulkProcessingState` DISABLE KEYS */;
INSERT INTO `bulkProcessingState` VALUES (1,'RECEIVED','The switch has received the individual transfer ids part of the bulk transfer',1,'2023-08-24 12:47:33'),(2,'RECEIVED_DUPLICATE','The switch has matched individual transfer as duplicate',1,'2023-08-24 12:47:33'),(3,'RECEIVED_INVALID','The switch has matched individual transfer as invalid within Prepare or Position Handler',1,'2023-08-24 12:47:33'),(4,'ACCEPTED','The switch has reserved the funds for the transfers in the bulk',1,'2023-08-24 12:47:33'),(5,'PROCESSING','Fulfilment request has been received for the individual transfer',1,'2023-08-24 12:47:33'),(6,'FULFIL_DUPLICATE','The switch has matched individual transfer fulfil as duplicate',1,'2023-08-24 12:47:33'),(7,'FULFIL_INVALID','The switch has matched individual transfer fulfilment as invalid within Fulfil or Position Handler',1,'2023-08-24 12:47:33'),(8,'COMPLETED','The switch has marked the individual transfer as committed',1,'2023-08-24 12:47:33'),(9,'REJECTED','The switch has marked the individual transfer as rejected',1,'2023-08-24 12:47:33'),(10,'EXPIRED','The switch has marked the individual transfer as timed out',1,'2023-08-24 12:47:33'),(11,'ABORTING','The switch has marked the individual transfer as aborting due to failed validation',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `bulkProcessingState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransfer`
--

DROP TABLE IF EXISTS `bulkTransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransfer` (
  `bulkTransferId` varchar(36) NOT NULL,
  `bulkQuoteId` varchar(36) DEFAULT NULL,
  `payerParticipantId` int unsigned DEFAULT NULL,
  `payeeParticipantId` int unsigned DEFAULT NULL,
  `expirationDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferId`),
  KEY `bulktransfer_payerparticipantid_index` (`payerParticipantId`),
  KEY `bulktransfer_payeeparticipantid_index` (`payeeParticipantId`),
  CONSTRAINT `bulktransfer_bulktransferid_foreign` FOREIGN KEY (`bulkTransferId`) REFERENCES `bulkTransferDuplicateCheck` (`bulkTransferId`),
  CONSTRAINT `bulktransfer_payeeparticipantid_foreign` FOREIGN KEY (`payeeParticipantId`) REFERENCES `participant` (`participantId`),
  CONSTRAINT `bulktransfer_payerparticipantid_foreign` FOREIGN KEY (`payerParticipantId`) REFERENCES `participant` (`participantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransfer`
--

LOCK TABLES `bulkTransfer` WRITE;
/*!40000 ALTER TABLE `bulkTransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferAssociation`
--

DROP TABLE IF EXISTS `bulkTransferAssociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferAssociation` (
  `bulkTransferAssociationId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transferId` varchar(36) NOT NULL,
  `bulkTransferId` varchar(36) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulkProcessingStateId` int unsigned NOT NULL,
  `lastProcessedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `errorCode` int unsigned DEFAULT NULL,
  `errorDescription` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`bulkTransferAssociationId`),
  UNIQUE KEY `bulktransferassociation_transferid_bulktransferid_unique` (`transferId`,`bulkTransferId`),
  KEY `bulktransferassociation_bulktransferid_foreign` (`bulkTransferId`),
  KEY `bulktransferassociation_bulkprocessingstateid_foreign` (`bulkProcessingStateId`),
  CONSTRAINT `bulktransferassociation_bulkprocessingstateid_foreign` FOREIGN KEY (`bulkProcessingStateId`) REFERENCES `bulkProcessingState` (`bulkProcessingStateId`),
  CONSTRAINT `bulktransferassociation_bulktransferid_foreign` FOREIGN KEY (`bulkTransferId`) REFERENCES `bulkTransfer` (`bulkTransferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferAssociation`
--

LOCK TABLES `bulkTransferAssociation` WRITE;
/*!40000 ALTER TABLE `bulkTransferAssociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransferAssociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferDuplicateCheck`
--

DROP TABLE IF EXISTS `bulkTransferDuplicateCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferDuplicateCheck` (
  `bulkTransferId` varchar(36) NOT NULL,
  `hash` varchar(256) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferDuplicateCheck`
--

LOCK TABLES `bulkTransferDuplicateCheck` WRITE;
/*!40000 ALTER TABLE `bulkTransferDuplicateCheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransferDuplicateCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferError`
--

DROP TABLE IF EXISTS `bulkTransferError`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferError` (
  `bulkTransferErrorId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bulkTransferStateChangeId` bigint unsigned NOT NULL,
  `errorCode` int unsigned NOT NULL,
  `errorDescription` varchar(128) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferErrorId`),
  KEY `bulktransfererror_bulktransferstatechangeid_index` (`bulkTransferStateChangeId`),
  CONSTRAINT `bulktransfererror_bulktransferstatechangeid_foreign` FOREIGN KEY (`bulkTransferStateChangeId`) REFERENCES `bulkTransferStateChange` (`bulkTransferStateChangeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferError`
--

LOCK TABLES `bulkTransferError` WRITE;
/*!40000 ALTER TABLE `bulkTransferError` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransferError` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferExtension`
--

DROP TABLE IF EXISTS `bulkTransferExtension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferExtension` (
  `bulkTransferExtensionId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bulkTransferId` varchar(36) NOT NULL,
  `isFulfilment` tinyint(1) NOT NULL DEFAULT '0',
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferExtensionId`),
  KEY `bulktransferextension_bulktransferid_index` (`bulkTransferId`),
  CONSTRAINT `bulktransferextension_bulktransferid_foreign` FOREIGN KEY (`bulkTransferId`) REFERENCES `bulkTransfer` (`bulkTransferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferExtension`
--

LOCK TABLES `bulkTransferExtension` WRITE;
/*!40000 ALTER TABLE `bulkTransferExtension` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransferExtension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferFulfilment`
--

DROP TABLE IF EXISTS `bulkTransferFulfilment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferFulfilment` (
  `bulkTransferId` varchar(36) NOT NULL,
  `completedDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferId`),
  CONSTRAINT `bulktransferfulfilment_bulktransferid_foreign` FOREIGN KEY (`bulkTransferId`) REFERENCES `bulkTransferFulfilmentDuplicateCheck` (`bulkTransferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferFulfilment`
--

LOCK TABLES `bulkTransferFulfilment` WRITE;
/*!40000 ALTER TABLE `bulkTransferFulfilment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransferFulfilment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferFulfilmentDuplicateCheck`
--

DROP TABLE IF EXISTS `bulkTransferFulfilmentDuplicateCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferFulfilmentDuplicateCheck` (
  `bulkTransferId` varchar(36) NOT NULL,
  `hash` varchar(256) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferId`),
  CONSTRAINT `bulktransferfulfilmentduplicatecheck_bulktransferid_foreign` FOREIGN KEY (`bulkTransferId`) REFERENCES `bulkTransfer` (`bulkTransferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferFulfilmentDuplicateCheck`
--

LOCK TABLES `bulkTransferFulfilmentDuplicateCheck` WRITE;
/*!40000 ALTER TABLE `bulkTransferFulfilmentDuplicateCheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransferFulfilmentDuplicateCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferState`
--

DROP TABLE IF EXISTS `bulkTransferState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferState` (
  `bulkTransferStateId` varchar(50) NOT NULL,
  `enumeration` varchar(50) NOT NULL COMMENT 'bulkTransferState associated to the Mojaloop API',
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferState`
--

LOCK TABLES `bulkTransferState` WRITE;
/*!40000 ALTER TABLE `bulkTransferState` DISABLE KEYS */;
INSERT INTO `bulkTransferState` VALUES ('ABORTING','PROCESSING','The switch is attempting to abort all individual transfers',1,'2023-08-24 12:47:33'),('ACCEPTED','ACCEPTED','The switch has reserved the funds for the transfers in the bulk',1,'2023-08-24 12:47:33'),('COMPLETED','COMPLETED','Final state when transfers in the bulk are committed',1,'2023-08-24 12:47:33'),('EXPIRED','COMPLETED','Final state when transfers in the bulk have expired',1,'2023-08-24 12:47:33'),('EXPIRING','PROCESSING','One or more individual transfers from have expired',1,'2023-08-24 12:47:33'),('INVALID','REJECTED','Final state when the switch has completed processing of pending invalid bulk transfer',1,'2023-08-24 12:47:33'),('PENDING_FULFIL','PROCESSING','Fulfilment request has been received by the switch',1,'2023-08-24 12:47:33'),('PENDING_INVALID','PENDING','Validation of received bulk transfer is not successful',1,'2023-08-24 12:47:33'),('PENDING_PREPARE','PENDING','Validation of received bulk transfer is successful',1,'2023-08-24 12:47:33'),('PROCESSING','PROCESSING','Fulfilment request has been received by the switch',1,'2023-08-24 12:47:33'),('RECEIVED','RECEIVED','The switch has received the bulk transfer',1,'2023-08-24 12:47:33'),('REJECTED','REJECTED','Final state when the switch has completed rejection request by the payee',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `bulkTransferState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkTransferStateChange`
--

DROP TABLE IF EXISTS `bulkTransferStateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkTransferStateChange` (
  `bulkTransferStateChangeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bulkTransferId` varchar(36) NOT NULL,
  `bulkTransferStateId` varchar(50) NOT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bulkTransferStateChangeId`),
  KEY `bulktransferstatechange_bulktransferid_index` (`bulkTransferId`),
  KEY `bulktransferstatechange_bulktransferstateid_index` (`bulkTransferStateId`),
  CONSTRAINT `bulktransferstatechange_bulktransferid_foreign` FOREIGN KEY (`bulkTransferId`) REFERENCES `bulkTransfer` (`bulkTransferId`),
  CONSTRAINT `bulktransferstatechange_bulktransferstateid_foreign` FOREIGN KEY (`bulkTransferStateId`) REFERENCES `bulkTransferState` (`bulkTransferStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkTransferStateChange`
--

LOCK TABLES `bulkTransferStateChange` WRITE;
/*!40000 ALTER TABLE `bulkTransferStateChange` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkTransferStateChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactType`
--

DROP TABLE IF EXISTS `contactType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactType` (
  `contactTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contactTypeId`),
  UNIQUE KEY `contacttype_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactType`
--

LOCK TABLES `contactType` WRITE;
/*!40000 ALTER TABLE `contactType` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `currencyId` varchar(3) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `scale` int unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`currencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES ('AED','UAE dirham',1,'2023-08-24 12:47:33',2),('AFA','Afghanistan afghani (obsolete)',1,'2023-08-24 12:47:33',4),('AFN','Afghanistan afghani',1,'2023-08-24 12:47:33',2),('ALL','Albanian lek',1,'2023-08-24 12:47:33',2),('AMD','Armenian dram',1,'2023-08-24 12:47:33',2),('ANG','Netherlands Antillian guilder',1,'2023-08-24 12:47:33',2),('AOA','Angolan kwanza',1,'2023-08-24 12:47:33',2),('AOR','Angolan kwanza reajustado',1,'2023-08-24 12:47:33',4),('ARS','Argentine peso',1,'2023-08-24 12:47:33',2),('AUD','Australian dollar',1,'2023-08-24 12:47:33',2),('AWG','Aruban guilder',1,'2023-08-24 12:47:33',2),('AZN','Azerbaijanian new manat',1,'2023-08-24 12:47:33',2),('BAM','Bosnia-Herzegovina convertible mark',1,'2023-08-24 12:47:33',2),('BBD','Barbados dollar',1,'2023-08-24 12:47:33',2),('BDT','Bangladeshi taka',1,'2023-08-24 12:47:33',2),('BGN','Bulgarian lev',1,'2023-08-24 12:47:33',2),('BHD','Bahraini dinar',1,'2023-08-24 12:47:33',3),('BIF','Burundi franc',1,'2023-08-24 12:47:33',0),('BMD','Bermudian dollar',1,'2023-08-24 12:47:33',2),('BND','Brunei dollar',1,'2023-08-24 12:47:33',2),('BOB','Bolivian boliviano',1,'2023-08-24 12:47:33',2),('BOV','Bolivia Mvdol',1,'2023-08-24 12:47:33',2),('BRL','Brazilian real',1,'2023-08-24 12:47:33',2),('BSD','Bahamian dollar',1,'2023-08-24 12:47:33',2),('BTN','Bhutan ngultrum',1,'2023-08-24 12:47:33',2),('BWP','Botswana pula',1,'2023-08-24 12:47:33',2),('BYN','Belarusian ruble',1,'2023-08-24 12:47:33',4),('BYR','Belarussian Ruble',1,'2023-08-24 12:47:33',0),('BZD','Belize dollar',1,'2023-08-24 12:47:33',2),('CAD','Canadian dollar',1,'2023-08-24 12:47:33',2),('CDF','Congolese franc',1,'2023-08-24 12:47:33',2),('CHE','Switzerland WIR Euro',1,'2023-08-24 12:47:33',2),('CHF','Swiss franc',1,'2023-08-24 12:47:33',2),('CHW','Switzerland WIR Franc',1,'2023-08-24 12:47:33',2),('CLF','Unidad de Fomento',1,'2023-08-24 12:47:33',4),('CLP','Chilean peso',1,'2023-08-24 12:47:33',0),('CNY','Chinese yuan renminbi',1,'2023-08-24 12:47:33',2),('COP','Colombian peso',1,'2023-08-24 12:47:33',2),('COU','Unidad de Valor Real',1,'2023-08-24 12:47:33',2),('CRC','Costa Rican colon',1,'2023-08-24 12:47:33',2),('CUC','Cuban convertible peso',1,'2023-08-24 12:47:33',2),('CUP','Cuban peso',1,'2023-08-24 12:47:33',2),('CVE','Cape Verde escudo',1,'2023-08-24 12:47:33',2),('CZK','Czech koruna',1,'2023-08-24 12:47:33',2),('DJF','Djibouti franc',1,'2023-08-24 12:47:33',0),('DKK','Danish krone',1,'2023-08-24 12:47:33',2),('DOP','Dominican peso',1,'2023-08-24 12:47:33',2),('DZD','Algerian dinar',1,'2023-08-24 12:47:33',2),('EEK','Estonian kroon',1,'2023-08-24 12:47:33',4),('EGP','Egyptian pound',1,'2023-08-24 12:47:33',2),('ERN','Eritrean nakfa',1,'2023-08-24 12:47:33',2),('ETB','Ethiopian birr',1,'2023-08-24 12:47:33',2),('EUR','EU euro',1,'2023-08-24 12:47:33',2),('FJD','Fiji dollar',1,'2023-08-24 12:47:33',2),('FKP','Falkland Islands pound',1,'2023-08-24 12:47:33',2),('GBP','British pound',1,'2023-08-24 12:47:33',2),('GEL','Georgian lari',1,'2023-08-24 12:47:33',2),('GGP','Guernsey pound',1,'2023-08-24 12:47:33',4),('GHS','Ghanaian new cedi',1,'2023-08-24 12:47:33',2),('GIP','Gibraltar pound',1,'2023-08-24 12:47:33',2),('GMD','Gambian dalasi',1,'2023-08-24 12:47:33',2),('GNF','Guinean franc',1,'2023-08-24 12:47:33',0),('GTQ','Guatemalan quetzal',1,'2023-08-24 12:47:33',2),('GYD','Guyana dollar',1,'2023-08-24 12:47:33',2),('HKD','Hong Kong SAR dollar',1,'2023-08-24 12:47:33',2),('HNL','Honduran lempira',1,'2023-08-24 12:47:33',2),('HRK','Croatian kuna',1,'2023-08-24 12:47:33',2),('HTG','Haitian gourde',1,'2023-08-24 12:47:33',2),('HUF','Hungarian forint',1,'2023-08-24 12:47:33',2),('IDR','Indonesian rupiah',1,'2023-08-24 12:47:33',2),('ILS','Israeli new shekel',1,'2023-08-24 12:47:33',2),('IMP','Isle of Man pound',1,'2023-08-24 12:47:33',4),('INR','Indian rupee',1,'2023-08-24 12:47:33',2),('IQD','Iraqi dinar',1,'2023-08-24 12:47:33',3),('IRR','Iranian rial',1,'2023-08-24 12:47:33',2),('ISK','Icelandic krona',1,'2023-08-24 12:47:33',0),('JEP','Jersey pound',1,'2023-08-24 12:47:33',4),('JMD','Jamaican dollar',1,'2023-08-24 12:47:33',2),('JOD','Jordanian dinar',1,'2023-08-24 12:47:33',3),('JPY','Japanese yen',1,'2023-08-24 12:47:33',0),('KES','Kenyan shilling',1,'2023-08-24 12:47:33',2),('KGS','Kyrgyz som',1,'2023-08-24 12:47:33',2),('KHR','Cambodian riel',1,'2023-08-24 12:47:33',2),('KMF','Comoros franc',1,'2023-08-24 12:47:33',0),('KPW','North Korean won',1,'2023-08-24 12:47:33',2),('KRW','South Korean won',1,'2023-08-24 12:47:33',0),('KWD','Kuwaiti dinar',1,'2023-08-24 12:47:33',3),('KYD','Cayman Islands dollar',1,'2023-08-24 12:47:33',2),('KZT','Kazakh tenge',1,'2023-08-24 12:47:33',2),('LAK','Lao kip',1,'2023-08-24 12:47:33',2),('LBP','Lebanese pound',1,'2023-08-24 12:47:33',2),('LKR','Sri Lanka rupee',1,'2023-08-24 12:47:33',2),('LRD','Liberian dollar',1,'2023-08-24 12:47:33',2),('LSL','Lesotho loti',1,'2023-08-24 12:47:33',2),('LTL','Lithuanian litas',1,'2023-08-24 12:47:33',4),('LVL','Latvian lats',1,'2023-08-24 12:47:33',4),('LYD','Libyan dinar',1,'2023-08-24 12:47:33',3),('MAD','Moroccan dirham',1,'2023-08-24 12:47:33',2),('MDL','Moldovan leu',1,'2023-08-24 12:47:33',2),('MGA','Malagasy ariary',1,'2023-08-24 12:47:33',2),('MKD','Macedonian denar',1,'2023-08-24 12:47:33',2),('MMK','Myanmar kyat',1,'2023-08-24 12:47:33',2),('MNT','Mongolian tugrik',1,'2023-08-24 12:47:33',2),('MOP','Macao SAR pataca',1,'2023-08-24 12:47:33',2),('MRO','Mauritanian ouguiya',1,'2023-08-24 12:47:33',2),('MUR','Mauritius rupee',1,'2023-08-24 12:47:33',2),('MVR','Maldivian rufiyaa',1,'2023-08-24 12:47:33',2),('MWK','Malawi kwacha',1,'2023-08-24 12:47:33',2),('MXN','Mexican peso',1,'2023-08-24 12:47:33',2),('MXV','Mexican Unidad de Inversion (UDI)',1,'2023-08-24 12:47:33',2),('MYR','Malaysian ringgit',1,'2023-08-24 12:47:33',2),('MZN','Mozambique new metical',1,'2023-08-24 12:47:33',2),('NAD','Namibian dollar',1,'2023-08-24 12:47:33',2),('NGN','Nigerian naira',1,'2023-08-24 12:47:33',2),('NIO','Nicaraguan cordoba oro',1,'2023-08-24 12:47:33',2),('NOK','Norwegian krone',1,'2023-08-24 12:47:33',2),('NPR','Nepalese rupee',1,'2023-08-24 12:47:33',2),('NZD','New Zealand dollar',1,'2023-08-24 12:47:33',2),('OMR','Omani rial',1,'2023-08-24 12:47:33',3),('PAB','Panamanian balboa',1,'2023-08-24 12:47:33',2),('PEN','Peruvian nuevo sol',1,'2023-08-24 12:47:33',2),('PGK','Papua New Guinea kina',1,'2023-08-24 12:47:33',2),('PHP','Philippine peso',1,'2023-08-24 12:47:33',2),('PKR','Pakistani rupee',1,'2023-08-24 12:47:33',2),('PLN','Polish zloty',1,'2023-08-24 12:47:33',2),('PYG','Paraguayan guarani',1,'2023-08-24 12:47:33',0),('QAR','Qatari rial',1,'2023-08-24 12:47:33',2),('RON','Romanian new leu',1,'2023-08-24 12:47:33',2),('RSD','Serbian dinar',1,'2023-08-24 12:47:33',2),('RUB','Russian ruble',1,'2023-08-24 12:47:33',2),('RWF','Rwandan franc',1,'2023-08-24 12:47:33',0),('SAR','Saudi riyal',1,'2023-08-24 12:47:33',2),('SBD','Solomon Islands dollar',1,'2023-08-24 12:47:33',2),('SCR','Seychelles rupee',1,'2023-08-24 12:47:33',2),('SDG','Sudanese pound',1,'2023-08-24 12:47:33',2),('SEK','Swedish krona',1,'2023-08-24 12:47:33',2),('SGD','Singapore dollar',1,'2023-08-24 12:47:33',2),('SHP','Saint Helena pound',1,'2023-08-24 12:47:33',2),('SLL','Sierra Leone leone',1,'2023-08-24 12:47:33',2),('SOS','Somali shilling',1,'2023-08-24 12:47:33',2),('SPL','Seborgan luigino',1,'2023-08-24 12:47:33',4),('SRD','Suriname dollar',1,'2023-08-24 12:47:33',2),('SSP','South Sudanese Pound',1,'2023-08-24 12:47:33',2),('STD','Sao Tome and Principe dobra',1,'2023-08-24 12:47:33',2),('SVC','El Salvador colon',1,'2023-08-24 12:47:33',2),('SYP','Syrian pound',1,'2023-08-24 12:47:33',2),('SZL','Swaziland lilangeni',1,'2023-08-24 12:47:33',2),('THB','Thai baht',1,'2023-08-24 12:47:33',2),('TJS','Tajik somoni',1,'2023-08-24 12:47:33',2),('TMT','Turkmen new manat',1,'2023-08-24 12:47:33',2),('TND','Tunisian dinar',1,'2023-08-24 12:47:33',3),('TOP','Tongan pa\'anga',1,'2023-08-24 12:47:33',2),('TRY','Turkish lira',1,'2023-08-24 12:47:33',2),('TTD','Trinidad and Tobago dollar',1,'2023-08-24 12:47:33',2),('TVD','Tuvaluan dollar',1,'2023-08-24 12:47:33',4),('TWD','Taiwan New dollar',1,'2023-08-24 12:47:33',2),('TZS','Tanzanian shilling',1,'2023-08-24 12:47:33',2),('UAH','Ukrainian hryvnia',1,'2023-08-24 12:47:33',2),('UGX','Uganda new shilling',1,'2023-08-24 12:47:33',0),('USD','US dollar',1,'2023-08-24 12:47:33',2),('USN','US Dollar (Next day)',1,'2023-08-24 12:47:33',2),('UYI','Uruguay Peso en Unidades Indexadas (URUIURUI)',1,'2023-08-24 12:47:33',0),('UYU','Uruguayan peso uruguayo',1,'2023-08-24 12:47:33',2),('UZS','Uzbekistani sum',1,'2023-08-24 12:47:33',2),('VEF','Venezuelan bolivar fuerte',1,'2023-08-24 12:47:33',2),('VND','Vietnamese dong',1,'2023-08-24 12:47:33',0),('VUV','Vanuatu vatu',1,'2023-08-24 12:47:33',0),('WST','Samoan tala',1,'2023-08-24 12:47:33',2),('XAF','CFA franc BEAC',1,'2023-08-24 12:47:33',0),('XAG','Silver (ounce)',1,'2023-08-24 12:47:33',4),('XAU','Gold (ounce)',1,'2023-08-24 12:47:33',4),('XCD','East Caribbean dollar',1,'2023-08-24 12:47:33',2),('XDR','IMF special drawing right',1,'2023-08-24 12:47:33',4),('XFO','Gold franc',1,'2023-08-24 12:47:33',4),('XFU','UIC franc',1,'2023-08-24 12:47:33',4),('XOF','CFA franc BCEAO',1,'2023-08-24 12:47:33',0),('XPD','Palladium (ounce)',1,'2023-08-24 12:47:33',4),('XPF','CFP franc',1,'2023-08-24 12:47:33',0),('XPT','Platinum (ounce)',1,'2023-08-24 12:47:33',4),('XSU','Sucre',1,'2023-08-24 12:47:33',4),('XTS','Reserved for testing purposes',1,'2023-08-24 12:47:33',4),('XUA','African Development Bank (ADB) Unit of Account',1,'2023-08-24 12:47:33',4),('XXX','Assigned for transactions where no currency is involved',1,'2023-08-24 12:47:33',4),('YER','Yemeni rial',1,'2023-08-24 12:47:33',2),('ZAR','South African rand',1,'2023-08-24 12:47:33',2),('ZMK','Zambian kwacha (obsolete)',1,'2023-08-24 12:47:33',4),('ZMW','Zambian kwacha',1,'2023-08-24 12:47:33',2),('ZWD','Zimbabwe dollar (initial)',1,'2023-08-24 12:47:33',4),('ZWL','Zimbabwe dollar (3rd denomination)',1,'2023-08-24 12:47:33',2),('ZWN','Zimbabwe dollar (1st denomination)',1,'2023-08-24 12:47:33',4),('ZWR','Zimbabwe dollar (2nd denomination)',1,'2023-08-24 12:47:33',4);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpointType`
--

DROP TABLE IF EXISTS `endpointType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endpointType` (
  `endpointTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`endpointTypeId`),
  UNIQUE KEY `endpointtype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpointType`
--

LOCK TABLES `endpointType` WRITE;
/*!40000 ALTER TABLE `endpointType` DISABLE KEYS */;
INSERT INTO `endpointType` VALUES (1,'ALARM_NOTIFICATION_URL','Participant callback URL to which alarm notifications can be sent',1,'2023-08-24 12:47:33'),(2,'ALARM_NOTIFICATION_TOPIC','Kafka topic used to publish alarm notifications',1,'2023-08-24 12:47:33'),(3,'FSPIOP_CALLBACK_URL_TRANSFER_POST','Participant callback URL to which transfer post can be sent',1,'2023-08-24 12:47:33'),(4,'FSPIOP_CALLBACK_URL_TRANSFER_PUT','Participant callback URL to which transfer put can be sent',1,'2023-08-24 12:47:33'),(5,'FSPIOP_CALLBACK_URL_TRANSFER_ERROR','Participant callback URL to which transfer error notifications can be sent',1,'2023-08-24 12:47:33'),(6,'NET_DEBIT_CAP_THRESHOLD_BREACH_EMAIL','Participant/Hub operator email address to which the net debit cap breach e-mail notification can be sent',1,'2023-08-24 12:47:33'),(7,'NET_DEBIT_CAP_ADJUSTMENT_EMAIL','Participant/Hub operator email address to which the net debit cap adjustment e-mail notification can be sent',1,'2023-08-24 12:47:33'),(8,'SETTLEMENT_TRANSFER_POSITION_CHANGE_EMAIL','Participant/Hub operator email address to which the position change due to settlement transfer e-mail notification can be sent',1,'2023-08-24 12:47:33'),(9,'FSPIOP_CALLBACK_URL_PARTICIPANT_PUT','Participant callback URL to which put participant information can be sent',1,'2023-08-24 12:47:33'),(10,'FSPIOP_CALLBACK_URL_PARTICIPANT_SUB_ID_PUT','Participant callback URL to which put participant information can be sent, when subId is specified',1,'2023-08-24 12:47:33'),(11,'FSPIOP_CALLBACK_URL_PARTICIPANT_PUT_ERROR','Participant callback URL to which put participant error information can be sent',1,'2023-08-24 12:47:33'),(12,'FSPIOP_CALLBACK_URL_PARTICIPANT_SUB_ID_PUT_ERROR','Participant callback URL to which put participant error information can be sent, when subId is specified',1,'2023-08-24 12:47:33'),(13,'FSPIOP_CALLBACK_URL_PARTICIPANT_DELETE','Participant callback URL to which delete participant information can be sent',1,'2023-08-24 12:47:33'),(14,'FSPIOP_CALLBACK_URL_PARTICIPANT_SUB_ID_DELETE','Participant callback URL to which delete participant information can be sent, when subId is specified',1,'2023-08-24 12:47:33'),(15,'FSPIOP_CALLBACK_URL_PARTICIPANT_BATCH_PUT','Participant callback URL to which put batch participant information can be sent',1,'2023-08-24 12:47:33'),(16,'FSPIOP_CALLBACK_URL_PARTICIPANT_BATCH_PUT_ERROR','Participant callback URL to which put batch participant error information can be sent',1,'2023-08-24 12:47:33'),(17,'FSPIOP_CALLBACK_URL_PARTIES_GET','Parties callback URL to which get parties information can be requested',1,'2023-08-24 12:47:33'),(18,'FSPIOP_CALLBACK_URL_PARTIES_SUB_ID_GET','Parties callback URL to which get parties information can be requested',1,'2023-08-24 12:47:33'),(19,'FSPIOP_CALLBACK_URL_PARTIES_PUT','Parties callback URL to which put parties information can be sent',1,'2023-08-24 12:47:33'),(20,'FSPIOP_CALLBACK_URL_PARTIES_SUB_ID_PUT','Parties callback URL to which put parties information can be sent when SubId is specified',1,'2023-08-24 12:47:33'),(21,'FSPIOP_CALLBACK_URL_PARTIES_PUT_ERROR','Parties callback URL to which put participant error information can be sent',1,'2023-08-24 12:47:33'),(22,'FSPIOP_CALLBACK_URL_PARTIES_SUB_ID_PUT_ERROR','Parties callback URL to which put parties error information can be sent when SubId is specified',1,'2023-08-24 12:47:33'),(23,'FSPIOP_CALLBACK_URL_QUOTES','Quotes callback URL to which put quotes requests can be sent',1,'2023-08-24 12:47:33'),(24,'FSPIOP_CALLBACK_URL_BULK_TRANSFER_POST','Participant callback URL to which bulk transfer post can be sent',1,'2023-08-24 12:47:33'),(25,'FSPIOP_CALLBACK_URL_BULK_TRANSFER_PUT','Participant callback URL to which bulk transfer put can be sent',1,'2023-08-24 12:47:33'),(26,'FSPIOP_CALLBACK_URL_BULK_TRANSFER_ERROR','Participant callback URL to which bulk transfer error notifications can be sent',1,'2023-08-24 12:47:33'),(27,'FSPIOP_CALLBACK_URL_AUTHORIZATIONS','Participant callback URL to which authorization requests can be sent',1,'2023-08-24 12:47:33'),(28,'FSPIOP_CALLBACK_URL_TRX_REQ_SERVICE','Participant callback URL to which transaction requests can be sent',1,'2023-08-24 12:47:33'),(29,'FSPIOP_CALLBACK_URL_BULK_QUOTES','Bulk Quotes callback URL to which put bulkQuotes requests can be sent',1,'2023-08-24 12:47:33'),(30,'TP_CB_URL_TRANSACTION_REQUEST_GET','Participant callback URL where GET /thirdpartyRequests/transactions/{ID} can be sent',1,'2023-08-24 12:47:33'),(31,'TP_CB_URL_TRANSACTION_REQUEST_POST','Participant callback URL where POST /thirdpartyRequests/transactions can be sent',1,'2023-08-24 12:47:33'),(32,'TP_CB_URL_TRANSACTION_REQUEST_PUT','Participant callback URL where PUT /thirdpartyRequests/transactions/{ID} can be sent',1,'2023-08-24 12:47:33'),(33,'TP_CB_URL_TRANSACTION_REQUEST_PUT_ERROR','Participant callback URL to which PUT /thirdpartyRequests/transactions/{ID}/error error information can be sent',1,'2023-08-24 12:47:33'),(34,'TP_CB_URL_TRANSACTION_REQUEST_PATCH','Participant callback URL where PATCH /thirdpartyRequests/transactions/{ID} can be sent',1,'2023-08-24 12:47:33'),(35,'TP_CB_URL_TRANSACTION_REQUEST_AUTH_POST','Participant callback URL where POST /thirdpartyRequests/transactions/{ID}/authorizations can be sent',1,'2023-08-24 12:47:33'),(36,'TP_CB_URL_TRANSACTION_REQUEST_AUTH_PUT','Participant callback URL where PUT /thirdpartyRequests/transactions/{ID}/authorizations can be sent',1,'2023-08-24 12:47:33'),(37,'TP_CB_URL_TRANSACTION_REQUEST_AUTH_PUT_ERROR','Participant callback URL where PUT /thirdpartyRequests/transactions/{ID}/authorizations/error error information can be sent',1,'2023-08-24 12:47:33'),(38,'TP_CB_URL_TRANSACTION_REQUEST_VERIFY_POST','Participant callback URL where POST /thirdpartyRequests/verifications can be sent',1,'2023-08-24 12:47:33'),(39,'TP_CB_URL_TRANSACTION_REQUEST_VERIFY_PUT','Participant callback URL where PUT /thirdpartyRequests/verifications/{ID} can be sent',1,'2023-08-24 12:47:33'),(40,'TP_CB_URL_TRANSACTION_REQUEST_VERIFY_PUT_ERROR','Participant callback URL where PUT /thirdpartyRequests/verifications/{ID}/error can be sent',1,'2023-08-24 12:47:33'),(41,'TP_CB_URL_CONSENT_REQUEST_POST','Participant callback URL where POST /consentRequests can be sent',1,'2023-08-24 12:47:33'),(42,'TP_CB_URL_CONSENT_REQUEST_PUT','Participant callback URL where PUT /consentRequests/{ID} can be sent',1,'2023-08-24 12:47:33'),(43,'TP_CB_URL_CONSENT_REQUEST_PUT_ERROR','Participant callback URL where PUT /consentRequests/{ID}/error error information can be sent',1,'2023-08-24 12:47:33'),(44,'TP_CB_URL_CONSENT_REQUEST_PATCH','Participant callback URL where PATCH /consentRequests/{ID} can be sent',1,'2023-08-24 12:47:33'),(45,'TP_CB_URL_CREATE_CREDENTIAL_POST','Participant callback URL where POST /consentRequests/{ID}/createCredential can be sent',1,'2023-08-24 12:47:33'),(46,'TP_CB_URL_CONSENT_POST','Participant callback URL where POST /consents/ can be sent',1,'2023-08-24 12:47:33'),(47,'TP_CB_URL_CONSENT_GET','Participant callback URL where GET /consents/{ID} can be sent',1,'2023-08-24 12:47:33'),(48,'TP_CB_URL_CONSENT_PUT','Participant callback URL where PUT /consents/{ID} can be sent',1,'2023-08-24 12:47:33'),(49,'TP_CB_URL_CONSENT_PATCH','Participant callback URL where PATCH /consents/{ID} can be sent',1,'2023-08-24 12:47:33'),(50,'TP_CB_URL_CONSENT_PUT_ERROR','Participant callback URL where PUT /consents/{ID}/error error information can be sent',1,'2023-08-24 12:47:33'),(51,'TP_CB_URL_CONSENT_GENERATE_CHALLENGE_POST','Participant callback URL where POST /consents/{ID}/generateChallenge can be sent',1,'2023-08-24 12:47:33'),(52,'TP_CB_URL_CONSENT_GENERATE_CHALLENGE_PUT_ERROR','Participant callback URL where PUT /consents/{ID}/generateChallenge/error error information can be sent',1,'2023-08-24 12:47:33'),(53,'TP_CB_URL_ACCOUNTS_GET','Accounts callback URL where GET /accounts/{ID} can be sent',1,'2023-08-24 12:47:33'),(54,'TP_CB_URL_ACCOUNTS_PUT','Accounts callback URL where PUT /accounts/{ID} can be sent',1,'2023-08-24 12:47:33'),(55,'TP_CB_URL_ACCOUNTS_PUT_ERROR','Accounts callback URL where PUT /accounts/{ID}/error error information can be sent',1,'2023-08-24 12:47:33'),(56,'TP_CB_URL_SERVICES_GET','Participant callback URL where GET /services/{ServiceType} can be sent',1,'2023-08-24 12:47:33'),(57,'TP_CB_URL_SERVICES_PUT','Participant callback URL where PUT /services/{ServiceType} can be sent',1,'2023-08-24 12:47:33'),(58,'TP_CB_URL_SERVICES_PUT_ERROR','Participant callback URL where PUT /services/{ServiceType}/error can be sent',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `endpointType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eventId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expiringTransfer`
--

DROP TABLE IF EXISTS `expiringTransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expiringTransfer` (
  `expiringTransferId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transferId` varchar(36) NOT NULL,
  `expirationDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`expiringTransferId`),
  UNIQUE KEY `expiringtransfer_transferid_unique` (`transferId`),
  KEY `expiringtransfer_expirationdate_index` (`expirationDate`),
  CONSTRAINT `expiringtransfer_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expiringTransfer`
--

LOCK TABLES `expiringTransfer` WRITE;
/*!40000 ALTER TABLE `expiringTransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `expiringTransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geoCode`
--

DROP TABLE IF EXISTS `geoCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geoCode` (
  `geoCodeId` int unsigned NOT NULL AUTO_INCREMENT,
  `quotePartyId` bigint unsigned NOT NULL COMMENT 'Optionally the GeoCode for the Payer/Payee may have been provided. If the Quote Response has the GeoCode for the Payee, an additional row is added',
  `latitude` varchar(50) NOT NULL COMMENT 'Latitude of the initiating Party',
  `longitude` varchar(50) NOT NULL COMMENT 'Longitude of the initiating Party',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`geoCodeId`),
  KEY `geocode_quotepartyid_foreign` (`quotePartyId`),
  CONSTRAINT `geocode_quotepartyid_foreign` FOREIGN KEY (`quotePartyId`) REFERENCES `quoteParty` (`quotePartyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geoCode`
--

LOCK TABLES `geoCode` WRITE;
/*!40000 ALTER TABLE `geoCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `geoCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilpPacket`
--

DROP TABLE IF EXISTS `ilpPacket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilpPacket` (
  `transferId` varchar(36) NOT NULL,
  `value` text NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferId`),
  CONSTRAINT `ilppacket_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilpPacket`
--

LOCK TABLES `ilpPacket` WRITE;
/*!40000 ALTER TABLE `ilpPacket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ilpPacket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgerAccountType`
--

DROP TABLE IF EXISTS `ledgerAccountType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgerAccountType` (
  `ledgerAccountTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isSettleable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ledgerAccountTypeId`),
  UNIQUE KEY `ledgeraccounttype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgerAccountType`
--

LOCK TABLES `ledgerAccountType` WRITE;
/*!40000 ALTER TABLE `ledgerAccountType` DISABLE KEYS */;
INSERT INTO `ledgerAccountType` VALUES (1,'POSITION','Typical accounts from which a DFSP provisions transfers',1,'2023-08-24 12:47:33',1),(2,'SETTLEMENT','Reflects the individual DFSP Settlement Accounts as held at the Settlement Bank',1,'2023-08-24 12:47:33',0),(3,'HUB_RECONCILIATION','A single account for each currency with which the hub operates. The account is \"held\" by the Participant representing the hub in the switch',1,'2023-08-24 12:47:33',0),(4,'HUB_MULTILATERAL_SETTLEMENT','A single account for each currency with which the hub operates. The account is \"held\" by the Participant representing the hub in the switch',1,'2023-08-24 12:47:33',0),(5,'INTERCHANGE_FEE',NULL,1,'2023-08-24 12:47:33',1),(6,'INTERCHANGE_FEE_SETTLEMENT',NULL,1,'2023-08-24 12:47:33',0);
/*!40000 ALTER TABLE `ledgerAccountType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgerEntryType`
--

DROP TABLE IF EXISTS `ledgerEntryType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgerEntryType` (
  `ledgerEntryTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ledgerAccountTypeId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ledgerEntryTypeId`),
  UNIQUE KEY `ledgerentrytype_name_unique` (`name`),
  KEY `ledgerentrytype_ledgeraccounttypeid_foreign` (`ledgerAccountTypeId`),
  CONSTRAINT `ledgerentrytype_ledgeraccounttypeid_foreign` FOREIGN KEY (`ledgerAccountTypeId`) REFERENCES `ledgerAccountType` (`ledgerAccountTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgerEntryType`
--

LOCK TABLES `ledgerEntryType` WRITE;
/*!40000 ALTER TABLE `ledgerEntryType` DISABLE KEYS */;
INSERT INTO `ledgerEntryType` VALUES (1,'PRINCIPLE_VALUE','The principle amount to be settled between parties, derived on quotes between DFSPs',1,'2023-08-24 12:47:33',1),(2,'INTERCHANGE_FEE','Fees to be paid between DFSP',1,'2023-08-24 12:47:33',5),(3,'HUB_FEE','Fees to be paid from the DFSPs to the Hub Operator',1,'2023-08-24 12:47:33',NULL),(4,'POSITION_DEPOSIT','Used when increasing Net Debit Cap',1,'2023-08-24 12:47:33',NULL),(5,'POSITION_WITHDRAWAL','Used when decreasing Net Debit Cap',1,'2023-08-24 12:47:33',NULL),(6,'SETTLEMENT_NET_RECIPIENT','Participant is settlement net recipient',1,'2023-08-24 12:47:33',NULL),(7,'SETTLEMENT_NET_SENDER','Participant is settlement net sender',1,'2023-08-24 12:47:33',NULL),(8,'SETTLEMENT_NET_ZERO','Participant is settlement net sender',1,'2023-08-24 12:47:33',NULL),(9,'RECORD_FUNDS_IN','Settlement account funds in',1,'2023-08-24 12:47:33',NULL),(10,'RECORD_FUNDS_OUT','Settlement account funds out',1,'2023-08-24 12:47:33',NULL);
/*!40000 ALTER TABLE `ledgerEntryType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES (1,'100100_event.js',1,'2023-08-24 12:47:31'),(2,'110100_contactType.js',1,'2023-08-24 12:47:31'),(3,'110101_contactType-indexes.js',1,'2023-08-24 12:47:31'),(4,'110200_currency.js',1,'2023-08-24 12:47:31'),(5,'110201_currency-scale.js',1,'2023-08-24 12:47:31'),(6,'110300_endpointType.js',1,'2023-08-24 12:47:31'),(7,'110301_endpointType-indexes.js',1,'2023-08-24 12:47:31'),(8,'110400_ledgerEntryType.js',1,'2023-08-24 12:47:31'),(9,'110401_ledgerEntryType-indexes.js',1,'2023-08-24 12:47:31'),(10,'110450_ledgerAccountType.js',1,'2023-08-24 12:47:31'),(11,'110451_ledgerAccountType-indexes.js',1,'2023-08-24 12:47:31'),(12,'110500_participantLimitType.js',1,'2023-08-24 12:47:31'),(13,'110501_participantLimitType-indexes.js',1,'2023-08-24 12:47:31'),(14,'110600_transferParticipantRoleType.js',1,'2023-08-24 12:47:31'),(15,'110601_transferParticipantRoleType-indexes.js',1,'2023-08-24 12:47:31'),(16,'110700_transferState.js',1,'2023-08-24 12:47:31'),(17,'110800_settlementWindowState.js',1,'2023-08-24 12:47:31'),(18,'110900_settlementState.js',1,'2023-08-24 12:47:31'),(19,'111000_amountType.js',1,'2023-08-24 12:47:31'),(20,'111001_amountType-indexes.js',1,'2023-08-24 12:47:31'),(21,'111100_balanceOfPayments.js',1,'2023-08-24 12:47:31'),(22,'111101_balanceOfPayments-indexes.js',1,'2023-08-24 12:47:31'),(23,'111200_partyIdentifierType.js',1,'2023-08-24 12:47:31'),(24,'111201_partyIdentifierType-indexes.js',1,'2023-08-24 12:47:31'),(25,'111300_partyType.js',1,'2023-08-24 12:47:31'),(26,'111301_partyType-indexes.js',1,'2023-08-24 12:47:31'),(27,'111400_quoteDuplicateCheck.js',1,'2023-08-24 12:47:31'),(28,'111500_transactionInitiator.js',1,'2023-08-24 12:47:31'),(29,'111501_transactionInitiator-indexes.js',1,'2023-08-24 12:47:31'),(30,'111600_transactionInitiatorType.js',1,'2023-08-24 12:47:31'),(31,'111601_transactionInitiatorType-indexes.js',1,'2023-08-24 12:47:31'),(32,'111700_settlementDelay.js',1,'2023-08-24 12:47:31'),(33,'111701_settlementDelay-indexes.js',1,'2023-08-24 12:47:31'),(34,'111800_settlementInterchange.js',1,'2023-08-24 12:47:31'),(35,'111801_settlementInterchange-indexes.js',1,'2023-08-24 12:47:31'),(36,'111900_settlementGranularity.js',1,'2023-08-24 12:47:31'),(37,'111901_settlementGranularity-indexes.js',1,'2023-08-24 12:47:31'),(38,'112000_bulkTransferState.js',1,'2023-08-24 12:47:31'),(39,'112100_bulkProcessingState.js',1,'2023-08-24 12:47:31'),(40,'112101_bulkProcessingState-indexes.js',1,'2023-08-24 12:47:31'),(41,'200100_participant.js',1,'2023-08-24 12:47:31'),(42,'200101_participant-indexes.js',1,'2023-08-24 12:47:31'),(43,'200200_participantContact.js',1,'2023-08-24 12:47:31'),(44,'200201_participantContact-indexes.js',1,'2023-08-24 12:47:31'),(45,'200300_participantEndpoint.js',1,'2023-08-24 12:47:31'),(46,'200301_participantEndpoint-indexes.js',1,'2023-08-24 12:47:31'),(47,'200400_participantParty.js',1,'2023-08-24 12:47:31'),(48,'200401_participantParty-indexes.js',1,'2023-08-24 12:47:31'),(49,'200600_token.js',1,'2023-08-24 12:47:31'),(50,'200601_token-indexes.js',1,'2023-08-24 12:47:31'),(51,'300100_transferDuplicateCheck.js',1,'2023-08-24 12:47:31'),(52,'300150_bulkTransferDuplicateCheck.js',1,'2023-08-24 12:47:31'),(53,'300200_transfer.js',1,'2023-08-24 12:47:31'),(54,'300201_transfer-indexes.js',1,'2023-08-24 12:47:31'),(55,'300202_transfer-decimal184.js',1,'2023-08-24 12:47:31'),(56,'300250_bulkTransfer.js',1,'2023-08-24 12:47:31'),(57,'300251_bulkTransfer-indexes.js',1,'2023-08-24 12:47:31'),(58,'300275_bulkTransferAssociation.js',1,'2023-08-24 12:47:31'),(59,'300276_bulkTransferAssociation-indexes.js',1,'2023-08-24 12:47:31'),(60,'300300_ilpPacket.js',1,'2023-08-24 12:47:31'),(61,'300400_transferStateChange.js',1,'2023-08-24 12:47:31'),(62,'300401_transferStateChange-indexes.js',1,'2023-08-24 12:47:31'),(63,'300450_bulkTransferStateChange.js',1,'2023-08-24 12:47:31'),(64,'300451_bulkTransferStateChange-indexes.js',1,'2023-08-24 12:47:31'),(65,'300500_segment.js',1,'2023-08-24 12:47:31'),(66,'300501_segment-indexes.js',1,'2023-08-24 12:47:31'),(67,'310100_participantCurrency.js',1,'2023-08-24 12:47:31'),(68,'310101_participantCurrency-indexes.js',1,'2023-08-24 12:47:31'),(69,'310200_transferParticipant.js',1,'2023-08-24 12:47:31'),(70,'310201_transferParticipant-indexes.js',1,'2023-08-24 12:47:31'),(71,'310202_transferParticipant-decimal184.js',1,'2023-08-24 12:47:31'),(72,'310203_transferParticipant-indexes.js',1,'2023-08-24 12:47:31'),(73,'310300_participantPosition.js',1,'2023-08-24 12:47:31'),(74,'310301_participantPosition-indexes.js',1,'2023-08-24 12:47:31'),(75,'310302_participantPosition-decimal184.js',1,'2023-08-24 12:47:31'),(76,'310400_participantPositionChange.js',1,'2023-08-24 12:47:31'),(77,'310401_participantPositionChange-indexes.js',1,'2023-08-24 12:47:31'),(78,'310402_participantPositionChange-decimal184.js',1,'2023-08-24 12:47:31'),(79,'310500_participantLimit.js',1,'2023-08-24 12:47:31'),(80,'310501_participantLimit-indexes.js',1,'2023-08-24 12:47:31'),(81,'310502_participantLimit-decimal184.js',1,'2023-08-24 12:47:32'),(82,'310503_participantLimit-indexes-composite.js',1,'2023-08-24 12:47:32'),(83,'400100_settlementWindow.js',1,'2023-08-24 12:47:32'),(84,'400200_settlement.js',1,'2023-08-24 12:47:32'),(85,'400300_settlementSettlementWindow.js',1,'2023-08-24 12:47:32'),(86,'400301_settlementSettlementWindow-indexes.js',1,'2023-08-24 12:47:32'),(87,'400400_settlementWindowStateChange.js',1,'2023-08-24 12:47:32'),(88,'400401_settlmentWindowStateChange-indexes.js',1,'2023-08-24 12:47:32'),(89,'400500_settlementTransferParticipant.js',1,'2023-08-24 12:47:32'),(90,'400501_settlementTransferParticipant-indexes.js',1,'2023-08-24 12:47:32'),(91,'400502_settlementTransferParticipant-decimal184.js',1,'2023-08-24 12:47:32'),(92,'400600_settlementParticipantCurrency.js',1,'2023-08-24 12:47:32'),(93,'400601_settlementParticipantCurrency-indexes.js',1,'2023-08-24 12:47:32'),(94,'400602_settlementParticipantCurrency-decimal184.js',1,'2023-08-24 12:47:32'),(95,'400700_settlementParticipantCurrencyStateChange.js',1,'2023-08-24 12:47:32'),(96,'400701_settlementParticipantCurrencyStateChange-indexes.js',1,'2023-08-24 12:47:32'),(97,'400800_settlementStateChange.js',1,'2023-08-24 12:47:32'),(98,'400801_settlementStateChange-indexes.js',1,'2023-08-24 12:47:32'),(99,'400900_settlementWindowContent.js',1,'2023-08-24 12:47:32'),(100,'401000_settlementWindowContentStateChange.js',1,'2023-08-24 12:47:32'),(101,'401001_settlementWindowContentStateChange-indexes.js',1,'2023-08-24 12:47:32'),(102,'401002_settlementWindowContent-indexes.js',1,'2023-08-24 12:47:32'),(103,'401200_settlementContentAggregation.js',1,'2023-08-24 12:47:32'),(104,'401201_settlementContentAggregation-indexes.js',1,'2023-08-24 12:47:32'),(105,'401300_settlementModel.js',1,'2023-08-24 12:47:32'),(106,'401301_settlementModel-indexes.js',1,'2023-08-24 12:47:32'),(107,'410100_transferFulfilmentDuplicateCheck.js',1,'2023-08-24 12:47:32'),(108,'410101_transferFulfilmentDuplicateCheck-indexes.js',1,'2023-08-24 12:47:32'),(109,'410102_transferFulfilmentDuplicateCheck-dropForeignTransferId.js',1,'2023-08-24 12:47:32'),(110,'410103_transferFulfilmentDuplicateCheck-hashNullable.js',1,'2023-08-24 12:47:32'),(111,'410200_transferFulfilment.js',1,'2023-08-24 12:47:32'),(112,'410201_transferFulfilment-indexes.js',1,'2023-08-24 12:47:32'),(113,'410202_transferFulfilment-ilpFulfilment.js',1,'2023-08-24 12:47:32'),(114,'410203_transferFulfilment-foreignTransferFulfilmentId.js',1,'2023-08-24 12:47:32'),(115,'410240_bulkTransferFulfilmentDuplicateCheck.js',1,'2023-08-24 12:47:32'),(116,'410250_bulkTransferFulfilment.js',1,'2023-08-24 12:47:32'),(117,'410300_transferExtension.js',1,'2023-08-24 12:47:32'),(118,'410301_transferExtension-indexes.js',1,'2023-08-24 12:47:32'),(119,'410302_transferExtension-transferErrorId.js',1,'2023-08-24 12:47:32'),(120,'410350_bulkTransferExtension.js',1,'2023-08-24 12:47:32'),(121,'410351_bulkTransferExtension-indexes.js',1,'2023-08-24 12:47:32'),(122,'410400_transferTimeout.js',1,'2023-08-24 12:47:32'),(123,'410401_transferTimeout-indexes.js',1,'2023-08-24 12:47:32'),(124,'410450_transferErrorDuplicateCheck.js',1,'2023-08-24 12:47:32'),(125,'410500_transferError.js',1,'2023-08-24 12:47:32'),(126,'410501_transferError-indexes.js',1,'2023-08-24 12:47:32'),(127,'410502_transferError-foreignTransferErrorDuplicateCheckId.js',1,'2023-08-24 12:47:32'),(128,'410550_bulkTransferError.js',1,'2023-08-24 12:47:32'),(129,'410551_bulkTransferError-indexes.js',1,'2023-08-24 12:47:32'),(130,'410600_expiringTransfer.js',1,'2023-08-24 12:47:32'),(131,'410601_expiringTransfer-indexes.js',1,'2023-08-24 12:47:32'),(132,'500100_transactionReference.js',1,'2023-08-24 12:47:32'),(133,'500101_transactionReference-indexes.js',1,'2023-08-24 12:47:32'),(134,'500200_transactionScenario.js',1,'2023-08-24 12:47:32'),(135,'500201_transactionScenario-indexes.js',1,'2023-08-24 12:47:32'),(136,'500300_transactionSubScenario.js',1,'2023-08-24 12:47:32'),(137,'500400_quote.js',1,'2023-08-24 12:47:32'),(138,'500401_quote-hotfix-2719.js',1,'2023-08-24 12:47:32'),(139,'500500_quoteParty.js',1,'2023-08-24 12:47:32'),(140,'500501_feature-fixSubIdRef.js',1,'2023-08-24 12:47:32'),(141,'500600_party.js',1,'2023-08-24 12:47:32'),(142,'500601_party-2480.js',1,'2023-08-24 12:47:32'),(143,'500700_quoteResponse.js',1,'2023-08-24 12:47:32'),(144,'500800_quoteResponseIlpPacket.js',1,'2023-08-24 12:47:32'),(145,'500900_geoCode.js',1,'2023-08-24 12:47:32'),(146,'501000_quoteExtension.js',1,'2023-08-24 12:47:32'),(147,'501001_quoteExtension-quote-service-174.js',1,'2023-08-24 12:47:32'),(148,'501002_quoteExtension-2522.js',1,'2023-08-24 12:47:32'),(149,'501100_quoteResponseDuplicateCheck.js',1,'2023-08-24 12:47:32'),(150,'501200_quoteError.js',1,'2023-08-24 12:47:32'),(151,'501300_transferRules.js',1,'2023-08-24 12:47:32'),(152,'800100_quotePartyView.js',1,'2023-08-24 12:47:32'),(153,'800101_feature-fixSubIdRef.js',1,'2023-08-24 12:47:32'),(154,'800200_quoteView.js',1,'2023-08-24 12:47:32'),(155,'800300_quoteResponseView.js',1,'2023-08-24 12:47:32'),(156,'900100_foreign-keys.js',1,'2023-08-24 12:47:33'),(157,'900101_foreign-keys.js',1,'2023-08-24 12:47:33'),(158,'910100_feature904DDL.js',1,'2023-08-24 12:47:33'),(159,'910101_feature904DataMigration.js',1,'2023-08-24 12:47:33'),(160,'910102_feature949DataMigration.js',1,'2023-08-24 12:47:33'),(161,'910102_hotfix954.js',1,'2023-08-24 12:47:33'),(162,'910103_feature1093SettlementByCurrency.js',1,'2023-08-24 12:47:33'),(163,'940100_quotePartyIdInfoExtension.js',1,'2023-08-24 12:47:33'),(164,'940101_quotePartyIdInfoExtension-2522.js',1,'2023-08-24 12:47:33'),(165,'950100_settlementContentAggregation-decimal184.js',1,'2023-08-24 12:47:33'),(166,'950101_transferParticipantStateChange.js',1,'2023-08-24 12:47:33'),(167,'950102_settlementModel-adjustPosition.js',1,'2023-08-24 12:47:33'),(168,'950103_dropTransferParticipantStateChange.js',1,'2023-08-24 12:47:33'),(169,'950104_settlementModel-settlementAccountTypeId.js',1,'2023-08-24 12:47:33'),(170,'950106_unique_settlement_model_ledger_account_currency.js',1,'2023-08-24 12:47:33'),(171,'950107_settlementWindowContent_foreign_settlementModel.js',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_lock`
--

DROP TABLE IF EXISTS `migration_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_lock` (
  `index` int unsigned NOT NULL AUTO_INCREMENT,
  `is_locked` int DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_lock`
--

LOCK TABLES `migration_lock` WRITE;
/*!40000 ALTER TABLE `migration_lock` DISABLE KEYS */;
INSERT INTO `migration_lock` VALUES (1,0);
/*!40000 ALTER TABLE `migration_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant` (
  `participantId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(128) NOT NULL,
  PRIMARY KEY (`participantId`),
  UNIQUE KEY `participant_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (1,'Hub','Hub Operator',1,'2023-08-24 12:47:33','seeds'),(2,'perffsp1',NULL,1,'2023-08-24 12:48:53','unknown'),(3,'perffsp2',NULL,1,'2023-08-24 12:49:03','unknown'),(4,'perffsp3',NULL,1,'2023-08-24 12:49:13','unknown'),(5,'perffsp4',NULL,1,'2023-08-24 12:49:23','unknown'),(6,'perffsp5',NULL,1,'2023-08-24 12:49:33','unknown'),(7,'perffsp6',NULL,1,'2023-08-24 12:49:44','unknown'),(8,'perffsp7',NULL,1,'2023-08-24 12:49:54','unknown'),(9,'perffsp8',NULL,1,'2023-08-24 12:50:04','unknown'),(10,'greenbankfsp',NULL,1,'2023-08-24 12:50:15','unknown'),(11,'pinkbankfsp',NULL,1,'2023-08-24 12:50:20','unknown');
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantContact`
--

DROP TABLE IF EXISTS `participantContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantContact` (
  `participantContactId` int unsigned NOT NULL AUTO_INCREMENT,
  `participantId` int unsigned NOT NULL,
  `contactTypeId` int unsigned NOT NULL,
  `value` varchar(256) NOT NULL,
  `priorityPreference` int NOT NULL DEFAULT '9',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(128) NOT NULL,
  PRIMARY KEY (`participantContactId`),
  KEY `participantcontact_participantid_index` (`participantId`),
  KEY `participantcontact_contacttypeid_index` (`contactTypeId`),
  CONSTRAINT `participantcontact_contacttypeid_foreign` FOREIGN KEY (`contactTypeId`) REFERENCES `contactType` (`contactTypeId`),
  CONSTRAINT `participantcontact_participantid_foreign` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantContact`
--

LOCK TABLES `participantContact` WRITE;
/*!40000 ALTER TABLE `participantContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantCurrency`
--

DROP TABLE IF EXISTS `participantCurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantCurrency` (
  `participantCurrencyId` int unsigned NOT NULL AUTO_INCREMENT,
  `participantId` int unsigned NOT NULL,
  `currencyId` varchar(3) NOT NULL,
  `ledgerAccountTypeId` int unsigned NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(128) NOT NULL,
  PRIMARY KEY (`participantCurrencyId`),
  UNIQUE KEY `participantcurrency_pcl_unique` (`participantId`,`currencyId`,`ledgerAccountTypeId`),
  KEY `participantcurrency_ledgeraccounttypeid_foreign` (`ledgerAccountTypeId`),
  KEY `participantcurrency_participantid_index` (`participantId`),
  KEY `participantcurrency_currencyid_index` (`currencyId`),
  CONSTRAINT `participantcurrency_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `participantcurrency_ledgeraccounttypeid_foreign` FOREIGN KEY (`ledgerAccountTypeId`) REFERENCES `ledgerAccountType` (`ledgerAccountTypeId`),
  CONSTRAINT `participantcurrency_participantid_foreign` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantCurrency`
--

LOCK TABLES `participantCurrency` WRITE;
/*!40000 ALTER TABLE `participantCurrency` DISABLE KEYS */;
INSERT INTO `participantCurrency` VALUES (1,1,'USD',4,1,'2023-08-24 12:48:42','unknown'),(2,1,'USD',3,1,'2023-08-24 12:48:42','unknown'),(3,1,'BGN',4,1,'2023-08-24 12:48:43','unknown'),(4,1,'BGN',3,1,'2023-08-24 12:48:43','unknown'),(5,1,'INR',4,1,'2023-08-24 12:48:43','unknown'),(6,1,'INR',3,1,'2023-08-24 12:48:43','unknown'),(7,2,'USD',1,1,'2023-08-24 12:48:53','unknown'),(8,2,'USD',2,1,'2023-08-24 12:48:53','unknown'),(9,2,'BGN',1,1,'2023-08-24 12:48:57','unknown'),(10,2,'BGN',2,1,'2023-08-24 12:48:57','unknown'),(11,2,'INR',1,1,'2023-08-24 12:48:57','unknown'),(12,2,'INR',2,1,'2023-08-24 12:48:57','unknown'),(13,2,'INR',5,1,'2023-08-24 12:48:57','unknown'),(14,2,'INR',6,1,'2023-08-24 12:48:57','unknown'),(15,3,'USD',1,1,'2023-08-24 12:49:03','unknown'),(16,3,'USD',2,1,'2023-08-24 12:49:03','unknown'),(17,3,'BGN',1,1,'2023-08-24 12:49:07','unknown'),(18,3,'BGN',2,1,'2023-08-24 12:49:07','unknown'),(19,3,'INR',1,1,'2023-08-24 12:49:08','unknown'),(20,3,'INR',2,1,'2023-08-24 12:49:08','unknown'),(21,3,'INR',5,1,'2023-08-24 12:49:08','unknown'),(22,3,'INR',6,1,'2023-08-24 12:49:08','unknown'),(23,4,'USD',1,1,'2023-08-24 12:49:13','unknown'),(24,4,'USD',2,1,'2023-08-24 12:49:13','unknown'),(25,4,'BGN',1,1,'2023-08-24 12:49:17','unknown'),(26,4,'BGN',2,1,'2023-08-24 12:49:17','unknown'),(27,4,'INR',1,1,'2023-08-24 12:49:18','unknown'),(28,4,'INR',2,1,'2023-08-24 12:49:18','unknown'),(29,4,'INR',5,1,'2023-08-24 12:49:18','unknown'),(30,4,'INR',6,1,'2023-08-24 12:49:18','unknown'),(31,5,'USD',1,1,'2023-08-24 12:49:23','unknown'),(32,5,'USD',2,1,'2023-08-24 12:49:23','unknown'),(33,5,'BGN',1,1,'2023-08-24 12:49:27','unknown'),(34,5,'BGN',2,1,'2023-08-24 12:49:27','unknown'),(35,5,'INR',1,1,'2023-08-24 12:49:28','unknown'),(36,5,'INR',2,1,'2023-08-24 12:49:28','unknown'),(37,5,'INR',5,1,'2023-08-24 12:49:28','unknown'),(38,5,'INR',6,1,'2023-08-24 12:49:28','unknown'),(39,6,'USD',1,1,'2023-08-24 12:49:33','unknown'),(40,6,'USD',2,1,'2023-08-24 12:49:33','unknown'),(41,6,'BGN',1,1,'2023-08-24 12:49:38','unknown'),(42,6,'BGN',2,1,'2023-08-24 12:49:38','unknown'),(43,6,'INR',1,1,'2023-08-24 12:49:38','unknown'),(44,6,'INR',2,1,'2023-08-24 12:49:38','unknown'),(45,6,'INR',5,1,'2023-08-24 12:49:38','unknown'),(46,6,'INR',6,1,'2023-08-24 12:49:38','unknown'),(47,7,'USD',1,1,'2023-08-24 12:49:44','unknown'),(48,7,'USD',2,1,'2023-08-24 12:49:44','unknown'),(49,7,'BGN',1,1,'2023-08-24 12:49:48','unknown'),(50,7,'BGN',2,1,'2023-08-24 12:49:48','unknown'),(51,7,'INR',1,1,'2023-08-24 12:49:48','unknown'),(52,7,'INR',2,1,'2023-08-24 12:49:48','unknown'),(53,7,'INR',5,1,'2023-08-24 12:49:48','unknown'),(54,7,'INR',6,1,'2023-08-24 12:49:48','unknown'),(55,8,'USD',1,1,'2023-08-24 12:49:54','unknown'),(56,8,'USD',2,1,'2023-08-24 12:49:54','unknown'),(57,8,'BGN',1,1,'2023-08-24 12:49:58','unknown'),(58,8,'BGN',2,1,'2023-08-24 12:49:58','unknown'),(59,8,'INR',1,1,'2023-08-24 12:49:59','unknown'),(60,8,'INR',2,1,'2023-08-24 12:49:59','unknown'),(61,8,'INR',5,1,'2023-08-24 12:49:59','unknown'),(62,8,'INR',6,1,'2023-08-24 12:49:59','unknown'),(63,9,'USD',1,1,'2023-08-24 12:50:04','unknown'),(64,9,'USD',2,1,'2023-08-24 12:50:04','unknown'),(65,9,'BGN',1,1,'2023-08-24 12:50:09','unknown'),(66,9,'BGN',2,1,'2023-08-24 12:50:09','unknown'),(67,9,'INR',1,1,'2023-08-24 12:50:09','unknown'),(68,9,'INR',2,1,'2023-08-24 12:50:09','unknown'),(69,9,'INR',5,1,'2023-08-24 12:50:09','unknown'),(70,9,'INR',6,1,'2023-08-24 12:50:09','unknown'),(71,10,'USD',1,1,'2023-08-24 12:50:15','unknown'),(72,10,'USD',2,1,'2023-08-24 12:50:15','unknown'),(73,10,'BGN',1,1,'2023-08-24 12:50:19','unknown'),(74,10,'BGN',2,1,'2023-08-24 12:50:19','unknown'),(75,10,'INR',1,1,'2023-08-24 12:50:19','unknown'),(76,10,'INR',2,1,'2023-08-24 12:50:19','unknown'),(77,10,'INR',5,1,'2023-08-24 12:50:19','unknown'),(78,10,'INR',6,1,'2023-08-24 12:50:19','unknown'),(79,11,'USD',1,1,'2023-08-24 12:50:20','unknown'),(80,11,'USD',2,1,'2023-08-24 12:50:20','unknown'),(81,11,'BGN',1,1,'2023-08-24 12:50:24','unknown'),(82,11,'BGN',2,1,'2023-08-24 12:50:24','unknown'),(83,11,'INR',1,1,'2023-08-24 12:50:24','unknown'),(84,11,'INR',2,1,'2023-08-24 12:50:24','unknown'),(85,11,'INR',5,1,'2023-08-24 12:50:24','unknown'),(86,11,'INR',6,1,'2023-08-24 12:50:24','unknown');
/*!40000 ALTER TABLE `participantCurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantEndpoint`
--

DROP TABLE IF EXISTS `participantEndpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantEndpoint` (
  `participantEndpointId` int unsigned NOT NULL AUTO_INCREMENT,
  `participantId` int unsigned NOT NULL,
  `endpointTypeId` int unsigned NOT NULL,
  `value` varchar(512) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(128) NOT NULL,
  PRIMARY KEY (`participantEndpointId`),
  KEY `participantendpoint_participantid_index` (`participantId`),
  KEY `participantendpoint_endpointtypeid_index` (`endpointTypeId`),
  CONSTRAINT `participantendpoint_endpointtypeid_foreign` FOREIGN KEY (`endpointTypeId`) REFERENCES `endpointType` (`endpointTypeId`),
  CONSTRAINT `participantendpoint_participantid_foreign` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantEndpoint`
--

LOCK TABLES `participantEndpoint` WRITE;
/*!40000 ALTER TABLE `participantEndpoint` DISABLE KEYS */;
INSERT INTO `participantEndpoint` VALUES (1,1,8,'some.email@gmail.com',1,'2023-08-24 12:48:42','unknown'),(2,1,7,'some.email@gmail.com',1,'2023-08-24 12:48:42','unknown'),(3,1,6,'some.email@gmail.com',1,'2023-08-24 12:48:42','unknown'),(4,2,9,'http://sim-perffsp1:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:48:53','unknown'),(5,2,11,'http://sim-perffsp1:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:48:53','unknown'),(6,2,17,'http://sim-perffsp1:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:48:54','unknown'),(7,2,19,'http://sim-perffsp1:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:48:54','unknown'),(8,2,23,'http://sim-perffsp1:3001/fspiop',1,'2023-08-24 12:48:54','unknown'),(9,2,3,'http://sim-perffsp1:3001/fspiop/transfers',1,'2023-08-24 12:48:54','unknown'),(10,2,4,'http://sim-perffsp1:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:48:54','unknown'),(11,2,5,'http://sim-perffsp1:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:48:54','unknown'),(12,2,10,'http://sim-perffsp1:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:48:55','unknown'),(13,2,12,'http://sim-perffsp1:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:48:55','unknown'),(14,2,14,'http://sim-perffsp1:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:48:55','unknown'),(15,2,18,'http://sim-perffsp1:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:48:55','unknown'),(16,2,20,'http://sim-perffsp1:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:48:55','unknown'),(17,2,22,'http://sim-perffsp1:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:48:55','unknown'),(18,2,28,'http://sim-perffsp1:3001/fspiop',1,'2023-08-24 12:48:56','unknown'),(19,2,7,'{$inputs.email}',1,'2023-08-24 12:48:56','unknown'),(20,2,8,'{$inputs.email}',1,'2023-08-24 12:48:56','unknown'),(21,2,6,'{$inputs.email}',1,'2023-08-24 12:48:56','unknown'),(22,2,24,'http://sim-perffsp1:3001/fspiop/bulkTransfers',1,'2023-08-24 12:48:56','unknown'),(23,2,25,'http://sim-perffsp1:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:48:56','unknown'),(24,2,26,'http://sim-perffsp1:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:48:56','unknown'),(25,2,15,'http://sim-perffsp1:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:48:57','unknown'),(26,2,16,'http://sim-perffsp1:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:48:57','unknown'),(27,2,21,'http://sim-perffsp1:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:48:57','unknown'),(28,3,9,'http://sim-perffsp2:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:03','unknown'),(29,3,11,'http://sim-perffsp2:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:03','unknown'),(30,3,17,'http://sim-perffsp2:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:04','unknown'),(31,3,19,'http://sim-perffsp2:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:04','unknown'),(32,3,23,'http://sim-perffsp2:3001/fspiop',1,'2023-08-24 12:49:04','unknown'),(33,3,3,'http://sim-perffsp2:3001/fspiop/transfers',1,'2023-08-24 12:49:04','unknown'),(34,3,4,'http://sim-perffsp2:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:49:04','unknown'),(35,3,5,'http://sim-perffsp2:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:49:04','unknown'),(36,3,10,'http://sim-perffsp2:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:05','unknown'),(37,3,12,'http://sim-perffsp2:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:05','unknown'),(38,3,14,'http://sim-perffsp2:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:05','unknown'),(39,3,18,'http://sim-perffsp2:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:05','unknown'),(40,3,20,'http://sim-perffsp2:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:05','unknown'),(41,3,22,'http://sim-perffsp2:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:05','unknown'),(42,3,28,'http://sim-perffsp2:3001/fspiop',1,'2023-08-24 12:49:06','unknown'),(43,3,7,'{$inputs.email}',1,'2023-08-24 12:49:06','unknown'),(44,3,8,'{$inputs.email}',1,'2023-08-24 12:49:06','unknown'),(45,3,6,'{$inputs.email}',1,'2023-08-24 12:49:06','unknown'),(46,3,24,'http://sim-perffsp2:3001/fspiop/bulkTransfers',1,'2023-08-24 12:49:06','unknown'),(47,3,25,'http://sim-perffsp2:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:49:06','unknown'),(48,3,26,'http://sim-perffsp2:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:49:06','unknown'),(49,3,15,'http://sim-perffsp2:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:49:07','unknown'),(50,3,16,'http://sim-perffsp2:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:49:07','unknown'),(51,3,21,'http://sim-perffsp2:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:07','unknown'),(52,4,9,'http://sim-perffsp3:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:13','unknown'),(53,4,11,'http://sim-perffsp3:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:14','unknown'),(54,4,17,'http://sim-perffsp3:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:14','unknown'),(55,4,19,'http://sim-perffsp3:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:14','unknown'),(56,4,23,'http://sim-perffsp3:3001/fspiop',1,'2023-08-24 12:49:14','unknown'),(57,4,3,'http://sim-perffsp3:3001/fspiop/transfers',1,'2023-08-24 12:49:14','unknown'),(58,4,4,'http://sim-perffsp3:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:49:14','unknown'),(59,4,5,'http://sim-perffsp3:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:49:15','unknown'),(60,4,10,'http://sim-perffsp3:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:15','unknown'),(61,4,12,'http://sim-perffsp3:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:15','unknown'),(62,4,14,'http://sim-perffsp3:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:15','unknown'),(63,4,18,'http://sim-perffsp3:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:15','unknown'),(64,4,20,'http://sim-perffsp3:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:15','unknown'),(65,4,22,'http://sim-perffsp3:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:16','unknown'),(66,4,28,'http://sim-perffsp3:3001/fspiop',1,'2023-08-24 12:49:16','unknown'),(67,4,7,'{$inputs.email}',1,'2023-08-24 12:49:16','unknown'),(68,4,8,'{$inputs.email}',1,'2023-08-24 12:49:16','unknown'),(69,4,6,'{$inputs.email}',1,'2023-08-24 12:49:16','unknown'),(70,4,24,'http://sim-perffsp3:3001/fspiop/bulkTransfers',1,'2023-08-24 12:49:16','unknown'),(71,4,25,'http://sim-perffsp3:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:49:17','unknown'),(72,4,26,'http://sim-perffsp3:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:49:17','unknown'),(73,4,15,'http://sim-perffsp3:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:49:17','unknown'),(74,4,16,'http://sim-perffsp3:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:49:17','unknown'),(75,4,21,'http://sim-perffsp3:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:17','unknown'),(76,5,9,'http://sim-perffsp4:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:24','unknown'),(77,5,11,'http://sim-perffsp4:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:24','unknown'),(78,5,17,'http://sim-perffsp4:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:24','unknown'),(79,5,19,'http://sim-perffsp4:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:24','unknown'),(80,5,23,'http://sim-perffsp4:3001/fspiop',1,'2023-08-24 12:49:24','unknown'),(81,5,3,'http://sim-perffsp4:3001/fspiop/transfers',1,'2023-08-24 12:49:24','unknown'),(82,5,4,'http://sim-perffsp4:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:49:24','unknown'),(83,5,5,'http://sim-perffsp4:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:49:25','unknown'),(84,5,10,'http://sim-perffsp4:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:25','unknown'),(85,5,12,'http://sim-perffsp4:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:25','unknown'),(86,5,14,'http://sim-perffsp4:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:25','unknown'),(87,5,18,'http://sim-perffsp4:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:25','unknown'),(88,5,20,'http://sim-perffsp4:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:25','unknown'),(89,5,22,'http://sim-perffsp4:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:26','unknown'),(90,5,28,'http://sim-perffsp4:3001/fspiop',1,'2023-08-24 12:49:26','unknown'),(91,5,7,'{$inputs.email}',1,'2023-08-24 12:49:26','unknown'),(92,5,8,'{$inputs.email}',1,'2023-08-24 12:49:26','unknown'),(93,5,6,'{$inputs.email}',1,'2023-08-24 12:49:26','unknown'),(94,5,24,'http://sim-perffsp4:3001/fspiop/bulkTransfers',1,'2023-08-24 12:49:26','unknown'),(95,5,25,'http://sim-perffsp4:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:49:27','unknown'),(96,5,26,'http://sim-perffsp4:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:49:27','unknown'),(97,5,15,'http://sim-perffsp4:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:49:27','unknown'),(98,5,16,'http://sim-perffsp4:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:49:27','unknown'),(99,5,21,'http://sim-perffsp4:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:27','unknown'),(100,6,9,'http://sim-perffsp5:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:34','unknown'),(101,6,11,'http://sim-perffsp5:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:34','unknown'),(102,6,17,'http://sim-perffsp5:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:34','unknown'),(103,6,19,'http://sim-perffsp5:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:34','unknown'),(104,6,23,'http://sim-perffsp5:3001/fspiop',1,'2023-08-24 12:49:34','unknown'),(105,6,3,'http://sim-perffsp5:3001/fspiop/transfers',1,'2023-08-24 12:49:34','unknown'),(106,6,4,'http://sim-perffsp5:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:49:35','unknown'),(107,6,5,'http://sim-perffsp5:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:49:35','unknown'),(108,6,10,'http://sim-perffsp5:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:35','unknown'),(109,6,12,'http://sim-perffsp5:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:35','unknown'),(110,6,14,'http://sim-perffsp5:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:35','unknown'),(111,6,18,'http://sim-perffsp5:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:35','unknown'),(112,6,20,'http://sim-perffsp5:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:36','unknown'),(113,6,22,'http://sim-perffsp5:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:36','unknown'),(114,6,28,'http://sim-perffsp5:3001/fspiop',1,'2023-08-24 12:49:36','unknown'),(115,6,7,'{$inputs.email}',1,'2023-08-24 12:49:36','unknown'),(116,6,8,'{$inputs.email}',1,'2023-08-24 12:49:36','unknown'),(117,6,6,'{$inputs.email}',1,'2023-08-24 12:49:36','unknown'),(118,6,24,'http://sim-perffsp5:3001/fspiop/bulkTransfers',1,'2023-08-24 12:49:37','unknown'),(119,6,25,'http://sim-perffsp5:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:49:37','unknown'),(120,6,26,'http://sim-perffsp5:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:49:37','unknown'),(121,6,15,'http://sim-perffsp5:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:49:37','unknown'),(122,6,16,'http://sim-perffsp5:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:49:37','unknown'),(123,6,21,'http://sim-perffsp5:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:37','unknown'),(124,7,9,'http://sim-perffsp6:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:44','unknown'),(125,7,11,'http://sim-perffsp6:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:44','unknown'),(126,7,17,'http://sim-perffsp6:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:45','unknown'),(127,7,19,'http://sim-perffsp6:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:45','unknown'),(128,7,23,'http://sim-perffsp6:3001/fspiop',1,'2023-08-24 12:49:45','unknown'),(129,7,3,'http://sim-perffsp6:3001/fspiop/transfers',1,'2023-08-24 12:49:45','unknown'),(130,7,4,'http://sim-perffsp6:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:49:45','unknown'),(131,7,5,'http://sim-perffsp6:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:49:45','unknown'),(132,7,10,'http://sim-perffsp6:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:46','unknown'),(133,7,12,'http://sim-perffsp6:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:46','unknown'),(134,7,14,'http://sim-perffsp6:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:46','unknown'),(135,7,18,'http://sim-perffsp6:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:46','unknown'),(136,7,20,'http://sim-perffsp6:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:46','unknown'),(137,7,22,'http://sim-perffsp6:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:46','unknown'),(138,7,28,'http://sim-perffsp6:3001/fspiop',1,'2023-08-24 12:49:46','unknown'),(139,7,7,'{$inputs.email}',1,'2023-08-24 12:49:47','unknown'),(140,7,8,'{$inputs.email}',1,'2023-08-24 12:49:47','unknown'),(141,7,6,'{$inputs.email}',1,'2023-08-24 12:49:47','unknown'),(142,7,24,'http://sim-perffsp6:3001/fspiop/bulkTransfers',1,'2023-08-24 12:49:47','unknown'),(143,7,25,'http://sim-perffsp6:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:49:47','unknown'),(144,7,26,'http://sim-perffsp6:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:49:47','unknown'),(145,7,15,'http://sim-perffsp6:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:49:48','unknown'),(146,7,16,'http://sim-perffsp6:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:49:48','unknown'),(147,7,21,'http://sim-perffsp6:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:48','unknown'),(148,8,9,'http://sim-perffsp7:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:54','unknown'),(149,8,11,'http://sim-perffsp7:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:54','unknown'),(150,8,17,'http://sim-perffsp7:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:55','unknown'),(151,8,19,'http://sim-perffsp7:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:49:55','unknown'),(152,8,23,'http://sim-perffsp7:3001/fspiop',1,'2023-08-24 12:49:55','unknown'),(153,8,3,'http://sim-perffsp7:3001/fspiop/transfers',1,'2023-08-24 12:49:55','unknown'),(154,8,4,'http://sim-perffsp7:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:49:55','unknown'),(155,8,5,'http://sim-perffsp7:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:49:55','unknown'),(156,8,10,'http://sim-perffsp7:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:56','unknown'),(157,8,12,'http://sim-perffsp7:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:56','unknown'),(158,8,14,'http://sim-perffsp7:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:56','unknown'),(159,8,18,'http://sim-perffsp7:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:56','unknown'),(160,8,20,'http://sim-perffsp7:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:49:56','unknown'),(161,8,22,'http://sim-perffsp7:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:49:56','unknown'),(162,8,28,'http://sim-perffsp7:3001/fspiop',1,'2023-08-24 12:49:57','unknown'),(163,8,7,'{$inputs.email}',1,'2023-08-24 12:49:57','unknown'),(164,8,8,'{$inputs.email}',1,'2023-08-24 12:49:57','unknown'),(165,8,6,'{$inputs.email}',1,'2023-08-24 12:49:57','unknown'),(166,8,24,'http://sim-perffsp7:3001/fspiop/bulkTransfers',1,'2023-08-24 12:49:57','unknown'),(167,8,25,'http://sim-perffsp7:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:49:57','unknown'),(168,8,26,'http://sim-perffsp7:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:49:58','unknown'),(169,8,15,'http://sim-perffsp7:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:49:58','unknown'),(170,8,16,'http://sim-perffsp7:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:49:58','unknown'),(171,8,21,'http://sim-perffsp7:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:49:58','unknown'),(172,9,9,'http://sim-perffsp8:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:05','unknown'),(173,9,11,'http://sim-perffsp8:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:50:05','unknown'),(174,9,17,'http://sim-perffsp8:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:05','unknown'),(175,9,19,'http://sim-perffsp8:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:05','unknown'),(176,9,23,'http://sim-perffsp8:3001/fspiop',1,'2023-08-24 12:50:05','unknown'),(177,9,3,'http://sim-perffsp8:3001/fspiop/transfers',1,'2023-08-24 12:50:05','unknown'),(178,9,4,'http://sim-perffsp8:3001/fspiop/transfers/{{transferId}}',1,'2023-08-24 12:50:06','unknown'),(179,9,5,'http://sim-perffsp8:3001/fspiop/transfers/{{transferId}}/error',1,'2023-08-24 12:50:06','unknown'),(180,9,10,'http://sim-perffsp8:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:06','unknown'),(181,9,12,'http://sim-perffsp8:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:50:06','unknown'),(182,9,14,'http://sim-perffsp8:3001/fspiop/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:06','unknown'),(183,9,18,'http://sim-perffsp8:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:06','unknown'),(184,9,20,'http://sim-perffsp8:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:07','unknown'),(185,9,22,'http://sim-perffsp8:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:50:07','unknown'),(186,9,28,'http://sim-perffsp8:3001/fspiop',1,'2023-08-24 12:50:07','unknown'),(187,9,7,'{$inputs.email}',1,'2023-08-24 12:50:07','unknown'),(188,9,8,'{$inputs.email}',1,'2023-08-24 12:50:07','unknown'),(189,9,6,'{$inputs.email}',1,'2023-08-24 12:50:08','unknown'),(190,9,24,'http://sim-perffsp8:3001/fspiop/bulkTransfers',1,'2023-08-24 12:50:08','unknown'),(191,9,25,'http://sim-perffsp8:3001/fspiop/bulkTransfers/{{id}}',1,'2023-08-24 12:50:08','unknown'),(192,9,26,'http://sim-perffsp8:3001/fspiop/bulkTransfers/{{id}}/error',1,'2023-08-24 12:50:08','unknown'),(193,9,15,'http://sim-perffsp8:3001/fspiop/participants/{{requestId}}',1,'2023-08-24 12:50:08','unknown'),(194,9,16,'http://sim-perffsp8:3001/fspiop/participants/{{requestId}}/error',1,'2023-08-24 12:50:08','unknown'),(195,9,21,'http://sim-perffsp8:3001/fspiop/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:50:09','unknown'),(196,10,9,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:15','unknown'),(197,10,11,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:50:15','unknown'),(198,10,17,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:15','unknown'),(199,10,19,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:15','unknown'),(200,10,23,'http://mojaloop-testing-toolkit:4040',1,'2023-08-24 12:50:16','unknown'),(201,10,3,'http://mojaloop-testing-toolkit:4040/transfers',1,'2023-08-24 12:50:16','unknown'),(202,10,4,'http://mojaloop-testing-toolkit:4040/transfers/{{transferId}}',1,'2023-08-24 12:50:16','unknown'),(203,10,5,'http://mojaloop-testing-toolkit:4040/transfers/{{transferId}}/error',1,'2023-08-24 12:50:16','unknown'),(204,10,10,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:16','unknown'),(205,10,12,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:50:16','unknown'),(206,10,14,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:17','unknown'),(207,10,18,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:17','unknown'),(208,10,20,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:17','unknown'),(209,10,22,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:50:17','unknown'),(210,10,28,'http://mojaloop-testing-toolkit:4040',1,'2023-08-24 12:50:17','unknown'),(211,10,7,'{$inputs.email}',1,'2023-08-24 12:50:17','unknown'),(212,10,8,'{$inputs.email}',1,'2023-08-24 12:50:17','unknown'),(213,10,6,'{$inputs.email}',1,'2023-08-24 12:50:18','unknown'),(214,10,24,'http://mojaloop-testing-toolkit:4040/bulkTransfers',1,'2023-08-24 12:50:18','unknown'),(215,10,25,'http://mojaloop-testing-toolkit:4040/bulkTransfers/{{id}}',1,'2023-08-24 12:50:18','unknown'),(216,10,26,'http://mojaloop-testing-toolkit:4040/bulkTransfers/{{id}}/error',1,'2023-08-24 12:50:18','unknown'),(217,10,15,'http://mojaloop-testing-toolkit:4040/participants/{{requestId}}',1,'2023-08-24 12:50:18','unknown'),(218,10,16,'http://mojaloop-testing-toolkit:4040/participants/{{requestId}}/error',1,'2023-08-24 12:50:18','unknown'),(219,10,21,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:50:19','unknown'),(220,11,9,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:20','unknown'),(221,11,11,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:50:20','unknown'),(222,11,17,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:20','unknown'),(223,11,19,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}',1,'2023-08-24 12:50:21','unknown'),(224,11,23,'http://mojaloop-testing-toolkit:4040',1,'2023-08-24 12:50:21','unknown'),(225,11,3,'http://mojaloop-testing-toolkit:4040/transfers',1,'2023-08-24 12:50:21','unknown'),(226,11,4,'http://mojaloop-testing-toolkit:4040/transfers/{{transferId}}',1,'2023-08-24 12:50:21','unknown'),(227,11,5,'http://mojaloop-testing-toolkit:4040/transfers/{{transferId}}/error',1,'2023-08-24 12:50:21','unknown'),(228,11,10,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:21','unknown'),(229,11,12,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:50:22','unknown'),(230,11,14,'http://mojaloop-testing-toolkit:4040/participants/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:22','unknown'),(231,11,18,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:22','unknown'),(232,11,20,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}',1,'2023-08-24 12:50:22','unknown'),(233,11,22,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/{{partySubIdOrType}}/error',1,'2023-08-24 12:50:22','unknown'),(234,11,28,'http://mojaloop-testing-toolkit:4040',1,'2023-08-24 12:50:22','unknown'),(235,11,7,'{$inputs.email}',1,'2023-08-24 12:50:23','unknown'),(236,11,8,'{$inputs.email}',1,'2023-08-24 12:50:23','unknown'),(237,11,6,'{$inputs.email}',1,'2023-08-24 12:50:23','unknown'),(238,11,24,'http://mojaloop-testing-toolkit:4040/bulkTransfers',1,'2023-08-24 12:50:23','unknown'),(239,11,25,'http://mojaloop-testing-toolkit:4040/bulkTransfers/{{id}}',1,'2023-08-24 12:50:23','unknown'),(240,11,26,'http://mojaloop-testing-toolkit:4040/bulkTransfers/{{id}}/error',1,'2023-08-24 12:50:23','unknown'),(241,11,15,'http://mojaloop-testing-toolkit:4040/participants/{{requestId}}',1,'2023-08-24 12:50:24','unknown'),(242,11,16,'http://mojaloop-testing-toolkit:4040/participants/{{requestId}}/error',1,'2023-08-24 12:50:24','unknown'),(243,11,21,'http://mojaloop-testing-toolkit:4040/parties/{{partyIdType}}/{{partyIdentifier}}/error',1,'2023-08-24 12:50:24','unknown');
/*!40000 ALTER TABLE `participantEndpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantLimit`
--

DROP TABLE IF EXISTS `participantLimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantLimit` (
  `participantLimitId` int unsigned NOT NULL AUTO_INCREMENT,
  `participantCurrencyId` int unsigned NOT NULL,
  `participantLimitTypeId` int unsigned NOT NULL,
  `value` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `thresholdAlarmPercentage` decimal(5,2) NOT NULL DEFAULT '10.00',
  `startAfterParticipantPositionChangeId` bigint unsigned DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(128) NOT NULL,
  PRIMARY KEY (`participantLimitId`),
  UNIQUE KEY `participantLimit_unique_idx` (`participantCurrencyId`,`participantLimitTypeId`,`isActive`,`participantLimitId`),
  KEY `participantlimit_participantcurrencyid_index` (`participantCurrencyId`),
  KEY `participantlimit_participantlimittypeid_index` (`participantLimitTypeId`),
  KEY `participantlimit_startafterparticipantpositionchangeid_index` (`startAfterParticipantPositionChangeId`),
  CONSTRAINT `participantlimit_participantcurrencyid_foreign` FOREIGN KEY (`participantCurrencyId`) REFERENCES `participantCurrency` (`participantCurrencyId`),
  CONSTRAINT `participantlimit_participantlimittypeid_foreign` FOREIGN KEY (`participantLimitTypeId`) REFERENCES `participantLimitType` (`participantLimitTypeId`),
  CONSTRAINT `participantlimit_startafterparticipantpositionchangeid_foreign` FOREIGN KEY (`startAfterParticipantPositionChangeId`) REFERENCES `participantPositionChange` (`participantPositionChangeId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantLimit`
--

LOCK TABLES `participantLimit` WRITE;
/*!40000 ALTER TABLE `participantLimit` DISABLE KEYS */;
INSERT INTO `participantLimit` VALUES (1,7,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:48:53','unknown'),(2,9,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:48:57','unknown'),(3,11,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:48:58','unknown'),(4,15,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:03','unknown'),(5,17,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:07','unknown'),(6,19,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:08','unknown'),(7,23,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:13','unknown'),(8,25,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:17','unknown'),(9,27,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:18','unknown'),(10,31,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:23','unknown'),(11,33,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:28','unknown'),(12,35,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:28','unknown'),(13,39,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:33','unknown'),(14,41,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:38','unknown'),(15,43,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:38','unknown'),(16,47,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:44','unknown'),(17,49,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:48','unknown'),(18,51,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:49','unknown'),(19,55,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:54','unknown'),(20,57,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:58','unknown'),(21,59,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:49:59','unknown'),(22,63,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:04','unknown'),(23,65,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:09','unknown'),(24,67,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:09','unknown'),(25,71,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:15','unknown'),(26,73,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:19','unknown'),(27,75,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:19','unknown'),(28,79,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:20','unknown'),(29,81,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:24','unknown'),(30,83,1,1000000.0000,10.00,NULL,1,'2023-08-24 12:50:25','unknown');
/*!40000 ALTER TABLE `participantLimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantLimitType`
--

DROP TABLE IF EXISTS `participantLimitType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantLimitType` (
  `participantLimitTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`participantLimitTypeId`),
  UNIQUE KEY `participantlimittype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantLimitType`
--

LOCK TABLES `participantLimitType` WRITE;
/*!40000 ALTER TABLE `participantLimitType` DISABLE KEYS */;
INSERT INTO `participantLimitType` VALUES (1,'NET_DEBIT_CAP',NULL,1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `participantLimitType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantParty`
--

DROP TABLE IF EXISTS `participantParty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantParty` (
  `participantPartyId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `participantId` int unsigned NOT NULL,
  `partyId` bigint unsigned NOT NULL,
  PRIMARY KEY (`participantPartyId`),
  UNIQUE KEY `participantparty_participantid_partyid_unique` (`participantId`,`partyId`),
  KEY `participantparty_participantid_index` (`participantId`),
  CONSTRAINT `participantparty_participantid_foreign` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantParty`
--

LOCK TABLES `participantParty` WRITE;
/*!40000 ALTER TABLE `participantParty` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantParty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantPosition`
--

DROP TABLE IF EXISTS `participantPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantPosition` (
  `participantPositionId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `participantCurrencyId` int unsigned NOT NULL,
  `value` decimal(18,4) NOT NULL,
  `reservedValue` decimal(18,4) NOT NULL,
  `changedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`participantPositionId`),
  KEY `participantposition_participantcurrencyid_index` (`participantCurrencyId`),
  CONSTRAINT `participantposition_participantcurrencyid_foreign` FOREIGN KEY (`participantCurrencyId`) REFERENCES `participantCurrency` (`participantCurrencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantPosition`
--

LOCK TABLES `participantPosition` WRITE;
/*!40000 ALTER TABLE `participantPosition` DISABLE KEYS */;
INSERT INTO `participantPosition` VALUES (1,1,0.0000,0.0000,'2023-08-24 12:48:41'),(2,2,45000000.0000,0.0000,'2023-08-24 12:50:25'),(3,3,0.0000,0.0000,'2023-08-24 12:48:42'),(4,4,45000000.0000,0.0000,'2023-08-24 12:50:26'),(5,5,0.0000,0.0000,'2023-08-24 12:48:42'),(6,6,0.0000,0.0000,'2023-08-24 12:48:42'),(7,7,0.0000,0.0000,'2023-08-24 12:48:53'),(8,8,-5000000.0000,0.0000,'2023-08-24 12:48:59'),(9,9,0.0000,0.0000,'2023-08-24 12:48:57'),(10,10,-5000000.0000,0.0000,'2023-08-24 12:49:00'),(11,11,0.0000,0.0000,'2023-08-24 12:48:58'),(12,12,0.0000,0.0000,'2023-08-24 12:48:58'),(13,13,0.0000,0.0000,'2023-08-24 12:48:58'),(14,14,0.0000,0.0000,'2023-08-24 12:48:58'),(15,15,0.0000,0.0000,'2023-08-24 12:49:03'),(16,16,-5000000.0000,0.0000,'2023-08-24 12:49:09'),(17,17,0.0000,0.0000,'2023-08-24 12:49:07'),(18,18,-5000000.0000,0.0000,'2023-08-24 12:49:10'),(19,19,0.0000,0.0000,'2023-08-24 12:49:08'),(20,20,0.0000,0.0000,'2023-08-24 12:49:08'),(21,21,0.0000,0.0000,'2023-08-24 12:49:08'),(22,22,0.0000,0.0000,'2023-08-24 12:49:08'),(23,23,0.0000,0.0000,'2023-08-24 12:49:13'),(24,24,-5000000.0000,0.0000,'2023-08-24 12:49:19'),(25,25,0.0000,0.0000,'2023-08-24 12:49:17'),(26,26,-5000000.0000,0.0000,'2023-08-24 12:49:20'),(27,27,0.0000,0.0000,'2023-08-24 12:49:18'),(28,28,0.0000,0.0000,'2023-08-24 12:49:18'),(29,29,0.0000,0.0000,'2023-08-24 12:49:18'),(30,30,0.0000,0.0000,'2023-08-24 12:49:18'),(31,31,0.0000,0.0000,'2023-08-24 12:49:23'),(32,32,-5000000.0000,0.0000,'2023-08-24 12:49:29'),(33,33,0.0000,0.0000,'2023-08-24 12:49:28'),(34,34,-5000000.0000,0.0000,'2023-08-24 12:49:30'),(35,35,0.0000,0.0000,'2023-08-24 12:49:28'),(36,36,0.0000,0.0000,'2023-08-24 12:49:28'),(37,37,0.0000,0.0000,'2023-08-24 12:49:28'),(38,38,0.0000,0.0000,'2023-08-24 12:49:28'),(39,39,0.0000,0.0000,'2023-08-24 12:49:33'),(40,40,-5000000.0000,0.0000,'2023-08-24 12:49:39'),(41,41,0.0000,0.0000,'2023-08-24 12:49:38'),(42,42,-5000000.0000,0.0000,'2023-08-24 12:49:40'),(43,43,0.0000,0.0000,'2023-08-24 12:49:38'),(44,44,0.0000,0.0000,'2023-08-24 12:49:38'),(45,45,0.0000,0.0000,'2023-08-24 12:49:38'),(46,46,0.0000,0.0000,'2023-08-24 12:49:38'),(47,47,0.0000,0.0000,'2023-08-24 12:49:44'),(48,48,-5000000.0000,0.0000,'2023-08-24 12:49:49'),(49,49,0.0000,0.0000,'2023-08-24 12:49:48'),(50,50,-5000000.0000,0.0000,'2023-08-24 12:49:51'),(51,51,0.0000,0.0000,'2023-08-24 12:49:49'),(52,52,0.0000,0.0000,'2023-08-24 12:49:49'),(53,53,0.0000,0.0000,'2023-08-24 12:49:49'),(54,54,0.0000,0.0000,'2023-08-24 12:49:49'),(55,55,0.0000,0.0000,'2023-08-24 12:49:54'),(56,56,-5000000.0000,0.0000,'2023-08-24 12:50:00'),(57,57,0.0000,0.0000,'2023-08-24 12:49:58'),(58,58,-5000000.0000,0.0000,'2023-08-24 12:50:01'),(59,59,0.0000,0.0000,'2023-08-24 12:49:59'),(60,60,0.0000,0.0000,'2023-08-24 12:49:59'),(61,61,0.0000,0.0000,'2023-08-24 12:49:59'),(62,62,0.0000,0.0000,'2023-08-24 12:49:59'),(63,63,0.0000,0.0000,'2023-08-24 12:50:04'),(64,64,-5000000.0000,0.0000,'2023-08-24 12:50:10'),(65,65,0.0000,0.0000,'2023-08-24 12:50:09'),(66,66,-5000000.0000,0.0000,'2023-08-24 12:50:11'),(67,67,0.0000,0.0000,'2023-08-24 12:50:09'),(68,68,0.0000,0.0000,'2023-08-24 12:50:09'),(69,69,0.0000,0.0000,'2023-08-24 12:50:09'),(70,70,0.0000,0.0000,'2023-08-24 12:50:09'),(71,71,0.0000,0.0000,'2023-08-24 12:50:15'),(72,72,0.0000,0.0000,'2023-08-24 12:50:15'),(73,73,0.0000,0.0000,'2023-08-24 12:50:19'),(74,74,0.0000,0.0000,'2023-08-24 12:50:19'),(75,75,0.0000,0.0000,'2023-08-24 12:50:19'),(76,76,0.0000,0.0000,'2023-08-24 12:50:19'),(77,77,0.0000,0.0000,'2023-08-24 12:50:19'),(78,78,0.0000,0.0000,'2023-08-24 12:50:19'),(79,79,0.0000,0.0000,'2023-08-24 12:50:20'),(80,80,-5000000.0000,0.0000,'2023-08-24 12:50:25'),(81,81,0.0000,0.0000,'2023-08-24 12:50:24'),(82,82,-5000000.0000,0.0000,'2023-08-24 12:50:26'),(83,83,0.0000,0.0000,'2023-08-24 12:50:25'),(84,84,0.0000,0.0000,'2023-08-24 12:50:25'),(85,85,0.0000,0.0000,'2023-08-24 12:50:25'),(86,86,0.0000,0.0000,'2023-08-24 12:50:25');
/*!40000 ALTER TABLE `participantPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantPositionChange`
--

DROP TABLE IF EXISTS `participantPositionChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantPositionChange` (
  `participantPositionChangeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `participantPositionId` bigint unsigned NOT NULL,
  `transferStateChangeId` bigint unsigned NOT NULL,
  `value` decimal(18,4) NOT NULL,
  `reservedValue` decimal(18,4) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`participantPositionChangeId`),
  KEY `participantpositionchange_participantpositionid_index` (`participantPositionId`),
  KEY `participantpositionchange_transferstatechangeid_index` (`transferStateChangeId`),
  CONSTRAINT `participantpositionchange_participantpositionid_foreign` FOREIGN KEY (`participantPositionId`) REFERENCES `participantPosition` (`participantPositionId`),
  CONSTRAINT `participantpositionchange_transferstatechangeid_foreign` FOREIGN KEY (`transferStateChangeId`) REFERENCES `transferStateChange` (`transferStateChangeId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantPositionChange`
--

LOCK TABLES `participantPositionChange` WRITE;
/*!40000 ALTER TABLE `participantPositionChange` DISABLE KEYS */;
INSERT INTO `participantPositionChange` VALUES (1,2,2,5000000.0000,0.0000,'2023-08-24 12:48:58'),(2,8,4,-5000000.0000,0.0000,'2023-08-24 12:48:58'),(3,4,6,5000000.0000,0.0000,'2023-08-24 12:49:00'),(4,10,8,-5000000.0000,0.0000,'2023-08-24 12:49:00'),(5,2,10,10000000.0000,0.0000,'2023-08-24 12:49:09'),(6,16,12,-5000000.0000,0.0000,'2023-08-24 12:49:09'),(7,4,14,10000000.0000,0.0000,'2023-08-24 12:49:10'),(8,18,16,-5000000.0000,0.0000,'2023-08-24 12:49:10'),(9,2,18,15000000.0000,0.0000,'2023-08-24 12:49:19'),(10,24,20,-5000000.0000,0.0000,'2023-08-24 12:49:19'),(11,4,22,15000000.0000,0.0000,'2023-08-24 12:49:20'),(12,26,24,-5000000.0000,0.0000,'2023-08-24 12:49:20'),(13,2,26,20000000.0000,0.0000,'2023-08-24 12:49:29'),(14,32,28,-5000000.0000,0.0000,'2023-08-24 12:49:29'),(15,4,30,20000000.0000,0.0000,'2023-08-24 12:49:30'),(16,34,32,-5000000.0000,0.0000,'2023-08-24 12:49:30'),(17,2,34,25000000.0000,0.0000,'2023-08-24 12:49:39'),(18,40,36,-5000000.0000,0.0000,'2023-08-24 12:49:39'),(19,4,38,25000000.0000,0.0000,'2023-08-24 12:49:40'),(20,42,40,-5000000.0000,0.0000,'2023-08-24 12:49:40'),(21,2,42,30000000.0000,0.0000,'2023-08-24 12:49:49'),(22,48,44,-5000000.0000,0.0000,'2023-08-24 12:49:49'),(23,4,46,30000000.0000,0.0000,'2023-08-24 12:49:51'),(24,50,48,-5000000.0000,0.0000,'2023-08-24 12:49:51'),(25,2,50,35000000.0000,0.0000,'2023-08-24 12:50:00'),(26,56,52,-5000000.0000,0.0000,'2023-08-24 12:50:00'),(27,4,54,35000000.0000,0.0000,'2023-08-24 12:50:01'),(28,58,56,-5000000.0000,0.0000,'2023-08-24 12:50:01'),(29,2,58,40000000.0000,0.0000,'2023-08-24 12:50:10'),(30,64,60,-5000000.0000,0.0000,'2023-08-24 12:50:10'),(31,4,62,40000000.0000,0.0000,'2023-08-24 12:50:11'),(32,66,64,-5000000.0000,0.0000,'2023-08-24 12:50:11'),(33,2,66,45000000.0000,0.0000,'2023-08-24 12:50:25'),(34,80,68,-5000000.0000,0.0000,'2023-08-24 12:50:25'),(35,4,70,45000000.0000,0.0000,'2023-08-24 12:50:26'),(36,82,72,-5000000.0000,0.0000,'2023-08-24 12:50:26');
/*!40000 ALTER TABLE `participantPositionChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `party` (
  `partyId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotePartyId` bigint unsigned NOT NULL,
  `firstName` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middleName` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  PRIMARY KEY (`partyId`),
  KEY `party_quotepartyid_foreign` (`quotePartyId`),
  CONSTRAINT `party_quotepartyid_foreign` FOREIGN KEY (`quotePartyId`) REFERENCES `quoteParty` (`quotePartyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Optional pers. data provided during Quote Request & Response';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partyIdentifierType`
--

DROP TABLE IF EXISTS `partyIdentifierType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partyIdentifierType` (
  `partyIdentifierTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`partyIdentifierTypeId`),
  UNIQUE KEY `partyidentifiertype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partyIdentifierType`
--

LOCK TABLES `partyIdentifierType` WRITE;
/*!40000 ALTER TABLE `partyIdentifierType` DISABLE KEYS */;
INSERT INTO `partyIdentifierType` VALUES (1,'MSISDN','An MSISDN (Mobile Station International Subscriber Directory Number; that is, a phone number) is used in reference to a Party'),(2,'EMAIL','An email is used in reference to a Party. The format of the email should be according to the informational RFC 3696'),(3,'PERSONAL_ID','A personal identifier is used in reference to a participant. Examples of personal identification are passport number, birth certificate number, and national registration number. The identifier number is added in the PartyIdentifier element. The personal identifier type is added in the PartySubIdOrType element'),(4,'BUSINESS','A specific Business (for example, an organization or a company) is used in reference to a participant. The BUSINESS identifier can be in any format. To make a transaction connected to a specific username or bill number in a Business, the PartySubIdOrType element should be used'),(5,'DEVICE','A specific device (for example, POS or ATM) ID connected to a specific business or organization is used in reference to a Party. For referencing a specific device under a specific business or organization, use the PartySubIdOrType element'),(6,'ACCOUNT_ID','A bank account number or FSP account ID should be used in reference to a participant. The ACCOUNT_ID identifier can be in any format, as formats can greatly differ depending on country and FSP'),(7,'IBAN','A bank account number or FSP account ID is used in reference to a participant. The IBAN identifier can consist of up to 34 alphanumeric characters and should be entered without whitespace'),(8,'ALIAS','An alias is used in reference to a participant. The alias should be created in the FSP as an alternative reference to an account owner. Another example of an alias is a username in the FSP system. The ALIAS identifier can be in any format. It is also possible to use the PartySubIdOrType element for identifying an account under an Alias defined by the PartyIdentifier');
/*!40000 ALTER TABLE `partyIdentifierType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partyType`
--

DROP TABLE IF EXISTS `partyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partyType` (
  `partyTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`partyTypeId`),
  UNIQUE KEY `partytype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partyType`
--

LOCK TABLES `partyType` WRITE;
/*!40000 ALTER TABLE `partyType` DISABLE KEYS */;
INSERT INTO `partyType` VALUES (1,'PAYER','Represents the entity sending money'),(2,'PAYEE','Represents the entity receiving money');
/*!40000 ALTER TABLE `partyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quote` (
  `quoteId` varchar(36) NOT NULL,
  `transactionReferenceId` varchar(36) NOT NULL COMMENT 'Common ID (decided by the Payer FSP) between the FSPs for the future transaction object',
  `transactionRequestId` varchar(36) DEFAULT NULL COMMENT 'Optional previously-sent transaction request',
  `note` text COMMENT 'A memo that will be attached to the transaction',
  `expirationDate` datetime DEFAULT NULL COMMENT 'Optional expiration for the requested transaction',
  `transactionInitiatorId` int unsigned NOT NULL COMMENT 'This is part of the transaction initiator',
  `transactionInitiatorTypeId` int unsigned NOT NULL COMMENT 'This is part of the transaction initiator type',
  `transactionScenarioId` int unsigned NOT NULL COMMENT 'This is part of the transaction scenario',
  `balanceOfPaymentsId` int unsigned DEFAULT NULL COMMENT 'This is part of the transaction type that contains the elements- balance of payment',
  `transactionSubScenarioId` int unsigned DEFAULT NULL COMMENT 'This is part of the transaction type sub scenario as defined by the local scheme',
  `amountTypeId` int unsigned NOT NULL COMMENT 'This is part of the transaction type that contains valid elements for - Amount Type',
  `amount` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT 'The amount that the quote is being requested for. Need to be interpert in accordance with the amount type',
  `currencyId` varchar(255) DEFAULT NULL COMMENT 'Trading currency pertaining to the Amount',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`quoteId`),
  KEY `quote_transactionreferenceid_foreign` (`transactionReferenceId`),
  KEY `quote_transactionrequestid_foreign` (`transactionRequestId`),
  KEY `quote_transactioninitiatorid_foreign` (`transactionInitiatorId`),
  KEY `quote_transactioninitiatortypeid_foreign` (`transactionInitiatorTypeId`),
  KEY `quote_transactionscenarioid_foreign` (`transactionScenarioId`),
  KEY `quote_balanceofpaymentsid_foreign` (`balanceOfPaymentsId`),
  KEY `quote_transactionsubscenarioid_foreign` (`transactionSubScenarioId`),
  KEY `quote_amounttypeid_foreign` (`amountTypeId`),
  KEY `quote_currencyid_foreign` (`currencyId`),
  CONSTRAINT `quote_amounttypeid_foreign` FOREIGN KEY (`amountTypeId`) REFERENCES `amountType` (`amountTypeId`),
  CONSTRAINT `quote_balanceofpaymentsid_foreign` FOREIGN KEY (`balanceOfPaymentsId`) REFERENCES `balanceOfPayments` (`balanceOfPaymentsId`),
  CONSTRAINT `quote_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `quote_transactioninitiatorid_foreign` FOREIGN KEY (`transactionInitiatorId`) REFERENCES `transactionInitiator` (`transactionInitiatorId`),
  CONSTRAINT `quote_transactioninitiatortypeid_foreign` FOREIGN KEY (`transactionInitiatorTypeId`) REFERENCES `transactionInitiatorType` (`transactionInitiatorTypeId`),
  CONSTRAINT `quote_transactionreferenceid_foreign` FOREIGN KEY (`transactionReferenceId`) REFERENCES `transactionReference` (`transactionReferenceId`),
  CONSTRAINT `quote_transactionscenarioid_foreign` FOREIGN KEY (`transactionScenarioId`) REFERENCES `transactionScenario` (`transactionScenarioId`),
  CONSTRAINT `quote_transactionsubscenarioid_foreign` FOREIGN KEY (`transactionSubScenarioId`) REFERENCES `transactionSubScenario` (`transactionSubScenarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote`
--

LOCK TABLES `quote` WRITE;
/*!40000 ALTER TABLE `quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quoteDuplicateCheck`
--

DROP TABLE IF EXISTS `quoteDuplicateCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoteDuplicateCheck` (
  `quoteId` varchar(36) NOT NULL COMMENT 'Common ID between the FSPs for the quote object, decided by the Payer FSP',
  `hash` varchar(1024) DEFAULT NULL COMMENT 'hash value received for the quote request',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`quoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quoteDuplicateCheck`
--

LOCK TABLES `quoteDuplicateCheck` WRITE;
/*!40000 ALTER TABLE `quoteDuplicateCheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `quoteDuplicateCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quoteError`
--

DROP TABLE IF EXISTS `quoteError`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoteError` (
  `quoteErrorId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quoteId` varchar(36) NOT NULL COMMENT 'Common ID between the FSPs for the quote object, decided by the Payer FSP',
  `quoteResponseId` bigint unsigned DEFAULT NULL COMMENT 'The response to the intial quote',
  `errorCode` int unsigned NOT NULL,
  `errorDescription` varchar(128) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`quoteErrorId`),
  KEY `quoteerror_quoteid_foreign` (`quoteId`),
  KEY `quoteerror_quoteresponseid_foreign` (`quoteResponseId`),
  CONSTRAINT `quoteerror_quoteid_foreign` FOREIGN KEY (`quoteId`) REFERENCES `quote` (`quoteId`),
  CONSTRAINT `quoteerror_quoteresponseid_foreign` FOREIGN KEY (`quoteResponseId`) REFERENCES `quoteResponse` (`quoteResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quoteError`
--

LOCK TABLES `quoteError` WRITE;
/*!40000 ALTER TABLE `quoteError` DISABLE KEYS */;
/*!40000 ALTER TABLE `quoteError` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quoteExtension`
--

DROP TABLE IF EXISTS `quoteExtension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoteExtension` (
  `quoteExtensionId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quoteId` varchar(36) NOT NULL COMMENT 'Common ID between the FSPs for the quote object, decided by the Payer FSP',
  `quoteResponseId` bigint unsigned DEFAULT NULL,
  `transactionId` varchar(36) DEFAULT NULL COMMENT 'The transaction reference that is part of the initial quote',
  `key` varchar(128) NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`quoteExtensionId`),
  KEY `quoteextension_quoteid_foreign` (`quoteId`),
  KEY `quoteextension_quoteresponseid_foreign` (`quoteResponseId`),
  KEY `quoteextension_transactionid_foreign` (`transactionId`),
  CONSTRAINT `quoteextension_quoteid_foreign` FOREIGN KEY (`quoteId`) REFERENCES `quote` (`quoteId`),
  CONSTRAINT `quoteextension_quoteresponseid_foreign` FOREIGN KEY (`quoteResponseId`) REFERENCES `quoteResponse` (`quoteResponseId`),
  CONSTRAINT `quoteextension_transactionid_foreign` FOREIGN KEY (`transactionId`) REFERENCES `transactionReference` (`transactionReferenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quoteExtension`
--

LOCK TABLES `quoteExtension` WRITE;
/*!40000 ALTER TABLE `quoteExtension` DISABLE KEYS */;
/*!40000 ALTER TABLE `quoteExtension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quoteParty`
--

DROP TABLE IF EXISTS `quoteParty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoteParty` (
  `quotePartyId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quoteId` varchar(36) NOT NULL COMMENT 'Common ID between the FSPs for the quote object, decided by the Payer FSP',
  `partyTypeId` int unsigned NOT NULL COMMENT 'Specifies the type of party this row relates to; typically PAYER or PAYEE',
  `partyIdentifierTypeId` int unsigned NOT NULL COMMENT 'Specifies the type of identifier used to identify this party e.g. MSISDN, IBAN etc...',
  `partyIdentifierValue` varchar(128) NOT NULL COMMENT 'The value of the identifier used to identify this party',
  `partySubIdOrTypeId` varchar(128) DEFAULT NULL COMMENT 'A sub-identifier or sub-type for the Party',
  `fspId` varchar(255) DEFAULT NULL COMMENT 'This is the FSP ID as provided in the quote. For the switch between multi-parties it is required',
  `participantId` int unsigned DEFAULT NULL COMMENT 'Reference to the resolved FSP ID (if supplied/known). If not an error will be reported',
  `merchantClassificationCode` varchar(4) DEFAULT NULL COMMENT 'Used in the context of Payee Information, where the Payee happens to be a merchant accepting merchant payments',
  `partyName` varchar(128) DEFAULT NULL COMMENT 'Display name of the Party, could be a real name or a nick name',
  `transferParticipantRoleTypeId` int unsigned NOT NULL COMMENT 'The role this Party is playing in the transaction',
  `ledgerEntryTypeId` int unsigned NOT NULL COMMENT 'The type of financial entry this Party is presenting',
  `amount` decimal(18,4) NOT NULL,
  `currencyId` varchar(3) NOT NULL COMMENT 'Trading currency pertaining to the party amount',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`quotePartyId`),
  KEY `quoteparty_quoteid_foreign` (`quoteId`),
  KEY `quoteparty_partytypeid_foreign` (`partyTypeId`),
  KEY `quoteparty_partyidentifiertypeid_foreign` (`partyIdentifierTypeId`),
  KEY `quoteparty_partysubidortypeid_foreign` (`partySubIdOrTypeId`),
  KEY `quoteparty_participantid_foreign` (`participantId`),
  KEY `quoteparty_transferparticipantroletypeid_foreign` (`transferParticipantRoleTypeId`),
  KEY `quoteparty_ledgerentrytypeid_foreign` (`ledgerEntryTypeId`),
  KEY `quoteparty_currencyid_foreign` (`currencyId`),
  CONSTRAINT `quoteparty_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `quoteparty_ledgerentrytypeid_foreign` FOREIGN KEY (`ledgerEntryTypeId`) REFERENCES `ledgerEntryType` (`ledgerEntryTypeId`),
  CONSTRAINT `quoteparty_participantid_foreign` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`),
  CONSTRAINT `quoteparty_partyidentifiertypeid_foreign` FOREIGN KEY (`partyIdentifierTypeId`) REFERENCES `partyIdentifierType` (`partyIdentifierTypeId`),
  CONSTRAINT `quoteparty_partytypeid_foreign` FOREIGN KEY (`partyTypeId`) REFERENCES `partyType` (`partyTypeId`),
  CONSTRAINT `quoteparty_quoteid_foreign` FOREIGN KEY (`quoteId`) REFERENCES `quote` (`quoteId`),
  CONSTRAINT `quoteparty_transferparticipantroletypeid_foreign` FOREIGN KEY (`transferParticipantRoleTypeId`) REFERENCES `transferParticipantRoleType` (`transferParticipantRoleTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quoteParty`
--

LOCK TABLES `quoteParty` WRITE;
/*!40000 ALTER TABLE `quoteParty` DISABLE KEYS */;
/*!40000 ALTER TABLE `quoteParty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotePartyIdInfoExtension`
--

DROP TABLE IF EXISTS `quotePartyIdInfoExtension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotePartyIdInfoExtension` (
  `quotePartyIdInfoExtensionId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotePartyId` bigint unsigned NOT NULL COMMENT 'quotePartyId: a common id between the tables quotePartyIdInfoExtension and quoteParty',
  `key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`quotePartyIdInfoExtensionId`),
  KEY `quotepartyidinfoextension_quotepartyid_foreign` (`quotePartyId`),
  CONSTRAINT `quotepartyidinfoextension_quotepartyid_foreign` FOREIGN KEY (`quotePartyId`) REFERENCES `quoteParty` (`quotePartyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotePartyIdInfoExtension`
--

LOCK TABLES `quotePartyIdInfoExtension` WRITE;
/*!40000 ALTER TABLE `quotePartyIdInfoExtension` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotePartyIdInfoExtension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quotePartyView`
--

DROP TABLE IF EXISTS `quotePartyView`;
/*!50001 DROP VIEW IF EXISTS `quotePartyView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quotePartyView` AS SELECT 
 1 AS `quoteId`,
 1 AS `quotePartyId`,
 1 AS `partyType`,
 1 AS `identifierType`,
 1 AS `partyIdentifierValue`,
 1 AS `partySubIdOrType`,
 1 AS `fspId`,
 1 AS `merchantClassificationCode`,
 1 AS `partyName`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `middleName`,
 1 AS `dateOfBirth`,
 1 AS `longitude`,
 1 AS `latitude`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `quoteResponse`
--

DROP TABLE IF EXISTS `quoteResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoteResponse` (
  `quoteResponseId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quoteId` varchar(36) NOT NULL COMMENT 'Common ID between the FSPs for the quote object, decided by the Payer FSP',
  `transferAmountCurrencyId` varchar(3) NOT NULL COMMENT 'CurrencyId of the transfer amount',
  `transferAmount` decimal(18,4) NOT NULL COMMENT 'The amount of money that the Payer FSP should transfer to the Payee FSP',
  `payeeReceiveAmountCurrencyId` varchar(3) DEFAULT NULL COMMENT 'CurrencyId of the payee receive amount',
  `payeeReceiveAmount` decimal(18,4) DEFAULT NULL COMMENT 'The amount of Money that the Payee should receive in the end-to-end transaction. Optional as the Payee FSP might not want to disclose any optional Payee fees',
  `payeeFspFeeCurrencyId` varchar(3) DEFAULT NULL COMMENT 'CurrencyId of the payee fsp fee amount',
  `payeeFspFeeAmount` decimal(18,4) DEFAULT NULL COMMENT 'Payee FSP’s part of the transaction fee',
  `payeeFspCommissionCurrencyId` varchar(3) DEFAULT NULL COMMENT 'CurrencyId of the payee fsp commission amount',
  `payeeFspCommissionAmount` decimal(18,4) DEFAULT NULL COMMENT 'Transaction commission from the Payee FSP',
  `ilpCondition` varchar(256) NOT NULL,
  `responseExpirationDate` datetime DEFAULT NULL COMMENT 'Optional expiration for the requested transaction',
  `isValid` tinyint(1) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`quoteResponseId`),
  KEY `quoteresponse_quoteid_foreign` (`quoteId`),
  KEY `quoteresponse_transferamountcurrencyid_foreign` (`transferAmountCurrencyId`),
  KEY `quoteresponse_payeereceiveamountcurrencyid_foreign` (`payeeReceiveAmountCurrencyId`),
  KEY `quoteresponse_payeefspcommissioncurrencyid_foreign` (`payeeFspCommissionCurrencyId`),
  CONSTRAINT `quoteresponse_payeefspcommissioncurrencyid_foreign` FOREIGN KEY (`payeeFspCommissionCurrencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `quoteresponse_payeereceiveamountcurrencyid_foreign` FOREIGN KEY (`payeeReceiveAmountCurrencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `quoteresponse_quoteid_foreign` FOREIGN KEY (`quoteId`) REFERENCES `quote` (`quoteId`),
  CONSTRAINT `quoteresponse_transferamountcurrencyid_foreign` FOREIGN KEY (`transferAmountCurrencyId`) REFERENCES `currency` (`currencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table is the primary store for quote responses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quoteResponse`
--

LOCK TABLES `quoteResponse` WRITE;
/*!40000 ALTER TABLE `quoteResponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `quoteResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quoteResponseDuplicateCheck`
--

DROP TABLE IF EXISTS `quoteResponseDuplicateCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoteResponseDuplicateCheck` (
  `quoteResponseId` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'The response to the intial quote',
  `quoteId` varchar(36) NOT NULL COMMENT 'Common ID between the FSPs for the quote object, decided by the Payer FSP',
  `hash` varchar(255) DEFAULT NULL COMMENT 'hash value received for the quote response',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`quoteResponseId`),
  KEY `quoteresponseduplicatecheck_quoteid_foreign` (`quoteId`),
  CONSTRAINT `quoteresponseduplicatecheck_quoteid_foreign` FOREIGN KEY (`quoteId`) REFERENCES `quote` (`quoteId`),
  CONSTRAINT `quoteresponseduplicatecheck_quoteresponseid_foreign` FOREIGN KEY (`quoteResponseId`) REFERENCES `quoteResponse` (`quoteResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quoteResponseDuplicateCheck`
--

LOCK TABLES `quoteResponseDuplicateCheck` WRITE;
/*!40000 ALTER TABLE `quoteResponseDuplicateCheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `quoteResponseDuplicateCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quoteResponseIlpPacket`
--

DROP TABLE IF EXISTS `quoteResponseIlpPacket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoteResponseIlpPacket` (
  `quoteResponseId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL COMMENT 'ilpPacket returned from Payee in response to a quote request',
  PRIMARY KEY (`quoteResponseId`),
  CONSTRAINT `quoteresponseilppacket_quoteresponseid_foreign` FOREIGN KEY (`quoteResponseId`) REFERENCES `quoteResponse` (`quoteResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quoteResponseIlpPacket`
--

LOCK TABLES `quoteResponseIlpPacket` WRITE;
/*!40000 ALTER TABLE `quoteResponseIlpPacket` DISABLE KEYS */;
/*!40000 ALTER TABLE `quoteResponseIlpPacket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quoteResponseView`
--

DROP TABLE IF EXISTS `quoteResponseView`;
/*!50001 DROP VIEW IF EXISTS `quoteResponseView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quoteResponseView` AS SELECT 
 1 AS `quoteResponseId`,
 1 AS `quoteId`,
 1 AS `transferAmountCurrencyId`,
 1 AS `transferAmount`,
 1 AS `payeeReceiveAmountCurrencyId`,
 1 AS `payeeReceiveAmount`,
 1 AS `payeeFspFeeCurrencyId`,
 1 AS `payeeFspFeeAmount`,
 1 AS `payeeFspCommissionCurrencyId`,
 1 AS `payeeFspCommissionAmount`,
 1 AS `ilpCondition`,
 1 AS `responseExpirationDate`,
 1 AS `isValid`,
 1 AS `createdDate`,
 1 AS `ilpPacket`,
 1 AS `longitude`,
 1 AS `latitude`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `quoteView`
--

DROP TABLE IF EXISTS `quoteView`;
/*!50001 DROP VIEW IF EXISTS `quoteView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quoteView` AS SELECT 
 1 AS `quoteId`,
 1 AS `transactionReferenceId`,
 1 AS `transactionRequestId`,
 1 AS `note`,
 1 AS `expirationDate`,
 1 AS `transactionInitiator`,
 1 AS `transactionInitiatorType`,
 1 AS `transactionScenario`,
 1 AS `balanceOfPaymentsId`,
 1 AS `transactionSubScenario`,
 1 AS `amountType`,
 1 AS `amount`,
 1 AS `currency`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `segment`
--

DROP TABLE IF EXISTS `segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segment` (
  `segmentId` int unsigned NOT NULL AUTO_INCREMENT,
  `segmentType` varchar(50) NOT NULL,
  `enumeration` int NOT NULL DEFAULT '0',
  `tableName` varchar(50) NOT NULL,
  `value` bigint NOT NULL,
  `changedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`segmentId`),
  KEY `segment_keys_index` (`segmentType`,`enumeration`,`tableName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segment`
--

LOCK TABLES `segment` WRITE;
/*!40000 ALTER TABLE `segment` DISABLE KEYS */;
/*!40000 ALTER TABLE `segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlement`
--

DROP TABLE IF EXISTS `settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlement` (
  `settlementId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currentStateChangeId` bigint unsigned DEFAULT NULL,
  `settlementModelId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`settlementId`),
  KEY `settlement_currentstatechangeid_foreign` (`currentStateChangeId`),
  KEY `settlement_settlementmodelid_foreign` (`settlementModelId`),
  CONSTRAINT `settlement_currentstatechangeid_foreign` FOREIGN KEY (`currentStateChangeId`) REFERENCES `settlementStateChange` (`settlementStateChangeId`),
  CONSTRAINT `settlement_settlementmodelid_foreign` FOREIGN KEY (`settlementModelId`) REFERENCES `settlementModel` (`settlementModelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlement`
--

LOCK TABLES `settlement` WRITE;
/*!40000 ALTER TABLE `settlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementContentAggregation`
--

DROP TABLE IF EXISTS `settlementContentAggregation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementContentAggregation` (
  `settlementContentAggregationId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementWindowContentId` bigint unsigned NOT NULL,
  `participantCurrencyId` int unsigned NOT NULL,
  `transferParticipantRoleTypeId` int unsigned NOT NULL,
  `ledgerEntryTypeId` int unsigned NOT NULL,
  `amount` decimal(18,4) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currentStateId` varchar(50) NOT NULL,
  `settlementId` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`settlementContentAggregationId`),
  KEY `settlementcontentaggregation_settlementwindowcontentid_index` (`settlementWindowContentId`),
  KEY `settlementcontentaggregation_participantcurrencyid_index` (`participantCurrencyId`),
  KEY `settlementcontentaggregation_transferparticipantroletypeid_index` (`transferParticipantRoleTypeId`),
  KEY `settlementcontentaggregation_ledgerentrytypeid_index` (`ledgerEntryTypeId`),
  KEY `settlementcontentaggregation_currentstateid_index` (`currentStateId`),
  KEY `settlementcontentaggregation_settlementid_index` (`settlementId`),
  CONSTRAINT `sca_transferparticipantroletypeid_foreign` FOREIGN KEY (`transferParticipantRoleTypeId`) REFERENCES `transferParticipantRoleType` (`transferParticipantRoleTypeId`),
  CONSTRAINT `settlementcontentaggregation_currentstateid_foreign` FOREIGN KEY (`currentStateId`) REFERENCES `settlementWindowState` (`settlementWindowStateId`),
  CONSTRAINT `settlementcontentaggregation_ledgerentrytypeid_foreign` FOREIGN KEY (`ledgerEntryTypeId`) REFERENCES `ledgerEntryType` (`ledgerEntryTypeId`),
  CONSTRAINT `settlementcontentaggregation_participantcurrencyid_foreign` FOREIGN KEY (`participantCurrencyId`) REFERENCES `participantCurrency` (`participantCurrencyId`),
  CONSTRAINT `settlementcontentaggregation_settlementid_foreign` FOREIGN KEY (`settlementId`) REFERENCES `settlement` (`settlementId`),
  CONSTRAINT `settlementcontentaggregation_settlementwindowcontentid_foreign` FOREIGN KEY (`settlementWindowContentId`) REFERENCES `settlementWindowContent` (`settlementWindowContentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementContentAggregation`
--

LOCK TABLES `settlementContentAggregation` WRITE;
/*!40000 ALTER TABLE `settlementContentAggregation` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementContentAggregation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementDelay`
--

DROP TABLE IF EXISTS `settlementDelay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementDelay` (
  `settlementDelayId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`settlementDelayId`),
  UNIQUE KEY `settlementdelay_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementDelay`
--

LOCK TABLES `settlementDelay` WRITE;
/*!40000 ALTER TABLE `settlementDelay` DISABLE KEYS */;
INSERT INTO `settlementDelay` VALUES (1,'IMMEDIATE',NULL,1,'2023-08-24 12:47:33'),(2,'DEFERRED',NULL,1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `settlementDelay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementGranularity`
--

DROP TABLE IF EXISTS `settlementGranularity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementGranularity` (
  `settlementGranularityId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`settlementGranularityId`),
  UNIQUE KEY `settlementgranularity_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementGranularity`
--

LOCK TABLES `settlementGranularity` WRITE;
/*!40000 ALTER TABLE `settlementGranularity` DISABLE KEYS */;
INSERT INTO `settlementGranularity` VALUES (1,'GROSS',NULL,1,'2023-08-24 12:47:33'),(2,'NET',NULL,1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `settlementGranularity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementInterchange`
--

DROP TABLE IF EXISTS `settlementInterchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementInterchange` (
  `settlementInterchangeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`settlementInterchangeId`),
  UNIQUE KEY `settlementinterchange_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementInterchange`
--

LOCK TABLES `settlementInterchange` WRITE;
/*!40000 ALTER TABLE `settlementInterchange` DISABLE KEYS */;
INSERT INTO `settlementInterchange` VALUES (1,'BILATERAL',NULL,1,'2023-08-24 12:47:33'),(2,'MULTILATERAL',NULL,1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `settlementInterchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementModel`
--

DROP TABLE IF EXISTS `settlementModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementModel` (
  `settlementModelId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `settlementGranularityId` int unsigned NOT NULL,
  `settlementInterchangeId` int unsigned NOT NULL,
  `settlementDelayId` int unsigned NOT NULL,
  `currencyId` varchar(3) DEFAULT NULL,
  `requireLiquidityCheck` tinyint(1) NOT NULL DEFAULT '1',
  `ledgerAccountTypeId` int unsigned NOT NULL,
  `autoPositionReset` tinyint(1) NOT NULL DEFAULT '0',
  `adjustPosition` tinyint(1) NOT NULL DEFAULT '0',
  `settlementAccountTypeId` int NOT NULL,
  PRIMARY KEY (`settlementModelId`),
  UNIQUE KEY `settlementmodel_name_unique` (`name`),
  UNIQUE KEY `settlementmodel_unique` (`settlementGranularityId`,`settlementInterchangeId`,`settlementDelayId`,`ledgerAccountTypeId`,`currencyId`),
  UNIQUE KEY `settlementmodel_uniqueAccountCurrency` (`ledgerAccountTypeId`,`currencyId`),
  UNIQUE KEY `settlementmodel_currencyid_ledgeraccounttypeid_unique` (`currencyId`,`ledgerAccountTypeId`),
  KEY `settlementmodel_settlementgranularityid_index` (`settlementGranularityId`),
  KEY `settlementmodel_settlementinterchangeid_index` (`settlementInterchangeId`),
  KEY `settlementmodel_settlementdelayid_index` (`settlementDelayId`),
  KEY `settlementmodel_currencyid_index` (`currencyId`),
  KEY `settlementmodel_ledgeraccounttypeid_index` (`ledgerAccountTypeId`),
  CONSTRAINT `settlementmodel_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `settlementmodel_ledgeraccounttypeid_foreign` FOREIGN KEY (`ledgerAccountTypeId`) REFERENCES `ledgerAccountType` (`ledgerAccountTypeId`),
  CONSTRAINT `settlementmodel_settlementdelayid_foreign` FOREIGN KEY (`settlementDelayId`) REFERENCES `settlementDelay` (`settlementDelayId`),
  CONSTRAINT `settlementmodel_settlementgranularityid_foreign` FOREIGN KEY (`settlementGranularityId`) REFERENCES `settlementGranularity` (`settlementGranularityId`),
  CONSTRAINT `settlementmodel_settlementinterchangeid_foreign` FOREIGN KEY (`settlementInterchangeId`) REFERENCES `settlementInterchange` (`settlementInterchangeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementModel`
--

LOCK TABLES `settlementModel` WRITE;
/*!40000 ALTER TABLE `settlementModel` DISABLE KEYS */;
INSERT INTO `settlementModel` VALUES (1,'DEFERREDNETUSD',1,2,2,2,'USD',1,1,1,0,2),(2,'DEFAULTDEFERREDNET',1,2,2,2,NULL,1,1,1,0,2),(3,'CGS',1,1,1,1,'INR',1,1,0,0,2),(4,'INTERCHANGEFEE',1,2,2,2,'INR',0,5,1,0,6);
/*!40000 ALTER TABLE `settlementModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementParticipantCurrency`
--

DROP TABLE IF EXISTS `settlementParticipantCurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementParticipantCurrency` (
  `settlementParticipantCurrencyId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementId` bigint unsigned NOT NULL,
  `participantCurrencyId` int unsigned NOT NULL,
  `netAmount` decimal(18,4) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currentStateChangeId` bigint unsigned DEFAULT NULL,
  `settlementTransferId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`settlementParticipantCurrencyId`),
  KEY `settlementparticipantcurrency_settlementid_index` (`settlementId`),
  KEY `settlementparticipantcurrency_participantcurrencyid_index` (`participantCurrencyId`),
  KEY `settlementparticipantcurrency_settlementtransferid_index` (`settlementTransferId`),
  KEY `spc_currentstatechangeid_foreign` (`currentStateChangeId`),
  CONSTRAINT `settlementparticipantcurrency_participantcurrencyid_foreign` FOREIGN KEY (`participantCurrencyId`) REFERENCES `participantCurrency` (`participantCurrencyId`),
  CONSTRAINT `settlementparticipantcurrency_settlementid_foreign` FOREIGN KEY (`settlementId`) REFERENCES `settlement` (`settlementId`),
  CONSTRAINT `spc_currentstatechangeid_foreign` FOREIGN KEY (`currentStateChangeId`) REFERENCES `settlementParticipantCurrencyStateChange` (`settlementParticipantCurrencyStateChangeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementParticipantCurrency`
--

LOCK TABLES `settlementParticipantCurrency` WRITE;
/*!40000 ALTER TABLE `settlementParticipantCurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementParticipantCurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementParticipantCurrencyStateChange`
--

DROP TABLE IF EXISTS `settlementParticipantCurrencyStateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementParticipantCurrencyStateChange` (
  `settlementParticipantCurrencyStateChangeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementParticipantCurrencyId` bigint unsigned NOT NULL,
  `settlementStateId` varchar(50) NOT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `externalReference` varchar(50) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementParticipantCurrencyStateChangeId`),
  KEY `spcsc_settlementparticipantcurrencyid_index` (`settlementParticipantCurrencyId`),
  KEY `spcsc_settlementstateid_index` (`settlementStateId`),
  CONSTRAINT `spcsc_settlementparticipantcurrencyid_foreign` FOREIGN KEY (`settlementParticipantCurrencyId`) REFERENCES `settlementParticipantCurrency` (`settlementParticipantCurrencyId`),
  CONSTRAINT `spcsc_settlementstateid_foreign` FOREIGN KEY (`settlementStateId`) REFERENCES `settlementState` (`settlementStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementParticipantCurrencyStateChange`
--

LOCK TABLES `settlementParticipantCurrencyStateChange` WRITE;
/*!40000 ALTER TABLE `settlementParticipantCurrencyStateChange` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementParticipantCurrencyStateChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementSettlementWindow`
--

DROP TABLE IF EXISTS `settlementSettlementWindow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementSettlementWindow` (
  `settlementSettlementWindowId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementId` bigint unsigned NOT NULL,
  `settlementWindowId` bigint unsigned NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementSettlementWindowId`),
  UNIQUE KEY `settlementsettlementwindow_unique` (`settlementId`,`settlementWindowId`),
  KEY `settlementsettlementwindow_settlementid_index` (`settlementId`),
  KEY `settlementsettlementwindow_settlementwindowid_index` (`settlementWindowId`),
  CONSTRAINT `settlementsettlementwindow_settlementid_foreign` FOREIGN KEY (`settlementId`) REFERENCES `settlement` (`settlementId`),
  CONSTRAINT `settlementsettlementwindow_settlementwindowid_foreign` FOREIGN KEY (`settlementWindowId`) REFERENCES `settlementWindow` (`settlementWindowId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementSettlementWindow`
--

LOCK TABLES `settlementSettlementWindow` WRITE;
/*!40000 ALTER TABLE `settlementSettlementWindow` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementSettlementWindow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementState`
--

DROP TABLE IF EXISTS `settlementState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementState` (
  `settlementStateId` varchar(50) NOT NULL,
  `enumeration` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementState`
--

LOCK TABLES `settlementState` WRITE;
/*!40000 ALTER TABLE `settlementState` DISABLE KEYS */;
INSERT INTO `settlementState` VALUES ('ABORTED','ABORTED','Final state when the settlement is not possible.',1,'2023-08-24 12:47:33'),('PENDING_SETTLEMENT','PENDING_SETTLEMENT','The net settlement report for this window has been taken, with the parameter set to indicate that settlement is to be processed.',1,'2023-08-24 12:47:33'),('PS_TRANSFERS_COMMITTED','PS_TRANSFERS_COMMITTED','All the credit entries for the MLNS transfers are committed. An identifier might be received and recorded from the Settlement bank to allow reconciliation.',1,'2023-08-24 12:47:33'),('PS_TRANSFERS_RECORDED','PS_TRANSFERS_RECORDED','Record transfer entries against the Position Account and the Multi-lateral Net Settlement Account, these are the \"multi-lateral net  settlement transfers\" (MLNS transfers). An identifier might be provided to be past to the reference bank.',1,'2023-08-24 12:47:33'),('PS_TRANSFERS_RESERVED','PS_TRANSFERS_RESERVED','All the debit entries for the MLNS transfers are reserved.',1,'2023-08-24 12:47:33'),('SETTLED','SETTLED','When all outstanding accounts are SETTLED, the entire Settlement is moved to SETTLED.',1,'2023-08-24 12:47:33'),('SETTLING','SETTLING','If all accounts are not yet SETTLED, the Status of the settlement is moved to SETTLING. Note: applies only on settlement level.',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `settlementState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementStateChange`
--

DROP TABLE IF EXISTS `settlementStateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementStateChange` (
  `settlementStateChangeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementId` bigint unsigned NOT NULL,
  `settlementStateId` varchar(50) NOT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementStateChangeId`),
  KEY `settlementstatechange_settlementid_index` (`settlementId`),
  KEY `settlementstatechange_settlementstateid_index` (`settlementStateId`),
  CONSTRAINT `settlementstatechange_settlementid_foreign` FOREIGN KEY (`settlementId`) REFERENCES `settlement` (`settlementId`),
  CONSTRAINT `settlementstatechange_settlementstateid_foreign` FOREIGN KEY (`settlementStateId`) REFERENCES `settlementState` (`settlementStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementStateChange`
--

LOCK TABLES `settlementStateChange` WRITE;
/*!40000 ALTER TABLE `settlementStateChange` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementStateChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementTransferParticipant`
--

DROP TABLE IF EXISTS `settlementTransferParticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementTransferParticipant` (
  `settlementTransferParticipantId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementId` bigint unsigned NOT NULL,
  `settlementWindowId` bigint unsigned NOT NULL,
  `participantCurrencyId` int unsigned NOT NULL,
  `transferParticipantRoleTypeId` int unsigned NOT NULL,
  `ledgerEntryTypeId` int unsigned NOT NULL,
  `amount` decimal(18,4) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementTransferParticipantId`),
  KEY `settlementtransferparticipant_settlementid_index` (`settlementId`),
  KEY `settlementtransferparticipant_settlementwindowid_index` (`settlementWindowId`),
  KEY `settlementtransferparticipant_participantcurrencyid_index` (`participantCurrencyId`),
  KEY `stp_transferparticipantroletypeid_index` (`transferParticipantRoleTypeId`),
  KEY `settlementtransferparticipant_ledgerentrytypeid_index` (`ledgerEntryTypeId`),
  CONSTRAINT `settlementtransferparticipant_ledgerentrytypeid_foreign` FOREIGN KEY (`ledgerEntryTypeId`) REFERENCES `ledgerEntryType` (`ledgerEntryTypeId`),
  CONSTRAINT `settlementtransferparticipant_participantcurrencyid_foreign` FOREIGN KEY (`participantCurrencyId`) REFERENCES `participantCurrency` (`participantCurrencyId`),
  CONSTRAINT `settlementtransferparticipant_settlementid_foreign` FOREIGN KEY (`settlementId`) REFERENCES `settlement` (`settlementId`),
  CONSTRAINT `settlementtransferparticipant_settlementwindowid_foreign` FOREIGN KEY (`settlementWindowId`) REFERENCES `settlementWindow` (`settlementWindowId`),
  CONSTRAINT `stp_transferparticipantroletypeid_foreign` FOREIGN KEY (`transferParticipantRoleTypeId`) REFERENCES `transferParticipantRoleType` (`transferParticipantRoleTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementTransferParticipant`
--

LOCK TABLES `settlementTransferParticipant` WRITE;
/*!40000 ALTER TABLE `settlementTransferParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementTransferParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementWindow`
--

DROP TABLE IF EXISTS `settlementWindow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementWindow` (
  `settlementWindowId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currentStateChangeId` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`settlementWindowId`),
  KEY `settlementwindow_currentstatechangeid_foreign` (`currentStateChangeId`),
  CONSTRAINT `settlementwindow_currentstatechangeid_foreign` FOREIGN KEY (`currentStateChangeId`) REFERENCES `settlementWindowStateChange` (`settlementWindowStateChangeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementWindow`
--

LOCK TABLES `settlementWindow` WRITE;
/*!40000 ALTER TABLE `settlementWindow` DISABLE KEYS */;
INSERT INTO `settlementWindow` VALUES (1,'initial window','2023-08-24 12:47:33',1);
/*!40000 ALTER TABLE `settlementWindow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementWindowContent`
--

DROP TABLE IF EXISTS `settlementWindowContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementWindowContent` (
  `settlementWindowContentId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementWindowId` bigint unsigned NOT NULL,
  `ledgerAccountTypeId` int unsigned NOT NULL,
  `currencyId` varchar(3) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currentStateChangeId` bigint unsigned DEFAULT NULL,
  `settlementId` bigint unsigned DEFAULT NULL,
  `SettlementModelId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`settlementWindowContentId`),
  KEY `settlementwindowcontent_settlementwindowid_index` (`settlementWindowId`),
  KEY `settlementwindowcontent_ledgeraccounttypeid_index` (`ledgerAccountTypeId`),
  KEY `settlementwindowcontent_currencyid_index` (`currencyId`),
  KEY `settlementwindowcontent_currentstatechangeid_index` (`currentStateChangeId`),
  KEY `settlementwindowcontent_settlementid_index` (`settlementId`),
  KEY `settlementwindowcontent_settlementmodelid_foreign` (`SettlementModelId`),
  CONSTRAINT `settlementwindowcontent_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `settlementwindowcontent_currentstatechangeid_foreign` FOREIGN KEY (`currentStateChangeId`) REFERENCES `settlementWindowContentStateChange` (`settlementWindowContentStateChangeId`),
  CONSTRAINT `settlementwindowcontent_ledgeraccounttypeid_foreign` FOREIGN KEY (`ledgerAccountTypeId`) REFERENCES `ledgerAccountType` (`ledgerAccountTypeId`),
  CONSTRAINT `settlementwindowcontent_settlementid_foreign` FOREIGN KEY (`settlementId`) REFERENCES `settlement` (`settlementId`),
  CONSTRAINT `settlementwindowcontent_settlementmodelid_foreign` FOREIGN KEY (`SettlementModelId`) REFERENCES `settlementModel` (`settlementModelId`),
  CONSTRAINT `settlementwindowcontent_settlementwindowid_foreign` FOREIGN KEY (`settlementWindowId`) REFERENCES `settlementWindow` (`settlementWindowId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementWindowContent`
--

LOCK TABLES `settlementWindowContent` WRITE;
/*!40000 ALTER TABLE `settlementWindowContent` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementWindowContent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementWindowContentStateChange`
--

DROP TABLE IF EXISTS `settlementWindowContentStateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementWindowContentStateChange` (
  `settlementWindowContentStateChangeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementWindowContentId` bigint unsigned NOT NULL,
  `settlementWindowStateId` varchar(50) NOT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementWindowContentStateChangeId`),
  KEY `swcsc_settlementwindowcontentid_index` (`settlementWindowContentId`),
  KEY `swcsc_settlementwindowstateid_index` (`settlementWindowStateId`),
  CONSTRAINT `swc_settlementwindowcontentid_foreign` FOREIGN KEY (`settlementWindowContentId`) REFERENCES `settlementWindowContent` (`settlementWindowContentId`),
  CONSTRAINT `sws1_settlementwindowstateid_foreign` FOREIGN KEY (`settlementWindowStateId`) REFERENCES `settlementWindowState` (`settlementWindowStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementWindowContentStateChange`
--

LOCK TABLES `settlementWindowContentStateChange` WRITE;
/*!40000 ALTER TABLE `settlementWindowContentStateChange` DISABLE KEYS */;
/*!40000 ALTER TABLE `settlementWindowContentStateChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementWindowState`
--

DROP TABLE IF EXISTS `settlementWindowState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementWindowState` (
  `settlementWindowStateId` varchar(50) NOT NULL,
  `enumeration` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementWindowStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementWindowState`
--

LOCK TABLES `settlementWindowState` WRITE;
/*!40000 ALTER TABLE `settlementWindowState` DISABLE KEYS */;
INSERT INTO `settlementWindowState` VALUES ('ABORTED','ABORTED','Window returned to this state when the settlement was not possible. This window may now be included in a future settlement.',1,'2023-08-24 12:47:33'),('CLOSED','CLOSED','Settlement Window is not accepting any additional transfers. All new transfers are being allocated to the OPEN Settlement Window.',1,'2023-08-24 12:47:33'),('FAILED','FAILED','Used when close window processing failed and all retries have been exhausted.',1,'2023-08-24 12:47:33'),('OPEN','OPEN','Current window into which Fulfilled transfers are being allocated. Only one window should be open at a time.',1,'2023-08-24 12:47:33'),('PENDING_SETTLEMENT','PENDING_SETTLEMENT','The net settlement report for this window has been taken, with the parameter set to indicate that settlement is to be processed.',1,'2023-08-24 12:47:33'),('PROCESSING','PROCESSING','Intermediate state when closing a window.',1,'2023-08-24 12:47:33'),('SETTLED','SETTLED','The Hub Operator/Settlement Bank has confirmed that all the participants that engaged in the settlement window have now settled their payments in accordance with the net settlement report.',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `settlementWindowState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementWindowStateChange`
--

DROP TABLE IF EXISTS `settlementWindowStateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementWindowStateChange` (
  `settlementWindowStateChangeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settlementWindowId` bigint unsigned NOT NULL,
  `settlementWindowStateId` varchar(50) NOT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`settlementWindowStateChangeId`),
  KEY `settlementwindowstatechange_settlementwindowid_index` (`settlementWindowId`),
  KEY `settlementwindowstatechange_settlementwindowstateid_index` (`settlementWindowStateId`),
  CONSTRAINT `settlementwindowstatechange_settlementwindowid_foreign` FOREIGN KEY (`settlementWindowId`) REFERENCES `settlementWindow` (`settlementWindowId`),
  CONSTRAINT `settlementwindowstatechange_settlementwindowstateid_foreign` FOREIGN KEY (`settlementWindowStateId`) REFERENCES `settlementWindowState` (`settlementWindowStateId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementWindowStateChange`
--

LOCK TABLES `settlementWindowStateChange` WRITE;
/*!40000 ALTER TABLE `settlementWindowStateChange` DISABLE KEYS */;
INSERT INTO `settlementWindowStateChange` VALUES (1,1,'OPEN','initial window','2023-08-24 12:47:33');
/*!40000 ALTER TABLE `settlementWindowStateChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `tokenId` int unsigned NOT NULL AUTO_INCREMENT,
  `participantId` int unsigned NOT NULL,
  `value` varchar(256) NOT NULL,
  `expiration` bigint DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tokenId`),
  UNIQUE KEY `token_value_unique` (`value`),
  KEY `token_participantid_index` (`participantId`),
  CONSTRAINT `token_participantid_foreign` FOREIGN KEY (`participantId`) REFERENCES `participant` (`participantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionInitiator`
--

DROP TABLE IF EXISTS `transactionInitiator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionInitiator` (
  `transactionInitiatorId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`transactionInitiatorId`),
  UNIQUE KEY `transactioninitiator_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionInitiator`
--

LOCK TABLES `transactionInitiator` WRITE;
/*!40000 ALTER TABLE `transactionInitiator` DISABLE KEYS */;
INSERT INTO `transactionInitiator` VALUES (1,'PAYER','Sender of funds is initiating the transaction. The account to send from is either owned by the Payer or is connected to the Payer in some way','2023-08-24 12:47:33'),(2,'PAYEE','Recipient of the funds is initiating the transaction by sending a transaction request. The Payer must approve the transaction, either automatically by a pre-generated OTP or by pre-approval of the Payee, or manually by approving on their own Device','2023-08-24 12:47:33');
/*!40000 ALTER TABLE `transactionInitiator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionInitiatorType`
--

DROP TABLE IF EXISTS `transactionInitiatorType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionInitiatorType` (
  `transactionInitiatorTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`transactionInitiatorTypeId`),
  UNIQUE KEY `transactioninitiatortype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionInitiatorType`
--

LOCK TABLES `transactionInitiatorType` WRITE;
/*!40000 ALTER TABLE `transactionInitiatorType` DISABLE KEYS */;
INSERT INTO `transactionInitiatorType` VALUES (1,'CONSUMER','Consumer is the initiator of the transaction','2023-08-24 12:47:33'),(2,'AGENT','Agent is the initiator of the transaction','2023-08-24 12:47:33'),(3,'BUSINESS','Business is the initiator of the transaction','2023-08-24 12:47:33'),(4,'DEVICE','Device is the initiator of the transaction','2023-08-24 12:47:33');
/*!40000 ALTER TABLE `transactionInitiatorType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionReference`
--

DROP TABLE IF EXISTS `transactionReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionReference` (
  `transactionReferenceId` varchar(36) NOT NULL COMMENT 'Common ID (decided by the Payer FSP) between the FSPs for the future transaction object',
  `quoteId` varchar(36) DEFAULT NULL COMMENT 'Common ID between the FSPs for the quote object, decided by the Payer FSP',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System row creation timestamp',
  PRIMARY KEY (`transactionReferenceId`),
  KEY `transactionreference_quoteid_index` (`quoteId`),
  CONSTRAINT `transactionreference_quoteid_foreign` FOREIGN KEY (`quoteId`) REFERENCES `quoteDuplicateCheck` (`quoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionReference`
--

LOCK TABLES `transactionReference` WRITE;
/*!40000 ALTER TABLE `transactionReference` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionReference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionScenario`
--

DROP TABLE IF EXISTS `transactionScenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionScenario` (
  `transactionScenarioId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`transactionScenarioId`),
  UNIQUE KEY `transactionscenario_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionScenario`
--

LOCK TABLES `transactionScenario` WRITE;
/*!40000 ALTER TABLE `transactionScenario` DISABLE KEYS */;
INSERT INTO `transactionScenario` VALUES (1,'TRANSFER','Used for performing a P2P (Peer to Peer, or Consumer to Consumer) transaction','2023-08-24 12:47:33'),(2,'DEPOSIT','Used for performing a Cash-In (deposit) transaction. In a normal scenario, electronic funds are transferred from a Business account to a Consumer account, and physical cash is given from the Consumer to the Business User','2023-08-24 12:47:33'),(3,'WITHDRAWAL','Used for performing a Cash-Out (withdrawal) transaction. In a normal scenario, electronic funds are transferred from a Consumer’s account to a Business account, and physical cash is given from the Business User to the Consumer','2023-08-24 12:47:33'),(4,'PAYMENT','Usually used for performing a transaction from a Consumer to a Merchant or Organization, but could also be for a B2B (Business to Business) payment. The transaction could be online for a purchase in an Internet store, in a physical store where both the Consumer and Business User are present, a bill payment, a donation, and so on','2023-08-24 12:47:33'),(5,'REFUND','Used for performing a refund of transaction','2023-08-24 12:47:33');
/*!40000 ALTER TABLE `transactionScenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionSubScenario`
--

DROP TABLE IF EXISTS `transactionSubScenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionSubScenario` (
  `transactionSubScenarioId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1024) DEFAULT NULL COMMENT 'Possible sub-scenario, defined locally within the scheme',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'System dateTime stamp pertaining to the inserted record',
  PRIMARY KEY (`transactionSubScenarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionSubScenario`
--

LOCK TABLES `transactionSubScenario` WRITE;
/*!40000 ALTER TABLE `transactionSubScenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionSubScenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `transferId` varchar(36) NOT NULL,
  `amount` decimal(18,4) NOT NULL,
  `currencyId` varchar(3) NOT NULL,
  `ilpCondition` varchar(256) NOT NULL,
  `expirationDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferId`),
  KEY `transfer_currencyid_index` (`currencyId`),
  CONSTRAINT `transfer_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`currencyId`),
  CONSTRAINT `transfer_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transferDuplicateCheck` (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES ('0395c4af-8a54-4105-a025-aa04d983a5b6',5000000.0000,'USD','0','2023-08-29 12:50:25','2023-08-24 12:50:25'),('08fdf211-fca5-4d24-b332-1e752865ae8f',5000000.0000,'USD','0','2023-08-29 12:50:10','2023-08-24 12:50:10'),('0ea8ca50-ba6f-4f4b-a25a-a427182164f5',5000000.0000,'USD','0','2023-08-29 12:49:19','2023-08-24 12:49:19'),('346519ef-62fa-4dce-9877-1eb211f52c7a',5000000.0000,'USD','0','2023-08-29 12:49:29','2023-08-24 12:49:29'),('428fdb87-20b3-44b6-992d-0e8b1d660dfa',5000000.0000,'USD','0','2023-08-29 12:49:49','2023-08-24 12:49:49'),('673b72e2-5d33-4c3d-8351-eea28f5afa1c',5000000.0000,'BGN','0','2023-08-29 12:50:01','2023-08-24 12:50:01'),('89690fb3-861d-4ebd-8a5b-41de29542b90',5000000.0000,'USD','0','2023-08-29 12:48:59','2023-08-24 12:48:58'),('8ac99640-f54b-4d74-bf7c-c2018761e0f6',5000000.0000,'BGN','0','2023-08-29 12:50:11','2023-08-24 12:50:11'),('8ecb5d86-dc24-4d91-87e5-062f89b25a17',5000000.0000,'USD','0','2023-08-29 12:49:39','2023-08-24 12:49:39'),('8ee55b65-c713-4083-b653-3be63a03e2ff',5000000.0000,'USD','0','2023-08-29 12:50:00','2023-08-24 12:50:00'),('a99d3f47-ed9a-4d69-9979-c13c3939a18c',5000000.0000,'BGN','0','2023-08-29 12:49:20','2023-08-24 12:49:20'),('add6a4a9-e9cb-4a57-8f64-9389d270c820',5000000.0000,'BGN','0','2023-08-29 12:49:30','2023-08-24 12:49:30'),('bbf3ee55-bdc7-4e6f-b836-2b456e86c558',5000000.0000,'BGN','0','2023-08-29 12:49:00','2023-08-24 12:49:00'),('bc7db59b-4d96-459f-8305-154950153bd7',5000000.0000,'BGN','0','2023-08-29 12:49:51','2023-08-24 12:49:51'),('cc69723b-b433-4dd9-8127-baaa378c33e4',5000000.0000,'BGN','0','2023-08-29 12:49:10','2023-08-24 12:49:10'),('d4769372-c37d-4bd8-a118-1872cf98271d',5000000.0000,'BGN','0','2023-08-29 12:50:26','2023-08-24 12:50:26'),('e5dc2bff-5bdd-4509-906a-30710938be31',5000000.0000,'BGN','0','2023-08-29 12:49:40','2023-08-24 12:49:40'),('f15b363a-646b-4f8e-b6a3-92a5f62ead90',5000000.0000,'USD','0','2023-08-29 12:49:09','2023-08-24 12:49:09');
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferDuplicateCheck`
--

DROP TABLE IF EXISTS `transferDuplicateCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferDuplicateCheck` (
  `transferId` varchar(36) NOT NULL,
  `hash` varchar(256) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferDuplicateCheck`
--

LOCK TABLES `transferDuplicateCheck` WRITE;
/*!40000 ALTER TABLE `transferDuplicateCheck` DISABLE KEYS */;
INSERT INTO `transferDuplicateCheck` VALUES ('0395c4af-8a54-4105-a025-aa04d983a5b6','5hh/ZArCNRUKaNHDIkbEe9WewmwSQyzQQ8UNfvweDh4','2023-08-24 12:50:25'),('08fdf211-fca5-4d24-b332-1e752865ae8f','RxAoKKe0rzEsHXvQHonOoPOSOqfUfAgR4E8GUeE91HU','2023-08-24 12:50:10'),('0ea8ca50-ba6f-4f4b-a25a-a427182164f5','j0ouQyOg7wC90pRMIsAOd0V3jbcVoclE0YZDi6Jqq2U','2023-08-24 12:49:18'),('346519ef-62fa-4dce-9877-1eb211f52c7a','B3SDHofoBR4xqj9VMKgt28hWqfgNOnJrY3x7fyOx08Y','2023-08-24 12:49:28'),('428fdb87-20b3-44b6-992d-0e8b1d660dfa','eC5Al3BLIeoR8+h2OLUC8664nNMaJ13SabQUarJ3tCM','2023-08-24 12:49:49'),('673b72e2-5d33-4c3d-8351-eea28f5afa1c','Wi+/ElVmbnUGG7anUOrLLm2ERspSFEFWoBhiHeqiTz0','2023-08-24 12:50:00'),('89690fb3-861d-4ebd-8a5b-41de29542b90','1uVOqNQmaljaoRXlSSG9/yZoqFKJUdTrtVIgXNoMGu4','2023-08-24 12:48:58'),('8ac99640-f54b-4d74-bf7c-c2018761e0f6','4PUAlbk1bdKL6VnTZ4n0jmKtbr4uKA2eMp88xQ/6ZFg','2023-08-24 12:50:11'),('8ecb5d86-dc24-4d91-87e5-062f89b25a17','QXIx2jE9BxeMOjb6gsVt28fFnCE0fvaWWtDNYySSiFo','2023-08-24 12:49:39'),('8ee55b65-c713-4083-b653-3be63a03e2ff','pZHe0m+s8lYaxyL8OgCwp7adDGeQLEZXeC/0tMyc6EY','2023-08-24 12:49:59'),('a99d3f47-ed9a-4d69-9979-c13c3939a18c','40QvkBLxKVzGrL/VwphlXgbfettqLViwU4ufd4bwcuE','2023-08-24 12:49:19'),('add6a4a9-e9cb-4a57-8f64-9389d270c820','P3HeYaXW9zXtlWre/VS+t1rHdN9/njOiNhBmGE/Zpcs','2023-08-24 12:49:29'),('bbf3ee55-bdc7-4e6f-b836-2b456e86c558','8ssVpJpJvKaCFf/ZZGLX1+DyqBnieB80BCgwMMUSDAo','2023-08-24 12:48:59'),('bc7db59b-4d96-459f-8305-154950153bd7','AZ0NkbXaCcOA+eSZSNeT6s3nYYaahmJCBXIIEZpATuM','2023-08-24 12:49:50'),('cc69723b-b433-4dd9-8127-baaa378c33e4','n4Ptsf6qHcSKrjocYugcwBjW7/uQxiuc/Faa5RpKrhU','2023-08-24 12:49:09'),('d4769372-c37d-4bd8-a118-1872cf98271d','9hpsGyO1qgt3awG4eC1XciMPJBBV1o2jhdGZneHwf50','2023-08-24 12:50:26'),('e5dc2bff-5bdd-4509-906a-30710938be31','jurSniEA3lHmVBqYJkhqCIET783zOJcr/OWvgoOY5sQ','2023-08-24 12:49:40'),('f15b363a-646b-4f8e-b6a3-92a5f62ead90','rb9O3V5XPEV2OCWXpfVMTdoWdtIQHGf9pqf/PzIGpyc','2023-08-24 12:49:08');
/*!40000 ALTER TABLE `transferDuplicateCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferError`
--

DROP TABLE IF EXISTS `transferError`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferError` (
  `transferId` varchar(36) NOT NULL,
  `transferStateChangeId` bigint unsigned NOT NULL,
  `errorCode` int unsigned NOT NULL,
  `errorDescription` varchar(128) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferId`),
  KEY `transfererror_transferstatechangeid_foreign` (`transferStateChangeId`),
  CONSTRAINT `transfererror_transferstatechangeid_foreign` FOREIGN KEY (`transferStateChangeId`) REFERENCES `transferStateChange` (`transferStateChangeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferError`
--

LOCK TABLES `transferError` WRITE;
/*!40000 ALTER TABLE `transferError` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferError` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferErrorDuplicateCheck`
--

DROP TABLE IF EXISTS `transferErrorDuplicateCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferErrorDuplicateCheck` (
  `transferId` varchar(36) NOT NULL,
  `hash` varchar(256) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferId`),
  CONSTRAINT `transfererrorduplicatecheck_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferErrorDuplicateCheck`
--

LOCK TABLES `transferErrorDuplicateCheck` WRITE;
/*!40000 ALTER TABLE `transferErrorDuplicateCheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferErrorDuplicateCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferExtension`
--

DROP TABLE IF EXISTS `transferExtension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferExtension` (
  `transferExtensionId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transferId` varchar(36) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `isFulfilment` tinyint(1) NOT NULL DEFAULT '0',
  `isError` tinyint(1) NOT NULL DEFAULT '0',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferExtensionId`),
  KEY `transferextension_transferid_foreign` (`transferId`),
  CONSTRAINT `transferextension_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferExtension`
--

LOCK TABLES `transferExtension` WRITE;
/*!40000 ALTER TABLE `transferExtension` DISABLE KEYS */;
INSERT INTO `transferExtension` VALUES (1,'89690fb3-861d-4ebd-8a5b-41de29542b90','externalReference','string',0,0,'2023-08-24 12:48:58'),(2,'89690fb3-861d-4ebd-8a5b-41de29542b90','string','string',0,0,'2023-08-24 12:48:58'),(3,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558','externalReference','string',0,0,'2023-08-24 12:49:00'),(4,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558','string','string',0,0,'2023-08-24 12:49:00'),(5,'f15b363a-646b-4f8e-b6a3-92a5f62ead90','externalReference','string',0,0,'2023-08-24 12:49:09'),(6,'f15b363a-646b-4f8e-b6a3-92a5f62ead90','string','string',0,0,'2023-08-24 12:49:09'),(7,'cc69723b-b433-4dd9-8127-baaa378c33e4','externalReference','string',0,0,'2023-08-24 12:49:10'),(8,'cc69723b-b433-4dd9-8127-baaa378c33e4','string','string',0,0,'2023-08-24 12:49:10'),(9,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5','externalReference','string',0,0,'2023-08-24 12:49:19'),(10,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5','string','string',0,0,'2023-08-24 12:49:19'),(11,'a99d3f47-ed9a-4d69-9979-c13c3939a18c','externalReference','string',0,0,'2023-08-24 12:49:20'),(12,'a99d3f47-ed9a-4d69-9979-c13c3939a18c','string','string',0,0,'2023-08-24 12:49:20'),(13,'346519ef-62fa-4dce-9877-1eb211f52c7a','externalReference','string',0,0,'2023-08-24 12:49:29'),(14,'346519ef-62fa-4dce-9877-1eb211f52c7a','string','string',0,0,'2023-08-24 12:49:29'),(15,'add6a4a9-e9cb-4a57-8f64-9389d270c820','externalReference','string',0,0,'2023-08-24 12:49:30'),(16,'add6a4a9-e9cb-4a57-8f64-9389d270c820','string','string',0,0,'2023-08-24 12:49:30'),(17,'8ecb5d86-dc24-4d91-87e5-062f89b25a17','externalReference','string',0,0,'2023-08-24 12:49:39'),(18,'8ecb5d86-dc24-4d91-87e5-062f89b25a17','string','string',0,0,'2023-08-24 12:49:39'),(19,'e5dc2bff-5bdd-4509-906a-30710938be31','externalReference','string',0,0,'2023-08-24 12:49:40'),(20,'e5dc2bff-5bdd-4509-906a-30710938be31','string','string',0,0,'2023-08-24 12:49:40'),(21,'428fdb87-20b3-44b6-992d-0e8b1d660dfa','externalReference','string',0,0,'2023-08-24 12:49:49'),(22,'428fdb87-20b3-44b6-992d-0e8b1d660dfa','string','string',0,0,'2023-08-24 12:49:49'),(23,'bc7db59b-4d96-459f-8305-154950153bd7','externalReference','string',0,0,'2023-08-24 12:49:51'),(24,'bc7db59b-4d96-459f-8305-154950153bd7','string','string',0,0,'2023-08-24 12:49:51'),(25,'8ee55b65-c713-4083-b653-3be63a03e2ff','externalReference','string',0,0,'2023-08-24 12:50:00'),(26,'8ee55b65-c713-4083-b653-3be63a03e2ff','string','string',0,0,'2023-08-24 12:50:00'),(27,'673b72e2-5d33-4c3d-8351-eea28f5afa1c','externalReference','string',0,0,'2023-08-24 12:50:01'),(28,'673b72e2-5d33-4c3d-8351-eea28f5afa1c','string','string',0,0,'2023-08-24 12:50:01'),(29,'08fdf211-fca5-4d24-b332-1e752865ae8f','externalReference','string',0,0,'2023-08-24 12:50:10'),(30,'08fdf211-fca5-4d24-b332-1e752865ae8f','string','string',0,0,'2023-08-24 12:50:10'),(31,'8ac99640-f54b-4d74-bf7c-c2018761e0f6','externalReference','string',0,0,'2023-08-24 12:50:11'),(32,'8ac99640-f54b-4d74-bf7c-c2018761e0f6','string','string',0,0,'2023-08-24 12:50:11'),(33,'0395c4af-8a54-4105-a025-aa04d983a5b6','externalReference','string',0,0,'2023-08-24 12:50:25'),(34,'0395c4af-8a54-4105-a025-aa04d983a5b6','string','string',0,0,'2023-08-24 12:50:25'),(35,'d4769372-c37d-4bd8-a118-1872cf98271d','externalReference','string',0,0,'2023-08-24 12:50:26'),(36,'d4769372-c37d-4bd8-a118-1872cf98271d','string','string',0,0,'2023-08-24 12:50:26');
/*!40000 ALTER TABLE `transferExtension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferFulfilment`
--

DROP TABLE IF EXISTS `transferFulfilment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferFulfilment` (
  `transferId` varchar(36) NOT NULL,
  `ilpFulfilment` varchar(256) DEFAULT NULL,
  `completedDate` datetime NOT NULL,
  `isValid` tinyint(1) DEFAULT NULL,
  `settlementWindowId` bigint unsigned DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferId`),
  KEY `transferfulfilment_settlementwindowid_foreign` (`settlementWindowId`),
  CONSTRAINT `transferfulfilment_settlementwindowid_foreign` FOREIGN KEY (`settlementWindowId`) REFERENCES `settlementWindow` (`settlementWindowId`),
  CONSTRAINT `transferfulfilment_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transferFulfilmentDuplicateCheck` (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferFulfilment`
--

LOCK TABLES `transferFulfilment` WRITE;
/*!40000 ALTER TABLE `transferFulfilment` DISABLE KEYS */;
INSERT INTO `transferFulfilment` VALUES ('0395c4af-8a54-4105-a025-aa04d983a5b6','0','2023-08-24 12:50:25',1,NULL,'2023-08-24 12:50:25'),('08fdf211-fca5-4d24-b332-1e752865ae8f','0','2023-08-24 12:50:10',1,NULL,'2023-08-24 12:50:10'),('0ea8ca50-ba6f-4f4b-a25a-a427182164f5','0','2023-08-24 12:49:19',1,NULL,'2023-08-24 12:49:19'),('346519ef-62fa-4dce-9877-1eb211f52c7a','0','2023-08-24 12:49:29',1,NULL,'2023-08-24 12:49:29'),('428fdb87-20b3-44b6-992d-0e8b1d660dfa','0','2023-08-24 12:49:49',1,NULL,'2023-08-24 12:49:49'),('673b72e2-5d33-4c3d-8351-eea28f5afa1c','0','2023-08-24 12:50:01',1,NULL,'2023-08-24 12:50:01'),('89690fb3-861d-4ebd-8a5b-41de29542b90','0','2023-08-24 12:48:58',1,NULL,'2023-08-24 12:48:58'),('8ac99640-f54b-4d74-bf7c-c2018761e0f6','0','2023-08-24 12:50:11',1,NULL,'2023-08-24 12:50:11'),('8ecb5d86-dc24-4d91-87e5-062f89b25a17','0','2023-08-24 12:49:39',1,NULL,'2023-08-24 12:49:39'),('8ee55b65-c713-4083-b653-3be63a03e2ff','0','2023-08-24 12:50:00',1,NULL,'2023-08-24 12:50:00'),('a99d3f47-ed9a-4d69-9979-c13c3939a18c','0','2023-08-24 12:49:20',1,NULL,'2023-08-24 12:49:20'),('add6a4a9-e9cb-4a57-8f64-9389d270c820','0','2023-08-24 12:49:30',1,NULL,'2023-08-24 12:49:30'),('bbf3ee55-bdc7-4e6f-b836-2b456e86c558','0','2023-08-24 12:49:00',1,NULL,'2023-08-24 12:49:00'),('bc7db59b-4d96-459f-8305-154950153bd7','0','2023-08-24 12:49:51',1,NULL,'2023-08-24 12:49:51'),('cc69723b-b433-4dd9-8127-baaa378c33e4','0','2023-08-24 12:49:10',1,NULL,'2023-08-24 12:49:10'),('d4769372-c37d-4bd8-a118-1872cf98271d','0','2023-08-24 12:50:26',1,NULL,'2023-08-24 12:50:26'),('e5dc2bff-5bdd-4509-906a-30710938be31','0','2023-08-24 12:49:40',1,NULL,'2023-08-24 12:49:40'),('f15b363a-646b-4f8e-b6a3-92a5f62ead90','0','2023-08-24 12:49:09',1,NULL,'2023-08-24 12:49:09');
/*!40000 ALTER TABLE `transferFulfilment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferFulfilmentDuplicateCheck`
--

DROP TABLE IF EXISTS `transferFulfilmentDuplicateCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferFulfilmentDuplicateCheck` (
  `transferId` varchar(36) NOT NULL,
  `hash` varchar(256) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferId`),
  CONSTRAINT `transferfulfilmentduplicatecheck_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferFulfilmentDuplicateCheck`
--

LOCK TABLES `transferFulfilmentDuplicateCheck` WRITE;
/*!40000 ALTER TABLE `transferFulfilmentDuplicateCheck` DISABLE KEYS */;
INSERT INTO `transferFulfilmentDuplicateCheck` VALUES ('0395c4af-8a54-4105-a025-aa04d983a5b6',NULL,'2023-08-24 12:50:25'),('08fdf211-fca5-4d24-b332-1e752865ae8f',NULL,'2023-08-24 12:50:10'),('0ea8ca50-ba6f-4f4b-a25a-a427182164f5',NULL,'2023-08-24 12:49:18'),('346519ef-62fa-4dce-9877-1eb211f52c7a',NULL,'2023-08-24 12:49:28'),('428fdb87-20b3-44b6-992d-0e8b1d660dfa',NULL,'2023-08-24 12:49:49'),('673b72e2-5d33-4c3d-8351-eea28f5afa1c',NULL,'2023-08-24 12:50:00'),('89690fb3-861d-4ebd-8a5b-41de29542b90',NULL,'2023-08-24 12:48:58'),('8ac99640-f54b-4d74-bf7c-c2018761e0f6',NULL,'2023-08-24 12:50:11'),('8ecb5d86-dc24-4d91-87e5-062f89b25a17',NULL,'2023-08-24 12:49:39'),('8ee55b65-c713-4083-b653-3be63a03e2ff',NULL,'2023-08-24 12:49:59'),('a99d3f47-ed9a-4d69-9979-c13c3939a18c',NULL,'2023-08-24 12:49:19'),('add6a4a9-e9cb-4a57-8f64-9389d270c820',NULL,'2023-08-24 12:49:29'),('bbf3ee55-bdc7-4e6f-b836-2b456e86c558',NULL,'2023-08-24 12:48:59'),('bc7db59b-4d96-459f-8305-154950153bd7',NULL,'2023-08-24 12:49:50'),('cc69723b-b433-4dd9-8127-baaa378c33e4',NULL,'2023-08-24 12:49:09'),('d4769372-c37d-4bd8-a118-1872cf98271d',NULL,'2023-08-24 12:50:26'),('e5dc2bff-5bdd-4509-906a-30710938be31',NULL,'2023-08-24 12:49:40'),('f15b363a-646b-4f8e-b6a3-92a5f62ead90',NULL,'2023-08-24 12:49:08');
/*!40000 ALTER TABLE `transferFulfilmentDuplicateCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferParticipant`
--

DROP TABLE IF EXISTS `transferParticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferParticipant` (
  `transferParticipantId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transferId` varchar(36) NOT NULL,
  `participantCurrencyId` int unsigned NOT NULL,
  `transferParticipantRoleTypeId` int unsigned NOT NULL,
  `ledgerEntryTypeId` int unsigned NOT NULL,
  `amount` decimal(18,4) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferParticipantId`),
  KEY `transferparticipant_transferid_index` (`transferId`),
  KEY `transferparticipant_participantcurrencyid_index` (`participantCurrencyId`),
  KEY `transferparticipant_transferparticipantroletypeid_index` (`transferParticipantRoleTypeId`),
  KEY `transferparticipant_ledgerentrytypeid_index` (`ledgerEntryTypeId`),
  KEY `getTransferInfoToChangePosition` (`transferId`,`transferParticipantRoleTypeId`,`ledgerEntryTypeId`),
  CONSTRAINT `transferparticipant_ledgerentrytypeid_foreign` FOREIGN KEY (`ledgerEntryTypeId`) REFERENCES `ledgerEntryType` (`ledgerEntryTypeId`),
  CONSTRAINT `transferparticipant_participantcurrencyid_foreign` FOREIGN KEY (`participantCurrencyId`) REFERENCES `participantCurrency` (`participantCurrencyId`),
  CONSTRAINT `transferparticipant_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`),
  CONSTRAINT `transferparticipant_transferparticipantroletypeid_foreign` FOREIGN KEY (`transferParticipantRoleTypeId`) REFERENCES `transferParticipantRoleType` (`transferParticipantRoleTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferParticipant`
--

LOCK TABLES `transferParticipant` WRITE;
/*!40000 ALTER TABLE `transferParticipant` DISABLE KEYS */;
INSERT INTO `transferParticipant` VALUES (1,'89690fb3-861d-4ebd-8a5b-41de29542b90',2,3,9,5000000.0000,'2023-08-24 12:48:58'),(2,'89690fb3-861d-4ebd-8a5b-41de29542b90',8,4,9,-5000000.0000,'2023-08-24 12:48:58'),(3,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558',4,3,9,5000000.0000,'2023-08-24 12:49:00'),(4,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558',10,4,9,-5000000.0000,'2023-08-24 12:49:00'),(5,'f15b363a-646b-4f8e-b6a3-92a5f62ead90',2,3,9,5000000.0000,'2023-08-24 12:49:09'),(6,'f15b363a-646b-4f8e-b6a3-92a5f62ead90',16,4,9,-5000000.0000,'2023-08-24 12:49:09'),(7,'cc69723b-b433-4dd9-8127-baaa378c33e4',4,3,9,5000000.0000,'2023-08-24 12:49:10'),(8,'cc69723b-b433-4dd9-8127-baaa378c33e4',18,4,9,-5000000.0000,'2023-08-24 12:49:10'),(9,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5',2,3,9,5000000.0000,'2023-08-24 12:49:19'),(10,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5',24,4,9,-5000000.0000,'2023-08-24 12:49:19'),(11,'a99d3f47-ed9a-4d69-9979-c13c3939a18c',4,3,9,5000000.0000,'2023-08-24 12:49:20'),(12,'a99d3f47-ed9a-4d69-9979-c13c3939a18c',26,4,9,-5000000.0000,'2023-08-24 12:49:20'),(13,'346519ef-62fa-4dce-9877-1eb211f52c7a',2,3,9,5000000.0000,'2023-08-24 12:49:29'),(14,'346519ef-62fa-4dce-9877-1eb211f52c7a',32,4,9,-5000000.0000,'2023-08-24 12:49:29'),(15,'add6a4a9-e9cb-4a57-8f64-9389d270c820',4,3,9,5000000.0000,'2023-08-24 12:49:30'),(16,'add6a4a9-e9cb-4a57-8f64-9389d270c820',34,4,9,-5000000.0000,'2023-08-24 12:49:30'),(17,'8ecb5d86-dc24-4d91-87e5-062f89b25a17',2,3,9,5000000.0000,'2023-08-24 12:49:39'),(18,'8ecb5d86-dc24-4d91-87e5-062f89b25a17',40,4,9,-5000000.0000,'2023-08-24 12:49:39'),(19,'e5dc2bff-5bdd-4509-906a-30710938be31',4,3,9,5000000.0000,'2023-08-24 12:49:40'),(20,'e5dc2bff-5bdd-4509-906a-30710938be31',42,4,9,-5000000.0000,'2023-08-24 12:49:40'),(21,'428fdb87-20b3-44b6-992d-0e8b1d660dfa',2,3,9,5000000.0000,'2023-08-24 12:49:49'),(22,'428fdb87-20b3-44b6-992d-0e8b1d660dfa',48,4,9,-5000000.0000,'2023-08-24 12:49:49'),(23,'bc7db59b-4d96-459f-8305-154950153bd7',4,3,9,5000000.0000,'2023-08-24 12:49:51'),(24,'bc7db59b-4d96-459f-8305-154950153bd7',50,4,9,-5000000.0000,'2023-08-24 12:49:51'),(25,'8ee55b65-c713-4083-b653-3be63a03e2ff',2,3,9,5000000.0000,'2023-08-24 12:50:00'),(26,'8ee55b65-c713-4083-b653-3be63a03e2ff',56,4,9,-5000000.0000,'2023-08-24 12:50:00'),(27,'673b72e2-5d33-4c3d-8351-eea28f5afa1c',4,3,9,5000000.0000,'2023-08-24 12:50:01'),(28,'673b72e2-5d33-4c3d-8351-eea28f5afa1c',58,4,9,-5000000.0000,'2023-08-24 12:50:01'),(29,'08fdf211-fca5-4d24-b332-1e752865ae8f',2,3,9,5000000.0000,'2023-08-24 12:50:10'),(30,'08fdf211-fca5-4d24-b332-1e752865ae8f',64,4,9,-5000000.0000,'2023-08-24 12:50:10'),(31,'8ac99640-f54b-4d74-bf7c-c2018761e0f6',4,3,9,5000000.0000,'2023-08-24 12:50:11'),(32,'8ac99640-f54b-4d74-bf7c-c2018761e0f6',66,4,9,-5000000.0000,'2023-08-24 12:50:11'),(33,'0395c4af-8a54-4105-a025-aa04d983a5b6',2,3,9,5000000.0000,'2023-08-24 12:50:25'),(34,'0395c4af-8a54-4105-a025-aa04d983a5b6',80,4,9,-5000000.0000,'2023-08-24 12:50:25'),(35,'d4769372-c37d-4bd8-a118-1872cf98271d',4,3,9,5000000.0000,'2023-08-24 12:50:26'),(36,'d4769372-c37d-4bd8-a118-1872cf98271d',82,4,9,-5000000.0000,'2023-08-24 12:50:26');
/*!40000 ALTER TABLE `transferParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferParticipantRoleType`
--

DROP TABLE IF EXISTS `transferParticipantRoleType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferParticipantRoleType` (
  `transferParticipantRoleTypeId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferParticipantRoleTypeId`),
  UNIQUE KEY `transferparticipantroletype_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferParticipantRoleType`
--

LOCK TABLES `transferParticipantRoleType` WRITE;
/*!40000 ALTER TABLE `transferParticipantRoleType` DISABLE KEYS */;
INSERT INTO `transferParticipantRoleType` VALUES (1,'PAYER_DFSP','The participant is the Payer DFSP in this transfer and is sending the funds',1,'2023-08-24 12:47:33'),(2,'PAYEE_DFSP','The participant is the Payee DFSP in this transfer and is receiving the funds',1,'2023-08-24 12:47:33'),(3,'HUB','The participant is representing the Hub Operator',1,'2023-08-24 12:47:33'),(4,'DFSP_SETTLEMENT','Indicates the settlement account',1,'2023-08-24 12:47:33'),(5,'DFSP_POSITION','Indicates the position account',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `transferParticipantRoleType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferRules`
--

DROP TABLE IF EXISTS `transferRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferRules` (
  `transferRulesId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `rule` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferRulesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferRules`
--

LOCK TABLES `transferRules` WRITE;
/*!40000 ALTER TABLE `transferRules` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferState`
--

DROP TABLE IF EXISTS `transferState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferState` (
  `transferStateId` varchar(50) NOT NULL,
  `enumeration` varchar(50) NOT NULL COMMENT 'transferState associated to the Mojaloop API',
  `description` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferStateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferState`
--

LOCK TABLES `transferState` WRITE;
/*!40000 ALTER TABLE `transferState` DISABLE KEYS */;
INSERT INTO `transferState` VALUES ('ABORTED_ERROR','ABORTED','The switch has aborted a transfer due to being RECEIVED_ERROR',1,'2023-08-24 12:47:33'),('ABORTED_REJECTED','ABORTED','The switch has aborted a transfer due to being RECEIVED_REJECT.',1,'2023-08-24 12:47:33'),('COMMITTED','COMMITTED','The switch has successfully performed the transfer.',1,'2023-08-24 12:47:33'),('EXPIRED_PREPARED','ABORTED','The switch has aborted the transfer due to being EXPIRED transfer from RECEIVED_PREPARE.',1,'2023-08-24 12:47:33'),('EXPIRED_RESERVED','ABORTED','The switch has aborted the transfer due to being EXPIRED transfer from RESERVED.',1,'2023-08-24 12:47:33'),('FAILED','ABORTED','Aborted the transfer due to failure to perform the transfer.',1,'2023-08-24 12:47:33'),('INVALID','ABORTED','The switch has aborted the transfer due to validation failure.',1,'2023-08-24 12:47:33'),('RECEIVED_ERROR','RESERVED','The switch has received a transfer error callback',1,'2023-08-24 12:47:33'),('RECEIVED_FULFIL','RESERVED','The switch has reserved the transfer, and has been assigned to a settlement window.',1,'2023-08-24 12:47:33'),('RECEIVED_PREPARE','RECEIVED','The switch has received the transfer.',1,'2023-08-24 12:47:33'),('RECEIVED_REJECT','RESERVED','The switch has received a transfer abort from payee fsp.',1,'2023-08-24 12:47:33'),('RESERVED','RESERVED','The switch has reserved the transfer.',1,'2023-08-24 12:47:33'),('RESERVED_TIMEOUT','RESERVED','Expiring the transfer and returning funds to payer fsp.',1,'2023-08-24 12:47:33'),('SETTLED','SETTLED','The switch has settled the transfer.',1,'2023-08-24 12:47:33');
/*!40000 ALTER TABLE `transferState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferStateChange`
--

DROP TABLE IF EXISTS `transferStateChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferStateChange` (
  `transferStateChangeId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transferId` varchar(36) NOT NULL,
  `transferStateId` varchar(50) NOT NULL,
  `reason` varchar(512) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferStateChangeId`),
  KEY `transferstatechange_transferid_index` (`transferId`),
  KEY `transferstatechange_transferstateid_index` (`transferStateId`),
  CONSTRAINT `transferstatechange_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`),
  CONSTRAINT `transferstatechange_transferstateid_foreign` FOREIGN KEY (`transferStateId`) REFERENCES `transferState` (`transferStateId`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferStateChange`
--

LOCK TABLES `transferStateChange` WRITE;
/*!40000 ALTER TABLE `transferStateChange` DISABLE KEYS */;
INSERT INTO `transferStateChange` VALUES (1,'89690fb3-861d-4ebd-8a5b-41de29542b90','RECEIVED_PREPARE','string','2023-08-24 12:48:58'),(2,'89690fb3-861d-4ebd-8a5b-41de29542b90','RESERVED','string','2023-08-24 12:48:58'),(3,'89690fb3-861d-4ebd-8a5b-41de29542b90','RECEIVED_FULFIL','string','2023-08-24 12:48:58'),(4,'89690fb3-861d-4ebd-8a5b-41de29542b90','COMMITTED','string','2023-08-24 12:48:58'),(5,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558','RECEIVED_PREPARE','string','2023-08-24 12:49:00'),(6,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558','RESERVED','string','2023-08-24 12:49:00'),(7,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558','RECEIVED_FULFIL','string','2023-08-24 12:49:00'),(8,'bbf3ee55-bdc7-4e6f-b836-2b456e86c558','COMMITTED','string','2023-08-24 12:49:00'),(9,'f15b363a-646b-4f8e-b6a3-92a5f62ead90','RECEIVED_PREPARE','string','2023-08-24 12:49:09'),(10,'f15b363a-646b-4f8e-b6a3-92a5f62ead90','RESERVED','string','2023-08-24 12:49:09'),(11,'f15b363a-646b-4f8e-b6a3-92a5f62ead90','RECEIVED_FULFIL','string','2023-08-24 12:49:09'),(12,'f15b363a-646b-4f8e-b6a3-92a5f62ead90','COMMITTED','string','2023-08-24 12:49:09'),(13,'cc69723b-b433-4dd9-8127-baaa378c33e4','RECEIVED_PREPARE','string','2023-08-24 12:49:10'),(14,'cc69723b-b433-4dd9-8127-baaa378c33e4','RESERVED','string','2023-08-24 12:49:10'),(15,'cc69723b-b433-4dd9-8127-baaa378c33e4','RECEIVED_FULFIL','string','2023-08-24 12:49:10'),(16,'cc69723b-b433-4dd9-8127-baaa378c33e4','COMMITTED','string','2023-08-24 12:49:10'),(17,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5','RECEIVED_PREPARE','string','2023-08-24 12:49:19'),(18,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5','RESERVED','string','2023-08-24 12:49:19'),(19,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5','RECEIVED_FULFIL','string','2023-08-24 12:49:19'),(20,'0ea8ca50-ba6f-4f4b-a25a-a427182164f5','COMMITTED','string','2023-08-24 12:49:19'),(21,'a99d3f47-ed9a-4d69-9979-c13c3939a18c','RECEIVED_PREPARE','string','2023-08-24 12:49:20'),(22,'a99d3f47-ed9a-4d69-9979-c13c3939a18c','RESERVED','string','2023-08-24 12:49:20'),(23,'a99d3f47-ed9a-4d69-9979-c13c3939a18c','RECEIVED_FULFIL','string','2023-08-24 12:49:20'),(24,'a99d3f47-ed9a-4d69-9979-c13c3939a18c','COMMITTED','string','2023-08-24 12:49:20'),(25,'346519ef-62fa-4dce-9877-1eb211f52c7a','RECEIVED_PREPARE','string','2023-08-24 12:49:29'),(26,'346519ef-62fa-4dce-9877-1eb211f52c7a','RESERVED','string','2023-08-24 12:49:29'),(27,'346519ef-62fa-4dce-9877-1eb211f52c7a','RECEIVED_FULFIL','string','2023-08-24 12:49:29'),(28,'346519ef-62fa-4dce-9877-1eb211f52c7a','COMMITTED','string','2023-08-24 12:49:29'),(29,'add6a4a9-e9cb-4a57-8f64-9389d270c820','RECEIVED_PREPARE','string','2023-08-24 12:49:30'),(30,'add6a4a9-e9cb-4a57-8f64-9389d270c820','RESERVED','string','2023-08-24 12:49:30'),(31,'add6a4a9-e9cb-4a57-8f64-9389d270c820','RECEIVED_FULFIL','string','2023-08-24 12:49:30'),(32,'add6a4a9-e9cb-4a57-8f64-9389d270c820','COMMITTED','string','2023-08-24 12:49:30'),(33,'8ecb5d86-dc24-4d91-87e5-062f89b25a17','RECEIVED_PREPARE','string','2023-08-24 12:49:39'),(34,'8ecb5d86-dc24-4d91-87e5-062f89b25a17','RESERVED','string','2023-08-24 12:49:39'),(35,'8ecb5d86-dc24-4d91-87e5-062f89b25a17','RECEIVED_FULFIL','string','2023-08-24 12:49:39'),(36,'8ecb5d86-dc24-4d91-87e5-062f89b25a17','COMMITTED','string','2023-08-24 12:49:39'),(37,'e5dc2bff-5bdd-4509-906a-30710938be31','RECEIVED_PREPARE','string','2023-08-24 12:49:40'),(38,'e5dc2bff-5bdd-4509-906a-30710938be31','RESERVED','string','2023-08-24 12:49:40'),(39,'e5dc2bff-5bdd-4509-906a-30710938be31','RECEIVED_FULFIL','string','2023-08-24 12:49:40'),(40,'e5dc2bff-5bdd-4509-906a-30710938be31','COMMITTED','string','2023-08-24 12:49:40'),(41,'428fdb87-20b3-44b6-992d-0e8b1d660dfa','RECEIVED_PREPARE','string','2023-08-24 12:49:49'),(42,'428fdb87-20b3-44b6-992d-0e8b1d660dfa','RESERVED','string','2023-08-24 12:49:49'),(43,'428fdb87-20b3-44b6-992d-0e8b1d660dfa','RECEIVED_FULFIL','string','2023-08-24 12:49:49'),(44,'428fdb87-20b3-44b6-992d-0e8b1d660dfa','COMMITTED','string','2023-08-24 12:49:49'),(45,'bc7db59b-4d96-459f-8305-154950153bd7','RECEIVED_PREPARE','string','2023-08-24 12:49:51'),(46,'bc7db59b-4d96-459f-8305-154950153bd7','RESERVED','string','2023-08-24 12:49:51'),(47,'bc7db59b-4d96-459f-8305-154950153bd7','RECEIVED_FULFIL','string','2023-08-24 12:49:51'),(48,'bc7db59b-4d96-459f-8305-154950153bd7','COMMITTED','string','2023-08-24 12:49:51'),(49,'8ee55b65-c713-4083-b653-3be63a03e2ff','RECEIVED_PREPARE','string','2023-08-24 12:50:00'),(50,'8ee55b65-c713-4083-b653-3be63a03e2ff','RESERVED','string','2023-08-24 12:50:00'),(51,'8ee55b65-c713-4083-b653-3be63a03e2ff','RECEIVED_FULFIL','string','2023-08-24 12:50:00'),(52,'8ee55b65-c713-4083-b653-3be63a03e2ff','COMMITTED','string','2023-08-24 12:50:00'),(53,'673b72e2-5d33-4c3d-8351-eea28f5afa1c','RECEIVED_PREPARE','string','2023-08-24 12:50:01'),(54,'673b72e2-5d33-4c3d-8351-eea28f5afa1c','RESERVED','string','2023-08-24 12:50:01'),(55,'673b72e2-5d33-4c3d-8351-eea28f5afa1c','RECEIVED_FULFIL','string','2023-08-24 12:50:01'),(56,'673b72e2-5d33-4c3d-8351-eea28f5afa1c','COMMITTED','string','2023-08-24 12:50:01'),(57,'08fdf211-fca5-4d24-b332-1e752865ae8f','RECEIVED_PREPARE','string','2023-08-24 12:50:10'),(58,'08fdf211-fca5-4d24-b332-1e752865ae8f','RESERVED','string','2023-08-24 12:50:10'),(59,'08fdf211-fca5-4d24-b332-1e752865ae8f','RECEIVED_FULFIL','string','2023-08-24 12:50:10'),(60,'08fdf211-fca5-4d24-b332-1e752865ae8f','COMMITTED','string','2023-08-24 12:50:10'),(61,'8ac99640-f54b-4d74-bf7c-c2018761e0f6','RECEIVED_PREPARE','string','2023-08-24 12:50:11'),(62,'8ac99640-f54b-4d74-bf7c-c2018761e0f6','RESERVED','string','2023-08-24 12:50:11'),(63,'8ac99640-f54b-4d74-bf7c-c2018761e0f6','RECEIVED_FULFIL','string','2023-08-24 12:50:11'),(64,'8ac99640-f54b-4d74-bf7c-c2018761e0f6','COMMITTED','string','2023-08-24 12:50:11'),(65,'0395c4af-8a54-4105-a025-aa04d983a5b6','RECEIVED_PREPARE','string','2023-08-24 12:50:25'),(66,'0395c4af-8a54-4105-a025-aa04d983a5b6','RESERVED','string','2023-08-24 12:50:25'),(67,'0395c4af-8a54-4105-a025-aa04d983a5b6','RECEIVED_FULFIL','string','2023-08-24 12:50:25'),(68,'0395c4af-8a54-4105-a025-aa04d983a5b6','COMMITTED','string','2023-08-24 12:50:25'),(69,'d4769372-c37d-4bd8-a118-1872cf98271d','RECEIVED_PREPARE','string','2023-08-24 12:50:26'),(70,'d4769372-c37d-4bd8-a118-1872cf98271d','RESERVED','string','2023-08-24 12:50:26'),(71,'d4769372-c37d-4bd8-a118-1872cf98271d','RECEIVED_FULFIL','string','2023-08-24 12:50:26'),(72,'d4769372-c37d-4bd8-a118-1872cf98271d','COMMITTED','string','2023-08-24 12:50:26');
/*!40000 ALTER TABLE `transferStateChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferTimeout`
--

DROP TABLE IF EXISTS `transferTimeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferTimeout` (
  `transferTimeoutId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transferId` varchar(36) NOT NULL,
  `expirationDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transferTimeoutId`),
  UNIQUE KEY `transfertimeout_transferid_unique` (`transferId`),
  CONSTRAINT `transfertimeout_transferid_foreign` FOREIGN KEY (`transferId`) REFERENCES `transfer` (`transferId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferTimeout`
--

LOCK TABLES `transferTimeout` WRITE;
/*!40000 ALTER TABLE `transferTimeout` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferTimeout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `quotePartyView`
--

/*!50001 DROP VIEW IF EXISTS `quotePartyView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`central_ledger`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `quotePartyView` AS select `qp`.`quoteId` AS `quoteId`,`qp`.`quotePartyId` AS `quotePartyId`,`pt`.`name` AS `partyType`,`pit`.`name` AS `identifierType`,`qp`.`partyIdentifierValue` AS `partyIdentifierValue`,`qp`.`partySubIdOrTypeId` AS `partySubIdOrType`,`qp`.`fspId` AS `fspId`,`qp`.`merchantClassificationCode` AS `merchantClassificationCode`,`qp`.`partyName` AS `partyName`,`p`.`firstName` AS `firstName`,`p`.`lastName` AS `lastName`,`p`.`middleName` AS `middleName`,`p`.`dateOfBirth` AS `dateOfBirth`,`gc`.`longitude` AS `longitude`,`gc`.`latitude` AS `latitude` from ((((`quoteParty` `qp` join `partyType` `pt` on((`pt`.`partyTypeId` = `qp`.`partyTypeId`))) join `partyIdentifierType` `pit` on((`pit`.`partyIdentifierTypeId` = `qp`.`partyIdentifierTypeId`))) left join `party` `p` on((`p`.`quotePartyId` = `qp`.`quotePartyId`))) left join `geoCode` `gc` on((`gc`.`quotePartyId` = `qp`.`quotePartyId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quoteResponseView`
--

/*!50001 DROP VIEW IF EXISTS `quoteResponseView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`central_ledger`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `quoteResponseView` AS select `qr`.`quoteResponseId` AS `quoteResponseId`,`qr`.`quoteId` AS `quoteId`,`qr`.`transferAmountCurrencyId` AS `transferAmountCurrencyId`,`qr`.`transferAmount` AS `transferAmount`,`qr`.`payeeReceiveAmountCurrencyId` AS `payeeReceiveAmountCurrencyId`,`qr`.`payeeReceiveAmount` AS `payeeReceiveAmount`,`qr`.`payeeFspFeeCurrencyId` AS `payeeFspFeeCurrencyId`,`qr`.`payeeFspFeeAmount` AS `payeeFspFeeAmount`,`qr`.`payeeFspCommissionCurrencyId` AS `payeeFspCommissionCurrencyId`,`qr`.`payeeFspCommissionAmount` AS `payeeFspCommissionAmount`,`qr`.`ilpCondition` AS `ilpCondition`,`qr`.`responseExpirationDate` AS `responseExpirationDate`,`qr`.`isValid` AS `isValid`,`qr`.`createdDate` AS `createdDate`,`qrilp`.`value` AS `ilpPacket`,`gc`.`longitude` AS `longitude`,`gc`.`latitude` AS `latitude` from ((((`quoteResponse` `qr` join `quoteResponseIlpPacket` `qrilp` on((`qrilp`.`quoteResponseId` = `qr`.`quoteResponseId`))) join `quoteParty` `qp` on((`qp`.`quoteId` = `qr`.`quoteId`))) join `partyType` `pt` on((`pt`.`partyTypeId` = `qp`.`partyTypeId`))) left join `geoCode` `gc` on((`gc`.`quotePartyId` = `qp`.`quotePartyId`))) where (`pt`.`name` = 'PAYEE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quoteView`
--

/*!50001 DROP VIEW IF EXISTS `quoteView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`central_ledger`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `quoteView` AS select `q`.`quoteId` AS `quoteId`,`q`.`transactionReferenceId` AS `transactionReferenceId`,`q`.`transactionRequestId` AS `transactionRequestId`,`q`.`note` AS `note`,`q`.`expirationDate` AS `expirationDate`,`ti`.`name` AS `transactionInitiator`,`tit`.`name` AS `transactionInitiatorType`,`ts`.`name` AS `transactionScenario`,`q`.`balanceOfPaymentsId` AS `balanceOfPaymentsId`,`tss`.`name` AS `transactionSubScenario`,`amt`.`name` AS `amountType`,`q`.`amount` AS `amount`,`q`.`currencyId` AS `currency` from (((((`quote` `q` join `transactionInitiator` `ti` on((`ti`.`transactionInitiatorId` = `q`.`transactionInitiatorId`))) join `transactionInitiatorType` `tit` on((`tit`.`transactionInitiatorTypeId` = `q`.`transactionInitiatorTypeId`))) join `transactionScenario` `ts` on((`ts`.`transactionScenarioId` = `q`.`transactionScenarioId`))) join `amountType` `amt` on((`amt`.`amountTypeId` = `q`.`amountTypeId`))) left join `transactionSubScenario` `tss` on((`tss`.`transactionSubScenarioId` = `q`.`transactionSubScenarioId`))) */;
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

-- Dump completed on 2023-08-24 12:54:08
