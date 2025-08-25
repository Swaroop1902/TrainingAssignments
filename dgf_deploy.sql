-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dgf
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `assigned_courses`
--

DROP TABLE IF EXISTS `assigned_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_courses` (
  `assignment_id` char(36) NOT NULL DEFAULT (uuid()),
  `request_id` char(36) NOT NULL,
  `employee_id` char(36) NOT NULL,
  `mentor_id` char(36) NOT NULL,
  `course_id` char(36) NOT NULL,
  `coursetype_id` char(36) NOT NULL,
  `completion_date` date DEFAULT NULL,
  `comments` text,
  `assigned_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `learning_type` varchar(255) DEFAULT NULL,
  `progress` int DEFAULT '0',
  `status` varchar(50) DEFAULT 'Learning Initiated',
  `status_assigned_date` timestamp NULL DEFAULT NULL,
  `status_modified_date` timestamp NULL DEFAULT NULL,
  `course_assigned_by_id` char(36) DEFAULT 'SYS_ADMIN',
  `employee_email_sent` tinyint(1) DEFAULT '0',
  `employee_email_sent_date` datetime DEFAULT NULL,
  `manager_email_sent` tinyint(1) DEFAULT '0',
  `manager_email_sent_date` datetime DEFAULT NULL,
  `manager_second_email_sent` tinyint(1) DEFAULT '0',
  `manager_second_email_sent_date` timestamp NULL DEFAULT NULL,
  `effectiveness_initiated` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`assignment_id`),
  UNIQUE KEY `idx_reqid_course_employee` (`request_id`,`course_id`,`employee_id`),
  KEY `idx_requestid` (`request_id`),
  KEY `idx_employee_id` (`employee_id`),
  KEY `idx_mentor_id` (`mentor_id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_coursetype_id` (`coursetype_id`),
  KEY `idx_course_status` (`employee_id`,`request_id`,`status`),
  KEY `idx_empid_reqid` (`employee_id`,`request_id`),
  KEY `idx_assignmentid` (`assignment_id`),
  CONSTRAINT `fk_assigned_courses_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `fk_assigned_courses_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_assigned_courses_mentor` FOREIGN KEY (`mentor_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_assigned_courses_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_assigned_courses_type` FOREIGN KEY (`coursetype_id`) REFERENCES `course_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_courses`
--

LOCK TABLES `assigned_courses` WRITE;
/*!40000 ALTER TABLE `assigned_courses` DISABLE KEYS */;
INSERT INTO `assigned_courses` VALUES ('44527f9b-7ead-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','18890a29-fcbe-421f-b1e3-9e4eec16c159','a86185d6-a5ab-4d6d-89b5-1b03fa222ba0','b2c3d4e5-f678-90ab-cdef-234567890abc','4324f270-506c-4f27-86b1-3559872f07da','2025-08-22','none','2025-08-21 16:38:28','Full Stack',0,'Incomplete','2025-08-21 17:05:01','2025-08-22 12:49:33','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',0,NULL,0,NULL,0,NULL,0,'2025-08-21 16:38:28','2025-08-22 12:49:33'),('b6a37f53-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','18890a29-fcbe-421f-b1e3-9e4eec16c159','a86185d6-a5ab-4d6d-89b5-1b03fa222ba0','b2c3d4e5-f678-90ab-cdef-234567890abc','1625dfba-eeb3-43ee-a4bc-1eea4a71d5d5','2025-08-23','','2025-08-22 06:03:24','Full Stack',0,'Completed','2025-08-22 06:04:19','2025-08-22 12:34:26','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',0,NULL,0,NULL,0,NULL,0,'2025-08-22 06:03:24','2025-08-22 12:34:26'),('c3d4e5f6-7890-abcd-ef12-34567890abcd','a1b2c3d4-e5f6-7890-abcd-ef1234567890','18890a29-fcbe-421f-b1e3-9e4eec16c159','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','b2c3d4e5-f678-90ab-cdef-234567890abc','1625dfba-eeb3-43ee-a4bc-1eea4a71d5d5',NULL,NULL,'2025-07-22 17:20:20',NULL,0,'Completed','2025-08-04 13:04:43','2025-08-04 13:15:56','SYS_ADMIN',1,'2025-07-24 10:30:00',0,NULL,0,'2025-08-02 20:05:18',0,'2025-07-22 17:20:20','2025-08-04 13:15:56'),('dc61dac0-7eac-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','18890a29-fcbe-421f-b1e3-9e4eec16c159','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','b2c3d4e5-f678-90ab-cdef-234567890abc','201a2338-5ff4-4802-8447-1cde49e95bc2','2025-08-22',NULL,'2025-08-21 16:35:34','Full Stack',0,'Learning Suspended','2025-08-21 17:04:11','2025-08-22 13:51:01','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',0,NULL,0,NULL,0,NULL,0,'2025-08-21 16:35:34','2025-08-22 13:53:30'),('f5914c9e-7eaf-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','18890a29-fcbe-421f-b1e3-9e4eec16c159','611c5694-2dad-49f6-8ee6-58c0555c88a5','b2c3d4e5-f678-90ab-cdef-234567890abc','ad6346e7-1053-44d2-998f-a11311688b52','2025-08-29','done','2025-08-21 16:57:45','Full Stack',0,'Completed with Delay','2025-08-22 12:26:11','2025-08-22 12:26:13','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',0,NULL,0,NULL,0,NULL,0,'2025-08-21 16:57:45','2025-08-22 12:26:13');
/*!40000 ALTER TABLE `assigned_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` char(36) NOT NULL DEFAULT (uuid()),
  `request_id` char(36) NOT NULL,
  `parent_comment_id` char(36) DEFAULT NULL,
  `comment_text` longtext NOT NULL,
  `created_by` char(36) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` char(36) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `idx_requestid` (`request_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `idx_parent_comment_id` (`parent_comment_id`),
  CONSTRAINT `fk_comments_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_comments_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_comments_parent` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`comment_id`),
  CONSTRAINT `fk_comments_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('09bb8c73-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb',NULL,'i need clarificarion','6afbca56-aed5-4c72-83a3-949415117c28','2025-08-25 09:44:04',NULL,'2025-08-25 09:44:04','2025-08-25 09:44:04','2025-08-25 09:44:04'),('1029ca2d-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80',NULL,'approve','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-21 13:02:16',NULL,'2025-08-21 13:02:16','2025-08-21 13:02:16','2025-08-21 13:02:16'),('277a5db2-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d',NULL,'Approved.','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-22 05:59:24',NULL,'2025-08-22 05:59:24','2025-08-22 05:59:24','2025-08-22 05:59:24'),('d78d0f68-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e',NULL,'approved','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-21 10:01:44',NULL,'2025-08-21 10:01:44','2025-08-21 10:01:44','2025-08-21 10:01:44'),('f8d5abf5-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b',NULL,'Rejected','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-21 12:47:18',NULL,'2025-08-21 12:47:18','2025-08-21 12:47:18','2025-08-21 12:47:18');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` char(36) NOT NULL DEFAULT (uuid()),
  `course_name` varchar(255) NOT NULL,
  `course_description` text,
  `duration_hours` int DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `short_name` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `category_sort_order` int DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `id_number` varchar(255) DEFAULT NULL,
  `summary_format` int DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `show_grades` int DEFAULT NULL,
  `news_items` int DEFAULT NULL,
  `start_date` int DEFAULT NULL,
  `end_date` int DEFAULT NULL,
  `num_sections` int DEFAULT NULL,
  `max_bytes` int DEFAULT NULL,
  `show_reports` int DEFAULT NULL,
  `visible` int DEFAULT NULL,
  `group_mode` int DEFAULT NULL,
  `group_mode_force` int DEFAULT NULL,
  `default_grouping_id` int DEFAULT NULL,
  `time_modified` int DEFAULT NULL,
  `enable_completion` int DEFAULT NULL,
  `completion_notify` int DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `force_theme` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`course_id`),
  KEY `idx_course_name` (`course_name`),
  KEY `idx_course_coursename` (`course_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('b2c3d4e5-f678-90ab-cdef-234567890abc','AWS Essentials','Intro to AWS services and architecture',16,'2025-07-22 17:14:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-07-22 17:14:35','2025-07-22 17:14:35');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_type` (
  `type_id` char(36) NOT NULL DEFAULT (uuid()),
  `type_name` varchar(255) NOT NULL,
  `type_description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`),
  KEY `idx_course_type_typeid` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_type`
--

LOCK TABLES `course_type` WRITE;
/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` VALUES ('1625dfba-eeb3-43ee-a4bc-1eea4a71d5d5','Functional','Functional Training','2025-07-22 11:12:54','2025-07-22 11:12:54'),('201a2338-5ff4-4802-8447-1cde49e95bc2','Leadership','Leadership Development','2025-07-22 11:12:54','2025-07-22 11:12:54'),('4324f270-506c-4f27-86b1-3559872f07da','Induction','Induction Programs','2025-07-22 11:12:54','2025-07-22 11:12:54'),('63aa048c-b48d-4706-9296-227eb03b8f95','Compliance','Compliance Courses','2025-07-22 11:12:54','2025-07-22 11:12:54'),('640242be-6461-423d-8adf-66bdcd36a2ee','Product','Product Training','2025-07-22 11:12:54','2025-07-22 11:12:54'),('687fedb5-1ccf-43d5-bef1-a775145cb72a','Management','Management Courses','2025-07-22 11:12:54','2025-07-22 11:12:54'),('7e77f088-3054-4f6a-8ef9-6e0e338390d2','Language','Language Training','2025-07-22 11:12:54','2025-07-22 11:12:54'),('a04cf394-5810-41f0-a332-d759367cc617','Technical','Technical Courses','2025-07-22 11:12:54','2025-07-22 11:12:54'),('a3a0ad98-7dde-405a-bf07-4b1e8238195c','Soft Skills','Soft Skills Courses','2025-07-22 11:12:54','2025-07-22 11:12:54'),('ad6346e7-1053-44d2-998f-a11311688b52','Domain','Domain Training','2025-07-22 11:12:54','2025-07-22 11:12:54');
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_reminders`
--

DROP TABLE IF EXISTS `email_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_reminders` (
  `email_reminder_id` char(36) NOT NULL DEFAULT (uuid()),
  `assignment_id` char(36) NOT NULL,
  `reminder_count` int DEFAULT '0',
  `email_sent_by` char(36) NOT NULL,
  `last_reminder_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `request_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_reminder_id`),
  KEY `idx_assignment_id` (`assignment_id`),
  KEY `idx_email_sent_by` (`email_sent_by`),
  KEY `idx_requestid` (`request_id`),
  CONSTRAINT `fk_email_reminders_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assigned_courses` (`assignment_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_email_reminders_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`),
  CONSTRAINT `fk_email_reminders_sender` FOREIGN KEY (`email_sent_by`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_reminders`
--

LOCK TABLES `email_reminders` WRITE;
/*!40000 ALTER TABLE `email_reminders` DISABLE KEYS */;
INSERT INTO `email_reminders` VALUES ('63191e92-6ebd-11f0-afd8-00090faa0001','c3d4e5f6-7890-abcd-ef12-34567890abcd',4,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','2025-08-04 13:37:57','a1b2c3d4-e5f6-7890-abcd-ef1234567890','2025-08-01 09:53:33','2025-08-04 13:37:57');
/*!40000 ALTER TABLE `email_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_newtraining_requested`
--

DROP TABLE IF EXISTS `emp_newtraining_requested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_newtraining_requested` (
  `emp_newtraining_requested_id` char(36) NOT NULL DEFAULT (uuid()),
  `emp_id` char(36) NOT NULL,
  `available_from` date NOT NULL,
  `daily_band` varchar(100) NOT NULL,
  `available_on_weekend` tinyint(1) NOT NULL,
  `request_id` char(36) NOT NULL,
  `email_sent_status` bigint DEFAULT '0',
  `email_sent_date` date DEFAULT NULL,
  `comment` longtext,
  `status` varchar(50) DEFAULT 'Not Assigned',
  `courses_assigned` int NOT NULL DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_modified_date` timestamp NULL DEFAULT NULL,
  `status_assigned_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_newtraining_requested_id`),
  KEY `idx_emp_id` (`emp_id`),
  KEY `idx_requestid` (`request_id`),
  KEY `idx_emp_request` (`emp_id`,`request_id`),
  KEY `idx_emp_newtrainingrequested_empid_reqid` (`emp_id`,`request_id`),
  CONSTRAINT `fk_enr_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_enr_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_newtraining_requested`
--

LOCK TABLES `emp_newtraining_requested` WRITE;
/*!40000 ALTER TABLE `emp_newtraining_requested` DISABLE KEYS */;
INSERT INTO `emp_newtraining_requested` VALUES ('00c01c7e-7e8f-11f0-ad82-64d69ac2e52e','18890a29-fcbe-421f-b1e3-9e4eec16c159','2025-08-21','4 Hours',0,'98a0ef22-9e76-4f2c-945d-16bfb8f6bb80',0,NULL,NULL,'Learning Suspended',1,'2025-08-21 13:01:50','2025-08-22 13:53:30',NULL,'2025-08-21 13:01:50','2025-08-22 13:53:30'),('077cc173-7f1d-11f0-ad82-64d69ac2e52e','18890a29-fcbe-421f-b1e3-9e4eec16c159','2025-08-27','4 Hours',1,'deb25132-0a2c-4650-9a60-5f1c76ea557d',0,NULL,NULL,'Learning Initiated',1,'2025-08-22 05:58:30',NULL,NULL,'2025-08-22 05:58:30','2025-08-22 06:03:24'),('63e39919-715b-11f0-afd8-00090faa0001','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','2025-08-10','9am - 6pm',0,'a1b2c3d4-e5f6-7890-abcd-ef1234567890',0,NULL,'Requested for Python AWS training','Not Assigned',0,'2025-08-04 17:49:38',NULL,NULL,'2025-08-04 17:49:38','2025-08-04 17:49:38'),('691a4236-7f2e-11f0-ad82-64d69ac2e52e','bc8d010f-5969-4a4d-a999-cb15245d139d','2025-08-23','2 Hours',1,'5ee79872-a343-49f7-b390-014471c6abdb',0,NULL,NULL,'Not Assigned',0,'2025-08-22 08:02:55',NULL,NULL,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('868e13b3-7ce9-11f0-a383-64d69ac2e52e','18890a29-fcbe-421f-b1e3-9e4eec16c159','2025-08-21','2 Hours',1,'bf466a95-cd96-4a85-ac5c-293507dbbc14',0,NULL,NULL,'Learning Initiated',1,'2025-08-19 10:44:47',NULL,NULL,'2025-08-19 10:44:47','2025-08-21 16:57:45'),('c9fa4733-7e75-11f0-ad82-64d69ac2e52e','18890a29-fcbe-421f-b1e3-9e4eec16c159','2025-08-23','2 Hours',1,'b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e',0,NULL,NULL,'Incomplete',1,'2025-08-21 10:01:21',NULL,NULL,'2025-08-21 10:01:21','2025-08-22 12:50:41'),('e89706b2-7e8a-11f0-ad82-64d69ac2e52e','18890a29-fcbe-421f-b1e3-9e4eec16c159','2025-08-22','2 Hours',1,'aa9dd59f-60af-49a2-a1a2-cd8781bfe80b',0,NULL,NULL,'Not Assigned',0,'2025-08-21 12:32:32',NULL,NULL,'2025-08-21 12:32:32','2025-08-21 12:32:32');
/*!40000 ALTER TABLE `emp_newtraining_requested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` char(36) NOT NULL DEFAULT (uuid()),
  `emp_code` varchar(50) NOT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `manager_id` char(36) DEFAULT NULL,
  `manager12_id` char(36) DEFAULT NULL,
  `designation_name` varchar(100) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_id`),
  KEY `idx_employee_email` (`emp_email`),
  KEY `idx_employee_name` (`emp_name`),
  KEY `idx_employee_manager` (`manager_id`),
  KEY `idx_employee_designation` (`designation_name`),
  KEY `fk_employee_manager12` (`manager12_id`),
  CONSTRAINT `fk_employee_manager` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_employee_manager12` FOREIGN KEY (`manager12_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','EMP006','Aarti Joshi','aarti.j@harbingergroup.com',NULL,'2e95b80f-7269-4aba-9a14-90702eab00ba',NULL,'Manager',NULL,'2025-07-22 11:12:54','2025-08-02 19:56:38'),('18890a29-fcbe-421f-b1e3-9e4eec16c159','EMP001','Ravi Kumar','ravi.k@harbingergroup.com',NULL,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','Data Engineer',NULL,'2025-07-22 11:12:54','2025-08-14 11:39:32'),('2e95b80f-7269-4aba-9a14-90702eab00ba','EMP009','Deepak Yadav','deepak.y@example.com',NULL,NULL,NULL,'Consultant',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('3c61638c-d0c2-4388-8ba7-43829197e081','EMP005','Nikhil Verma','nikhil.v@example.com',NULL,NULL,NULL,'Associate',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('611c5694-2dad-49f6-8ee6-58c0555c88a5','EMP004','Seema Rai','seema.r@example.com',NULL,NULL,NULL,'Mentor',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('6afbca56-aed5-4c72-83a3-949415117c47','EMP003','Manoj Sinha','manoj.s@example.com',NULL,'a86185d6-a5ab-4d6d-89b5-1b03fa222ba0','a86185d6-a5ab-4d6d-89b5-1b03fa222ba0','Trainer',NULL,'2025-07-22 11:12:54','2025-08-22 08:00:03'),('70abacea-bdf7-4731-96dd-3798188c899b','EMP008','Sonal Kapoor','sonal.k@example.com',NULL,NULL,NULL,'Lead',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('a5e6f7b8-c9d0-1234-ef01-5678901234ef','EMP005','Ethan Hunt','ethan@harbingergroup.com',NULL,'d2b3c4e5-f6a7-8901-bcde-2345678901bc','e3c4d5f6-a7b8-9012-cdef-3456789012cd','Intern','f5e6a7b8-c9d0-1234-ef01-5678901234ef','2025-07-22 11:14:58','2025-07-22 11:14:58'),('a86185d6-a5ab-4d6d-89b5-1b03fa222ba0','EMP007','Rahul Dev','rahul.d@example.com',NULL,NULL,NULL,'Architect',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('bc8d010f-5969-4a4d-a999-cb15245d139d','EMP010','Meena Singh','meena.s@harbingergroup.com',NULL,'c9a1f3e2-1e4f-4e2a-9a1e-1f3e2e4f9a1e',NULL,'Analyst',NULL,'2025-07-22 11:12:54','2025-07-25 08:00:00'),('c9a1f3e2-1e4f-4e2a-9a1e-1f3e2e4f9a1e','EMP001','Alice Johnson','alice@harbingergroup.com',NULL,NULL,NULL,'Team Lead','b1a2c3d4-e5f6-7890-abcd-1234567890ab','2025-07-22 11:14:58','2025-07-22 11:14:58'),('d2b3c4e5-f6a7-8901-bcde-2345678901bc','EMP002','Bob Smith','bob@harbingergroup.com',NULL,'c9a1f3e2-1e4f-4e2a-9a1e-1f3e2e4f9a1e',NULL,'Developer','c2b3d4e5-f6a7-8901-bcde-2345678901bc','2025-07-22 11:14:58','2025-07-22 11:14:58'),('e3c4d5f6-a7b8-9012-cdef-3456789012cd','EMP003','Charlie Lee','charlie@harbingergroup.com',NULL,'c9a1f3e2-1e4f-4e2a-9a1e-1f3e2e4f9a1e',NULL,'Developer','d3c4e5f6-a7b8-9012-cdef-3456789012cd','2025-07-22 11:14:58','2025-07-22 11:14:58'),('e8ceeb3e-cf7a-4356-8798-153f73b07bf3','EMP002','Anjali Mehta','anjali.m@example.com',NULL,NULL,NULL,'BI Analyst',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('f4d5e6a7-b8c9-0123-def0-4567890123de','EMP004','Diana Prince','diana@harbingergroup.com',NULL,NULL,NULL,'HR Manager','e4d5f6a7-b8c9-0123-def0-4567890123de','2025-07-22 11:14:58','2025-07-22 11:14:58');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initate_training_comments`
--

DROP TABLE IF EXISTS `initate_training_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `initate_training_comments` (
  `training_comment_id` char(36) NOT NULL DEFAULT (uuid()),
  `assignment_id` char(36) NOT NULL,
  `created_by` char(36) NOT NULL,
  `comment_text` text NOT NULL,
  `created_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`training_comment_id`),
  KEY `idx_assignment_id` (`assignment_id`),
  KEY `idx_created_by` (`created_by`),
  CONSTRAINT `fk_training_comments_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assigned_courses` (`assignment_id`),
  CONSTRAINT `fk_training_comments_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initate_training_comments`
--

LOCK TABLES `initate_training_comments` WRITE;
/*!40000 ALTER TABLE `initate_training_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `initate_training_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initiate_training_reminders`
--

DROP TABLE IF EXISTS `initiate_training_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `initiate_training_reminders` (
  `reminder_id` char(36) NOT NULL DEFAULT (uuid()),
  `assignment_id` char(36) NOT NULL,
  `reminder_date` date NOT NULL,
  `reminder_text` text NOT NULL,
  `created_by` char(36) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reminder_id`),
  KEY `idx_assignment_id` (`assignment_id`),
  KEY `idx_created_by` (`created_by`),
  CONSTRAINT `fk_reminders_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assigned_courses` (`assignment_id`),
  CONSTRAINT `fk_reminders_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initiate_training_reminders`
--

LOCK TABLES `initiate_training_reminders` WRITE;
/*!40000 ALTER TABLE `initiate_training_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `initiate_training_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learner_feedback`
--

DROP TABLE IF EXISTS `learner_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learner_feedback` (
  `learner_feedback_id` char(36) NOT NULL DEFAULT (uuid()),
  `reqid` char(36) NOT NULL,
  `course_id` char(36) NOT NULL,
  `employee_id` char(36) NOT NULL,
  `instruction_rating` varchar(255) DEFAULT NULL,
  `training_topic` varchar(255) DEFAULT NULL,
  `engaged_rating` varchar(255) DEFAULT NULL,
  `interactive` varchar(255) NOT NULL,
  `interactive_components` varchar(255) NOT NULL DEFAULT '0',
  `improved_comments` varchar(255) DEFAULT NULL,
  `engaged_session_rating` varchar(255) DEFAULT NULL,
  `other_suggestions` varchar(255) DEFAULT NULL,
  `feedback_submitted_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`learner_feedback_id`),
  KEY `idx_lf_req_course_emp` (`reqid`,`course_id`,`employee_id`),
  CONSTRAINT `fk_learner_feedback_assigned` FOREIGN KEY (`reqid`, `course_id`, `employee_id`) REFERENCES `assigned_courses` (`request_id`, `course_id`, `employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learner_feedback`
--

LOCK TABLES `learner_feedback` WRITE;
/*!40000 ALTER TABLE `learner_feedback` DISABLE KEYS */;
INSERT INTO `learner_feedback` VALUES ('4d7c7e64-710b-11f0-afd8-00090faa0001','a1b2c3d4-e5f6-7890-abcd-ef1234567890','b2c3d4e5-f678-90ab-cdef-234567890abc','18890a29-fcbe-421f-b1e3-9e4eec16c159','4','React JS','4','Yes','3','Great training!','4','More real-life examples',NULL,'2025-08-04 08:16:20','2025-08-04 08:16:20');
/*!40000 ALTER TABLE `learner_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_feedback`
--

DROP TABLE IF EXISTS `manager_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_feedback` (
  `manager_feedback_id` char(36) NOT NULL DEFAULT (uuid()),
  `reqid` char(36) DEFAULT NULL,
  `course_id` char(36) DEFAULT NULL,
  `employee_id` char(36) DEFAULT NULL,
  `manager_id` char(36) DEFAULT NULL,
  `demonstrate_skill` varchar(10) DEFAULT NULL,
  `skill_date` date DEFAULT NULL,
  `enhancement_rating` int DEFAULT NULL,
  `suggestions` text,
  `opportunity_date` date DEFAULT NULL,
  `feedback_submitted_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`manager_feedback_id`),
  KEY `idx_mf_reqid` (`reqid`),
  KEY `idx_mf_course_id` (`course_id`),
  KEY `idx_mf_employee_id` (`employee_id`),
  KEY `idx_mf_manager_id` (`manager_id`),
  KEY `idx_mf_req_course_emp` (`reqid`,`course_id`,`employee_id`),
  CONSTRAINT `fk_mf_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `fk_mf_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_mf_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_mf_reqid` FOREIGN KEY (`reqid`) REFERENCES `new_training_request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_feedback`
--

LOCK TABLES `manager_feedback` WRITE;
/*!40000 ALTER TABLE `manager_feedback` DISABLE KEYS */;
INSERT INTO `manager_feedback` VALUES ('5ba8ed4e-7109-11f0-afd8-00090faa0001','a1b2c3d4-e5f6-7890-abcd-ef1234567890','b2c3d4e5-f678-90ab-cdef-234567890abc','18890a29-fcbe-421f-b1e3-9e4eec16c159','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','Yes','2025-07-30',4,'Could focus more on project-level application.','2025-08-15','2025-08-04 08:02:25','2025-08-04 08:02:25','2025-08-04 08:02:25');
/*!40000 ALTER TABLE `manager_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_request_assign`
--

DROP TABLE IF EXISTS `mentor_request_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentor_request_assign` (
  `request_id` char(36) NOT NULL,
  `mentor_id` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`,`mentor_id`),
  KEY `idx_mentor_id` (`mentor_id`),
  CONSTRAINT `fk_mentor_assign_mentor` FOREIGN KEY (`mentor_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_mentor_assign_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_request_assign`
--

LOCK TABLES `mentor_request_assign` WRITE;
/*!40000 ALTER TABLE `mentor_request_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentor_request_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `run_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'/20250711172551-employee','2025-07-22 16:42:52'),(2,'/20250714063447-role','2025-07-22 16:42:52'),(3,'/20250714063529-users','2025-07-22 16:42:52'),(4,'/20250714063730-source','2025-07-22 16:42:52'),(5,'/20250714093016-training-obj','2025-07-22 16:42:52'),(6,'/20250714093109-tech-stack','2025-07-22 16:42:52'),(7,'/20250714093150-service-division','2025-07-22 16:42:53'),(8,'/20250714093231-project-name','2025-07-22 16:42:53'),(9,'/20250714094322-new-training-request','2025-07-22 16:42:53'),(10,'/20250714094342-course-type','2025-07-22 16:42:53'),(11,'/20250714094352-course','2025-07-22 16:42:53'),(12,'/20250714094403-assigned-courses','2025-07-22 16:42:53'),(13,'/20250714095413-comments','2025-07-22 16:42:53'),(14,'/20250714095436-notifications','2025-07-22 16:42:53'),(15,'/20250714095502-learner-feedback','2025-07-22 16:42:53'),(16,'/20250714095526-manager-feedback','2025-07-22 16:42:53'),(17,'/20250716052810-mentor-request-assign','2025-07-22 16:42:53'),(18,'/20250716052839-email-reminders','2025-07-22 16:42:53'),(19,'/20250716052859-initate-training-comments','2025-07-22 16:42:54'),(20,'/20250716052920-initiate-training-reminders','2025-07-22 16:42:54'),(21,'/20250716094624-emp-newtraining-requested','2025-07-22 16:42:54'),(22,'/20250716094656-primary-skill','2025-07-22 16:42:54'),(23,'/20250716094719-request-designations','2025-07-22 16:42:54'),(24,'/20250716094742-request-primary-skills','2025-07-22 16:42:54'),(25,'/20250716094804-role-source-assign','2025-07-22 16:42:54'),(26,'/20250716094823-status-comments','2025-07-22 16:42:54'),(27,'/20250721095304-user-role','2025-07-22 16:42:54'),(28,'/20250722050904-insert-static-data','2025-07-22 16:42:54');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_training_request`
--

DROP TABLE IF EXISTS `new_training_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_training_request` (
  `request_number` char(5) NOT NULL,
  `request_id` char(36) NOT NULL DEFAULT (uuid()),
  `source` char(36) NOT NULL,
  `training_obj` char(36) DEFAULT NULL,
  `request_on_behalf_of` char(36) DEFAULT NULL,
  `request_type` longtext,
  `project_id` char(36) DEFAULT NULL,
  `expected_deadline` date DEFAULT NULL,
  `tech_stack` char(36) DEFAULT NULL,
  `other_skill` longtext,
  `suggested_completion_criteria` longtext,
  `comments` longtext,
  `number_of_people` bigint DEFAULT NULL,
  `requested_by` longtext,
  `requested_by_id` char(36) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `request_status` varchar(255) DEFAULT 'Approval Requested',
  `approved_by` varchar(255) DEFAULT NULL,
  `service_division_id` char(36) DEFAULT NULL,
  `new_prospect_name` varchar(255) DEFAULT NULL,
  `request_category` tinyint DEFAULT NULL,
  `learning_type` bigint DEFAULT NULL,
  `skill_development` bigint DEFAULT NULL,
  `assigned_to` char(36) DEFAULT NULL,
  `org_level` tinyint(1) DEFAULT NULL,
  `status_assigned_date` timestamp NULL DEFAULT NULL,
  `status_modified_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`),
  KEY `idx_source` (`source`),
  KEY `idx_trainingobj` (`training_obj`),
  KEY `idx_projectid` (`project_id`),
  KEY `idx_techstack` (`tech_stack`),
  KEY `idx_service_division` (`service_division_id`),
  KEY `idx_requestonbehalfof` (`request_on_behalf_of`),
  KEY `idx_requestedbyid` (`requested_by_id`),
  KEY `idx_assigned_to` (`assigned_to`),
  KEY `idx_request_status` (`request_id`,`request_status`),
  KEY `idx_ntr_requestid` (`request_id`),
  KEY `idx_ntr_status` (`request_status`),
  KEY `idx_ntr_org_level` (`org_level`),
  CONSTRAINT `fk_ntr_assignedto` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_ntr_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_name` (`project_id`),
  CONSTRAINT `fk_ntr_requestedbyid` FOREIGN KEY (`requested_by_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_ntr_requestonbehalfof` FOREIGN KEY (`request_on_behalf_of`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_ntr_service_division` FOREIGN KEY (`service_division_id`) REFERENCES `service_division` (`service_division_id`),
  CONSTRAINT `fk_ntr_source` FOREIGN KEY (`source`) REFERENCES `source` (`source_id`),
  CONSTRAINT `fk_ntr_techstack` FOREIGN KEY (`tech_stack`) REFERENCES `tech_stack` (`stack_id`),
  CONSTRAINT `fk_ntr_trainingobj` FOREIGN KEY (`training_obj`) REFERENCES `training_obj` (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_training_request`
--

LOCK TABLES `new_training_request` WRITE;
/*!40000 ALTER TABLE `new_training_request` DISABLE KEYS */;
INSERT INTO `new_training_request` VALUES ('84437','5ee79872-a343-49f7-b390-014471c6abdb','29fa87d4-8364-4995-821f-29e70e4ff802','4a60485a-51a7-464f-a596-832489511642','bc8d010f-5969-4a4d-a999-cb15245d139d',NULL,'38dbd48f-bba1-440c-b875-dfd0304aed1d','2025-08-30','2b6ce7e6-c126-479d-abb9-3463928d248c','<p>gshddjf</p>','<p>bsgdgh</p>','<p>dfghjss</p>',1,'Meena Singh','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','2025-08-22 08:02:55',NULL,'2025-08-25 09:44:04','clarification requested','6afbca56-aed5-4c72-83a3-949415117c47','b578240e-6e3a-4310-9fce-db9d8e18812e',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-08-22 08:02:55','2025-08-25 09:44:04'),('34185','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','07a51e1d-36f6-4f16-9176-252d8ed3f2c9','f3e3e6e2-2b2f-4c6e-9e3a-3f9f6e6e6e6e','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',NULL,'38dbd48f-bba1-440c-b875-dfd0304aed1d','2025-08-22','2b6ce7e6-c126-479d-abb9-3463928d248c','<p>xdcfgvhbjn</p>','<p>cfgbhnm</p>','<p>cfvgbhnj</p>',1,'Aarti Joshi','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-21 13:01:50',NULL,'2025-08-22 13:53:30','Learning Suspended','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','b578240e-6e3a-4310-9fce-db9d8e18812e',NULL,NULL,NULL,NULL,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04m',0,'2025-08-22 13:53:30','2025-08-22 13:53:30','2025-08-21 13:01:50','2025-08-22 13:53:30'),('','a1b2c3d4-e5f6-7890-abcd-ef1234567890','29fa87d4-8364-4995-821f-29e70e4ff802','cf083f57-ad6d-40b3-bf13-d588bad4bf60','6afbca56-aed5-4c72-83a3-949415117c47','Technical','208eb593-f9ed-4c39-8762-42b728ee4e06','2025-08-15','0c370d86-5a62-4d9b-a9ec-686477f5ffb9','Python','Complete AWS hands-on labs','Need for upcoming project',3,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-07-22 17:19:29',NULL,'2025-08-21 07:09:53','rejected','212bb2e2-9c07-441f-8c2c-7a2287c741d8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-07-22 17:19:29','2025-08-21 07:09:53'),('','a1b2c3d4-e5f6-7890-abcd-ef1234567892','29fa87d4-8364-4995-821f-29e70e4ff802','cf083f57-ad6d-40b3-bf13-d588bad4bf60','6afbca56-aed5-4c72-83a3-949415117c47','Technical','208eb593-f9ed-4c39-8762-42b728ee4e06','2025-08-16','0c370d86-5a62-4d9b-a9ec-686477f5ffb9','Python','Complete AWS hands-on labs','abcd',2,'EMP006','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-07-23 10:09:34',NULL,'2025-08-21 07:57:39','Completed','18890a29-fcbe-421f-b1e3-9e4eec16c159',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-07-23 10:09:34','2025-08-21 07:57:39'),('26852','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','07a51e1d-36f6-4f16-9176-252d8ed3f2c9','f3e3e6e2-2b2f-4c6e-9e3a-3f9f6e6e6e6e','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',NULL,'38dbd48f-bba1-440c-b875-dfd0304aed1d','2025-08-29','2b6ce7e6-c126-479d-abb9-3463928d248c','<p>tcfgvhbj</p>','<p>tcfgvbhn</p>','<p>cfgvbh</p>',1,'Aarti Joshi','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-21 12:32:31',NULL,'2025-08-21 12:47:18','rejected','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','b578240e-6e3a-4310-9fce-db9d8e18812e',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-08-21 12:32:31','2025-08-21 12:47:18'),('75432','b7e6c1e2-1234-4a5b-9cde-123456789345','2feca888-0d80-40dd-9560-040b7fe7a04f','cf083f57-ad6d-40b3-bf13-d588bad4bf60','3c61638c-d0c2-4388-8ba7-43829197e081',NULL,'4b661c18-9f8d-4c13-8471-3e2bbd722b14','2025-09-01','0c370d86-5a62-4d9b-a9ec-686477f5ffb9','Docker, Kubernetes','Complete all modules','Urgent requirement',10,'Jane Smith','212bb2e2-9c07-441f-8c2c-7a2287c741d8','2025-08-14 11:50:47',NULL,'2025-08-14 11:50:47','Approval Requested',NULL,'6a64e304-e334-4180-a999-a7f41875dd43','Prospect X',NULL,NULL,NULL,NULL,1,NULL,NULL,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('78970','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','07a51e1d-36f6-4f16-9176-252d8ed3f2c9','f3e3e6e2-2b2f-4c6e-9e3a-3f9f6e6e6e6e','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',NULL,'38dbd48f-bba1-440c-b875-dfd0304aed1d','2025-08-23','2b6ce7e6-c126-479d-abb9-3463928d248c','<p>cfgvhbj</p>','<p>dcfgvbh</p>','<p>dcfgvhbj</p>',1,'Aarti Joshi','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-21 10:01:21',NULL,'2025-08-21 16:38:28','Learning In Progress','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','b578240e-6e3a-4310-9fce-db9d8e18812e',NULL,NULL,NULL,NULL,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04m',0,NULL,NULL,'2025-08-21 10:01:21','2025-08-21 16:38:28'),('78205','bf466a95-cd96-4a85-ac5c-293507dbbc14','07a51e1d-36f6-4f16-9176-252d8ed3f2c9','f3e3e6e2-2b2f-4c6e-9e3a-3f9f6e6e6e6e','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',NULL,'38dbd48f-bba1-440c-b875-dfd0304aed1d','2025-08-21','2b6ce7e6-c126-479d-abb9-3463928d248c','<p>fcgvhb</p>','<p>fchgvh</p>','<p>xgfcv</p>',1,'Aarti Joshi','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-19 10:44:47',NULL,'2025-08-21 16:57:45','Learning In Progress','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','b578240e-6e3a-4310-9fce-db9d8e18812e',NULL,NULL,NULL,NULL,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04m',0,NULL,NULL,'2025-08-19 10:44:47','2025-08-21 16:57:45'),('42274','deb25132-0a2c-4650-9a60-5f1c76ea557d','07a51e1d-36f6-4f16-9176-252d8ed3f2c9','f3e3e6e2-2b2f-4c6e-9e3a-3f9f6e6e6e6e','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f',NULL,'38dbd48f-bba1-440c-b875-dfd0304aed1d','2025-08-30','2b6ce7e6-c126-479d-abb9-3463928d248c','<p>no</p>','<p>no</p>','<p>no</p>',1,'Aarti Joshi','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','2025-08-22 05:58:30',NULL,'2025-08-22 06:03:24','Learning In Progress','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','b578240e-6e3a-4310-9fce-db9d8e18812e',NULL,NULL,NULL,NULL,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04m',0,NULL,NULL,'2025-08-22 05:58:30','2025-08-22 06:03:24'),('','f3a46e2e-4e8c-4c89-9e5d-1a1f38c9d3af','2feaa72f-45ed-4fd8-b069-04ef9728497c','590313e9-4d39-4305-a2cd-8006e32762b3','bc8d010f-5969-4a4d-a999-cb15245d139d','Technical','208eb593-f9ed-4c39-8762-42b728ee4e06','2025-08-23','caf5889d-4a6a-4af3-b1f2-c02b3eec81c5','Java','Complete AWS hands-on labs','xxyyzz',1,'EMP010','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','2025-07-24 06:47:38',NULL,'2025-07-28 07:58:11','Approval Requested','212bb2e2-9c07-441f-8c2c-7a2287c741d8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-07-24 06:47:38','2025-07-28 07:58:11');
/*!40000 ALTER TABLE `new_training_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` char(36) NOT NULL DEFAULT (uuid()),
  `request_id` char(36) NOT NULL,
  `emp_id` char(36) NOT NULL,
  `message` text,
  `is_read` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  UNIQUE KEY `uk_notifications_emp_req_msg` (`emp_id`,`request_id`,`message`(255)),
  KEY `idx_notifications_requestid` (`request_id`),
  KEY `idx_notifications_empid_requestid` (`emp_id`,`request_id`),
  KEY `idx_notifications_is_read` (`is_read`),
  KEY `idx_notifications_created_at` (`created_at`),
  CONSTRAINT `fk_notifications_emp` FOREIGN KEY (`emp_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_notifications_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('00b2386a-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b26df7-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b273c1-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','212bb2e2-9c07-441f-8c2c-7a2287c741d8','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b277af-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','d29a940c-7cce-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b27b6d-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','6afbca56-aed5-4c72-83a3-949415117c28','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b2806d-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','f5e6a7b8-c9d0-1234-ef01-5678901234em','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b2846f-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b28d4e-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','b1a2c3d4-e5f6-7890-abcd-1234567890ab','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b2ad14-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','c2b3d4e5-f6a7-8901-bcde-2345678901bc','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b2b638-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','d3c4e5f6-a7b8-9012-cdef-3456789012cd','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('00b2bb9f-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','e4d5f6a7-b8c9-0123-def0-4567890123de','Approval Requested',0,'2025-08-21 13:01:50','2025-08-21 13:01:50'),('07698a2b-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076acded-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076afdf2-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','212bb2e2-9c07-441f-8c2c-7a2287c741d8','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076b0aca-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','d29a940c-7cce-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076b1070-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','6afbca56-aed5-4c72-83a3-949415117c28','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076b1535-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','f5e6a7b8-c9d0-1234-ef01-5678901234em','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076b19cc-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076bdefb-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','b1a2c3d4-e5f6-7890-abcd-1234567890ab','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076c19da-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','c2b3d4e5-f6a7-8901-bcde-2345678901bc','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076c220f-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','d3c4e5f6-a7b8-9012-cdef-3456789012cd','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('076c2525-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','e4d5f6a7-b8c9-0123-def0-4567890123de','Approval Requested',0,'2025-08-22 05:58:30','2025-08-22 05:58:30'),('098d572c-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('098f166f-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0993c226-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','212bb2e2-9c07-441f-8c2c-7a2287c741d8','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0993cc31-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','d29a940c-7cce-11f0-a383-64d69ac2e52e','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0993d225-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','6afbca56-aed5-4c72-83a3-949415117c28','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0993db01-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','f5e6a7b8-c9d0-1234-ef01-5678901234em','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0994dd94-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0994e560-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','b1a2c3d4-e5f6-7890-abcd-1234567890ab','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0994e9e9-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','c2b3d4e5-f6a7-8901-bcde-2345678901bc','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0994ede7-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','d3c4e5f6-a7b8-9012-cdef-3456789012cd','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('0994f1c4-8198-11f0-b1f6-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','e4d5f6a7-b8c9-0123-def0-4567890123de','clarification requested',0,'2025-08-25 09:44:04','2025-08-25 09:44:04'),('10101476-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('1010c9f0-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('1010d30a-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','212bb2e2-9c07-441f-8c2c-7a2287c741d8','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('1012df70-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','d29a940c-7cce-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('1012e756-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','6afbca56-aed5-4c72-83a3-949415117c28','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('1012ec05-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','f5e6a7b8-c9d0-1234-ef01-5678901234em','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('1012f020-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('10131331-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','b1a2c3d4-e5f6-7890-abcd-1234567890ab','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('10131e1b-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','c2b3d4e5-f6a7-8901-bcde-2345678901bc','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('101323c2-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','d3c4e5f6-a7b8-9012-cdef-3456789012cd','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('10132839-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','e4d5f6a7-b8c9-0123-def0-4567890123de','capdev approved',0,'2025-08-21 13:02:16','2025-08-21 13:02:16'),('27707a06-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('2770eff3-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('2770f520-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','212bb2e2-9c07-441f-8c2c-7a2287c741d8','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('2770f7a0-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','d29a940c-7cce-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('2772ff6e-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','6afbca56-aed5-4c72-83a3-949415117c28','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('2773048e-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','f5e6a7b8-c9d0-1234-ef01-5678901234em','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('277307bf-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('27730a58-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','b1a2c3d4-e5f6-7890-abcd-1234567890ab','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('27735cb0-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','c2b3d4e5-f6a7-8901-bcde-2345678901bc','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('2773649d-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','d3c4e5f6-a7b8-9012-cdef-3456789012cd','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('277367f9-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','e4d5f6a7-b8c9-0123-def0-4567890123de','capdev approved',0,'2025-08-22 05:59:24','2025-08-22 05:59:24'),('279fc9bc-685f-11f0-ae08-00155d1de6ed','f3a46e2e-4e8c-4c89-9e5d-1a1f38c9d3af','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Status changed to Approval Requested',0,'2025-07-24 07:23:54','2025-07-24 07:23:54'),('3b0fdef1-6721-11f0-ae08-00155d1de6ed','a1b2c3d4-e5f6-7890-abcd-ef1234567890','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Ticket has been assigned to you!',0,'2025-07-22 17:28:07','2025-07-22 17:28:07'),('3ee72276-67ad-11f0-ae08-00155d1de6ed','a1b2c3d4-e5f6-7890-abcd-ef1234567892','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Status changed to Approval Requested',0,'2025-07-23 10:10:23','2025-07-23 10:10:23'),('3ee727d4-67ad-11f0-ae08-00155d1de6ed','a1b2c3d4-e5f6-7890-abcd-ef1234567892','6afbca56-aed5-4c72-83a3-949415117c28','Status changed to Approval Requested',0,'2025-07-23 10:10:23','2025-07-23 10:10:23'),('690868f2-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('69095f3e-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('69098289-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','212bb2e2-9c07-441f-8c2c-7a2287c741d8','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('690990de-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','d29a940c-7cce-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('6909ec70-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','6afbca56-aed5-4c72-83a3-949415117c28','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('6909f18a-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','f5e6a7b8-c9d0-1234-ef01-5678901234em','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('6909f49c-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('6909f76e-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','b1a2c3d4-e5f6-7890-abcd-1234567890ab','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('690a0d56-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','c2b3d4e5-f6a7-8901-bcde-2345678901bc','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('690a13ce-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','d3c4e5f6-a7b8-9012-cdef-3456789012cd','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('690a19d2-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','e4d5f6a7-b8c9-0123-def0-4567890123de','Approval Requested',0,'2025-08-22 08:02:55','2025-08-22 08:02:55'),('8684122e-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('86846c0e-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('8684b8fa-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','212bb2e2-9c07-441f-8c2c-7a2287c741d8','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('8684c191-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','d29a940c-7cce-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('8684c656-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','6afbca56-aed5-4c72-83a3-949415117c28','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('8684e361-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','f5e6a7b8-c9d0-1234-ef01-5678901234em','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('8684f69b-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('86850ff6-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','b1a2c3d4-e5f6-7890-abcd-1234567890ab','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('86852686-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','c2b3d4e5-f6a7-8901-bcde-2345678901bc','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('86852c2d-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','d3c4e5f6-a7b8-9012-cdef-3456789012cd','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('86854089-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','e4d5f6a7-b8c9-0123-def0-4567890123de','Approval Requested',0,'2025-08-19 10:44:47','2025-08-19 10:44:47'),('8ad60626-6874-11f0-ae08-00155d1de6ed','f3a46e2e-4e8c-4c89-9e5d-1a1f38c9d3af','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Ticket has been assigned to you!',0,'2025-07-24 09:57:00','2025-07-24 09:57:00'),('8f0f627a-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f103bc4-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f106785-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','212bb2e2-9c07-441f-8c2c-7a2287c741d8','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f106d6d-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','d29a940c-7cce-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f10747b-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','6afbca56-aed5-4c72-83a3-949415117c28','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f107bd7-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','f5e6a7b8-c9d0-1234-ef01-5678901234em','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f108079-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f10a1cc-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','b1a2c3d4-e5f6-7890-abcd-1234567890ab','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f10ab4d-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','c2b3d4e5-f6a7-8901-bcde-2345678901bc','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f10b09d-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','d3c4e5f6-a7b8-9012-cdef-3456789012cd','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('8f10b426-7e73-11f0-ad82-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','e4d5f6a7-b8c9-0123-def0-4567890123de','capdev approved',0,'2025-08-21 09:45:23','2025-08-21 09:45:23'),('c9e89c85-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e8e3f0-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e8e9d6-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','212bb2e2-9c07-441f-8c2c-7a2287c741d8','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e8efe8-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','d29a940c-7cce-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e8f3c3-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','6afbca56-aed5-4c72-83a3-949415117c28','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e8f786-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','f5e6a7b8-c9d0-1234-ef01-5678901234em','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e8fb50-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e8fe85-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','b1a2c3d4-e5f6-7890-abcd-1234567890ab','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e90417-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','c2b3d4e5-f6a7-8901-bcde-2345678901bc','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e90869-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','d3c4e5f6-a7b8-9012-cdef-3456789012cd','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('c9e90b65-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','e4d5f6a7-b8c9-0123-def0-4567890123de','Approval Requested',0,'2025-08-21 10:01:21','2025-08-21 10:01:21'),('d763e321-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d7643766-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d7643f33-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','212bb2e2-9c07-441f-8c2c-7a2287c741d8','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d764438b-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','d29a940c-7cce-11f0-a383-64d69ac2e52e','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d764475e-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','6afbca56-aed5-4c72-83a3-949415117c28','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d7644b02-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','f5e6a7b8-c9d0-1234-ef01-5678901234em','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d7644eb2-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d76468a8-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','b1a2c3d4-e5f6-7890-abcd-1234567890ab','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d76483fa-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','c2b3d4e5-f6a7-8901-bcde-2345678901bc','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d764922d-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','d3c4e5f6-a7b8-9012-cdef-3456789012cd','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('d76497c3-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','e4d5f6a7-b8c9-0123-def0-4567890123de','capdev approved',0,'2025-08-21 10:01:43','2025-08-21 10:01:43'),('dc2fec53-6789-11f0-ae08-00155d1de6ed','a1b2c3d4-e5f6-7890-abcd-ef1234567890','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Status changed to Approval Requested',0,'2025-07-23 05:57:05','2025-07-23 05:57:05'),('dc383c7b-6789-11f0-ae08-00155d1de6ed','a1b2c3d4-e5f6-7890-abcd-ef1234567890','6afbca56-aed5-4c72-83a3-949415117c28','Status changed to Approval Requested',0,'2025-07-23 05:57:05','2025-07-23 05:57:05'),('e7f8g9h0-i1j2-3456-klmn-7890opqrstuv','a1b2c3d4-e5f6-7890-abcd-ef1234567890','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Your training request for AWS Essentials has been submitted and is awaiting approval.',1,'2025-07-22 17:23:37','2025-07-22 17:26:31'),('e881d37e-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e882aa2c-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e882b5e3-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','212bb2e2-9c07-441f-8c2c-7a2287c741d8','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e882c08a-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','d29a940c-7cce-11f0-a383-64d69ac2e52e','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e882cb0b-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','6afbca56-aed5-4c72-83a3-949415117c28','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e882d21e-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','f5e6a7b8-c9d0-1234-ef01-5678901234em','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e882d6b8-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e882f4bf-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','b1a2c3d4-e5f6-7890-abcd-1234567890ab','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e883110f-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','c2b3d4e5-f6a7-8901-bcde-2345678901bc','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e883190e-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','d3c4e5f6-a7b8-9012-cdef-3456789012cd','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('e8831c30-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','e4d5f6a7-b8c9-0123-def0-4567890123de','Approval Requested',0,'2025-08-21 12:32:31','2025-08-21 12:32:31'),('eacb066d-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacb70b3-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','212bb2e2-9c07-441f-8c2c-7a2287c741d8','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacb7770-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','6afbca56-aed5-4c72-83a3-949415117c28','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacb7bc4-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','f5e6a7b8-c9d0-1234-ef01-5678901234em','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacb7ed8-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacb81a4-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','b1a2c3d4-e5f6-7890-abcd-1234567890ab','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacb840f-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','c2b3d4e5-f6a7-8901-bcde-2345678901bc','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacb9c87-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','d3c4e5f6-a7b8-9012-cdef-3456789012cd','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('eacba43e-7904-11f0-a383-64d69ac2e52e','b7e6c1e2-1234-4a5b-9cde-123456789345','e4d5f6a7-b8c9-0123-def0-4567890123de','Approval Requested',0,'2025-08-14 11:50:47','2025-08-14 11:50:47'),('f8b81edb-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b8f47a-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b9051c-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','212bb2e2-9c07-441f-8c2c-7a2287c741d8','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b90c3b-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','d29a940c-7cce-11f0-a383-64d69ac2e52e','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b9152c-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','6afbca56-aed5-4c72-83a3-949415117c28','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b91fa9-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','f5e6a7b8-c9d0-1234-ef01-5678901234em','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b92522-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b92c51-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','b1a2c3d4-e5f6-7890-abcd-1234567890ab','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b94b31-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','c2b3d4e5-f6a7-8901-bcde-2345678901bc','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b95374-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','d3c4e5f6-a7b8-9012-cdef-3456789012cd','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18'),('f8b9586e-7e8c-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','e4d5f6a7-b8c9-0123-def0-4567890123de','rejected',0,'2025-08-21 12:47:18','2025-08-21 12:47:18');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primary_skill`
--

DROP TABLE IF EXISTS `primary_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `primary_skill` (
  `skill_id` char(36) NOT NULL DEFAULT (uuid()),
  `skill_name` varchar(255) NOT NULL,
  `stack_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`skill_id`),
  KEY `idx_stack_id` (`stack_id`),
  KEY `idx_primaryskill_stackid` (`stack_id`),
  CONSTRAINT `fk_primaryskill_stack` FOREIGN KEY (`stack_id`) REFERENCES `tech_stack` (`stack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primary_skill`
--

LOCK TABLES `primary_skill` WRITE;
/*!40000 ALTER TABLE `primary_skill` DISABLE KEYS */;
INSERT INTO `primary_skill` VALUES ('26942d23-2c12-4eb2-ad26-b8c509945289','Synapse SQL','2b6ce7e6-c126-479d-abb9-3463928d248c','2025-07-22 11:12:54','2025-08-14 10:53:00'),('30c17c07-3e4d-43a3-ba1f-caee66debdb8','ADF Pipelines',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('38cc30ec-b1ee-4bc1-9f08-44fd9c567f1b','Data Wrangling',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('7630322c-79b2-43c5-9bd1-50e13655fde4','CI/CD',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('aa6aca93-d49a-49b4-9c8a-08ddea6eed84','DAX',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('aad27937-b2ba-4323-9c07-c2279adb0e8e','Data Modeling',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('bb05e6c9-8241-4a16-9a32-1169245a69a5','SparkSQL',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('c28d19ea-fa50-40a7-9afd-a22c234acbe3','REST API',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('e75f7ca2-b570-4556-8cb4-4750a059d840','ETL Design',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('f35f7218-b746-43dc-955f-e73b30dbc1f3','Performance Tuning',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54');
/*!40000 ALTER TABLE `primary_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_name`
--

DROP TABLE IF EXISTS `project_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_name` (
  `project_id` char(36) NOT NULL DEFAULT (uuid()),
  `project_name` varchar(255) DEFAULT NULL,
  `service_division_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_id`),
  KEY `idx_project_name_project_name` (`project_name`),
  KEY `idx_project_name_service_division_id` (`service_division_id`),
  KEY `fk_project_service_division` (`service_division_id`),
  CONSTRAINT `fk_project_service_division` FOREIGN KEY (`service_division_id`) REFERENCES `service_division` (`service_division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_name`
--

LOCK TABLES `project_name` WRITE;
/*!40000 ALTER TABLE `project_name` DISABLE KEYS */;
INSERT INTO `project_name` VALUES ('0d5b4f7a-61ed-492d-8686-dd4b134ad742','Security Hardening',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('208eb593-f9ed-4c39-8762-42b728ee4e06','Data Governance',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('2f983e2e-4bde-464c-b901-2373fa9cf2ab','Customer Portal',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('31ec390c-943f-40c8-9a81-b20264d76a01','BI Reporting',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('38dbd48f-bba1-440c-b875-dfd0304aed1d','Project Gamma','b578240e-6e3a-4310-9fce-db9d8e18812e','2025-07-22 11:14:58','2025-07-22 11:14:58'),('4b661c18-9f8d-4c13-8471-3e2bbd722b14','Product MVP',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('68fc2acd-c659-452c-a40b-fa03a0858f88','ETL Modernization',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('6be84b0b-85de-4e91-926d-59cd9d2893a9','Project Alpha','ec61ff23-a485-45bd-a58a-61c71ea41a33','2025-07-22 11:14:58','2025-07-22 11:14:58'),('b8bfcf20-d0ad-4f4c-8d4b-a8418c6c8de6','Project Epsilon','f3b4b9a9-ade5-42b7-a40a-183f8731c2a8','2025-07-22 11:14:58','2025-07-22 11:14:58'),('bb03e11e-548c-4663-be06-51c82d64eb73','Project Beta','e4cc806e-748b-4808-8247-56c2c16bf566','2025-07-22 11:14:58','2025-07-22 11:14:58'),('bdfe81ea-6757-4e94-a37b-e1966e768a42','Batch Automation',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('cf03df42-9bcd-4364-946c-22e8bced84d7','Cloud Migration',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('d8d9843b-dd6e-4615-a3c9-2e2b8fa9238a','Data Lake Setup',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('e1db91dc-9ca5-4f28-ad54-30caa0549ebc','App Revamp',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54');
/*!40000 ALTER TABLE `project_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_designations`
--

DROP TABLE IF EXISTS `request_designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_designations` (
  `id` char(36) NOT NULL DEFAULT (uuid()),
  `request_id` char(36) NOT NULL,
  `designation_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_requestid` (`request_id`),
  CONSTRAINT `fk_rd_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_designations`
--

LOCK TABLES `request_designations` WRITE;
/*!40000 ALTER TABLE `request_designations` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_primary_skills`
--

DROP TABLE IF EXISTS `request_primary_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_primary_skills` (
  `request_primary_skills_id` char(36) NOT NULL DEFAULT (uuid()),
  `request_id` char(36) NOT NULL,
  `primary_skill_id` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_primary_skills_id`),
  KEY `idx_requestid` (`request_id`),
  KEY `idx_primaryskill_id` (`primary_skill_id`),
  CONSTRAINT `fk_rps_primaryskill` FOREIGN KEY (`primary_skill_id`) REFERENCES `primary_skill` (`skill_id`),
  CONSTRAINT `fk_rps_request` FOREIGN KEY (`request_id`) REFERENCES `new_training_request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_primary_skills`
--

LOCK TABLES `request_primary_skills` WRITE;
/*!40000 ALTER TABLE `request_primary_skills` DISABLE KEYS */;
INSERT INTO `request_primary_skills` VALUES ('00ba2a4a-7e8f-11f0-ad82-64d69ac2e52e','98a0ef22-9e76-4f2c-945d-16bfb8f6bb80','26942d23-2c12-4eb2-ad26-b8c509945289','2025-08-21 13:01:50','2025-08-21 13:01:50'),('0777ab72-7f1d-11f0-ad82-64d69ac2e52e','deb25132-0a2c-4650-9a60-5f1c76ea557d','26942d23-2c12-4eb2-ad26-b8c509945289','2025-08-22 05:58:30','2025-08-22 05:58:30'),('6912f96e-7f2e-11f0-ad82-64d69ac2e52e','5ee79872-a343-49f7-b390-014471c6abdb','26942d23-2c12-4eb2-ad26-b8c509945289','2025-08-22 08:02:55','2025-08-22 08:02:55'),('8689ca11-7ce9-11f0-a383-64d69ac2e52e','bf466a95-cd96-4a85-ac5c-293507dbbc14','26942d23-2c12-4eb2-ad26-b8c509945289','2025-08-19 10:44:47','2025-08-19 10:44:47'),('c9f47ee0-7e75-11f0-ad82-64d69ac2e52e','b9e5e5a9-4486-464f-bf8e-9b939bb3eb8e','26942d23-2c12-4eb2-ad26-b8c509945289','2025-08-21 10:01:21','2025-08-21 10:01:21'),('e88e05e6-7e8a-11f0-ad82-64d69ac2e52e','aa9dd59f-60af-49a2-a1a2-cd8781bfe80b','26942d23-2c12-4eb2-ad26-b8c509945289','2025-08-21 12:32:32','2025-08-21 12:32:32');
/*!40000 ALTER TABLE `request_primary_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` char(36) NOT NULL DEFAULT (uuid()),
  `role_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  KEY `idx_role_rolename` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('0e34aea4-d605-4ec2-a582-63540e755f1c','Spoc','2025-08-22 07:32:59','2025-08-22 07:32:59'),('179a5544-5786-4b5d-9e70-c86f42e8b7a4','Engineer','2025-07-22 11:12:54','2025-07-22 11:12:54'),('3afa15e1-5342-46ec-beca-2fa917e64e79','Developer','2025-07-22 11:14:58','2025-07-22 11:14:58'),('3e402dc0-feb4-4224-9cd1-ac83bdea9d77','Employee','2025-07-22 11:12:54','2025-07-22 11:12:54'),('57423511-55c0-485d-9621-c8601b5a4722','Intern','2025-07-22 11:14:58','2025-07-22 11:14:58'),('8e3a752e-7664-45ca-b1e6-3e024f55c699','Mentor','2025-07-22 11:12:54','2025-07-22 11:12:54'),('9d530b80-23e8-4715-a70c-7fc9f09acbad','Analyst','2025-07-22 11:12:54','2025-07-22 11:12:54'),('aabdeade-50d3-48f0-8a9a-2518b12c8d94','Admin','2025-07-22 11:14:58','2025-07-22 11:14:58'),('b9acb0c9-4c3d-4ef8-95ac-6b00ba763c20','Capdev','2025-07-22 11:12:54','2025-08-11 09:15:08'),('e6244855-654e-4a22-b4d5-54fb8ac52cfd','Support','2025-07-22 11:12:54','2025-07-22 11:12:54'),('ed071f92-da46-4717-9164-5eab48561f39','Trainer','2025-07-22 11:12:54','2025-07-22 11:12:54'),('f11284c5-791a-4cee-9625-6891dbf8e28a','Manager','2025-07-22 11:14:58','2025-07-22 11:14:58'),('f1ada2f5-a8bd-4e33-9667-b217f76a0545','Guest','2025-07-22 11:12:54','2025-07-22 11:12:54'),('fd992233-5d18-475c-a15a-d4bdfbab02c1','HR','2025-07-22 11:14:58','2025-07-22 11:14:58');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_source_assign`
--

DROP TABLE IF EXISTS `role_source_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_source_assign` (
  `role_source_assign_id` char(36) NOT NULL DEFAULT (uuid()),
  `role_id` char(36) NOT NULL,
  `source_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_source_assign_id`),
  KEY `idx_rsa_role_id` (`role_id`),
  KEY `idx_rsa_source_id` (`source_id`),
  CONSTRAINT `fk_rsa_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_rsa_source` FOREIGN KEY (`source_id`) REFERENCES `source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_source_assign`
--

LOCK TABLES `role_source_assign` WRITE;
/*!40000 ALTER TABLE `role_source_assign` DISABLE KEYS */;
INSERT INTO `role_source_assign` VALUES ('8a69cb10-5d93-4ae0-8bc9-f006144c7daf','b9acb0c9-4c3d-4ef8-95ac-6b00ba763c20','07a51e1d-36f6-4f16-9176-252d8ed3f2c9','2025-08-14 09:48:13','2025-08-14 09:48:13'),('9d823e79-7f2c-11f0-ad82-64d69ac2e52e','179a5544-5786-4b5d-9e70-c86f42e8b7a4','29fa87d4-8364-4995-821f-29e70e4ff802','2025-08-22 07:50:04','2025-08-22 07:50:04');
/*!40000 ALTER TABLE `role_source_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_division`
--

DROP TABLE IF EXISTS `service_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_division` (
  `service_division_id` char(36) NOT NULL DEFAULT (uuid()),
  `service_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`service_division_id`),
  KEY `idx_sd_servicename` (`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_division`
--

LOCK TABLES `service_division` WRITE;
/*!40000 ALTER TABLE `service_division` DISABLE KEYS */;
INSERT INTO `service_division` VALUES ('173a6c9e-d855-4659-bb90-4edb0135d4f1','Mobile Apps','2025-07-22 11:14:58','2025-07-22 11:14:58'),('4cb9cc33-1ca3-40a0-9b88-8ee3333f3f6a','Support Services','2025-07-22 11:12:54','2025-07-22 11:12:54'),('6a64e304-e334-4180-a999-a7f41875dd43','Cloud Services','2025-07-22 11:12:54','2025-07-22 11:12:54'),('7f4cb111-7e87-11f0-ad82-64d69ac2e52e','new division1','2025-08-21 12:08:06','2025-08-21 12:08:06'),('8333f9b1-dd5b-4b46-ab4d-ea77afe332c7','Analytics','2025-07-22 11:12:54','2025-07-22 11:12:54'),('92a11537-2c50-4ea0-888f-98f9c10042b1','Customer Success','2025-07-22 11:12:54','2025-07-22 11:12:54'),('a23be6cf-e71a-4b53-aeaa-a91b3b67c9d7','Training & Enablement','2025-07-22 11:12:54','2025-07-22 11:12:54'),('a58e9eaf-c5c6-43ad-aaad-37f4b16501c9','Product Development','2025-07-22 11:12:54','2025-07-22 11:12:54'),('b578240e-6e3a-4310-9fce-db9d8e18812e','Web Development','2025-07-22 11:14:58','2025-07-22 11:14:58'),('d5b46cca-5c7a-4ec2-a65c-7c394da4c156','Consulting','2025-07-22 11:12:54','2025-07-22 11:12:54'),('e4cc806e-748b-4808-8247-56c2c16bf566','Data Analytics','2025-07-22 11:14:58','2025-07-22 11:14:58'),('ec61ff23-a485-45bd-a58a-61c71ea41a33','Cloud Services','2025-07-22 11:14:58','2025-07-22 11:14:58'),('f29f80e8-9523-4cb0-a0b6-9d3e1afa9b55','IT Operations','2025-07-22 11:12:54','2025-07-22 11:12:54'),('f3b4b9a9-ade5-42b7-a40a-183f8731c2a8','AI Solutions','2025-07-22 11:14:58','2025-07-22 11:14:58');
/*!40000 ALTER TABLE `service_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source` (
  `source_id` char(36) NOT NULL DEFAULT (uuid()),
  `source_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`source_id`),
  KEY `idx_source_sourcename` (`source_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
INSERT INTO `source` VALUES ('07a51e1d-36f6-4f16-9176-252d8ed3f2c9','Job Fair','2025-07-22 11:14:58','2025-07-22 11:14:58'),('29fa87d4-8364-4995-821f-29e70e4ff802','LinkedIn','2025-07-22 11:12:54','2025-07-22 11:12:54'),('2feaa72f-45ed-4fd8-b069-04ef9728497c','Indeed','2025-07-22 11:12:54','2025-07-22 11:12:54'),('2feca888-0d80-40dd-9560-040b7fe7a04f','Job Fair','2025-07-22 11:12:54','2025-07-22 11:12:54'),('3d33fc1d-e983-4c10-a854-805f3e159215','Social Media','2025-07-22 11:12:54','2025-07-22 11:12:54'),('56d3ac49-8510-4794-83a8-8b3472480cd9','Email Campaign','2025-07-22 11:12:54','2025-07-22 11:12:54'),('6032dc9f-3560-4de5-8c4e-51949035fb10','Campus Drive','2025-07-22 11:14:58','2025-07-22 11:14:58'),('61f4c49d-3bf9-4fb6-8721-8caa7e8ca23b','LinkedIn','2025-07-22 11:14:58','2025-07-22 11:14:58'),('685443e3-c052-4a68-bf84-ea954d5177e6','Referral','2025-07-22 11:14:58','2025-07-22 11:14:58'),('6fb41d49-c7a6-4481-b8e8-78579402628a','Company Website','2025-07-22 11:12:54','2025-07-22 11:12:54'),('7c1aebe2-b516-4eec-90a3-21250919a290','Internal Portal','2025-07-22 11:14:58','2025-07-22 11:14:58'),('8f07b7bb-ac7e-4342-9c51-a70c59124734','newwwwwww','2025-08-20 12:50:53','2025-08-20 12:50:53'),('93925287-8e0f-435a-ada8-d1ad05831a7a','Naukri','2025-07-22 11:12:54','2025-07-22 11:12:54'),('c1231ccc-a2b4-4dd7-bfd6-8d65b8f0ba6e','Internal','2025-07-22 11:12:54','2025-07-22 11:12:54'),('dae0611c-bd1a-465f-8207-8dc4baa3bb71','Vendor','2025-07-22 11:12:54','2025-07-22 11:12:54'),('f8ec21de-fe3f-4b24-8cbe-b27aa3378427','Referral','2025-07-22 11:12:54','2025-07-22 11:12:54');
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_comments`
--

DROP TABLE IF EXISTS `status_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_comments` (
  `status_comments_id` char(36) NOT NULL DEFAULT (uuid()),
  `assignment_id` char(36) NOT NULL,
  `comments` text NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_comments_id`),
  KEY `idx_assignment_id` (`assignment_id`),
  CONSTRAINT `fk_status_comment_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assigned_courses` (`assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_comments`
--

LOCK TABLES `status_comments` WRITE;
/*!40000 ALTER TABLE `status_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech_stack`
--

DROP TABLE IF EXISTS `tech_stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tech_stack` (
  `stack_id` char(36) NOT NULL DEFAULT (uuid()),
  `stack_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stack_id`),
  KEY `idx_techstack_stackname` (`stack_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech_stack`
--

LOCK TABLES `tech_stack` WRITE;
/*!40000 ALTER TABLE `tech_stack` DISABLE KEYS */;
INSERT INTO `tech_stack` VALUES ('0c370d86-5a62-4d9b-a9ec-686477f5ffb9','AWS','2025-07-22 11:12:54','2025-07-22 11:12:54'),('22af80a0-7cf6-11f0-a383-64d69ac2e52e','new','2025-08-19 12:15:03','2025-08-19 12:15:03'),('2b6ce7e6-c126-479d-abb9-3463928d248c','Java','2025-07-22 11:14:58','2025-07-22 11:14:58'),('411682d8-ee8d-411f-a3de-3415b8171641','Node.js','2025-07-22 11:14:58','2025-07-22 11:14:58'),('534fb8c2-7e98-4358-b0eb-8af72457bd16','Databricks','2025-07-22 11:12:54','2025-07-22 11:12:54'),('54fa2ad3-0516-4cbf-8342-66732cb54195','React','2025-07-22 11:14:58','2025-07-22 11:14:58'),('67cf087d-c386-47dd-8dcb-7117b5907671','Python','2025-07-22 11:12:54','2025-07-22 11:12:54'),('766aedc6-ccfe-4bd0-90aa-c7151ba9018d','SQL','2025-07-22 11:14:58','2025-07-22 11:14:58'),('bc1d7afe-7cf6-11f0-a383-64d69ac2e52e','new stack','2025-08-19 12:19:20','2025-08-19 12:19:20'),('caf5889d-4a6a-4af3-b1f2-c02b3eec81c5','PySpark','2025-07-22 11:12:54','2025-07-22 11:12:54'),('e318a92c-4173-4199-a553-556dbfda9758','Python','2025-07-22 11:14:58','2025-07-22 11:14:58'),('e6816ca3-af80-4240-b953-955569637870','Azure','2025-07-22 11:12:54','2025-07-22 11:12:54'),('f4b9ed9e-a1fe-40ca-973b-0b535e54a2c3','Power BI','2025-07-22 11:12:54','2025-07-22 11:12:54'),('f9aff4c1-7dc2-11f0-ad82-64d69ac2e52e','newtech','2025-08-20 12:41:21','2025-08-20 12:41:21');
/*!40000 ALTER TABLE `tech_stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_obj`
--

DROP TABLE IF EXISTS `training_obj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_obj` (
  `training_id` char(36) NOT NULL DEFAULT (uuid()),
  `training_name` varchar(255) NOT NULL,
  `source_id` char(36) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`training_id`),
  KEY `idx_source_id` (`source_id`),
  CONSTRAINT `fk_training_obj_source` FOREIGN KEY (`source_id`) REFERENCES `source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_obj`
--

LOCK TABLES `training_obj` WRITE;
/*!40000 ALTER TABLE `training_obj` DISABLE KEYS */;
INSERT INTO `training_obj` VALUES ('0c24dbb0-2d97-4962-be4c-9d0ae2c5c440','Advanced SQL','29fa87d4-8364-4995-821f-29e70e4ff802','2025-07-22 11:12:54','2025-08-22 07:51:42'),('1a48da81-bfff-4dfe-8004-9e10f34326ac','Java Basics','61f4c49d-3bf9-4fb6-8721-8caa7e8ca23b','2025-07-22 11:14:58','2025-07-22 11:14:58'),('22fc2620-67c3-4dab-b979-7d88040c0fbd','Python Basics','29fa87d4-8364-4995-821f-29e70e4ff802','2025-07-22 11:12:54','2025-08-22 07:51:42'),('4a60485a-51a7-464f-a596-832489511642','ML Basics','29fa87d4-8364-4995-821f-29e70e4ff802','2025-07-22 11:12:54','2025-08-22 07:51:42'),('590313e9-4d39-4305-a2cd-8006e32762b3','Agile Fundamentals',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('688c5b75-9600-476b-911e-95d9f57337a4','Node.js Bootcamp','6032dc9f-3560-4de5-8c4e-51949035fb10','2025-07-22 11:14:58','2025-07-22 11:14:58'),('a5900d5a-5bf8-473c-8887-fa92713b99c9','PySpark ETL',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('b62ac52f-ac59-4b42-be6c-377968820e23','Advanced Python','7c1aebe2-b516-4eec-90a3-21250919a290','2025-07-22 11:14:58','2025-07-22 11:14:58'),('cf064de1-ccc4-4731-9c65-3bf9cb2c2ace','Power BI Dashboarding',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('cf083f57-ad6d-40b3-bf13-d588bad4bf60','API Integration',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('d3f4e15a-fb4e-4267-8487-c00d352f1360','Data Modelling',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('de274522-7e0d-42d9-b715-a1caa790a862','Azure Data Factory',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54'),('e8f2255d-3379-48e4-97a2-8cc42b849128','React Workshop','685443e3-c052-4a68-bf84-ea954d5177e6','2025-07-22 11:14:58','2025-07-22 11:14:58'),('f3e3e6e2-2b2f-4c6e-9e3a-3f9f6e6e6e6e','SQL Mastery','07a51e1d-36f6-4f16-9176-252d8ed3f2c9','2025-07-22 11:14:58','2025-07-22 11:14:58'),('f45b3b85-51ce-4963-ba5e-e8c9d7a96f77','Databricks Lakehouse',NULL,'2025-07-22 11:12:54','2025-07-22 11:12:54');
/*!40000 ALTER TABLE `training_obj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` char(36) NOT NULL DEFAULT (uuid()),
  `user_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_user` (`user_id`),
  KEY `fk_user_role_role` (`role_id`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('b197a761-72c0-11f0-9d8f-5f61cad1b828','212bb2e2-9c07-441f-8c2c-7a2287c741d8','b9acb0c9-4c3d-4ef8-95ac-6b00ba763c20','2025-08-06 17:57:18','2025-08-19 12:33:46'),('b47548f5-7f29-11f0-ad82-64d69ac2e52e','6afbca56-aed5-4c72-83a3-949415117c28','0e34aea4-d605-4ec2-a582-63540e755f1c','2025-08-22 12:59:14','2025-08-22 13:03:08'),('b9acb0c9-4c3d-4ef8-95ac-6b00ba763c21','16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','b9acb0c9-4c3d-4ef8-95ac-6b00ba763c20','2025-07-22 21:50:00','2025-08-22 13:16:38'),('d2b37ba4-7cce-11f0-a383-64d69ac2e52e','d29a940c-7cce-11f0-a383-64d69ac2e52e','f11284c5-791a-4cee-9625-6891dbf8e28a','2025-08-19 13:03:38','2025-08-19 13:03:38'),('f7234a1c-ef8b-4c0e-a795-c678d0807e4b','6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','179a5544-5786-4b5d-9e70-c86f42e8b7a4','2025-07-25 13:32:29','2025-08-19 15:42:39'),('fbd5da3b-7ce4-11f0-a383-64d69ac2e52e','fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','f11284c5-791a-4cee-9625-6891dbf8e28a','2025-08-19 15:42:16','2025-08-19 15:42:16');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` char(36) NOT NULL,
  `token` varchar(128) NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_token_token` (`token`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `user_token_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `users` (`emp_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

LOCK TABLES `user_token` WRITE;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` VALUES (1,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','e44710346f3ae36406334e4b8dca5754734f9645b275ea772e56b04766613670','2025-07-30 21:36:37',1,'2025-07-30 15:06:37'),(2,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','10da0be09b1138ed5ed8d25f35c55b5dd1cb87d0943f714555fa4c3392837182','2025-07-30 21:38:20',1,'2025-07-30 15:08:19'),(3,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','ba5e8c2cc6e3818af3c07a6269b005d37b227370ebdd350e4b66f2503b0e0861','2025-07-30 21:41:13',1,'2025-07-30 15:11:13'),(4,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','725f815cdd44cfdfe2f7670293b948027e34fe1020ac45068cbe460460d2077e','2025-07-30 21:44:23',1,'2025-07-30 15:14:22'),(5,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','0a7f293ff52a2eae65cad1e2392012085ac0e191c4e972fe3381c0ede6432f3a','2025-07-30 21:45:03',0,'2025-07-30 15:15:02'),(6,'16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','41a844e86186b610d81a864ea1af2915c1870556f880c6c92f38574c81ea7d03','2025-07-30 21:48:04',1,'2025-07-30 15:18:03');
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` char(36) NOT NULL DEFAULT (uuid()),
  `emp_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_users_email` (`email`),
  KEY `idx_users_empid` (`emp_id`),
  CONSTRAINT `fk_users_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('16c99e18-e632-48e9-9d2a-7cd3b8d9b04m','16c99e18-e632-48e9-9d2a-7cd3b8d9b04f','Aarti Joshi','aarti.j@harbingergroup.com','92360f066771f95bf395752bf3f22e8d:ae1f4af7e479bc586ec99d7422aecfd6',NULL,'active','2025-07-22 11:21:22','2025-07-30 17:41:12'),('212bb2e2-9c07-441f-8c2c-7a2287c741d8','3c61638c-d0c2-4388-8ba7-43829197e081','Nikhil Verma','nikhil.v@example.com','1234',NULL,'active','2025-07-23 05:35:22','2025-08-19 07:03:46'),('6afbca56-aed5-4c72-83a3-949415117c28','6afbca56-aed5-4c72-83a3-949415117c47','Manoj Sinha','manoj.s@harbingergroup.com','1234',NULL,'Inactive','2025-07-23 05:36:18','2025-08-22 07:29:38'),('6f8d2a91-47bb-4c32-9a90-0a8e01b8f356','bc8d010f-5969-4a4d-a999-cb15245d139d','Meena Singh','meena.s@harbingergroup.com','12345678',NULL,'active','2025-07-24 06:40:22','2025-08-19 10:12:39'),('b1a2c3d4-e5f6-7890-abcd-1234567890ab','c9a1f3e2-1e4f-4e2a-9a1e-1f3e2e4f9a1e','Alice Johnson','alice@harbingergroup.com','1234',NULL,'Active','2025-07-22 11:21:22','2025-08-22 07:44:12'),('c2b3d4e5-f6a7-8901-bcde-2345678901bc','d2b3c4e5-f6a7-8901-bcde-2345678901bc','Bob Smith','bob@harbingergroup.com','hashed_pwd_2',NULL,'Active','2025-07-22 11:21:22','2025-07-22 11:21:22'),('d29a940c-7cce-11f0-a383-64d69ac2e52e','611c5694-2dad-49f6-8ee6-58c0555c88a5','Seema Rai','seema.r@example.com','e8cf9f012cc3ad30260ffab5065a1c13:cb37c0a05fddefa7e4a815cd63aa49f9',NULL,'invited','2025-08-19 07:33:38','2025-08-19 07:33:38'),('d3c4e5f6-a7b8-9012-cdef-3456789012cd','e3c4d5f6-a7b8-9012-cdef-3456789012cd','Charlie Lee','charlie@harbingergroup.com','hashed_pwd_3',NULL,'Inactive','2025-07-22 11:21:22','2025-07-22 11:21:22'),('e4d5f6a7-b8c9-0123-def0-4567890123de','f4d5e6a7-b8c9-0123-def0-4567890123de','Diana Prince','diana@harbingergroup.com','hashed_pwd_4',NULL,'Active','2025-07-22 11:21:22','2025-07-22 11:21:22'),('f5e6a7b8-c9d0-1234-ef01-5678901234em','a5e6f7b8-c9d0-1234-ef01-5678901234ef','Ethan Hunt','ethan@harbingergroup.com','hashed_pwd_5',NULL,'inactive','2025-07-22 11:21:22','2025-08-06 12:17:47'),('fbb9ec85-7ce4-11f0-a383-64d69ac2e52e','2e95b80f-7269-4aba-9a14-90702eab00ba','Deepak Yadav','deepak.y@example.com','b573c96a30466e728590446901614faf:b04dbf784fd295e64bd2e8342302d467',NULL,'invited','2025-08-19 10:12:16','2025-08-19 10:12:16');
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

-- Dump completed on 2025-08-25 18:02:00
