/*
SQLyog Trial v13.1.9 (64 bit)
MySQL - 8.4.3 : Database - student_management_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `student_management_system`;

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `courses` */

insert  into `courses`(`id`,`course_code`,`description`) values 
(1,'BSIT','Bachelor of Science in Information Technology'),
(2,'BSBA','Bachelor of Science in Business Administration');

/*Table structure for table `enrollments` */

DROP TABLE IF EXISTS `enrollments`;

CREATE TABLE `enrollments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `school_year` varchar(10) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `enrollments` */

insert  into `enrollments`(`id`,`student_id`,`course_id`,`school_year`,`semester`,`status`) values 
(1,1,1,'2024-2025','1st Semester','Enrolled');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`role_name`) values 
(1,'Admin'),
(2,'Registrar'),
(3,'Cashier'),
(4,'Staff'),
(5,'Student'),
(6,'Faculty');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `staff` */

insert  into `staff`(`id`,`user_id`,`position`,`department`) values 
(1,2,'Registrar','Admissions Office');

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_no` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year_level` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_no` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `students` */

insert  into `students`(`id`,`student_no`,`first_name`,`last_name`,`middle_name`,`gender`,`birthdate`,`course`,`year_level`,`status`,`created_at`) values 
(1,'20260422001','James','Anderson','Michael','Male','2002-01-15','BS Information Technology',2,'1','2026-04-22 11:00:27'),
(2,'20260422002','Emily','Carter','Rose','Female','2001-03-22','BS Computer Science',3,'1','2026-04-22 11:00:27'),
(3,'20260422003','Daniel','Lopez','Garcia','Male','2000-07-10','BS Business Administration',4,'2','2026-04-22 11:00:27'),
(4,'20260422004','Sophia','Martinez','Anne','Female','2003-05-08','BS Nursing',1,'1','2026-04-22 11:00:27'),
(5,'20260422005','Michael','Nguyen','Tran','Male','2002-09-19','BS Accountancy',2,'1','2026-04-22 11:00:27'),
(6,'20260422006','Olivia','Brown','Grace','Female','2001-11-30','BS Psychology',3,'1','2026-04-22 11:00:27'),
(7,'20260422007','Ethan','Davis','Lee','Male','2002-06-25','BS Civil Engineering',2,'1','2026-04-22 11:00:27'),
(8,'20260422008','Ava','Wilson','Marie','Female','2003-02-14','BS Architecture',1,'1','2026-04-22 11:00:27'),
(9,'20260422009','Alexander','Taylor','James','Male','2000-08-09','BS Mechanical Engineering',4,'2','2026-04-22 11:00:27'),
(10,'20260422010','Isabella','Thomas','Jane','Female','2002-12-01','BS Hospitality Management',2,'1','2026-04-22 11:00:27'),
(11,'20260422011','Benjamin','Moore','Clark','Male','2001-04-18','BS Criminology',3,'1','2026-04-22 11:00:27'),
(12,'20260422012','Mia','Jackson','Louise','Female','2003-07-27','BS Education',1,'1','2026-04-22 11:00:27'),
(13,'20260422013','Lucas','Martin','Reyes','Male','2002-10-05','BS Information Systems',2,'1','2026-04-22 11:00:27'),
(14,'20260422014','Charlotte','Lee','Kim','Female','2001-01-29','BS Tourism Management',3,'1','2026-04-22 11:00:27'),
(15,'20260422015','Henry','Perez','Santos','Male','2000-05-12','BS Marketing',4,'2','2026-04-22 11:00:27'),
(16,'20260422016','Amelia','White','Joy','Female','2002-03-17','BS Biology',2,'1','2026-04-22 11:00:27'),
(17,'20260422017','Sebastian','Harris','Cole','Male','2001-09-23','BS Mathematics',3,'1','2026-04-22 11:00:27'),
(18,'20260422018','Harper','Clark','Faith','Female','2003-06-11','BS Pharmacy',1,'1','2026-04-22 11:00:27'),
(19,'20260422019','Jack','Lewis','Adrian','Male','2002-08-02','BS Electrical Engineering',2,'1','2026-04-22 11:00:27'),
(20,'20260422020','Evelyn','Robinson','Mae','Female','2001-12-20','BS Social Work',3,'1','2026-04-22 11:00:27'),
(21,'20260422021','Owen','Walker','Scott','Male','2000-11-13','BS Entrepreneurship',4,'2','2026-04-22 11:00:27'),
(22,'20260422022','Abigail','Hall','Kate','Female','2003-04-06','BS Public Administration',1,'1','2026-04-22 11:00:27'),
(23,'20260422023','Logan','Allen','Cruz','Male','2002-07-28','BS Information Technology',2,'1','2026-04-22 11:00:27'),
(24,'20260422024','Ella','Young','Nicole','Female','2001-02-10','BS Computer Science',3,'1','2026-04-22 11:00:27'),
(25,'20260422025','Jacob','King','David','Male','2002-09-15','BS Business Administration',2,'1','2026-04-22 11:00:27'),
(26,'20260422026','Scarlett','Wright','Rose','Female','2003-01-21','BS Nursing',1,'1','2026-04-22 11:00:27'),
(27,'20260422027','Aiden','Scott','Matthew','Male','2001-06-30','BS Accountancy',3,'1','2026-04-22 11:00:27'),
(28,'20260422028','Chloe','Green','Anne','Female','2002-05-03','BS Psychology',2,'1','2026-04-22 11:00:27'),
(29,'20260422029','Samuel','Baker','John','Male','2000-10-26','BS Civil Engineering',4,'2','2026-04-22 11:00:27'),
(30,'20260422030','Lily','Adams','Grace','Female','2003-08-12','BS Architecture',1,'1','2026-04-22 11:00:27'),
(31,'20260422031','dsad','sad','sadsa','Male','2026-04-21','dsdsd',2,'1','2026-04-22 14:25:28'),
(32,'20260422032','AKO','SI','TEP','Male','2026-04-22','HAHAHA',1,'2','2026-04-22 14:35:52'),
(33,'20260422033','D','DDD','DDD','Male','2026-04-27','',1,'3','2026-04-22 15:18:07'),
(34,'20260422034','ARVIN','CEJALBO','','Male','2026-04-22','BSIT',2,'3','2026-04-22 15:49:30'),
(35,'20260422035','ARVIN','CEJALBO','JJ','Male','2026-04-23','BSIT',2,'1','2026-04-22 15:52:48'),
(36,'20260422036','ARVIN','CEJALBO JR','TEP','Male','2026-04-15','BSIT',2,'1','2026-04-22 15:56:48'),
(37,'20260422037','ROBERT','JAWORSKI','TEP','Male','2026-04-16','BSIT',2,'1','2026-04-22 15:57:29'),
(38,'20260422038','JAWO','GINEBRA','1','Male','2026-04-21','BSIT',1,'1','2026-04-22 16:01:18');

/*Table structure for table `tblstudstats` */

DROP TABLE IF EXISTS `tblstudstats`;

CREATE TABLE `tblstudstats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblstudstats` */

insert  into `tblstudstats`(`id`,`Description`) values 
(1,'Active'),
(2,'Inactive'),
(3,'Graduated'),
(4,'Dropped');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image` longblob,
  `image_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`full_name`,`role`,`status`,`created_at`,`image`,`image_type`) values 
(2,'staff1','$2y$10$wH8Q1YvXkq9m7bK1lFzF5eF9Fh9jK1sPZcVx1rJ0Q1K5Wm8z0yZ7G','Registrar Staff','staff',1,'2026-04-16 14:35:54',NULL,NULL),
(3,'student1','$2y$10$wH8Q1YvXkq9m7bK1lFzF5eF9Fh9jK1sPZcVx1rJ0Q1K5Wm8z0yZ7G','Juan Dela Cruz','student',1,'2026-04-16 14:35:54',NULL,NULL),
(26,'bbb','$2y$10$fNY9EMq3FvlZLcrHTvDR/unx1sGsAsbkXZJgijRb.cdMZrKTDftra','bbb2','1',1,'2026-04-20 16:45:21','����\0JFIF\0\0`\0`\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 25\n��\0C\0  \Z$\" &0P40,,0bFJ:Ptfzxrfpn��������np�ڢ������|�����������\0C\"$$0*0^44^Ƅp�����������������������������������������������������\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�(��\0(��\0(��\0(��\0(��T��!�_����4n���RsS��S��Ӷ:�F,�s�\'ր;�Eri�O�I�l��D�\r\0u�V��*�\n}GZڂ�9�tl{P�RR�EPEPEPEPEPEPEPI�Z��݋Kr��\n(����e������;��Y�s��H�#�c�\'&�\0P���9&���ހ\"5/;C\n�<U���&���RZ�Ik0x��z�]\"���@����;�C�G�����׍i8aʓ�����\"S��\"�EPEPEPEPEPEPEP5��F���~D�k{R�Ȳ���FrNğ~�\0���֭[Z<�8�ƕ��,x�����Mi�b�:sW��H�K�ȩ�݂�ky`v���+��=$Es�UX]����nm��bh�+��.��[����ҹ�5cO��u��85D��-5H`�Fi�(��\0(��\0(��\0(��\0(��\0))i(���}�X�SXs%잋�?*�E,�b��,파28��!X�\0*(6D29�\\���QN���M4�C@��wQ�S�]\"��r�g;r�Z�j��dj�Ҩ�u�\\�m�LNN1���������?�ElS$(��\0(��\0(��\0(��\0(��\0)\r-2C���@��<���(<晧F\Z��*͑$�O�Ěu�U��T�]��(�`)\'ڙ��c51�=��Dq��ԚC%���EXI��φ�fp�1�3�ڮ ށ��MA-ʧ@MH��U�h\\���(����4�v��Q}����Ɯ�����I�+��(ʉ�j΁7ɳ8�lH�)�Ux6ɿޚވ\r���z0��A\\�cY����}�����-Q@��(��(��(��(���;m�>��KU���S��(��c� <��n�c��u��+KJ��1�B���Zf�\\��C��w�R)��(���%jUM�J��I�K�EG��u���>E +}��*�ж�ƮQ����~�E��d��VǺrҕ=�M	�������n:����\\TG��vV;�6�QTC%��(QE\0QE\0QE\0QE\0U\re��8������Ų/�P<�xԐ���pEFzҭGGm\'�7r*ʚ������k@5Ad��Q�xl�sD%=zP1�0����[��Tr@]pI�I\nyc�\0NMA+qN/���C@ڌ��8$�Y�\'&�jM�@��T�U\"�k��_}�g�ʧZ��͡^ᩒjQE\0QE\0QE\0QE\0QE\0V��=kn��m�^��\0���\nR9��\0Y��Șg����`@9��2Ǌڳv����,��>S���\\>_�V�:�2n�Z+4�X� �i�-Üdcڬ�I�*�m���\'��q(Df$p)�H\0�X��G>�z\r�H�c���P\r-Y\0�����\0\\���A�i�2m�)��@���(��(��(��(��(�<W\'}\'�{+z��.e������;�z���I�ajL�=��nZ/�4`�\0tV=�y�1��k�D��S\"�3�>�*���5NjK&.1PK&�*�\"�eO��=+Y׊�q6�>9WH����JMQ#��Vt���cl��Y�!}�+z\Z\0�-G�6�\Z��Q@Q@Q@�וe��h��/����q\\�<�+k\\��uH�p��cl��\07�NN�cN����\rt a�ƹ�����ҺI��޿�K)1�����EIdl�T*�\n��\0�ɚ��//KcݜJ��� \n��8Kx���R&F4�SRQTA\r��\0���ǭ\0u:D����z��{���}����� $S�z\0��L�@EP3\\��#��ٵ�Covⱥ��r�1b}j:\0ЛV���m©I,���}M2�\0	��4PE�\0�l�ލ]j��}Eq���޺�I�֑��\0=�+qތS\'|:S��T3D!Z��*j�S�� \'�B��s�ܻ�BvE���*�����d�n$s�ֈ�GIKI��@h�4��҃�\0vi��~� �\Z��\0��s	�eb=?δ-�Ӹ-�yk�\0�a��u���W7��oS�![�;Q@;�E\0QIK@	�i�:S�\0����sҊ(\0��PQ�o��V-[���o���|��:V�?QQ���N:Tr7֥��ڜ#R9���`\n�*�Rld9䍣�\\�ƽ6^8Ga�+\"���\'��{�u\0݃җ������\0(9��\n\r\0QE\0��A�Rw��IE\0R�E\0%Q@�(\0�RC:�(���_:�$��O�t?�P43����$��) g%w1���=�CE�%Q@�MQ��(�R\Z(����\0E��(��','image/jpeg'),
(27,'AKOSITEP','$2y$10$Lh.Mi8Zo1AgdbfbcmdEWhOQ13J8eQl5l1LNl2YbdDHcLjWwU1bOPi','AKOSITEP','1',1,'2026-04-20 17:08:37','����\0JFIF\0\0`\0`\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 25\n��\0C\0  \Z$\" &0P40,,0bFJ:Ptfzxrfpn��������np�ڢ������|�����������\0C\"$$0*0^44^Ƅp�����������������������������������������������������\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�(��\0(��\0(��\0(��\0(��T��!�_����4n���RsS��S��Ӷ:�F,�s�\'ր;�Eri�O�I�l��D�\r\0u�V��*�\n}GZڂ�9�tl{P�RR�EPEPEPEPEPEPEPI�Z��݋Kr��\n(����e������;��Y�s��H�#�c�\'&�\0P���9&���ހ\"5/;C\n�<U���&���RZ�Ik0x��z�]\"���@����;�C�G�����׍i8aʓ�����\"S��\"�EPEPEPEPEPEPEP5��F���~D�k{R�Ȳ���FrNğ~�\0���֭[Z<�8�ƕ��,x�����Mi�b�:sW��H�K�ȩ�݂�ky`v���+��=$Es�UX]����nm��bh�+��.��[����ҹ�5cO��u��85D��-5H`�Fi�(��\0(��\0(��\0(��\0(��\0))i(���}�X�SXs%잋�?*�E,�b��,파28��!X�\0*(6D29�\\���QN���M4�C@��wQ�S�]\"��r�g;r�Z�j��dj�Ҩ�u�\\�m�LNN1���������?�ElS$(��\0(��\0(��\0(��\0(��\0)\r-2C���@��<���(<晧F\Z��*͑$�O�Ěu�U��T�]��(�`)\'ڙ��c51�=��Dq��ԚC%���EXI��φ�fp�1�3�ڮ ށ��MA-ʧ@MH��U�h\\���(����4�v��Q}����Ɯ�����I�+��(ʉ�j΁7ɳ8�lH�)�Ux6ɿޚވ\r���z0��A\\�cY����}�����-Q@��(��(��(��(���;m�>��KU���S��(��c� <��n�c��u��+KJ��1�B���Zf�\\��C��w�R)��(���%jUM�J��I�K�EG��u���>E +}��*�ж�ƮQ����~�E��d��VǺrҕ=�M	�������n:����\\TG��vV;�6�QTC%��(QE\0QE\0QE\0QE\0U\re��8������Ų/�P<�xԐ���pEFzҭGGm\'�7r*ʚ������k@5Ad��Q�xl�sD%=zP1�0����[��Tr@]pI�I\nyc�\0NMA+qN/���C@ڌ��8$�Y�\'&�jM�@��T�U\"�k��_}�g�ʧZ��͡^ᩒjQE\0QE\0QE\0QE\0QE\0V��=kn��m�^��\0���\nR9��\0Y��Șg����`@9��2Ǌڳv����,��>S���\\>_�V�:�2n�Z+4�X� �i�-Üdcڬ�I�*�m���\'��q(Df$p)�H\0�X��G>�z\r�H�c���P\r-Y\0�����\0\\���A�i�2m�)��@���(��(��(��(��(�<W\'}\'�{+z��.e������;�z���I�ajL�=��nZ/�4`�\0tV=�y�1��k�D��S\"�3�>�*���5NjK&.1PK&�*�\"�eO��=+Y׊�q6�>9WH����JMQ#��Vt���cl��Y�!}�+z\Z\0�-G�6�\Z��Q@Q@Q@�וe��h��/����q\\�<�+k\\��uH�p��cl��\07�NN�cN����\rt a�ƹ�����ҺI��޿�K)1�����EIdl�T*�\n��\0�ɚ��//KcݜJ��� \n��8Kx���R&F4�SRQTA\r��\0���ǭ\0u:D����z��{���}����� $S�z\0��L�@EP3\\��#��ٵ�Covⱥ��r�1b}j:\0ЛV���m©I,���}M2�\0	��4PE�\0�l�ލ]j��}Eq���޺�I�֑��\0=�+qތS\'|:S��T3D!Z��*j�S�� \'�B��s�ܻ�BvE���*�����d�n$s�ֈ�GIKI��@h�4��҃�\0vi��~� �\Z��\0��s	�eb=?δ-�Ӹ-�yk�\0�a��u���W7��oS�![�;Q@;�E\0QIK@	�i�:S�\0����sҊ(\0��PQ�o��V-[���o���|��:V�?QQ���N:Tr7֥��ڜ#R9���`\n�*�Rld9䍣�\\�ƽ6^8Ga�+\"���\'��{�u\0݃җ������\0(9��\n\r\0QE\0��A�Rw��IE\0R�E\0%Q@�(\0�RC:�(���_:�$��O�t?�P43����$��) g%w1���=�CE�%Q@�MQ��(�R\Z(����\0E��(��','image/jpeg'),
(28,'20260422033','QQQ','QQ, QQQQQQ','1',1,'2026-04-22 15:40:41',NULL,NULL),
(32,'20260422034','$2y$10$YYgd.HdZtlNcHllDH23rDuqRuPAe703SBCDwLpjXT4aK5IbugLuqW','ARVIN, CEJALBOANGOS','1',1,'2026-04-22 15:47:33',NULL,NULL),
(33,'20260422038','$2y$10$k9NONlF3jIjXGqH/2.IZ5uD59BF7ij1aH6g8Ki7DM9dQfbOzqS9Pu','GINEBRA, JAWO 1','2',1,'2026-04-22 16:01:18',NULL,NULL);


DROP TABLE IF EXISTS `tblCourses`;

CREATE TABLE `tblCourses` (
  `CourseCode` varchar(20) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Years` int(2) DEFAULT NULL,
  `code` int(15) NOT NULL,
  `HSOrCollege` char(1) NOT NULL DEFAULT 'C',
  `GROUP_ID` int(2) DEFAULT '0',
  `IsBoard` tinyint(1) NOT NULL,
  `Slots` int(2) NOT NULL DEFAULT '0',
  `SummerUnits` int(2) NOT NULL DEFAULT '0',
  `Dean` varchar(20) DEFAULT NULL,
  `Head` varchar(20) DEFAULT NULL,
  `Chair` varchar(20) DEFAULT NULL,
  `IsReport` int(3) unsigned NOT NULL,
  `Decipline` int(10) unsigned DEFAULT NULL,
  `IsFCourseCode` int(1) unsigned DEFAULT '0',
  `isActive` int(1) DEFAULT '1',
  `EducationalLevelSC` varchar(10) DEFAULT NULL,
  `SORTID` int(11) NOT NULL DEFAULT '0',
  `Branch` varchar(50) DEFAULT NULL,
  `Major` varchar(200) DEFAULT NULL,
  `ColCode` varchar(200) DEFAULT NULL,
  `MCode` varchar(200) DEFAULT NULL,
  `isALS` int(1) NOT NULL DEFAULT '0',
  `GraduateType` varchar(25) NOT NULL,
  PRIMARY KEY (`CourseCode`),
  KEY `CourseCode` (`CourseCode`),
  KEY `GROUP_ID` (`GROUP_ID`),
  KEY `HSOrCollege` (`HSOrCollege`),
  KEY `IsBoard` (`IsBoard`),
  KEY `Slots` (`Slots`),
  KEY `Years` (`Years`),
  KEY `Description` (`Description`),
  KEY `IsReport` (`IsReport`),
  KEY `idx_courses_lookup` (`CourseCode`,`HSOrCollege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tblCourses` */

insert  into `tblCourses`(`CourseCode`,`Description`,`Years`,`code`,`HSOrCollege`,`GROUP_ID`,`IsBoard`,`Slots`,`SummerUnits`,`Dean`,`Head`,`Chair`,`IsReport`,`Decipline`,`IsFCourseCode`,`isActive`,`EducationalLevelSC`,`SORTID`,`Branch`,`Major`,`ColCode`,`MCode`,`isALS`,`GraduateType`) values 
('BFA','Bachelor of Fine Arts',4,0,'C',0,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CAFA','',0,''),
('BSID','Bachelor of Science in Interior Design',4,0,'C',0,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CAFA','',0,''),
('BSARCHI','Bachelor of Science in Architecture',5,0,'C',0,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CAFA','',0,''),
('BSAP','Bachelor of Science in Applied Physics',4,0,'C',4,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CAS','',0,''),
('BSCS','Bachelor of Science in Computer Science',4,0,'C',17,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CCS','',0,''),
('BSIP','Bachelor of Science in Industrial Psychology',4,0,'C',4,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CAS','',0,''),
('BSMATH','Bachelor of Science in Mathematics',4,0,'C',4,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'CAS',NULL,0,''),
('BSBA','Bachelor of Science in Business Administration',5,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('BSCRIM','Bachelor of Science in Criminology',4,0,'C',8,0,50,0,'',NULL,NULL,0,0,0,1,NULL,0,'Manila','','CCJE','',0,''),
('BSPA','Bachelor in Public Administration',4,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('BSCOE','Bachelor of Science in Computer Engineering',5,0,'C',2,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CEN','',0,''),
('BSCHE','Bachelor of Science in Chemical Engineering',5,0,'C',2,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'CEN',NULL,0,''),
('BSCE','Bachelor of Science in Civil Engineering',5,0,'C',2,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CEN','',0,''),
('BSEE','Bachelor of Science in Electrical Engineering',5,0,'C',2,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'CEN',NULL,0,''),
('BSECE','Bachelor of Science in Electronics Engineering',5,0,'C',2,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CEN','',0,''),
('BSME','Bachelor of Science in Mechanical Engineering',5,0,'C',2,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'CEN',NULL,0,''),
('BSTOURISM','Bachelor of Science in Tourism Management',4,0,'C',9,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CHTM','',0,''),
('BSIT','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CIT','',0,''),
('BSE','Bachelor in Secondary Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CED','',0,''),
('BSOA','Bachelor of Science in Office Administration',4,0,'C',5,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CBPA','',0,''),
('EDD','Doctor of Education',3,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Educational Management','GS','EM',0,'Doctoral'),
('MBA','Master in Business Administration',3,0,'G',1,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'GS',NULL,0,'Masteral'),
('MAT','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','GS','',0,'Masteral'),
('BSCT','Bachelor of Science in Computer Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CIT','',0,''),
('MPA','Master in Public Administration',3,0,'G',1,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'GS',NULL,0,'Masteral'),
('MAED','Master of Arts in Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','GS','',0,'Masteral'),
('MAIP','Master of Arts in Industrial Psychology',5,0,'G',1,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'GS',NULL,0,'Masteral'),
('PHDIP','Doctor of Philosophy in Industrial Psychology',5,0,'G',1,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'GS',NULL,0,'Doctoral'),
('DBA','Doctor in Business Administration',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','GS','',0,'Doctoral'),
('DPA','Doctor in Public Administration',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','GS','',0,'Doctoral'),
('MAIEHRM','Master of Arts in Industrial Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Hotel Management','GS','HM',0,'Masteral'),
('MSMATH','Master of Science in Mathematics',5,0,'G',1,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'GS',NULL,0,'Masteral'),
('PROFED','Professional Education',1,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','GS','',0,''),
('BSHM','Bachelor of Science in Hospitality Management',4,0,'C',9,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CHTM','',0,''),
('BASICCOMPUTER','SOP Basic Computer',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('AUTO-DIESEL','SOP Auto-Diesel Engine Repair',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('AUTO-GAS-DIESEL','SOP Auto-Gas/Diesel Engine Repair',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('BREAD_PASTRY','SOP Baking &amp; Pastry Production',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('ADVMTRCTRL','SOP Advance Motor Control',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('BELECTRONICS','Basic Electronics',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('BASICACCTG','SOP Basic Accounting',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('COMPHARDWARE','SOP Computer Hardware Servicing',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('COMPROGRAMMING','SOP Computer Programming',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('COMSOFTWARE','SOP Computer Software',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('CULINARYARTS','SOP Culinary Arts',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('DRAFTINGW-CAD','SOP Drafting with CAD',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('FBSERVICES','SOP Food and Beverage Services',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('FOODPROCESSING','SOP Food Processing and Preservation',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('GARMENTS','SOP Garments and Apparel Trades',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('HHSERVICES','SOP Household Services/Housekeeping w/ Hotel Operartion',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('LATHEMACHINE','SOP Lathe Machine Operations',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('REF-AIRCON','SOP Refrigeration &amp; Air-Con Servicing',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('Reflexology','SOP Reflexology &amp; Massage Theraphy',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('CLERICAL','SOP Clerical Training',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('Entrep','SOP Entrepreneurship',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('SMAW','SOP Shielded Metal Arc Welding',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('Electrical','SOP Electrical Installation and Maintenance',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('PHD-HRM','Doctor of Philosophy Human Resources Management',10,0,'G',1,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'GS',NULL,0,'Doctoral'),
('ASSOCARCHI','Associate in Architecture',2,0,'C',0,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CAFA','',0,''),
('SUAP','Summer Program',4,0,'C',10,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SuAP','',0,''),
('EGPMBA-HM','Executive - Master in Business Administration',2,0,'G',11,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','EGP','',0,'Masteral'),
('SAP-DE','SAP-DE BSCS',5,0,'C',12,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SAP-DE','',0,''),
('EGPDPA','Executive - Doctor of Public Administration',1,0,'G',11,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','EGP','',0,'Doctoral'),
('BSEM-G','Executive - Bachelor of Science in Entrepreneurial Management',4,0,'G',11,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','EGP','',0,''),
('MBA-HM','Executive - Master in Business Administration',1,0,'G',11,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','EGP','',0,'Masteral'),
('ADVCULARTS','SOP Advanced Culinary Arts',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('ADVBAKING','SOP Advanced Baking and Pastry Production',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('SOP-ONEYEARISM','SOP-One Year Industrial Security Management (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARCO','SOP-One Year Commercial Arts (With Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-GENCLERIC','SOP-One Year General Clerical (With Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARAU','SOP-One Year Automotive (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARDR','SOP-One Year Drafting (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEAREL','SOP-One Year Electrical (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARFA','SOP-One Year Fashion & Apparel Trade',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARFO','SOP-One Year Food Trades (with Credit)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARIN','SOP-One Year Industrial Chemistry (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARMA','SOP-One Year Machine Shop Practice (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARRE','SOP-One Year Refrigeration & Air-condioning Trades (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOPONEYRELECT','SOP-One Year Electronics (with credit course)',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('SAP-DE-BSIT','Bachelor of Science in Indusstrial Technology - Drafting Technology',5,0,'C',12,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SAP-DE','',0,''),
('SGPDE-EDD','SGP DE Doctor of Education - EM',2,0,'G',1,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Educational Management','GS','EM',0,'Doctoral'),
('SGPDE-MAED','SGP DE - Master of Arts in Education - Administration &amp; Supervision',2,0,'G',1,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','GS','',0,'Masteral'),
('SAP-DE-BSHRM','SAP-DE BSHRM',4,0,'C',12,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SAP-DE','',0,''),
('SOP-WSPM','SOP-One Year Wellness and Sports Program Manaagement (With Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('SOP-COSMETOLOGY','SOP Cosmetology',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Manila',NULL,'SOP',NULL,0,''),
('MAED-AS-DE','Distance Education - Master of Arts in Education',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Administration&amp; Supervision (Distance Educ.)','DE-SGP','DE',0,'Masteral'),
('EDD-EM','Distance Education - Doctor of Education',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Educational Management','DE-SGP','EM',0,'Doctoral'),
('BSINELEM','Bachelor in Elementary Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CED','',0,''),
('TBE','Technical Business Education',2,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('BSSA','Bachelor of Science in Secretarial Administration',4,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('ASA','Associate in Secretarial Administration',2,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('JS','Junior Secretarial',2,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('MPA-DE','Distance Education - Master in Public Administration',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','DE-SGP','',0,'Masteral'),
('TECHNICAL','Two-Year Technical',2,0,'C',6,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CIT','',0,''),
('DPA-DE','Distance Education - Doctor in Public Administration',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','DE-SGP','',0,'Doctoral'),
('DE-MBA','Distance Education - Master in Business Administration',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','DE-SGP','',0,'Masteral'),
('BSHRM','Bachelor of Science in Hotel and Restaurant Management',4,0,'C',9,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CHTM','',0,''),
('MABE','Master of Arts in Business Education',3,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','GS','',0,'Masteral'),
('ABA','Associate in Business Administration',2,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('GC','General Clerical',2,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('ADVELECTRONIC','SOP Advance Electronics',1,0,'G',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('SS','Three-YearSpecialized Secretarial',3,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('DE-MAT','Distance Education - Master of Arts in Teaching',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','DE-SGP','',0,'Masteral'),
('DE-DBA','Distance Education - Doctor in Business Administration',5,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','DE-SGP','',0,'Doctoral'),
('GENED','General Education',5,0,'C',14,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','Gen Ed','',0,''),
('MULTIMEDIA','SOP Multimedia Arts',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('BSNED','Bachelor of Special Needs Education (Generalist)',4,0,'C',3,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CED','',0,''),
('BTLED','Bachelor of Technology and Livelihood Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CED','',0,''),
('BSENTREP','Bachelor of Science in Entrepreneurship',4,0,'C',5,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CBPA','',0,''),
('BSINFOTECH','Bachelor of Science in Information Technology',4,0,'C',17,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CCS','',0,''),
('BSPSYCHOLOGY','Bachelor of Science in Psychology',4,0,'C',4,0,50,0,'',NULL,NULL,0,NULL,0,1,NULL,0,'Manila',NULL,'CAS',NULL,0,''),
('STENOGRAPHY','SOP Basic Stenography',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('COMCOOKING','SOP Commercial Cooking',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('Barista','SOP Barista',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','SOP','',0,''),
('BSEM','Bachelor of Science in Entrepreneurial Management',4,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CBPA','',0,''),
('BSBA-C','Bachelor of Science in Business Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSID-C','Bachelor of Science in Interior Design',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSARCHI-C','Bachelor of Science in Architecture',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSCS-C','Bachelor of Science in Computer Science',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','ECC','',0,''),
('BSIP-C','Bachelor of Science in Industrial Psychology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSMATH-C','Bachelor of Science in Mathematics',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSCRIM-C','Bachelor of Science in Criminology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','ECC','',0,''),
('BSPA-C','Bachelor in Public Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSCOE-C','Bachelor of Science in Computer Engineering',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSCHE-C','Bachelor of Science in Chemical Engineering',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSCE-C','Bachelor of Science in Civil Engineering',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSEE-C','Bachelor of Science in Electrical Engineering',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSECE-C','Bachelor of Science in Electronics and Communication Engineering',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSME-C','Bachelor of Science in Mechanical Engineering',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSTOURISM-C','Bachelor of Science in Tourism',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSIT-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSE-C','Bachelor in Secondary Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSOA-C','Bachelor of Science in Office Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','ECC','',0,''),
('EDD-C','Doctor of Education',3,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Educational Management','GS','EM',0,'Doctoral'),
('MBA-C','Master in Business Administration',3,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,'Masteral'),
('MAT-ELECT-C','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Electrical Technology','GS','',0,'Masteral'),
('BSCT-C','Bachelor of Science in Computer Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('MPA-C','Master in Public Administration',3,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,'Masteral'),
('MAED-C','Master of Arts in Education',3,0,'G',1,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Guidance and Counseling','GS','GC',0,'Masteral'),
('MAIP-C','Master of Arts in Industrial Psychology',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,'Masteral'),
('PHDIP-C','Doctor of Philosophy in Industrial Psychology',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,'Doctoral'),
('DBA-C','Doctor in Business Administration',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,'Doctoral'),
('DPA-C','Doctor in Public Administration',10,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,'Doctoral'),
('MAIEHRM-C','Master of Arts in Industrial Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Hotel and Restaurant Management','GS','HM',0,'Masteral'),
('MSMATH-C','Master of Science in Mathematics',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,'Masteral'),
('PROFED-C','Professional Education',1,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','GS','',0,''),
('BSHM-C','Bachelor of Science in Hospitality Management',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','ECC','',0,''),
('BREAD_PASTRY-C','SOP Baking &amp; Pastry Production',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('COMPHARDWARE-C','SOP Computer Hardware Servicing',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('COMPROGRAMMING-C','SOP Computer Programming',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('COMSOFTWARE-C','SOP Computer Software',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('CULINARYARTS-C','SOP Culinary Arts',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('DRAFTINGW-CAD-C','SOP Drafting with CAD',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('FBSERVICES-C','SOP Food and Beverage Services',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('FOODPROCESSING-C','SOP Food Processing and Preservation',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('GARMENTS-C','SOP Garments and Apparel Trades',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('HHSERVICES-C','SOP Household Services/Housekeeping w/ Hotel Operartion',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('LATHEMACHINE-C','SOP Lathe Machine Operations',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('REF-AIRCON-C','SOP Refrigeration &amp; Air-Con Servicing',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('REFLEXOLOGY-C','SOP Reflexology &amp; Massage Theraphy',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('CLERICAL-C','SOP Clerical Training',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('ENTREP-C','SOP Entrepreneurship',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('SMAW-C','SOP Shielded Metal Arc Welding',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('ELECTRICAL-C','SOP Electrical Installation and Maintenance',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('PHD-HRM-C','Doctor of Philosophy Human Resources Management',10,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,'Doctoral'),
('SUAP-C','Summer Program',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('EGPMBA-HM-C','Executive - Master in Business Administration',2,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,'Masteral'),
('SAP-DE-C','SAP-DE BSCS',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('EGPDPA-C','Executive - Doctor of Public Administration',1,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,'Doctoral'),
('BSEM-C','Bachelor of Science in Entrepreneurial Management',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('MBA-HM-C','Executive - Master in Business Administration',1,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,'Masteral'),
('SOP-ONEYEARISM-C','SOP-One Year Industrial Security Management (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARCO-C','SOP-One Year Commercial Arts (With Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-GENCLERIC-C','SOP-One Year General Clerical (With Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARAU-C','SOP-One Year Automotive (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARDR-C','SOP-One Year Drafting (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEAREL-C','SOP-One Year Electrical (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARFA-C','SOP-One Year Fashion & Apparel Trade',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARFO-C','SOP-One Year Food Trades (with Credit)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARIN-C','SOP-One Year Industrial Chemistry (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARMA-C','SOP-One Year Machine Shop Practice (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-ONEYEARRE-C','SOP-One Year Refrigeration & Air-condioning Trades (with Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOPONEYRELECT-C','SOP-One Year Electronics (with credit course)',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('SAP-DE-BSIT-C','Bachelor of Science in Indusstrial Technology - Drafting Technology',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('SGPDE-EDD-C','SGP DE Doctor of Education - EM',2,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Educational Management','ECC','EM',0,'Doctoral'),
('SGPDE-MAED-C','SGP DE - Master of Arts in Education - Administration &amp; Supervision',2,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,'Masteral'),
('SAP-DE-BSHRM-C','SAP-DE BSHRM',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('SOP-WSPM-C','SOP-One Year Wellness and Sports Program Manaagement (With Credit Course)',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('SOP-COSMETOLOGY-C','SOP Cosmetology',1,0,'C',7,0,50,0,'',NULL,NULL,0,NULL,0,0,NULL,0,'Cavite',NULL,'SOP',NULL,0,''),
('MAED-AS-DE-C','Distance Education - Master of Arts in Education',10,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','DE-SGP','',0,'Masteral'),
('EDD-EM-C','Distance Education - Doctor of Education',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','DE-SGP','',0,'Doctoral'),
('BSINELEM-C','Bachelor in Elementary Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('TBE-C','Technical Business Education',2,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSSA-C','Bachelor of Science in Secretarial Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('ASA-C','Associate in Secretarial Administration',2,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('JS-C','Junior Secretarial',2,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('MPA-DE-C','Distance Education - Master in Public Administration',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','DE-SGP','',0,'Masteral'),
('TEHNICAL-C','Two-Year Technical',2,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('DPA-DE-C','Distance Education - Doctor in Public Administration',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','DE-SGP','',0,'Doctoral'),
('DE-MBA-C','Distance Education - Master in Business Administration',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','DE-SGP','',0,'Masteral'),
('BSHRM-C','Bachelor of Science in Hotel and Restaurant Management',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('MABE-C','Master of Arts in Business Education',3,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,'Masteral'),
('ABA-C','Associate in Business Administration',2,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('GC-C','General Clerical',2,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('ADVELECTRONIC-C','SOP Advance Electronics',1,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('SS-C','Three-YearSpecialized Secretarial',3,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('DE-MAT-C','Distance Education - Master of Arts in Teaching',2,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','DE-SGP','',0,'Masteral'),
('DE-DBA-C','Distance Education - Doctor in Business Administration',5,0,'G',13,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','DE-SGP','',0,'Doctoral'),
('GENED-C','General Education',5,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('MULTIMEDIA-C','SOP Multimedia Arts',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('BSNED-C','Bachelor of Special Needs Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BTLED-C','Bachelor of Technology and Livelihood Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSENTREP-C','Bachelor of Science in Entrepreneurship',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSINFOTECH-C','Bachelor of Science in Information Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','ECC','',0,''),
('BSPSYCHOLOGY-C','Bachelor of Science in Psychology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','','ECC','',0,''),
('STENOGRAPHY-C','SOP Basic Stenography',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('COMCOOKING-C','SOP Commercial Cooking',1,0,'C',7,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','SOP','',0,''),
('BSEM-G-C','Executive - Bachelor of Science in Entrepreneurial Management',4,0,'G',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSE-SCI','Bachelor of Secondary Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Science','CED','SCI',0,''),
('BSE-MATH','Bachelor of Secondary Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Mathematics','CED','MATH',0,''),
('BSE-FIL','Bachelor of Secondary Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Filipino','CED','FIL',0,''),
('BSE-FIL-C','Bachelor in Secondary Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Filipino','ECC','FIL',0,''),
('BSE-MATH-C','Bachelor in Secondary Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Mathematics','ECC','MATH',0,''),
('BSE-SCI-C','Bachelor in Secondary Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Science','ECC','SCI',0,''),
('BTLED-HE','Bachelor of Technology and Livelihood Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Home Economics','CED','HE',0,''),
('BTLED-HE-C','Bachelor of Technology and Livelihood Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Home Economics','ECC','HE',0,''),
('BTLED-IA','Bachelor of Technology and Livelihood Education',4,0,'C',3,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Industrial Arts','CED','IA',0,''),
('BTLED-IA-C','Bachelor of Technology and Livelihood Education',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Industrial Arts','ECC','IA',0,''),
('BFA-PAINTING','Bachelor of Fine Arts',4,0,'C',0,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Painting','CAFA','PAINTING',0,''),
('BFA-VC','Bachelor of Fine Arts',4,0,'C',0,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Visual Communication','CAFA','VC',0,''),
('BSBA-MKTG-C','Bachelor of Science in Business Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Marketing Management','ECC','MKTG',0,''),
('BPA','Bachelor in Public Administration',4,0,'C',5,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','CBPA','',0,''),
('BSBA-HRDM-C','Bachelor of Science in Business Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Human Resources Development Management','ECC','HRDM',0,''),
('BSBA-HRM-C','Bachelor of Science in Business Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Human Resources Management','ECC','HRM',0,''),
('BSIT-AT','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Automotive Technology','CIT','AT',0,''),
('BSIT-AT-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Automotive Technology','ECC','AT',0,''),
('BSIT-ELECTRONICS','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Electronics Technology','CIT','ELECTRONICS',0,''),
('BSIT-ELECTRONICS-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Electronics Technology','ECC','ELECTRONICS',0,''),
('BSIT-ELECTRICAL','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Electrical Technology','CIT','ELECTRICAL',0,''),
('BSIT-ELECTRICAL-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Electrical Technology','ECC','ELECTRICAL',0,''),
('BSIT-FT','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Food Technology','CIT','FT',0,''),
('BSIT-FT-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Food Technology','ECC','FT',0,''),
('BSIT-IC','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Industrial Chemistry','CIT','IC',0,''),
('BSIT-IC-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Industrial Chemistry','ECC','IC',0,''),
('BSIT-DT','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Drafting Technology','CIT','DT',0,''),
('BSIT-DT-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Drafting Technology','ECC','DT',0,''),
('BSIT-MSP','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Machine Shop Technology','CIT','MSP',0,''),
('BSIT-MSP-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Machine Shop Practice','ECC','MSP',0,''),
('BSIT-RA','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Refrigeration and Air-conditioning','CIT','RA',0,''),
('BSIT-RA-C','Bachelor of Science in Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Refrigeration and Air-conditioning','ECC','RA',0,''),
('MAED-AS','Master of Arts in Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Administration and Supervision','GS','AS',0,'Masteral'),
('MAED-AS-C','Master of Arts in Education',3,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Administration and Supervision','GS','AS',0,'Masteral'),
('MAED-GC','Master of Arts in Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Guidance and Counseling','GS','GC',0,'Masteral'),
('MAED-GC-C','Master of Arts in Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Guidance and Counseling','GS','GC',0,'Masteral'),
('MAED-SE','Master of Arts in Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Special Education','GS','SE',0,'Masteral'),
('MAED-SE-C','Master of Arts in Education',5,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Special Education','GS','SE',0,'Masteral'),
('MAT-ET','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Electronics Technology','GS','ET',0,'Masteral'),
('MAT-ET-C','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Electronics Technology','GS','ET',0,'Masteral'),
('MAT-MATH','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Mathematics','GS','MATH',0,'Masteral'),
('MAT-MATH-C','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Mathematics','GS','MATH',0,'Masteral'),
('MAT-SCI','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Science','GS','SCI',0,'Masteral'),
('MAT-SCI-C','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Science','GS','SCI',0,'Masteral'),
('BSIT-FAT','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Fashion and Apparel Technology','CIT','FAT',0,''),
('BSIT-FAT-C','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Fashion and Apparel Technology','CIT','FAT',0,''),
('BSIT-MT','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Mechanical Technology','CIT','MT',0,''),
('BSIT-MT-C','Bachelor of Science in Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','Mechanical Technology','CIT','MT',0,''),
('BSBA-MKTG','Bachelor of Science in Business Administration',4,0,'C',5,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Marketing Management','CBPA','MKTG',0,''),
('BSBA-HRDM','Bachelor of Science in Business Administration',4,0,'C',5,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Human Resources Development Management','CBPA','HRDM',0,''),
('BSBA-HRM','Bachelor of Science in Business Administration',4,0,'C',5,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Human Resources Management','CBPA','HRM',0,''),
('BPA-C','Bachelor in Public Administration',4,0,'C',16,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Cavite','','ECC','',0,''),
('BSHM-HM','Bachelor of Science in Hospitality Management',4,0,'C',9,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Hotel Management','CHTM','HM',0,''),
('BSHM-CA','Bachelor of Science in Hospitality Management',4,0,'C',9,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Culinary Arts','CHTM','CA',0,''),
('BSHM-CO','Bachelor of Science in Hospitality Management',4,0,'C',9,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','Cruiseline Operation','CHTM','CO',0,''),
('BSARCHI-NONSTEM','Bachelor of Science in Architecture',5,0,'C',0,0,50,0,'','',NULL,0,0,0,0,NULL,0,'Manila','','CAFA','',0,''),
('SOP_AB','Advance Baking',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_AP','Arduino Programming',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_AS','Automotive Servicing',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_BAR','Bartending',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_BC','Basic Computer',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_BK','Bookkeeping',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_BPP','Bread and Pastry Production',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_CAD','CAD with Application',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_CK','Cookery',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_CP','Computer Programming',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_CSS','Computer System Servicing',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_EIM','Electrical Installation &amp; Maintenance',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_FBS','Food and Bevarage Services',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_FPP','Food Processing &amp; Preservation',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_GFD','Garments &amp; Fashion Design',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_HH','Household Services/Housekeeping with Hotel Operation',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_RAS','Refrigeration &amp; Aircon Services',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_RMT','Reflexology/Massage Therapy',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_SMAW','Shielded Metal Arc Welding',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_WPD','Web Page Development',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('NSTP','NATIONAL SERVICE TRAINING PROGRAM',1,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','NSTP MILITARY TRAINING SERVICE 1 ','ECC','NSTPMTS1',0,''),
('BINDTECH-AF','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Apparel and Fashion','CIT','AF',0,''),
('BINDTECH-AT','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Automotive Technology','CIT','AT',0,''),
('BINDTECH-CT','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Computer Technology','CIT','CT',0,''),
('BINDTECH-DT','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Drafting Technology','CIT','DT',0,''),
('BINDTECH-ELECTRONICS','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Electronics Technology','CIT','ELECTRONICS',0,''),
('BINDTECH-ELECTRICAL','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Electrical Technology','CIT','ELECTRICAL',0,''),
('BINDTECH-FT','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Food Trades','CIT','FT',0,''),
('BINDTECH-IC','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Industrial Chemistry','CIT','IC',0,''),
('BINDTECH-MT','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Mechanical Technology','CIT','MT',0,''),
('BINDTECH-HVART','Bachelor of Industrial Technology',4,0,'C',6,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Heating, Ventilating, Air Conditioning and Refrigeration Technology','CIT','HVART',0,''),
('SOP_AERAA','Advanced Electronic Radio Amplifier Assembly',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('MAT-ELECT','Master of Arts in Teaching',2,0,'G',1,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','Electrical Technology','GS','ELECT',0,'Masteral'),
('BINDTECH-AT-C','Bachelor of Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Automotive Technology','ECC','AT',0,''),
('BINDTECH-DT-C','Bachelor of Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Drafting Technology','ECC','DT',0,''),
('BINDTECH-ELX-C','Bachelor of Industrial Technology ',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Electronics Technology','ECC','ELX',0,''),
('BINDTECH-ELC-C','Bachelor of Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Electrical Technology','ECC','ELC',0,''),
('BINDTECH-FT-C','Bachelor of Industrial Technology',4,0,'C',16,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Cavite','Food Trades','ECC','FT',0,''),
('SOP_AMC','Advanced Motor Control',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_EMS','Events Management Sevices',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_MMC','Motors and Motor Control',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_IOT','Internet of Things',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,''),
('SOP_NC','Network and Cabling ',1,0,'A',7,0,50,0,'','',NULL,0,0,0,1,NULL,0,'Manila','','SOP','',0,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
