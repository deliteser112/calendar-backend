/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.14-MariaDB : Database - twivuze
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`twivuze` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `twivuze`;

/*Table structure for table `calendars` */

DROP TABLE IF EXISTS `calendars`;

CREATE TABLE `calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `consultation_scheduler_id` bigint(20) NOT NULL,
  `doctor_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `year` int(11) NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'forDoctor',
  `hospital_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `calendars` */

insert  into `calendars`(`id`,`title`,`date`,`consultation_scheduler_id`,`doctor_id`,`created_at`,`updated_at`,`year`,`month`,`type`,`hospital_id`) values 
(24,'Doriane Sabushimike, Online Consult','2021-11-01',0,2,'2020-11-14 11:19:25','2020-11-14 11:19:25',2021,'November','Online',0),
(29,'Dr Rubagumya Fidel, In-Person Consult','2020-11-02',0,2,'2020-11-15 01:43:34','2020-11-15 01:43:34',2020,'November','In-Person',8),
(30,'Dr Rubagumya Fidel, Online Consult','2020-11-03',0,2,'2020-11-15 01:43:46','2020-11-15 01:43:46',2020,'November','Online',0),
(31,'Dr Rubagumya Fidel, In-Person Consult','2020-11-17',0,2,'2020-11-15 05:40:55','2020-11-15 05:40:55',2020,'November','In-Person',8),
(32,'Dr Rubagumya Fidel, In-Person Consult','2021-04-30',0,2,'2020-11-15 05:41:47','2020-11-15 05:41:47',2021,'November','In-Person',7),
(33,'Dr  Maniragaba Theoneste, In-Person Consult ','2020-11-18',0,7,'2020-11-15 05:43:19','2020-11-15 05:43:19',2020,'November','In-Person',7),
(34,'Pa, Online Consult','2020-12-04',0,35,'2020-12-03 02:37:56','2020-12-03 02:37:56',2020,'December','Online',0),
(35,'Dr Ladislas HATEGEKA, Online Consult','2020-12-07',0,43,'2020-12-07 15:02:45','2020-12-07 15:02:45',2020,'December','Online',0),
(36,'Dr Rubagumya Fidel, Online Consult','2021-04-30',0,2,'2020-12-10 06:19:37','2020-12-10 06:19:37',2020,'December','Online',0),
(37,'Dr Rubagumya Fidel, Online Consult','2020-12-15',0,2,'2020-12-10 06:19:56','2020-12-10 06:19:56',2020,'December','Online',0),
(38,'Dr. BABANE Jean Felix, Online Consult','2021-01-20',0,51,'2021-01-27 06:38:31','2021-01-27 06:38:31',2021,'January','Online',0),
(39,'Dr. BABANE Jean Felix, Online Consult','2021-05-20',0,51,'2021-01-27 06:38:54','2021-01-27 06:38:54',2021,'January','Online',0),
(40,'Dr. BABANE Jean Felix, Online Consult','2020-12-17',0,2,'2021-03-20 02:34:05','2021-03-20 02:34:08',2020,'January','forDoctor',NULL);

/*Table structure for table `timeslots` */

DROP TABLE IF EXISTS `timeslots`;

CREATE TABLE `timeslots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calender_id` bigint(20) NOT NULL,
  `slot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT 0,
  `taken_user_id` bigint(20) DEFAULT NULL,
  `taken_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Consult-Online',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `timeslots` */

insert  into `timeslots`(`id`,`time`,`calender_id`,`slot`,`created_at`,`updated_at`,`taken`,`taken_user_id`,`taken_by_type`) values 
(143,'05:15 AM',24,'Morning','2020-11-14 11:19:25','2021-03-04 12:40:58',1,2,'Consult-Online'),
(144,'13:15 PM',24,'Afternoon','2020-11-14 11:19:25','2020-11-14 11:19:25',0,NULL,'Consult-Online'),
(164,'05:15 AM',29,'Morning','2020-11-15 01:43:34','2020-11-15 01:43:34',0,NULL,'Consult-Online'),
(165,'13:35 PM',29,'Afternoon','2020-11-15 01:43:34','2020-11-15 01:43:34',0,NULL,'Consult-Online'),
(166,'05:35 AM',30,'Morning','2020-11-15 01:43:46','2020-11-15 01:43:46',0,NULL,'Consult-Online'),
(167,'13:15 PM',30,'Afternoon','2020-11-15 01:43:46','2020-11-15 01:43:46',0,NULL,'Consult-Online'),
(168,'06:35 AM',31,'Morning','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(169,'16:55 PM',31,'Afternoon','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(170,'17:15 PM',31,'Afternoon','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(171,'17:35 PM',31,'Afternoon','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(172,'17:55 PM',31,'Afternoon','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(173,'18:15 PM',31,'Afternoon','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(174,'18:35 PM',31,'Afternoon','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(175,'18:55 PM',31,'Afternoon','2020-11-15 05:40:55','2020-11-15 05:40:55',0,NULL,'Consult-Online'),
(176,'08:15 AM',32,'Morning','2020-11-15 05:41:47','2021-03-04 10:59:45',1,2,'Consult-Online'),
(177,'08:35 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:47:54',1,49,'Consult-In-Person'),
(178,'08:55 AM',32,'Morning','2020-11-15 05:41:47','2021-03-04 11:07:17',1,2,'Consult-In-Person'),
(179,'09:15 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(180,'09:35 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(181,'09:55 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(182,'10:15 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(183,'10:35 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(184,'10:55 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(185,'11:15 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(186,'11:35 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(187,'11:55 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(188,'12:15 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(189,'12:35 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(190,'12:55 AM',32,'Morning','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(191,'13:15 PM',32,'Afternoon','2020-11-15 05:41:47','2020-11-15 05:41:47',0,NULL,'Consult-Online'),
(192,'08:15 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(193,'08:35 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(194,'08:55 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(195,'09:15 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(196,'09:35 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(197,'09:55 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(198,'10:15 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(199,'10:35 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(200,'10:55 AM',33,'Morning','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(201,'13:15 PM',33,'Afternoon','2020-11-15 05:43:19','2020-11-15 05:43:19',0,NULL,'Consult-Online'),
(202,'07:15 AM',34,'Morning','2020-12-03 02:37:56','2020-12-03 02:37:56',0,NULL,'Consult-Online'),
(203,'13:15 PM',34,'Afternoon','2020-12-03 02:37:56','2020-12-03 02:37:56',0,NULL,'Consult-Online'),
(204,'08:15 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(205,'08:35 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(206,'08:55 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(207,'09:15 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(208,'09:35 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(209,'09:55 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(210,'10:15 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(211,'10:35 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(212,'10:55 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(213,'11:15 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(214,'11:35 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(215,'11:55 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(216,'12:15 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(217,'12:35 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(218,'12:55 AM',35,'Morning','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(219,'13:15 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(220,'13:35 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(221,'13:55 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(222,'14:15 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(223,'14:35 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(224,'14:55 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(225,'15:15 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(226,'15:35 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(227,'15:55 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(228,'16:15 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(229,'16:35 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(230,'17:15 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(231,'17:35 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(232,'17:55 PM',35,'Afternoon','2020-12-07 15:02:45','2020-12-07 15:02:45',0,NULL,'Consult-Online'),
(233,'07:15 AM',36,'Morning','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(234,'07:35 AM',36,'Morning','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(235,'07:55 AM',36,'Morning','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(236,'12:15 AM',36,'Morning','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(237,'17:15 PM',36,'Afternoon','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(238,'17:35 PM',36,'Afternoon','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(239,'18:35 PM',36,'Afternoon','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(240,'18:55 PM',36,'Afternoon','2020-12-10 06:19:37','2020-12-10 06:19:37',0,NULL,'Consult-Online'),
(241,'11:15 AM',37,'Morning','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(242,'11:35 AM',37,'Morning','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(243,'12:15 AM',37,'Morning','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(244,'12:35 AM',37,'Morning','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(245,'12:55 AM',37,'Morning','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(246,'13:55 PM',37,'Afternoon','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(247,'14:35 PM',37,'Afternoon','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(248,'15:15 PM',37,'Afternoon','2020-12-10 06:19:56','2020-12-10 06:19:56',0,NULL,'Consult-Online'),
(249,'05:15 AM',38,'Morning','2021-01-27 06:38:31','2021-01-27 06:38:31',0,NULL,'Consult-Online'),
(250,'13:35 PM',39,'Afternoon','2021-01-27 06:38:54','2021-01-27 06:38:54',0,NULL,'Consult-Online'),
(251,'13:35 PM',40,'Afternoon','2021-03-23 02:37:00','2021-03-20 02:37:04',0,NULL,'Consult-Online');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
