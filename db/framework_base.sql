# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.16)
# Database: framework_base
# Generation Time: 2017-08-23 12:10:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table adminuser_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adminuser_role`;

CREATE TABLE `adminuser_role` (
  `adminuser_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`adminuser_id`,`role_id`),
  KEY `adminuser_role_role_id_foreign` (`role_id`),
  CONSTRAINT `adminuser_role_adminuser_id_foreign` FOREIGN KEY (`adminuser_id`) REFERENCES `adminusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adminuser_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `adminuser_role` WRITE;
/*!40000 ALTER TABLE `adminuser_role` DISABLE KEYS */;

INSERT INTO `adminuser_role` (`adminuser_id`, `role_id`)
VALUES
	(3,1);

/*!40000 ALTER TABLE `adminuser_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table adminusers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adminusers`;

CREATE TABLE `adminusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `real_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `adminusers` WRITE;
/*!40000 ALTER TABLE `adminusers` DISABLE KEYS */;

INSERT INTO `adminusers` (`id`, `first_name`, `last_name`, `email`, `password`, `real_password`, `remember_token`, `created_at`, `updated_at`, `is_active`) VALUES
(3, 'Magutti', 'Admin', 'cmsadmin@magutti.com', '$2y$10$RvNPNLzOwFUGr/v2BwMNWOR3hZs.q13LaOnyXN2HBq0KgQOEpIXhW', 'password', 'i57xldsH7Qpjps6jljA6u2BCQgFuYbJuK3fIrEOZUkrr7vK0J8NETi2LsF6u', '0000-00-00 00:00:00', '2017-08-26 09:21:13', 1);

/*!40000 ALTER TABLE `adminusers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_translations`;

CREATE TABLE `article_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_no_index` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_translations_article_id_locale_unique` (`article_id`,`locale`),
  KEY `article_translations_locale_index` (`locale`),
  CONSTRAINT `article_translations_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `article_translations` WRITE;
/*!40000 ALTER TABLE `article_translations` DISABLE KEYS */;

INSERT INTO `article_translations` (`id`, `article_id`, `locale`, `slug`, `menu_title`, `title`, `subtitle`, `intro`, `description`, `abstract`, `seo_title`, `seo_description`, `seo_keywords`, `seo_no_index`, `created_by`, `update_by`, `created_at`, `updated_at`)
VALUES
	(1,1,'it','home','Home','Home','LaraCms',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec volutpat maximus purus, sit amet congue nulla maximus quis. Nam sit amet massa sed ante rhoncus vehicula. Nam nec metus eu lorem porttitor suscipit. In at mi sit amet felis tincidunt lobortis ac quis nulla. Morbi condimentum eros vel felis iaculis facilisis. Nam at elit a odio elementum fringilla a vel magna. Vestibulum varius bibendum lectus, sed cursus leo consectetur a. Duis venenatis hendrerit enim, vitae tincidunt quam. Phasellus sollicitudin lobortis turpis, quis mollis purus porttitor sit amet.</p>','','','','','0',0,0,'2016-07-04 07:53:04','2017-08-01 15:12:25'),
	(2,1,'en','home','Home','Home','',NULL,'','','','','','',0,0,'2016-07-04 07:53:04','2017-08-01 15:52:32'),
	(3,2,'it','azienda','Azienda','Azienda','','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a libero vitae elit pretium cursus. Ut maximus felis pretium augue ullamcorper venenatis. Aenean mattis hendrerit dui id aliquet. Nunc rhoncus ipsum ut orci posuere semper vel quis diam. Duis pulvinar molestie nisi, sed sollicitudin metus fermentum sit amet. Phasellus semper, nibh sed laoreet blandit, ligula neque egestas tortor, ac porttitor massa justo ut diam.</p>\r\n<p>Donec id sem sem. Pellentesque augue quam, euismod nec neque non, sollicitudin tincidunt purus. Sed viverra libero eget ante sollicitudin iaculis. Donec erat tellus, aliquet aliquam nisi vel, faucibus interdum est. In aliquet pharetra eros vel lacinia. Nam sit amet ex tristique, pretium quam quis, ullamcorper dolor. Vestibulum gravida eros accumsan gravida iaculis. Suspendisse eu elit metus. Pellentesque iaculis rutrum augue quis blandit. Fusce at lacus vestibulum, placerat justo vitae, lacinia nisl. Phasellus accumsan enim vitae ex condimentum rhoncus.</p>\r\n<p>Duis feugiat semper eros, vitae consectetur mauris volutpat viverra. Aenean at augue dui. Sed varius tincidunt hendrerit. Cras sed condimentum nunc. Vestibulum consequat eget ipsum a ultrices. Proin auctor commodo facilisis. Praesent quis neque tellus. Fusce venenatis, odio nec facilisis molestie, orci lacus lobortis orci, nec commodo tortor tortor et eros. Sed lacinia nisi et eleifend pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi sodales diam quis diam volutpat, et egestas purus scelerisque. Phasellus bibendum diam venenatis tortor pretium iaculis. Aliquam a faucibus mauris. Aenean sed urna velit. Nam malesuada dui eget scelerisque fermentum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a libero vitae elit pretium cursus. Ut maximus felis pretium augue ullamcorper venenatis. Aenean mattis hendrerit dui id aliquet. Nunc rhoncus ipsum ut orci posuere semper vel quis diam. Duis pulvinar molestie nisi, sed sollicitudin metus fermentum sit amet. Phasellus semper, nibh sed laoreet blandit, ligula neque egestas tortor, ac porttitor massa justo ut diam.</p>\r\n<p>Donec id sem sem. Pellentesque augue quam, euismod nec neque non, sollicitudin tincidunt purus. Sed viverra libero eget ante sollicitudin iaculis. Donec erat tellus, aliquet aliquam nisi vel, faucibus interdum est. In aliquet pharetra eros vel lacinia. Nam sit amet ex tristique, pretium quam quis, ullamcorper dolor. Vestibulum gravida eros accumsan gravida iaculis. Suspendisse eu elit metus. Pellentesque iaculis rutrum augue quis blandit. Fusce at lacus vestibulum, placerat justo vitae, lacinia nisl. Phasellus accumsan enim vitae ex condimentum rhoncus.</p>\r\n<p>Duis feugiat semper eros, vitae consectetur mauris volutpat viverra. Aenean at augue dui. Sed varius tincidunt hendrerit. Cras sed condimentum nunc. Vestibulum consequat eget ipsum a ultrices. Proin auctor commodo facilisis. Praesent quis neque tellus. Fusce venenatis, odio nec facilisis molestie, orci lacus lobortis orci, nec commodo tortor tortor et eros. Sed lacinia nisi et eleifend pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi sodales diam quis diam volutpat, et egestas purus scelerisque. Phasellus bibendum diam venenatis tortor pretium iaculis. Aliquam a faucibus mauris. Aenean sed urna velit. Nam malesuada dui eget scelerisque fermentum.</p>','','','','',0,0,'2016-07-04 07:53:13','2017-08-01 14:31:48'),
	(4,2,'en','company1','Company','Company1','','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a liber','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a libero vitae elit pretium cursus. Ut maximus felis pretium augue ullamcorper venenatis. Aenean mattis hendrerit dui id aliquet. Nunc rhoncus ipsum ut orci posuere semper vel quis diam. Duis pulvinar molestie nisi, sed sollicitudin metus fermentum sit amet. Phasellus semper, nibh sed laoreet blandit, ligula neque egestas tortor, ac porttitor massa justo ut diam.</p>\r\n<p>Donec id sem sem. Pellentesque augue quam, euismod nec neque non, sollicitudin tincidunt purus. Sed viverra libero eget ante sollicitudin iaculis. Donec erat tellus, aliquet aliquam nisi vel, faucibus interdum est. In aliquet pharetra eros vel lacinia. Nam sit amet ex tristique, pretium quam quis, ullamcorper dolor. Vestibulum gravida eros accumsan gravida iaculis. Suspendisse eu elit metus. Pellentesque iaculis rutrum augue quis blandit. Fusce at lacus vestibulum, placerat justo vitae, lacinia nisl. Phasellus accumsan enim vitae ex condimentum rhoncus.</p>\r\n<p>Duis feugiat semper eros, vitae consectetur mauris volutpat viverra. Aenean at augue dui. Sed varius tincidunt hendrerit. Cras sed condimentum nunc. Vestibulum consequat eget ipsum a ultrices. Proin auctor commodo facilisis. Praesent quis neque tellus. Fusce venenatis, odio nec facilisis molestie, orci lacus lobortis orci, nec commodo tortor tortor et eros. Sed lacinia nisi et eleifend pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi sodales diam quis diam volutpat, et egestas purus scelerisque. Phasellus bibendum diam venenatis tortor pretium iaculis. Aliquam a faucibus mauris. Aenean sed urna velit. Nam malesuada dui eget scelerisque fermentum.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a libero vitae elit pretium cursus. Ut maximus felis pretium augue ullamcorper venenatis. Aenean mattis hendrerit dui id aliquet. Nunc rhoncus ipsum ut orci posuere semper vel quis diam. Duis pulvinar molestie nisi, sed sollicitudin metus fermentum sit amet. Phasellus semper, nibh sed laoreet blandit, ligula neque egestas tortor, ac porttitor massa justo ut diam.</p>\r\n<p>Donec id sem sem. Pellentesque augue quam, euismod nec neque non, sollicitudin tincidunt purus. Sed viverra libero eget ante sollicitudin iaculis. Donec erat tellus, aliquet aliquam nisi vel, faucibus interdum est. In aliquet pharetra eros vel lacinia. Nam sit amet ex tristique, pretium quam quis, ullamcorper dolor. Vestibulum gravida eros accumsan gravida iaculis. Suspendisse eu elit metus. Pellentesque iaculis rutrum augue quis blandit. Fusce at lacus vestibulum, placerat justo vitae, lacinia nisl. Phasellus accumsan enim vitae ex condimentum rhoncus.</p>\r\n<p>Duis feugiat semper eros, vitae consectetur mauris volutpat viverra. Aenean at augue dui. Sed varius tincidunt hendrerit. Cras sed condimentum nunc. Vestibulum consequat eget ipsum a ultrices. Proin auctor commodo facilisis. Praesent quis neque tellus. Fusce venenatis, odio nec facilisis molestie, orci lacus lobortis orci, nec commodo tortor tortor et eros. Sed lacinia nisi et eleifend pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi sodales diam quis diam volutpat, et egestas purus scelerisque. Phasellus bibendum diam venenatis tortor pretium iaculis. Aliquam a faucibus mauris. Aenean sed urna velit. Nam malesuada dui eget scelerisque fermentum.</p>','','','','',0,0,'2016-07-04 07:53:13','2017-08-02 14:06:41'),
	(5,3,'it','privacy','Privacy','Privacy','',NULL,'','','','','','',0,0,'2016-07-04 07:53:28','2017-08-01 14:33:01'),
	(6,3,'en','privacy','Privacy','Privacy','',NULL,'','','','','','',0,0,'2016-07-04 07:53:28','2017-08-01 14:33:01'),
	(7,5,'it','prodotti','Prodotti','Prodotti','',NULL,'','','','','','',0,0,'2016-07-04 07:53:38','2017-08-02 14:55:34'),
	(8,5,'en','products','Products','Products','',NULL,'','','','','','',0,0,'2016-07-04 07:53:38','2017-08-01 14:32:52'),
	(9,4,'it','contatti','Contatti','Contatti','',NULL,'','','','','','',0,0,'2016-07-04 07:54:32','2017-08-01 14:32:40'),
	(10,4,'en','contacts','Contacts','Contacts','',NULL,'','','','','','',0,0,'2016-07-04 07:54:32','2017-08-01 14:32:40'),
	(13,6,'it','news','News','News','',NULL,'','','','','','',0,0,'2016-08-04 11:24:58','2017-08-01 14:33:11'),
	(14,6,'en','news','News','News','',NULL,'','','','','','',0,0,'2016-08-04 11:24:58','2017-08-01 14:33:11'),
	(15,7,'it','login','login','login','login',NULL,'','','Login','','','',0,0,'2016-08-09 13:12:14','2017-08-01 14:33:20'),
	(16,7,'en','login','Login','Login','Login',NULL,'','','Login','','','',0,0,'2016-08-09 13:12:14','2017-08-01 14:33:20'),
	(17,8,'it','dashboard','Dashboard','Dashboard','Dashboard',NULL,'','','','','','',0,0,'2016-08-09 13:24:04','2017-08-01 14:33:30'),
	(18,8,'en','dashboard','Dashboard','Dashboard','',NULL,'','','','','','',0,0,'2016-08-09 13:24:04','2017-08-01 14:33:30'),
	(19,9,'it','users','','Users','Users',NULL,'','','','','','',0,0,'2016-08-10 07:16:26','2017-08-01 15:56:45'),
	(20,9,'en','users','Users','Users','',NULL,'','','','','','',0,0,'2016-08-10 07:16:26','2017-08-01 15:56:21'),
	(21,10,'it','profile','Profile','Profile','Profile',NULL,'','','','','','',0,0,'2016-08-10 07:17:38','2017-08-01 14:33:37'),
	(22,10,'en','user-profile','User profile','User profile','',NULL,'','','','','','',0,0,'2016-08-10 07:17:38','2017-08-01 14:33:37'),
	(23,11,'it','register','','Registrazione','',NULL,'','','','','','',0,0,'2017-08-01 16:13:57','2017-08-01 16:13:57'),
	(24,11,'en','register','','Register','',NULL,'','','','','','',0,0,'2017-08-01 16:13:57','2017-08-01 16:13:57');

/*!40000 ALTER TABLE `article_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(11) NOT NULL,
  `id_template` int(11) NOT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abstract` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `ignore_slug_translation` int(1) NOT NULL DEFAULT '0',
  `top_menu` tinyint(4) DEFAULT '1',
  `template_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;

INSERT INTO `articles` (`id`, `domain`, `id_parent`, `id_template`, `menu_title`, `title`, `subtitle`, `intro`, `abstract`, `description`, `slug`, `doc`, `image`, `banner`, `link`, `sort`, `pub`, `ignore_slug_translation`, `top_menu`, `template_id`, `created_by`, `created_at`, `updated_at`)
VALUES
	(1,'',0,0,NULL,'',NULL,NULL,NULL,'','home','','','','',0,1,0,0,0,0,'2016-07-04 06:54:35','2017-08-01 15:52:32'),
	(2,'',0,0,NULL,'',NULL,NULL,NULL,'','company','','','','',100,1,0,1,0,0,'2016-07-04 06:56:59','2017-08-02 14:06:41'),
	(3,'',0,0,NULL,'',NULL,NULL,NULL,'','privacy','','','','',2000,1,0,0,0,0,'2016-07-04 07:11:17','2017-08-01 14:33:01'),
	(4,'',0,0,NULL,'',NULL,NULL,NULL,'','contacts','','','','',400,1,0,1,0,0,'2016-07-04 07:11:39','2017-08-01 14:32:40'),
	(5,'',0,0,NULL,'',NULL,NULL,NULL,'','products','','','','',200,1,0,1,0,0,'2016-07-04 07:20:37','2017-08-02 14:55:34'),
	(6,'',0,0,NULL,'',NULL,NULL,NULL,'','news','','','','',300,1,0,1,0,0,'2016-07-04 07:59:05','2017-08-01 14:33:11'),
	(7,'',9,0,NULL,'',NULL,NULL,NULL,'','login','','','','',1000,1,0,0,0,0,'2016-08-09 13:12:14','2017-08-01 15:57:18'),
	(8,'',9,0,NULL,'',NULL,NULL,NULL,'','user-dashboard','','','','',1200,1,0,0,0,0,'2016-08-09 13:24:04','2017-08-01 14:33:30'),
	(9,'',0,0,NULL,'',NULL,NULL,NULL,'','reserved-area','','','','',1100,0,0,0,0,0,'2016-08-10 07:16:26','2017-08-01 15:57:05'),
	(10,'',9,0,NULL,'',NULL,NULL,NULL,'','user-profile','','','','',1300,1,0,0,0,0,'2016-08-10 07:17:38','2017-08-01 14:33:37'),
	(11,'',0,0,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',2000,1,0,0,0,0,'2017-08-01 16:13:57','2017-08-01 16:16:28');

/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `id_parent`, `title`, `abstract`, `description`, `slug`, `image`, `banner`, `doc`, `sort`, `pub`, `seo_title`, `seo_description`, `seo_keywords`, `created_by`, `created_at`, `updated_at`)
VALUES
	(1,0,'',NULL,NULL,'identity','','','',20,1,NULL,NULL,NULL,0,'2016-07-04 06:29:04','2017-08-02 13:14:27'),
	(2,0,'',NULL,NULL,'research','','','',10,1,NULL,NULL,NULL,0,'2016-12-26 12:16:23','2017-08-02 13:14:17'),
	(3,0,'',NULL,NULL,'start-up','','','',30,1,NULL,NULL,NULL,0,'2016-12-27 18:33:25','2017-08-02 13:14:40'),
	(4,0,'',NULL,NULL,NULL,NULL,NULL,'',0,1,NULL,NULL,NULL,0,'2017-08-02 13:16:28','2017-08-02 13:16:28');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_translations`;

CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_translations_category_id_locale_unique` (`category_id`,`locale`),
  KEY `categories_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;

INSERT INTO `category_translations` (`id`, `slug`, `category_id`, `locale`, `title`, `description`, `seo_title`, `seo_description`, `seo_keywords`, `created_by`, `update_by`, `created_at`, `updated_at`)
VALUES
	(1,'identity',1,'it','Identity',NULL,'','','',0,0,'2016-07-04 06:29:04','2017-08-02 13:14:27'),
	(2,'identity',1,'en','Identity',NULL,'','','',0,0,'2016-07-04 06:29:04','2017-08-02 13:14:27'),
	(3,'research',2,'en','Research',NULL,'','','',0,0,'2016-12-26 12:16:23','2017-08-02 13:14:17'),
	(4,'research',2,'it','Research',NULL,'','','',0,0,'2016-12-26 12:16:23','2017-08-02 13:14:17'),
	(5,'start-up',3,'en','Start-up',NULL,'','','',0,0,'2016-12-27 18:33:25','2017-08-02 13:14:40'),
	(6,'start-up',3,'it','Start-up',NULL,'','','',0,0,'2016-12-27 18:33:25','2017-08-02 13:14:40'),
	(7,'nuova-categoria',4,'it','Nuova categoria',NULL,'','','',0,0,'2017-08-02 13:16:28','2017-08-02 13:16:28'),
	(8,'new-category',4,'en','New category',NULL,'','','',0,0,'2017-08-02 13:16:28','2017-08-02 13:16:28');

/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_continent` int(11) DEFAULT NULL,
  `eu` tinyint(1) DEFAULT NULL,
  `vat` decimal(4,1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `name`, `iso_code`, `id_continent`, `eu`, `vat`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`)
VALUES
	(1,'Andorra','AD',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(2,'United Arab Emirates','AE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(3,'Afghanistan','AF',NULL,0,0.0,1,NULL,NULL,'2016-08-08 22:00:00','2017-01-03 14:45:12'),
	(4,'Antigua And Barbuda','AG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(5,'Anguilla','AI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(6,'Albania','AL',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(7,'Armenia','AM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(8,'Angola','AO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(9,'Antarctica','AQ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(10,'Argentina','AR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(11,'American Samoa','AS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(12,'Austria','AT',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(13,'Australia','AU',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(14,'Aruba','AW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(15,'Aland Islands','AX',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2017-01-03 14:45:13'),
	(16,'Azerbaijan','AZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(17,'Bosnia And Herzegovina','BA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(18,'Barbados','BB',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(19,'Bangladesh','BD',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(20,'Belgium','BE',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(21,'Burkina Faso','BF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(22,'Bulgaria','BG',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(23,'Bahrain','BH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(24,'Burundi','BI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(25,'Benin','BJ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(26,'Saint Barthelemy','BL',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(27,'Bermuda','BM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(28,'Brunei','BN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(29,'Bolivia','BO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(30,'Bonaire, Saint Eustatius And Saba ','BQ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(31,'Brazil','BR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(32,'Bahamas','BS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(33,'Bhutan','BT',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(34,'Bouvet Island','BV',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(35,'Botswana','BW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(36,'Belarus','BY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(37,'Belize','BZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(38,'Canada','CA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(39,'Cocos Islands','CC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(40,'Democratic Republic Of The Congo','CD',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(41,'Central African Republic','CF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(42,'Republic Of The Congo','CG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(43,'Switzerland','CH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(44,'Ivory Coast','CI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(45,'Cook Islands','CK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(46,'Chile','CL',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(47,'Cameroon','CM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(48,'China','CN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(49,'Colombia','CO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(50,'Costa Rica','CR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(51,'Cuba','CU',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(52,'Cape Verde','CV',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(53,'Curacao','CW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(54,'Christmas Island','CX',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(55,'Cyprus','CY',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(56,'Czech Republic','CZ',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(57,'Germany','DE',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(58,'Djibouti','DJ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(59,'Denmark','DK',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(60,'Dominica','DM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(61,'Dominican Republic','DO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(62,'Algeria','DZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(63,'Ecuador','EC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(64,'Estonia','EE',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(65,'Egypt','EG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(66,'Western Sahara','EH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(67,'Eritrea','ER',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(68,'Spain','ES',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(69,'Ethiopia','ET',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(70,'Finland','FI',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(71,'Fiji','FJ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(72,'Falkland Islands','FK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(73,'Micronesia','FM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(74,'Faroe Islands','FO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(75,'France','FR',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(76,'Gabon','GA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(77,'United Kingdom','GB',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(78,'Grenada','GD',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(79,'Georgia','GE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(80,'French Guiana','GF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(81,'Guernsey','GG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(82,'Ghana','GH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(83,'Gibraltar','GI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(84,'Greenland','GL',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(85,'Gambia','GM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(86,'Guinea','GN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(87,'Guadeloupe','GP',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(88,'Equatorial Guinea','GQ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(89,'Greece','GR',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(90,'South Georgia And The South Sandwich Islands','GS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(91,'Guatemala','GT',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(92,'Guam','GU',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(93,'Guinea-Bissau','GW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(94,'Guyana','GY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(95,'Hong Kong','HK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(96,'Honduras','HN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(97,'Croatia','HR',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(98,'Haiti','HT',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(99,'Hungary','HU',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(100,'Indonesia','ID',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(101,'Ireland','IE',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(102,'Israel','IL',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(103,'Isle Of Man','IM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(104,'India','IN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(105,'British Indian Ocean Territory','IO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(106,'Iraq','IQ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(107,'Iran','IR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(108,'Iceland','IS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(109,'Italy','IT',0,1,22.0,1,0,1,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(110,'Jersey','JE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(111,'Jamaica','JM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(112,'Jordan','JO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(113,'Japan','JP',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(114,'Kenya','KE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(115,'Kyrgyzstan','KG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(116,'Cambodia','KH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(117,'Kiribati','KI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(118,'Comoros','KM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(119,'Saint Kitts And Nevis','KN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(120,'North Korea','KP',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(121,'South Korea','KR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(122,'Kuwait','KW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(123,'Cayman Islands','KY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(124,'Kazakhstan','KZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(125,'Laos','LA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(126,'Lebanon','LB',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(127,'Saint Lucia','LC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(128,'Liechtenstein','LI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(129,'Sri Lanka','LK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(130,'Liberia','LR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(131,'Lesotho','LS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(132,'Lithuania','LT',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(133,'Luxembourg','LU',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(134,'Latvia','LV',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(135,'Libya','LY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(136,'Morocco','MA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(137,'Monaco','MC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(138,'Moldova','MD',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(139,'Montenegro','ME',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(140,'Saint Martin','MF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(141,'Madagascar','MG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(142,'Marshall Islands','MH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(143,'Macedonia','MK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(144,'Mali','ML',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(145,'Myanmar','MM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(146,'Mongolia','MN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(147,'Macao','MO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(148,'Northern Mariana Islands','MP',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(149,'Martinique','MQ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(150,'Mauritania','MR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(151,'Montserrat','MS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(152,'Malta','MT',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(153,'Mauritius','MU',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(154,'Maldives','MV',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(155,'Malawi','MW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(156,'Mexico','MX',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(157,'Malaysia','MY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(158,'Mozambique','MZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(159,'Namibia','NA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(160,'New Caledonia','NC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(161,'Niger','NE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(162,'Norfolk Island','NF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(163,'Nigeria','NG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(164,'Nicaragua','NI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(165,'Netherlands','NL',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(166,'Norway','NO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(167,'Nepal','NP',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(168,'Nauru','NR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(169,'Niue','NU',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(170,'New Zealand','NZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(171,'Oman','OM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(172,'Panama','PA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(173,'Peru','PE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(174,'French Polynesia','PF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(175,'Papua New Guinea','PG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(176,'Philippines','PH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(177,'Pakistan','PK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(178,'Poland','PL',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(179,'Saint Pierre And Miquelon','PM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(180,'Puerto Rico','PR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(181,'Palestinian Territory','PS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(182,'Portugal','PT',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(183,'Palau','PW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(184,'Paraguay','PY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(185,'Qatar','QA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(186,'Reunion','RE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(187,'Romania','RO',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(188,'Serbia','RS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(189,'Russia','RU',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(190,'Rwanda','RW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(191,'Saudi Arabia','SA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(192,'Solomon Islands','SB',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(193,'Seychelles','SC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(194,'Sudan','SD',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(195,'Sweden','SE',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(196,'Singapore','SG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(197,'Saint Helena','SH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(198,'Slovenia','SI',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(199,'Svalbard And Jan Mayen','SJ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(200,'Slovakia','SK',0,1,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(201,'Sierra Leone','SL',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(202,'San Marino','SM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(203,'Senegal','SN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(204,'Somalia','SO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(205,'Suriname','SR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(206,'South Sudan','SS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(207,'Sao Tome And Principe','ST',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(208,'El Salvador','SV',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(209,'Sint Maarten','SX',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(210,'Syria','SY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(211,'Swaziland','SZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(212,'Turks And Caicos Islands','TC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(213,'Chad','TD',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(214,'French Southern Territories','TF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(215,'Togo','TG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(216,'Thailand','TH',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(217,'Tajikistan','TJ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(218,'Tokelau','TK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(219,'East Timor','TL',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(220,'Turkmenistan','TM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(221,'Tunisia','TN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(222,'Tonga','TO',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(223,'Turkey','TR',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(224,'Trinidad And Tobago','TT',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(225,'Tuvalu','TV',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(226,'Taiwan','TW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(227,'Tanzania','TZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(228,'Ukraine','UA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(229,'Uganda','UG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(230,'United States Minor Outlying Islands','UM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(231,'United States','US',0,0,0.0,1,0,1,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(232,'Uruguay','UY',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(233,'Uzbekistan','UZ',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(234,'Saint Vincent And The Grenadines','VC',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(235,'Venezuela','VE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(236,'British Virgin Islands','VG',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(237,'U.S. Virgin Islands','VI',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(238,'Vietnam','VN',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(239,'Vanuatu','VU',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(240,'Wallis And Futuna','WF',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(241,'Samoa','WS',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(242,'Kosovo','XK',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(243,'Yemen','YE',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(244,'Mayotte','YT',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(245,'South Africa','ZA',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(246,'Zambia','ZM',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00'),
	(247,'Zimbabwe','ZW',0,0,0.0,1,0,0,'2016-08-08 22:00:00','2016-08-08 22:00:00');

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table domain_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `domain_translations`;

CREATE TABLE `domain_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_translations_domain_id_locale_unique` (`domain_id`,`locale`),
  KEY `domains_translations_locale_index` (`locale`),
  CONSTRAINT `domains_translations_domain_id_foreign` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `domain_translations` WRITE;
/*!40000 ALTER TABLE `domain_translations` DISABLE KEYS */;

INSERT INTO `domain_translations` (`id`, `domain_id`, `locale`, `title`, `update_by`, `created_at`, `updated_at`)
VALUES
	(1,1,'it','Top Header Slider',0,'2016-06-23 07:36:42','2016-06-28 07:58:39'),
	(2,1,'en','Top Header Slider',0,'2016-06-23 07:36:42','2016-06-28 07:58:39'),
	(7,2,'it','Bottom Slider Image',0,'2016-06-23 07:38:24','2016-06-28 07:59:19'),
	(8,2,'en','page gallery',0,'2016-06-23 07:38:24','2016-12-27 16:38:49'),
	(121,21,'it','Template con sottopagine',0,'2016-06-28 13:18:04','2016-07-04 07:38:10'),
	(122,21,'en','Sub page template',0,'2016-06-28 13:18:04','2016-12-27 14:17:28');

/*!40000 ALTER TABLE `domain_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table domains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `domains`;

CREATE TABLE `domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;

INSERT INTO `domains` (`id`, `domain`, `title`, `value`, `sort`, `pub`, `created_by`, `created_at`, `updated_at`)
VALUES
	(1,'imagetype','','',10,1,0,'2016-06-23 07:36:42','2016-06-28 07:58:39'),
	(2,'imagetype','','',20,1,0,'2016-06-23 07:38:24','2016-06-28 07:59:19'),
	(21,'template','','template_subpage',30,1,0,'2016-06-28 13:18:04','2016-12-27 14:17:35');

/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table example_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `example_article`;

CREATE TABLE `example_article` (
  `example_id` int(10) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `example_article_example_id_index` (`example_id`),
  KEY `example_article_article_id_index` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `example_article` WRITE;
/*!40000 ALTER TABLE `example_article` DISABLE KEYS */;

INSERT INTO `example_article` (`example_id`, `article_id`, `created_at`, `updated_at`)
VALUES
	(1,8,NULL,NULL),
	(1,7,NULL,NULL),
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `example_article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table example_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `example_translations`;

CREATE TABLE `example_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `example_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `description_2` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_no_index` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `example_translations_example_id_locale_unique` (`example_id`,`locale`),
  KEY `example_translations_locale_unique` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `example_translations` WRITE;
/*!40000 ALTER TABLE `example_translations` DISABLE KEYS */;

INSERT INTO `example_translations` (`id`, `example_id`, `locale`, `slug`, `title`, `description`, `description_2`, `seo_title`, `seo_description`, `seo_keywords`, `seo_no_index`, `created_by`, `update_by`, `created_at`, `updated_at`)
VALUES
	(1,1,'it','lorem-ipsum','Lorem ipsum','Lorem ipsum dolor sit amet consectetur adipisci elit','<p>Lorem ipsum dolor sit amet consectetur adipisci elit&nbsp;</p>','','','','',0,0,'2017-08-23 10:20:05','2017-08-23 10:20:05'),
	(2,1,'en','','','','','','','','',0,0,'2017-08-23 10:20:05','2017-08-23 10:20:05');

/*!40000 ALTER TABLE `example_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table examples
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examples`;

CREATE TABLE `examples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `article_2_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `description_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `pub` tinyint(4) DEFAULT '1',
  `color` varchar(7) COLLATE utf8_unicode_ci DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `examples` WRITE;
/*!40000 ALTER TABLE `examples` DISABLE KEYS */;

INSERT INTO `examples` (`id`, `article_id`, `article_2_id`, `title`, `description`, `description_2`, `slug`, `doc`, `image`, `sort`, `pub`, `color`, `date`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'','',NULL,NULL,'','test.png',10,1,'#80b0f0','2017-08-09','2017-08-23 10:20:05','2017-08-23 12:09:33');

/*!40000 ALTER TABLE `examples` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hpsliders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hpsliders`;

CREATE TABLE `hpsliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hpsliders_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `hpsliders` WRITE;
/*!40000 ALTER TABLE `hpsliders` DISABLE KEYS */;

INSERT INTO `hpsliders` (`id`, `title`, `description`, `icon`, `image`, `link`, `slug`, `sort`, `is_active`, `created_by`, `created_at`, `updated_at`)
VALUES
	(1,'maguttiCms Slider','free open source CMS based on the Laravel PHP Framework',NULL,'header2.jpg','','laracms-slier',200,1,0,'2016-12-27 17:34:38','2017-08-02 13:17:01'),
	(2,'magutti 5.5','A modular multilingual CMS built with Laravel 5.5',NULL,'header1.jpg','','laracms-53',100,1,0,'2016-12-27 18:18:09','2017-08-02 14:04:31');

/*!40000 ALTER TABLE `hpsliders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_category_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_ext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `manipulations` text COLLATE utf8_unicode_ci NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `sort` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;

INSERT INTO `media` (`id`, `media_category_id`, `model_id`, `model_type`, `collection_name`, `title`, `description`, `file_name`, `file_ext`, `disk`, `size`, `manipulations`, `pub`, `sort`, `created_at`, `updated_at`)
VALUES
	(65,1,33,'App\\Article','images','','','84861-bg-header.jpg','jpg','images',200854,'',1,NULL,'2016-06-28 07:45:54','2016-06-28 07:45:54'),
	(66,2,55,'App\\Article','images','','','97814-bg-header.jpg','jpg','images',200854,'',1,10,'2016-06-28 09:49:53','2016-06-28 07:49:53'),
	(67,2,55,'App\\Article','images','','','40330-bg-header.jpg','jpg','images',200854,'',1,20,'2016-06-28 09:49:56','2016-06-28 07:49:56'),
	(68,2,55,'App\\Article','images','','','58490-bg-header.jpg','jpg','images',200854,'',1,30,'2016-06-28 09:49:56','2016-06-28 07:49:56'),
	(69,1,59,'App\\Article','images','','','90919-bg-header.jpg','jpg','images',200854,'',1,NULL,'2016-06-29 11:13:03','2016-06-29 11:13:03'),
	(70,1,59,'App\\Article','images','','','57396-bg-header.jpg','jpg','images',200854,'',1,NULL,'2016-06-29 11:13:06','2016-06-29 11:13:06'),
	(71,1,60,'App\\Article','images','','','70822-bg-header.jpg','jpg','images',200854,'',1,NULL,'2016-06-29 11:51:08','2016-06-29 11:51:08'),
	(72,1,1,'App\\Environment','images','','','50598-image-3.jpg','jpg','images',77269,'',1,NULL,'2016-06-30 10:08:36','2016-06-30 10:08:36'),
	(73,1,1,'App\\Environment','images','','','92355-image-1.jpg','jpg','images',64057,'',1,NULL,'2016-06-30 12:11:59','2016-06-30 10:08:50'),
	(74,1,2,'App\\Environment','images','','','22895-bg-header.jpg','jpg','images',200854,'',1,NULL,'2016-06-30 10:23:59','2016-06-30 10:23:59'),
	(75,1,3,'App\\Environment','images','','','23356-1-allestimento-cremona-disegno.jpg','jpg','images',1339279,'',1,NULL,'2016-07-01 04:49:01','2016-07-01 04:49:01'),
	(76,1,3,'App\\Environment','images','','','13429-3-allestimento-cremona.jpg','jpg','images',1245406,'',1,NULL,'2016-07-01 04:49:01','2016-07-01 04:49:01'),
	(77,1,3,'App\\Environment','images','','','80018-4-allestimento-cremona-ficus-exotica-designer-900-cm-green.jpg','jpg','images',681713,'',1,NULL,'2016-07-01 04:49:02','2016-07-01 04:49:02'),
	(78,1,3,'App\\Environment','images','','','38616-2-allestimento-cremona.jpg','jpg','images',908195,'',1,NULL,'2016-07-01 04:49:02','2016-07-01 04:49:02'),
	(79,1,4,'App\\Environment','images','','','73032-idromassaggio-1.jpg','jpg','images',549951,'',1,NULL,'2016-07-01 05:37:29','2016-07-01 05:37:29'),
	(80,1,4,'App\\Environment','images','','','23833-idromassaggio-3.jpg','jpg','images',605191,'',1,NULL,'2016-07-01 05:37:29','2016-07-01 05:37:29'),
	(81,1,4,'App\\Environment','images','','','71278-idromassaggio-2.jpg','jpg','images',787230,'',1,NULL,'2016-07-01 05:37:30','2016-07-01 05:37:30'),
	(82,1,4,'App\\Article','images','','','86991-on-sale-icon.jpg','jpg','images',12886,'',1,NULL,'2016-08-04 10:46:39','2016-08-04 10:46:39'),
	(90,1,6,'App\\Article','images','','','50175-ric.png','png','images',179478,'',1,NULL,'2016-08-04 12:39:20','2016-08-04 12:39:20'),
	(91,1,6,'App\\Article','images','','','90125-ric.png','png','images',179478,'',1,NULL,'2016-08-04 12:43:28','2016-08-04 12:43:28'),
	(92,1,6,'App\\Article','images','','','93572-ric.png','png','images',179478,'',1,NULL,'2016-08-04 12:47:29','2016-08-04 12:47:29'),
	(93,1,6,'App\\Article','images','','','ric.png','png','images',179478,'',1,NULL,'2016-08-04 12:48:47','2016-08-04 12:48:47'),
	(94,1,6,'App\\Article','images','','','30256-ric.png','png','images',179478,'',1,NULL,'2016-08-04 12:49:07','2016-08-04 12:49:07'),
	(95,1,11,'App\\Article','images','','','30088-14230-casa-in-tronchi-tecnica-blockbau-val-bedretto-005.JPG','JPG','images',363183,'',1,NULL,'2016-12-26 12:20:33','2016-12-26 12:20:33'),
	(96,1,1,'App\\Article','images','','','anisa6.jpg','jpg','images',67882,'',1,NULL,'2016-12-26 12:21:43','2016-12-26 12:21:43'),
	(97,1,1,'App\\Article','images','','','anisa3.jpg','jpg','images',130930,'',1,NULL,'2016-12-26 12:25:51','2016-12-26 12:25:51'),
	(98,1,3,'App\\News','images','','','anisa3.jpg','jpg','images',130930,'',1,NULL,'2017-01-03 15:35:11','2017-01-03 15:35:11'),
	(99,1,3,'App\\News','images','','','anisa7.jpg','jpg','images',150003,'',1,NULL,'2017-01-03 15:35:24','2017-01-03 15:35:24');

/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_translations`;

CREATE TABLE `media_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_translations_media_id_locale_unique` (`media_id`,`locale`),
  KEY `media_translations_locale_index` (`locale`),
  CONSTRAINT `media_translations_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `media_translations` WRITE;
/*!40000 ALTER TABLE `media_translations` DISABLE KEYS */;

INSERT INTO `media_translations` (`id`, `media_id`, `locale`, `title`, `description`, `created_at`, `updated_at`)
VALUES
	(116,65,'it','84861-bg-header.jpg','','2016-06-28 07:45:54','2016-06-28 07:45:54'),
	(117,66,'it','97814-bg-header.jpg','','2016-06-28 07:48:40','2016-06-28 07:48:40'),
	(118,67,'it','40330-bg-header.jpg','','2016-06-28 07:48:56','2016-06-28 07:48:56'),
	(119,68,'it','58490-bg-header.jpg','','2016-06-28 07:49:01','2016-06-28 07:49:01'),
	(120,66,'en','','','2016-06-28 07:49:18','2016-06-28 07:49:18'),
	(121,67,'en','','','2016-06-28 07:49:32','2016-06-28 07:49:32'),
	(122,68,'en','','','2016-06-28 07:49:41','2016-06-28 07:49:41'),
	(123,69,'it','90919-bg-header.jpg','','2016-06-29 11:13:03','2016-06-29 11:13:03'),
	(124,70,'it','57396-bg-header.jpg','','2016-06-29 11:13:06','2016-06-29 11:13:06'),
	(125,71,'it','70822-bg-header.jpg','','2016-06-29 11:51:08','2016-06-29 11:51:08'),
	(126,72,'it','50598-image-3.jpg','','2016-06-30 10:08:36','2016-06-30 10:08:36'),
	(127,73,'it','92355-image-1.jpg','','2016-06-30 10:08:40','2016-06-30 10:08:40'),
	(128,73,'en','','','2016-06-30 10:08:50','2016-06-30 10:08:50'),
	(129,74,'it','22895-bg-header.jpg','','2016-06-30 10:23:59','2016-06-30 10:23:59'),
	(130,75,'it','23356-1-allestimento-cremona-disegno.jpg','','2016-07-01 04:49:01','2016-07-01 04:49:01'),
	(131,76,'it','13429-3-allestimento-cremona.jpg','','2016-07-01 04:49:01','2016-07-01 04:49:01'),
	(132,77,'it','80018-4-allestimento-cremona-ficus-exotica-designer-900-cm-green.jpg','','2016-07-01 04:49:02','2016-07-01 04:49:02'),
	(133,78,'it','38616-2-allestimento-cremona.jpg','','2016-07-01 04:49:02','2016-07-01 04:49:02'),
	(134,79,'it','73032-idromassaggio-1.jpg','','2016-07-01 05:37:29','2016-07-01 05:37:29'),
	(135,80,'it','23833-idromassaggio-3.jpg','','2016-07-01 05:37:29','2016-07-01 05:37:29'),
	(136,81,'it','71278-idromassaggio-2.jpg','','2016-07-01 05:37:30','2016-07-01 05:37:30'),
	(137,82,'it','86991-on-sale-icon.jpg','','2016-08-04 10:46:39','2016-08-04 10:46:39'),
	(145,90,'it','50175-ric.png','','2016-08-04 12:39:20','2016-08-04 12:39:20'),
	(146,91,'it','90125-ric.png','','2016-08-04 12:43:28','2016-08-04 12:43:28'),
	(147,92,'it','93572-ric.png','','2016-08-04 12:47:29','2016-08-04 12:47:29'),
	(148,93,'it','ric.png','','2016-08-04 12:48:47','2016-08-04 12:48:47'),
	(149,94,'it','30256-ric.png','','2016-08-04 12:49:07','2016-08-04 12:49:07'),
	(150,95,'en','30088-14230-casa-in-tronchi-tecnica-blockbau-val-bedretto-005.JPG','','2016-12-26 12:20:33','2016-12-26 12:20:33'),
	(151,96,'en','anisa6.jpg','','2016-12-26 12:21:43','2016-12-26 12:21:43'),
	(152,97,'en','anisa3.jpg','','2016-12-26 12:25:51','2016-12-26 12:25:51'),
	(153,98,'en','anisa3.jpg','','2017-01-03 15:35:11','2017-01-03 15:35:11'),
	(154,99,'en','anisa7.jpg','','2017-01-03 15:35:24','2017-01-03 15:35:24');

/*!40000 ALTER TABLE `media_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;




# Dump of table news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `domain`, `date`, `title`, `description`, `slug`, `doc`, `image`, `link`, `sort`, `pub`, `created_by`, `created_at`, `updated_at`)
VALUES
	(1,'','2017-07-11','','','pinoscotto11','96281-dedprifxoaaxql6.jpg','DEDpRifXoAAXql6.jpg',NULL,0,1,0,'2017-07-11 07:18:08','2017-08-02 09:21:57');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news_tag`;

CREATE TABLE `news_tag` (
  `news_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `news_tag_news_id_index` (`news_id`),
  KEY `news_tag_tag_id_index` (`tag_id`),
  CONSTRAINT `news_tag_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  CONSTRAINT `news_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table news_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news_translations`;

CREATE TABLE `news_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_translations_news_id_locale_unique` (`news_id`,`locale`),
  KEY `news_translations_locale_index` (`locale`),
  CONSTRAINT `news_translations_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `news_translations` WRITE;
/*!40000 ALTER TABLE `news_translations` DISABLE KEYS */;

INSERT INTO `news_translations` (`id`, `slug`, `news_id`, `locale`, `title`, `description`, `abstract`, `subtitle`, `intro`, `seo_title`, `seo_description`, `seo_keywords`, `created_by`, `update_by`, `created_at`, `updated_at`)
VALUES
	(1,'titolo-della-news-1',1,'it','Titolo della news 1','<p>wqeqweqweqw</p>',NULL,NULL,NULL,'','','',0,0,'2017-07-11 07:18:08','2017-08-02 09:21:57'),
	(2,'news-one-title',1,'en','News  one  title','',NULL,NULL,NULL,'','','',0,0,'2017-07-11 07:18:08','2017-08-02 09:21:57');

/*!40000 ALTER TABLE `news_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table newsletters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletters`;

CREATE TABLE `newsletters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table product_model_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_model_translations`;

CREATE TABLE `product_model_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_model_id` int(10) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table product_models
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_models`;

CREATE TABLE `product_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table product_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_translations`;

CREATE TABLE `product_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_translations_product_id_locale_unique` (`product_id`,`locale`),
  KEY `products_translations_locale_index` (`locale`),
  CONSTRAINT `products_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `product_translations` WRITE;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;

INSERT INTO `product_translations` (`id`, `slug`, `product_id`, `locale`, `title`, `subtitle`, `description`, `doc`, `seo_title`, `seo_description`, `seo_keywords`, `created_by`, `update_by`, `created_at`, `updated_at`)
VALUES
	(1,'prodotto-numero-1',1,'it','prodotto numero 1','','',NULL,'','','',0,0,'2017-08-02 10:09:39','2017-08-02 10:09:39'),
	(2,'product-number-1',1,'en','Product number 1','','',NULL,'','','',0,0,'2017-08-02 10:09:39','2017-08-02 10:09:39');

/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `category_id`, `title`, `subtitle`, `description`, `slug`, `image`, `doc`, `video`, `sort`, `pub`, `seo_title`, `seo_description`, `seo_keywords`, `created_by`, `created_at`, `updated_at`)
VALUES
	(1,1,'','','',NULL,'san-pellegrino.jpg',NULL,'',0,1,NULL,NULL,NULL,0,'2017-08-02 10:09:39','2017-08-02 10:11:08');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table provinces
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provinces`;

CREATE TABLE `provinces` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `country_id` int(8) NOT NULL,
  `state_id` int(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_region` (`state_id`),
  KEY `id_country` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;

INSERT INTO `provinces` (`id`, `country_id`, `state_id`, `title`, `code`, `created_at`, `updated_at`)
VALUES
	(1,109,19,'Agrigento','AG','0000-00-00 00:00:00','2016-09-30 15:19:55'),
	(2,109,2,'Alessandria','AL','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,109,11,'Ancona','AN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(4,109,1,'Aosta','AO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(5,109,5,'Arezzo','AR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(6,109,11,'Ascoli Piceno','AP','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(7,109,2,'Asti','AT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(8,109,15,'Avellino','AV','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(9,109,16,'Bari','BA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(10,109,6,'Belluno','BL','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(11,109,15,'Benevento','BN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(12,109,7,'Bergamo','BG','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(13,109,2,'Biella','BI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(14,109,8,'Bologna','BO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(15,109,12,'Bolzano','BZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(16,109,7,'Brescia','BS','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(17,109,16,'Brindisi','BR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(18,109,20,'Cagliari','CA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(19,109,19,'Caltanissetta','CL','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(20,109,14,'Campobasso','CB','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(21,109,20,'Carbonia-Iglesias','CI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(22,109,15,'Caserta','CE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(23,109,19,'Catania','CT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(24,109,18,'Catanzaro','CZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(25,109,13,'Chieti','CH','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(26,109,7,'Como','CO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(27,109,18,'Cosenza','CS','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(28,109,7,'Cremona','CR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(29,109,18,'Crotone','KR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(30,109,2,'Cuneo','CN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(31,109,19,'Enna','EN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(32,109,8,'Ferrara','FE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(33,109,5,'Firenze','FI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(34,109,16,'Foggia','FG','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(35,109,8,'Forlì-Cesena','FC','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(36,109,9,'Frosinone','FR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(37,109,3,'Genova','GE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(38,109,4,'Gorizia','GO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(39,109,5,'Grosseto','GR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(40,109,3,'Imperia','IM','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(41,109,14,'Isernia','IS','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(42,109,3,'La Spezia','SP','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(43,109,13,'L\'Aquila','AQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(44,109,9,'Latina','LT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(45,109,16,'Lecce','LE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(46,109,7,'Lecco','LC','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(47,109,5,'Livorno','LI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(48,109,7,'Lodi','LO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(49,109,5,'Lucca','LU','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(50,109,11,'Macerata','MC','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(51,109,7,'Mantova','MN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(52,109,5,'Massa-Carrara','MS','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(53,109,17,'Matera','MT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(54,109,19,'Messina','ME','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(55,109,7,'Milano','MI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(56,109,8,'Modena','MO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(57,109,15,'Napoli','NA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(58,109,2,'Novara','NO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(59,109,20,'Nuoro','NU','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(60,109,20,'Olbia-Tempio','OT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(61,109,20,'Oristano','OR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(62,109,6,'Padova','PD','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(63,109,19,'Palermo','PA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(64,109,8,'Parma','PR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(65,109,7,'Pavia','PV','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(66,109,10,'Perugia','PG','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(67,109,11,'Pesaro','PU','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(68,109,13,'Pescara','PE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(69,109,8,'Piacenza','PC','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(70,109,5,'Pisa','PI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(71,109,5,'Pistoia','PT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(72,109,4,'Pordenone','PN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(73,109,17,'Potenza','PZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(74,109,5,'Prato','PO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(75,109,19,'Ragusa','RG','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(76,109,8,'Ravenna','RA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(77,109,18,'Reggio Calabria','RC','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(78,109,8,'Reggio Emilia','RE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(79,109,9,'Rieti','RI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(80,109,8,'Rimini','RN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(81,109,9,'Roma','RM','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(82,109,6,'Rovigo','RO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(83,109,15,'Salerno','SA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(84,109,20,'Medio Campidano','VS','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(85,109,20,'Sassari','SS','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(86,109,3,'Savona','SV','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(87,109,5,'Siena','SI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(88,109,19,'Siracusa','SR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(89,109,7,'Sondrio','SO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(90,109,16,'Taranto','TA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(91,109,13,'Teramo','TE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(92,109,10,'Terni','TR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(93,109,2,'Torino','TO','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(94,109,20,'Ogliastra','OG','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(95,109,19,'Trapani','TP','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(96,109,12,'Trento','TN','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(97,109,6,'Treviso','TV','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(98,109,4,'Trieste','TS','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(99,109,4,'Udine','UD','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(100,109,7,'Varese','VA','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(101,109,6,'Venezia','VE','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(102,109,2,'Verbano-Cusio-Ossola','VB','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(103,109,2,'Vercelli','VC','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(104,109,6,'Verona','VR','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(105,109,18,'Vibo Valentia','VV','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(106,109,6,'Vicenza','VI','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(107,109,9,'Viterbo','VT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(108,109,16,'Barletta Andria Trani','BT','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(109,109,11,'Fermo','FM','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(110,109,7,'Monza e Brianza ','MB','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;

INSERT INTO `role_user` (`user_id`, `role_id`)
VALUES
	(1,1),
	(1,3);

/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'su','super user','can do all','2015-12-20 18:23:32','2015-12-20 18:23:32'),
	(2,'admin','admin','admi  user','2015-12-20 18:26:36','2015-12-20 18:26:36'),
	(3,'user','user','user role','2015-12-20 18:50:58','2015-12-20 18:50:58'),
	(7,'Guest','guest','guest user','2015-12-28 13:37:23','2015-12-28 13:37:23');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`),
  KEY `settings_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `key`, `value`, `description`, `domain`, `created_at`, `updated_at`)
VALUES
	(1,'GA_CODE','UA-','Codice  google  analitycs','GA','2016-08-09 12:01:24','2016-08-09 12:28:06'),
	(2,'credits_url','http://www.gfstudio.com','url credits','webiste','2016-08-09 12:29:05','2016-12-29 14:35:06'),
	(3,'GA_MAP_API_KEY','','Google maps apy key','GA','2016-12-27 17:28:54','2016-12-29 09:24:44');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table socials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `socials`;

CREATE TABLE `socials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `socials` WRITE;
/*!40000 ALTER TABLE `socials` DISABLE KEYS */;

INSERT INTO `socials` (`id`, `title`, `description`, `icon`, `image`, `link`, `sort`, `is_active`, `created_by`, `created_at`, `updated_at`)
VALUES
	(1,'facebook',NULL,'fa-facebook','','http://www.facebook.com',10,1,0,'2016-08-09 12:50:01','2016-08-09 10:50:01'),
	(2,'Twitter','','fa-twitter','','http://www.twitter.com',20,1,0,'2016-06-28 12:58:53','2016-06-28 10:58:53'),
	(3,'Linkedin','','fa-linkedin','','http://www.linkedin.com',30,1,0,'2016-06-28 12:58:59','2016-06-28 10:58:59');

/*!40000 ALTER TABLE `socials` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `country_id` int(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `zone` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_country` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;

INSERT INTO `states` (`id`, `country_id`, `title`, `zone`, `created_at`, `updated_at`)
VALUES
	(1,109,'Valle d\'Aosta','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,109,'Piemonte','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,109,'Liguria','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(4,109,'Friuli Venezia Giulia','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(5,109,'Toscana','center','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(6,109,'Veneto','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(7,109,'Lombardia','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(8,109,'Emilia Romagna','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(9,109,'Lazio','center','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(10,109,'Umbria','center','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(11,109,'Marche','center','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(12,109,'Trentino Alto Adige','north','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(13,109,'Abruzzo','south','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(14,109,'Molise','south','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(15,109,'Campania','south','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(16,109,'Puglia','south','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(17,109,'Basilicata','south','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(18,109,'Calabria','south','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(19,109,'Sicilia','south','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(20,109,'Sardegna','center','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tag_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag_translations`;

CREATE TABLE `tag_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  KEY `tag_translations_locale_index` (`locale`),
  CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tag_translations` WRITE;
/*!40000 ALTER TABLE `tag_translations` DISABLE KEYS */;

INSERT INTO `tag_translations` (`id`, `tag_id`, `locale`, `title`, `created_at`, `updated_at`)
VALUES
	(1,1,'en','Tag','2016-12-27 18:07:07','2016-12-27 17:07:07'),
	(2,1,'it','tag','2016-12-27 14:46:45','2016-12-27 13:46:45'),
	(3,2,'en','PHP','2016-12-27 17:07:15','2016-12-27 17:07:15'),
	(4,2,'it','Php','2016-12-27 17:07:15','2017-08-02 14:02:09'),
	(7,4,'it','Artisan','2017-08-02 14:01:53','2017-08-02 14:01:53'),
	(8,4,'en','Artisan','2017-08-02 14:01:53','2017-08-02 14:01:53');

/*!40000 ALTER TABLE `tag_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `title`, `slug`, `created_by`, `update_by`, `created_at`, `updated_at`)
VALUES
	(1,'','tag',0,0,'2016-12-27 18:07:28','2016-12-27 17:07:28'),
	(2,'','php',0,0,'2016-12-27 17:07:15','2016-12-27 17:07:15'),
	(4,'','artisan',0,0,'2017-08-02 14:01:53','2017-08-02 14:01:53');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `real_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `real_password`, `remember_token`, `created_at`, `updated_at`, `is_active`)
VALUES
	(1,'pinoa','pino@scotto.it','$2y$10$oh4huMx8DhS.uwbME44vpe2DHWjAAMW48Hg1G/CflbWla2hmWCP8m','pinoscotto',NULL,'2017-07-07 13:37:30','2017-07-07 14:43:25',1),
	(2,'marco','marco.a@gfstudio.com','$2y$10$KHh8bUQYlsdRBZmjJqpJb.R1Rr7xjeR.ed90Bph0POnPOn5BUs63S','pinetto','0L6Vg9BG7xBbyYTrY7Ir7jithwhbC4vI3wahSC72WnKQjPajXNBY3HcKgCIc','2017-08-01 15:50:49','2017-08-02 09:17:18',1),
	(3,'marco','laracms@gfstudio.com','$2y$10$02t5oduS./DNeANAwWYK1uO8VzSBC8U1fYAfK5AXFFJpGh0oTmAeu','ginaschena','6yEq8HTBvJlNLC0aT918JERp8OUpAbBxovBWZc69PSAjly9IUYbagyPcy8ou','2017-08-02 08:40:00','2017-08-02 08:41:36',1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
