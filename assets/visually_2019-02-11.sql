# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.12-MariaDB)
# Database: visually
# Generation Time: 2019-02-11 02:20:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can view permission',2,'view_permission'),
	(9,'Can add group',3,'add_group'),
	(10,'Can change group',3,'change_group'),
	(11,'Can delete group',3,'delete_group'),
	(12,'Can view group',3,'view_group'),
	(13,'Can add user',4,'add_user'),
	(14,'Can change user',4,'change_user'),
	(15,'Can delete user',4,'delete_user'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add Token',7,'add_token'),
	(26,'Can change Token',7,'change_token'),
	(27,'Can delete Token',7,'delete_token'),
	(28,'Can view Token',7,'view_token'),
	(29,'Can add text',9,'add_text'),
	(30,'Can change text',9,'change_text'),
	(31,'Can delete text',9,'delete_text'),
	(32,'Can view text',9,'view_text'),
	(33,'Can add media',8,'add_media'),
	(34,'Can change media',8,'change_media'),
	(35,'Can delete media',8,'delete_media'),
	(36,'Can view media',8,'view_media');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$120000$dakjNjVWBcUc$mlhsNQbKjJbQNRLq5PkBXkH2yCiJ8vwW6h+1DqVA0No=','2019-02-11 01:41:50.762814',1,'denyoe','Marcus','Ekon','ddecs23@gmail.com',1,1,'2019-02-02 02:14:56.000000'),
	(2,'pbkdf2_sha256$120000$pmeuXEOrTEqC$eT+DtyDZwkk5H0k2/6sO9rsCPt35TM//zc1hnYvOwao=','2019-02-11 01:41:42.933114',1,'hayden','','','hayden@bleek.io',1,1,'2019-02-02 05:10:00.549161');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table authtoken_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authtoken_token`;

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`)
VALUES
	('67fbcbce00fc147ea09672fe022d3f5c13f4b77f','2019-02-02 02:58:32.780420',1);

/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2019-02-02 02:32:58.209976','4','Records this ( Hah ) [ haha ]',1,'[{\"added\": {}}]',8,1),
	(2,'2019-02-02 02:33:13.349724','4','Records this ( Hah ) [ haha ]',2,'[]',8,1),
	(3,'2019-02-02 02:33:17.900854','4','Records this ( Hah ) [ haha ]',3,'',8,1),
	(4,'2019-02-02 02:36:48.283400','1','New Media ( this is a url ) [ denyoe@bleek.io ]',1,'[{\"added\": {}}]',8,1),
	(5,'2019-02-02 03:24:03.075881','1','New Media [mp4] ( this is a url - internal ) [ denyoe@bleek.io ]',2,'[{\"changed\": {\"fields\": [\"internal_url\"]}}]',8,1),
	(6,'2019-02-02 03:24:04.920986','1','New Media [mp4] ( this is a url - internal ) [ denyoe@bleek.io ]',2,'[]',8,1),
	(7,'2019-02-03 03:50:38.129424','1','Candidate object (1)',1,'[{\"added\": {}}]',10,1),
	(8,'2019-02-03 03:53:43.757581','1','Question object (1)',1,'[{\"added\": {}}]',11,1),
	(9,'2019-02-03 03:53:47.603690','1','first upload [mp4] (url)',1,'[{\"added\": {}}]',8,1),
	(10,'2019-02-03 03:53:55.856961','1','Text object (1)',1,'[{\"added\": {}}]',9,1),
	(11,'2019-02-03 04:41:35.041754','1','First Question',1,'[{\"added\": {}}]',11,1),
	(12,'2019-02-03 04:41:46.849021','1','First Question',2,'[{\"changed\": {\"fields\": [\"keywords_csv\"]}}]',11,1),
	(13,'2019-02-03 04:43:32.763614','1','First Question',2,'[{\"changed\": {\"fields\": [\"keywords_csv\"]}}]',11,1),
	(14,'2019-02-03 04:43:43.851282','1','First Question',2,'[{\"changed\": {\"fields\": [\"keywords_csv\"]}}]',11,1),
	(15,'2019-02-03 05:10:12.013654','1','Media [mp4] (url)',1,'[{\"added\": {}}]',8,1),
	(16,'2019-02-03 05:21:12.980917','13','Media by New Candidate [cand@gmail.com]',1,'[{\"added\": {}}]',9,1),
	(17,'2019-02-11 00:18:06.105142','2','Academic Background',1,'[{\"added\": {}}]',11,1),
	(18,'2019-02-11 00:19:11.647199','3','Why are you interested in joining a master program in France?',1,'[{\"added\": {}}]',11,1),
	(19,'2019-02-11 00:21:33.388685','4','Why are you interested in pursuing a master degree in Software Engineering?',1,'[{\"added\": {}}]',11,1),
	(20,'2019-02-11 01:15:28.378935','2','Candidate 1 - cand1@email.com',1,'[{\"added\": {}}]',10,1),
	(21,'2019-02-11 01:15:43.307319','3','Candidate 2 - cand2@gmail.com',1,'[{\"added\": {}}]',10,1),
	(22,'2019-02-11 01:15:53.606362','4','Candidate 3 - cand3@gmail.com',1,'[{\"added\": {}}]',10,1),
	(23,'2019-02-11 01:16:48.630667','5','Alfonse Docksey - adocksey0@skyrock.com',1,'[{\"added\": {}}]',10,1),
	(24,'2019-02-11 01:17:07.890612','4','Say Knox - sknox1@odnoklassniki.ru',2,'[{\"changed\": {\"fields\": [\"name\", \"email\"]}}]',10,1),
	(25,'2019-02-11 01:17:27.883057','3','Donella Brombell - dbrombell4@bloomberg.com',2,'[{\"changed\": {\"fields\": [\"name\", \"email\"]}}]',10,1),
	(26,'2019-02-11 01:17:50.325151','2','Thalia Moat - tmoata@netlog.com',2,'[{\"changed\": {\"fields\": [\"name\", \"email\"]}}]',10,1),
	(27,'2019-02-11 01:18:46.321731','1','Illa Mityushin - imityushini@over-blog.com',2,'[{\"changed\": {\"fields\": [\"name\", \"email\"]}}]',10,1),
	(28,'2019-02-11 01:19:36.278063','9','[imityushini@over-blog.com] scored 0.4809471526759756 on First Answer',3,'',12,1),
	(29,'2019-02-11 01:19:56.737329','1','Media',3,'',8,1),
	(30,'2019-02-11 01:20:17.685328','1','First Answer',3,'',11,1),
	(31,'2019-02-11 01:20:42.775085','1','denyoe',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,1),
	(32,'2019-02-11 01:49:23.134458','20','Illa Mityushin [imityushini@over-blog.com] Answered Question: Academic Background ',1,'[{\"added\": {}}]',9,1),
	(33,'2019-02-11 01:50:16.897253','20','Illa Mityushin [imityushini@over-blog.com] - Answer to - Academic Background ',2,'[]',9,1),
	(34,'2019-02-11 01:55:56.691817','21','Illa Mityushin [imityushini@over-blog.com] - Answer to - Why are you interested in joining a master program in France? ',1,'[{\"added\": {}}]',9,1),
	(35,'2019-02-11 01:56:21.972122','22','Donella Brombell [dbrombell4@bloomberg.com] - Answer to - Academic Background ',1,'[{\"added\": {}}]',9,1),
	(36,'2019-02-11 01:56:45.624672','23','Thalia Moat [tmoata@netlog.com] - Answer to - Why are you interested in joining a master program in France? ',1,'[{\"added\": {}}]',9,1),
	(37,'2019-02-11 01:57:15.511248','24','Alfonse Docksey [adocksey0@skyrock.com] - Answer to - Academic Background ',1,'[{\"added\": {}}]',9,1),
	(38,'2019-02-11 01:57:42.099116','25','Thalia Moat [tmoata@netlog.com] - Answer to - Academic Background ',1,'[{\"added\": {}}]',9,1),
	(39,'2019-02-11 01:58:27.069384','26','Alfonse Docksey [adocksey0@skyrock.com] - Answer to - Why are you interested in pursuing a master degree in Software Engineering? ',1,'[{\"added\": {}}]',9,1),
	(40,'2019-02-11 01:58:48.830731','26','Alfonse Docksey [adocksey0@skyrock.com] - Answer to - Why are you interested in pursuing a master degree in Software Engineering? ',2,'[{\"changed\": {\"fields\": [\"text\"]}}]',9,1),
	(41,'2019-02-11 01:59:13.340474','27','Say Knox [sknox1@odnoklassniki.ru] - Answer to - Academic Background ',1,'[{\"added\": {}}]',9,1),
	(42,'2019-02-11 01:59:50.573106','28','Say Knox [sknox1@odnoklassniki.ru] - Answer to - Why are you interested in pursuing a master degree in Software Engineering? ',1,'[{\"added\": {}}]',9,1),
	(43,'2019-02-11 02:00:43.114408','29','Thalia Moat [tmoata@netlog.com] - Answer to - Why are you interested in pursuing a master degree in Software Engineering? ',1,'[{\"added\": {}}]',9,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(7,'authtoken','token'),
	(5,'contenttypes','contenttype'),
	(10,'media_manager','candidate'),
	(8,'media_manager','media'),
	(11,'media_manager','question'),
	(12,'media_manager','score'),
	(9,'media_manager','text'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2019-02-02 02:14:02.301276'),
	(2,'auth','0001_initial','2019-02-02 02:14:02.578406'),
	(3,'admin','0001_initial','2019-02-02 02:14:02.645636'),
	(4,'admin','0002_logentry_remove_auto_add','2019-02-02 02:14:02.654671'),
	(5,'admin','0003_logentry_add_action_flag_choices','2019-02-02 02:14:02.661463'),
	(6,'contenttypes','0002_remove_content_type_name','2019-02-02 02:14:02.695467'),
	(7,'auth','0002_alter_permission_name_max_length','2019-02-02 02:14:02.715261'),
	(8,'auth','0003_alter_user_email_max_length','2019-02-02 02:14:02.724650'),
	(9,'auth','0004_alter_user_username_opts','2019-02-02 02:14:02.731724'),
	(10,'auth','0005_alter_user_last_login_null','2019-02-02 02:14:02.747383'),
	(11,'auth','0006_require_contenttypes_0002','2019-02-02 02:14:02.749639'),
	(12,'auth','0007_alter_validators_add_error_messages','2019-02-02 02:14:02.757572'),
	(13,'auth','0008_alter_user_username_max_length','2019-02-02 02:14:02.783044'),
	(14,'auth','0009_alter_user_last_name_max_length','2019-02-02 02:14:02.811167'),
	(15,'authtoken','0001_initial','2019-02-02 02:14:02.850847'),
	(16,'authtoken','0002_auto_20160226_1747','2019-02-02 02:14:02.905572'),
	(22,'media_manager','0001_initial','2019-02-03 04:40:39.027077'),
	(23,'media_manager','0002_text_score','2019-02-03 05:59:26.043614'),
	(24,'media_manager','0003_auto_20190209_2029','2019-02-09 20:29:30.561249'),
	(25,'media_manager','0004_score_entities','2019-02-09 21:08:07.072437'),
	(26,'media_manager','0005_auto_20190211_0140','2019-02-11 01:41:05.577207');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('toctkeuzrfshg9b6mqgwu2arvcmsao8x','Y2IzMWYyMjk5ZDI2YTk2OWIzZDAwZjJlMWFjNjlhMzMxYzc0OTYzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZDQ0YzgyMTE0ODc1ZDIzNmUwNDU4NTM2MjdjMGMxZGM0OWNmMDVjIn0=','2019-02-25 01:41:50.764430');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media_manager_candidate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_manager_candidate`;

CREATE TABLE `media_manager_candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `media_manager_candidate` WRITE;
/*!40000 ALTER TABLE `media_manager_candidate` DISABLE KEYS */;

INSERT INTO `media_manager_candidate` (`id`, `name`, `email`)
VALUES
	(1,'Illa Mityushin','imityushini@over-blog.com'),
	(2,'Thalia Moat','tmoata@netlog.com'),
	(3,'Donella Brombell','dbrombell4@bloomberg.com'),
	(4,'Say Knox','sknox1@odnoklassniki.ru'),
	(5,'Alfonse Docksey','adocksey0@skyrock.com');

/*!40000 ALTER TABLE `media_manager_candidate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media_manager_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_manager_media`;

CREATE TABLE `media_manager_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `original_url` varchar(255) NOT NULL,
  `m_format` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_manager_media_candidate_id_a4bd17ef_fk_media_man` (`candidate_id`),
  KEY `media_manager_media_question_id_94ad1cc5_fk_media_man` (`question_id`),
  CONSTRAINT `media_manager_media_candidate_id_a4bd17ef_fk_media_man` FOREIGN KEY (`candidate_id`) REFERENCES `media_manager_candidate` (`id`),
  CONSTRAINT `media_manager_media_question_id_94ad1cc5_fk_media_man` FOREIGN KEY (`question_id`) REFERENCES `media_manager_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;



# Dump of table media_manager_question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_manager_question`;

CREATE TABLE `media_manager_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `reference_answer` longtext DEFAULT NULL,
  `keywords_csv` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `media_manager_question` WRITE;
/*!40000 ALTER TABLE `media_manager_question` DISABLE KEYS */;

INSERT INTO `media_manager_question` (`id`, `text`, `reference_answer`, `keywords_csv`)
VALUES
	(2,'Academic Background','Computer Science, Information Technology, IT, Computer','Computer Science,Information Technology,IT,Computer'),
	(3,'Why are you interested in joining a master program in France?','paris, reputed, EPITA, good, very good','EPITA,reputed,very good,paris,good'),
	(4,'Why are you interested in pursuing a master degree in Software Engineering?','I love computers. I love developing, building software. I have x years of experience in developing computer applications or web application.','experience,development,computer software,web application');

/*!40000 ALTER TABLE `media_manager_question` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media_manager_score
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_manager_score`;

CREATE TABLE `media_manager_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `similarity_score` double DEFAULT NULL,
  `candidate_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `entities` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_manager_score_candidate_id_3d8df5eb_fk_media_man` (`candidate_id`),
  KEY `media_manager_score_question_id_5d20d97d_fk_media_man` (`question_id`),
  CONSTRAINT `media_manager_score_candidate_id_3d8df5eb_fk_media_man` FOREIGN KEY (`candidate_id`) REFERENCES `media_manager_candidate` (`id`),
  CONSTRAINT `media_manager_score_question_id_5d20d97d_fk_media_man` FOREIGN KEY (`question_id`) REFERENCES `media_manager_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `media_manager_score` WRITE;
/*!40000 ALTER TABLE `media_manager_score` DISABLE KEYS */;

INSERT INTO `media_manager_score` (`id`, `similarity_score`, `candidate_id`, `question_id`, `entities`)
VALUES
	(11,0.3407766828344755,1,2,'SQL, '),
	(12,0.2990189844729818,2,2,''),
	(13,0.37167174606774095,2,3,'France, '),
	(14,0.771772156853541,2,4,'Apine, india, '),
	(15,0.7494129550141967,4,4,''),
	(16,0.624495218820615,5,2,'Heng En, DSE, Ho Chi Minh, one, vietnam, DSE, more then 3 years, Ehh, ');

/*!40000 ALTER TABLE `media_manager_score` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media_manager_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_manager_text`;

CREATE TABLE `media_manager_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `score_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_manager_text_candidate_id_7d4637ac_fk_media_man` (`candidate_id`),
  KEY `media_manager_text_question_id_0e9d1a45_fk_media_man` (`question_id`),
  KEY `media_manager_text_media_id_fb17bf56_fk_media_manager_media_id` (`media_id`),
  KEY `media_manager_text_score_id_c5dfa938_fk_media_manager_score_id` (`score_id`),
  CONSTRAINT `media_manager_text_candidate_id_7d4637ac_fk_media_man` FOREIGN KEY (`candidate_id`) REFERENCES `media_manager_candidate` (`id`),
  CONSTRAINT `media_manager_text_media_id_fb17bf56_fk_media_manager_media_id` FOREIGN KEY (`media_id`) REFERENCES `media_manager_media` (`id`),
  CONSTRAINT `media_manager_text_question_id_0e9d1a45_fk_media_man` FOREIGN KEY (`question_id`) REFERENCES `media_manager_question` (`id`),
  CONSTRAINT `media_manager_text_score_id_c5dfa938_fk_media_manager_score_id` FOREIGN KEY (`score_id`) REFERENCES `media_manager_score` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `media_manager_text` WRITE;
/*!40000 ALTER TABLE `media_manager_text` DISABLE KEYS */;

INSERT INTO `media_manager_text` (`id`, `text`, `candidate_id`, `media_id`, `score_id`, `question_id`)
VALUES
	(20,'hi my name is [...] i had done my bachelor in [...] i was chosen for the engineering on completion technologie stream during courses i have learn many programming languages like java python and ? management system i have [done] multiple project during my engineering euh... I have [up done] multiple project especially student a wise usage of SQL and java technologie thank you',1,NULL,NULL,2),
	(21,'The reason why I have chosen this institution is, first there is a huge cultural difference between the place where I studied and also came to know about the technologies that they use in France. It will be a great opportunity for me to study in France, mainly cultural and get this back to my country. It will be a pleasure for me to work in France and because France has also two years of work visa, it will be a great exposure for me.',1,NULL,NULL,3),
	(22,'I completed Design and with 77% and I completed my intern abroad with 75% and my MPC and I completed my school in Dr. KI Gotham confederate school with a mark of 7.4 in center board of secondary degree education. This is my educational information.',3,NULL,NULL,2),
	(23,'Eh [...]  Master in France [...] master program in france is [...] the best world wide we have the top [...] universities and epita is the one of the best universities is..  in the top ranking with it excellent programs and opportunities [...]  during the education and after education.',2,NULL,NULL,3),
	(24,'Hello, My name is Heng En. I am software engineer in an international company which a DSE vietnam, and i studied in a IT department of Ho Chi Minh university of science, one of the most prestigious in vietnam for science and technology and now i am working for DSE for more then 3 years [...] Ehh [...] and i am wonder if i.....',5,NULL,NULL,2),
	(25,'my career apart therefore i [...] management based on software architecture.\r\nI wanna improve my technical skills plus the normal developper [...] i believe that a [...]\r\nof good graduate school in french it demands efficient [...] so i need to claim my [...]',2,NULL,NULL,2),
	(26,'it can be [...] my base knowledge in IT information center, cloud technology allow me to quicly learn. We learn each in a very short time so with my experience in international IT compagny. i believe that i can study information technology in higher level and i can claim up to obtain more knowledge that i can.',5,NULL,NULL,4),
	(27,'Hi I started my primary school from [...] school I graduated and I move forward to a secondary school and I graduated on the year 2013 and I enrole in september to institute university of benin benin republic where i studied computer science and I graduated last year which is 2016 so and now I\'m inspiring to follow my education in master in software engineering in your prestigious university.',4,NULL,NULL,2),
	(28,'Well I... of technologie in industrie market of communication engineering and... I euh... I Ho.. I have studied well and... I hope I... I like use some euh... I have studied few computer science related subject and few electronic subject I realise hum... I lo.. I.. I realised a load database management and I load database management system which is more important in our such a field hum.. I like this subject because of...',4,NULL,NULL,4),
	(29,'My hook completed after completion of my undergraduation I have selected in placement It... hum... It... hum... That companie name is Apine(?) india private limited euh.. I had joine as a associate software engineer and... I ho I don\'t well I don\'t fear work experience as software engineer and... and... I realised that has studied few computer related subject in my undergraduation that\'s why I have selected this field and now had a software engineering is the booming in the world and my home country is also offering good opportunity for software engineers.',2,NULL,NULL,4);

/*!40000 ALTER TABLE `media_manager_text` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
