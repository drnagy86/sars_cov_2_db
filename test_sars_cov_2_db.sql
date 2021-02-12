-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sars_cov_2
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sars_cov_2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sars_cov_2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sars_cov_2`;

--
-- Table structure for table `change_log`
--

DROP TABLE IF EXISTS `change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `change_log` (
  `log_date` datetime NOT NULL COMMENT 'The date of the change',
  `log_user` varchar(50) NOT NULL COMMENT 'The user who made the change',
  `log_table` varchar(20) NOT NULL COMMENT 'The table that was changed',
  `log_change_type` enum('U','D') NOT NULL COMMENT 'Update or delete',
  `log_sample` varchar(9) DEFAULT NULL COMMENT 'sample number associated with the record',
  `log_change` varchar(500) DEFAULT NULL COMMENT 'The information as it was before the change was made.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table containing a log of the changes to the database';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_log`
--

LOCK TABLES `change_log` WRITE;
/*!40000 ALTER TABLE `change_log` DISABLE KEYS */;
INSERT INTO `change_log` VALUES ('2020-12-13 19:13:59','root@localhost','check_in','U','CV2000000','[need_re_sample , N][subject_contacted , Y]'),('2020-12-13 19:16:31','root@localhost','check_in','U','CV2000000','[need_re_sample , N][subject_contacted , Y]'),('2020-12-13 19:16:33','root@localhost','qc','U','CV2000000','[gel_image , N/A]'),('2020-12-13 19:16:34','root@localhost','qc','U','CV2000003','[gel_image , N/A]'),('2020-12-13 19:16:35','root@localhost','qc','U','CV2000003','[gel_image , wooo]'),('2020-12-13 19:16:36','root@localhost','storage_box','U','CV2000000','[sample_stored , fridge 1 ][box_label , A ][box_coordinates , 1]'),('2020-12-13 19:16:37','root@localhost','storage_box','U','CV2000002','[sample_stored , fridge 2 ][box_label , C ][box_coordinates , 2]'),('2020-12-13 19:16:38','root@localhost','storage_box','U','CV2000003','[sample_stored , fridge 1 ][box_label , C ][box_coordinates , 3]'),('2020-12-13 19:16:39','root@localhost','storage_box','U','CV2000000','[sample_stored , freezer 1 ][box_label , C ][box_coordinates , 99]'),('2020-12-13 19:16:41','root@localhost','subject_demographics','U','CV2000000','[days_hosp , 7 ][treat1 , remdesivir ]'),('2020-12-13 19:16:42','root@localhost','subject_demographics','U','CV2000004','[days_hosp , 14 ][treat1 , ventilator ]'),('2020-12-13 19:16:43','root@localhost','subject_demographics','U','CV2000000','[days_hosp , 30 ][treat1 , remdesivir ]'),('2020-12-13 19:16:44','root@localhost','subject_demographics','U','CV2000004','[days_hosp , 30 ][treat1 , ventilator ]'),('2020-12-13 19:19:45','root@localhost','extraction','D','CV2000003','[date_of_extraction , 2020-08-30 ][extracted_by , ESP ]'),('2020-12-13 19:19:47','root@localhost','qc','D','CV2000003','[concentration , 22.00 ][vol_of_hydration_buffer , 800.00 ][amt_of_dna , 17.60][frag_gel , N][date_of_gel , 2020-08-15][lane_number , 1][gel_image , desktop/image/gelCV2000003.img]'),('2020-12-13 19:19:50','root@localhost','storage_box','D','CV2000003','[sample_stored , storage3 ][box_label , label2 ][box_coordinates , 25.11]'),('2020-12-13 19:19:52','root@localhost','sequencing','D','CV2000003','[sequencing_company , Lab Corp ][sequence_batch , 21 ][amt_of_dna_sent , 17.60][date_mailed , 2020-08-30][date_returned , 2020-09-06][fastq_file_name , abc4.fastq][quality_date_filename , abc4.qd][bam_file_name , abc4.bam][vcf_file_name , abc4.vcf][sequencing_stored , area52]'),('2020-12-13 19:19:54','root@localhost','subject_demographics','D','CV2000003','[gender , F ][age , 8 ][covid_test , antibody ][days_hosp , 0][cbc , 4.30][treat1 , nothing][severity , asymptomatic]'),('2020-12-13 19:22:35','root@localhost','symptoms_lookup','D',NULL,'[symp_code , sym11 ][symp_descrip , Enanthem ]'),('2020-12-13 19:29:43','root@localhost','conditions_lookup','D',NULL,'[cond_code , cond05 ][cond_descrip , Diabetes ]'),('2020-12-28 10:28:43','root@localhost','check_in','U','CV2000007','[need_re_sample , N][subject_contacted , N]'),('2020-12-28 10:52:12','root@localhost','check_in','D','CV2000008',NULL),('2020-12-28 10:52:26','root@localhost','check_in','D','CV2000009',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000010',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000011',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000012',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000013',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000014',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000015',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000016',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000017',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000018',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000019',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000020',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000021',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000022',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000023',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000024',NULL),('2020-12-28 10:55:30','root@localhost','check_in','D','CV2000025',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000008',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000009',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000010',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000011',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000012',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000013',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000014',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000015',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000016',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000017',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000018',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000019',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000020',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000021',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000022',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000023',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000024',NULL),('2020-12-28 11:11:37','root@localhost','check_in','D','CV2000025',NULL);
/*!40000 ALTER TABLE `change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in`
--

DROP TABLE IF EXISTS `check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `check_in` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, X being a number',
  `sample_type` enum('blood','saliva','swab') NOT NULL DEFAULT 'saliva' COMMENT 'sample type. Example, saliva',
  `date_sample_received` date NOT NULL COMMENT 'date the sample was received',
  `sample_condition_notes` varchar(100) NOT NULL COMMENT 'notes about the condition of the sample. Example, sample dark brown in color. Cannot accept null for logging purposes.',
  `need_re_sample` enum('Y','N') NOT NULL COMMENT 'does the sample need to be done again',
  `subject_contacted` enum('Y','N','not contacted','contacted-pending response','contacted-resample pending','contacted-unwilling to resample') DEFAULT NULL COMMENT 'was the sample no good and the subject contacted for a resample',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`),
  UNIQUE KEY `sample_number` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table that starts the process of putting in a sample';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in`
--

LOCK TABLES `check_in` WRITE;
/*!40000 ALTER TABLE `check_in` DISABLE KEYS */;
INSERT INTO `check_in` VALUES ('CV2000000','saliva','2020-07-28','Sample Dark Brown in Color','N','N','2020-12-13','root@localhost'),('CV2000001','saliva','2020-07-28','','N','Y','2020-12-13','root@localhost'),('CV2000002','saliva','2020-08-28','','N','Y','2020-12-13','root@localhost'),('CV2000003','saliva','2020-08-30','Small ammount','N','Y','2020-12-13','root@localhost'),('CV2000004','saliva','2020-08-30','Sample Red in color','N','Y','2020-12-13','root@localhost'),('CV2000005','blood','2020-07-28','','N','N','2020-12-13','root@localhost'),('CV2000006','blood','2020-12-03','','Y','N','2020-12-13','root@localhost'),('CV2000007','blood','2020-12-09','','N','N','2020-12-13','root@localhost');
/*!40000 ALTER TABLE `check_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_check_in_log_update` AFTER UPDATE ON `check_in` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_sars_cov_2-2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'check_in'
        , 'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'need_re_sample ', ', ' , OLD.need_re_sample, ']'
            , '[' , 'subject_contacted ', ', ', OLD.subject_contacted , ']'
				) -- end concat
	);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_check_in_log_delete` AFTER DELETE ON `check_in` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW() -- log date
		, SYSTEM_USER() -- log_user
		, 'check_in' -- log_table
        , 'D' -- log_change_type
        , OLD.sample_number -- sample_number
		, CONCAT( -- log_change
			'[' , 'sample_type ' , ', ' , OLD.sample_type , ' ' , ']' 
            , '[' , 'date_sample_received ', ', ' , OLD.date_sample_received , ' ' , ']' 
            , '[' , 'sample_condition_notes ', ', ' , OLD.sample_condition_notes , ']'
			, '[' , 'need_re_sample ', ', ' , OLD.need_re_sample , ']'
            , '[' , 'subject_contacted ', ', ' , OLD.subject_contacted , ' ' , ']'
			, '[' , 'date_check_in ', ', ' , OLD.date_check_in , ' ' , ']'           
			, '[' , 'user_check_in ', ', ' , OLD.user_check_in , ' ' , ']'            
				) -- end concat
        
	);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `conditions` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, x being a number',
  `cond_code` char(6) NOT NULL COMMENT 'Description of the conditions',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`,`cond_code`),
  KEY `fk_cond_code` (`cond_code`),
  CONSTRAINT `conditions_ibfk_1` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`),
  CONSTRAINT `fk_cond_code` FOREIGN KEY (`cond_code`) REFERENCES `conditions_lookup` (`cond_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A table to add the conditions that the patient has to their sample number';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES ('CV2000000','cond01','2020-12-13','root@localhost'),('CV2000000','cond02','2020-12-13','root@localhost'),('CV2000000','cond06','2020-12-13','root@localhost'),('CV2000000','cond08','2020-12-13','root@localhost'),('CV2000001','cond02','2020-12-13','root@localhost'),('CV2000002','cond05','2020-12-13','root@localhost'),('CV2000003','cond05','2020-12-13','root@localhost'),('CV2000004','cond08','2020-12-13','root@localhost');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_conditions_log_delete` AFTER DELETE ON `conditions` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'conditions'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'cond_code ', ', ' , OLD.cond_code, ' ', ']'
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `conditions_lookup`
--

DROP TABLE IF EXISTS `conditions_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `conditions_lookup` (
  `cond_code` char(6) NOT NULL COMMENT 'code for the conditions',
  `cond_descrip` varchar(100) NOT NULL COMMENT 'description of the condition',
  PRIMARY KEY (`cond_code`),
  UNIQUE KEY `cond_code` (`cond_code`),
  UNIQUE KEY `cond_descrip` (`cond_descrip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='lookup table for conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions_lookup`
--

LOCK TABLES `conditions_lookup` WRITE;
/*!40000 ALTER TABLE `conditions_lookup` DISABLE KEYS */;
INSERT INTO `conditions_lookup` VALUES ('cond03','Acute kidney injury'),('cond01','Cardiovascular (Heart) Disease'),('cond02','Cerbrovascular disease'),('cond04','Chronic Kidney Disease'),('cond05','Diabetes'),('cond06','Hepatitus B Infection'),('cond07','Hypertension'),('cond08','Immunodeficiency'),('cond09','Malignancy'),('cond10','Overweight');
/*!40000 ALTER TABLE `conditions_lookup` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_conditions_lookup_log_delete` AFTER DELETE ON `conditions_lookup` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'conditions_lookup'
        , 'D'
		, CONCAT( 
			'[' , 'cond_code ', ', ' , OLD.cond_code, ' ', ']'
			, '[' , 'cond_descrip ', ', ' , OLD.cond_descrip , ' ' , ']'

				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `extraction`
--

DROP TABLE IF EXISTS `extraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `extraction` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, X being a number',
  `date_of_extraction` date NOT NULL COMMENT 'when the sample was extracted',
  `extracted_by` varchar(3) NOT NULL DEFAULT 'ESP' COMMENT 'who extracted the sample. Example, ESP or MM',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`),
  UNIQUE KEY `sample_number` (`sample_number`),
  CONSTRAINT `fk_check_in_sample_number` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='table that specifies when the sample was extracted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extraction`
--

LOCK TABLES `extraction` WRITE;
/*!40000 ALTER TABLE `extraction` DISABLE KEYS */;
INSERT INTO `extraction` VALUES ('CV2000000','2020-07-28','ESP','2020-12-13','root@localhost'),('CV2000001','2020-07-27','ESP','2020-12-13','root@localhost'),('CV2000002','2020-08-27','ESP','2020-12-13','root@localhost'),('CV2000003','2020-08-30','ESP','2020-12-13','root@localhost'),('CV2000004','2020-08-30','ESP','2020-12-13','root@localhost');
/*!40000 ALTER TABLE `extraction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_extraction_log_delete` AFTER DELETE ON `extraction` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'extraction'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'date_of_extraction ', ', ' , OLD.date_of_extraction, ' ', ']'
			, '[' , 'extracted_by ', ', ' , OLD.extracted_by , ' ' , ']'
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gene_lookup`
--

DROP TABLE IF EXISTS `gene_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `gene_lookup` (
  `gene_name` varchar(20) NOT NULL COMMENT 'name for the gene',
  `coding_variant` varchar(20) NOT NULL COMMENT 'c.522A>T. Not sure how the variants will be recorded',
  `protein_change` varchar(20) NOT NULL COMMENT 'P.Arg54>Arg. Not sure how the variants will be recorded. In clinical, most functional information.',
  `gene_description` varchar(100) NOT NULL COMMENT 'description of the gene',
  `location_chromo` varchar(2) NOT NULL COMMENT 'chromosome the gene is found in, ',
  `grch38_location` varchar(100) NOT NULL COMMENT 'Build, GRCh38 (7668421..7687490, complement. )',
  PRIMARY KEY (`gene_name`,`coding_variant`),
  UNIQUE KEY `coding_variant` (`coding_variant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Lookup table for genes, source: National Center for Biotechnology Information https://www.ncbi.nlm.nih.gov/genome/guide/human/';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gene_lookup`
--

LOCK TABLES `gene_lookup` WRITE;
/*!40000 ALTER TABLE `gene_lookup` DISABLE KEYS */;
INSERT INTO `gene_lookup` VALUES ('AR','c.522A>T.','P.Arg54>Arg.','androgen receptor [Homo sapiens (human)]','X','67544021..67730619'),('EGFR','c.347>A.','t.658> G.','epidermal growth factor receptor','7','55019017..55211628'),('EGFR','c.516>A.','p.66> T.','epidermal growth factor receptor','7','55019017..55211628'),('EGFR','c.656>G.','c.54> A.','epidermal growth factor receptor','7','55019017..55211628'),('ESR1','c.522A>G.','P.Arg63>Arg.','estrogen receptor 1 [Homo sapiens (human)]','6','151654148..152129619'),('HLA-DRB1','c.266G>A.','R [CGG] > Q [CAG]','major histocompatibility complex, class II, DR beta 1','6','32578775..32589848, complement'),('HLA-DRB1','c.532A>T.','P.Arg>Arg.','major histocompatibility complex, class II, DR beta 1','6','32578775..32589848, complement'),('MMP9','c.626G>T','R [CGG] > L [CTG]','matrix metallopeptidase 9','17','7668421..7687490, complement'),('MMP9','c.743G>A','R [CGG] > P [CCG]','matrix metallopeptidase 9','17','7668421..7687490, complement'),('TP53','c.266G>C','R [CGG] > P [CCG]','tumor protein p53','17','7668421..7687490, complement');
/*!40000 ALTER TABLE `gene_lookup` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_gene_lookup_log_delete` AFTER DELETE ON `gene_lookup` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'gene_lookup'
        , 'D'
		, CONCAT( 
			'[' , 'gene_name ', ', ' , OLD.gene_name, ' ', ']'
			, '[' , 'coding_variant ', ', ' , OLD.coding_variant , ' ' , ']'
			, '[' , 'protein_change ', ', ' , OLD.protein_change , ']'
            , '[' , 'gene_description ', ', ' , OLD.gene_description , ']'
            , '[' , 'location_chromo ', ', ' , OLD.location_chromo , ']'
            , '[' , 'grch38_location ', ', ' , OLD.grch38_location , ']'

				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gene_table`
--

DROP TABLE IF EXISTS `gene_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `gene_table` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, X being a number',
  `gene_name` varchar(20) NOT NULL COMMENT 'Name of the gene',
  `coding_variant` varchar(20) NOT NULL COMMENT 'c.522A>T. Not sure how the variants will be recorded',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`,`coding_variant`),
  KEY `fk_coding_variant` (`coding_variant`),
  CONSTRAINT `fk_coding_variant` FOREIGN KEY (`coding_variant`) REFERENCES `gene_lookup` (`coding_variant`),
  CONSTRAINT `gene_table_ibfk_1` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table that keeps the genes that are of interest for the sample';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gene_table`
--

LOCK TABLES `gene_table` WRITE;
/*!40000 ALTER TABLE `gene_table` DISABLE KEYS */;
INSERT INTO `gene_table` VALUES ('CV2000000','AR','c.522A>T.','2020-12-16','root@localhost'),('CV2000000','HLA-DRB1','c.532A>T.','2020-12-16','root@localhost'),('CV2000000','MMP9','c.626G>T','2020-12-16','root@localhost'),('CV2000000','EGFR','c.656>G.','2020-12-16','root@localhost'),('CV2000001','EGFR','c.516>A.','2020-12-16','root@localhost'),('CV2000001','ESR1','c.522A>G.','2020-12-16','root@localhost'),('CV2000002','HLA-DRB1','c.266G>A.','2020-12-16','root@localhost'),('CV2000002','TP53','c.266G>C','2020-12-16','root@localhost'),('CV2000002','EGFR','c.347>A.','2020-12-16','root@localhost'),('CV2000002','EGFR','c.656>G.','2020-12-16','root@localhost'),('CV2000003','HLA-DRB1','c.532A>T.','2020-12-16','root@localhost'),('CV2000003','MMP9','c.626G>T','2020-12-16','root@localhost'),('CV2000004','ESR1','c.522A>G.','2020-12-16','root@localhost'),('CV2000004','AR','c.522A>T.','2020-12-16','root@localhost');
/*!40000 ALTER TABLE `gene_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_gene_table_log_delete` AFTER DELETE ON `gene_table` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'gene_table'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'gene_name ', ', ' , OLD.gene_name, ' ', ']'
			, '[' , 'coding_variant ', ', ' , OLD.coding_variant , ' ' , ']'
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `qc`
--

DROP TABLE IF EXISTS `qc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `qc` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, x being a number',
  `concentration` decimal(6,2) NOT NULL COMMENT 'concentration in (ng/µL)',
  `vol_of_hydration_buffer` decimal(6,2) NOT NULL COMMENT 'volume of the heydration buffer in µL',
  `amt_of_dna` decimal(6,2) NOT NULL COMMENT 'amout of DNA in µg',
  `frag_gel` enum('Y','N') NOT NULL COMMENT 'Fragmentation gel?',
  `date_of_gel` date DEFAULT NULL COMMENT 'Date of Gel',
  `lane_number` int unsigned DEFAULT NULL COMMENT 'Lane Number',
  `gel_image` varchar(100) DEFAULT NULL COMMENT 'Gel Image (File path)',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`),
  UNIQUE KEY `sample_number` (`sample_number`),
  CONSTRAINT `qc_ibfk_1` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='quality control table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qc`
--

LOCK TABLES `qc` WRITE;
/*!40000 ALTER TABLE `qc` DISABLE KEYS */;
INSERT INTO `qc` VALUES ('CV2000000',688.00,800.00,550.40,'N','2020-06-15',33,'desktop/image/gel.img','2020-12-13','root@localhost'),('CV2000001',178.40,800.00,142.72,'N','2020-05-13',2,'N/A','2020-12-13','root@localhost'),('CV2000002',23.20,800.00,18.56,'N','2020-04-13',1,'N/A','2020-12-13','root@localhost'),('CV2000003',22.00,800.00,17.60,'N',NULL,NULL,'N/A','2020-12-13','root@localhost'),('CV2000004',22.00,800.00,17.60,'N','2020-08-15',2,'N/A','2020-12-13','root@localhost');
/*!40000 ALTER TABLE `qc` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_qc_log_update` AFTER UPDATE ON `qc` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made on qc.
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

/*
change_log (
	log_date DATETIME NOT NULL COMMENT 'The date of the change'
    , log_user VARCHAR(10) NOT NULL COMMENT 'The user who made the change'
    , log_table VARCHAR(20) NOT NULL COMMENT 'The table that was changed'
    , log_change VARCHAR(100) NOT NULL COMMENT 'The change that was made'
*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type        
		, log_sample
		, log_change

	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'qc'
        , 'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'gel_image ', ', ' , OLD.gel_image , ']'
            
            ) -- end concat
	);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_qc_log_delete` AFTER DELETE ON `qc` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'qc'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'concentration ', ', ' , OLD.concentration, ' ', ']'
			, '[' , 'vol_of_hydration_buffer ', ', ' , OLD.vol_of_hydration_buffer , ' ' , ']'
			, '[' , 'amt_of_dna ', ', ' , OLD.amt_of_dna , ']'
			, '[' , 'frag_gel ', ', ' , OLD.frag_gel , ']'
			, '[' , 'date_of_gel ', ', ' , OLD.date_of_gel , ']'     
			, '[' , 'lane_number ', ', ' , OLD.lane_number , ']'     
			, '[' , 'gel_image ', ', ' , OLD.gel_image , ']'     
            
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sequencing`
--

DROP TABLE IF EXISTS `sequencing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `sequencing` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, x being a number',
  `sequencing_company` varchar(100) NOT NULL COMMENT 'the company that the sequencing was sent to. ',
  `sequence_batch` int unsigned NOT NULL COMMENT 'sequence batch( the number of the batch that the sample was also in)',
  `amt_of_dna_sent` decimal(6,2) NOT NULL COMMENT 'amout of DNA in µg',
  `date_mailed` date NOT NULL COMMENT 'Date Mailed to Sequencer',
  `date_returned` date DEFAULT NULL COMMENT 'date the sample was received from sequencer',
  `fastq_file_name` varchar(100) NOT NULL COMMENT 'name of the fastq_file',
  `quality_date_filename` varchar(100) NOT NULL COMMENT 'name of the file',
  `bam_file_name` varchar(100) NOT NULL COMMENT 'name of the bam_file',
  `vcf_file_name` varchar(100) NOT NULL COMMENT 'name of the vc_file',
  `sequencing_stored` varchar(100) NOT NULL COMMENT 'location of the files',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`),
  UNIQUE KEY `sample_number` (`sample_number`),
  UNIQUE KEY `fastq_file_name` (`fastq_file_name`),
  UNIQUE KEY `quality_date_filename` (`quality_date_filename`),
  UNIQUE KEY `bam_file_name` (`bam_file_name`),
  UNIQUE KEY `vcf_file_name` (`vcf_file_name`),
  CONSTRAINT `sequencing_ibfk_1` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='table that has the information about what was sent to the sequencing company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequencing`
--

LOCK TABLES `sequencing` WRITE;
/*!40000 ALTER TABLE `sequencing` DISABLE KEYS */;
INSERT INTO `sequencing` VALUES ('CV2000000','Giant Evil Corporation 5',56,550.40,'2020-07-28','2020-08-24','abc1.fastq','abc1.qd','abc1.bam','abc1.vcf','area51','2020-12-13','root@localhost'),('CV2000001','Giant Evil Corporation 3',30,142.72,'2020-07-28','2020-08-24','abc2.fastq','abc2.qd','abc2.bam','abc2.vcf','area51','2020-12-13','root@localhost'),('CV2000002','Giant Evil Corporation 3',30,18.56,'2020-08-28','2020-08-29','abc3.fastq','abc3.qd','abc3.bam','abc3.vcf','area52','2020-12-13','root@localhost'),('CV2000003','Lab Corp',21,17.60,'2020-08-30','2020-09-06','abc4.fastq','abc4.qd','abc4.bam','abc4.vcf','area52','2020-12-13','root@localhost'),('CV2000004','Lab Corp',21,17.60,'2020-08-30','2020-09-06','abc5.fastq','abc5.qd','abc5.bam','abc5.vcf','lab fridge','2020-12-13','root@localhost');
/*!40000 ALTER TABLE `sequencing` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_sequencing_log_delete` AFTER DELETE ON `sequencing` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'sequencing'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'sequencing_company ', ', ' , OLD.sequencing_company, ' ', ']'
			, '[' , 'sequence_batch ', ', ' , OLD.sequence_batch , ' ' , ']'
			, '[' , 'amt_of_dna_sent ', ', ' , OLD.amt_of_dna_sent , ']'
			, '[' , 'date_mailed ', ', ' , OLD.date_mailed , ']'
            , '[' , 'date_returned ', ', ' , OLD.date_returned , ']'
            , '[' , 'fastq_file_name ', ', ' , OLD.fastq_file_name , ']'
            , '[' , 'quality_date_filename ', ', ' , OLD.quality_date_filename , ']'
            , '[' , 'bam_file_name ', ', ' , OLD.bam_file_name , ']'
            , '[' , 'vcf_file_name ', ', ' , OLD.vcf_file_name , ']'
            , '[' , 'sequencing_stored ', ', ' , OLD.sequencing_stored , ']'
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `storage_box`
--

DROP TABLE IF EXISTS `storage_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `storage_box` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, x being a number',
  `sample_stored` varchar(100) NOT NULL COMMENT 'where the sample is stored',
  `box_label` varchar(100) NOT NULL COMMENT 'where the sample is stored in a box',
  `box_coordinates` varchar(100) NOT NULL COMMENT 'cordinates of the sample in a box',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`box_label`,`box_coordinates`),
  UNIQUE KEY `sample_number` (`sample_number`),
  CONSTRAINT `storage_box_ibfk_1` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='table that assoicates the sample number with where it is stored';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_box`
--

LOCK TABLES `storage_box` WRITE;
/*!40000 ALTER TABLE `storage_box` DISABLE KEYS */;
INSERT INTO `storage_box` VALUES ('CV2000001','fridge 1','A','2','2020-12-13','root@localhost'),('CV2000004','fridge 2','C','1','2020-12-13','root@localhost'),('CV2000003','fridge 1','C','3','2020-12-13','root@localhost'),('CV2000000','storage3','label1','01.11','2020-12-13','root@localhost'),('CV2000002','storage1','label1','10.25','2020-12-13','root@localhost');
/*!40000 ALTER TABLE `storage_box` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_storage_box_log_update` AFTER UPDATE ON `storage_box` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'storage_box'
        ,'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'sample_stored ', ', ' , OLD.sample_stored, ' ', ']' ,
            '[' , 'box_label ', ', ' , OLD.box_label , ' ' , ']' ,
            '[' , 'box_coordinates ', ', ' , OLD.box_coordinates , ']'
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_storage_box_log_delete` AFTER DELETE ON `storage_box` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'storage_box'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'sample_stored ', ', ' , OLD.sample_stored, ' ', ']'
			, '[' , 'box_label ', ', ' , OLD.box_label , ' ' , ']'
			, '[' , 'box_coordinates ', ', ' , OLD.box_coordinates , ']'
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subject_demographics`
--

DROP TABLE IF EXISTS `subject_demographics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `subject_demographics` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, x being a number',
  `gender` enum('M','F','N') NOT NULL COMMENT 'Biological gender of the sample. Male, female, non-binary(n)',
  `age` tinyint unsigned NOT NULL COMMENT 'Age of the patient who gave the sample',
  `covid_test` varchar(100) NOT NULL COMMENT 'The type of test that was taken',
  `days_hosp` smallint unsigned DEFAULT NULL COMMENT 'days spent in the hospital',
  `cbc` decimal(10,2) DEFAULT NULL COMMENT 'complete blood cell count in million cells per microliter',
  `treat1` varchar(100) DEFAULT NULL COMMENT 'the treatment that the patient had',
  `severity` enum('asymptomatic','symptomatic','severe') DEFAULT NULL COMMENT 'How severe the case was.',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`),
  UNIQUE KEY `sample_number` (`sample_number`),
  CONSTRAINT `subject_demographics_ibfk_1` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='table containing the demographics of the subject';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_demographics`
--

LOCK TABLES `subject_demographics` WRITE;
/*!40000 ALTER TABLE `subject_demographics` DISABLE KEYS */;
INSERT INTO `subject_demographics` VALUES ('CV2000000','M',26,'diagnostic',30,4.30,'bleach','severe','2020-12-13','root@localhost'),('CV2000001','F',68,'diagnostic',10,3.10,'remdesivir','severe','2020-12-13','root@localhost'),('CV2000002','F',78,'antibody ',0,4.60,'bed rest','symptomatic','2020-12-13','root@localhost'),('CV2000003','F',8,'antibody ',0,4.30,'nothing','asymptomatic','2020-12-13','root@localhost'),('CV2000004','M',34,'antibody ',30,3.10,'ventilator','severe','2020-12-13','root@localhost');
/*!40000 ALTER TABLE `subject_demographics` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_subject_demographics_log_update` AFTER UPDATE ON `subject_demographics` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any updates that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-12			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change

	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'subject_demographics'
        , 'U'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'days_hosp ', ', ' , OLD.days_hosp, ' ', ']' 
            , '[' , 'treat1 ', ', ' , OLD.treat1 , ' ' , ']' 
				) -- end concat
	);
    


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_subject_demographics_log_delete` AFTER DELETE ON `subject_demographics` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_sample
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'subject_demographics'
        , 'D'
        , OLD.sample_number
		, CONCAT( 
			'[' , 'gender ', ', ' , OLD.gender, ' ', ']'
			, '[' , 'age ', ', ' , OLD.age , ' ' , ']'
			, '[' , 'covid_test ', ', ' , OLD.covid_test , ']'
            , '[' , 'days_hosp ', ', ' , OLD.days_hosp , ']'
            , '[' , 'cbc ', ', ' , OLD.cbc , ']'
            , '[' , 'treat1 ', ', ' , OLD.treat1 , ']'
            , '[' , 'severity ', ', ' , OLD.severity , ']'
				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `symptoms` (
  `sample_number` char(9) NOT NULL COMMENT 'sample number, CVXXXXXXX, X being a number',
  `sym01` enum('P','A','ND') DEFAULT NULL COMMENT 'Abnormal chest x-ray',
  `sym02` enum('P','A','ND') DEFAULT NULL COMMENT 'Abnormal CT',
  `sym03` enum('P','A','ND') DEFAULT NULL COMMENT 'Acute kidney injury',
  `sym04` enum('P','A','ND') DEFAULT NULL COMMENT 'ARDS',
  `sym05` enum('P','A','ND') DEFAULT NULL COMMENT 'Cardiac involvement',
  `sym06` enum('P','A','ND') DEFAULT NULL COMMENT 'Chills',
  `sym07` enum('P','A','ND') DEFAULT NULL COMMENT 'Clotting',
  `sym08` enum('P','A','ND') DEFAULT NULL COMMENT 'Conjunctival congestion',
  `sym09` enum('P','A','ND') DEFAULT NULL COMMENT 'Diarrhea',
  `sym10` enum('P','A','ND') DEFAULT NULL COMMENT 'Dry cough',
  `sym11` enum('P','A','ND') DEFAULT NULL COMMENT 'Enanthem',
  `sym12` enum('P','A','ND') DEFAULT NULL COMMENT 'Fatigue',
  `sym13` enum('P','A','ND') DEFAULT NULL COMMENT 'Fever',
  `sym14` enum('P','A','ND') DEFAULT NULL COMMENT 'Headache',
  `sym15` enum('P','A','ND') DEFAULT NULL COMMENT 'Hemoptysis',
  `sym16` enum('P','A','ND') DEFAULT NULL COMMENT 'Loss of taste/smell',
  `sym17` enum('P','A','ND') DEFAULT NULL COMMENT 'Multiple organ failure',
  `sym18` enum('P','A','ND') DEFAULT NULL COMMENT 'Myalgia/arthralgia',
  `sym19` enum('P','A','ND') DEFAULT NULL COMMENT 'Nasal congestion',
  `sym20` enum('P','A','ND') DEFAULT NULL COMMENT 'Nausea/vomiting',
  `sym21` enum('P','A','ND') DEFAULT NULL COMMENT 'Pneumonia',
  `sym22` enum('P','A','ND') DEFAULT NULL COMMENT 'Productive cough',
  `sym23` enum('P','A','ND') DEFAULT NULL COMMENT 'pulmonary edema',
  `sym24` enum('P','A','ND') DEFAULT NULL COMMENT 'Rash',
  `sym25` enum('P','A','ND') DEFAULT NULL COMMENT 'Shortness of breath',
  `sym26` enum('P','A','ND') DEFAULT NULL COMMENT 'Sore throat',
  `date_check_in` date DEFAULT NULL COMMENT 'The date the record was inserted',
  `user_check_in` varchar(50) DEFAULT NULL COMMENT 'The user who created the record.',
  PRIMARY KEY (`sample_number`),
  CONSTRAINT `symptoms_ibfk_1` FOREIGN KEY (`sample_number`) REFERENCES `check_in` (`sample_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A table to add the symptoms that the patient has to their sample number';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms`
--

LOCK TABLES `symptoms` WRITE;
/*!40000 ALTER TABLE `symptoms` DISABLE KEYS */;
INSERT INTO `symptoms` VALUES ('CV2000000','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost'),('CV2000001','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost'),('CV2000002','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost'),('CV2000003','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost'),('CV2000004','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost'),('CV2000005','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost'),('CV2000006','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost'),('CV2000007','P','P','P','P','P','P','P','P','P','P','P','A','A','A','A','A','A','A','A','A','ND','ND','ND','ND','ND','ND','2021-01-03','root@localhost');
/*!40000 ALTER TABLE `symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptoms_lookup`
--

DROP TABLE IF EXISTS `symptoms_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `symptoms_lookup` (
  `symp_code` char(5) NOT NULL COMMENT 'code for the symptom',
  `symp_descrip` varchar(100) NOT NULL COMMENT 'description of the symptoms',
  PRIMARY KEY (`symp_code`),
  UNIQUE KEY `symp_code` (`symp_code`),
  UNIQUE KEY `symp_descrip` (`symp_descrip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='lookup table for symptoms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms_lookup`
--

LOCK TABLES `symptoms_lookup` WRITE;
/*!40000 ALTER TABLE `symptoms_lookup` DISABLE KEYS */;
INSERT INTO `symptoms_lookup` VALUES ('sym01','Abnormal chest x-ray'),('sym02','Abnormal CT'),('sym03','Acute kidney injury'),('sym04','ARDS'),('sym05','Cardiac involvement'),('sym06','Chills'),('sym07','Clotting'),('sym08','Conjunctival congestion'),('sym09','Diarrhea'),('sym10','Dry cough'),('sym11','Enanthem'),('sym12','Fatigue'),('sym13','Fever'),('sym14','Headache'),('sym15','Hemoptysis'),('sym16','Loss of taste/smell'),('sym17','Multiple organ failure'),('sym18','Myalgia/arthralgia'),('sym19','Nasal congestion'),('sym20','Nausea/vomiting'),('sym21','Pneumonia'),('sym22','Productive cough'),('sym23','pulmonary edema'),('sym24','Rash'),('sym25','Shortness of breath'),('sym26','Sore throat');
/*!40000 ALTER TABLE `symptoms_lookup` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_symptoms_lookup_log_delete` AFTER DELETE ON `symptoms_lookup` FOR EACH ROW BEGIN
/*
	Copyright statement
	Author: Derrick Nagy
	File: triggers_SARS_CoV-2.sql
	DESCRIPTION:
		Create a trigger to log any deletes that were made
	
	Modification History
	Date modified 		- Who did it 		- what was modified
	2020-12-13			Derrick Nagy		Initial Creation

*/

	INSERT INTO change_log (
		log_date
		, log_user
		, log_table 
        , log_change_type
		, log_change


	)VALUES (
		NOW()
		, SYSTEM_USER()
		, 'symptoms_lookup'
        , 'D'
		, CONCAT( 
			'[' , 'symp_code ', ', ' , OLD.symp_code, ' ', ']'
			, '[' , 'symp_descrip ', ', ' , OLD.symp_descrip , ' ' , ']'

				) -- end concat
	);
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v_check_in`
--

DROP TABLE IF EXISTS `v_check_in`;
/*!50001 DROP VIEW IF EXISTS `v_check_in`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_check_in` AS SELECT 
 1 AS `sample_number`,
 1 AS `sample_type`,
 1 AS `date_sample_received`,
 1 AS `sample_condition_notes`,
 1 AS `need_re_sample`,
 1 AS `subject_contacted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_logs_past_week`
--

DROP TABLE IF EXISTS `v_logs_past_week`;
/*!50001 DROP VIEW IF EXISTS `v_logs_past_week`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_logs_past_week` AS SELECT 
 1 AS `log_date`,
 1 AS `log_user`,
 1 AS `log_table`,
 1 AS `log_change_type`,
 1 AS `log_sample`,
 1 AS `log_change`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_sample_information`
--

DROP TABLE IF EXISTS `v_sample_information`;
/*!50001 DROP VIEW IF EXISTS `v_sample_information`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sample_information` AS SELECT 
 1 AS `sample_number`,
 1 AS `date_sample_received`,
 1 AS `sample_condition_notes`,
 1 AS `vol_of_hydration_buffer`,
 1 AS `amt_of_dna`,
 1 AS `frag_gel`,
 1 AS `date_of_gel`,
 1 AS `lane_number`,
 1 AS `gel_image`,
 1 AS `sample_stored`,
 1 AS `box_label`,
 1 AS `box_coordinates`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_shared_variants_severe_outcome`
--

DROP TABLE IF EXISTS `v_shared_variants_severe_outcome`;
/*!50001 DROP VIEW IF EXISTS `v_shared_variants_severe_outcome`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_shared_variants_severe_outcome` AS SELECT 
 1 AS `sample_number`,
 1 AS `severity`,
 1 AS `gene_name`,
 1 AS `coding_variant`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_shared_variants_severe_outcome_description`
--

DROP TABLE IF EXISTS `v_shared_variants_severe_outcome_description`;
/*!50001 DROP VIEW IF EXISTS `v_shared_variants_severe_outcome_description`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_shared_variants_severe_outcome_description` AS SELECT 
 1 AS `sample_number`,
 1 AS `severity`,
 1 AS `gene_name`,
 1 AS `coding_variant`,
 1 AS `protein_change`,
 1 AS `gene_description`,
 1 AS `location_chromo`,
 1 AS `grch38_location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_variants_in_common`
--

DROP TABLE IF EXISTS `v_variants_in_common`;
/*!50001 DROP VIEW IF EXISTS `v_variants_in_common`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_variants_in_common` AS SELECT 
 1 AS `sample_number`,
 1 AS `gene_name`,
 1 AS `coding_variant`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sars_cov_2'
--

--
-- Dumping routines for database 'sars_cov_2'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_conditions_lookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_conditions_lookup`(
	 IN p_cond_code CHAR(6)
	, IN p_cond_descrip VARCHAR(100)
)
    COMMENT 'Insert into the conditions_lookup table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the conditions_lookup table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/
	
 INSERT INTO conditions_lookup (
	cond_code
	, cond_descrip
    
) VALUES (
	p_cond_code
	, p_cond_descrip
)
;

SELECT 
	cond_code
	, cond_descrip
FROM
    conditions_lookup
;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_change_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_change_log`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete all records in change log associated with sample number.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete all records in change log associated with sample number. This is if a patient withdrawls
            from the study. This is the last step for completely removing the record.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-13			Derrick Nagy		Initial Creation
		
	*/
 	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
   
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM change_log 
    WHERE log_sample = p_sample_number
    ;
    
    IF sample_count = 0 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found.';
	END IF;	
 
	DELETE FROM change_log
	WHERE log_sample = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the change_log table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_check_in` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_check_in`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Make an update to a single cell in a row.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete the record for the check_in table. The most important part is the where clause.
            
            This needs some error handling because the record table is relied on by all the other tables.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    

    
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM check_in 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
	
	DELETE FROM check_in
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the check_in table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_conditions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_conditions`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete a conditions record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete conditions record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM conditions 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	

	DELETE FROM conditions
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the conditions table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_conditions_lookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_conditions_lookup`(
	IN p_cond_code CHAR(6)
)
    COMMENT 'Delete a conditions_lookup record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete conditions_lookup record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM conditions_lookup 
	WHERE cond_code = p_cond_code
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching condition record found. It does not exist possibly.';
	END IF;	


	DELETE FROM conditions_lookup
	WHERE cond_code = p_cond_code
	;

	SELECT CONCAT('The symptom with the code "',p_cond_code,'" was removed from the conditions_lookup table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_extraction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_extraction`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete an extraction record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete an extraction record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);     
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM extraction 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	DELETE FROM extraction
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the extraction table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_gene_lookup_variant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_gene_lookup_variant`(
	IN p_coding_variant VARCHAR(30)
)
    COMMENT 'Delete a gene_lookup coding_variant record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete gene_lookup record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/

	DELETE FROM gene_lookup
	WHERE coding_variant = p_coding_variant
	;

	SELECT CONCAT('The variant with the code "', p_coding_variant ,'" was removed from the gene_lookup table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_gene_table_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_gene_table_record`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete a gene_table record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete gene_table record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
 	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
   
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM gene_table 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	
 
	DELETE FROM gene_table
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the gene_table table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_gene_table_variant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_gene_table_variant`(
	IN p_sample_number CHAR(9)
    , IN p_coding_variant VARCHAR(30)
    
)
    COMMENT 'Delete a gene_table record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete gene_table variant from a record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-13			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;
    DECLARE variant_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);  
/*    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM gene_table 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
    
	
    SELECT 
		COUNT(*)
	INTO variant_count
    FROM gene_table 
    WHERE coding_variant = p_coding_variant
    ;
    
    IF variant_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching variant found. Not associated with this sample possibly.';
	END IF;
 */      
    
    
    
	DELETE FROM gene_table
	WHERE sample_number = p_sample_number
		AND coding_variant = p_coding_variant
	;

	SELECT CONCAT('Coding variant ', p_coding_variant, ' associated with sample ',p_sample_number,' was removed from the gene_table table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_qc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_qc`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete a qc record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete qc record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM qc 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	DELETE FROM qc
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the qc table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_sequencing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_sequencing`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete a sequencing record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete sequencing record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM sequencing 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	

	DELETE FROM sequencing
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the sequencing table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_storage_box` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_storage_box`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete a storage_box record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete storage_box record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM storage_box 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	


	DELETE FROM storage_box
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the storage_box table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_subject_demographics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_subject_demographics`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete a subject_demographics record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete subject_demographics record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM subject_demographics 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	
	
	DELETE FROM subject_demographics
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the subject_demographics table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_symptoms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_symptoms`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Delete a symptoms record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete symptoms record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number); 
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM symptoms 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;	

	DELETE FROM symptoms
	WHERE sample_number = p_sample_number
	;

	SELECT CONCAT('Sample ',p_sample_number,' was removed from the symptoms table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_symptoms_lookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_symptoms_lookup`(
	IN p_symp_code CHAR(5)
)
    COMMENT 'Delete a symptoms_lookup record.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_delete_SARS_CoV-2.sql
		DESCRIPTION:
			Delete symptoms_lookup record. The most important part is the where clause.
            
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
	
	DECLARE sample_count TINYINT DEFAULT 0;
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM symptoms_lookup 
	WHERE symp_code = p_symp_code
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching symptom record found. It does not exist possibly.';
	END IF;	

	DELETE FROM symptoms_lookup
	WHERE symp_code = p_symp_code
	;

	SELECT CONCAT('The symptom with the code "',p_symp_code,'" was removed from the symptoms_lookup table.') AS 'Message'
	;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_gene_lookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gene_lookup`(
	IN p_gene_name CHAR(9)
    , IN p_coding_variant VARCHAR(20)
    , IN p_protein_change VARCHAR(20)
    , IN p_gene_description VARCHAR(100)
    , IN p_location_chromo VARCHAR(2)
    , IN p_grch38_location VARCHAR(100)
)
    COMMENT 'Insert into the gene_lookup table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the gene_lookup table.
        
		Modification History
		Date modified 		- Who did it 		- What was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/


	
	 INSERT INTO gene_lookup (
		gene_name
		, coding_variant
		, protein_change
		, gene_description
		, location_chromo
		, grch38_location

	) VALUES (
		p_gene_name
		, p_coding_variant
		, p_protein_change
		, p_gene_description
		, p_location_chromo
		, p_grch38_location
	)
	;

	SELECT 
		gene_name
		, coding_variant
		, protein_change
		, gene_description
		, location_chromo
		, grch38_location
	FROM
		gene_lookup
	WHERE p_gene_name = gene_name
	;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_check_in` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_check_in`(
	IN p_sample_number CHAR(9)
 	, IN p_sample_type ENUM('blood', 'saliva', 'swab')
    , IN p_date_sample_received DATE
    , IN p_sample_condition_notes VARCHAR(100)
    , IN p_need_re_sample ENUM ('Y','N','not contacted','contacted-pending response', 'contacted-resample pending', 'contacted-unwilling to resample')
    , IN p_subject_contacted ENUM('Y','N')
)
    COMMENT 'Insert into the check in table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the check_in table.
            To test, procedure call is in file "test_insert_SARS_Cov.sql"
            

	);
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    -- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
    
    
	 INSERT INTO check_in (
		sample_number
		, sample_type 
		, date_sample_received
		, sample_condition_notes
		, need_re_sample
		, subject_contacted
		, date_check_in
		, user_check_in
	) VALUES (
		p_sample_number
		, p_sample_type 
		, p_date_sample_received
		, p_sample_condition_notes
		, p_need_re_sample
		, p_subject_contacted
		, NOW()
		, SYSTEM_USER()
	)
	;

	 SELECT 
		sample_number
		, sample_type 
		, date_sample_received
		, sample_condition_notes
		, need_re_sample
		, subject_contacted
		, date_check_in
		, user_check_in
	 FROM check_in
	 WHERE sample_number = p_sample_number
	 ;
 
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_extraction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_extraction`(
	IN p_sample_number	CHAR(9)
    , IN p_date_of_extraction DATE
    , IN p_extracted_by VARCHAR(3)
)
    COMMENT 'Insert into the extraction table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the extraction table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    -- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
		
	 INSERT INTO extraction (
		sample_number
		, date_of_extraction
		, extracted_by
		, date_check_in
		, user_check_in
	) VALUES (
		p_sample_number
		, p_date_of_extraction
		, p_extracted_by
		, NOW()
		, SYSTEM_USER()   
	)
	;

	 SELECT 
		sample_number
		, date_of_extraction
		, extracted_by
	 FROM extraction
	 WHERE sample_number = p_sample_number
	 ;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_qc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_qc`(
	IN p_sample_number CHAR(9)
	, IN p_concentration DECIMAL(6,2)
	, IN p_vol_of_hydration_buffer DECIMAL(6,2)
	, IN p_amt_of_dna DECIMAL(6,2)
	, IN p_frag_gel ENUM ('Y','N')
	, IN p_date_of_gel DATE
	, IN p_lane_number INT UNSIGNED
	, IN p_gel_image VARCHAR(100)

)
    COMMENT 'Insert into the quality control table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the quality control table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO qc (
		sample_number
		, concentration
		, vol_of_hydration_buffer
		, amt_of_dna
		, frag_gel
		, date_of_gel
		, lane_number
		, gel_image
		, date_check_in
		, user_check_in
		
	) VALUES (
		p_sample_number
		, p_concentration
		, p_vol_of_hydration_buffer
		, p_amt_of_dna
		, p_frag_gel
		, p_date_of_gel
		, p_lane_number
		, p_gel_image
		, NOW()
		, SYSTEM_USER()    
	)
	;

	SELECT 
		sample_number
		, concentration
		, vol_of_hydration_buffer
		, amt_of_dna
		, frag_gel
		, date_of_gel
		, lane_number
		, gel_image
	FROM
		qc
	WHERE
		sample_number = p_sample_number
	;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_samp_and_cond` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_samp_and_cond`(
	IN p_sample_number CHAR(9)
	, IN p_cond_code  CHAR(6)
)
    COMMENT 'Insert sample and condition into the conditions table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert the sample number and the condition into the conditions table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
	
	 INSERT INTO conditions(
		sample_number
		, cond_code
		, date_check_in
		, user_check_in
		
	) VALUES (
		p_sample_number
		, p_cond_code
		, NOW()
		, SYSTEM_USER()    
	)
	;

	SELECT 
		sample_number
		, cond_code
	FROM
		conditions
	WHERE    
		sample_number = p_sample_number
	;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_samp_and_gene` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_samp_and_gene`(
	IN p_sample_number CHAR(9)
	, IN p_coding_variant VARCHAR(20)
)
    COMMENT 'Insert sample and gene_name into the gene_table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert the sample number and the symptom into the symptoms table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-09			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO gene_table(
		sample_number
		, gene_name
		, coding_variant
		, date_check_in
		, user_check_in

	) VALUES (
		p_sample_number
		, (SELECT
			gene_name
			FROM gene_lookup
			WHERE coding_variant = p_coding_variant)
		, p_coding_variant
		, NOW()
		, SYSTEM_USER()
	)
	;

	SELECT 
		sample_number
		, gene_name
		, coding_variant

	FROM
		gene_table
		
	WHERE sample_number = p_sample_number
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_samp_and_symp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_samp_and_symp`(
	IN p_sample_number CHAR(9)
	, IN p_sym01 ENUM ('P', 'A', 'ND')  	--  'Abnormal chest x-ray'
	, IN p_sym02 ENUM ('P', 'A', 'ND')  	--  'Abnormal CT'
	, IN p_sym03 ENUM ('P', 'A', 'ND')  	--  'Acute kidney injury'
	, IN p_sym04 ENUM ('P', 'A', 'ND')  	--  'ARDS'
	, IN p_sym05 ENUM ('P', 'A', 'ND')  	--  'Cardiac involvement'
	, IN p_sym06 ENUM ('P', 'A', 'ND')  	--  'Chills'
	, IN p_sym07 ENUM ('P', 'A', 'ND')  	--  'Clotting'
	, IN p_sym08 ENUM ('P', 'A', 'ND')  	--  'Conjunctival congestion'
	, IN p_sym09 ENUM ('P', 'A', 'ND')  	--  'Diarrhea'
	, IN p_sym10 ENUM ('P', 'A', 'ND')  	--  'Dry cough'
	, IN p_sym11 ENUM ('P', 'A', 'ND')  	--  'Enanthem'
	, IN p_sym12 ENUM ('P', 'A', 'ND')  	--  'Fatigue'
	, IN p_sym13 ENUM ('P', 'A', 'ND')  	--  'Fever'
	, IN p_sym14 ENUM ('P', 'A', 'ND')  	--  'Headache'
	, IN p_sym15 ENUM ('P', 'A', 'ND')  	--  'Hemoptysis'
	, IN p_sym16 ENUM ('P', 'A', 'ND')  	--  'Loss of taste/smell'
	, IN p_sym17 ENUM ('P', 'A', 'ND')  	--  'Multiple organ failure'
	, IN p_sym18 ENUM ('P', 'A', 'ND')  	--  'Myalgia/arthralgia'
	, IN p_sym19 ENUM ('P', 'A', 'ND')  	--  'Nasal congestion'
	, IN p_sym20 ENUM ('P', 'A', 'ND')  	--  'Nausea/vomiting'
	, IN p_sym21 ENUM ('P', 'A', 'ND')  	--  'Pneumonia'
	, IN p_sym22 ENUM ('P', 'A', 'ND')  	--  'Productive cough'
	, IN p_sym23 ENUM ('P', 'A', 'ND')  	--  'pulmonary edema'
	, IN p_sym24 ENUM ('P', 'A', 'ND')  	--  'Rash'
	, IN p_sym25 ENUM ('P', 'A', 'ND')  	--  'Shortness of breath'
	, IN p_sym26 ENUM ('P', 'A', 'ND') 		--  'Sore throat'
)
    COMMENT 'Insert sample and symptom into the symptoms table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert the sample number and the condition into the conditions table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2021-01-03			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    INSERT INTO symptoms (
		sample_number
		, sym01   	--  'Abnormal chest x-ray'
		, sym02   	--  'Abnormal CT'
		, sym03   	--  'Acute kidney injury'
		, sym04   	--  'ARDS'
		, sym05   	--  'Cardiac involvement'
		, sym06   	--  'Chills'
		, sym07   	--  'Clotting'
		, sym08   	--  'Conjunctival congestion'
		, sym09   	--  'Diarrhea'
		, sym10   	--  'Dry cough'
		, sym11   	--  'Enanthem'
		, sym12   	--  'Fatigue'
		, sym13   	--  'Fever'
		, sym14   	--  'Headache'
		, sym15   	--  'Hemoptysis'
		, sym16   	--  'Loss of taste/smell'
		, sym17   	--  'Multiple organ failure'
		, sym18   	--  'Myalgia/arthralgia'
		, sym19   	--  'Nasal congestion'
		, sym20   	--  'Nausea/vomiting'
		, sym21   	--  'Pneumonia'
		, sym22   	--  'Productive cough'
		, sym23   	--  'pulmonary edema'
		, sym24   	--  'Rash'
		, sym25   	--  'Shortness of breath'
		, sym26  		--  'Sore throat'
		, date_check_in
		, user_check_in
    
    ) VALUES (
		p_sample_number
		, p_sym01   	--  'Abnormal chest x-ray'
		, p_sym02   	--  'Abnormal CT'
		, p_sym03   	--  'Acute kidney injury'
		, p_sym04   	--  'ARDS'
		, p_sym05   	--  'Cardiac involvement'
		, p_sym06   	--  'Chills'
		, p_sym07   	--  'Clotting'
		, p_sym08   	--  'Conjunctival congestion'
		, p_sym09   	--  'Diarrhea'
		, p_sym10   	--  'Dry cough'
		, p_sym11   	--  'Enanthem'
		, p_sym12   	--  'Fatigue'
		, p_sym13   	--  'Fever'
		, p_sym14   	--  'Headache'
		, p_sym15   	--  'Hemoptysis'
		, p_sym16   	--  'Loss of taste/smell'
		, p_sym17   	--  'Multiple organ failure'
		, p_sym18   	--  'Myalgia/arthralgia'
		, p_sym19   	--  'Nasal congestion'
		, p_sym20   	--  'Nausea/vomiting'
		, p_sym21   	--  'Pneumonia'
		, p_sym22   	--  'Productive cough'
		, p_sym23   	--  'pulmonary edema'
		, p_sym24   	--  'Rash'
		, p_sym25   	--  'Shortness of breath'
		, p_sym26  		--  'Sore throat'
		, NOW()
		, SYSTEM_USER() 
    );
    
	SELECT 
		sample_number
		, sym01   	--  'Abnormal chest x-ray'
		, sym02   	--  'Abnormal CT'
		, sym03   	--  'Acute kidney injury'
		, sym04   	--  'ARDS'
		, sym05   	--  'Cardiac involvement'
		, sym06   	--  'Chills'
		, sym07   	--  'Clotting'
		, sym08   	--  'Conjunctival congestion'
		, sym09   	--  'Diarrhea'
		, sym10   	--  'Dry cough'
		, sym11   	--  'Enanthem'
		, sym12   	--  'Fatigue'
		, sym13   	--  'Fever'
		, sym14   	--  'Headache'
		, sym15   	--  'Hemoptysis'
		, sym16   	--  'Loss of taste/smell'
		, sym17   	--  'Multiple organ failure'
		, sym18   	--  'Myalgia/arthralgia'
		, sym19   	--  'Nasal congestion'
		, sym20   	--  'Nausea/vomiting'
		, sym21   	--  'Pneumonia'
		, sym22   	--  'Productive cough'
		, sym23   	--  'pulmonary edema'
		, sym24   	--  'Rash'
		, sym25   	--  'Shortness of breath'
		, sym26  	--  'Sore throat'
	FROM
		symptoms
	WHERE    
		sample_number = p_sample_number
	;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sample_num_regexp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sample_num_regexp`(
	IN p_sample_number CHAR(9)
)
    COMMENT 'Sample number validation procedure'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	 procedures_misc_SARS_CoV-2.sql
		DESCRIPTION:
			Test the sample number to see if it fits the pattern. 
            
		
        Psuedo code for REGEX:
            
			regex_tf = REGEX_LIKE( p_sample_number, /CV2000[0-9][0-9][0-9]/);
    
			IF regex_tf = 0 THEN
				-- message about the sample number being wrong
			ELSE
				-- move on...
			END IF

	);
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-13			Derrick Nagy		Initial Creation
	*/

    DECLARE regex_tf TINYINT DEFAULT 0;
    
	SELECT REGEXP_LIKE(p_sample_number, 'CV2000[0-9][0-9][0-9]')
    INTO regex_tf;

	IF regex_tf = 0 THEN
		SIGNAL SQLSTATE '45000' -- NOT FOUND
		SET MESSAGE_TEXT = 'Sample number does not follow pattern.';
	END IF;
    


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sequencing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sequencing`(
	IN p_sample_number CHAR(9)
	, IN p_sequencing_company VARCHAR(100)
	, IN p_sequence_batch INT UNSIGNED
	, IN p_amt_of_dna_sent DECIMAL(6,2)
	, IN p_date_mailed DATE 
	, IN p_date_returned DATE
	, IN p_fastq_file_name VARCHAR(100)
	, IN p_quality_date_filename VARCHAR(100)
	, IN p_bam_file_name VARCHAR(100)
	, IN p_vcf_file_name VARCHAR(100)
	, IN p_sequencing_stored VARCHAR(100)

)
    COMMENT 'Insert into the storage_box table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the sequencing table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
 INSERT INTO sequencing (
	sample_number
	, sequencing_company
	, sequence_batch
	, amt_of_dna_sent
	, date_mailed
	, date_returned
	, fastq_file_name
	, quality_date_filename
	, bam_file_name
	, vcf_file_name
	, sequencing_stored
	, date_check_in
	, user_check_in
    
) VALUES (
	p_sample_number
	, p_sequencing_company
	, p_sequence_batch
	, p_amt_of_dna_sent
	, p_date_mailed
	, p_date_returned
	, p_fastq_file_name
	, p_quality_date_filename
	, p_bam_file_name
	, p_vcf_file_name
	, p_sequencing_stored
	, NOW()
	, SYSTEM_USER()
)
;

SELECT 
	sample_number
	, sequencing_company
	, sequence_batch
	, amt_of_dna_sent
	, date_mailed
	, date_returned
	, fastq_file_name
	, quality_date_filename
	, bam_file_name
	, vcf_file_name
	, sequencing_stored


FROM
    sequencing
WHERE
    sample_number = p_sample_number
;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_storage_box` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_storage_box`(
	IN p_sample_number CHAR(9)
	, IN p_sample_stored VARCHAR(100)
	, IN p_box_label VARCHAR(100)
    , IN p_box_coordinates VARCHAR(100)
)
    COMMENT 'Insert into the storage_box table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the storage box table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO storage_box (
		sample_number
		, sample_stored
		, box_label
		, box_coordinates
		, date_check_in
		, user_check_in
		
	) VALUES (
		p_sample_number
		, p_sample_stored
		, p_box_label
		, p_box_coordinates
		, NOW()
		, SYSTEM_USER()    
	)
	;

	SELECT 
		sample_number
		, sample_stored
		, box_label
		, box_coordinates

	FROM
		storage_box
	WHERE
		sample_number = p_sample_number
	;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subject_demographics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subject_demographics`(
	IN p_sample_number CHAR(9)
	, IN p_gender ENUM('M','F', 'N')
	, IN p_age TINYINT UNSIGNED
	, IN p_covid_test VARCHAR(100)
	, IN p_days_hosp SMALLINT UNSIGNED
	, IN p_cbc DECIMAL(10,2)
	, IN p_treat1 VARCHAR(100)
    , IN p_severity VARCHAR(20)

)
    COMMENT 'Insert into the subject_demographics table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the subject_demographics table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);
	
	 INSERT INTO subject_demographics (
		sample_number
		,  gender
		,  age
		,  covid_test
		,  days_hosp
		,  cbc
		,  treat1
		,  severity
		, date_check_in
		, user_check_in

		
	) VALUES (
		 p_sample_number
		,  p_gender
		,  p_age
		,  p_covid_test
		,  p_days_hosp
		,  p_cbc
		,  p_treat1
		, p_severity
		, NOW()
		, SYSTEM_USER()
	)
	;

	SELECT 
		sample_number
		,  gender
		,  age
		,  covid_test
		,  days_hosp
		,  cbc
		,  treat1
		, severity


	FROM
		subject_demographics
	WHERE
		sample_number = p_sample_number
	;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_symptoms_lookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_symptoms_lookup`(
	 IN p_symp_code CHAR(5)
	, IN p_symp_descrip VARCHAR(100)
)
    COMMENT 'Insert into the symptoms_lookup table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_SARS_CoV-2.sql
		DESCRIPTION:
			Insert values into each column of the symptoms_lookup table.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-08			Derrick Nagy		Initial Creation
	*/
	
 INSERT INTO symptoms_lookup (
	symp_code
	, symp_descrip
    
) VALUES (
	p_symp_code
	, p_symp_descrip
)
;

SELECT 
	symp_code
	, symp_descrip
FROM
    symptoms_lookup
;
 	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_check_in_re_sample` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_check_in_re_sample`(
	IN p_check_in_sample VARCHAR(9)
    , IN p_check_in_set_value ENUM('Y','N')
)
    COMMENT 'Make an update to the re_sample field in the check_in table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the need_re_sample column.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_check_in_sample);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM check_in 
    WHERE sample_number = p_check_in_sample
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
   
   

		UPDATE check_in
		SET need_re_sample = p_check_in_set_value
		WHERE sample_number = p_check_in_sample
		;

		SELECT
			sample_number
			, need_re_sample
		FROM check_in
		WHERE sample_number = p_check_in_sample
		;
        


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_check_in_subject_contacted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_check_in_subject_contacted`(
	IN p_check_in_sample VARCHAR(9)
    , IN p_check_in_set_value ENUM('Y','N')
)
    COMMENT 'Make an update to the subject_contacted field in the check_in table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the need_re_sample column.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_check_in_sample);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM check_in 
    WHERE sample_number = p_check_in_sample
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	UPDATE check_in
	SET subject_contacted = p_check_in_set_value
	WHERE sample_number = p_check_in_sample
	;

	SELECT
		sample_number
		, subject_contacted
	FROM check_in
	WHERE sample_number = p_check_in_sample
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_qc_gel_image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_qc_gel_image`(
	IN p_sample_number VARCHAR(9)
    , IN p_qc_set_value VARCHAR(100)
)
    COMMENT 'Make an update to the gel_image field in the qc table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the gel_image column.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
        
	DECLARE sample_count TINYINT DEFAULT 0;

	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM qc 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;

	UPDATE qc
	SET gel_image = p_qc_set_value
	WHERE sample_number = p_sample_number
	;

	SELECT
		sample_number
		, gel_image
	FROM qc
	WHERE sample_number = p_sample_number
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_storage_box` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_storage_box`(
	IN p_sample_number VARCHAR(9)
	, IN p_sample_stored VARCHAR(100)
	, IN p_box_label VARCHAR(100)
	, IN p_box_coordinates VARCHAR(100)
)
    COMMENT 'Make an update to a record in the storage_box table'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to a record in the storage_box table
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/

	    
	DECLARE sample_count TINYINT DEFAULT 0;
 
 	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM storage_box 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
		
	UPDATE storage_box
	SET sample_stored = p_sample_stored
		, box_label = p_box_label
		, box_coordinates = p_box_coordinates
	WHERE sample_number = p_sample_number
	;

	SELECT  
		sample_number
		, sample_stored
		, box_label
		, box_coordinates
	FROM storage_box
	WHERE sample_number = p_sample_number
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_sub_demo_days_hosp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_sub_demo_days_hosp`(
	IN p_sample_number VARCHAR(9)
	, IN p_days_hosp SMALLINT UNSIGNED
)
    COMMENT 'Make an update to the days_hosp field in the subject_demographics table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the days_hosp field in the subject_demographics table.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
 
     
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM subject_demographics 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
		
	 
	UPDATE subject_demographics 
	SET days_hosp = p_days_hosp 
	WHERE sample_number = p_sample_number
	;

	SELECT
		sample_number
		, gender
		, age
		, covid_test
		, days_hosp
		, cbc
		, treat1
	FROM subject_demographics
	WHERE sample_number = p_sample_number
	;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_sub_demo_treat1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_sub_demo_treat1`(
	IN p_sample_number VARCHAR(9)
	, IN p_treat1 VARCHAR(100)
)
    COMMENT 'Make an update to the treat1 field in the subject_demographics table.'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_update_SARS_CoV-2.sql
		DESCRIPTION:
			Make an update to the treat1 field in the subject_demographics table.
		
		Modification History
		Date modified 		- Who did it 		- what was modified
		2020-12-10			Derrick Nagy		Initial Creation
		
	*/
    
        
	DECLARE sample_count TINYINT DEFAULT 0;
    
	-- procedure to test the sample number to see if it follows the correct pattern
	CALL sp_sample_num_regexp (p_sample_number);    
    
    SELECT 
		COUNT(*)
	INTO sample_count
    FROM subject_demographics 
    WHERE sample_number = p_sample_number
    ;
    
    IF sample_count <> 1 THEN
		SIGNAL SQLSTATE '02000' -- NOT FOUND
		SET MESSAGE_TEXT = 'No matching sample record found. It does not exist possibly.';
	END IF;
    
		
	UPDATE subject_demographics 
	SET treat1 = p_treat1
	WHERE sample_number = p_sample_number
	;

	SELECT
		sample_number
		, gender
		, age
		, covid_test
		, days_hosp
		, cbc
		, treat1
	FROM subject_demographics
	WHERE sample_number = p_sample_number
	;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `db_contacts_sc2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_contacts_sc2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_contacts_sc2`;

--
-- Table structure for table `consents`
--

DROP TABLE IF EXISTS `consents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `consents` (
  `contact_id_number` tinyint unsigned NOT NULL COMMENT 'AUTOINCREMENT() primary key for the invites table',
  `consent_mailed` date DEFAULT NULL COMMENT 'The date the consent was mailed',
  `date_of_consent` date DEFAULT NULL COMMENT 'the date of consent for the patient',
  `secondary_results` enum('Y','N') NOT NULL COMMENT 'Would the patient like to receive any secondary results',
  `follow_up_by` date NOT NULL COMMENT '"the follow up by this date for the patient, default DATE plus two weeks"',
  `consent_recieved` enum('Y','N') DEFAULT NULL COMMENT 'Confirmation if the consent was received. Create a record in the consents table',
  `symptom_survey_number` int unsigned DEFAULT NULL COMMENT 'the symptom survey for the patient',
  `invited_to_survey` date DEFAULT NULL COMMENT 'the invited to survey for the patient',
  `symptom_survey_id_number` varchar(100) DEFAULT NULL COMMENT '"Symptom Survey ID Number, all records n/a?"',
  PRIMARY KEY (`contact_id_number`),
  CONSTRAINT `consents_ibfk_1` FOREIGN KEY (`contact_id_number`) REFERENCES `contacts` (`contact_id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='consents table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consents`
--

LOCK TABLES `consents` WRITE;
/*!40000 ALTER TABLE `consents` DISABLE KEYS */;
/*!40000 ALTER TABLE `consents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `contacts` (
  `contact_id_number` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT 'AUTOINCREMENT() primary key for the contacts table.',
  `first_name` varchar(100) NOT NULL COMMENT 'First name of the patient',
  `last_name` varchar(100) NOT NULL COMMENT 'Last name of the patient',
  `phone` char(12) NOT NULL COMMENT '"Phone  of the patient, includes dashes. Ex 319-111-2222"',
  `email` varchar(50) NOT NULL COMMENT 'Email  of the patient',
  `address` varchar(100) NOT NULL COMMENT 'Address  of the patient',
  `city` varchar(100) NOT NULL COMMENT 'City  of the patient',
  `state` char(2) NOT NULL COMMENT 'Two letter abveriation',
  `zipcode` varchar(5) NOT NULL COMMENT 'Zipcode  of the patient',
  PRIMARY KEY (`contact_id_number`),
  UNIQUE KEY `contact_id_number` (`contact_id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='people to be contacted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'D','Money','123-456-7890','email@email.email','123 Fake street','iowa city','IA','52242'),(2,'B','Name','122-433-7830','email@email.email','123 Fake street','iowa city','IA','52242'),(3,'C','Last','998-456-1324','person@gmail.com','65 F street, apartment 4B','Des Moins','IA','52000'),(4,'D','Ladsfsg','332-654-1334','person@yahop.com','666 A street','Muscatine','IA','52140');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_session`
--

DROP TABLE IF EXISTS `info_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `info_session` (
  `contact_id_number` tinyint unsigned NOT NULL COMMENT 'AUTOINCREMENT() primary key for the contacts table.',
  `info_session_scheduled` date DEFAULT NULL COMMENT 'the info session date scheduled for the patient',
  `info_session_time` datetime DEFAULT NULL COMMENT 'the info session time for the patient',
  `info_session_complete` enum('Y','N') DEFAULT NULL COMMENT 'is the information session complete (Y/N)',
  `cover_letter_date` date DEFAULT NULL COMMENT 'Has the cover Letter been Printed/Emailed',
  `info_appointment` datetime DEFAULT NULL COMMENT 'Information appointment confirmed',
  PRIMARY KEY (`contact_id_number`),
  CONSTRAINT `info_session_ibfk_1` FOREIGN KEY (`contact_id_number`) REFERENCES `contacts` (`contact_id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The table about the information session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_session`
--

LOCK TABLES `info_session` WRITE;
/*!40000 ALTER TABLE `info_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `invites` (
  `contact_id_number` tinyint unsigned NOT NULL COMMENT 'AUTOINCREMENT() primary key for the contacts table.',
  `covid_positive` enum('Y','N') DEFAULT NULL COMMENT 'would the patient like to know if they are covid positive?',
  `testing_method` varchar(100) DEFAULT NULL COMMENT 'The method of the test',
  `recruit_extra` varchar(100) DEFAULT NULL COMMENT 'Notes about other potential recruits',
  `invitation_date` date NOT NULL COMMENT 'the invitation date for the patient',
  `follow_up` date DEFAULT NULL COMMENT 'the date to follow up',
  `consent_recieved` enum('Y','N') DEFAULT NULL COMMENT 'Confirmation if the consent was received. Create a record in the consents table',
  PRIMARY KEY (`contact_id_number`),
  CONSTRAINT `invites_ibfk_1` FOREIGN KEY (`contact_id_number`) REFERENCES `contacts` (`contact_id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Information about the invite';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
INSERT INTO `invites` VALUES (1,'Y','Antibodies Present',NULL,'2021-01-08','2021-01-22','Y');
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_shipping_tracking`
--

DROP TABLE IF EXISTS `kit_shipping_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `kit_shipping_tracking` (
  `contact_id_number` tinyint unsigned NOT NULL COMMENT 'AUTOINCREMENT() primary key for the invites table',
  `saliva_kit_barcode` int unsigned DEFAULT NULL COMMENT 'the saliva kit barcode on the test',
  `tracking_number` varchar(100) DEFAULT NULL COMMENT 'sending tracking number for the test',
  `return_tracking` varchar(100) DEFAULT NULL COMMENT 'return tracking number for the test',
  `date_kit_mailed` date DEFAULT NULL COMMENT 'the date the kit was mailed for the patient',
  `date_sample_returned` date DEFAULT NULL COMMENT 'the date the sample was returned',
  `follow_up` date DEFAULT NULL COMMENT 'the date to follow up with the kit tracking company',
  `follow_up_complete` enum('Y','N') DEFAULT NULL COMMENT 'was the follow up completed for the patient',
  PRIMARY KEY (`contact_id_number`),
  CONSTRAINT `kit_shipping_tracking_ibfk_1` FOREIGN KEY (`contact_id_number`) REFERENCES `contacts` (`contact_id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Kit Shipping and Tracking table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit_shipping_tracking`
--

LOCK TABLES `kit_shipping_tracking` WRITE;
/*!40000 ALTER TABLE `kit_shipping_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `kit_shipping_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_contacts_sc2'
--

--
-- Dumping routines for database 'db_contacts_sc2'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_contacts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_contacts`(
	p_first_name VARCHAR(100) --  NOT NULL COMMENT 'First name of the patient'
	, p_last_name VARCHAR(100) --  NOT NULL COMMENT 'Last name of the patient'
	, p_phone CHAR(12) --  NOT NULL COMMENT '"Phone  of the patient, includes dashes. Ex 319-111-2222"'
	, p_email VARCHAR(50) --  NOT NULL COMMENT 'Email  of the patient'
	, p_address VARCHAR(100) --  NOT NULL COMMENT 'Address  of the patient'
	, p_city VARCHAR(100) --  NOT NULL COMMENT 'City  of the patient'
	, p_state CHAR(2) --  NOT NULL COMMENT 'Two letter abveriation'
	, p_zipcode VARCHAR(5) --  NOT NULL COMMENT 'Zipcode  of the patient'
)
    COMMENT 'Procedure to insert a contact'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_db_contacts_sc2.sql
		DESCRIPTION:
			Insert values into each column of the contacts table. Only inserts into contacts table
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2021-01-06			Derrick Nagy		Initial Creation
	*/
    
    	DECLARE sql_error TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;


	START TRANSACTION;
    
    INSERT INTO db_contacts_sc2.contacts (
		first_name --  VARCHAR(100) NOT NULL COMMENT 'First name of the patient'
		, last_name -- VARCHAR(100) NOT NULL COMMENT 'Last name of the patient'
		, phone --  CHAR(12) NOT NULL COMMENT '"Phone  of the patient, includes dashes. Ex 319-111-2222"'
		, email --  VARCHAR(50) NOT NULL COMMENT 'Email  of the patient'
		, address --  VARCHAR(100) NOT NULL COMMENT 'Address  of the patient'
		, city --  VARCHAR(100) NOT NULL COMMENT 'City  of the patient'
		, state --  CHAR(2) NOT NULL COMMENT 'Two letter abveriation'
		, zipcode --  VARCHAR(5) NOT NULL COMMENT 'Zipcode  of the patient'

	)VALUES (

		p_first_name --  VARCHAR(100) NOT NULL COMMENT 'First name of the patient'
		, p_last_name -- VARCHAR(100) NOT NULL COMMENT 'Last name of the patient'
		, p_phone --  CHAR(12) NOT NULL COMMENT '"Phone  of the patient, includes dashes. Ex 319-111-2222"'
		, p_email --  VARCHAR(50) NOT NULL COMMENT 'Email  of the patient'
		, p_address --  VARCHAR(100) NOT NULL COMMENT 'Address  of the patient'
		, p_city --  VARCHAR(100) NOT NULL COMMENT 'City  of the patient'
		, p_state --  CHAR(2) NOT NULL COMMENT 'Two letter abveriation'
		, p_zipcode --  VARCHAR(5) NOT NULL COMMENT 'Zipcode  of the patient'

	);
/*
	INSERT INTO invites (
		contact_id_number
		, invitation_date
		, follow_up
	)VALUES (
		last_insert_id()
		, NOW() -- invitation_date DATE NOT NULL COMMENT 'the invitation date for the patient'
		, DATE_ADD(NOW(),INTERVAL 2 WEEK)-- follow_up DATE NULL COMMENT 'the date to follow up'
	);

	INSERT INTO info_session (
		contact_id_number --  TINYINT UNSIGNED NOT NULL COMMENT 'AUTOINCREMENT() primary key for the contacts table.'
	) VALUES (
		last_insert_id() -- contact_id_number TINYINT UNSIGNED NOT NULL COMMENT 'AUTOINCREMENT() primary key for the contacts table.'
	);
 */   
    IF sql_error = FALSE THEN
		COMMIT;
	ELSE 
		ROLLBACK;
	END IF;
    
	
	SELECT
		contact_id_number
		, first_name --  VARCHAR(100) NOT NULL COMMENT 'First name of the patient'
		, last_name -- VARCHAR(100) NOT NULL COMMENT 'Last name of the patient'
		, phone --  CHAR(12) NOT NULL COMMENT '"Phone  of the patient, includes dashes. Ex 319-111-2222"'
		, email --  VARCHAR(50) NOT NULL COMMENT 'Email  of the patient'
		, address --  VARCHAR(100) NOT NULL COMMENT 'Address  of the patient'
		, city --  VARCHAR(100) NOT NULL COMMENT 'City  of the patient'
		, state --  CHAR(2) NOT NULL COMMENT 'Two letter abveriation'
		, zipcode --  VARCHAR(5) NOT NULL COMMENT 'Zipcode  of the patient'
	FROM
		contacts
	WHERE contact_id_number = last_insert_id()
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_invites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_invites`(
	p_contact_id_number TINYINT
	, p_covid_positive ENUM('Y','N') --  NULL COMMENT 'would the patient like to know if they are covid positive?'
	, p_testing_method VARCHAR(100) --  NULL COMMENT 'The method of the test'
	, p_recruit_extra VARCHAR(100) --  NULL COMMENT 'Notes about other potential recruits'
    , p_consent_recieved ENUM('Y','N')
)
    COMMENT 'Insert into the invites table with contact_id_number'
BEGIN
	/*
		Copyright statement
		Author: Derrick Nagy
		File:	procedures_insert_db_contacts_sc2.sql
		DESCRIPTION:
			Insert values into the invites table using the contact_id_number.
        
		Modification History
		Date modified 		- Who did it 		- what was modified
		2021-01-08			Derrick Nagy		Initial Creation
	*/
INSERT INTO invites(
	contact_id_number
	, covid_positive
    , testing_method
    , recruit_extra
    , invitation_date
    , follow_up
    , consent_recieved
) VALUES (
	p_contact_id_number
	, p_covid_positive --  ENUM('Y','N') NULL COMMENT 'would the patient like to know if they are covid positive?'
	, p_testing_method --  VARCHAR(100) NULL COMMENT 'The method of the test'
	, p_recruit_extra --  VARCHAR(100) NULL COMMENT 'Notes about other potential recruits'
	, NOW() -- invitation_date DATE NOT NULL COMMENT 'the invitation date for the patient'
	, DATE_ADD(NOW(),INTERVAL 2 WEEK)-- follow_up DATE NULL COMMENT 'the date to follow up'
    , p_consent_recieved
    

)
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `sars_cov_2`
--

USE `sars_cov_2`;

--
-- Final view structure for view `v_check_in`
--

/*!50001 DROP VIEW IF EXISTS `v_check_in`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_check_in` AS select `check_in`.`sample_number` AS `sample_number`,`check_in`.`sample_type` AS `sample_type`,`check_in`.`date_sample_received` AS `date_sample_received`,`check_in`.`sample_condition_notes` AS `sample_condition_notes`,`check_in`.`need_re_sample` AS `need_re_sample`,`check_in`.`subject_contacted` AS `subject_contacted` from `check_in` order by `check_in`.`sample_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logs_past_week`
--

/*!50001 DROP VIEW IF EXISTS `v_logs_past_week`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_logs_past_week` AS select `change_log`.`log_date` AS `log_date`,`change_log`.`log_user` AS `log_user`,`change_log`.`log_table` AS `log_table`,`change_log`.`log_change_type` AS `log_change_type`,`change_log`.`log_sample` AS `log_sample`,`change_log`.`log_change` AS `log_change` from `change_log` where (`change_log`.`log_date` > (now() - interval 1 week)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sample_information`
--

/*!50001 DROP VIEW IF EXISTS `v_sample_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sample_information` AS select `check_in`.`sample_number` AS `sample_number`,`check_in`.`date_sample_received` AS `date_sample_received`,`check_in`.`sample_condition_notes` AS `sample_condition_notes`,`qc`.`vol_of_hydration_buffer` AS `vol_of_hydration_buffer`,`qc`.`amt_of_dna` AS `amt_of_dna`,`qc`.`frag_gel` AS `frag_gel`,`qc`.`date_of_gel` AS `date_of_gel`,`qc`.`lane_number` AS `lane_number`,`qc`.`gel_image` AS `gel_image`,`storage_box`.`sample_stored` AS `sample_stored`,`storage_box`.`box_label` AS `box_label`,`storage_box`.`box_coordinates` AS `box_coordinates` from (`storage_box` left join (`qc` left join `check_in` on((`check_in`.`sample_number` = `qc`.`sample_number`))) on((`check_in`.`sample_number` = `storage_box`.`sample_number`))) order by `check_in`.`sample_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_shared_variants_severe_outcome`
--

/*!50001 DROP VIEW IF EXISTS `v_shared_variants_severe_outcome`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_shared_variants_severe_outcome` AS select `check_in`.`sample_number` AS `sample_number`,`subject_demographics`.`severity` AS `severity`,`gene_table`.`gene_name` AS `gene_name`,`gene_table`.`coding_variant` AS `coding_variant` from ((`check_in` join `subject_demographics` on((`check_in`.`sample_number` = `subject_demographics`.`sample_number`))) join `gene_table` on((`subject_demographics`.`sample_number` = `gene_table`.`sample_number`))) where ((`subject_demographics`.`severity` = 'severe') and `gene_table`.`coding_variant` in (select distinct `v_variants_in_common`.`coding_variant` from `v_variants_in_common`)) order by `gene_table`.`coding_variant` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_shared_variants_severe_outcome_description`
--

/*!50001 DROP VIEW IF EXISTS `v_shared_variants_severe_outcome_description`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_shared_variants_severe_outcome_description` AS select `v_shared_variants_severe_outcome`.`sample_number` AS `sample_number`,`v_shared_variants_severe_outcome`.`severity` AS `severity`,`v_shared_variants_severe_outcome`.`gene_name` AS `gene_name`,`v_shared_variants_severe_outcome`.`coding_variant` AS `coding_variant`,`gene_lookup`.`protein_change` AS `protein_change`,`gene_lookup`.`gene_description` AS `gene_description`,`gene_lookup`.`location_chromo` AS `location_chromo`,`gene_lookup`.`grch38_location` AS `grch38_location` from (`v_shared_variants_severe_outcome` join `gene_lookup` on((`v_shared_variants_severe_outcome`.`coding_variant` = `gene_lookup`.`coding_variant`))) order by `v_shared_variants_severe_outcome`.`coding_variant` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_variants_in_common`
--

/*!50001 DROP VIEW IF EXISTS `v_variants_in_common`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_variants_in_common` AS select `t1`.`sample_number` AS `sample_number`,`t1`.`gene_name` AS `gene_name`,`t1`.`coding_variant` AS `coding_variant` from (`gene_table` `t1` join `gene_table` `t2` on(((`t1`.`coding_variant` = `t2`.`coding_variant`) and (`t1`.`sample_number` <> `t2`.`sample_number`)))) order by `t1`.`coding_variant` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `db_contacts_sc2`
--

USE `db_contacts_sc2`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-11 13:09:27
