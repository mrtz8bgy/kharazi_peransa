/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: peransa-db
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `activated` int(11) NOT NULL DEFAULT 1,
  `image` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `set_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES
(1,8,'سیدخندان پلاک 40','Iran (Islamic Republic of)','تهران','1476822666','09126769825',1,'2020-07-11 06:46:53','2020-07-24 03:09:45'),
(3,3,'ولیعصر پاساژ رضا پلاک 1234','Iran (Islamic Republic of)','تهران','1476822666','9121112233',1,'2020-07-12 04:17:28','2020-07-12 04:17:36'),
(4,8,'ورامین میدان رازی','Iran (Islamic Republic of)','ورامین','3371745768','02136725581',0,'2025-12-22 08:46:32','2025-12-22 08:46:32'),
(5,12,'ورامین میدان رازی','Iran (Islamic Republic of)','ورامین','3371745768','+989306060331',0,'2026-01-01 06:15:41','2026-01-01 06:15:41'),
(6,29,'ورامین میدان رازی','Iran (Islamic Republic of)','ورامین','3371745768','+989306060331',0,'2026-01-01 19:57:24','2026-01-01 19:57:24');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `google_plus` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
INSERT INTO `app_settings` VALUES
(1,'Active eCommerce','uploads/logo/matggar.png',1,'symbol','https://facebook.com','https://twitter.com','https://instagram.com','https://youtube.com','https://google.com','2019-08-04 16:39:15','2019-08-04 16:39:18');
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `article_categories`
--

DROP TABLE IF EXISTS `article_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_categories_slug_unique` (`slug`),
  KEY `article_categories_parent_id_index` (`parent_id`),
  KEY `article_categories_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `article_categories` WRITE;
/*!40000 ALTER TABLE `article_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `article_images`
--

DROP TABLE IF EXISTS `article_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `path` varchar(191) NOT NULL,
  `original_name` varchar(191) DEFAULT NULL,
  `alt` varchar(191) DEFAULT NULL,
  `caption` varchar(500) DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_images_article_id_index` (`article_id`),
  CONSTRAINT `article_images_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_images`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `article_images` WRITE;
/*!40000 ALTER TABLE `article_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_images` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `excerpt` varchar(500) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `featured_image` varchar(191) DEFAULT NULL,
  `featured_image_alt` varchar(191) DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `author_name` varchar(191) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `canonical_url` varchar(500) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'draft',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `views_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `submitted_by` int(10) unsigned DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `published_by` int(10) unsigned DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_slug_unique` (`slug`),
  KEY `articles_category_id_index` (`category_id`),
  KEY `articles_status_index` (`status`),
  KEY `articles_published_at_index` (`published_at`),
  KEY `articles_user_id_index` (`user_id`),
  KEY `articles_is_featured_index` (`is_featured`),
  CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `article_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES
(1,'کد شناسایی محصول','2020-02-24 05:55:07','2025-12-31 10:56:13'),
(2,'مدل','2020-02-24 05:55:13','2025-12-28 15:23:38'),
(3,'عیار','2025-12-28 15:21:29','2025-12-28 15:21:29'),
(4,'رنگ','2025-12-28 15:21:52','2025-12-28 15:21:52'),
(5,'جنس','2025-12-28 15:22:12','2025-12-28 15:22:12'),
(6,'نوع','2025-12-28 15:22:44','2025-12-28 15:22:44'),
(7,'جنسیت','2025-12-28 15:23:09','2025-12-28 15:23:09'),
(8,'وزن','2025-12-28 15:23:22','2025-12-28 15:23:22'),
(9,'سال ساخت','2025-12-28 15:23:50','2025-12-28 15:23:50'),
(10,'سایز','2025-12-31 10:55:28','2025-12-31 10:55:48');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `event` varchar(100) NOT NULL,
  `auditable_type` varchar(191) DEFAULT NULL,
  `auditable_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `severity` varchar(20) NOT NULL DEFAULT 'info',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_logs_auditable_index` (`auditable_type`,`auditable_id`),
  KEY `audit_logs_user_id_index` (`user_id`),
  KEY `audit_logs_event_index` (`event`),
  KEY `audit_logs_created_at_index` (`created_at`),
  KEY `audit_logs_severity_index` (`severity`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES
(4,'uploads/banners/gz5xZsK2IcwXKzx8BIpybd0zflho4C1QeMsEiMWr.jpeg','#',1,1,'2019-03-12 05:58:23','2020-07-21 23:23:33'),
(5,'uploads/banners/dBfaGAeRI34g1Rpb8piCwJSpdeZ9dhrkYEVIkoFe.jpeg','#',1,1,'2019-03-12 05:58:41','2020-07-21 23:23:52'),
(6,'uploads/banners/u4jYHOJH3h2NgYB4ai4fjKBjINRyccoTvN41FVVi.jpg','#',2,1,'2019-03-12 05:58:52','2026-01-01 07:42:16'),
(7,'uploads/banners/I9hTaD9y6gXGDzrKX3atAYDlUhV0rPPHONe1OVeY.jpg','#',2,1,'2019-05-26 05:16:38','2026-01-01 07:43:45'),
(9,'uploads/banners/yLyzoGfMgZHtf8XfQ706SDV7cm420qdv4wRU3DVy.jpeg','#',1,1,'2019-06-11 05:00:15','2020-07-21 23:24:09'),
(10,'uploads/banners/0WFjYCatbBevDobv52ePJyj5ZkHmnjurMBbrJCIh.jpeg','#',1,1,'2019-06-11 05:00:24','2020-07-21 23:24:23');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `top` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES
(5,'طلای ایران','uploads/brands/aAP9dcYBg53UtesQgACZqKYEPbRw9g6Trrq3vJVD.webp',1,'tala-iran','طلای ایران',NULL,'2020-07-04 09:50:03','2025-12-31 10:30:47'),
(6,'کیمیا گلد','uploads/brands/zDZtQiAKOH3ApOK3DvZHUAXeixHqEIML19U4Ukru.webp',1,'kimia-gold','کیمیا گلد',NULL,'2020-07-05 07:34:22','2025-12-31 10:30:33'),
(7,'سکه طلا','uploads/brands/NZJLl1tV3PDmlPF94VZQgWTr8KhNtZLXxWOcpf55.webp',1,'seke-tala','سکه طلا',NULL,'2020-07-05 07:34:35','2025-12-31 10:30:18'),
(8,'طلا و جواهرات زرین','uploads/brands/XgXxQnLxl0TOM3JUsT3iA7hV1dTLt7nzYeykbNDn.webp',1,'zarine','طلا و جواهرات زرین',NULL,'2020-07-08 01:32:31','2025-12-31 10:29:57'),
(9,'الماس گستر','uploads/brands/tPgqbixPY4qulaRqelfoTqPBBQ9McAzMHHPLSFq9.webp',0,'almas-gostar','الماس گستر',NULL,'2020-07-18 01:33:58','2025-12-31 10:29:35'),
(10,'زرین گلد','uploads/brands/JgiuSN3fCYzyQcqX30a6ZiZRvbUXgJCJJUEIIIVX.webp',1,'zaringold','زرین گلد',NULL,'2020-07-18 01:34:35','2025-12-31 10:28:55'),
(11,'طلای ملی','uploads/brands/YhtBVqP88kePXc7ITm0rQCeH3rsSk5pkfX58HQZo.webp',0,'tala-melli','طلای ملی',NULL,'2020-07-18 01:35:19','2025-12-31 10:28:42'),
(12,'طلا رویال','uploads/brands/NaMDokoaELho0CICIGP5tN56KXALCXp537IZLeDd.webp',0,'tala-royal','طلا رویال',NULL,'2020-07-18 01:35:54','2025-12-31 10:28:26'),
(13,'نگین طلایی','uploads/brands/xDPFK5kgmdASd1T27ZhoDsXweyImvaD8mGnkHWrI.webp',1,'negin-talayi','نگین طلایی',NULL,'2020-07-18 01:36:05','2025-12-31 10:28:16'),
(14,'طلای پارسیان','uploads/brands/eQ2uJAQ3ZUJnLuTNigJcq4VENgUdJCAvjEjLJNvY.webp',0,'tala-parsian','طلای پارسیان',NULL,'2020-07-18 01:36:18','2025-12-31 10:28:04'),
(15,'جواهرات کیمیا','uploads/brands/mlOTBjMaTSqYrOYJqBUbe0PUWQ9PU0IDjhpkPXxJ.webp',1,'jewelry-kimia','جواهرات کیمیا',NULL,'2020-07-18 07:26:48','2025-12-31 10:27:52'),
(16,'طلای زهره','uploads/brands/MtofmUEKXAtK9y5YFm4OdoyevLpVhe6LoUBIER6s.webp',0,'tala-zohre','طلای زهره',NULL,'2020-07-18 07:38:47','2025-12-31 10:27:35'),
(17,'الماس پارس','uploads/brands/kfTVKJ6yl7QbUzu0DGpW9LKgQD8gXnvkWcmBsgXB.webp',1,'almas-pars','الماس پارس',NULL,'2020-07-18 08:22:21','2025-12-31 10:27:27'),
(18,'زر طلایی','uploads/brands/GGx0InN5NBtOn0CyJyoX8pkH9y0HT878snv0VydX.webp',1,'zar-talayi','زر طلایی',NULL,'2020-07-18 08:22:35','2025-12-31 10:27:08'),
(19,'طلای نیکان','uploads/brands/u6AeF0SqamLaQTG1Uu3aUPXa1UobVN9sKO0LmJxF.webp',1,'tala-nikan','طلای نیکان',NULL,'2020-07-18 08:22:50','2025-12-31 10:26:59');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES
(1,'home_default_currency','1','2018-10-16 01:35:52','2019-01-28 01:26:53'),
(2,'system_default_currency','1','2018-10-16 01:36:58','2020-01-26 04:22:13'),
(3,'currency_format','1','2018-10-17 03:01:59','2018-10-17 03:01:59'),
(4,'symbol_format','2','2018-10-17 03:01:59','2020-07-06 04:19:34'),
(5,'no_of_decimals','0','2018-10-17 03:01:59','2020-06-30 00:03:23'),
(6,'product_activation','1','2018-10-28 01:38:37','2019-02-04 01:11:41'),
(7,'vendor_system_activation','1','2018-10-28 07:44:16','2019-02-04 01:11:38'),
(8,'show_vendors','1','2018-10-28 07:44:47','2019-02-04 01:11:13'),
(9,'paypal_payment','0','2018-10-28 07:45:16','2019-01-31 05:09:10'),
(10,'stripe_payment','0','2018-10-28 07:45:47','2018-11-14 01:51:51'),
(11,'cash_payment','1','2018-10-28 07:46:05','2019-01-24 03:40:18'),
(12,'payumoney_payment','0','2018-10-28 07:46:27','2019-03-05 05:41:36'),
(13,'best_selling','1','2018-12-24 08:13:44','2019-02-14 05:29:13'),
(14,'paypal_sandbox','0','2019-01-16 12:44:18','2019-01-16 12:44:18'),
(15,'sslcommerz_sandbox','1','2019-01-16 12:44:18','2019-03-14 00:07:26'),
(16,'sslcommerz_payment','0','2019-01-24 09:39:07','2019-01-29 06:13:46'),
(17,'vendor_commission','80','2019-01-31 06:18:04','2020-07-13 03:26:13'),
(18,'verification_form','[{\"type\":\"text\",\"label\":\"\\u0646\\u0627\\u0645 \\u0648 \\u0646\\u0627\\u0645 \\u062e\\u0627\\u0646\\u0648\\u0627\\u062f\\u06af\\u06cc\"},{\"type\":\"text\",\"label\":\"\\u0646\\u0627\\u0645 \\u067e\\u062f\\u0631\"},{\"type\":\"text\",\"label\":\"\\u0634\\u0645\\u0627\\u0631\\u0647 \\u0634\\u0646\\u0627\\u0633\\u0646\\u0627\\u0645\\u0647\"},{\"type\":\"text\",\"label\":\"\\u06a9\\u062f\\u0645\\u0644\\u06cc\"},{\"type\":\"text\",\"label\":\"\\u0634\\u0645\\u0627\\u0631\\u0647 \\u067e\\u0631\\u0648\\u0627\\u0646\\u0647 \\u06a9\\u0633\\u0628\"},{\"type\":\"text\",\"label\":\"\\u0634\\u0645\\u0627\\u0631\\u0647 \\u062a\\u0644\\u0641\\u0646 \\u0647\\u0645\\u0631\\u0627\\u0647\"},{\"type\":\"text\",\"label\":\"\\u0634\\u0645\\u0627\\u0631\\u0647 \\u062a\\u0644\\u0641\\u0646 \\u062b\\u0627\\u0628\\u062a\"},{\"type\":\"text\",\"label\":\"\\u0622\\u062f\\u0631\\u0633\"},{\"type\":\"file\",\"label\":\"\\u0645\\u062f\\u0627\\u0631\\u06a9 \\u0634\\u0646\\u0627\\u0633\\u0627\\u06cc\\u06cc\"},{\"type\":\"file\",\"label\":\"\\u0645\\u062f\\u0627\\u0631\\u06a9 \\u06a9\\u0633\\u0628 \\u0648 \\u06a9\\u0627\\u0631\"}]','2019-02-03 11:36:58','2025-12-31 10:36:10'),
(19,'google_analytics','0','2019-02-06 12:22:35','2019-02-06 12:22:35'),
(20,'facebook_login','0','2019-02-07 12:51:59','2019-02-08 19:41:15'),
(21,'google_login','0','2019-02-07 12:52:10','2019-02-08 19:41:14'),
(22,'twitter_login','0','2019-02-07 12:52:20','2019-02-08 02:32:56'),
(23,'payumoney_payment','1','2019-03-05 11:38:17','2019-03-05 11:38:17'),
(24,'payumoney_sandbox','1','2019-03-05 11:38:17','2019-03-05 05:39:18'),
(36,'facebook_chat','0','2019-04-15 11:45:04','2019-04-15 11:45:04'),
(37,'email_verification','0','2019-04-30 07:30:07','2019-04-30 07:30:07'),
(38,'wallet_system','0','2019-05-19 08:05:44','2020-08-05 00:21:08'),
(39,'coupon_system','0','2019-06-11 09:46:18','2019-06-11 09:46:18'),
(40,'current_version','2.9','2019-06-11 09:46:18','2019-06-11 09:46:18'),
(41,'instamojo_payment','0','2019-07-06 09:58:03','2019-07-06 09:58:03'),
(42,'instamojo_sandbox','1','2019-07-06 09:58:43','2019-07-06 09:58:43'),
(43,'razorpay','0','2019-07-06 09:58:43','2019-07-06 09:58:43'),
(44,'paystack','0','2019-07-21 13:00:38','2019-07-21 13:00:38'),
(45,'pickup_point','1','2019-10-17 11:50:39','2020-07-14 08:34:45'),
(46,'maintenance_mode','0','2019-10-17 11:51:04','2020-08-04 01:38:59'),
(47,'voguepay','0','2019-10-17 11:51:24','2019-10-17 11:51:24'),
(48,'voguepay_sandbox','0','2019-10-17 11:51:38','2019-10-17 11:51:38'),
(50,'category_wise_commission','0','2020-01-21 07:22:47','2020-01-21 07:22:47'),
(51,'conversation_system','1','2020-01-21 07:23:21','2020-01-21 07:23:21'),
(52,'guest_checkout_active','1','2020-01-22 07:36:38','2020-01-22 07:36:38'),
(53,'facebook_pixel','0','2020-01-22 11:43:58','2020-01-22 11:43:58'),
(55,'classified_product','0','2020-05-13 13:01:05','2020-08-05 00:14:49'),
(56,'pos_activation_for_seller','1','2020-06-11 09:45:02','2020-06-11 09:45:02'),
(57,'shipping_type','product_wise_shipping','2020-07-04 07:02:57','2020-07-04 07:02:57'),
(58,'flat_rate_shipping_cost','0','2020-07-04 07:02:57','2020-07-04 07:02:57'),
(59,'shipping_cost_admin','0','2020-07-04 07:02:57','2020-07-04 07:02:57');
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `featured` int(11) NOT NULL DEFAULT 0,
  `top` int(11) NOT NULL DEFAULT 0,
  `digital` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(4,'طلا و سکه',0.00,'uploads/categories/banner/j9RdT1fB4vz6WgefxVOfalAor63Nf6qOlzhQH9Fv.webp','uploads/categories/icon/4k2o8u6W0VuotGl9iqdI6vHEmojWHD7yNzDO7eLa.webp',0,1,0,'--2EJpD','طلا و سکه','دسته مربوط به طلا و سکه ها','2025-12-31 13:48:02','2025-12-31 10:18:02'),
(5,'ساعت‌های لوکس',0.00,'uploads/categories/banner/8OWqjFjhNSfclJHcpk3DM2r2rSk964wsZrB2fxkv.webp','uploads/categories/icon/O256zt8iQfQRHVedr6hvwldkGx90hloRWzcJDbNA.webp',0,1,0,'----FoS0v','ساعت‌های لوکس','دسته ساعت های برند','2025-12-31 13:49:55','2025-12-31 10:19:55'),
(6,'جواهرات زنانه',0.00,'uploads/categories/banner/Kj87XQDQBpqRMW8j6eR029Jtc4BwZtToHbnPU4rs.webp','uploads/categories/icon/RmXJwd8lDFazKcApTSIddvEDiZezkKTmRmMuscZk.webp',0,1,0,'----N4OaQ','جواهرات زنانه',NULL,'2025-12-31 13:50:16','2025-12-31 10:20:16'),
(7,'جواهرات مردانه',0.00,'uploads/categories/banner/evc67s4Xs3TqQBAJ9MYnxNIVHFNcMKvmF2a9VHFG.webp','uploads/categories/icon/VBlwqLhsF5lCIodcjc1Fo9glmQULz1UkKwwPifRe.webp',0,1,0,'---WKBAy','جواهرات مردانه',NULL,'2025-12-31 13:51:26','2025-12-31 10:21:26'),
(8,'انگشتر و دستبند',0.00,'uploads/categories/banner/9BLM6RBT6GZ4pbq0GUdtUBUMtk2IVhQiJOtYMRwU.webp','uploads/categories/icon/jTzzToVNHTQlbflr4hSR2JgN0ZMdAXRivGTPIowp.webp',0,1,0,'---uQqCB','انگشتر و دستبند',NULL,'2025-12-31 13:51:55','2025-12-31 10:21:55'),
(9,'گردنبند و پابند',0.00,'uploads/categories/banner/Lb7SOk7DjI3xk2EbyD0WPhCovb71Ya8XyKV9v1T4.webp','uploads/categories/icon/dhmTU6zNBeHhJvFufIa5MzT3OPFOL1JMKXw8BE7a.webp',0,1,0,'-----MB8NO','گردنبند و پابند',NULL,'2025-12-31 13:52:51','2025-12-31 10:22:51'),
(12,'سنگ‌های قیمتی',0.00,'uploads/categories/banner/NAQ6xfeWcwg9gnc0su0Vew3wGGZ7lb1VgWj7YhV3.webp','uploads/categories/icon/xv1R8QEGckhy6QcwzUlvOs4QDAp7Dk0c64iZwUOn.webp',0,1,0,'---iLNhI','سنگ‌های قیمتی',NULL,'2025-12-31 13:53:23','2025-12-31 10:23:23'),
(13,'اکسسوری‌های طلا',0.00,'uploads/categories/banner/aAez1ZdsnsiHFRSS7GthaiqUyq9X5ABRYDIuliYI.webp','uploads/categories/icon/JSCDczuWKJNOci9TqVedirSeFMzNFfnzRKYKKvBA.webp',0,1,0,'---qY463','اکسسوری‌های طلا','اکسسوری‌های طلا','2025-12-31 13:54:00','2025-12-31 10:24:00'),
(14,'هدیه و اقلام لوکس',0.00,'uploads/categories/banner/2IGukVvYsDBhnkgwoxEKPn7ETmhlmdyUMx8McWII.webp','uploads/categories/icon/kQXDntLy2tQOVBdnIDPpK49MlRzLwNbKdFKBHfSl.webp',0,1,0,'-----H1Zlr','هدیه و اقلام لوکس','هدیه و اقلام لوکس','2025-12-31 13:54:26','2025-12-31 10:24:26'),
(15,'لوازم جانبی ساعت و جواهر',0.00,'uploads/categories/banner/RshhhluhMFk5vPFAqTrjgyl3o5RRmjmuq5wMrWHo.webp','uploads/categories/icon/h5ZlxaLSRWMRhGqVSMddb7sgZVMUUgMwBp69BhJ3.webp',0,1,0,'--o65zD','لوازم جانبی ساعت و جواهر','لوازم جانبی ساعت و جواهر','2025-12-31 13:55:36','2025-12-31 10:25:36');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES
(1,'IndianRed','#CD5C5C','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(2,'LightCoral','#F08080','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(3,'Salmon','#FA8072','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(4,'DarkSalmon','#E9967A','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(5,'LightSalmon','#FFA07A','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(6,'Crimson','#DC143C','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(7,'Red','#FF0000','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(8,'FireBrick','#B22222','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(9,'DarkRed','#8B0000','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(10,'Pink','#FFC0CB','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(11,'LightPink','#FFB6C1','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(12,'HotPink','#FF69B4','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(13,'DeepPink','#FF1493','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(14,'MediumVioletRed','#C71585','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(15,'PaleVioletRed','#DB7093','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(16,'LightSalmon','#FFA07A','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(17,'Coral','#FF7F50','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(18,'Tomato','#FF6347','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(19,'OrangeRed','#FF4500','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(20,'DarkOrange','#FF8C00','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(21,'Orange','#FFA500','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(22,'Gold','#FFD700','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(23,'Yellow','#FFFF00','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(24,'LightYellow','#FFFFE0','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(25,'LemonChiffon','#FFFACD','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(26,'LightGoldenrodYellow','#FAFAD2','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(27,'PapayaWhip','#FFEFD5','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(28,'Moccasin','#FFE4B5','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(29,'PeachPuff','#FFDAB9','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(30,'PaleGoldenrod','#EEE8AA','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(31,'Khaki','#F0E68C','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(32,'DarkKhaki','#BDB76B','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(33,'Lavender','#E6E6FA','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(34,'Thistle','#D8BFD8','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(35,'Plum','#DDA0DD','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(36,'Violet','#EE82EE','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(37,'Orchid','#DA70D6','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(38,'Fuchsia','#FF00FF','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(39,'Magenta','#FF00FF','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(40,'MediumOrchid','#BA55D3','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(41,'MediumPurple','#9370DB','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(42,'Amethyst','#9966CC','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(43,'BlueViolet','#8A2BE2','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(44,'DarkViolet','#9400D3','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(45,'DarkOrchid','#9932CC','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(46,'DarkMagenta','#8B008B','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(47,'Purple','#800080','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(48,'Indigo','#4B0082','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(49,'SlateBlue','#6A5ACD','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(50,'DarkSlateBlue','#483D8B','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(51,'MediumSlateBlue','#7B68EE','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(52,'GreenYellow','#ADFF2F','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(53,'Chartreuse','#7FFF00','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(54,'LawnGreen','#7CFC00','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(55,'Lime','#00FF00','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(56,'LimeGreen','#32CD32','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(57,'PaleGreen','#98FB98','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(58,'LightGreen','#90EE90','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(59,'MediumSpringGreen','#00FA9A','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(60,'SpringGreen','#00FF7F','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(61,'MediumSeaGreen','#3CB371','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(62,'SeaGreen','#2E8B57','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(63,'ForestGreen','#228B22','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(64,'Green','#008000','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(65,'DarkGreen','#006400','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(66,'YellowGreen','#9ACD32','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(67,'OliveDrab','#6B8E23','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(68,'Olive','#808000','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(69,'DarkOliveGreen','#556B2F','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(70,'MediumAquamarine','#66CDAA','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(71,'DarkSeaGreen','#8FBC8F','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(72,'LightSeaGreen','#20B2AA','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(73,'DarkCyan','#008B8B','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(74,'Teal','#008080','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(75,'Aqua','#00FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(76,'Cyan','#00FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(77,'LightCyan','#E0FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(78,'PaleTurquoise','#AFEEEE','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(79,'Aquamarine','#7FFFD4','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(80,'Turquoise','#40E0D0','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(81,'MediumTurquoise','#48D1CC','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(82,'DarkTurquoise','#00CED1','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(83,'CadetBlue','#5F9EA0','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(84,'SteelBlue','#4682B4','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(85,'LightSteelBlue','#B0C4DE','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(86,'PowderBlue','#B0E0E6','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(87,'LightBlue','#ADD8E6','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(88,'SkyBlue','#87CEEB','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(89,'LightSkyBlue','#87CEFA','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(90,'DeepSkyBlue','#00BFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(91,'DodgerBlue','#1E90FF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(92,'CornflowerBlue','#6495ED','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(93,'MediumSlateBlue','#7B68EE','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(94,'RoyalBlue','#4169E1','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(95,'Blue','#0000FF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(96,'MediumBlue','#0000CD','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(97,'DarkBlue','#00008B','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(98,'Navy','#000080','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(99,'MidnightBlue','#191970','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(100,'Cornsilk','#FFF8DC','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(101,'BlanchedAlmond','#FFEBCD','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(102,'Bisque','#FFE4C4','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(103,'NavajoWhite','#FFDEAD','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(104,'Wheat','#F5DEB3','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(105,'BurlyWood','#DEB887','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(106,'Tan','#D2B48C','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(107,'RosyBrown','#BC8F8F','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(108,'SandyBrown','#F4A460','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(109,'Goldenrod','#DAA520','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(110,'DarkGoldenrod','#B8860B','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(111,'Peru','#CD853F','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(112,'Chocolate','#D2691E','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(113,'SaddleBrown','#8B4513','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(114,'Sienna','#A0522D','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(115,'Brown','#A52A2A','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(116,'Maroon','#800000','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(117,'White','#FFFFFF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(118,'Snow','#FFFAFA','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(119,'Honeydew','#F0FFF0','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(120,'MintCream','#F5FFFA','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(121,'Azure','#F0FFFF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(122,'AliceBlue','#F0F8FF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(123,'GhostWhite','#F8F8FF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(124,'WhiteSmoke','#F5F5F5','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(125,'Seashell','#FFF5EE','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(126,'Beige','#F5F5DC','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(127,'OldLace','#FDF5E6','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(128,'FloralWhite','#FFFAF0','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(129,'Ivory','#FFFFF0','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(130,'AntiqueWhite','#FAEBD7','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(131,'Linen','#FAF0E6','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(132,'LavenderBlush','#FFF0F5','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(133,'MistyRose','#FFE4E1','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(134,'Gainsboro','#DCDCDC','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(135,'LightGrey','#D3D3D3','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(136,'Silver','#C0C0C0','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(137,'DarkGray','#A9A9A9','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(138,'Gray','#808080','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(139,'DimGray','#696969','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(140,'LightSlateGray','#778899','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(141,'SlateGray','#708090','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(142,'DarkSlateGray','#2F4F4F','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(143,'Black','#000000','2018-11-05 02:12:30','2018-11-05 02:12:30');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `sender_viewed` int(11) NOT NULL DEFAULT 1,
  `receiver_viewed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES
(1,'AF','Afghanistan',1,NULL,NULL),
(2,'AL','Albania',1,NULL,NULL),
(3,'DZ','Algeria',1,NULL,NULL),
(4,'DS','American Samoa',1,NULL,NULL),
(5,'AD','Andorra',1,NULL,NULL),
(6,'AO','Angola',1,NULL,NULL),
(7,'AI','Anguilla',1,NULL,NULL),
(8,'AQ','Antarctica',1,NULL,NULL),
(9,'AG','Antigua and Barbuda',1,NULL,NULL),
(10,'AR','Argentina',1,NULL,NULL),
(11,'AM','Armenia',1,NULL,NULL),
(12,'AW','Aruba',1,NULL,NULL),
(13,'AU','Australia',1,NULL,NULL),
(14,'AT','Austria',1,NULL,NULL),
(15,'AZ','Azerbaijan',1,NULL,NULL),
(16,'BS','Bahamas',1,NULL,NULL),
(17,'BH','Bahrain',1,NULL,NULL),
(18,'BD','Bangladesh',1,NULL,NULL),
(19,'BB','Barbados',1,NULL,NULL),
(20,'BY','Belarus',1,NULL,NULL),
(21,'BE','Belgium',1,NULL,NULL),
(22,'BZ','Belize',1,NULL,NULL),
(23,'BJ','Benin',1,NULL,NULL),
(24,'BM','Bermuda',1,NULL,NULL),
(25,'BT','Bhutan',1,NULL,NULL),
(26,'BO','Bolivia',1,NULL,NULL),
(27,'BA','Bosnia and Herzegovina',1,NULL,NULL),
(28,'BW','Botswana',1,NULL,NULL),
(29,'BV','Bouvet Island',1,NULL,NULL),
(30,'BR','Brazil',1,NULL,NULL),
(31,'IO','British Indian Ocean Territory',1,NULL,NULL),
(32,'BN','Brunei Darussalam',1,NULL,NULL),
(33,'BG','Bulgaria',1,NULL,NULL),
(34,'BF','Burkina Faso',1,NULL,NULL),
(35,'BI','Burundi',1,NULL,NULL),
(36,'KH','Cambodia',1,NULL,NULL),
(37,'CM','Cameroon',1,NULL,NULL),
(38,'CA','Canada',1,NULL,NULL),
(39,'CV','Cape Verde',1,NULL,NULL),
(40,'KY','Cayman Islands',1,NULL,NULL),
(41,'CF','Central African Republic',1,NULL,NULL),
(42,'TD','Chad',1,NULL,NULL),
(43,'CL','Chile',1,NULL,NULL),
(44,'CN','China',1,NULL,NULL),
(45,'CX','Christmas Island',1,NULL,NULL),
(46,'CC','Cocos (Keeling) Islands',1,NULL,NULL),
(47,'CO','Colombia',1,NULL,NULL),
(48,'KM','Comoros',1,NULL,NULL),
(49,'CG','Congo',1,NULL,NULL),
(50,'CK','Cook Islands',1,NULL,NULL),
(51,'CR','Costa Rica',1,NULL,NULL),
(52,'HR','Croatia (Hrvatska)',1,NULL,NULL),
(53,'CU','Cuba',1,NULL,NULL),
(54,'CY','Cyprus',1,NULL,NULL),
(55,'CZ','Czech Republic',1,NULL,NULL),
(56,'DK','Denmark',1,NULL,NULL),
(57,'DJ','Djibouti',1,NULL,NULL),
(58,'DM','Dominica',1,NULL,NULL),
(59,'DO','Dominican Republic',1,NULL,NULL),
(60,'TP','East Timor',1,NULL,NULL),
(61,'EC','Ecuador',1,NULL,NULL),
(62,'EG','Egypt',1,NULL,NULL),
(63,'SV','El Salvador',1,NULL,NULL),
(64,'GQ','Equatorial Guinea',1,NULL,NULL),
(65,'ER','Eritrea',1,NULL,NULL),
(66,'EE','Estonia',1,NULL,NULL),
(67,'ET','Ethiopia',1,NULL,NULL),
(68,'FK','Falkland Islands (Malvinas)',1,NULL,NULL),
(69,'FO','Faroe Islands',1,NULL,NULL),
(70,'FJ','Fiji',1,NULL,NULL),
(71,'FI','Finland',1,NULL,NULL),
(72,'FR','France',1,NULL,NULL),
(73,'FX','France, Metropolitan',1,NULL,NULL),
(74,'GF','French Guiana',1,NULL,NULL),
(75,'PF','French Polynesia',1,NULL,NULL),
(76,'TF','French Southern Territories',1,NULL,NULL),
(77,'GA','Gabon',1,NULL,NULL),
(78,'GM','Gambia',1,NULL,NULL),
(79,'GE','Georgia',1,NULL,NULL),
(80,'DE','Germany',1,NULL,NULL),
(81,'GH','Ghana',1,NULL,NULL),
(82,'GI','Gibraltar',1,NULL,NULL),
(83,'GK','Guernsey',1,NULL,NULL),
(84,'GR','Greece',1,NULL,NULL),
(85,'GL','Greenland',1,NULL,NULL),
(86,'GD','Grenada',1,NULL,NULL),
(87,'GP','Guadeloupe',1,NULL,NULL),
(88,'GU','Guam',1,NULL,NULL),
(89,'GT','Guatemala',1,NULL,NULL),
(90,'GN','Guinea',1,NULL,NULL),
(91,'GW','Guinea-Bissau',1,NULL,NULL),
(92,'GY','Guyana',1,NULL,NULL),
(93,'HT','Haiti',1,NULL,NULL),
(94,'HM','Heard and Mc Donald Islands',1,NULL,NULL),
(95,'HN','Honduras',1,NULL,NULL),
(96,'HK','Hong Kong',1,NULL,NULL),
(97,'HU','Hungary',1,NULL,NULL),
(98,'IS','Iceland',1,NULL,NULL),
(99,'IN','India',1,NULL,NULL),
(100,'IM','Isle of Man',1,NULL,NULL),
(101,'ID','Indonesia',1,NULL,NULL),
(102,'IR','Iran (Islamic Republic of)',1,NULL,NULL),
(103,'IQ','Iraq',1,NULL,NULL),
(104,'IE','Ireland',1,NULL,NULL),
(105,'IL','Israel',1,NULL,NULL),
(106,'IT','Italy',1,NULL,NULL),
(107,'CI','Ivory Coast',1,NULL,NULL),
(108,'JE','Jersey',1,NULL,NULL),
(109,'JM','Jamaica',1,NULL,NULL),
(110,'JP','Japan',1,NULL,NULL),
(111,'JO','Jordan',1,NULL,NULL),
(112,'KZ','Kazakhstan',1,NULL,NULL),
(113,'KE','Kenya',1,NULL,NULL),
(114,'KI','Kiribati',1,NULL,NULL),
(115,'KP','Korea, Democratic People\'s Republic of',1,NULL,NULL),
(116,'KR','Korea, Republic of',1,NULL,NULL),
(117,'XK','Kosovo',1,NULL,NULL),
(118,'KW','Kuwait',1,NULL,NULL),
(119,'KG','Kyrgyzstan',1,NULL,NULL),
(120,'LA','Lao People\'s Democratic Republic',1,NULL,NULL),
(121,'LV','Latvia',1,NULL,NULL),
(122,'LB','Lebanon',1,NULL,NULL),
(123,'LS','Lesotho',1,NULL,NULL),
(124,'LR','Liberia',1,NULL,NULL),
(125,'LY','Libyan Arab Jamahiriya',1,NULL,NULL),
(126,'LI','Liechtenstein',1,NULL,NULL),
(127,'LT','Lithuania',1,NULL,NULL),
(128,'LU','Luxembourg',1,NULL,NULL),
(129,'MO','Macau',1,NULL,NULL),
(130,'MK','Macedonia',1,NULL,NULL),
(131,'MG','Madagascar',1,NULL,NULL),
(132,'MW','Malawi',1,NULL,NULL),
(133,'MY','Malaysia',1,NULL,NULL),
(134,'MV','Maldives',1,NULL,NULL),
(135,'ML','Mali',1,NULL,NULL),
(136,'MT','Malta',1,NULL,NULL),
(137,'MH','Marshall Islands',1,NULL,NULL),
(138,'MQ','Martinique',1,NULL,NULL),
(139,'MR','Mauritania',1,NULL,NULL),
(140,'MU','Mauritius',1,NULL,NULL),
(141,'TY','Mayotte',1,NULL,NULL),
(142,'MX','Mexico',1,NULL,NULL),
(143,'FM','Micronesia, Federated States of',1,NULL,NULL),
(144,'MD','Moldova, Republic of',1,NULL,NULL),
(145,'MC','Monaco',1,NULL,NULL),
(146,'MN','Mongolia',1,NULL,NULL),
(147,'ME','Montenegro',1,NULL,NULL),
(148,'MS','Montserrat',1,NULL,NULL),
(149,'MA','Morocco',1,NULL,NULL),
(150,'MZ','Mozambique',1,NULL,NULL),
(151,'MM','Myanmar',1,NULL,NULL),
(152,'NA','Namibia',1,NULL,NULL),
(153,'NR','Nauru',1,NULL,NULL),
(154,'NP','Nepal',1,NULL,NULL),
(155,'NL','Netherlands',1,NULL,NULL),
(156,'AN','Netherlands Antilles',1,NULL,NULL),
(157,'NC','New Caledonia',1,NULL,NULL),
(158,'NZ','New Zealand',1,NULL,NULL),
(159,'NI','Nicaragua',1,NULL,NULL),
(160,'NE','Niger',1,NULL,NULL),
(161,'NG','Nigeria',1,NULL,NULL),
(162,'NU','Niue',1,NULL,NULL),
(163,'NF','Norfolk Island',1,NULL,NULL),
(164,'MP','Northern Mariana Islands',1,NULL,NULL),
(165,'NO','Norway',1,NULL,NULL),
(166,'OM','Oman',1,NULL,NULL),
(167,'PK','Pakistan',1,NULL,NULL),
(168,'PW','Palau',1,NULL,NULL),
(169,'PS','Palestine',1,NULL,NULL),
(170,'PA','Panama',1,NULL,NULL),
(171,'PG','Papua New Guinea',1,NULL,NULL),
(172,'PY','Paraguay',1,NULL,NULL),
(173,'PE','Peru',1,NULL,NULL),
(174,'PH','Philippines',1,NULL,NULL),
(175,'PN','Pitcairn',1,NULL,NULL),
(176,'PL','Poland',1,NULL,NULL),
(177,'PT','Portugal',1,NULL,NULL),
(178,'PR','Puerto Rico',1,NULL,NULL),
(179,'QA','Qatar',1,NULL,NULL),
(180,'RE','Reunion',1,NULL,NULL),
(181,'RO','Romania',1,NULL,NULL),
(182,'RU','Russian Federation',1,NULL,NULL),
(183,'RW','Rwanda',1,NULL,NULL),
(184,'KN','Saint Kitts and Nevis',1,NULL,NULL),
(185,'LC','Saint Lucia',1,NULL,NULL),
(186,'VC','Saint Vincent and the Grenadines',1,NULL,NULL),
(187,'WS','Samoa',1,NULL,NULL),
(188,'SM','San Marino',1,NULL,NULL),
(189,'ST','Sao Tome and Principe',1,NULL,NULL),
(190,'SA','Saudi Arabia',1,NULL,NULL),
(191,'SN','Senegal',1,NULL,NULL),
(192,'RS','Serbia',1,NULL,NULL),
(193,'SC','Seychelles',1,NULL,NULL),
(194,'SL','Sierra Leone',1,NULL,NULL),
(195,'SG','Singapore',1,NULL,NULL),
(196,'SK','Slovakia',1,NULL,NULL),
(197,'SI','Slovenia',1,NULL,NULL),
(198,'SB','Solomon Islands',1,NULL,NULL),
(199,'SO','Somalia',1,NULL,NULL),
(200,'ZA','South Africa',1,NULL,NULL),
(201,'GS','South Georgia South Sandwich Islands',1,NULL,NULL),
(202,'SS','South Sudan',1,NULL,NULL),
(203,'ES','Spain',1,NULL,NULL),
(204,'LK','Sri Lanka',1,NULL,NULL),
(205,'SH','St. Helena',1,NULL,NULL),
(206,'PM','St. Pierre and Miquelon',1,NULL,NULL),
(207,'SD','Sudan',1,NULL,NULL),
(208,'SR','Suriname',1,NULL,NULL),
(209,'SJ','Svalbard and Jan Mayen Islands',1,NULL,NULL),
(210,'SZ','Swaziland',1,NULL,NULL),
(211,'SE','Sweden',1,NULL,NULL),
(212,'CH','Switzerland',1,NULL,NULL),
(213,'SY','Syrian Arab Republic',1,NULL,NULL),
(214,'TW','Taiwan',1,NULL,NULL),
(215,'TJ','Tajikistan',1,NULL,NULL),
(216,'TZ','Tanzania, United Republic of',1,NULL,NULL),
(217,'TH','Thailand',1,NULL,NULL),
(218,'TG','Togo',1,NULL,NULL),
(219,'TK','Tokelau',1,NULL,NULL),
(220,'TO','Tonga',1,NULL,NULL),
(221,'TT','Trinidad and Tobago',1,NULL,NULL),
(222,'TN','Tunisia',1,NULL,NULL),
(223,'TR','Turkey',1,NULL,NULL),
(224,'TM','Turkmenistan',1,NULL,NULL),
(225,'TC','Turks and Caicos Islands',1,NULL,NULL),
(226,'TV','Tuvalu',1,NULL,NULL),
(227,'UG','Uganda',1,NULL,NULL),
(228,'UA','Ukraine',1,NULL,NULL),
(229,'AE','United Arab Emirates',1,NULL,NULL),
(230,'GB','United Kingdom',1,NULL,NULL),
(231,'US','United States',1,NULL,NULL),
(232,'UM','United States minor outlying islands',1,NULL,NULL),
(233,'UY','Uruguay',1,NULL,NULL),
(234,'UZ','Uzbekistan',1,NULL,NULL),
(235,'VU','Vanuatu',1,NULL,NULL),
(236,'VA','Vatican City State',1,NULL,NULL),
(237,'VE','Venezuela',1,NULL,NULL),
(238,'VN','Vietnam',1,NULL,NULL),
(239,'VG','Virgin Islands (British)',1,NULL,NULL),
(240,'VI','Virgin Islands (U.S.)',1,NULL,NULL),
(241,'WF','Wallis and Futuna Islands',1,NULL,NULL),
(242,'EH','Western Sahara',1,NULL,NULL),
(243,'YE','Yemen',1,NULL,NULL),
(244,'ZR','Zaire',1,NULL,NULL),
(245,'ZM','Zambia',1,NULL,NULL),
(246,'ZW','Zimbabwe',1,NULL,NULL),
(247,'AF','Afghanistan',1,NULL,NULL),
(248,'AL','Albania',1,NULL,NULL),
(249,'DZ','Algeria',1,NULL,NULL),
(250,'DS','American Samoa',1,NULL,NULL),
(251,'AD','Andorra',1,NULL,NULL),
(252,'AO','Angola',1,NULL,NULL),
(253,'AI','Anguilla',1,NULL,NULL),
(254,'AQ','Antarctica',1,NULL,NULL),
(255,'AG','Antigua and Barbuda',1,NULL,NULL),
(256,'AR','Argentina',1,NULL,NULL),
(257,'AM','Armenia',1,NULL,NULL),
(258,'AW','Aruba',1,NULL,NULL),
(259,'AU','Australia',1,NULL,NULL),
(260,'AT','Austria',1,NULL,NULL),
(261,'AZ','Azerbaijan',1,NULL,NULL),
(262,'BS','Bahamas',1,NULL,NULL),
(263,'BH','Bahrain',1,NULL,NULL),
(264,'BD','Bangladesh',1,NULL,NULL),
(265,'BB','Barbados',1,NULL,NULL),
(266,'BY','Belarus',1,NULL,NULL),
(267,'BE','Belgium',1,NULL,NULL),
(268,'BZ','Belize',1,NULL,NULL),
(269,'BJ','Benin',1,NULL,NULL),
(270,'BM','Bermuda',1,NULL,NULL),
(271,'BT','Bhutan',1,NULL,NULL),
(272,'BO','Bolivia',1,NULL,NULL),
(273,'BA','Bosnia and Herzegovina',1,NULL,NULL),
(274,'BW','Botswana',1,NULL,NULL),
(275,'BV','Bouvet Island',1,NULL,NULL),
(276,'BR','Brazil',1,NULL,NULL),
(277,'IO','British Indian Ocean Territory',1,NULL,NULL),
(278,'BN','Brunei Darussalam',1,NULL,NULL),
(279,'BG','Bulgaria',1,NULL,NULL),
(280,'BF','Burkina Faso',1,NULL,NULL),
(281,'BI','Burundi',1,NULL,NULL),
(282,'KH','Cambodia',1,NULL,NULL),
(283,'CM','Cameroon',1,NULL,NULL),
(284,'CA','Canada',1,NULL,NULL),
(285,'CV','Cape Verde',1,NULL,NULL),
(286,'KY','Cayman Islands',1,NULL,NULL),
(287,'CF','Central African Republic',1,NULL,NULL),
(288,'TD','Chad',1,NULL,NULL),
(289,'CL','Chile',1,NULL,NULL),
(290,'CN','China',1,NULL,NULL),
(291,'CX','Christmas Island',1,NULL,NULL),
(292,'CC','Cocos (Keeling) Islands',1,NULL,NULL),
(293,'CO','Colombia',1,NULL,NULL),
(294,'KM','Comoros',1,NULL,NULL),
(295,'CG','Congo',1,NULL,NULL),
(296,'CK','Cook Islands',1,NULL,NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupon_usages`
--

DROP TABLE IF EXISTS `coupon_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_usages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupon_usages` WRITE;
/*!40000 ALTER TABLE `coupon_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_usages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` varchar(100) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES
(1,'تومان','تومان',1.00000,1,'IRR','2020-07-06 02:18:24','2020-07-06 02:18:52');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `customer_packages`
--

DROP TABLE IF EXISTS `customer_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` double(28,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_packages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `customer_packages` WRITE;
/*!40000 ALTER TABLE `customer_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_packages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `customer_products`
--

DROP TABLE IF EXISTS `customer_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `added_by` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  `thumbnail_img` varchar(150) DEFAULT NULL,
  `conditon` varchar(50) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `video_provider` varchar(100) DEFAULT NULL,
  `video_link` varchar(200) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `unit_price` double(28,2) DEFAULT 0.00,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `meta_img` varchar(150) DEFAULT NULL,
  `pdf` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `customer_products` WRITE;
/*!40000 ALTER TABLE `customer_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(4,8,'2019-08-01 10:35:09','2019-08-01 10:35:09'),
(10,23,'2026-01-01 18:22:16','2026-01-01 18:22:16'),
(17,30,'2026-01-01 20:05:30','2026-01-01 20:05:30'),
(18,31,'2026-01-06 15:32:06','2026-01-06 15:32:06'),
(19,6,'2026-09-19 16:07:31','2026-09-19 16:07:31'),
(20,999999,'2026-09-19 16:07:31','2026-09-19 16:07:31'),
(21,9,'2026-09-19 16:08:50','2026-09-19 16:08:50'),
(22,999999,'2026-09-19 16:08:50','2026-09-19 16:08:50'),
(23,11,'2026-09-19 16:09:38','2026-09-19 16:09:38'),
(24,999999,'2026-09-19 16:09:38','2026-09-19 16:09:38'),
(25,13,'2026-09-19 16:10:08','2026-09-19 16:10:08'),
(26,999999,'2026-09-19 16:10:08','2026-09-19 16:10:08'),
(27,15,'2026-09-19 16:55:15','2026-09-19 16:55:15'),
(28,999999,'2026-09-19 16:55:15','2026-09-19 16:55:15'),
(29,17,'2026-09-19 16:56:52','2026-09-19 16:56:52'),
(30,999999,'2026-09-19 16:56:52','2026-09-19 16:56:52'),
(31,19,'2026-09-19 16:57:59','2026-09-19 16:57:59'),
(32,999999,'2026-09-19 16:57:59','2026-09-19 16:57:59'),
(33,21,'2026-09-19 17:00:08','2026-09-19 17:00:08'),
(34,999999,'2026-09-19 17:00:08','2026-09-19 17:00:08'),
(35,23,'2026-09-19 17:01:46','2026-09-19 17:01:46'),
(36,999999,'2026-09-19 17:01:46','2026-09-19 17:01:46'),
(37,25,'2026-09-19 17:03:37','2026-09-19 17:03:37'),
(38,999999,'2026-09-19 17:03:37','2026-09-19 17:03:37'),
(39,27,'2026-09-19 17:05:09','2026-09-19 17:05:09'),
(40,999999,'2026-09-19 17:05:09','2026-09-19 17:05:09'),
(41,29,'2026-09-19 17:15:03','2026-09-19 17:15:03'),
(42,999999,'2026-09-19 17:15:03','2026-09-19 17:15:03'),
(43,31,'2026-09-19 17:15:26','2026-09-19 17:15:26'),
(44,999999,'2026-09-19 17:15:26','2026-09-19 17:15:26'),
(45,33,'2026-09-19 17:20:21','2026-09-19 17:20:21'),
(46,999999,'2026-09-19 17:20:21','2026-09-19 17:20:21'),
(47,35,'2026-09-19 17:26:06','2026-09-19 17:26:06'),
(48,999999,'2026-09-19 17:26:06','2026-09-19 17:26:06'),
(49,37,'2026-09-19 17:29:44','2026-09-19 17:29:44'),
(50,999999,'2026-09-19 17:29:44','2026-09-19 17:29:44'),
(51,39,'2026-09-19 17:31:54','2026-09-19 17:31:54'),
(52,999999,'2026-09-19 17:31:54','2026-09-19 17:31:54'),
(53,41,'2026-09-19 17:34:31','2026-09-19 17:34:31'),
(54,999999,'2026-09-19 17:34:31','2026-09-19 17:34:31'),
(55,43,'2026-09-19 17:40:49','2026-09-19 17:40:49'),
(56,999999,'2026-09-19 17:40:49','2026-09-19 17:40:49'),
(57,45,'2026-09-19 18:15:32','2026-09-19 18:15:32'),
(58,999999,'2026-09-19 18:15:32','2026-09-19 18:15:32'),
(59,47,'2026-09-19 18:17:49','2026-09-19 18:17:49'),
(60,999999,'2026-09-19 18:17:49','2026-09-19 18:17:49');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `flash_deal_products`
--

DROP TABLE IF EXISTS `flash_deal_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_deal_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `flash_deal_products` WRITE;
/*!40000 ALTER TABLE `flash_deal_products` DISABLE KEYS */;
INSERT INTO `flash_deal_products` VALUES
(41,8,1,0.00,'amount','2020-07-20 00:14:44','2020-07-20 00:14:44'),
(42,8,2,0.00,'amount','2020-07-20 00:14:44','2020-07-20 00:14:44'),
(51,7,1,90000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33'),
(52,7,6,6000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33'),
(53,7,9,12000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33'),
(54,7,13,49000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33'),
(55,7,15,300000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33'),
(56,7,17,50000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33'),
(57,7,21,10000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33'),
(58,7,23,200000.00,'amount','2020-08-01 10:02:33','2020-08-01 10:02:33');
/*!40000 ALTER TABLE `flash_deal_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `flash_deals`
--

DROP TABLE IF EXISTS `flash_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `featured` int(11) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_deals`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `flash_deals` WRITE;
/*!40000 ALTER TABLE `flash_deals` DISABLE KEYS */;
INSERT INTO `flash_deals` VALUES
(7,'پیشنهاد شگفت انگیز',1595376000,1597968000,1,1,'#FFFFFF','dark','uploads/offers/banner/t4uuiqxx8KUq1bRFZuyXLfQraUdEEpTu5PV97h5V.jpeg','پۜشنهاد-شگفت-انگۜز-djzvw','2020-07-22 03:05:16','2020-08-01 10:02:33'),
(8,'تست',1595236114,1595322529,0,0,'#fff','dark','uploads/offers/banner/fwrjKaUqlS7kJlQdxy3gUznU3RIxL51ZcfjqkCB0.jpeg','تست-jxqbv','2020-07-20 00:14:44','2020-07-20 00:14:44');
/*!40000 ALTER TABLE `flash_deals` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frontend_color` varchar(255) NOT NULL DEFAULT 'default',
  `logo` varchar(255) DEFAULT NULL,
  `admin_logo` varchar(255) DEFAULT NULL,
  `admin_login_background` varchar(255) DEFAULT NULL,
  `admin_login_sidebar` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(1000) DEFAULT NULL,
  `instagram` varchar(1000) DEFAULT NULL,
  `twitter` varchar(1000) DEFAULT NULL,
  `youtube` varchar(1000) DEFAULT NULL,
  `google_plus` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` VALUES
(1,'2','uploads/logo/kharazi-peransa-logo.png','uploads/admin_logo/wCgHrz0Q5QoL1yu4vdrNnQIr4uGuNL48CXfcxOuS.png',NULL,NULL,'uploads/favicon/uHdGidSaRVzvPgDj6JFtntMqzJkwDk9659233jrb.png','خرازی پرنسا','تهران خیابان جمهوری','کلیه حقوق محفوظ و متعلق به سامانه دریک سرویس میباشد','09104927131','edeban.almas@gmail.com','https://www.facebook.com','https://www.instagram.com','https://www.twitter.com','https://www.youtube.com','https://www.googleplus.com','2026-10-16 15:22:16','2025-12-22 08:33:35');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `home_categories`
--

DROP TABLE IF EXISTS `home_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `home_categories` WRITE;
/*!40000 ALTER TABLE `home_categories` DISABLE KEYS */;
INSERT INTO `home_categories` VALUES
(3,7,'null',1,'2020-08-01 12:59:17','2020-08-01 12:59:17');
/*!40000 ALTER TABLE `home_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jewelry_certificates`
--

DROP TABLE IF EXISTS `jewelry_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewelry_certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `metal_type` varchar(191) NOT NULL,
  `purity` varchar(191) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `stone_type` varchar(191) DEFAULT NULL,
  `serial_number` varchar(191) NOT NULL,
  `issued_at` date DEFAULT NULL,
  `certificate_file` varchar(191) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) unsigned DEFAULT NULL,
  `approved_by` int(10) unsigned DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `rejection_reason` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `serial_number` (`serial_number`) USING BTREE,
  KEY `owner_id` (`owner_id`) USING BTREE,
  KEY `jewelry_certificates_created_by_index` (`created_by`),
  KEY `jewelry_certificates_is_active_index` (`is_active`),
  KEY `jewelry_certificates_is_verified_index` (`is_verified`),
  KEY `jewelry_certificates_issued_at_index` (`issued_at`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewelry_certificates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jewelry_certificates` WRITE;
/*!40000 ALTER TABLE `jewelry_certificates` DISABLE KEYS */;
INSERT INTO `jewelry_certificates` VALUES
(1,1,'انگشتر طلای مصری','طلا','18',100.00,NULL,'202020','2026-02-02','jewelry-certificates/LIAeemlzzLTOHPVWtUQJwYEISWrYDaasdqNRmxtB.jpg',NULL,0,1,NULL,NULL,NULL,NULL,NULL,'2026-02-02 16:15:33','2026-09-16 01:15:14'),
(2,5,'دستبند پلاتین','پلاتین','26',40.00,'سایر','202210','2026-02-02','jewelry-certificates/pCZppsVdq5XoLlqe18qNFtadREogR3uN7CQHvI5B.jpg','این یک دستبند عتیقه هست',0,1,NULL,NULL,NULL,NULL,NULL,'2026-02-02 16:41:22','2026-02-04 20:06:38'),
(3,3,'گردنبند پلاتین نقره ای زنانه','پلاتین','26',10.00,'الماس','042101010','2026-02-04','jewelry-certificates/hTiFsHoN8yhoSB7vB7CRYHvMPDobLeRcuz8gZ1TK.jpg','این گردنبند عتیقه هست',0,1,NULL,NULL,NULL,NULL,NULL,'2026-02-04 19:47:10','2026-02-04 19:47:10'),
(4,1,'انگشتر طلا','طلا','18',7.00,'عقیق','2679427981','2026-09-10','jewelry-certificates/kSpgT0S1dyt8KLQwK4jjuibthyQObrGiUSdJEEaG.jpg','کلاسیک 21*25 میلیمتر - نوع گوهر عقیق قیمت 140 میلیون تومان -',0,1,NULL,NULL,NULL,NULL,NULL,'2026-09-10 05:49:24','2026-09-10 05:49:24');
/*!40000 ALTER TABLE `jewelry_certificates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jewelry_owners`
--

DROP TABLE IF EXISTS `jewelry_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewelry_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `national_id` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `jewelry_owners_user_id_national_id_unique` (`user_id`,`national_id`) USING BTREE,
  KEY `jewelry_owners_user_id_index` (`user_id`) USING BTREE,
  KEY `jewelry_owners_national_id_index` (`national_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewelry_owners`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jewelry_owners` WRITE;
/*!40000 ALTER TABLE `jewelry_owners` DISABLE KEYS */;
INSERT INTO `jewelry_owners` VALUES
(1,4,'مریم رونقی','2679427981','09306225854','تهران میدان فردوسی دروازه دولت کوچه میرجانی پلاک 17 واحد 2','maryam@gmail.com','2026-09-10 05:41:42','2026-09-10 05:41:42'),
(2,4,'مریم بنی عباسی','0066406811','09359390912','تهران صادقیه خسرو شمالی پلاک 46 طبقه 9 واحد 6','maryambaniabbasi@gmail.com','2026-09-10 05:45:05','2026-09-10 05:45:05'),
(3,4,'مرتضی بهنامی','0421088273','09104927131','ورامین میدان رازی خیابان دانشگاه','morteza@gmail.com','2026-09-19 17:22:07','2026-09-19 17:22:07');
/*!40000 ALTER TABLE `jewelry_owners` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jewelry_transfers`
--

DROP TABLE IF EXISTS `jewelry_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jewelry_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `certificate_id` int(10) unsigned NOT NULL,
  `from_owner_id` int(10) unsigned NOT NULL,
  `to_owner_id` int(10) unsigned NOT NULL,
  `transfer_date` date DEFAULT NULL,
  `transfer_type` varchar(191) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `contract_file` varchar(191) DEFAULT NULL,
  `requested_by` int(10) unsigned DEFAULT NULL,
  `approved_by` int(10) unsigned DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'approved',
  `approval_note` varchar(500) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `jewelry_transfers_certificate_id_index` (`certificate_id`),
  KEY `jewelry_transfers_from_owner_id_index` (`from_owner_id`),
  KEY `jewelry_transfers_to_owner_id_index` (`to_owner_id`),
  KEY `jewelry_transfers_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewelry_transfers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jewelry_transfers` WRITE;
/*!40000 ALTER TABLE `jewelry_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jewelry_transfers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `rtl` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES
(1,'فارسی','ir',1,'2026-08-22 18:08:12','2026-08-22 18:08:12'),
(2,'English','en',0,'2026-08-22 18:08:12','2026-08-22 18:08:12');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(500) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `successful` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_attempts_identifier_index` (`identifier`,`created_at`),
  KEY `login_attempts_ip_index` (`ip_address`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2026_09_07_100001_create_drikana_core_ecommerce_tables',1),
(2,'2026_09_07_100002_align_seo_settings_columns',2),
(3,'2014_10_12_000000_create_users_table',3),
(4,'2026_02_16_151319_create_missing_reports_table',3),
(5,'2026_02_16_165127_create_repair_status_histories_table',3),
(6,'2026_02_16_165329_create_repair_orders_table',3),
(7,'2026_02_16_171033_add_role_to_users_table',3),
(8,'2026_02_16_183253_fix_repair_status_histories_foreign_keys',3),
(9,'2026_02_16_202821_create_repair_technicians_table',3),
(10,'2026_09_07_100000_add_ecommerce_fields_to_users_table',3),
(11,'2014_10_12_100000_create_password_resets_table',4),
(12,'2016_06_01_000001_create_oauth_auth_codes_table',4),
(13,'2016_06_01_000002_create_oauth_access_tokens_table',4),
(14,'2016_06_01_000003_create_oauth_refresh_tokens_table',4),
(15,'2016_06_01_000004_create_oauth_clients_table',4),
(16,'2016_06_01_000005_create_oauth_personal_access_clients_table',4),
(17,'2026_09_07_100003_create_jewelry_owners_table',5),
(18,'2026_09_19_100004_create_pages_table',6),
(19,'2026_09_20_100005_create_pickup_points_table',7),
(20,'2026_09_20_100006_create_otp_configurations_table',8),
(21,'2026_09_20_100007_add_document_to_missing_reports_table',9),
(22,'2026_09_20_100008_add_phone_to_jewelry_owners_table',10),
(23,'2026_09_20_100009_create_seller_withdraw_requests_table',11),
(24,'2026_09_20_100010_add_pickup_shipping_fields_to_order_details_table',12),
(25,'2026_10_12_100006_create_articles_tables',13),
(26,'2026_10_12_100001_extend_roles_table_for_rbac',14),
(27,'2026_10_12_100002_create_permissions_tables',15),
(28,'2026_10_12_100003_create_audit_logs_table',16),
(29,'2026_10_12_100004_fix_jewelry_schema_drift',17);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `missing_reports`
--

DROP TABLE IF EXISTS `missing_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `missing_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `jewelry_id` bigint(20) unsigned NOT NULL,
  `type` enum('theft','lost') NOT NULL COMMENT 'سرقت یا مفقودی',
  `location` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `police_report_path` varchar(191) DEFAULT NULL,
  `police_report_name` varchar(191) DEFAULT NULL,
  `status` enum('pending','found') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missing_reports`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `missing_reports` WRITE;
/*!40000 ALTER TABLE `missing_reports` DISABLE KEYS */;
INSERT INTO `missing_reports` VALUES
(1,4,4,'theft','ورامین میدان رازی خ دانشگاه','یک ادم سیاه پوش به من حمله کرد و انگشتر من را ربود',NULL,NULL,'found','2026-09-10 05:53:00','2026-09-10 06:19:12'),
(2,4,4,'theft','تهران','از من سرقت شد',NULL,NULL,'pending','2026-09-14 08:36:04','2026-09-14 08:36:04'),
(3,4,1,'theft','ورامین','کیف من را دزدیدند',NULL,NULL,'pending','2026-09-16 01:19:25','2026-09-16 01:19:25'),
(4,4,4,'theft','تهران خیابان پیروزی','تست ثبت سرقت','missing-reports/0jNL1vowlc81OMCQN65PG8UcsgeHTlVnfyfllyTl.pdf','ronaghi.pdf','pending','2026-09-19 17:16:54','2026-09-19 17:16:54');
/*!40000 ALTER TABLE `missing_reports` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oauth_access_tokens_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oauth_clients_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variation` text DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `tax` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `delivery_status` varchar(20) NOT NULL DEFAULT 'pending',
  `shipping_type` varchar(255) DEFAULT NULL,
  `pickup_point_id` int(10) unsigned DEFAULT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_details_pickup_point_id_index` (`pickup_point_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `payment_status_string` varchar(20) NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) NOT NULL DEFAULT 'pending',
  `shipping_type` varchar(20) NOT NULL DEFAULT 'home_delivery',
  `grand_total` double(20,2) NOT NULL DEFAULT 0.00,
  `coupon_discount` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_address` text DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `viewed` int(11) NOT NULL DEFAULT 0,
  `delivery_viewed` int(11) NOT NULL DEFAULT 0,
  `payment_status_viewed` int(11) NOT NULL DEFAULT 0,
  `commission_calculated` tinyint(4) NOT NULL DEFAULT 0,
  `trx_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `otp_configurations`
--

DROP TABLE IF EXISTS `otp_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `otp_configurations_type_unique` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_configurations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `otp_configurations` WRITE;
/*!40000 ALTER TABLE `otp_configurations` DISABLE KEYS */;
INSERT INTO `otp_configurations` VALUES
(1,'nexmo','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(2,'twillo','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(3,'ssl_wireless','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(4,'fast2sms','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(5,'melipayamak','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(6,'farazsms','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(7,'otp_for_order','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(8,'otp_for_delivery_status','0','2026-09-19 17:05:07','2026-09-19 17:05:07'),
(9,'otp_for_paid_status','0','2026-09-19 17:05:07','2026-09-19 17:05:07');
/*!40000 ALTER TABLE `otp_configurations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` varchar(1000) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(50) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(20) NOT NULL DEFAULT 'due',
  `payment_details` text DEFAULT NULL,
  `txn_code` text DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES
(1,1,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,2,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,3,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,4,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,5,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,6,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,7,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,8,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,9,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,10,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,11,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,12,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,13,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,14,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,15,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,16,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,17,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,18,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,19,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,20,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,21,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,22,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,23,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,24,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,25,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,26,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,27,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,28,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,29,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,30,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,31,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,32,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,33,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,34,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,35,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,36,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,37,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,38,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,39,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,40,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,41,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,42,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,43,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,44,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,45,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,46,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,47,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,48,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,49,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,50,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,51,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,52,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,53,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,54,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,55,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,56,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,57,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,58,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,59,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,60,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,61,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,62,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,63,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,64,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,65,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,66,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,67,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,68,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,69,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,70,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,71,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,72,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,73,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,74,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,75,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,76,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,77,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,78,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,79,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,80,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,81,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,82,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,83,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,84,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(1,85,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(1,86,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(2,1,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,18,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,19,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,20,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,21,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,22,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,23,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,24,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,25,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,26,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,27,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,28,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,29,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,30,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,31,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,32,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,34,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,35,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,38,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,41,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,46,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,52,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,1,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,41,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,46,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,53,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,54,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,55,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,56,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,1,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,41,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,42,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,43,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,44,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,46,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,50,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,51,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,52,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,59,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,60,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,61,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,62,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,63,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,65,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,67,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,69,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,1,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,71,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,72,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,73,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,74,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,76,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,77,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,78,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,79,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,80,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,81,'2026-10-12 15:54:24','2026-10-12 15:54:24');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(150) NOT NULL,
  `name` varchar(191) NOT NULL,
  `group` varchar(100) NOT NULL DEFAULT 'general',
  `description` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`),
  KEY `permissions_group_index` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(1,'dashboard.view','مشاهده داشبورد مدیریت','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(2,'settings.view','مشاهده تنظیمات','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(3,'settings.update','ویرایش تنظیمات اصلی','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(4,'users.view','مشاهده کاربران','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(5,'users.create','ایجاد کاربر','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(6,'users.update','ویرایش کاربران','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(7,'users.delete','حذف کاربران','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(8,'roles.view','مشاهده نقش‌ها','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(9,'roles.create','ایجاد نقش','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(10,'roles.update','ویرایش نقش','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(11,'roles.delete','حذف نقش','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(12,'roles.assign','انتساب نقش به کاربران','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(13,'permissions.view','مشاهده فهرست مجوزها','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(14,'permissions.create','ایجاد مجوز جدید','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(15,'permissions.delete','حذف مجوز','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(16,'audit_logs.view','مشاهده گزارش‌های امنیتی و Audit Log','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(17,'security.reports.view','مشاهده گزارش‌های مدیریتی و امنیتی','سیستم و دسترسی‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(18,'products.view','مشاهده محصولات','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(19,'products.create','ایجاد محصول','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(20,'products.update','ویرایش محصول','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(21,'products.delete','حذف محصول','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(22,'products.publish','انتشار / غیرفعال‌سازی محصول','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(23,'categories.view','مشاهده دسته‌بندی‌ها','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(24,'categories.manage','مدیریت دسته‌بندی‌ها','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(25,'brands.view','مشاهده برندها','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(26,'brands.manage','مدیریت برندها','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(27,'stock.view','مشاهده موجودی','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(28,'stock.update','به‌روزرسانی موجودی','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(29,'products.images.manage','مدیریت تصاویر محصولات','فروشگاه — محصولات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(30,'orders.view','مشاهده سفارش‌ها','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(31,'orders.update','ویرایش سفارش‌ها','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(32,'orders.update_status','تغییر وضعیت سفارش','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(33,'orders.delete','حذف سفارش','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(34,'orders.invoice','دانلود فاکتور','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(35,'sales.reports.view','مشاهده گزارش‌های فروش','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(36,'sellers.view','مشاهده فروشندگان','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(37,'sellers.approve','تأیید / رد فروشندگان','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(38,'coupons.manage','مدیریت کدهای تخفیف','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(39,'withdraw_requests.view','مشاهده درخواست‌های تسویه','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(40,'withdraw_requests.approve','تأیید درخواست تسویه','فروشگاه — سفارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(41,'jewelry.dashboard.view','مشاهده داشبورد اشیاء قیمتی','جواهرات — مالکان',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(42,'jewelry.owners.view','مشاهده مالکان اشیاء','جواهرات — مالکان',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(43,'jewelry.owners.create','ثبت مالک جدید','جواهرات — مالکان',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(44,'jewelry.owners.update','ویرایش اطلاعات مالک','جواهرات — مالکان',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(45,'jewelry.owners.delete','حذف مالک','جواهرات — مالکان',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(46,'jewelry.certificates.view','مشاهده شناسنامه‌ها','جواهرات — شناسنامه',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(47,'jewelry.certificates.create','صدور شناسنامه جدید','جواهرات — شناسنامه',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(48,'jewelry.certificates.update','ویرایش شناسنامه','جواهرات — شناسنامه',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(49,'jewelry.certificates.delete','حذف شناسنامه','جواهرات — شناسنامه',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(50,'jewelry.certificates.verify','تأیید اصالت شناسنامه','جواهرات — شناسنامه',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(51,'jewelry.certificates.download','دانلود فایل شناسنامه','جواهرات — شناسنامه',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(52,'jewelry.certificates.print','چاپ شناسنامه','جواهرات — شناسنامه',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(53,'jewelry.repairs.view','مشاهده سفارش‌های تعمیر مجاز','جواهرات — تعمیرات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(54,'jewelry.repairs.create','ثبت سفارش تعمیر','جواهرات — تعمیرات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(55,'jewelry.repairs.update','ویرایش سفارش تعمیر','جواهرات — تعمیرات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(56,'jewelry.repairs.update_status','ثبت عیب، شرح تعمیر، هزینه و تغییر وضعیت','جواهرات — تعمیرات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(57,'jewelry.repairs.assign','تخصیص تکنسین به سفارش','جواهرات — تعمیرات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(58,'jewelry.repairs.delete','حذف سفارش تعمیر','جواهرات — تعمیرات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(59,'jewelry.transfers.view','مشاهده درخواست‌های انتقال مالکیت','جواهرات — مالکیت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(60,'jewelry.transfers.create','ثبت درخواست انتقال مالکیت','جواهرات — مالکیت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(61,'jewelry.transfers.approve','تأیید انتقال مالکیت','جواهرات — مالکیت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(62,'jewelry.transfers.reject','رد انتقال مالکیت','جواهرات — مالکیت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(63,'jewelry.transfers.cancel','لغو انتقال مالکیت','جواهرات — مالکیت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(64,'jewelry.transfers.delete','حذف درخواست انتقال (فقط رد/لغو شده)','جواهرات — مالکیت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(65,'jewelry.missing_reports.view','مشاهده گزارش‌های سرقت و مفقودی','جواهرات — سرقت و مفقودی',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(66,'jewelry.missing_reports.create','ثبت گزارش سرقت و مفقودی','جواهرات — سرقت و مفقودی',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(67,'jewelry.missing_reports.update_status','تغییر وضعیت گزارش','جواهرات — سرقت و مفقودی',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(68,'jewelry.missing_reports.print','چاپ گزارش','جواهرات — سرقت و مفقودی',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(69,'jewelry.reports.view','مشاهده گزارش‌های ماژول جواهرات','جواهرات — گزارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(70,'jewelry.reports.export','خروجی گرفتن از گزارش‌ها','جواهرات — گزارش‌ها',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(71,'articles.view','مشاهده همه مقالات','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(72,'articles.view_own','مشاهده مقالات خود','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(73,'articles.create','ایجاد مقاله','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(74,'articles.update','ویرایش مقاله','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(75,'articles.update_any','ویرایش مقاله‌های سایر نویسندگان','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(76,'articles.submit','ارسال مقاله برای بررسی','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(77,'articles.publish','انتشار / لغو انتشار مقاله','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(78,'articles.delete','حذف مقاله','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(79,'articles.categories.manage','مدیریت دسته‌بندی مقاله‌ها','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(80,'articles.images.manage','مدیریت تصاویر مقاله','مقالات',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(81,'pages.manage','مدیریت صفحات','محتوا و ظاهر سایت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(82,'sliders.manage','مدیریت اسلایدرها','محتوا و ظاهر سایت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(83,'banners.manage','مدیریت بنرها','محتوا و ظاهر سایت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(84,'policies.manage','مدیریت قوانین و مقررات','محتوا و ظاهر سایت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(85,'seo.manage','مدیریت تنظیمات SEO','محتوا و ظاهر سایت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23'),
(86,'languages.manage','مدیریت زبان‌ها','محتوا و ظاهر سایت',NULL,'2026-10-12 15:54:23','2026-10-12 15:54:23');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pickup_points`
--

DROP TABLE IF EXISTS `pickup_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` tinyint(4) DEFAULT NULL,
  `cash_on_pickup_status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_points`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pickup_points` WRITE;
/*!40000 ALTER TABLE `pickup_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickup_points` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `policies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `policies` WRITE;
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` VALUES
(1,'return_policy','<h3>شرایط مرجوعی و بازگشت کالا</h3>\n<p>رضایت شما برای ما مهم است. اگر کالای خریداری‌شده با سفارش شما مطابقت نداشت یا در جریان حمل آسیب دید، می‌توانید درخواست مرجوعی ثبت کنید.</p>\n<h4>شرایط پذیرش مرجوعی</h4>\n<ul>\n<li>کالا در بازه زمانی اعلام‌شده از سوی فروشگاه مرجوع می‌شود.</li>\n<li>کالا استفاده‌نشده باشد و بسته‌بندی اصلی آن باز یا آسیب ندیده باشد.</li>\n<li>لوازم مصرفی برش‌خورده، مانند روبان و نوار که به متر فروخته می‌شوند، قابل مرجوع نیستند؛ مگر معیوب باشند.</li>\n<li>فاکتور خرید یا کد سفارش ارائه شده باشد.</li>\n</ul>\n<h4>مراحل ثبت درخواست</h4>\n<ol>\n<li>وارد حساب کاربری خود شوید و به بخش تاریخچه خرید بروید.</li>\n<li>سفارش مورد نظر را انتخاب و درخواست مرجوعی ثبت کنید.</li>\n<li>پس از بررسی، نتیجه از طریق پنل کاربری به شما اطلاع داده می‌شود.</li>\n</ol>\n<p>هزینه ارسال مرجوعی در صورتی که کالا معیوب یا اشتباه ارسال شده باشد، بر عهده فروشگاه است.</p>',NULL,NULL),
(2,'terms_conditions','<h3>قوانین و مقررات فروشگاه</h3>\n<p>استفاده از فروشگاه اینترنتی خرازی پرنسا به معنای پذیرش قوانین زیر است. لطفاً پیش از خرید آن‌ها را مطالعه کنید.</p>\n<h4>۱. حساب کاربری</h4>\n<p>مسئولیت حفظ رمز عبور و صحت اطلاعات وارد‌شده در حساب کاربری بر عهده کاربر است.</p>\n<h4>۲. قیمت و موجودی</h4>\n<p>قیمت‌ها و موجودی کالاها به‌صورت مستمر به‌روزرسانی می‌شود. در صورت ناموجود شدن کالا پس از ثبت سفارش، مبلغ پرداختی به‌طور کامل بازگردانده می‌شود.</p>\n<h4>۳. ثبت سفارش</h4>\n<p>سفارش پس از تأیید پرداخت نهایی می‌شود. مبلغ نهایی — شامل جمع کالاها، تخفیف، مالیات و هزینه ارسال — در سرور فروشگاه محاسبه و تأیید می‌شود.</p>\n<h4>۴. مالکیت معنوی</h4>\n<p>تمام محتوای این سایت، شامل متن‌ها، تصاویر و نشان تجاری، متعلق به فروشگاه است و بازنشر آن بدون اجازه کتبی مجاز نیست.</p>\n<h4>۵. تغییر قوانین</h4>\n<p>فروشگاه حق به‌روزرسانی این قوانین را دارد. نسخه معتبر، همین متنی است که در این صفحه منتشر می‌شود.</p>',NULL,NULL),
(3,'privacy_policy','<h3>حریم خصوصی</h3>\n<p>فروشگاه خرازی پرنسا متعهد است اطلاعات شخصی کاربران خود را محافظت کند. این صفحه توضیح می‌دهد چه اطلاعاتی جمع‌آوری می‌شود و چگونه از آن استفاده می‌کنیم.</p>\n<h4>اطلاعاتی که جمع‌آوری می‌کنیم</h4>\n<ul>\n<li>نام، شماره تماس و نشانی، برای پردازش و ارسال سفارش.</li>\n<li>نشانی رایانامه (ایمیل)، برای اطلاع‌رسانی وضعیت سفارش و بازیابی رمز عبور.</li>\n<li>اطلاعات سفارش‌ها، برای نگهداری تاریخچه خرید در پنل کاربری.</li>\n</ul>\n<h4>نحوه استفاده از اطلاعات</h4>\n<p>اطلاعات شما تنها برای انجام سفارش، پشتیبانی و بهبود خدمات فروشگاه استفاده می‌شود. اطلاعات کارت بانکی شما هرگز در سرور فروشگاه ذخیره نمی‌شود؛ پرداخت‌ها از طریق درگاه بانکی معتبر انجام می‌گیرد.</p>\n<h4>اشتراک‌گذاری اطلاعات</h4>\n<p>اطلاعات شما بدون رضایت، در اختیار اشخاص ثالث قرار نمی‌گیرد؛ به‌جز شرکت حمل، که تنها نشانی و شماره تماس برای تحویل مرسوله دریافت می‌کند.</p>\n<h4>حقوق شما</h4>\n<p>می‌توانید در هر زمان اطلاعات حساب خود را از طریق پنل کاربری ویرایش کنید یا درخواست حذف حساب خود را با پشتیبانی فروشگاه در میان بگذارید.</p>',NULL,NULL),
(4,'support_policy','<h3>پشتیبانی و خدمات پس از فروش</h3>\n<p>تیم پشتیبانی فروشگاه خرازی پرنسا آماده پاسخ‌گویی به پرسش‌های شما درباره محصولات، سفارش‌ها و شیوه‌های ارسال است.</p>\n<h4>راه‌های ارتباط</h4>\n<ul>\n<li>ثبت تیکت در بخش «پشتیبانی» پنل کاربری — پیگیری این روش ساده‌تر است.</li>\n<li>تماس تلفنی با شماره‌ای که در صفحه تماس با ما درج شده است.</li>\n<li>استفاده از فرم تماس با ما برای پرسش‌های عمومی.</li>\n</ul>\n<h4>زمان پاسخ‌گویی</h4>\n<p>تیکت‌های ثبت‌شده در روزهای کاری فروشگاه بررسی می‌شوند. برای سفارش‌های عمده و نیاز کارگاه‌های خیاطی، پیش از ثبت سفارش با ما هماهنگ کنید.</p>\n<h4>خدمات پس از فروش</h4>\n<p>در صورت بروز مشکل در کالای دریافتی، پس از ثبت درخواست، موضوع بررسی و مطابق شرایط مرجوعی پیگیری می‌شود.</p>',NULL,NULL),
(5,'seller_policy','<h3>قوانین و شرایط فروشندگان</h3>\n<p>فروشگاه خرازی پرنسا امکان فعالیت فروشندگان و تأمین‌کنندگان لوازم خیاطی و هنری را فراهم می‌کند. این صفحه شرایط همکاری را توضیح می‌دهد.</p>\n<h4>ثبت‌نام فروشنده</h4>\n<p>برای شروع همکاری، از مسیر «فروشنده شوید» فرم درخواست را تکمیل کنید. پس از بررسی اطلاعات، نتیجه به شما اعلام می‌شود.</p>\n<h4>تعهدات فروشنده</h4>\n<ul>\n<li>ارائه اطلاعات صحیح و کامل درباره کالا: جنس، اندازه، تعداد در بسته و واحد فروش.</li>\n<li>رعایت قیمت اعلام‌شده و به‌روز نگه‌داشتن موجودی انبار.</li>\n<li>ارسال به‌موقع کالاهای فروخته‌شده.</li>\n<li>رعایت حقوق مشتری و پاسخ‌گویی به پرسش‌ها.</li>\n</ul>\n<h4>کمیسیون فروش</h4>\n<p>درصد کمیسیون فروشگاه بر اساس تنظیمات هر دسته‌بندی تعیین می‌شود و پیش از شروع همکاری به اطلاع فروشنده می‌رسد.</p>\n<h4>تسویه</h4>\n<p>درخواست تسویه از پنل فروشنده ثبت می‌شود و پس از بررسی، مبلغ به حساب فروشنده واریز می‌گردد.</p>',NULL,NULL);
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_stocks`
--

DROP TABLE IF EXISTS `product_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_stocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stocks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_stocks` WRITE;
/*!40000 ALTER TABLE `product_stocks` DISABLE KEYS */;
INSERT INTO `product_stocks` VALUES
(2,61,'LightPink',NULL,850000000.00,10,NULL,'2026-09-09 09:59:35','2026-09-09 09:59:35'),
(4,63,'LightPink',NULL,450000000.00,10,NULL,'2026-09-09 10:06:34','2026-09-09 10:06:34'),
(5,63,'Silver',NULL,450000000.00,10,NULL,'2026-09-09 10:06:34','2026-09-09 10:06:34'),
(6,64,'Blue',NULL,580000000.00,10,NULL,'2026-09-09 10:07:41','2026-09-09 10:07:41'),
(7,64,'Silver',NULL,580000000.00,10,NULL,'2026-09-09 10:07:41','2026-09-09 10:07:41'),
(8,65,'Blue',NULL,590000000.00,10,NULL,'2026-09-09 10:10:16','2026-09-09 10:10:16'),
(9,65,'Silver',NULL,590000000.00,10,NULL,'2026-09-09 10:10:16','2026-09-09 10:10:16'),
(10,66,'Blue',NULL,980000000.00,10,NULL,'2026-09-09 10:16:04','2026-09-09 10:16:04'),
(11,66,'Gold',NULL,980000000.00,10,NULL,'2026-09-09 10:16:04','2026-09-09 10:16:04'),
(12,67,'Green',NULL,750000000.00,10,NULL,'2026-09-09 10:17:05','2026-09-09 10:17:05'),
(13,67,'Silver',NULL,750000000.00,10,NULL,'2026-09-09 10:17:05','2026-09-09 10:17:05'),
(14,68,'Gold',NULL,820000000.00,10,NULL,'2026-09-09 10:17:54','2026-09-09 10:17:54'),
(15,68,'Silver',NULL,820000000.00,10,NULL,'2026-09-09 10:17:54','2026-09-09 10:17:54'),
(16,69,'Chocolate',NULL,880000000.00,10,NULL,'2026-09-09 10:18:53','2026-09-09 10:18:53'),
(17,69,'LightPink',NULL,880000000.00,10,NULL,'2026-09-09 10:18:53','2026-09-09 10:18:53'),
(18,70,'Silver',NULL,65000000.00,10,NULL,'2026-09-09 10:20:03','2026-09-09 10:20:03'),
(19,72,'Black',NULL,55000000.00,10,NULL,'2026-09-09 10:20:46','2026-09-09 10:20:46'),
(20,72,'Gold',NULL,55000000.00,10,NULL,'2026-09-09 10:20:46','2026-09-09 10:20:46'),
(21,73,'Silver',NULL,38000000.00,10,NULL,'2026-09-09 10:22:38','2026-09-09 10:22:38'),
(22,73,'White',NULL,38000000.00,10,NULL,'2026-09-09 10:22:38','2026-09-09 10:22:38'),
(24,75,'LightPink',NULL,35000000.00,10,NULL,'2026-09-09 10:24:14','2026-09-09 10:24:14'),
(25,75,'Silver',NULL,35000000.00,10,NULL,'2026-09-09 10:24:14','2026-09-09 10:24:14'),
(26,76,'Black',NULL,62000000.00,10,NULL,'2026-09-09 10:25:41','2026-09-09 10:25:41'),
(27,77,'Black',NULL,72000000.00,10,NULL,'2026-09-09 10:26:33','2026-09-09 10:26:33'),
(28,77,'Gold',NULL,72000000.00,10,NULL,'2026-09-09 10:26:33','2026-09-09 10:26:33'),
(29,78,'Black',NULL,60000000.00,10,NULL,'2026-09-09 10:27:30','2026-09-09 10:27:30'),
(30,79,'Black',NULL,85000000.00,10,NULL,'2026-09-09 10:28:22','2026-09-09 10:28:22'),
(31,79,'Gold',NULL,85000000.00,10,NULL,'2026-09-09 10:28:22','2026-09-09 10:28:22'),
(32,81,'Silver',NULL,28000000.00,10,NULL,'2026-09-09 10:29:24','2026-09-09 10:29:24'),
(33,81,'White',NULL,28000000.00,10,NULL,'2026-09-09 10:29:24','2026-09-09 10:29:24'),
(34,80,'Gold',NULL,95000000.00,10,NULL,'2026-09-09 10:30:14','2026-09-09 10:30:14'),
(35,80,'SaddleBrown',NULL,95000000.00,10,NULL,'2026-09-09 10:30:14','2026-09-09 10:30:14'),
(36,82,'White',NULL,48000000.00,10,NULL,'2026-09-09 10:31:35','2026-09-09 10:31:35'),
(37,8,'White',NULL,19500000.00,10,NULL,'2026-09-09 10:32:58','2026-09-09 10:32:58'),
(38,28,'White',NULL,16500000.00,10,NULL,'2026-09-09 10:34:13','2026-09-09 10:34:13'),
(40,62,'Silver',NULL,120000000.00,10,NULL,'2026-09-09 10:40:03','2026-09-09 10:40:03'),
(41,74,'White',NULL,42000000.00,10,NULL,'2026-09-09 10:41:50','2026-09-09 10:41:50'),
(42,83,'White',NULL,38000000.00,10,NULL,'2026-09-09 10:44:49','2026-09-09 10:44:49');
/*!40000 ALTER TABLE `product_stocks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `added_by` varchar(6) NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) DEFAULT NULL,
  `thumbnail_img` varchar(100) DEFAULT NULL,
  `featured_img` varchar(100) DEFAULT NULL,
  `flash_deal_img` varchar(100) DEFAULT NULL,
  `video_provider` varchar(20) DEFAULT NULL,
  `video_link` varchar(100) DEFAULT NULL,
  `tags` mediumtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `unit_price` double(12,0) NOT NULL,
  `purchase_price` double(12,0) NOT NULL,
  `variant_product` int(11) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) NOT NULL DEFAULT '[]',
  `choice_options` mediumtext DEFAULT NULL,
  `colors` mediumtext DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(20) DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(10) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `tax_type` varchar(10) DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'flat_rate',
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_img` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `slug` mediumtext NOT NULL,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) DEFAULT NULL,
  `digital` int(11) NOT NULL DEFAULT 0,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'انگشتر نامزدی آکوامارین هاله الماس | مدل 17830','admin',12,104,1043,132,1,'[\"uploads/products/photos/aquamarine-diamond-halo-engagement-floral-ring__17830.jpg\"]','uploads/products/thumbnail/aquamarine-diamond-halo-engagement-floral-ring__17830.jpg','uploads/products/featured/aquamarine-diamond-halo-engagement-floral-ring__17830.jpg','uploads/products/flash_deal/aquamarine-diamond-halo-engagement-floral-ring__17830.jpg','youtube',NULL,'آکوامارین, هاله الماس, انگشتر نامزدی, مدل 17830','انگشتر نامزدی با سنگ مرکزی آکوامارین بیضی شکل 1.5 قیراطی و هاله‌ای از الماس‌های برلیان دور آن. طراحی گل‌مانند با ظرافت کامل. قاب از طلای سفید 18 عیار.',12500000,9800000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,5,'عدد',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین هاله الماس مدل 17830','خرید انگشتر نامزدی آکوامارین 1.5 قیراطی با هاله الماس و قاب طلای سفید 18 عیار','uploads/products/meta/aquamarine-diamond-halo-engagement-floral-ring__17830.jpg',NULL,'angoshtar-akvamarin-hale-almas-17830',0.00,'17830',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(2,'انگشتر نامزدی آکوامارین وینتیج | مدل 82099','admin',12,104,1043,132,2,'[\"uploads/products/photos/aquamarine-diamond-vintage-engagement-ring__82099.jpg\"]','uploads/products/thumbnail/aquamarine-diamond-vintage-engagement-ring__82099.jpg','uploads/products/featured/aquamarine-diamond-vintage-engagement-ring__82099.jpg','uploads/products/flash_deal/aquamarine-diamond-vintage-engagement-ring__82099.jpg','youtube',NULL,'آکوامارین, وینتیج, انگشتر نامزدی, مدل 82099','انگشتر نامزدی با سنگ آکوامارین کوسنی 2 قیراطی در قاب طلای رزگلد 18 عیار با حکاکی‌های وینتیج و الماس‌های کوچک در حاشیه.',18500000,14200000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,3,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر وینتیج آکوامارین مدل 82099','خرید انگشتر نامزدی آکوامارین کوسنی 2 قیراطی با طراحی وینتیج و قاب رزگلد','uploads/products/meta/aquamarine-diamond-vintage-engagement-ring__82099.jpg',NULL,'angoshtar-vintij-akvamarin-82099',0.00,'82099',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(3,'انگشتر آکوامارین هاله اسپلیت | مدل 69931','admin',12,104,1043,132,3,'[\"uploads/products/photos/aquamarine_diamond_cocktail_halo_split_ring__69931.jpg\"]','uploads/products/thumbnail/aquamarine_diamond_cocktail_halo_split_ring__69931.jpg','uploads/products/featured/aquamarine_diamond_cocktail_halo_split_ring__69931.jpg','uploads/products/flash_deal/aquamarine_diamond_cocktail_halo_split_ring__69931.jpg','youtube',NULL,'آکوامارین, هاله اسپلیت, انگشتر کاکتلی, مدل 69931','انگشتر کاکتلی با سنگ آکوامارین گرد 1.8 قیراطی و هاله اسپلیت (شکسته) از الماس‌های ریز. قاب طلای سفید 18 عیار با طراحی مدرن.',9800000,7500000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,7,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین هاله اسپلیت مدل 69931','خرید انگشتر کاکتلی آکوامارین با طراحی مدرن هاله اسپلیت و قاب طلای سفید','uploads/products/meta/aquamarine_diamond_cocktail_halo_split_ring__69931.jpg',NULL,'angoshtar-akvamarin-hale-split-69931',0.00,'69931',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(4,'ست انگشتر نامزدی آکوامارین هاله | مدل 61174','admin',12,104,1043,132,1,'[\"uploads/products/photos/aquamarine_halo_matching_engagement_ring_set-2__61174.jpg\"]','uploads/products/thumbnail/aquamarine_halo_matching_engagement_ring_set-2__61174.jpg','uploads/products/featured/aquamarine_halo_matching_engagement_ring_set-2__61174.jpg','uploads/products/flash_deal/aquamarine_halo_matching_engagement_ring_set-2__61174.jpg','youtube',NULL,'آکوامارین, ست نامزدی, هاله الماس, مدل 61174','ست کامل انگشتر نامزدی و حلقه ازدواج با سنگ آکوامارین بیضی 1.2 قیراطی و هاله الماس دور آن. قاب طلای سفید 18 عیار با طراحی هماهنگ.',22000000,17000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,4,'ست',12.00,'percent',0.00,'amount','flat_rate',150000.00,0,'ست انگشتر آکوامارین هاله مدل 61174','خرید ست انگشتر نامزدی و حلقه ازدواج آکوامارین با هاله الماس','uploads/products/meta/aquamarine_halo_matching_engagement_ring_set-2__61174.jpg',NULL,'set-angoshtar-akvamarin-hale-61174',0.00,'61174',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(5,'انگشتر آکوامارین هاله برجسته کوسنی | مدل 75986','admin',12,104,1043,132,2,'[\"uploads/products/photos/blue-cushion-aquamarine-raised-diamond-halo-engagement-ring__75986.jpg\"]','uploads/products/thumbnail/blue-cushion-aquamarine-raised-diamond-halo-engagement-ring__75986.jpg','uploads/products/featured/blue-cushion-aquamarine-raised-diamond-halo-engagement-ring__75986.jpg','uploads/products/flash_deal/blue-cushion-aquamarine-raised-diamond-halo-engagement-ring__75986.jpg','youtube',NULL,'آکوامارین کوسنی, هاله برجسته, انگشتر نامزدی, مدل 75986','انگشتر نامزدی با سنگ آکوامارین کوسنی 2.2 قیراطی و هاله الماس برجسته (raised halo) که سنگ را بالاتر از قاب نشان می‌دهد. قاب طلای رزگلد 18 عیار.',24000000,18500000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,3,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین کوسنی هاله برجسته مدل 75986','خرید انگشتر آکوامارین کوسنی 2.2 قیراطی با هاله الماس برجسته','uploads/products/meta/blue-cushion-aquamarine-raised-diamond-halo-engagement-ring__75986.jpg',NULL,'angoshtar-akvamarin-kosni-hale-barjaste-75986',0.00,'75986',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(6,'انگشتر آکوامارین طناب تابیده کوسنی | مدل 28756','admin',12,104,1043,132,3,'[\"uploads/products/photos/cushion-aquamarine-twisted-rope-halo-engagement-promise-ring__28756.jpg\"]','uploads/products/thumbnail/cushion-aquamarine-twisted-rope-halo-engagement-promise-ring__28756.jpg','uploads/products/featured/cushion-aquamarine-twisted-rope-halo-engagement-promise-ring__28756.jpg','uploads/products/flash_deal/cushion-aquamarine-twisted-rope-halo-engagement-promise-ring__28756.jpg','youtube',NULL,'آکوامارین کوسنی, طناب تابیده, انگشتر, مدل 28756','انگشتر با سنگ آکوامارین کوسنی 1.8 قیراطی و هاله الماس با قاب طناب تابیده (twisted rope) از طلای زرد 18 عیار. طراحی رمانتیک و کلاسیک.',16500000,12500000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,0,6,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین طناب تابیده مدل 28756','خرید انگشتر آکوامارین کوسنی با قاب طناب تابیده و هاله الماس','uploads/products/meta/cushion-aquamarine-twisted-rope-halo-engagement-promise-ring__28756.jpg',NULL,'angoshtar-akvamarin-tanab-tabide-28756',0.00,'28756',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(7,'انگشتر آکوامارین هاله دبل کوسنی | مدل 59717','admin',12,104,1043,132,1,'[\"uploads/products/photos/cushion-cut-aquamarine-and-diamond-double-halo-statement-ring__59717.jpg\"]','uploads/products/thumbnail/cushion-cut-aquamarine-and-diamond-double-halo-statement-ring__59717.jpg','uploads/products/featured/cushion-cut-aquamarine-and-diamond-double-halo-statement-ring__59717.jpg','uploads/products/flash_deal/cushion-cut-aquamarine-and-diamond-double-halo-statement-ring__59717.jpg','youtube',NULL,'آکوامارین کوسنی, دبل هاله, انگشتر استیتمنت, مدل 59717','انگشتر استیتمنت با سنگ آکوامارین کوسنی 3 قیراطی و دو هاله الماس (دبل هاله) دور آن. قاب پلاتین با طراحی چشمگیر و لوکس.',35000000,27000000,0,'[]','[]','[\"#E5E4E2\"]',NULL,1,1,1,2,'عدد',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین دبل هاله مدل 59717','خرید انگشتر استیتمنت آکوامارین 3 قیراطی با دو هاله الماس','uploads/products/meta/cushion-cut-aquamarine-and-diamond-double-halo-statement-ring__59717.jpg',NULL,'angoshtar-akvamarin-doble-hale-59717',0.00,'59717',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(8,'انگشتر آکوامارین وینتیج کوسنی | مدل 88335','admin',12,6,110,141,19,'[\"uploads\\/products\\/photos\\/cushion-cut-aquamarine-diamond-halo-engagement-ring-set-vintage-style__88335.jpg\"]','uploads/products/thumbnail/ysqh5ydGFouSwQkovDDXE413NCnPXrUMO3oeBLlt.jpg','uploads/products/featured/VrqYOn0fkU2fL7haTW3SwNSRhKtO2ezTkTpeWfOS.jpg','uploads/products/flash_deal/BzvBXWzeUHPgVeYsjgN7ut2JNtgzYxO7Yynhat51.jpg','youtube',NULL,'آکوامارین کوسنی, وینتیج, ست نامزدی, مدل 88335','ست انگشتر نامزدی و حلقه ازدواج با سنگ آکوامارین کوسنی 1.5 قیراطی و هاله الماس در قاب وینتیج طلای سفید 18 عیار با حکاکی‌های ظریف.',19500000,15000000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,4,'ست',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'ست انگشتر وینتیج آکوامارین مدل 88335','خرید ست انگشتر نامزدی آکوامارین کوسنی با طراحی وینتیج','uploads/products/meta/cushion-cut-aquamarine-diamond-halo-engagement-ring-set-vintage-style__88335.jpg',NULL,'انگشتر-آکوامارین-وینتیج-کوسنی-|-مدل-88335-28DnY',0.00,NULL,0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 10:32:58'),
(9,'انگشتر آکوامارین کوسنی سولیتر | مدل 67105','admin',12,104,1043,132,3,'[\"uploads/products/photos/cushion-cut-blue-aquamarine-diamond-statetemt-ring__67105.jpg\"]','uploads/products/thumbnail/cushion-cut-blue-aquamarine-diamond-statetemt-ring__67105.jpg','uploads/products/featured/cushion-cut-blue-aquamarine-diamond-statetemt-ring__67105.jpg','uploads/products/flash_deal/cushion-cut-blue-aquamarine-diamond-statetemt-ring__67105.jpg','youtube',NULL,'آکوامارین کوسنی, سولیتر, انگشتر استیتمنت, مدل 67105','انگشتر سولیتر با سنگ آکوامارین کوسنی 2.5 قیراطی و الماس‌های کوچک در چهار گوشه. قاب طلای زرد 18 عیار با طراحی مینیمال و مدرن.',28000000,21500000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,1,3,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین کوسنی سولیتر مدل 67105','خرید انگشتر سولیتر آکوامارین کوسنی 2.5 قیراطی با الماس','uploads/products/meta/cushion-cut-blue-aquamarine-diamond-statetemt-ring__67105.jpg',NULL,'angoshtar-akvamarin-kosni-soliter-67105',0.00,'67105',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(10,'انگشتر آکوامارین رزگلد سولیتر | مدل 39745','admin',12,104,1043,132,1,'[\"uploads/products/photos/cushion-cut-blue-aquamarine-rose-gold-solitaire-ring__39745.jpg\"]','uploads/products/thumbnail/cushion-cut-blue-aquamarine-rose-gold-solitaire-ring__39745.jpg','uploads/products/featured/cushion-cut-blue-aquamarine-rose-gold-solitaire-ring__39745.jpg','uploads/products/flash_deal/cushion-cut-blue-aquamarine-rose-gold-solitaire-ring__39745.jpg','youtube',NULL,'آکوامارین کوسنی, رزگلد, سولیتر, مدل 39745','انگشتر سولیتر با سنگ آکوامارین کوسنی 1.8 قیراطی در قاب طلای رزگلد 18 عیار. طراحی ساده و شیک با تمرکز بر زیبایی سنگ.',15500000,12000000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,0,5,'عدد',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین رزگلد سولیتر مدل 39745','خرید انگشتر سولیتر آکوامارین کوسنی با قاب رزگلد','uploads/products/meta/cushion-cut-blue-aquamarine-rose-gold-solitaire-ring__39745.jpg',NULL,'angoshtar-akvamarin-rozgold-soliter-39745',0.00,'39745',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(11,'انگشتر آکوامارین کوسنی سولیتر | مدل 62830','admin',12,104,1043,132,2,'[\"uploads/products/photos/cushion-cut-blue-aquamarine-solitaire-engagement-ring__62830.jpg\"]','uploads/products/thumbnail/cushion-cut-blue-aquamarine-solitaire-engagement-ring__62830.jpg','uploads/products/featured/cushion-cut-blue-aquamarine-solitaire-engagement-ring__62830.jpg','uploads/products/flash_deal/cushion-cut-blue-aquamarine-solitaire-engagement-ring__62830.jpg','youtube',NULL,'آکوامارین کوسنی, سولیتر, انگشتر نامزدی, مدل 62830','انگشتر نامزدی سولیتر با سنگ آکوامارین کوسنی 1.2 قیراطی. قاب طلای سفید 18 عیار با چهار چنگک ساده و طراحی کلاسیک.',12500000,9500000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,8,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین کوسنی سولیتر مدل 62830','خرید انگشتر نامزدی سولیتر آکوامارین کوسنی 1.2 قیراطی','uploads/products/meta/cushion-cut-blue-aquamarine-solitaire-engagement-ring__62830.jpg',NULL,'angoshtar-akvamarin-kosni-soliter-62830',0.00,'62830',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(12,'ست انگشتر نامزدی آکوامارین کوسنی | مدل 45670','admin',12,104,1043,132,3,'[\"uploads/products/photos/cushion_cut_blue_aquamarine_engagement_wedding_matching_ring_set__45670.jpg\"]','uploads/products/thumbnail/cushion_cut_blue_aquamarine_engagement_wedding_matching_ring_set__45670.j','uploads/products/featured/cushion_cut_blue_aquamarine_engagement_wedding_matching_ring_set__45670.jp','uploads/products/flash_deal/cushion_cut_blue_aquamarine_engagement_wedding_matching_ring_set__45670.','youtube',NULL,'آکوامارین کوسنی, ست نامزدی, حلقه ازدواج, مدل 45670','ست کامل انگشتر نامزدی و حلقه ازدواج با سنگ آکوامارین کوسنی 1 قیراطی. قاب طلای سفید 18 عیار با طراحی هماهنگ و مینیمال.',18500000,14000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,5,'ست',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'ست انگشتر آکوامارین کوسنی مدل 45670','خرید ست انگشتر نامزدی و حلقه ازدواج آکوامارین کوسنی','uploads/products/meta/cushion_cut_blue_aquamarine_engagement_wedding_matching_ring_set__45670.jpg',NULL,'set-angoshtar-akvamarin-kosni-45670',0.00,'45670',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(13,'انگشتر آکوامارین هاله استیتمنت | مدل 09292','admin',12,104,1043,132,1,'[\"uploads/products/photos/blue-aquamarine-and-diamond-halo-statement-ring__09292.jpg\"]','uploads/products/thumbnail/blue-aquamarine-and-diamond-halo-statement-ring__09292.jpg','uploads/products/featured/blue-aquamarine-and-diamond-halo-statement-ring__09292.jpg','uploads/products/flash_deal/blue-aquamarine-and-diamond-halo-statement-ring__09292.jpg','youtube',NULL,'آکوامارین, هاله الماس, استیتمنت, مدل 09292','انگشتر استیتمنت با سنگ آکوامارین بیضی 2 قیراطی و هاله الماس دور آن. قاب طلای سفید 18 عیار با طراحی مدرن و چشمگیر.',21000000,16000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,3,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین هاله استیتمنت مدل 09292','خرید انگشتر استیتمنت آکوامارین 2 قیراطی با هاله الماس','uploads/products/meta/blue-aquamarine-and-diamond-halo-statement-ring__09292.jpg',NULL,'angoshtar-akvamarin-hale-09292',0.00,'09292',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(14,'انگشتر آکوامارین و الماس ۳ سنگه | مدل 63219','admin',12,104,1043,132,2,'[\"uploads/products/photos/blue-aquamarine-and-diamonds-engagement-ring__63219.jpg\"]','uploads/products/thumbnail/blue-aquamarine-and-diamonds-engagement-ring__63219.jpg','uploads/products/featured/blue-aquamarine-and-diamonds-engagement-ring__63219.jpg','uploads/products/flash_deal/blue-aquamarine-and-diamonds-engagement-ring__63219.jpg','youtube',NULL,'آکوامارین, ۳ سنگه, انگشتر نامزدی, مدل 63219','انگشتر نامزدی با سه سنگ شامل آکوامارین بیضی 1.8 قیراطی در مرکز و دو الماس مثلثی در دو طرف. قاب طلای رزگلد 18 عیار.',23000000,17500000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,4,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین ۳ سنگه مدل 63219','خرید انگشتر نامزدی آکوامارین ۳ سنگه با الماس','uploads/products/meta/blue-aquamarine-and-diamonds-engagement-ring__63219.jpg',NULL,'angoshtar-akvamarin-3-sange-63219',0.00,'63219',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(15,'انگشتر آکوامارین ۳ سنگه کلاسیک | مدل 66964','admin',12,104,1043,132,3,'[\"uploads/products/photos/blue-aquamarine-diamond-3-stone-engagement-ring__66964.jpg\"]','uploads/products/thumbnail/blue-aquamarine-diamond-3-stone-engagement-ring__66964.jpg','uploads/products/featured/blue-aquamarine-diamond-3-stone-engagement-ring__66964.jpg','uploads/products/flash_deal/blue-aquamarine-diamond-3-stone-engagement-ring__66964.jpg','youtube',NULL,'آکوامارین, ۳ سنگه کلاسیک, انگشتر نامزدی, مدل 66964','انگشتر نامزدی ۳ سنگه با سنگ مرکزی آکوامارین گرد 1.5 قیراطی و دو الماس گرد کوچکتر در دو طرف. قاب طلای سفید 18 عیار.',19500000,15000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,5,'عدد',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین ۳ سنگه کلاسیک مدل 66964','خرید انگشتر نامزدی ۳ سنگه آکوامارین کلاسیک','uploads/products/meta/blue-aquamarine-diamond-3-stone-engagement-ring__66964.jpg',NULL,'angoshtar-akvamarin-3-sange-klasik-66964',0.00,'66964',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(16,'انگشتر آکوامارین سولیتر | مدل 89396','admin',12,104,1043,132,1,'[\"uploads/products/photos/blue-aquamarine-diamond-solitaire-engagement-ring__89396.jpg\"]','uploads/products/thumbnail/blue-aquamarine-diamond-solitaire-engagement-ring__89396.jpg','uploads/products/featured/blue-aquamarine-diamond-solitaire-engagement-ring__89396.jpg','uploads/products/flash_deal/blue-aquamarine-diamond-solitaire-engagement-ring__89396.jpg','youtube',NULL,'آکوامارین, سولیتر, انگشتر نامزدی, مدل 89396','انگشتر سولیتر با سنگ آکوامارین بیضی 1.3 قیراطی و چهار چنگک الماس‌نشان. قاب طلای سفید 18 عیار با طراحی مینیمال.',14500000,11000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,6,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین سولیتر مدل 89396','خرید انگشتر سولیتر آکوامارین 1.3 قیراطی با الماس','uploads/products/meta/blue-aquamarine-diamond-solitaire-engagement-ring__89396.jpg',NULL,'angoshtar-akvamarin-soliter-89396',0.00,'89396',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(17,'انگشتر مارکیز آکوامارین وینتیج | مدل 75038','admin',12,104,1043,132,2,'[\"uploads/products/photos/marquise-cut-aquamarine-vintage-halo-engagement-ring__75038.jpg\"]','uploads/products/thumbnail/marquise-cut-aquamarine-vintage-halo-engagement-ring__75038.jpg','uploads/products/featured/marquise-cut-aquamarine-vintage-halo-engagement-ring__75038.jpg','uploads/products/flash_deal/marquise-cut-aquamarine-vintage-halo-engagement-ring__75038.jpg','youtube',NULL,'آکوامارین مارکیز, وینتیج, انگشتر نامزدی, مدل 75038','انگشتر نامزدی با سنگ آکوامارین مارکیز (نوک تیز) 1.8 قیراطی و هاله الماس وینتیج. قاب طلای زرد 18 عیار با حکاکی‌های ظریف.',17500000,13500000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,1,4,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین مارکیز وینتیج مدل 75038','خرید انگشتر نامزدی آکوامارین مارکیز با هاله وینتیج','uploads/products/meta/marquise-cut-aquamarine-vintage-halo-engagement-ring__75038.jpg',NULL,'angoshtar-akvamarin-markiz-vintij-75038',0.00,'75038',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(18,'انگشتر آکوامارین بیضی وینتیج | مدل 56938','admin',12,104,1043,132,3,'[\"uploads/products/photos/oval-aquamarine-and-diamond-vintage-engagement-ring__56938.jpg\"]','uploads/products/thumbnail/oval-aquamarine-and-diamond-vintage-engagement-ring__56938.jpg','uploads/products/featured/oval-aquamarine-and-diamond-vintage-engagement-ring__56938.jpg','uploads/products/flash_deal/oval-aquamarine-and-diamond-vintage-engagement-ring__56938.jpg','youtube',NULL,'آکوامارین بیضی, وینتیج, انگشتر نامزدی, مدل 56938','انگشتر نامزدی با سنگ آکوامارین بیضی 1.6 قیراطی و الماس‌های ریز در حاشیه با طراحی وینتیج. قاب طلای سفید 18 عیار.',16500000,12500000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,5,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین بیضی وینتیج مدل 56938','خرید انگشتر نامزدی آکوامارین بیضی با طراحی وینتیج','uploads/products/meta/oval-aquamarine-and-diamond-vintage-engagement-ring__56938.jpg',NULL,'angoshtar-akvamarin-beizi-vintij-56938',0.00,'56938',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(19,'انگشتر آکوامارین بزل ست طلای زرد | مدل 14918','admin',12,104,1043,132,1,'[\"uploads/products/photos/oval-aquamarine-bezel-set-ring-14k-yellow-gold__14918.jpg\"]','uploads/products/thumbnail/oval-aquamarine-bezel-set-ring-14k-yellow-gold__14918.jpg','uploads/products/featured/oval-aquamarine-bezel-set-ring-14k-yellow-gold__14918.jpg','uploads/products/flash_deal/oval-aquamarine-bezel-set-ring-14k-yellow-gold__14918.jpg','youtube',NULL,'آکوامارین بیضی, بزل ست, طلای زرد, مدل 14918','انگشتر با سنگ آکوامارین بیضی 1.2 قیراطی در قاب بزل (bezelset) طلای زرد ۱۴ عیار. طراحی مدرن و مینیمال با محافظت کامل از سنگ.',12000000,9000000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,0,7,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین بزل ست طلای زرد مدل 14918','خرید انگشتر آکوامارین بیضی با قاب بزل طلای زرد','uploads/products/meta/oval-aquamarine-bezel-set-ring-14k-yellow-gold__14918.jpg',NULL,'angoshtar-akvamarin-bezel-set-14918',0.00,'14918',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(20,'انگشتر آکوامارین بیضی وینتیج | مدل 13008','admin',12,104,1043,132,2,'[\"uploads/products/photos/oval-aquamarine-diamond-vintage-engagement-ring__13008.jpg\"]','uploads/products/thumbnail/oval-aquamarine-diamond-vintage-engagement-ring__13008.jpg','uploads/products/featured/oval-aquamarine-diamond-vintage-engagement-ring__13008.jpg','uploads/products/flash_deal/oval-aquamarine-diamond-vintage-engagement-ring__13008.jpg','youtube',NULL,'آکوامارین بیضی, وینتیج, انگشتر نامزدی, مدل 13008','انگشتر نامزدی با سنگ آکوامارین بیضی 1.4 قیراطی و الماس‌های ریز در قاب وینتیج طلای سفید 18 عیار. طراحی ظریف و کلاسیک.',15500000,11800000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,4,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین بیضی وینتیج مدل 13008','خرید انگشتر نامزدی آکوامارین بیضی با طراحی وینتیج','uploads/products/meta/oval-aquamarine-diamond-vintage-engagement-ring__13008.jpg',NULL,'angoshtar-akvamarin-beizi-vintij-13008',0.00,'13008',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(21,'انگشتر آکوامارین ۳ سنگه بیضی | مدل 86596','admin',12,104,1043,132,3,'[\"uploads/products/photos/oval-blue-aquamarine-and-diamonds-3-stone-engagement-ring__86596.jpg\"]','uploads/products/thumbnail/oval-blue-aquamarine-and-diamonds-3-stone-engagement-ring__86596.jpg','uploads/products/featured/oval-blue-aquamarine-and-diamonds-3-stone-engagement-ring__86596.jpg','uploads/products/flash_deal/oval-blue-aquamarine-and-diamonds-3-stone-engagement-ring__86596.jpg','youtube',NULL,'آکوامارین بیضی, ۳ سنگه, انگشتر نامزدی, مدل 86596','انگشتر ۳ سنگه با سنگ مرکزی آکوامارین بیضی 1.2 قیراطی و دو الماس گرد در دو طرف. قاب طلای رزگلد 18 عیار.',18500000,14000000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,5,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین ۳ سنگه بیضی مدل 86596','خرید انگشتر ۳ سنگه آکوامارین بیضی با الماس','uploads/products/meta/oval-blue-aquamarine-and-diamonds-3-stone-engagement-ring__86596.jpg',NULL,'angoshtar-akvamarin-3-sange-beizi-86596',0.00,'86596',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(22,'انگشتر آکوامارین هاله بیضی | مدل 55983','admin',12,104,1043,132,1,'[\"uploads/products/photos/oval-blue-aquamarine-diamond-halo-statement-ring__55983.jpg\"]','uploads/products/thumbnail/oval-blue-aquamarine-diamond-halo-statement-ring__55983.jpg','uploads/products/featured/oval-blue-aquamarine-diamond-halo-statement-ring__55983.jpg','uploads/products/flash_deal/oval-blue-aquamarine-diamond-halo-statement-ring__55983.jpg','youtube',NULL,'آکوامارین بیضی, هاله الماس, استیتمنت, مدل 55983','انگشتر استیتمنت با سنگ آکوامارین بیضی 2.2 قیراطی و هاله الماس دور آن. قاب طلای سفید 18 عیار با طراحی چشمگیر.',25000000,19000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,3,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین هاله بیضی مدل 55983','خرید انگشتر استیتمنت آکوامارین بیضی 2.2 قیراطی با هاله الماس','uploads/products/meta/oval-blue-aquamarine-diamond-halo-statement-ring__55983.jpg',NULL,'angoshtar-akvamarin-hale-beizi-55983',0.00,'55983',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(23,'ست انگشتر نامزدی آکوامارین بیضی | مدل 78933','admin',12,104,1043,132,2,'[\"uploads/products/photos/oval-blue-aquamarine-engagement-wedding-ring-set__78933.jpg\"]','uploads/products/thumbnail/oval-blue-aquamarine-engagement-wedding-ring-set__78933.jpg','uploads/products/featured/oval-blue-aquamarine-engagement-wedding-ring-set__78933.jpg','uploads/products/flash_deal/oval-blue-aquamarine-engagement-wedding-ring-set__78933.jpg','youtube',NULL,'آکوامارین بیضی, ست نامزدی, حلقه ازدواج, مدل 78933','ست کامل انگشتر نامزدی با سنگ آکوامارین بیضی 1 قیراطی و حلقه ازدواج هماهنگ با الماس‌های ریز. قاب طلای سفید 18 عیار.',19500000,14800000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,4,'ست',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'ست انگشتر آکوامارین بیضی مدل 78933','خرید ست انگشتر نامزدی و حلقه ازدواج آکوامارین بیضی','uploads/products/meta/oval-blue-aquamarine-engagement-wedding-ring-set__78933.jpg',NULL,'set-angoshtar-akvamarin-beizi-78933',0.00,'78933',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(24,'انگشتر گلابی آکوامارین | مدل 49721','admin',12,104,1043,132,3,'[\"uploads/products/photos/pear-shape-aquamarine-diamond-engagement-ring__49721.jpg\"]','uploads/products/thumbnail/pear-shape-aquamarine-diamond-engagement-ring__49721.jpg','uploads/products/featured/pear-shape-aquamarine-diamond-engagement-ring__49721.jpg','uploads/products/flash_deal/pear-shape-aquamarine-diamond-engagement-ring__49721.jpg','youtube',NULL,'آکوامارین گلابی, انگشتر نامزدی, مدل 49721','انگشتر نامزدی با سنگ آکوامارین گلابی (نوک تیز) 1.7 قیراطی و الماس‌های کوچک در امتداد قاب. قاب طلای سفید 18 عیار.',17500000,13200000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,5,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین گلابی مدل 49721','خرید انگشتر نامزدی آکوامارین گلابی با الماس','uploads/products/meta/pear-shape-aquamarine-diamond-engagement-ring__49721.jpg',NULL,'angoshtar-akvamarin-golabi-49721',0.00,'49721',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(25,'انگشتر آکوامارین گلابی هاله | مدل 70693','admin',12,104,1043,132,1,'[\"uploads/products/photos/pear-shaped-aquamarone-and-diamonds-halo-statement-ring__70693.jpg\"]','uploads/products/thumbnail/pear-shaped-aquamarone-and-diamonds-halo-statement-ring__70693.jpg','uploads/products/featured/pear-shaped-aquamarone-and-diamonds-halo-statement-ring__70693.jpg','uploads/products/flash_deal/pear-shaped-aquamarone-and-diamonds-halo-statement-ring__70693.jpg','youtube',NULL,'آکوامارین گلابی, هاله الماس, استیتمنت, مدل 70693','انگشتر استیتمنت با سنگ آکوامارین گلابی 2 قیراطی و هاله الماس دور آن. قاب طلای رزگلد 18 عیار با طراحی دراماتیک.',23000000,17500000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,3,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین گلابی هاله مدل 70693','خرید انگشتر استیتمنت آکوامارین گلابی 2 قیراطی با هاله الماس','uploads/products/meta/pear-shaped-aquamarone-and-diamonds-halo-statement-ring__70693.jpg',NULL,'angoshtar-akvamarin-golabi-hale-70693',0.00,'70693',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(26,'انگشتر آکوامارین هاله مینیاتوری | مدل 81035','admin',12,104,1043,132,2,'[\"uploads/products/photos/petite-blue-aquamarine-and-diamond-halo-engagement-ring__81035.jpg\"]','uploads/products/thumbnail/petite-blue-aquamarine-and-diamond-halo-engagement-ring__81035.jpg','uploads/products/featured/petite-blue-aquamarine-and-diamond-halo-engagement-ring__81035.jpg','uploads/products/flash_deal/petite-blue-aquamarine-and-diamond-halo-engagement-ring__81035.jpg','youtube',NULL,'آکوامارین کوچک, هاله الماس, انگشتر نامزدی, مدل 81035','انگشتر نامزدی ظریف با سنگ آکوامارین بیضی 0.8 قیراطی و هاله الماس دور آن. قاب طلای سفید 18 عیار. مناسب استفاده روزمره.',10500000,7800000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,8,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین هاله مینیاتوری مدل 81035','خرید انگشتر نامزدی آکوامارین ظریف 0.8 قیراطی با هاله الماس','uploads/products/meta/petite-blue-aquamarine-and-diamond-halo-engagement-ring__81035.jpg',NULL,'angoshtar-akvamarin-hale-miniatur-81035',0.00,'81035',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(27,'انگشتر پرنسس آکوامارین ۳ سنگه | مدل 49705','admin',12,104,1043,132,3,'[\"uploads/products/photos/princess-aquamarine-diamond-engagement-ring-set__49705.jpg\"]','uploads/products/thumbnail/princess-aquamarine-diamond-engagement-ring-set__49705.jpg','uploads/products/featured/princess-aquamarine-diamond-engagement-ring-set__49705.jpg','uploads/products/flash_deal/princess-aquamarine-diamond-engagement-ring-set__49705.jpg','youtube',NULL,'آکوامارین پرنسس, ۳ سنگه, ست نامزدی, مدل 49705','ست انگشتر نامزدی با سنگ آکوامارین پرنسس 1.5 قیراطی و دو الماس مثلثی در دو طرف. قاب طلای سفید 18 عیار.',21000000,16000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,4,'ست',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'ست انگشتر آکوامارین پرنسس مدل 49705','خرید ست انگشتر نامزدی آکوامارین پرنسس با الماس','uploads/products/meta/princess-aquamarine-diamond-engagement-ring-set__49705.jpg',NULL,'set-angoshtar-akvamarin-princes-49705',0.00,'49705',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(28,'ست انگشتر پرنسس آکوامارین | مدل 40939','admin',12,6,110,141,16,'[\"uploads\\/products\\/photos\\/princess-cut-aquamarine-and-diamond-engagement-wedding-ring-set__40939.jpg\"]','uploads/products/thumbnail/7SDAAsLy6HJJXiWeZN604jaJ035FZTd6KTjD8ke8.jpg','uploads/products/featured/princess-cut-aquamarine-and-diamond-engagement-wedding-ring-set__40939.jpg','uploads/products/flash_deal/F9J7X2eyAMGbvaJjIjEEtfI7u9Lkj8usH4aKbIyF.jpg','youtube',NULL,'آکوامارین پرنسس, ست نامزدی, حلقه ازدواج, مدل 40939','ست کامل انگشتر نامزدی با سنگ آکوامارین پرنسس 1 قیراطی و حلقه ازدواج هماهنگ با الماس. قاب طلای سفید 18 عیار.',16500000,12500000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,5,'ست',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'ست انگشتر پرنسس آکوامارین مدل 40939','خرید ست انگشتر نامزدی و حلقه ازدواج آکوامارین پرنسس','uploads/products/meta/princess-cut-aquamarine-and-diamond-engagement-wedding-ring-set__40939.jpg',NULL,'ست-انگشتر-پرنسس-آکوامارین-|-مدل-40939-k4TJe',0.00,NULL,0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 10:34:13'),
(29,'انگشتر پرنسس آکوامارین وینتیج | مدل 99744','admin',12,104,1043,132,2,'[\"uploads/products/photos/princess-cut-aquamarine-diamond-vintage-engagement-ring__99744.jpg\"]','uploads/products/thumbnail/princess-cut-aquamarine-diamond-vintage-engagement-ring__99744.jpg','uploads/products/featured/princess-cut-aquamarine-diamond-vintage-engagement-ring__99744.jpg','uploads/products/flash_deal/princess-cut-aquamarine-diamond-vintage-engagement-ring__99744.jpg','youtube',NULL,'آکوامارین پرنسس, وینتیج, انگشتر نامزدی, مدل 99744','انگشتر نامزدی با سنگ آکوامارین پرنسس 1.6 قیراطی و الماس‌های ریز در قاب وینتیج طلای سفید 18 عیار با حکاکی‌های ظریف.',17500000,13500000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,4,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر پرنسس آکوامارین وینتیج مدل 99744','خرید انگشتر نامزدی آکوامارین پرنسس با طراحی وینتیج','uploads/products/meta/princess-cut-aquamarine-diamond-vintage-engagement-ring__99744.jpg',NULL,'angoshtar-akvamarin-princes-vintij-99744',0.00,'99744',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(30,'انگشتر پرنسس آکوامارین سولیتر | مدل 61759','admin',12,104,1043,132,3,'[\"uploads/products/photos/princess-cut-aquamarine-solitaire-ring__61759.jpg\"]','uploads/products/thumbnail/princess-cut-aquamarine-solitaire-ring__61759.jpg','uploads/products/featured/princess-cut-aquamarine-solitaire-ring__61759.jpg','uploads/products/flash_deal/princess-cut-aquamarine-solitaire-ring__61759.jpg','youtube',NULL,'آکوامارین پرنسس, سولیتر, انگشتر نامزدی, مدل 61759','انگشتر سولیتر با سنگ آکوامارین پرنسس 1.2 قیراطی در قاب طلای سفید 18 عیار با چهار چنگک ساده. طراحی مینیمال و کلاسیک.',13500000,10000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,6,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر پرنسس آکوامارین سولیتر مدل 61759','خرید انگشتر سولیتر آکوامارین پرنسس 1.2 قیراطی','uploads/products/meta/princess-cut-aquamarine-solitaire-ring__61759.jpg',NULL,'angoshtar-akvamarin-princes-soliter-61759',0.00,'61759',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(31,'انگشتر پرنسس آکوامارین هاله | مدل 48861','admin',12,104,1043,132,1,'[\"uploads/products/photos/princess-cut-blue-aquamarine-diamond-engagement-ring__48861.jpg\"]','uploads/products/thumbnail/princess-cut-blue-aquamarine-diamond-engagement-ring__48861.jpg','uploads/products/featured/princess-cut-blue-aquamarine-diamond-engagement-ring__48861.jpg','uploads/products/flash_deal/princess-cut-blue-aquamarine-diamond-engagement-ring__48861.jpg','youtube',NULL,'آکوامارین پرنسس, هاله الماس, انگشتر نامزدی, مدل 48861','انگشتر نامزدی با سنگ آکوامارین پرنسس 1.4 قیراطی و هاله الماس دور آن. قاب طلای سفید 18 عیار با طراحی مدرن.',16500000,12500000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,5,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر پرنسس آکوامارین هاله مدل 48861','خرید انگشتر نامزدی آکوامارین پرنسس با هاله الماس','uploads/products/meta/princess-cut-blue-aquamarine-diamond-engagement-ring__48861.jpg',NULL,'angoshtar-akvamarin-princes-hale-48861',0.00,'48861',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(32,'انگشتر گرد آکوامارین اسپلیت بند | مدل 54144','admin',12,104,1043,132,2,'[\"uploads/products/photos/round-blue-aquamarine-solitaire-engagement-ring-split-band__54144.jpg\"]','uploads/products/thumbnail/round-blue-aquamarine-solitaire-engagement-ring-split-band__54144.jpg','uploads/products/featured/round-blue-aquamarine-solitaire-engagement-ring-split-band__54144.jpg','uploads/products/flash_deal/round-blue-aquamarine-solitaire-engagement-ring-split-band__54144.jpg','youtube',NULL,'آکوامارین گرد, اسپلیت بند, سولیتر, مدل 54144','انگشتر سولیتر با سنگ آکوامارین گرد 1.3 قیراطی و بند اسپلیت (شکسته) طلای سفید 18 عیار. طراحی مدرن و منحصر به فرد.',14500000,11000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,5,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر گرد آکوامارین اسپلیت بند مدل 54144','خرید انگشتر سولیتر آکوامارین گرد با بند اسپلیت','uploads/products/meta/round-blue-aquamarine-solitaire-engagement-ring-split-band__54144.jpg',NULL,'angoshtar-akvamarin-gard-split-band-54144',0.00,'54144',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(33,'انگشتر گرد آکوامارین هاله | مدل 70793','admin',12,104,1043,132,3,'[\"uploads/products/photos/round_blue_aquamarine_diamond_engagement_ring__70793.jpg\"]','uploads/products/thumbnail/round_blue_aquamarine_diamond_engagement_ring__70793.jpg','uploads/products/featured/round_blue_aquamarine_diamond_engagement_ring__70793.jpg','uploads/products/flash_deal/round_blue_aquamarine_diamond_engagement_ring__70793.jpg','youtube',NULL,'آکوامارین گرد, هاله الماس, انگشتر نامزدی, مدل 70793','انگشتر نامزدی با سنگ آکوامارین گرد 1.6 قیراطی و هاله الماس دور آن. قاب طلای سفید 18 عیار با طراحی کلاسیک و همیشه شیک.',17500000,13200000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,5,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر گرد آکوامارین هاله مدل 70793','خرید انگشتر نامزدی آکوامارین گرد با هاله الماس','uploads/products/meta/round_blue_aquamarine_diamond_engagement_ring__70793.jpg',NULL,'angoshtar-akvamarin-gard-hale-70793',0.00,'70793',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(34,'انگشتر مربع آکوامارین هاله | مدل 93695','admin',12,104,1043,132,1,'[\"uploads/products/photos/square-blue-aquamarine-and-diamond-halo-statement-ring__93695.jpg\"]','uploads/products/thumbnail/square-blue-aquamarine-and-diamond-halo-statement-ring__93695.jpg','uploads/products/featured/square-blue-aquamarine-and-diamond-halo-statement-ring__93695.jpg','uploads/products/flash_deal/square-blue-aquamarine-and-diamond-halo-statement-ring__93695.jpg','youtube',NULL,'آکوامارین مربع, هاله الماس, استیتمنت, مدل 93695','انگشتر استیتمنت با سنگ آکوامارین مربع (شکل خاص) 2.5 قیراطی و هاله الماس دور آن. قاب طلای سفید 18 عیار با طراحی منحصر به فرد.',28000000,21500000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,3,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین مربع هاله مدل 93695','خرید انگشتر استیتمنت آکوامارین مربع 2.5 قیراطی با هاله الماس','uploads/products/meta/square-blue-aquamarine-and-diamond-halo-statement-ring__93695.jpg',NULL,'angoshtar-akvamarin-moraba-hale-93695',0.00,'93695',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(35,'انگشتر مثلث آکوامارین سولیتر | مدل 95642','admin',12,104,1043,132,2,'[\"uploads/products/photos/trilliant-cut-aquamarine-solitaire-ring-white-gold__95642.jpg\"]','uploads/products/thumbnail/trilliant-cut-aquamarine-solitaire-ring-white-gold__95642.jpg','uploads/products/featured/trilliant-cut-aquamarine-solitaire-ring-white-gold__95642.jpg','uploads/products/flash_deal/trilliant-cut-aquamarine-solitaire-ring-white-gold__95642.jpg','youtube',NULL,'آکوامارین مثلث, سولیتر, انگشتر نامزدی, مدل 95642','انگشتر سولیتر با سنگ آکوامارین مثلث (trilliant) 1.8 قیراطی در قاب طلای سفید 18 عیار. طراحی مدرن و خاص.',19500000,14800000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,4,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر مثلث آکوامارین سولیتر مدل 95642','خرید انگشتر سولیتر آکوامارین مثلث با قاب طلای سفید','uploads/products/meta/trilliant-cut-aquamarine-solitaire-ring-white-gold__95642.jpg',NULL,'angoshtar-akvamarin-mosalas-soliter-95642',0.00,'95642',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(36,'انگشتر مثلث آکوامارین قول | مدل 66764','admin',12,104,1043,132,3,'[\"uploads/products/photos/trillion-aquamarine-diamond-promise-engagement-ring__66764.jpg\"]','uploads/products/thumbnail/trillion-aquamarine-diamond-promise-engagement-ring__66764.jpg','uploads/products/featured/trillion-aquamarine-diamond-promise-engagement-ring__66764.jpg','uploads/products/flash_deal/trillion-aquamarine-diamond-promise-engagement-ring__66764.jpg','youtube',NULL,'آکوامارین مثلث, حلقه قول, انگشتر نامزدی, مدل 66764','انگشتر قول (Promise Ring) با سنگ آکوامارین مثلث 1 قیراطی و الماس‌های ریز در قاب طلای سفید 18 عیار. هدیه‌ای برای آغاز یک رابطه.',12500000,9500000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,8,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر مثلث آکوامارین قول مدل 66764','خرید انگشتر قول آکوامارین مثلث با الماس','uploads/products/meta/trillion-aquamarine-diamond-promise-engagement-ring__66764.jpg',NULL,'angoshtar-akvamarin-mosalas-ghol-66764',0.00,'66764',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(37,'انگشتر آکوامارین وینتیج هاله | مدل 28934','admin',12,104,1043,132,1,'[\"uploads/products/photos/vintage-blue-aquamarine-diamond-halo-engagement-ring__28934.jpg\"]','uploads/products/thumbnail/vintage-blue-aquamarine-diamond-halo-engagement-ring__28934.jpg','uploads/products/featured/vintage-blue-aquamarine-diamond-halo-engagement-ring__28934.jpg','uploads/products/flash_deal/vintage-blue-aquamarine-diamond-halo-engagement-ring__28934.jpg','youtube',NULL,'آکوامارین, وینتیج, هاله الماس, انگشتر نامزدی, مدل 28934','انگشتر نامزدی با سنگ آکوامارین بیضی 1.5 قیراطی و هاله الماس وینتیج در قاب طلای سفید 18 عیار با جزئیات ظریف.',18500000,14000000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,4,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین وینتیج هاله مدل 28934','خرید انگشتر نامزدی آکوامارین با هاله وینتیج','uploads/products/meta/vintage-blue-aquamarine-diamond-halo-engagement-ring__28934.jpg',NULL,'angoshtar-akvamarin-vintij-hale-28934',0.00,'28934',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(38,'انگشتر آکوامارین سولیتر وینتیج | مدل 45823','admin',12,104,1043,132,2,'[\"uploads/products/photos/vintage-blue-aquamarine-solitaire-engagement-ring__45823.jpg\"]','uploads/products/thumbnail/vintage-blue-aquamarine-solitaire-engagement-ring__45823.jpg','uploads/products/featured/vintage-blue-aquamarine-solitaire-engagement-ring__45823.jpg','uploads/products/flash_deal/vintage-blue-aquamarine-solitaire-engagement-ring__45823.jpg','youtube',NULL,'آکوامارین, سولیتر وینتیج, انگشتر نامزدی, مدل 45823','انگشتر سولیتر با سنگ آکوامارین گرد 1.2 قیراطی در قاب وینتیج طلای زرد 18 عیار با حکاکی‌های ظریف دور تا دور بند.',13500000,10000000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,0,5,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین سولیتر وینتیج مدل 45823','خرید انگشتر سولیتر آکوامارین با طراحی وینتیج','uploads/products/meta/vintage-blue-aquamarine-solitaire-engagement-ring__45823.jpg',NULL,'angoshtar-akvamarin-soliter-vintij-45823',0.00,'45823',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(39,'انگشتر آکوامارین سولیتر وینتیج سفید | مدل 38970','admin',12,104,1043,132,3,'[\"uploads/products/photos/vintage-style-aquamarine-solitaire-ring-white-gold__38970.jpg\"]','uploads/products/thumbnail/vintage-style-aquamarine-solitaire-ring-white-gold__38970.jpg','uploads/products/featured/vintage-style-aquamarine-solitaire-ring-white-gold__38970.jpg','uploads/products/flash_deal/vintage-style-aquamarine-solitaire-ring-white-gold__38970.jpg','youtube',NULL,'آکوامارین, سولیتر وینتیج, طلای سفید, مدل 38970','انگشتر سولیتر با سنگ آکوامارین بیضی 1.4 قیراطی در قاب وینتیج طلای سفید 18 عیار با جزئیات ظریف و الماس‌های کوچک.',15500000,11800000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,6,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'انگشتر آکوامارین سولیتر وینتیج سفید مدل 38970','خرید انگشتر سولیتر آکوامارین با طراحی وینتیج طلای سفید','uploads/products/meta/vintage-style-aquamarine-solitaire-ring-white-gold__38970.jpg',NULL,'angoshtar-akvamarin-soliter-vintij-sefid-38970',0.00,'38970',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(61,'ساعت مچی رولکس اسکای‌دولر رزگلد | مدل 326935','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-rolex-326935-sky-dweller-rose-gold-white-index-dial-watch-rsky07162-32696863719483_520x.png\"]','uploads/products/thumbnail/8OiWkM7ewSLxGoO2Bb9TJCpkJS6ZH5B49uOshpfW.png','uploads/products/featured/ga8CJ5LHUNgC6DgtU3OgVKMdx1hhps2R5zLLKVRP.png','uploads/products/flash_deal/yVo18tEtaFFDyXIlrlZnvAHeOV7cc0Ew6l4c7Lsr.png','youtube',NULL,'رولکس, اسکای‌دولر, ساعت مچی, رزگلد','ساعت مچی رولکس اسکای‌دولر با قاب طلای رزگلد 18 عیار و صفحه سفید با نشان‌های شاخص. مجهز به کالیبر 9001 با نمایش دو منطقه زمانی و تاریخ. ضد آب تا 100 متر. بند طلای رزگلد با قفل ایمن.',850000000,750000000,1,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,2,'دستگاه',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس اسکای‌دولر رزگلد مدل 326935','خرید ساعت مچی رولکس اسکای‌دولر با قاب رزگلد 18 عیار و صفحه سفید','uploads/products/meta/watch-rolex-326935-sky-dweller-rose-gold-white-index-dial-watch-rsky07162-32696863719483_520x.png',NULL,'ساعت-مچی-رولکس-اسکای‌دولر-رزگلد-|-مدل-326935-lVIKZ',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 09:59:35'),
(62,'ساعت مچی رولکس دی‌جاست 36 استیل | مدل 116234','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/FBfg6KFb94ty6xTxjgDG1J4diI0FLWkIDHUt1Prj.png\"]','uploads/products/thumbnail/TyxbTlVYYVWs4bH3FnCAaNMEc81F3GlJZkQxfmDB.png','uploads/products/featured/MxCw4yr9YfapHKQJtxRJc6bIZyzANQhMkQL28Nlv.png','uploads/products/flash_deal/yCThGUxzqoy2CjrmAA8PnQdDGa9QYOvHUgJxIKKD.png','youtube',NULL,'رولکس, دی‌جاست, ساعت مچی, استیل','ساعت مچی رولکس دی‌جاست 36 میلی‌متری با قاب استیل ضدزنگ 904L و بند جوبیلی. صفحه سفید با نشان‌های طلایی و کریستال یاقوت. مجهز به کالیبر 3235. مناسب استفاده روزمره و رسمی.',120000000,95000000,1,'[]','[]','[\"#C0C0C0\"]',NULL,1,1,1,5,'دستگاه',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس دی‌جاست 36 استیل مدل 116234','خرید ساعت مچی رولکس دی‌جاست 36 میلی‌متری با قاب استیل و بند جوبیلی','uploads/products/meta/watch-rolex-datejust-36-stainless-steel-jubilee-white-dial-watch-116234-116234-32693971943483_520x.png',NULL,'ساعت-مچی-رولکس-دی‌جاست-36-استیل-|-مدل-116234-SjgT7',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:40:04'),
(63,'ساعت مچی رولکس دی‌جاست 41 استیل و رزگلد | مدل 126331','admin',12,5,107,134,8,'[\"uploads\\/products\\/photos\\/watch-rolex-datejust-41-stainless-steel-and-rose-gold-jubilee-sundust-index-dial-watch-126331-rj4107259-1184525113_520x.png\"]','uploads/products/thumbnail/JQBukVUN7roELZPUNJMnUPYo66UGzezdFcxfZj52.png','uploads/products/featured/GAx8WfokjSlVyaTwqdIPymoNCKepIpvXQHCcsTnC.png','uploads/products/flash_deal/3TSn6RC4Zyb5cmERz4l7gO1mL1Ee8GQVHqMleNP2.png','youtube',NULL,'رولکس, دی‌جاست 41, استیل, رزگلد','ساعت مچی رولکس دی‌جاست 41 میلی‌متری با قاب ترکیبی استیل ضدزنگ 904L و طلای رزگلد 18 عیار. بند جوبیلی رزگلد و استیل. صفحه رنگ سانداست با نشان‌های طلایی و کریستال یاقوت.',450000000,380000000,1,'[]','[]','[\"#FFB6C1\",\"#C0C0C0\"]',NULL,1,1,1,4,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس دی‌جاست 41 استیل و رزگلد','خرید ساعت مچی رولکس دی‌جاست 41 با قاب استیل و رزگلد و صفحه سانداست','uploads/products/meta/watch-rolex-datejust-41-stainless-steel-and-rose-gold-jubilee-sundust-index-dial-watch-126331-rj4107259-1184525113_520x.png',NULL,'ساعت-مچی-رولکس-دی‌جاست-41-استیل-و-رزگلد-|-مدل-126331-omKYt',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:06:34'),
(64,'ساعت مچی رولکس دی‌جاست 41 الماس آبی | مدل 126334','admin',12,5,107,134,7,'[\"uploads\\/products\\/photos\\/watch-rolex-datejust-41mm-blue-diamond-steel-and-white-gold-jubilee-watch-126334-rj4107065-32699219869755_520x.png\"]','uploads/products/thumbnail/hzc5wBQ2Mh5WN7GmLNhhZqW3WZOU2xzUbiHis4cU.png','uploads/products/featured/13O6f8Muayrlj8ekSbEbAVc1htYoMm9W4foovf7o.png','uploads/products/flash_deal/Oh98qv69vk4I3zUij6NyivjjVvo6tw5fuSqiEiW0.png','youtube',NULL,'رولکس, دی‌جاست 41, الماس, آبی','ساعت مچی رولکس دی‌جاست 41 میلی‌متری با قاب استیل ضدزنگ 904L و طلای سفید 18 عیار. صفحه آبی با نشان‌های الماس. بند جوبیلی استیل و طلای سفید. مجهز به کالیبر 3235.',580000000,500000000,1,'[]','[]','[\"#0000FF\",\"#C0C0C0\"]',NULL,1,1,1,3,'دستگاه',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس دی‌جاست 41 الماس آبی','خرید ساعت مچی رولکس دی‌جاست 41 با صفحه آبی و نشان‌های الماس','uploads/products/meta/watch-rolex-datejust-41mm-blue-diamond-steel-and-white-gold-jubilee-watch-126334-rj4107065-32699219869755_520x.png',NULL,'ساعت-مچی-رولکس-دی‌جاست-41-الماس-آبی-|-مدل-126334-qRkmh',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:07:41'),
(65,'ساعت مچی رولکس دی‌جاست 41 الماس آبی ۲ | مدل 126334','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-rolex-datejust-41mm-blue-diamond-steel-and-white-gold-jubilee-watch-126334-rj4107065-32699223015483_520x.png\"]','uploads/products/thumbnail/Cjl8xKCCAYMV35e1gqaxd49aBoXq8sqmdN9eCX0P.png','uploads/products/featured/GEMMJtbi9hMmhDM2nF2UZKei5yS5TJxBEFNNYoVs.png','uploads/products/flash_deal/hBDNv4OS8dqNSessdIQzk0FQ5Ps2byZrfwTl01lM.png','youtube',NULL,'رولکس, دی‌جاست 41, الماس, آبی','ساعت مچی رولکس دی‌جاست 41 میلی‌متری با قاب استیل ضدزنگ 904L و طلای سفید 18 عیار. صفحه آبی با نشان‌های الماس. بند جوبیلی استیل و طلای سفید. طراحی لوکس و چشمگیر.',590000000,510000000,1,'[]','[]','[\"#0000FF\",\"#C0C0C0\"]',NULL,1,1,0,3,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس دی‌جاست 41 الماس آبی ۲','خرید ساعت مچی رولکس دی‌جاست 41 با صفحه آبی الماس و قاب دو رنگ','uploads/products/meta/watch-rolex-datejust-41mm-blue-diamond-steel-and-white-gold-jubilee-watch-126334-rj4107065-32699223015483_520x.png',NULL,'ساعت-مچی-رولکس-دی‌جاست-41-الماس-آبی-۲-|-مدل-126334-JDiyg',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:10:16'),
(66,'ساعت مچی رولکس ساب‌مارینر استیل و طلا | مدل 126613lb','admin',12,5,107,134,9,'[\"uploads\\/products\\/photos\\/watch-rolex-submariner-stainless-steel-and-yellow-gold-blue-index-dial-watch-126613lb-rsub07180-32702127210555_520x.png\"]','uploads/products/thumbnail/6ymYhxV0eRdN5BERBQrS7LHmBpNaZYLPwiSUjw15.png','uploads/products/featured/egkNsHPWnrG7ELnoqH7EAyddVAFONxATJMvZiicC.png','uploads/products/flash_deal/1oDe2WThxxX7PFnsIjT8aPUPITG8KzQzhoSkcol3.png','youtube',NULL,'رولکس, ساب‌مارینر, استیل, طلا','ساعت مچی رولکس ساب‌مارینر با قاب ترکیبی استیل ضدزنگ 904L و طلای زرد 18 عیار. صفحه آبی با نشان‌های لومینسنت. ضد آب تا 300 متر. بند استیل با قفل ایمن. طراحی کلاسیک غواصی.',980000000,850000000,1,'[]','[]','[\"#0000FF\",\"#FFD700\"]',NULL,1,1,1,3,'دستگاه',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس ساب‌مارینر استیل و طلا','خرید ساعت مچی رولکس ساب‌مارینر با قاب استیل و طلای زرد و صفحه آبی','uploads/products/meta/watch-rolex-submariner-stainless-steel-and-yellow-gold-blue-index-dial-watch-126613lb-rsub07180-32702127210555_520x.png',NULL,'ساعت-مچی-رولکس-ساب‌مارینر-استیل-و-طلا-|-مدل-126613lb-cXzh5',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:16:04'),
(67,'ساعت مچی رولکس ساب‌مارینر هالک سبز | مدل 116610lv','admin',12,5,107,134,10,'[\"uploads\\/products\\/photos\\/watch-rolex-submariner-stainless-steel-hulk-green-dial-watch-116610lv-rsub07157-32665478037563_520x.png\"]','uploads/products/thumbnail/hYVxu3uR6wn9Ngc3EAc1Jr67lAy6YBHynCASodKU.png','uploads/products/featured/3NPpkdZZOL13rajrWZhchCAkRXB2CLAKl6RcERIT.png','uploads/products/flash_deal/SvhoUbPKBlW0zJkCB0wwg5ROAAyONBnN5mvQNhUH.png','youtube',NULL,'رولکس, ساب‌مارینر, هالک, صفحه سبز','ساعت مچی رولکس ساب‌مارینر هالک با قاب استیل ضدزنگ 904L و صفحه سبز نمادین. بند استیل با قفل ایمنی. ضد آب تا 300 متر. مدل کمیاب و بسیار محبوب کلکسیونرها.',750000000,650000000,1,'[]','[]','[\"#008000\",\"#C0C0C0\"]',NULL,1,1,1,2,'دستگاه',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس ساب‌مارینر هالک سبز','خرید ساعت مچی رولکس ساب‌مارینر با صفحه سبز و قاب استیل','uploads/products/meta/watch-rolex-submariner-stainless-steel-hulk-green-dial-watch-116610lv-rsub07157-32665478037563_520x.png',NULL,'ساعت-مچی-رولکس-ساب‌مارینر-هالک-سبز-|-مدل-116610lv-kITHW',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:17:05'),
(68,'ساعت مچی رولکس سی‌دولر استیل و طلا | مدل 126603','admin',12,5,107,134,16,'[\"uploads\\/products\\/photos\\/watch-rolex-sea-dweller-stainless-steel-and-yellow-gold-black-dial-watch-126603-rsea07034-32702418255931_520x.png\"]','uploads/products/thumbnail/Ix1n1lNuetqNKCZrUKjDQj29hjlrDA471qZNgTmX.png','uploads/products/featured/CIPLOpU5unncmn0igzAyZ454HXdaekA686CpsGgY.png','uploads/products/flash_deal/OsQpjCfc5EQcZUHRZtcdpPcQb2Vhi5fss6lwmWhs.png','youtube',NULL,'رولکس, سی‌دولر, استیل, طلا','ساعت مچی رولکس سی‌دولر با قاب ترکیبی استیل ضدزنگ 904L و طلای زرد 18 عیار. صفحه سیاه با نشان‌های لومینسنت. ضد آب تا 1220 متر. مجهز به دریچه هلیوم. مناسب غواصی حرفه‌ای.',820000000,720000000,1,'[]','[]','[\"#FFD700\",\"#C0C0C0\"]',NULL,1,1,0,2,'دستگاه',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس سی‌دولر استیل و طلا','خرید ساعت مچی رولکس سی‌دولر با قاب استیل و طلا و صفحه سیاه','uploads/products/meta/watch-rolex-sea-dweller-stainless-steel-and-yellow-gold-black-dial-watch-126603-rsea07034-32702418255931_520x.png',NULL,'ساعت-مچی-رولکس-سی‌دولر-استیل-و-طلا-|-مدل-126603-S9L2C',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:17:54'),
(69,'ساعت مچی رولکس اسکای‌دولر رزگلد شکلاتی | مدل 326935','admin',12,5,107,134,17,'[\"uploads\\/products\\/photos\\/watch-rolex-sky-dweller-rose-gold-chocolate-dial-dual-time-zone-watch-326935-326936-32694014804027_520x.png\"]','uploads/products/thumbnail/ZbCVsAwWjzfFpBmqVplKgSCwCGacDlHnMgk3Zx8o.png','uploads/products/featured/qhOYKucDm6vKa2mqNkWjTK8SUS0XtMOx2rAV3aWD.png','uploads/products/flash_deal/a6bxd3CccTW2GbX1bNAwOZmBdYDNYjAzOA9vlGWD.png','youtube',NULL,'رولکس, اسکای‌دولر, رزگلد, شکلاتی','ساعت مچی رولکس اسکای‌دولر با قاب طلای رزگلد 18 عیار و صفحه شکلاتی رنگ با نشان‌های طلایی. مجهز به کالیبر 9001 با نمایش دو منطقه زمانی، تاریخ و ماه. ضد آب تا 100 متر.',880000000,780000000,1,'[]','[]','[\"#D2691E\",\"#FFB6C1\"]',NULL,1,1,1,2,'دستگاه',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'ساعت رولکس اسکای‌دولر رزگلد شکلاتی','خرید ساعت مچی رولکس اسکای‌دولر با قاب رزگلد و صفحه شکلاتی','uploads/products/meta/watch-rolex-sky-dweller-rose-gold-chocolate-dial-dual-time-zone-watch-326935-326936-32694014804027_520x.png',NULL,'ساعت-مچی-رولکس-اسکای‌دولر-رزگلد-شکلاتی-|-مدل-326935-Ycdo9',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:18:53'),
(70,'ساعت مچی اُمگا اسپیدمستر کرونو | مدل 1160095730','admin',12,5,107,134,5,'[\"uploads\\/products\\/photos\\/watch-omega-speedmaster-day-date-chrono-silver-dial-watch-1160095730_520x.png\"]','uploads/products/thumbnail/NVLrOS6bDJ5FeGZKkNj8TquA521edVLG1N5r0WBq.png','uploads/products/featured/QIy5JIUmudosOIUCLK7NqvUZl4aWqnMeOGZ3bqjx.png','uploads/products/flash_deal/NkUe2WRWwbfCGyxa7LF43ruhxNWRtfkcLawy3p4n.png','youtube',NULL,'اُمگا, اسپیدمستر, کرنوگراف, ساعت مچی','ساعت مچی اُمگا اسپیدمستر با کرنوگراف و نمایش روز/تاریخ. صفحه نقره‌ای با سه زیرصفحه (ثانیه، دقیقه، ساعت). موتور کوارتز دقیق و بند استیل ضدزنگ. طراحی اسپرت و کلاسیک.',65000000,50000000,1,'[]','[]','[\"#C0C0C0\"]',NULL,1,1,0,4,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت اُمگا اسپیدمستر کرنوگراف','خرید ساعت مچی اُمگا اسپیدمستر با کرنوگراف و موتور دقیق کوارتز','uploads/products/meta/watch-omega-speedmaster-day-date-chrono-silver-dial-watch-1160095730_520x.png',NULL,'ساعت-مچی-اُمگا-اسپیدمستر-کرونو-|-مدل-1160095730-TwG58',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:20:03'),
(71,'ساعت مچی آویان کو جیمسون مردانه | مدل 151652','admin',12,104,1043,134,6,'[\"uploads/products/photos/avianne-co-men-s-jamison-collection-watch-151652-31739148107835_520x.jpg\"]','uploads/products/thumbnail/avianne-co-men-s-jamison-collection-watch-151652-31739148107835_520x.jpg','uploads/products/featured/avianne-co-men-s-jamison-collection-watch-151652-31739148107835_520x.jpg','uploads/products/flash_deal/avianne-co-men-s-jamison-collection-watch-151652-31739148107835_520x.jpg','youtube',NULL,'آویان کو, جیمسون, ساعت مردانه, کلکسیون','ساعت مچی مردانه از کلکسیون جیمسون برند آویان کو. قاب استیل ضدزنگ با روکش مشکی. صفحه مشکی با کرنوگراف و نمایش تاریخ. بند چرم اصل مشکی. طراحی مدرن و اسپرت با جزئیات نقره‌ای.',45000000,35000000,0,'[]','[]','[\"#000000\",\"#C0C0C0\"]',NULL,1,1,0,5,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو جیمسون مردانه','خرید ساعت مچی مردانه آویان کو کلکسیون جیمسون با کرنوگراف','uploads/products/meta/avianne-co-men-s-jamison-collection-watch-151652-31739148107835_520x.jpg',NULL,'avianne-co-jamison-mens-watch',0.00,'151652',0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 13:19:41'),
(72,'ساعت مچی آویان کو اکتاویان PVD طلایی | مدل 216852','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/avianne-co-octavian-collection-men-s-pvd-plated-steel-watch-216852-31739157807163_520x.jpg\"]','uploads/products/thumbnail/AMhHoOKhgP7WMgMeotOKinpK1klYSpaYS8JPF7Jw.jpg','uploads/products/featured/xJot6x3QxhIV6neqz3dV0aJ2j9gA9QWkSeKc9CqO.jpg','uploads/products/flash_deal/4DVnKNnyxZC02k01E8jjWMd0KdSe1Nib1Du8npq1.jpg','youtube',NULL,'آویان کو, اکتاویان, PVD, ساعت مردانه','ساعت مچی مردانه از کلکسیون اکتاویان با قاب استیل PVD طلایی. صفحه مشکی با جزئیات طلایی و کرنوگراف. بند استیل طلایی با قفل ایمن. طراحی لوکس و مجلل مناسب مهمانی‌های رسمی.',55000000,42000000,1,'[]','[]','[\"#000000\",\"#FFD700\"]',NULL,1,1,1,4,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو اکتاویان PVD طلایی','خرید ساعت مچی مردانه آویان کو اکتاویان با قاب PVD طلایی','uploads/products/meta/avianne-co-octavian-collection-men-s-pvd-plated-steel-watch-216852-31739157807163_520x.jpg',NULL,'ساعت-مچی-آویان-کو-اکتاویان-PVD-طلایی-|-مدل-216852-2oYy8',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:20:46'),
(73,'ساعت مچی آویان کو اسنس زنانه الماس | مدل 1183276565','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/diamond-watches-avianne-co-essence-collection-womens-diamond-watch-16-63-ctw-1183276565_520x.jpg\"]','uploads/products/thumbnail/VjWKTC3ADM2LZcWpq5BVLSdK9ofk7wEVTkk49Ri9.jpg','uploads/products/featured/ugrQLNcRtiRLTwXmmnpNrey9Pi5mpV8ZvvxwTehI.jpg','uploads/products/flash_deal/c1CeptjA53yeWAy7eOqv9djGY94dAthmbChECkJi.jpg','youtube',NULL,'آویان کو, اسنس, ساعت زنانه, الماس','ساعت مچی زنانه از کلکسیون اسنس با قاب استیل ضدزنگ و ۱۶.۶۳ قیراط الماس برلیان دور صفحه. صفحه مرواریدی با جزئیات ظریف و نشان‌های طلایی. موتور کوارتز دقیق. بند استیل. طراحی شیک و زنان‌ه.',38000000,29000000,1,'[]','[]','[\"#C0C0C0\",\"#FFFFFF\"]',NULL,1,1,1,6,'دستگاه',12.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو اسنس زنانه الماس','خرید ساعت مچی زنانه آویان کو اسنس با الماس و صفحه مرواریدی','uploads/products/meta/diamond-watches-avianne-co-essence-collection-womens-diamond-watch-16-63-ctw-1183276565_520x.jpg',NULL,'ساعت-مچی-آویان-کو-اسنس-زنانه-الماس-|-مدل-1183276565-t7eJ8',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:22:38'),
(74,'ساعت مچی آویان کو سرامیک سفید الماس | مدل W108D','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-ceramic-white-diamond-watch-w108d-29067487019067_520x.jpg\"]','uploads/products/thumbnail/dHY3UrYkrhOv10iHQeZYugVKRwGYEwjJDnNbaOB3.jpg','uploads/products/featured/watch-avianne-co-ceramic-white-diamond-watch-w108d-29067487019067_520x.jpg','uploads/products/flash_deal/rf2LAP11FlEaVKQfrZfeqMVI7gQRyL4xiQBiVcds.jpg','youtube',NULL,'آویان کو, سرامیک, سفید, الماس','ساعت مچی با قاب سرامیک سفید و الماس‌های دور صفحه. صفحه سفید با نشان‌های طلایی. بند سرامیک سفید با قفل ایمن. موتور کوارتز سوئیسی. طراحی مدرن و مینیمال مناسب استفاده روزمره.',42000000,32000000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,5,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو سرامیک سفید الماس','خرید ساعت مچی آویان کو با قاب سرامیک سفید و الماس','uploads/products/meta/DXc1p2fKCad0HAL1MTaWesda3aT27WcVOMgLn9IO.jpg',NULL,'ساعت-مچی-آویان-کو-سرامیک-سفید-الماس-|-مدل-W108D-CvbVw',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:41:50'),
(75,'ساعت مچی آویان کو اسنس ۲ قیراط | مدل 8639699615803','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-essence-collection-womens-diamond-watch-2-00-ctw-8639699615803_520x.jpg\"]','uploads/products/thumbnail/qfJdd4MYvQg91cVVB4xIj7is37I5wIAfJ0vbNNi9.jpg','uploads/products/featured/LtJS9c5euRj97rHh4crQRYMNjvzGLKBdBp60IQZm.jpg','uploads/products/flash_deal/Sa3KOGSGJHUprlcl91NCNt3CYhD76Z7GMR1ctOqg.jpg','youtube',NULL,'آویان کو, اسنس, ساعت زنانه, ۲ قیراط','ساعت مچی زنانه اسنس با ۲ قیراط الماس برلیان در قاب استیل ضدزنگ. صفحه صورتی با نشان‌های الماس. بند استیل. طراحی ظریف و مجلل مناسب هدیه.',35000000,26000000,1,'[]','[]','[\"#FFB6C1\",\"#C0C0C0\"]',NULL,1,1,0,4,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو اسنس ۲ قیراط الماس','خرید ساعت مچی زنانه آویان کو اسنس با ۲ قیراط الماس','uploads/products/meta/watch-avianne-co-essence-collection-womens-diamond-watch-2-00-ctw-8639699615803_520x.jpg',NULL,'ساعت-مچی-آویان-کو-اسنس-۲-قیراط-|-مدل-8639699615803-CeyNh',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:24:14'),
(76,'ساعت مچی آویان کو سرامیک مشکی کرنو ۱.۳۲ قیراط | مدل W108BKB','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-mens-ceramic-stainless-steel-black-chrono-black-diamond-watch-1-32-ctw-w108bkb-8639692734523_520x.jpg\"]','uploads/products/thumbnail/bXcSViwSOjSa7eHOBVuFyquWdcqb54vUbjUPc3RB.jpg','uploads/products/featured/0RameZvA8QUbbPZMtwWWaibfyvC03kn8poPiYaFp.jpg','uploads/products/flash_deal/qEoKlAiLbo29ys6amk6ym9DS98J7qEmh9O2ZpWgF.jpg','youtube',NULL,'آویان کو, سرامیک مشکی, کرنوگراف, الماس سیاه','ساعت مچی مردانه با قاب سرامیک مشکی و استیل ضدزنگ. کرنوگراف با نمایش روز/تاریخ. ۱.۳۲ قیراط الماس سیاه روی صفحه. بند استیل مشکی با قفل ایمن. طراحی اسپرت و لوکس.',62000000,48000000,1,'[]','[]','[\"#000000\"]',NULL,1,1,1,4,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو سرامیک مشکی کرنو','خرید ساعت مچی مردانه آویان کو با سرامیک مشکی و کرنوگراف','uploads/products/meta/watch-avianne-co-mens-ceramic-stainless-steel-black-chrono-black-diamond-watch-1-32-ctw-w108bkb-8639692734523_520x.jpg',NULL,'ساعت-مچی-آویان-کو-سرامیک-مشکی-کرنو-۱.۳۲-قیراط-|-مدل-W108BKB-OwZzL',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:25:41'),
(77,'ساعت مچی آویان کو سرامیک مشکی کرنو ۳.۸۳ قیراط | مدل W108BKA','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-mens-ceramic-stainless-steel-black-chrono-black-diamond-watch-3-83-ctw-w108bka-8639692570683_520x.jpg\"]','uploads/products/thumbnail/ZWRQdMRPwCjCpeaE9QAYtIhaGWlZba5EjGWIp3uv.jpg','uploads/products/featured/pughMY6z4EF7W3tpB9b8gPFS913eOq8mWHGGTblt.jpg','uploads/products/flash_deal/axaMIRk46GsqSMMq6Hkbk6IWjOaKqzEdlYW0zpKO.jpg','youtube',NULL,'آویان کو, سرامیک مشکی, کرنوگراف, ۳.۸۳ قیراط','ساعت مچی مردانه با قاب سرامیک مشکی و ۳.۸۳ قیراط الماس سیاه برلیان. کرنوگراف پیشرفته با نمایش روز و تاریخ. صفحه مشکی با جزئیات طلایی. بند استیل مشکی با قفل ایمن.',72000000,55000000,1,'[]','[]','[\"#000000\",\"#FFD700\"]',NULL,1,1,1,3,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو سرامیک مشکی ۳.۸۳ قیراط','خرید ساعت مچی آویان کو با سرامیک مشکی و ۳.۸۳ قیراط الماس','uploads/products/meta/watch-avianne-co-mens-ceramic-stainless-steel-black-chrono-black-diamond-watch-3-83-ctw-w108bka-8639692570683_520x.jpg',NULL,'ساعت-مچی-آویان-کو-سرامیک-مشکی-کرنو-۳.۸۳-قیراط-|-مدل-W108BKA-5lb6O',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:26:33'),
(78,'ساعت مچی آویان کو سرامیک مشکی کرنو ۱.۳۲ قیراط | مدل W108BKD','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-mens-ceramic-stainless-steel-black-chrono-diamond-watch-1-32-ctw-w108bkd-8639692800059_520x.jpg\"]','uploads/products/thumbnail/NunBqy66zZ91d1agmt4ejlFL1Lq2XH86CzntFz1c.jpg','uploads/products/featured/lHwRD7mGaLQjgxIKMBZmhU2k64XGjK0Cpbph1ETA.jpg','uploads/products/flash_deal/c9CT88oRk9EWWrGIo5bynHff3GMfSpAo8q4Wl9JP.jpg','youtube',NULL,'آویان کو, سرامیک مشکی, کرنوگراف, الماس','ساعت مچی مردانه با قاب سرامیک مشکی و استیل ضدزنگ. کرنوگراف با نمایش روز/تاریخ. ۱.۳۲ قیراط الماس سفید برلیان روی صفحه. بند استیل مشکی. طراحی اسپرت و لوکس.',60000000,46000000,1,'[]','[]','[\"#000000\"]',NULL,1,1,0,4,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو سرامیک مشکی کرنو الماس','خرید ساعت مچی آویان کو با سرامیک مشکی و الماس سفید','uploads/products/meta/watch-avianne-co-mens-ceramic-stainless-steel-black-chrono-diamond-watch-1-32-ctw-w108bkd-8639692800059_520x.jpg',NULL,'ساعت-مچی-آویان-کو-سرامیک-مشکی-کرنو-۱.۳۲-قیراط-|-مدل-W108BKD-Fiq71',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:27:30'),
(79,'ساعت مچی آویان کو پرنس PVD الماس ۵.۶۵ قیراط | مدل 8639695355963','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-mens-prince-collection-pvd-diamond-watch-5-65-ctw-8639695355963_520x.jpg\"]','uploads/products/thumbnail/Nj8JgBo8upboSxZazms6czUFfQm9SPU3LyK9rhsc.jpg','uploads/products/featured/ckdxsWCIiLhZOo4QKRmUshSD1Ddu3XigEgz9DI5j.jpg','uploads/products/flash_deal/lBM15aEnWTq9W0Frotur08VRLz0a7cyT71WiqsZx.jpg','youtube',NULL,'آویان کو, پرنس, PVD, الماس ۵.۶۵ قیراط','ساعت مچی مردانه از کلکسیون پرنس با قاب استیل PVD طلایی و ۵.۶۵ قیراط الماس برلیان. صفحه مشکی با جزئیات طلایی و کرنوگراف. بند استیل طلایی با قفل ایمن. طراحی سلطنتی و مجلل.',85000000,65000000,1,'[]','[]','[\"#000000\",\"#FFD700\"]',NULL,1,1,1,3,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو پرنس PVD الماس ۵.۶۵ قیراط','خرید ساعت مچی مردانه آویان کو پرنس با PVD طلایی و ۵.۶۵ قیراط الماس','uploads/products/meta/watch-avianne-co-mens-prince-collection-pvd-diamond-watch-5-65-ctw-8639695355963_520x.jpg',NULL,'ساعت-مچی-آویان-کو-پرنس-PVD-الماس-۵.۶۵-قیراط-|-مدل-8639695355963-ZWcMS',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:28:22'),
(80,'ساعت مچی آویان کو توربیلون PVD طلایی | مدل 8638678532155','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-mens-steel-tourbillon-pvd-plated-diamond-watch-8638678532155_520x.jpg\"]','uploads/products/thumbnail/Fgb5pne8gQBG12k6tpyxNrl1LVmI1fR2TSJQRoGe.jpg','uploads/products/featured/d2406LmKyvn7ruuksHIOaIG8FDi5E7z0VOcAicwm.jpg','uploads/products/flash_deal/6VnoxycvZmg9Vrb5Dijh3iKNRufMLfNyuwOuxDXN.jpg','youtube',NULL,'آویان کو, توربیلون, PVD, الماس','ساعت مچی مردانه با توربیلون نمایان و قاب استیل PVD طلایی. صفحه مشکی با الماس‌های دور صفحه و نشان‌های طلایی. بند چرم تمساح اصل قهوه‌ای. طراحی مکانیکی لوکس با موتور اتوماتیک.',95000000,72000000,1,'[]','[]','[\"#FFD700\",\"#8B4513\"]',NULL,1,1,1,2,'دستگاه',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو توربیلون PVD طلایی','خرید ساعت مچی آویان کو با توربیلون و قاب PVD طلایی','uploads/products/meta/watch-avianne-co-mens-steel-tourbillon-pvd-plated-diamond-watch-8638678532155_520x.jpg',NULL,'ساعت-مچی-آویان-کو-توربیلون-PVD-طلایی-|-مدل-8638678532155-QG78p',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:30:14'),
(81,'ساعت مچی آویان کو اسولت زنانه ۱.۸۵ قیراط | مدل W15625L','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-svelte-womens-diamond-watch-1-85-ctw-w15625l-8639699124283_520x.jpg\"]','uploads/products/thumbnail/50dm8Q6x1NJPodXI3QCWC6dB3qQ8XxBBrfHFRxDj.jpg','uploads/products/featured/278DZ2loXNWBxDmcG5sipm20NBNM0RiJ0f1sgh2S.jpg','uploads/products/flash_deal/aHlVFaOvhwJ1II53TAqNxJnCXnofuTfFtblSS273.jpg','youtube',NULL,'آویان کو, اسولت, ساعت زنانه, ۱.۸۵ قیراط','ساعت مچی زنانه اسولت با قاب استیل ضدزنگ و ۱.۸۵ قیراط الماس برلیان. صفحه مرواریدی با جزئیات ظریف و نشان‌های طلایی. بند استیل. طراحی باریک و مینیمال مناسب مچ‌های ظریف.',28000000,21000000,1,'[]','[]','[\"#C0C0C0\",\"#FFFFFF\"]',NULL,1,1,0,6,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو اسولت زنانه ۱.۸۵ قیراط','خرید ساعت مچی زنانه آویان کو اسولت با ۱.۸۵ قیراط الماس','uploads/products/meta/watch-avianne-co-svelte-womens-diamond-watch-1-85-ctw-w15625l-8639699124283_520x.jpg',NULL,'ساعت-مچی-آویان-کو-اسولت-زنانه-۱.۸۵-قیراط-|-مدل-W15625L-YhrTS',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:29:24'),
(82,'ساعت مچی آویان کو سرامیک سفید کرنو | مدل W108B','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-unisex-ceramic-stainless-steel-white-chrono-diamond-watch-1-60-ctw-w108b-31562902929467_520x.jpg\"]','uploads/products/thumbnail/aGQMUsb57U1VNNcIHd9G5aILmcAt0pp1xnPLc8VG.jpg','uploads/products/featured/O9apb4ZgovbFVC9XlFyTZC3X2XCnnBksqDhtqwc3.jpg','uploads/products/flash_deal/tr5Lp1lblkfhZAt1T9htOrlZfNIIm58sg1iL76kH.jpg','youtube',NULL,'آویان کو, سرامیک سفید, کرنوگراف, یونیسکس','ساعت مچی یونیسکس با قاب سرامیک سفید و استیل ضدزنگ. کرنوگراف با نمایش روز/تاریخ. ۱.۶۰ قیراط الماس برلیان دور صفحه. بند استیل سفید با قفل ایمن. طراحی مدرن و شیک.',48000000,36000000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,5,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو سرامیک سفید کرنو','خرید ساعت مچی یونیسکس آویان کو با سرامیک سفید و کرنوگراف','uploads/products/meta/watch-avianne-co-unisex-ceramic-stainless-steel-white-chrono-diamond-watch-1-60-ctw-w108b-31562902929467_520x.jpg',NULL,'ساعت-مچی-آویان-کو-سرامیک-سفید-کرنو-|-مدل-W108B-wTmLm',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:31:35'),
(83,'ساعت مچی آویان کو سرامیک سفید مینیمال | مدل W108A','admin',12,5,107,134,6,'[\"uploads\\/products\\/photos\\/watch-avianne-co-white-ceramic-diamond-watch-w108a-28506452852795_520x.jpg\"]','uploads/products/thumbnail/cyJbC4OtPHyLwV3O1sTbujk4zhn6DntgDAKaB9Aq.jpg','uploads/products/featured/watch-avianne-co-white-ceramic-diamond-watch-w108a-28506452852795_520x.jpg','uploads/products/flash_deal/J4BvXICmKDwRyTQCyxWBnpneST5Zb8nisXB3c4DO.jpg','youtube',NULL,'آویان کو, سرامیک سفید, الماس, مینیمال','ساعت مچی با قاب سرامیک سفید و الماس‌های دور صفحه. صفحه سفید با نشان‌های طلایی. بند سرامیک سفید با قفل ایمن. طراحی مینیمال و شیک مناسب استفاده روزمره و مهمانی.',38000000,28000000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,6,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ساعت آویان کو سرامیک سفید مینیمال','خرید ساعت مچی آویان کو با سرامیک سفید و طراحی مینیمال','uploads/products/meta/watch-avianne-co-white-ceramic-diamond-watch-w108a-28506452852795_520x.jpg',NULL,'ساعت-مچی-آویان-کو-سرامیک-سفید-مینیمال-|-مدل-W108A-vccaO',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:44:49');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `repair_orders`
--

DROP TABLE IF EXISTS `repair_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `jewelry_certificate_id` int(10) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `repair_type` enum('cleaning','restoration','resizing','other') DEFAULT NULL,
  `location` enum('workshop','customer') DEFAULT 'workshop',
  `scheduled_date` date DEFAULT NULL,
  `estimated_delivery_date` date DEFAULT NULL,
  `estimated_cost` decimal(15,2) DEFAULT NULL,
  `final_cost` decimal(15,2) DEFAULT NULL,
  `assigned_to` int(10) unsigned DEFAULT NULL,
  `priority` enum('normal','urgent') DEFAULT 'normal',
  `photo` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('pending','in_progress','completed','delivered','cancelled') DEFAULT 'pending',
  `completion_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `repair_orders_order_number_unique` (`order_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_orders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `repair_orders` WRITE;
/*!40000 ALTER TABLE `repair_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_orders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `repair_status_histories`
--

DROP TABLE IF EXISTS `repair_status_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_status_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `repair_order_id` bigint(20) unsigned NOT NULL,
  `status` enum('pending','in_progress','completed','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_status_histories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `repair_status_histories` WRITE;
/*!40000 ALTER TABLE `repair_status_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_status_histories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `repair_technicians`
--

DROP TABLE IF EXISTS `repair_technicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_technicians` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL,
  `certificate` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `repair_technicians_user_id_unique` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_technicians`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `repair_technicians` WRITE;
/*!40000 ALTER TABLE `repair_technicians` DISABLE KEYS */;
INSERT INTO `repair_technicians` VALUES
(1,2,'طلاسازی',5,NULL,1,'2026-08-22 18:08:12','2026-08-22 18:08:12');
/*!40000 ALTER TABLE `repair_technicians` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `viewed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `assigned_by` int(10) unsigned DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  KEY `role_user_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES
(1,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(2,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(3,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(4,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(5,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(6,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(8,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(9,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(10,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(11,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(12,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(13,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(14,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(15,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(16,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(17,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(18,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(19,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(20,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(21,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(22,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(23,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(24,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(25,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(26,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(27,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(28,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(29,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(30,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(31,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(32,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(33,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(34,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(35,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(36,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(37,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(38,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(39,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(40,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(41,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(42,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(43,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(44,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(45,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(46,1,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24'),
(47,6,NULL,'2026-10-12 15:54:24','2026-10-12 15:54:24','2026-10-12 15:54:24');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `level` smallint(5) unsigned NOT NULL DEFAULT 0,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'مدیر کل سیستم','super_admin','[\"dashboard.view\",\"settings.view\",\"settings.update\",\"users.view\",\"users.create\",\"users.update\",\"users.delete\",\"roles.view\",\"roles.create\",\"roles.update\",\"roles.delete\",\"roles.assign\",\"permissions.view\",\"permissions.create\",\"permissions.delete\",\"audit_logs.view\",\"security.reports.view\",\"products.view\",\"products.create\",\"products.update\",\"products.delete\",\"products.publish\",\"categories.view\",\"categories.manage\",\"brands.view\",\"brands.manage\",\"stock.view\",\"stock.update\",\"products.images.manage\",\"orders.view\",\"orders.update\",\"orders.update_status\",\"orders.delete\",\"orders.invoice\",\"sales.reports.view\",\"sellers.view\",\"sellers.approve\",\"coupons.manage\",\"withdraw_requests.view\",\"withdraw_requests.approve\",\"jewelry.dashboard.view\",\"jewelry.owners.view\",\"jewelry.owners.create\",\"jewelry.owners.update\",\"jewelry.owners.delete\",\"jewelry.certificates.view\",\"jewelry.certificates.create\",\"jewelry.certificates.update\",\"jewelry.certificates.delete\",\"jewelry.certificates.verify\",\"jewelry.certificates.download\",\"jewelry.certificates.print\",\"jewelry.repairs.view\",\"jewelry.repairs.create\",\"jewelry.repairs.update\",\"jewelry.repairs.update_status\",\"jewelry.repairs.assign\",\"jewelry.repairs.delete\",\"jewelry.transfers.view\",\"jewelry.transfers.create\",\"jewelry.transfers.approve\",\"jewelry.transfers.reject\",\"jewelry.transfers.cancel\",\"jewelry.transfers.delete\",\"jewelry.missing_reports.view\",\"jewelry.missing_reports.create\",\"jewelry.missing_reports.update_status\",\"jewelry.missing_reports.print\",\"jewelry.reports.view\",\"jewelry.reports.export\",\"articles.view\",\"articles.view_own\",\"articles.create\",\"articles.update\",\"articles.update_any\",\"articles.submit\",\"articles.publish\",\"articles.delete\",\"articles.categories.manage\",\"articles.images.manage\",\"pages.manage\",\"sliders.manage\",\"banners.manage\",\"policies.manage\",\"seo.manage\",\"languages.manage\"]','دسترسی مدیریتی به تمام بخش‌ها، مدیریت کاربران، نقش‌ها و مجوزها، تنظیمات اصلی و گزارش‌های امنیتی.',100,1,1,'2026-10-12 15:54:23','2026-10-12 15:54:24'),
(2,'مدیر فروشگاه','store_manager','[\"dashboard.view\",\"products.view\",\"products.create\",\"products.update\",\"products.delete\",\"products.publish\",\"categories.view\",\"categories.manage\",\"brands.view\",\"brands.manage\",\"stock.view\",\"stock.update\",\"products.images.manage\",\"orders.view\",\"orders.update\",\"orders.update_status\",\"orders.invoice\",\"sales.reports.view\",\"coupons.manage\",\"jewelry.dashboard.view\",\"jewelry.certificates.view\",\"jewelry.certificates.print\"]','مدیریت محصولات طلا و جواهرات، دسته‌بندی‌ها، تصاویر، موجودی و سفارش‌ها. بدون دسترسی به تغییر مالکیت.',60,1,1,'2026-10-12 15:54:24','2026-10-12 16:09:49'),
(3,'تکنسین تعمیرات','repair_technician','[\"dashboard.view\",\"jewelry.dashboard.view\",\"jewelry.certificates.view\",\"jewelry.repairs.view\",\"jewelry.repairs.create\",\"jewelry.repairs.update\",\"jewelry.repairs.update_status\"]','مشاهده سفارش‌های تعمیر مجاز، ثبت عیب، شرح تعمیر، هزینه و قطعات مصرفی، تغییر وضعیت و ثبت گزارش نهایی. بدون دسترسی به سایر بخش‌ها.',40,1,1,'2026-10-12 15:54:24','2026-10-12 16:09:49'),
(4,'مدیر مالکیت','ownership_manager','[\"dashboard.view\",\"jewelry.dashboard.view\",\"jewelry.owners.view\",\"jewelry.owners.create\",\"jewelry.owners.update\",\"jewelry.certificates.view\",\"jewelry.certificates.verify\",\"jewelry.certificates.download\",\"jewelry.certificates.print\",\"jewelry.transfers.view\",\"jewelry.transfers.create\",\"jewelry.transfers.approve\",\"jewelry.transfers.reject\",\"jewelry.transfers.cancel\",\"jewelry.missing_reports.view\",\"jewelry.missing_reports.update_status\",\"jewelry.reports.view\"]','مشاهده سوابق مالکیت، ثبت درخواست انتقال، بررسی و تأیید درخواست‌ها، مشاهده تاریخچه انتقال. بدون دسترسی به بخش‌های نامرتبط.',50,1,1,'2026-10-12 15:54:24','2026-10-12 16:09:49'),
(5,'مدیر محتوا','content_manager','[\"dashboard.view\",\"articles.view\",\"articles.view_own\",\"articles.create\",\"articles.update\",\"articles.submit\",\"articles.publish\",\"articles.delete\",\"articles.categories.manage\",\"articles.images.manage\",\"pages.manage\"]','ایجاد و ویرایش مقالات، مدیریت دسته‌بندی‌ها و تصاویر، مدیریت وضعیت انتشار مقالات.',30,1,1,'2026-10-12 15:54:24','2026-10-12 15:54:24'),
(6,'کاربر عادی','customer','[]','مشاهده صفحات عمومی، مدیریت اطلاعات حساب خود، دسترسی فقط به اطلاعات متعلق به خود.',10,1,1,'2026-10-12 15:54:24','2026-10-12 15:54:24');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `searches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query` text NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `seller_withdraw_requests`
--

DROP TABLE IF EXISTS `seller_withdraw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_withdraw_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `viewed` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `seller_withdraw_requests_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_withdraw_requests`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `seller_withdraw_requests` WRITE;
/*!40000 ALTER TABLE `seller_withdraw_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_withdraw_requests` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `verification_status` tinyint(1) NOT NULL DEFAULT 0,
  `verification_info` text DEFAULT NULL,
  `cash_on_delivery_status` tinyint(1) NOT NULL DEFAULT 0,
  `sslcommerz_status` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_status` tinyint(1) NOT NULL DEFAULT 0,
  `paypal_client_id` varchar(255) DEFAULT NULL,
  `paypal_client_secret` varchar(255) DEFAULT NULL,
  `ssl_store_id` varchar(255) DEFAULT NULL,
  `ssl_password` varchar(255) DEFAULT NULL,
  `stripe_key` varchar(255) DEFAULT NULL,
  `stripe_secret` varchar(255) DEFAULT NULL,
  `instamojo_status` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_api_key` varchar(255) DEFAULT NULL,
  `instamojo_token` varchar(255) DEFAULT NULL,
  `razorpay_status` tinyint(1) NOT NULL DEFAULT 0,
  `razorpay_api_key` varchar(255) DEFAULT NULL,
  `razorpay_secret` varchar(255) DEFAULT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `seo_settings`
--

DROP TABLE IF EXISTS `seo_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `og_title` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `twitter_title` text DEFAULT NULL,
  `twitter_description` text DEFAULT NULL,
  `twitter_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `author` varchar(191) DEFAULT NULL,
  `revisit` int(10) unsigned NOT NULL DEFAULT 7,
  `sitemap_link` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `seo_settings` WRITE;
/*!40000 ALTER TABLE `seo_settings` DISABLE KEYS */;
INSERT INTO `seo_settings` VALUES
(1,'پلتفرم اختصاصی طلا و جواهرات','پلتفرم اختصاصی طلا و جواهرات',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-09-07 05:36:26','2026-09-07 05:36:26','','پلتفرم اختصاصی طلا و جواهرات',7,NULL,'پلتفرم اختصاصی طلا و جواهرات');
/*!40000 ALTER TABLE `seo_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `sliders` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `delivery_pickup_latitude` text DEFAULT NULL,
  `delivery_pickup_longitude` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `shops_slug_unique` (`slug`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT 1,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES
(1,'uploads/sliders/kharazi-slide-1.png',1,'/products/new','2026-08-22 18:08:12','2026-08-22 18:08:12'),
(2,'uploads/sliders/kharazi-slide-2.png',1,'/products/featured','2026-08-22 18:08:12','2026-08-22 18:08:12'),
(3,'uploads/sliders/kharazi-slide-3.png',1,'/products/discounted','2026-08-22 18:08:12','2026-08-22 18:08:12'),
(4,'uploads/sliders/kharazi-slide-4.png',1,'/products/best-selling','2026-08-22 18:08:12','2026-08-22 18:08:12'),
(5,'uploads/sliders/slider-5.jpg',0,'#','2026-08-22 18:08:12','2026-08-22 18:08:12');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES
(105,'طلا و سکه مردانه',4,'gold-male','طلا و سکه مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(106,'طلا و سکه زنانه',4,'gold-female','طلا و سکه زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(107,'ساعت مردانه',5,'watch-male','ساعت مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(108,'ساعت زنانه',5,'watch-female','ساعت زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(109,'جواهرات مردانه',6,'jewelry-male','جواهرات مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(110,'جواهرات زنانه',6,'jewelry-female','جواهرات زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(111,'جواهرات مردانه',7,'jewelry-male','جواهرات مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(112,'جواهرات زنانه',7,'jewelry-female','جواهرات زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(113,'انگشتر و دستبند مردانه',8,'ring-bracelet-male','انگشتر و دستبند مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(114,'انگشتر و دستبند زنانه',8,'ring-bracelet-female','انگشتر و دستبند زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(115,'گردنبند و پابند مردانه',9,'necklace-anklet-male','گردنبند و پابند مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(116,'گردنبند و پابند زنانه',9,'necklace-anklet-female','گردنبند و پابند زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(117,'سنگ‌های قیمتی مردانه',12,'gemstone-male','سنگ‌های قیمتی مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(118,'سنگ‌های قیمتی زنانه',12,'gemstone-female','سنگ‌های قیمتی زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(119,'اکسسوری طلا مردانه',13,'accessory-gold-male','اکسسوری طلا مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(120,'اکسسوری طلا زنانه',13,'accessory-gold-female','اکسسوری طلا زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(121,'هدیه و اقلام لوکس مردانه',14,'gift-luxury-male','هدیه و اقلام لوکس مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(122,'هدیه و اقلام لوکس زنانه',14,'gift-luxury-female','هدیه و اقلام لوکس زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(123,'لوازم جانبی ساعت و جواهر مردانه',15,'accessory-watch-jewelry-male','لوازم جانبی ساعت و جواهر مردانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(124,'لوازم جانبی ساعت و جواهر زنانه',15,'accessory-watch-jewelry-female','لوازم جانبی ساعت و جواهر زنانه','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(1000,'آرایشی صورت',100,'face-makeup','آرایشی صورت',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1001,'آرایشی چشم',100,'eye-makeup','آرایشی چشم',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1002,'آرایشی لب',100,'lip-makeup','آرایشی لب',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1003,'بهداشت پوست',100,'skin-care','بهداشت پوست',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1004,'عطر و ادکلن',100,'perfume-cologne','عطر و ادکلن',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1005,'لوازم جانبی آرایش',100,'makeup-tools','لوازم جانبی آرایش',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1010,'ابزار برقی',101,'power-tools','ابزار برقی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1011,'ابزار دستی',101,'hand-tools','ابزار دستی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1012,'یراق آلات ساختمانی',101,'building-hardware','یراق آلات ساختمانی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1013,'ابزار باغبانی',101,'gardening-tools','ابزار باغبانی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1014,'تجهیزات ایمنی',101,'safety-equipment','تجهیزات ایمنی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1020,'لوازم آشپزخانه',102,'kitchen-appliances','لوازم آشپزخانه',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1021,'لوازم برقی خانگی',102,'home-electrical','لوازم برقی خانگی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1022,'دکوراسیون منزل',102,'home-decor','دکوراسیون منزل',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1023,'مبلمان و سرویس خواب',102,'furniture-bedroom','مبلمان و سرویس خواب',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1024,'نورپردازی',102,'lighting','نورپردازی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1030,'گوشی موبایل',103,'mobile-phones','گوشی موبایل',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1031,'تبلت',103,'tablets','تبلت',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1032,'لپ تاپ و کامپیوتر',103,'laptop-computer','لپ تاپ و کامپیوتر',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1033,'لوازم جانبی موبایل',103,'mobile-accessories','لوازم جانبی موبایل',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1034,'هدفون و هدست',103,'headphones-headsets','هدفون و هدست',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1035,'ساعت هوشمند',103,'smart-watches','ساعت هوشمند',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1040,'پوشاک مردانه',104,'mens-clothing','پوشاک مردانه',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1041,'پوشاک زنانه',104,'womens-clothing','پوشاک زنانه',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1042,'کفش و کیف',104,'shoes-bags','کفش و کیف',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1043,'اکسسوری',104,'accessories','اکسسوری',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1050,'تجهیزات ورزشی',105,'sports-equipment','تجهیزات ورزشی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1051,'لباس ورزشی',105,'sportswear','لباس ورزشی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1052,'لوازم سفر',105,'travel-gear','لوازم سفر',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1053,'کوله پشتی و چمدان',105,'backpacks-luggage','کوله پشتی و چمدان',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1060,'کتاب فارسی',106,'persian-books','کتاب فارسی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1061,'کتاب خارجی',106,'foreign-books','کتاب خارجی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1062,'لوازم تحریر',106,'stationery','لوازم تحریر',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1063,'نوشت افزار',106,'writing-tools','نوشت افزار',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1070,'اسباب بازی فکری',107,'educational-toys','اسباب بازی فکری',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1071,'عروسک و حیوانات',107,'dolls-animals','عروسک و حیوانات',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1072,'بازی های رومیزی',107,'board-games','بازی های رومیزی',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1080,'لوازم بارداری',108,'pregnancy-supplies','لوازم بارداری',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1081,'لوازم نوزاد',108,'baby-supplies','لوازم نوزاد',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1082,'پوشاک کودک',108,'kids-clothing','پوشاک کودک',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sub_sub_categories`
--

DROP TABLE IF EXISTS `sub_sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sub_category_id` (`sub_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_sub_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sub_sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_sub_categories` DISABLE KEYS */;
INSERT INTO `sub_sub_categories` VALUES
(130,105,'سکه امامی','gold-coin-imami','سکه امامی','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(131,105,'شمش طلا','gold-bar','شمش طلا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(132,106,'انگشتر طلا','gold-ring','انگشتر طلا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(133,106,'دستبند طلا','gold-bracelet','دستبند طلا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(134,107,'ساعت کلاسیک مردانه','classic-watch-male','ساعت کلاسیک مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(135,107,'ساعت اسپرت مردانه','sport-watch-male','ساعت اسپرت مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(136,108,'ساعت کلاسیک زنانه','classic-watch-female','ساعت کلاسیک زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(137,108,'ساعت مجلسی زنانه','luxury-watch-female','ساعت مجلسی زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(138,109,'انگشتر جواهر مردانه','ring-jewelry-male','انگشتر جواهر مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(139,109,'دستبند جواهر مردانه','bracelet-jewelry-male','دستبند جواهر مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(140,110,'گردنبند جواهر زنانه','necklace-jewelry-female','گردنبند جواهر زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(141,110,'گوشواره جواهر زنانه','earring-jewelry-female','گوشواره جواهر زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(142,111,'انگشتر طلا مردانه','gold-ring-male','انگشتر طلا مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(143,111,'دستبند طلا مردانه','gold-bracelet-male','دستبند طلا مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(144,112,'انگشتر طلا زنانه','gold-ring-female','انگشتر طلا زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(145,112,'دستبند طلا زنانه','gold-bracelet-female','دستبند طلا زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(146,113,'گردنبند طلا مردانه','gold-necklace-male','گردنبند طلا مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(147,113,'پابند طلا مردانه','gold-anklet-male','پابند طلا مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(148,114,'گردنبند طلا زنانه','gold-necklace-female','گردنبند طلا زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(149,114,'پابند طلا زنانه','gold-anklet-female','پابند طلا زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(150,115,'یاقوت سرخ','ruby-male','یاقوت سرخ','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(151,115,'زمرد','emerald-male','زمرد','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(152,116,'یاقوت سرخ زنانه','ruby-female','یاقوت سرخ زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(153,116,'زمرد زنانه','emerald-female','زمرد زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(154,117,'دکمه سردست طلا','cufflink-gold-male','دکمه سردست طلا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(155,117,'سنجاق یقه طلا','tiepin-gold-male','سنجاق یقه طلا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(156,118,'سنجاق سر طلا','hairpin-gold-female','سنجاق سر طلا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(157,118,'گیره لباس طلا','clothing-pin-gold-female','گیره لباس طلا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(158,119,'ست هدیه مردانه','gift-set-male','ست هدیه مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(159,119,'جعبه هدیه مردانه','gift-box-male','جعبه هدیه مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(160,120,'ست هدیه زنانه','gift-set-female','ست هدیه زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(161,120,'جعبه هدیه زنانه','gift-box-female','جعبه هدیه زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(162,121,'بند ساعت مردانه','watch-strap-male','بند ساعت مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(163,121,'جعبه ساعت مردانه','watch-box-male','جعبه ساعت مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(164,122,'بند ساعت زنانه','watch-strap-female','بند ساعت زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(165,122,'جعبه ساعت زنانه','watch-box-female','جعبه ساعت زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(166,123,'گردنبند مردانه','necklace-jewelry-male','گردنبند مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(167,123,'گوشواره مردانه','earring-jewelry-male','گوشواره مردانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(168,124,'گردنبند زنانه','necklace-jewelry-female','گردنبند زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(169,124,'گوشواره زنانه','earring-jewelry-female','گوشواره زنانه','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(170,1000,'کرم پودر','foundation','کرم پودر',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(171,1000,'کانسیلر','concealer','کانسیلر',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(172,1000,'پنکیک','pancake','پنکیک',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(173,1000,'پودر فیکس','setting-powder','پودر فیکس',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(174,1001,'سایه چشم','eyeshadow','سایه چشم',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(175,1001,'خط چشم','eyeliner','خط چشم',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(176,1001,'مژه مصنوعی','false-lashes','مژه مصنوعی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(177,1001,'ریمل','mascara','ریمل',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(178,1001,'مداد چشم','eyebrow-pencil','مداد چشم',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(179,1002,'رژ لب','lipstick','رژ لب',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(180,1002,'گلاس لب','lip-gloss','گلاس لب',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(181,1002,'خط لب','lip-liner','خط لب',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(182,1002,'بالم لب','lip-balm','بالم لب',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(183,1003,'ضد آفتاب','sunscreen','ضد آفتاب',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(184,1003,'مرطوب کننده','moisturizer','مرطوب کننده',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(185,1003,'تونر','toner','تونر',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(186,1003,'ماسک صورت','face-mask','ماسک صورت',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(187,1003,'پاک کننده صورت','facial-cleanser','پاک کننده صورت',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(188,1004,'عطر مردانه','mens-perfume','عطر مردانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(189,1004,'عطر زنانه','womens-perfume','عطر زنانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(190,1004,'ادکلن','cologne','ادکلن',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(191,1004,'اسپری بدن','body-spray','اسپری بدن',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(192,1005,'براش آرایشی','makeup-brush','براش آرایشی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(193,1005,'اسفنج آرایشی','makeup-sponge','اسفنج آرایشی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(194,1005,'کیف آرایش','makeup-bag','کیف آرایش',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(195,1005,'دستگاه بخور صورت','facial-steamer','دستگاه بخور صورت',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(196,1010,'دریل و پیچ گوشتی','drill-screwdriver','دریل و پیچ گوشتی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(197,1010,'اره برقی','electric-saw','اره برقی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(198,1010,'سنگ سنباده','sander','سنگ سنباده',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(199,1010,'فرز نجاری','router','فرز نجاری',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(200,1011,'آچار و انبردست','wrench-pliers','آچار و انبردست',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(201,1011,'پیچ گوشتی','screwdriver','پیچ گوشتی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(202,1011,'چکش','hammer','چکش',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(203,1011,'آچار آلن','allen-key','آچار آلن',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(204,1012,'دستگیره درب','door-handle','دستگیره درب',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(205,1012,'قفل و کلید','lock-key','قفل و کلید',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(206,1012,'لولا','hinge','لولا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(207,1012,'پیچ و رولپلاک','screw-anchor','پیچ و رولپلاک',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(208,1020,'قابلمه و تابه','pots-pans','قابلمه و تابه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(209,1020,'ظروف سرویس','dinnerware','ظروف سرویس',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(210,1020,'چاقو و وسایل برش','knives-cutlery','چاقو و وسایل برش',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(211,1020,'لوازم شیرینی پزی','baking-supplies','لوازم شیرینی پزی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(212,1020,'سرویس قاشق و چنگال','cutlery-set','سرویس قاشق و چنگال',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(213,1021,'یخچال و فریزر','refrigerator','یخچال و فریزر',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(214,1021,'ماشین لباسشویی','washing-machine','ماشین لباسشویی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(215,1021,'جاروبرقی','vacuum-cleaner','جاروبرقی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(216,1021,'مایکروویو','microwave','مایکروویو',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(217,1021,'مخلوط کن و غذاساز','blender-food-processor','مخلوط کن و غذاساز',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(218,1022,'تابلو و قاب عکس','painting-photoframe','تابلو و قاب عکس',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(219,1022,'گلدان و گل مصنوعی','vase-artificial-flower','گلدان و گل مصنوعی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(220,1022,'ساعت دیواری','wall-clock','ساعت دیواری',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(221,1022,'شمع و لوازم تزئینی','candle-decoration','شمع و لوازم تزئینی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(222,1030,'گوشی سامسونگ','samsung-phone','گوشی سامسونگ',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(223,1030,'گوشی اپل','apple-iphone','گوشی اپل',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(224,1030,'گوشی شیائومی','xiaomi-phone','گوشی شیائومی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(225,1030,'گوشی هوآوی','huawei-phone','گوشی هوآوی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(226,1030,'گوشی نوکیا','nokia-phone','گوشی نوکیا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(227,1031,'تبلت سامسونگ','samsung-tablet','تبلت سامسونگ',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(228,1031,'تبلت اپل آیپد','apple-ipad','تبلت اپل آیپد',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(229,1031,'تبلت لنوو','lenovo-tablet','تبلت لنوو',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(230,1031,'تبلت هواوی','huawei-tablet','تبلت هواوی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(231,1032,'لپ تاپ ایسوس','asus-laptop','لپ تاپ ایسوس',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(232,1032,'لپ تاپ لنوو','lenovo-laptop','لپ تاپ لنوو',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(233,1032,'لپ تاپ اچ پی','hp-laptop','لپ تاپ اچ پی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(234,1032,'لپ تاپ دل','dell-laptop','لپ تاپ دل',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(235,1032,'کیس و قطعات کامپیوتر','computer-pc-parts','کیس و قطعات کامپیوتر',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(236,1033,'قاب و کاور موبایل','phone-case','قاب و کاور موبایل',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(237,1033,'محافظ صفحه نمایش','screen-protector','محافظ صفحه نمایش',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(238,1033,'پاوربانک','powerbank','پاوربانک',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(239,1033,'شارژر و کابل','charger-cable','شارژر و کابل',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(240,1033,'هولدر و پایه خودرو','car-holder','هولدر و پایه خودرو',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(241,1034,'هدفون بی سیم','wireless-headphone','هدفون بی سیم',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(242,1034,'هدفون سیمی','wired-headphone','هدفون سیمی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(243,1034,'هدست گیمینگ','gaming-headset','هدست گیمینگ',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(244,1034,'هدفون True Wireless','tw-headphone','هدفون True Wireless',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(245,1040,'تیشرت و پولوشرت مردانه','mens-tshirt-polo','تیشرت و پولوشرت مردانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(246,1040,'پیراهن مردانه','mens-shirt','پیراهن مردانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(247,1040,'شلوار مردانه','mens-pants','شلوار مردانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(248,1040,'کت و شلوار','suit-blazer','کت و شلوار',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(249,1040,'ژاکت و هودی','hoodie-sweater','ژاکت و هودی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(250,1040,'کت و پالتو','coat-jacket','کت و پالتو',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(251,1041,'بلوز و تاپ زنانه','womens-blouse-top','بلوز و تاپ زنانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(252,1041,'شلوار زنانه','womens-pants','شلوار زنانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(253,1041,'لباس و مانتو','dress-manteau','لباس و مانتو',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(254,1041,'دامن','skirt','دامن',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(255,1041,'کت و جلیقه','jacket-vest','کت و جلیقه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(256,1041,'شومیز','shirt-blouse','شومیز',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(257,1042,'کفش مردانه','mens-shoes','کفش مردانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(258,1042,'کفش زنانه','womens-shoes','کفش زنانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(259,1042,'کفش ورزشی','sports-shoes','کفش ورزشی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(260,1042,'کیف مردانه','mens-bag','کیف مردانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(261,1042,'کیف زنانه','womens-bag','کیف زنانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(262,1042,'کوله پشتی','backpack','کوله پشتی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(263,1043,'عینک آفتابی','sunglasses','عینک آفتابی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(264,1043,'کلاه','hat-cap','کلاه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(265,1043,'شال و روسری','scarf-shawl','شال و روسری',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(266,1043,'کمربند','belt','کمربند',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(267,1050,'لوازم بدنسازی','fitness-equipment','لوازم بدنسازی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(268,1050,'لوازم فوتبال','football-gear','لوازم فوتبال',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(269,1050,'لوازم شنا','swimming-gear','لوازم شنا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(270,1050,'لوازم کوهنوردی','mountaineering-gear','لوازم کوهنوردی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(271,1051,'تیشرت ورزشی','sports-tshirt','تیشرت ورزشی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(272,1051,'شلوار ورزشی','sports-pants','شلوار ورزشی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(273,1051,'کفش ورزشی','sports-shoes','کفش ورزشی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(274,1051,'لباس ورزشی زنانه','womens-sportswear','لباس ورزشی زنانه',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(275,1052,'چمدان و ساک','suitcase-bag','چمدان و ساک',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(276,1052,'کیف مسافرتی','travel-bag','کیف مسافرتی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(277,1052,'لوازم بهداشتی سفر','travel-toiletries','لوازم بهداشتی سفر',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(278,1052,'بالش و پتو مسافرتی','travel-pillow-blanket','بالش و پتو مسافرتی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(279,1062,'خودکار و روان نویس','pen-rollerball','خودکار و روان نویس',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(280,1062,'مداد و تراش','pencil-sharpener','مداد و تراش',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(281,1062,'پاک کن و خط کش','eraser-ruler','پاک کن و خط کش',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(282,1062,'دفتر و یادداشت','notebook-notepad','دفتر و یادداشت',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(283,1062,'کیف و جامدادی','pencil-case-bag','کیف و جامدادی',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06');
/*!40000 ALTER TABLE `sub_sub_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `subscribers_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `reply` text NOT NULL,
  `files` varchar(1000) DEFAULT NULL,
  `viewed` tinyint(4) NOT NULL DEFAULT 0,
  `client_viewed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `files` varchar(1000) DEFAULT NULL,
  `viewed` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `client_viewed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tickets_code_unique` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) DEFAULT NULL,
  `user_type` varchar(10) NOT NULL DEFAULT 'customer',
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `role` enum('admin','technician','customer') DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `avatar_original` varchar(256) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `referral_code` varchar(255) DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,NULL,NULL,'admin','مدیر سیستم','admin@example.com','admin',NULL,'$2y$10$vyiEytr3RPcwh.VE/DrqQOcHwi9lJr/0wc0eoIowXfDgPxkMZdYCG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,0,'2026-08-22 18:08:12','2026-08-22 18:08:12'),
(2,NULL,NULL,'customer','تکنسین نمونه','tech@example.com','technician',NULL,'$2y$10$vyiEytr3RPcwh.VE/DrqQOcHwi9lJr/0wc0eoIowXfDgPxkMZdYCG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,0,'2026-08-22 18:08:12','2026-08-22 18:08:12'),
(3,NULL,NULL,'customer','مشتری نمونه','customer@example.com','customer',NULL,'$2y$10$vyiEytr3RPcwh.VE/DrqQOcHwi9lJr/0wc0eoIowXfDgPxkMZdYCG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,0,'2026-08-22 18:08:12','2026-08-22 18:08:12'),
(4,NULL,NULL,'admin','مدیریت دریکانا','admin@drikana.com','admin','2026-09-07 00:25:52','$2y$10$vyiEytr3RPcwh.VE/DrqQOcHwi9lJr/0wc0eoIowXfDgPxkMZdYCG',NULL,NULL,NULL,'تهران، بازار بزرگ طلا و جواهر',NULL,'تهران',NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-07 00:25:52','2026-09-07 00:25:52'),
(5,NULL,NULL,'customer','Admin User','admin_test@example.com','customer',NULL,'$2y$04$vhFk5ogbswKfPA6rwlJX9.HWRDCdb4dD4MWI3NKy5fdvJgcJMyPWS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:07:31','2026-09-19 16:07:31'),
(6,NULL,NULL,'customer','Real Customer','customer_test@example.com','customer',NULL,'$2y$04$LqZpi26nc679Us7UCGbZMum/kUv4yigtfw7qhA0emCgyhoqe9d0rC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:07:31','2026-09-19 16:07:31'),
(8,NULL,NULL,'customer','Admin User','admin_6aaee4caccdb01.76279149@example.com','customer',NULL,'$2y$04$McwewwgO3uYOGC/nGAp1o.Oo08D6T1BZAClHIIrCvTeC9fwMum8Pi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:08:50','2026-09-19 16:08:50'),
(9,NULL,NULL,'customer','Real Customer','customer_6aaee4cad13c93.78306226@example.com','customer',NULL,'$2y$04$FW0ll10uJv5Z8LaXDnEAfORifQOewyIHEJ87b9WVvm6UZPMm51i8O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:08:50','2026-09-19 16:08:50'),
(10,NULL,NULL,'admin','Admin User','admin_6aaee4fa3a4e93.14401188@example.com','customer','2026-09-19 16:09:38','$2y$04$Z6MMh6ZScFzg3ma7.7BJxuXWKcik9YZukRKAyKHLCxyUx8Ym5gt/a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:09:38','2026-09-19 16:09:38'),
(11,NULL,NULL,'customer','Real Customer','customer_6aaee4fa3f4e79.56089932@example.com','customer','2026-09-19 16:09:38','$2y$04$wLLxtTr9c1/uyzKw/ItEv.5uOOF4wWgTFM4mmyQX9U6ldlruifHVO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:09:38','2026-09-19 16:09:38'),
(12,NULL,NULL,'admin','Admin User','admin_6aaee518381ac6.77838445@example.com','customer','2026-09-19 16:10:08','$2y$04$WXLTNfH0LAt/VHqpkJyCwOfPkgtJJzhH2Qs6r0lKs6wjb6aojHGra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:10:08','2026-09-19 16:10:08'),
(13,NULL,NULL,'customer','Real Customer','customer_6aaee5183fbaf8.64798330@example.com','customer','2026-09-19 16:10:08','$2y$04$SYFJuTKhm7ncU9E0LgdcYOe3UsZDMBPqNJl2/xtHv9nRiw/4l4bQq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:10:08','2026-09-19 16:10:08'),
(14,NULL,NULL,'admin','Admin User','admin_6aaeefab1595d8.61502046@example.com','customer','2026-09-19 16:55:15','$2y$04$VNFmm1qp0mbwFYnlPADFDOiYr8DpOriqLFN8EZn1tSxejyWB6YglK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:55:15','2026-09-19 16:55:15'),
(15,NULL,NULL,'customer','Real Customer','customer_6aaeefab1b7157.93291085@example.com','customer','2026-09-19 16:55:15','$2y$04$1sVSZEIrhDEIRaGMIlLF6.fxHiPkXXEtQpvLHOIUwcdaHqm50wJNy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:55:15','2026-09-19 16:55:15'),
(16,NULL,NULL,'admin','Admin User','admin_6aaef00c344290.11041934@example.com','customer','2026-09-19 16:56:52','$2y$04$FeLVMVCurrRwIcyCtaOWT.3mDrbrG3xiydoCQcFgTtOEp/bHKgz6G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:56:52','2026-09-19 16:56:52'),
(17,NULL,NULL,'customer','Real Customer','customer_6aaef00c39f293.15492025@example.com','customer','2026-09-19 16:56:52','$2y$04$wucyPocXxsmbOAruBsvKuOwjna.BvrdZ88VDk52Y7YiSLIZcN3rUq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:56:52','2026-09-19 16:56:52'),
(18,NULL,NULL,'admin','Admin User','admin_6aaef04f06a7e1.50909155@example.com','customer','2026-09-19 16:57:59','$2y$04$PhoJpwoDKHTXg0PaQ8daluotPYvgm02sL8/Gj9B9lvOoBAmH./L0i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:57:59','2026-09-19 16:57:59'),
(19,NULL,NULL,'customer','Real Customer','customer_6aaef04f0d6477.52488984@example.com','customer','2026-09-19 16:57:59','$2y$04$bnhl6wliqmYQMZwxvgMfp.nvKDYHA4qrjNWlBPeqYf0nl7H/MA2Di',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 16:57:59','2026-09-19 16:57:59'),
(20,NULL,NULL,'admin','Admin User','admin_6aaef0d0d156f4.37831272@example.com','customer','2026-09-19 17:00:08','$2y$04$QEQ5ED1M1njfmnADNDxBeu6lfQYG.9ekeg73u8McjigKRF6xEt3Ci',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:00:08','2026-09-19 17:00:08'),
(21,NULL,NULL,'customer','Real Customer','customer_6aaef0d0d7ddc3.63094854@example.com','customer','2026-09-19 17:00:08','$2y$04$ZHRLAZ/L.T5aCNrY8rCAt.2FMmfC5jttu0DRUb58iQclKyXvoek/a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:00:08','2026-09-19 17:00:08'),
(22,NULL,NULL,'admin','Admin User','admin_6aaef1324f7c03.00914211@example.com','customer','2026-09-19 17:01:46','$2y$04$fWGZuHF5kcmN4xwCxQGKB.71pXJwteWC.VHWISZWIr/1nkRtuczBS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:01:46','2026-09-19 17:01:46'),
(23,NULL,NULL,'customer','Real Customer','customer_6aaef132570f82.66111328@example.com','customer','2026-09-19 17:01:46','$2y$04$3EVQZNIKOy3dpJeRb49Po..6/GuBdFkWJjl4PbZw/al/deISxtF2m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:01:46','2026-09-19 17:01:46'),
(24,NULL,NULL,'admin','Admin User','admin_6aaef1a1aaaf89.56626197@example.com','customer','2026-09-19 17:03:37','$2y$04$d/8BX9ZQDTM3lM9KSQqSk.mGhFKhRQdhh.254s70xc9lB.ZdxRHWi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:03:37','2026-09-19 17:03:37'),
(25,NULL,NULL,'customer','Real Customer','customer_6aaef1a1b26a72.97511427@example.com','customer','2026-09-19 17:03:37','$2y$04$SZjxPr4wAiJ82BfIUVoa.uqixGSz9wPIkURceLGGKqUwZCC245WIm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:03:37','2026-09-19 17:03:37'),
(26,NULL,NULL,'admin','Admin User','admin_6aaef1fda391e6.40486787@example.com','customer','2026-09-19 17:05:09','$2y$04$4xfJUH4cX7jJPUg6j1JtD.PuI.QdAwyCinoGd11fPPs8wpaRGmq4K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:05:09','2026-09-19 17:05:09'),
(27,NULL,NULL,'customer','Real Customer','customer_6aaef1fdad4b57.82918389@example.com','customer','2026-09-19 17:05:09','$2y$04$jHB7/jnpJ63XZmlNSa/YUO2S1Gs/71DZy.48NouRpDw0eQhGdjMde',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:05:09','2026-09-19 17:05:09'),
(28,NULL,NULL,'admin','Admin User','admin_6aaef44f2ccec6.82144253@example.com','customer','2026-09-19 17:15:03','$2y$04$5aSRzaqzqlBbL8ySa84O1.uowXam7K6HP3xzuKN7uyL4hmvwnwmES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:15:03','2026-09-19 17:15:03'),
(29,NULL,NULL,'customer','Real Customer','customer_6aaef44f3356d5.28601609@example.com','customer','2026-09-19 17:15:03','$2y$04$Bp5nmWvU2Ez6B01a02U.8e/cVf5U3jzqmfxgRPGmGd8pXEmV7lGd.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:15:03','2026-09-19 17:15:03'),
(30,NULL,NULL,'admin','Admin User','admin_6aaef466563777.44369412@example.com','customer','2026-09-19 17:15:26','$2y$04$L96BmE/F7mTzdK4I4iFzFuVhGAEQVeQPN0xwzDDTaGj7lvti98LsW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:15:26','2026-09-19 17:15:26'),
(31,NULL,NULL,'customer','Real Customer','customer_6aaef46664bd37.83999234@example.com','customer','2026-09-19 17:15:26','$2y$04$0eHTs8Evd.8GmQYqKdssouqzxWw316wLa1MNtEd3Xz10HpJd5Obkq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:15:26','2026-09-19 17:15:26'),
(32,NULL,NULL,'admin','Admin User','admin_6aaef58d9f36d4.01459264@example.com','customer','2026-09-19 17:20:21','$2y$04$7f3Hx/kW3od9bI7iYqgzKem22X4FhN.6BzQdeFxN1NdlR8OnmEvxm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:20:21','2026-09-19 17:20:21'),
(33,NULL,NULL,'customer','Real Customer','customer_6aaef58da5bef8.39267416@example.com','customer','2026-09-19 17:20:21','$2y$04$fKDEuDksNr2AMeQRdGPfeu0yq10eIv8XByphCO4wyVZSiXOt/H1g6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:20:21','2026-09-19 17:20:21'),
(34,NULL,NULL,'admin','Admin User','admin_6aaef6e6209b11.33972775@example.com','customer','2026-09-19 17:26:06','$2y$04$uL3kO4NmhyoaRSstM4fj7eSFd6mPJ5GWlXchoub9r5m4lz5v1O5Xq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:26:06','2026-09-19 17:26:06'),
(35,NULL,NULL,'customer','Real Customer','customer_6aaef6e6272d47.51440072@example.com','customer','2026-09-19 17:26:06','$2y$04$MzsPv0FxDWMC8kOQTiB8O.oK9v8IoQNlqcTdqpYCw3BghnD8HOvQ2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:26:06','2026-09-19 17:26:06'),
(36,NULL,NULL,'admin','Admin User','admin_6aaef7c05480a4.18205672@example.com','customer','2026-09-19 17:29:44','$2y$04$93T/62iBLHXaOccY/fGmX.Yr2EKz6rs3DG8F3d8AmyZihxteBR0Hq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:29:44','2026-09-19 17:29:44'),
(37,NULL,NULL,'customer','Real Customer','customer_6aaef7c0622447.16555275@example.com','customer','2026-09-19 17:29:44','$2y$04$Ep4HoWTGyAAR4hIJzZlcPeGIugb4229/oNyVmqLVdtjCIesAw98/e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:29:44','2026-09-19 17:29:44'),
(38,NULL,NULL,'admin','Admin User','admin_6aaef8422a2806.36511695@example.com','customer','2026-09-19 17:31:54','$2y$04$.FsgKCADY.3vwWaTtVBU4e1yoXPvF3DBlc2qAYMz1B/KQ88J7ZWgK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:31:54','2026-09-19 17:31:54'),
(39,NULL,NULL,'customer','Real Customer','customer_6aaef84230ed97.43236373@example.com','customer','2026-09-19 17:31:54','$2y$04$MRC6NOigpvarjL7ExNvI.uUTHYjuuptoMSkdoZOvRADngGAmai7Xu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:31:54','2026-09-19 17:31:54'),
(40,NULL,NULL,'admin','Admin User','admin_6aaef8df64f567.95259718@example.com','customer','2026-09-19 17:34:31','$2y$04$nl6P4CTs.eEzv7rTfbZXq.rUZ8z8lMs4U1Vyg6eLC8cBMRDYYrb1i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:34:31','2026-09-19 17:34:31'),
(41,NULL,NULL,'customer','Real Customer','customer_6aaef8df6e1261.56169580@example.com','customer','2026-09-19 17:34:31','$2y$04$j/aehyXZH7B5f451GEKU4.042bdVmVV1qZyYkEasOo26S5KLRZW7O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:34:31','2026-09-19 17:34:31'),
(42,NULL,NULL,'admin','Admin User','admin_6aaefa59cb78e3.16066279@example.com','customer','2026-09-19 17:40:49','$2y$04$hqcRaQyItPafOhcoYkctO.zzUVd7iPKsg2J6PGmfUJbCwUTQhjvIS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:40:49','2026-09-19 17:40:49'),
(43,NULL,NULL,'customer','Real Customer','customer_6aaefa59d1dde5.08106568@example.com','customer','2026-09-19 17:40:49','$2y$04$0ZwzYVGys8t4a1vWL7p97uZwdqLvcLn367TvAmv6J4ffMuCbrs9zG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 17:40:49','2026-09-19 17:40:49'),
(44,NULL,NULL,'admin','Admin User','admin_6aaf027c5f5011.66543002@example.com','customer','2026-09-19 18:15:32','$2y$04$sI.HdvUIkkKrr6Ys6uBfZ.wC2FiCY19jPmM8WGZith89D/lZ1GjgC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 18:15:32','2026-09-19 18:15:32'),
(45,NULL,NULL,'customer','Real Customer','customer_6aaf027c655dd9.91136985@example.com','customer','2026-09-19 18:15:32','$2y$04$.pbBhddxjCXOKBrCLizZx.2iuZIzskgTlk2tAx58XseHQm2OmcE.y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 18:15:32','2026-09-19 18:15:32'),
(46,NULL,NULL,'admin','Admin User','admin_6aaf03059139d9.40715566@example.com','customer','2026-09-19 18:17:49','$2y$04$vZw2axCEBwKw0J4JVmx84eUluembbKuFOAM/c8QsyhC.QZMfnn.Y6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09120000000',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 18:17:49','2026-09-19 18:17:49'),
(47,NULL,NULL,'customer','Real Customer','customer_6aaf03059847d4.27916327@example.com','customer','2026-09-19 18:17:49','$2y$04$OZgEIBkasSYS1JoRJutWmeyl.E9bypSeB0iDhlLJUMYV4btwcupb.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'09121111111',NULL,NULL,0.00,NULL,NULL,0,'2026-09-19 18:17:49','2026-09-19 18:17:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_details` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping events for database 'peransa-db'
--

--
-- Dumping routines for database 'peransa-db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-16 15:27:18
