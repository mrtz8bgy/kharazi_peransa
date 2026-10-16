-- Repeatable Drikana database export. Existing tables and conflicting rows are preserved.
-- To apply schema changes to existing tables, use the Laravel migrations.
--
-- ── بازتولید در مرحله ۴ (خرازی پرنسا) ─────────────────────────────
-- این فایل با همان قالب «تکرارپذیر» (CREATE TABLE IF NOT EXISTS +
-- INSERT IGNORE) از پایگاه دادهٔ زنده بازسازی شد تا شامل دادهٔ کامل
-- فروشگاه خرازی باشد: ۱۰ دسته‌بندی، ۶۰ زیردسته، ۱۵۴ زیرزیردسته،
-- ۶۲ محصول، ۱۵ برند، سیاست‌های فروشگاه و تنظیمات SEO جدید.
--
-- اجرا:  mysql -u <user> -p <db> < database/peransa-db-amn.sql

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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `addons` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `addresses` (
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
INSERT IGNORE INTO `addresses` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `app_settings` (
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
INSERT IGNORE INTO `app_settings` VALUES
(1,'Active eCommerce','uploads/logo/matggar.png',1,'symbol','https://facebook.com','https://twitter.com','https://instagram.com','https://youtube.com','https://google.com','2019-08-04 16:39:15','2019-08-04 16:39:18');
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `article_categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `article_categories` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `article_images` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `articles` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `attributes` (
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
INSERT IGNORE INTO `attributes` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `audit_logs` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `banners` (
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
INSERT IGNORE INTO `banners` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `brands` (
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
INSERT IGNORE INTO `brands` VALUES
(5,'نخ تبریز','uploads/brands/kharazi-brand-5.png',1,'nakh-tabriz','نخ تبریز | خرازی پرنسا',NULL,'2020-07-04 09:50:03','2025-12-31 10:30:47'),
(6,'گلدوزی اصفهان','uploads/brands/kharazi-brand-6.png',1,'goldoozi-isfahan','گلدوزی اصفهان | خرازی پرنسا',NULL,'2020-07-05 07:34:22','2025-12-31 10:30:33'),
(7,'روبان پارس','uploads/brands/kharazi-brand-7.png',1,'roban-pars','روبان پارس | خرازی پرنسا',NULL,'2020-07-05 07:34:35','2025-12-31 10:30:18'),
(8,'کاموا البرز','uploads/brands/kharazi-brand-8.png',1,'kamava-alborz','کاموا البرز | خرازی پرنسا',NULL,'2020-07-08 01:32:31','2025-12-31 10:29:57'),
(9,'ابزار پیکان','uploads/brands/kharazi-brand-9.png',1,'abzar-peykan','ابزار پیکان | خرازی پرنسا',NULL,'2020-07-18 01:33:58','2025-12-31 10:29:35'),
(10,'دکمه مهر','uploads/brands/kharazi-brand-10.png',1,'dokme-mehr','دکمه مهر | خرازی پرنسا',NULL,'2020-07-18 01:34:35','2025-12-31 10:28:55'),
(11,'نگین زرین','uploads/brands/kharazi-brand-11.png',1,'negin-zarin','نگین زرین | خرازی پرنسا',NULL,'2020-07-18 01:35:19','2025-12-31 10:28:42'),
(12,'پارچه یزد','uploads/brands/kharazi-brand-12.png',1,'parche-yazd','پارچه یزد | خرازی پرنسا',NULL,'2020-07-18 01:35:54','2025-12-31 10:28:26'),
(13,'چرخ سینگر','uploads/brands/kharazi-brand-13.png',1,'charkh-singer','چرخ سینگر | خرازی پرنسا',NULL,'2020-07-18 01:36:05','2025-12-31 10:28:16'),
(14,'ابزار رازی','uploads/brands/kharazi-brand-14.png',1,'abzar-razi','ابزار رازی | خرازی پرنسا',NULL,'2020-07-18 01:36:18','2025-12-31 10:28:04'),
(15,'منجوق شاهین','uploads/brands/kharazi-brand-15.png',1,'monjogh-shahin','منجوق شاهین | خرازی پرنسا',NULL,'2020-07-18 07:26:48','2025-12-31 10:27:52'),
(16,'قیچی آلمان','uploads/brands/kharazi-brand-16.png',1,'ghichi-alman','قیچی آلمان | خرازی پرنسا',NULL,'2020-07-18 07:38:47','2025-12-31 10:27:35'),
(17,'نخ زنجان','uploads/brands/kharazi-brand-17.png',1,'nakh-zanjan','نخ زنجان | خرازی پرنسا',NULL,'2020-07-18 08:22:21','2025-12-31 10:27:27'),
(18,'هنر اصفهان','uploads/brands/kharazi-brand-18.png',1,'honar-isfahan','هنر اصفهان | خرازی پرنسا',NULL,'2020-07-18 08:22:35','2025-12-31 10:27:08'),
(19,'لوازم خیاطی کارا','uploads/brands/kharazi-brand-19.png',1,'karа-khayati','لوازم خیاطی کارا | خرازی پرنسا',NULL,'2020-07-18 08:22:50','2025-12-31 10:26:59');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `business_settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `business_settings` (
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
INSERT IGNORE INTO `business_settings` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `carts` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `categories` (
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
INSERT IGNORE INTO `categories` VALUES
(4,'نخ و سوزن',0.00,'uploads/categories/banner/kharazi-cat-4.png','uploads/categories/icon/kharazi-cat-4.png',0,1,0,'thread-and-needle','نخ و سوزن | خرازی پرنسا','نخ دوخت، سوزن دستی و چرخ، ماسموره و لوازم رفوگری','2026-10-16 17:11:22','2025-12-31 10:18:02'),
(5,'گلدوزی و شماره‌دوزی',0.00,'uploads/categories/banner/kharazi-cat-5.png','uploads/categories/icon/kharazi-cat-5.png',0,1,0,'embroidery','گلدوزی و شماره‌دوزی | خرازی پرنسا','نخ گلدوزی، حلقه، پارچه آیدا، کیت و طرح گلدوزی','2026-10-16 17:11:22','2025-12-31 10:19:55'),
(6,'روبان، دانتل و تور',0.00,'uploads/categories/banner/kharazi-cat-6.png','uploads/categories/icon/kharazi-cat-6.png',0,1,0,'ribbon-lace-tulle','روبان، دانتل و تور | خرازی پرنسا','انواع روبان ساتن و مخمل، دانتل، گیپور و تور','2026-10-16 17:11:22','2025-12-31 10:20:16'),
(7,'کاموا و بافتنی',0.00,'uploads/categories/banner/kharazi-cat-7.png','uploads/categories/icon/kharazi-cat-7.png',0,1,0,'yarn-and-knitting','کاموا و بافتنی | خرازی پرنسا','کاموا، میل بافتنی، قلاب بافی و لوازم جانبی بافت','2026-10-16 17:11:22','2025-12-31 10:21:26'),
(8,'دکمه، زیپ و یراق',0.00,'uploads/categories/banner/kharazi-cat-8.png','uploads/categories/icon/kharazi-cat-8.png',0,1,0,'buttons-zippers','دکمه، زیپ و یراق | خرازی پرنسا','دکمه، زیپ، قزن، یراق کیف، کش و برچسب','2026-10-16 17:11:22','2025-12-31 10:21:55'),
(9,'قیچی و ابزار خیاطی',0.00,'uploads/categories/banner/kharazi-cat-9.png','uploads/categories/icon/kharazi-cat-9.png',0,1,0,'scissors-and-tools','قیچی و ابزار خیاطی | خرازی پرنسا','قیچی خیاطی و گلدوزی، درفش، متر و ابزار اندازه‌گیری','2026-10-16 17:11:22','2025-12-31 10:22:51'),
(12,'منجوق، پولک و نگین',0.00,'uploads/categories/banner/kharazi-cat-12.png','uploads/categories/icon/kharazi-cat-12.png',0,1,0,'beads-sequins','منجوق، پولک و نگین | خرازی پرنسا','منجوق، پولک، نگین چسبی، مروارید و سنگ تزئینی','2026-10-16 17:11:22','2025-12-31 10:23:23'),
(13,'پارچه',0.00,'uploads/categories/banner/kharazi-cat-13.png','uploads/categories/icon/kharazi-cat-13.png',0,1,0,'fabric','پارچه | خرازی پرنسا','پارچه نخی، ساتن، مخمل، کتان، حریر و بافت','2026-10-16 17:11:22','2025-12-31 10:24:00'),
(14,'چرخ خیاطی و قطعات',0.00,'uploads/categories/banner/kharazi-cat-14.png','uploads/categories/icon/kharazi-cat-14.png',0,1,0,'sewing-machine','چرخ خیاطی و قطعات | خرازی پرنسا','چرخ خیاطی خانگی و صنعتی، قطعات، روغن و لوازم جانبی','2026-10-16 17:11:22','2025-12-31 10:24:26'),
(15,'کیف و سازماندهی لوازم',0.00,'uploads/categories/banner/kharazi-cat-15.png','uploads/categories/icon/kharazi-cat-15.png',0,1,0,'storage-and-bags','کیف و سازماندهی لوازم | خرازی پرنسا','کیف خیاطی، جعبه و سبد، سازماندهنده و پایه نخ','2026-10-16 17:11:22','2025-12-31 10:25:36');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `colors`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `colors` (
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
INSERT IGNORE INTO `colors` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `conversations` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `countries` (
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
INSERT IGNORE INTO `countries` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `coupon_usages` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `coupons` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `currencies` (
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
INSERT IGNORE INTO `currencies` VALUES
(1,'تومان','تومان',1.00000,1,'IRR','2020-07-06 02:18:24','2020-07-06 02:18:52');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `customer_packages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `customer_packages` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `customer_products` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `customers` (
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
INSERT IGNORE INTO `customers` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `flash_deal_products` (
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
INSERT IGNORE INTO `flash_deal_products` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `flash_deals` (
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
INSERT IGNORE INTO `flash_deals` VALUES
(7,'پیشنهاد شگفت انگیز',1595376000,1597968000,1,1,'#FFFFFF','dark','uploads/offers/banner/t4uuiqxx8KUq1bRFZuyXLfQraUdEEpTu5PV97h5V.jpeg','پۜشنهاد-شگفت-انگۜز-djzvw','2020-07-22 03:05:16','2020-08-01 10:02:33'),
(8,'تست',1595236114,1595322529,0,0,'#fff','dark','uploads/offers/banner/fwrjKaUqlS7kJlQdxy3gUznU3RIxL51ZcfjqkCB0.jpeg','تست-jxqbv','2020-07-20 00:14:44','2020-07-20 00:14:44');
/*!40000 ALTER TABLE `flash_deals` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `general_settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `general_settings` (
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
INSERT IGNORE INTO `general_settings` VALUES
(1,'2','uploads/logo/kharazi-peransa-logo.png','uploads/admin_logo/wCgHrz0Q5QoL1yu4vdrNnQIr4uGuNL48CXfcxOuS.png',NULL,NULL,'uploads/favicon/uHdGidSaRVzvPgDj6JFtntMqzJkwDk9659233jrb.png','خرازی پرنسا','تهران خیابان جمهوری','کلیه حقوق این وب‌سایت متعلق به «خرازی پرنسا» است.','09104927131','edeban.almas@gmail.com','https://www.facebook.com','https://www.instagram.com','https://www.twitter.com','https://www.youtube.com','https://www.googleplus.com','2026-10-16 17:52:43','2025-12-22 08:33:35');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `home_categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `home_categories` (
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
INSERT IGNORE INTO `home_categories` VALUES
(3,7,'null',1,'2020-08-01 12:59:17','2020-08-01 12:59:17');
/*!40000 ALTER TABLE `home_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jewelry_certificates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `jewelry_certificates` (
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
INSERT IGNORE INTO `jewelry_certificates` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `jewelry_owners` (
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
INSERT IGNORE INTO `jewelry_owners` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `jewelry_transfers` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `languages` (
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
INSERT IGNORE INTO `languages` VALUES
(1,'فارسی','ir',1,'2026-08-22 18:08:12','2026-08-22 18:08:12'),
(2,'English','en',0,'2026-08-22 18:08:12','2026-08-22 18:08:12');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `links`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `links` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `login_attempts` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT IGNORE INTO `migrations` VALUES
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
(29,'2026_10_12_100004_fix_jewelry_schema_drift',17),
(30,'2026_10_16_180000_fix_orders_schema_drift',18),
(31,'2026_10_16_180100_fix_order_details_schema_drift',19);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `missing_reports`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `missing_reports` (
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
INSERT IGNORE INTO `missing_reports` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `order_details` (
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
  `product_referral_code` varchar(255) DEFAULT NULL,
  `pickup_point_id` int(10) unsigned DEFAULT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_details_pickup_point_id_index` (`pickup_point_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `date` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `manual_payment` tinyint(4) NOT NULL DEFAULT 0,
  `manual_payment_data` text DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `otp_configurations` (
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
INSERT IGNORE INTO `otp_configurations` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `pages` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `password_resets` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `payments` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `permission_role` (
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
INSERT IGNORE INTO `permission_role` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `permissions` (
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
INSERT IGNORE INTO `permissions` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `pickup_points` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `policies` (
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
INSERT IGNORE INTO `policies` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `product_stocks` (
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
INSERT IGNORE INTO `product_stocks` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `products` (
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
INSERT IGNORE INTO `products` VALUES
(1,'نخ دوخت پلی‌استر مشکی ۵۰۰۰ متر','admin',12,4,105,130,5,'[\"uploads/products/photos/kharazi-product-1.png\"]','uploads/products/thumbnail/kharazi-product-1.png','uploads/products/thumbnail/kharazi-product-1.png','uploads/products/thumbnail/kharazi-product-1.png','youtube',NULL,'نخ دوخت, پلی‌استر, مشکی, ۵۰۰۰ متر','نخ دوخت پلی‌استر با استحکام بالا و مقاوم در برابر کشیدگی. مناسب دوخت لباس، پرده و منسوجات خانگی. رنگ مشکی ثابت و کم‌رنگ‌دهی.',52000,36000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,180,'قرقره',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'نخ دوخت پلی‌استر مشکی ۵۰۰۰ متر | خرازی پرنسا','نخ دوخت پلی‌استر با استحکام بالا و مقاوم در برابر کشیدگی. مناسب دوخت لباس، پرده و منسوجات خانگی. رنگ مشکی ثابت و کم‌رنگ‌دهی.','uploads/products/thumbnail/kharazi-product-1.png',NULL,'kharazi-product-1',0.00,'17830',0,NULL,NULL,'2026-09-09 13:13:58','2026-10-16 17:50:50'),
(2,'نخ دوخت پلی‌استر سفید ۵۰۰۰ متر','admin',12,4,105,130,5,'[\"uploads/products/photos/kharazi-product-2.png\"]','uploads/products/thumbnail/kharazi-product-2.png','uploads/products/thumbnail/kharazi-product-2.png','uploads/products/thumbnail/kharazi-product-2.png','youtube',NULL,'نخ دوخت, پلی‌استر, سفید, ۵۰۰۰ متر','نخ دوخت پلی‌استر سفید با پیچش یکنواخت. مناسب دوخت‌های روشن و لباس‌های سفید. مقاوم در برابر شست‌وشو.',52000,36000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,165,'قرقره',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'نخ دوخت پلی‌استر سفید ۵۰۰۰ متر | خرازی پرنسا','نخ دوخت پلی‌استر سفید با پیچش یکنواخت. مناسب دوخت‌های روشن و لباس‌های سفید. مقاوم در برابر شست‌وشو.','uploads/products/thumbnail/kharazi-product-2.png',NULL,'kharazi-product-2',0.00,'82099',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(3,'نخ دوخت نخی رنگ‌بندی ۱۲ عددی','admin',12,4,105,131,17,'[\"uploads/products/photos/kharazi-product-3.png\"]','uploads/products/thumbnail/kharazi-product-3.png','uploads/products/thumbnail/kharazi-product-3.png','uploads/products/thumbnail/kharazi-product-3.png','youtube',NULL,'نخ دوخت, نخی, رنگ‌بندی, ۱۲ عددی','بستهٔ ۱۲ عددی نخ دوخت نخی در رنگ‌های پرکاربرد. برای دوخت‌های دستی و رفوکاری مناسب است و رنگ‌ها در برابر نور ثابت می‌مانند.',189000,132000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,74,'بسته',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'نخ دوخت نخی رنگ‌بندی ۱۲ عددی | خرازی پرنسا','بستهٔ ۱۲ عددی نخ دوخت نخی در رنگ‌های پرکاربرد. برای دوخت‌های دستی و رفوکاری مناسب است و رنگ‌ها در برابر نور ثابت می‌مانند.','uploads/products/thumbnail/kharazi-product-3.png',NULL,'kharazi-product-3',0.00,'69931',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(4,'سوزن دوخت دستی بلند بسته ۲۵ عددی','admin',12,4,106,133,14,'[\"uploads/products/photos/kharazi-product-4.png\"]','uploads/products/thumbnail/kharazi-product-4.png','uploads/products/thumbnail/kharazi-product-4.png','uploads/products/thumbnail/kharazi-product-4.png','youtube',NULL,'سوزن دوخت, دستی, بلند, ۲۵ عددی','سوزن دوخت دستی بلند با چشم گشاد و نوک تیز. مناسب دوخت پارچه‌های ضخیم و متوسط. بستهٔ ۲۵ عددی در ظرف نگهدارنده.',38000,25000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,210,'بسته',12.00,'percent',0.00,'amount','flat_rate',150000.00,0,'سوزن دوخت دستی بلند بسته ۲۵ عددی | خرازی پرنسا','سوزن دوخت دستی بلند با چشم گشاد و نوک تیز. مناسب دوخت پارچه‌های ضخیم و متوسط. بستهٔ ۲۵ عددی در ظرف نگهدارنده.','uploads/products/thumbnail/kharazi-product-4.png',NULL,'kharazi-product-4',0.00,'61174',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(5,'سوزن دوخت دستی کوتاه بسته ۲۵ عددی','admin',12,4,106,134,14,'[\"uploads/products/photos/kharazi-product-5.png\"]','uploads/products/thumbnail/kharazi-product-5.png','uploads/products/thumbnail/kharazi-product-5.png','uploads/products/thumbnail/kharazi-product-5.png','youtube',NULL,'سوزن دوخت, دستی, کوتاه','سوزن دوخت دستی کوتاه برای کارهای ظریف و دوخت‌های دقیق. نوک تیز و صیقلی که پارچه را نمی‌درد.',32000,21000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,195,'بسته',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'سوزن دوخت دستی کوتاه بسته ۲۵ عددی | خرازی پرنسا','سوزن دوخت دستی کوتاه برای کارهای ظریف و دوخت‌های دقیق. نوک تیز و صیقلی که پارچه را نمی‌درد.','uploads/products/thumbnail/kharazi-product-5.png',NULL,'kharazi-product-5',0.00,'75986',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(6,'سوزن چرخ خیاطی یونیورسال بسته ۱۰ عددی','admin',12,4,107,136,14,'[\"uploads/products/photos/kharazi-product-6.png\"]','uploads/products/thumbnail/kharazi-product-6.png','uploads/products/thumbnail/kharazi-product-6.png','uploads/products/thumbnail/kharazi-product-6.png','youtube',NULL,'سوزن چرخ, یونیورسال, ۱۰ عددی','سوزن چرخ خیاطی یونیورسال مناسب اکثر پارچه‌های معمولی. بستهٔ ۱۰ عددی. سازگار با چرخ‌های خانگی رایج.',45000,30000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,0,230,'بسته',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'سوزن چرخ خیاطی یونیورسال بسته ۱۰ عددی | خرازی پرنسا','سوزن چرخ خیاطی یونیورسال مناسب اکثر پارچه‌های معمولی. بستهٔ ۱۰ عددی. سازگار با چرخ‌های خانگی رایج.','uploads/products/thumbnail/kharazi-product-6.png',NULL,'kharazi-product-6',0.00,'28756',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(7,'سوزن چرخ خیاطی مخصوص جین','admin',12,4,107,137,14,'[\"uploads/products/photos/kharazi-product-7.png\"]','uploads/products/thumbnail/kharazi-product-7.png','uploads/products/thumbnail/kharazi-product-7.png','uploads/products/thumbnail/kharazi-product-7.png','youtube',NULL,'سوزن چرخ, جین, ضخیم','سوزن چرخ مخصوص دوخت پارچه‌های سنگین مانند جین و کتان ضخیم. نوک مقاوم و سوراخ چشم بزرگ‌تر.',58000,39000,0,'[]','[]','[\"#E5E4E2\"]',NULL,1,1,1,142,'بسته',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'سوزن چرخ خیاطی مخصوص جین | خرازی پرنسا','سوزن چرخ مخصوص دوخت پارچه‌های سنگین مانند جین و کتان ضخیم. نوک مقاوم و سوراخ چشم بزرگ‌تر.','uploads/products/thumbnail/kharazi-product-7.png',NULL,'kharazi-product-7',0.00,'59717',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(8,'نخ گلدوزی پنبه‌ای رنگ‌بندی ۲۴ رنگ','admin',12,5,111,148,6,'[\"uploads/products/photos/kharazi-product-8.png\"]','uploads/products/thumbnail/kharazi-product-8.png','uploads/products/thumbnail/kharazi-product-8.png','uploads/products/thumbnail/kharazi-product-8.png','youtube',NULL,'نخ گلدوزی, پنبه‌ای, ۲۴ رنگ','بستهٔ ۲۴ رنگ نخ گلدوزی پنبه‌ای مرسریزه. درخشندگی خوب و ثبات رنگ بالا. مناسب گلدوزی دستی و شماره‌دوزی.',245000,172000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,88,'بسته',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'نخ گلدوزی پنبه‌ای رنگ‌بندی ۲۴ رنگ | خرازی پرنسا','بستهٔ ۲۴ رنگ نخ گلدوزی پنبه‌ای مرسریزه. درخشندگی خوب و ثبات رنگ بالا. مناسب گلدوزی دستی و شماره‌دوزی.','uploads/products/thumbnail/kharazi-product-8.png',NULL,'kharazi-product-8',0.00,NULL,0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 10:32:58'),
(9,'نخ گلدوزی ابریشمی رنگ‌بندی ۱۲ رنگ','admin',12,5,111,149,6,'[\"uploads/products/photos/kharazi-product-9.png\"]','uploads/products/thumbnail/kharazi-product-9.png','uploads/products/thumbnail/kharazi-product-9.png','uploads/products/thumbnail/kharazi-product-9.png','youtube',NULL,'نخ گلدوزی, ابریشمی, ۱۲ رنگ','نخ گلدوزی ابریشمی با درخشندگی بالا در ۱۲ رنگ. مناسب گلدوزی طرح‌های گل و کارهای تزئینی.',198000,139000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,1,62,'بسته',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'نخ گلدوزی ابریشمی رنگ‌بندی ۱۲ رنگ | خرازی پرنسا','نخ گلدوزی ابریشمی با درخشندگی بالا در ۱۲ رنگ. مناسب گلدوزی طرح‌های گل و کارهای تزئینی.','uploads/products/thumbnail/kharazi-product-9.png',NULL,'kharazi-product-9',0.00,'67105',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(10,'نخ متالیک طلایی گلدوزی','admin',12,5,111,150,6,'[\"uploads/products/photos/kharazi-product-10.png\"]','uploads/products/thumbnail/kharazi-product-10.png','uploads/products/thumbnail/kharazi-product-10.png','uploads/products/thumbnail/kharazi-product-10.png','youtube',NULL,'نخ متالیک, طلایی, گلدوزی','نخ متالیک با روکش طلایی برای گلدوزی‌های تزئینی و برجسته. مناسب طرح‌های مجلسی و تزئین لباس.',95000,66000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,0,76,'کلاف',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'نخ متالیک طلایی گلدوزی | خرازی پرنسا','نخ متالیک با روکش طلایی برای گلدوزی‌های تزئینی و برجسته. مناسب طرح‌های مجلسی و تزئین لباس.','uploads/products/thumbnail/kharazi-product-10.png',NULL,'kharazi-product-10',0.00,'39745',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(11,'حلقه گلدوزی چوبی ۲۰ سانتی','admin',12,5,112,151,18,'[\"uploads/products/photos/kharazi-product-11.png\"]','uploads/products/thumbnail/kharazi-product-11.png','uploads/products/thumbnail/kharazi-product-11.png','uploads/products/thumbnail/kharazi-product-11.png','youtube',NULL,'حلقه گلدوزی, چوبی, ۲۰ سانتی','حلقه گلدوزی چوبی با قطر ۲۰ سانتی‌متر و پیچ تنظیم. سطح صیقلی که به پارچه آسیب نمی‌زند.',165000,115000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,94,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'حلقه گلدوزی چوبی ۲۰ سانتی | خرازی پرنسا','حلقه گلدوزی چوبی با قطر ۲۰ سانتی‌متر و پیچ تنظیم. سطح صیقلی که به پارچه آسیب نمی‌زند.','uploads/products/thumbnail/kharazi-product-11.png',NULL,'kharazi-product-11',0.00,'62830',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(12,'حلقه گلدوزی پلاستیکی ۱۵ سانتی','admin',12,5,112,152,18,'[\"uploads/products/photos/kharazi-product-12.png\"]','uploads/products/thumbnail/kharazi-product-12.png','uploads/products/thumbnail/kharazi-product-12.png','uploads/products/thumbnail/kharazi-product-12.png','youtube',NULL,'حلقه گلدوزی, پلاستیکی, ۱۵ سانتی','حلقه گلدوزی پلاستیکی سبک با قطر ۱۵ سانتی‌متر. مناسب کارهای کوچک و تمرینی. دارای پیچ تنظیم.',78000,54000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,120,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'حلقه گلدوزی پلاستیکی ۱۵ سانتی | خرازی پرنسا','حلقه گلدوزی پلاستیکی سبک با قطر ۱۵ سانتی‌متر. مناسب کارهای کوچک و تمرینی. دارای پیچ تنظیم.','uploads/products/thumbnail/kharazi-product-12.png',NULL,'kharazi-product-12',0.00,'45670',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(13,'پارچه آیدا ۱۴ خانه رنگ سفید','admin',12,5,113,154,12,'[\"uploads/products/photos/kharazi-product-13.png\"]','uploads/products/thumbnail/kharazi-product-13.png','uploads/products/thumbnail/kharazi-product-13.png','uploads/products/thumbnail/kharazi-product-13.png','youtube',NULL,'پارچه آیدا, شماره‌دوزی, سفید','پارچه آیدا با ۱۴ خانه در اینچ و رنگ سفید. پایه‌ای استاندارد برای شماره‌دوزی و گلدوزی شماتیک.',142000,99000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,68,'متر',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'پارچه آیدا ۱۴ خانه رنگ سفید | خرازی پرنسا','پارچه آیدا با ۱۴ خانه در اینچ و رنگ سفید. پایه‌ای استاندارد برای شماره‌دوزی و گلدوزی شماتیک.','uploads/products/thumbnail/kharazi-product-13.png',NULL,'kharazi-product-13',0.00,'09292',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(14,'کیت گلدوزی مبتدی با حلقه و نخ','admin',12,5,114,157,18,'[\"uploads/products/photos/kharazi-product-14.png\"]','uploads/products/thumbnail/kharazi-product-14.png','uploads/products/thumbnail/kharazi-product-14.png','uploads/products/thumbnail/kharazi-product-14.png','youtube',NULL,'کیت گلدوزی, مبتدی, کامل','کیت کامل گلدوزی برای شروع‌کنندگان شامل حلقه، نخ رنگ‌بندی، سوزن و پارچه. همراه با راهنمای تصویری فارسی.',289000,202000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,54,'بسته',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'کیت گلدوزی مبتدی با حلقه و نخ | خرازی پرنسا','کیت کامل گلدوزی برای شروع‌کنندگان شامل حلقه، نخ رنگ‌بندی، سوزن و پارچه. همراه با راهنمای تصویری فارسی.','uploads/products/thumbnail/kharazi-product-14.png',NULL,'kharazi-product-14',0.00,'63219',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(15,'کیت گلدوزی طرح گل رز','admin',12,5,114,158,18,'[\"uploads/products/photos/kharazi-product-15.png\"]','uploads/products/thumbnail/kharazi-product-15.png','uploads/products/thumbnail/kharazi-product-15.png','uploads/products/thumbnail/kharazi-product-15.png','youtube',NULL,'کیت گلدوزی, گل رز, طرح','کیت گلدوزی با طرح گل رز و راهنمای گام‌به‌گام. شامل تمام نخ‌های موردنیاز و حلقه گلدوزی.',342000,239000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,41,'بسته',5.00,'percent',0.00,'amount','flat_rate',150000.00,0,'کیت گلدوزی طرح گل رز | خرازی پرنسا','کیت گلدوزی با طرح گل رز و راهنمای گام‌به‌گام. شامل تمام نخ‌های موردنیاز و حلقه گلدوزی.','uploads/products/thumbnail/kharazi-product-15.png',NULL,'kharazi-product-15',0.00,'66964',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(16,'روبان ساتن عرض ۱ سانتی رنگ‌بندی','admin',12,6,117,166,7,'[\"uploads/products/photos/kharazi-product-16.png\"]','uploads/products/thumbnail/kharazi-product-16.png','uploads/products/thumbnail/kharazi-product-16.png','uploads/products/thumbnail/kharazi-product-16.png','youtube',NULL,'روبان ساتن, ۱ سانتی, رنگ‌بندی','روبان ساتن با عرض ۱ سانتی‌متر و بافت براق. در رنگ‌های متنوع برای تزئین لباس، کادو و کارهای هنری.',42000,29000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,240,'متر',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'روبان ساتن عرض ۱ سانتی رنگ‌بندی | خرازی پرنسا','روبان ساتن با عرض ۱ سانتی‌متر و بافت براق. در رنگ‌های متنوع برای تزئین لباس، کادو و کارهای هنری.','uploads/products/thumbnail/kharazi-product-16.png',NULL,'kharazi-product-16',0.00,'89396',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(17,'روبان ساتن عرض ۲ سانتی رنگ‌بندی','admin',12,6,117,167,7,'[\"uploads/products/photos/kharazi-product-17.png\"]','uploads/products/thumbnail/kharazi-product-17.png','uploads/products/thumbnail/kharazi-product-17.png','uploads/products/thumbnail/kharazi-product-17.png','youtube',NULL,'روبان ساتن, ۲ سانتی, رنگ‌بندی','روبان ساتن با عرض ۲ سانتی‌متر. مناسب تزئین لباس مجلسی، گل‌آرایی و ساخت اکسسوری.',68000,47000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,1,185,'متر',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'روبان ساتن عرض ۲ سانتی رنگ‌بندی | خرازی پرنسا','روبان ساتن با عرض ۲ سانتی‌متر. مناسب تزئین لباس مجلسی، گل‌آرایی و ساخت اکسسوری.','uploads/products/thumbnail/kharazi-product-17.png',NULL,'kharazi-product-17',0.00,'75038',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(18,'روبان ساتن پهن ۵ سانتی','admin',12,6,117,168,7,'[\"uploads/products/photos/kharazi-product-18.png\"]','uploads/products/thumbnail/kharazi-product-18.png','uploads/products/thumbnail/kharazi-product-18.png','uploads/products/thumbnail/kharazi-product-18.png','youtube',NULL,'روبان ساتن, پهن, ۵ سانتی','روبان ساتن پهن ۵ سانتی‌متر با بافت درشت. مناسب کمربند پارچه‌ای، تزئین پرده و ساخت گل روبان.',125000,87000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,96,'متر',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'روبان ساتن پهن ۵ سانتی | خرازی پرنسا','روبان ساتن پهن ۵ سانتی‌متر با بافت درشت. مناسب کمربند پارچه‌ای، تزئین پرده و ساخت گل روبان.','uploads/products/thumbnail/kharazi-product-18.png',NULL,'kharazi-product-18',0.00,'56938',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(19,'روبان مخمل عرض ۱ سانتی','admin',12,6,118,169,7,'[\"uploads/products/photos/kharazi-product-19.png\"]','uploads/products/thumbnail/kharazi-product-19.png','uploads/products/thumbnail/kharazi-product-19.png','uploads/products/thumbnail/kharazi-product-19.png','youtube',NULL,'روبان مخمل, ۱ سانتی, لوکس','روبان مخمل با عرض ۱ سانتی‌متر و سطح نمدی. حس لوکس و مناسب تزئین لباس مجلسی و کارت.',88000,61000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,0,132,'متر',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'روبان مخمل عرض ۱ سانتی | خرازی پرنسا','روبان مخمل با عرض ۱ سانتی‌متر و سطح نمدی. حس لوکس و مناسب تزئین لباس مجلسی و کارت.','uploads/products/thumbnail/kharazi-product-19.png',NULL,'kharazi-product-19',0.00,'14918',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(20,'روبان چاپی گلدار','admin',12,6,119,172,7,'[\"uploads/products/photos/kharazi-product-20.png\"]','uploads/products/thumbnail/kharazi-product-20.png','uploads/products/thumbnail/kharazi-product-20.png','uploads/products/thumbnail/kharazi-product-20.png','youtube',NULL,'روبان چاپی, گلدار, کاردستی','روبان با چاپ گلدار و رنگ‌های شاد. مناسب تزئین لباس کودک، کاردستی و بسته‌بندی هدیه.',74000,51000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,118,'متر',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'روبان چاپی گلدار | خرازی پرنسا','روبان با چاپ گلدار و رنگ‌های شاد. مناسب تزئین لباس کودک، کاردستی و بسته‌بندی هدیه.','uploads/products/thumbnail/kharazi-product-20.png',NULL,'kharazi-product-20',0.00,'13008',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(21,'دانتل گلدار عرض ۵ سانتی','admin',12,6,120,175,7,'[\"uploads/products/photos/kharazi-product-21.png\"]','uploads/products/thumbnail/kharazi-product-21.png','uploads/products/thumbnail/kharazi-product-21.png','uploads/products/thumbnail/kharazi-product-21.png','youtube',NULL,'دانتل, گلدار, ۵ سانتی','دانتل گلدار با عرض ۵ سانتی‌متر و بافت ظریف. مناسب لبه‌دوزی لباس، رومیزی و پرده.',158000,110000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,104,'متر',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'دانتل گلدار عرض ۵ سانتی | خرازی پرنسا','دانتل گلدار با عرض ۵ سانتی‌متر و بافت ظریف. مناسب لبه‌دوزی لباس، رومیزی و پرده.','uploads/products/thumbnail/kharazi-product-21.png',NULL,'kharazi-product-21',0.00,'86596',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(22,'تور ساده سفید ۳ متری','admin',12,6,121,178,7,'[\"uploads/products/photos/kharazi-product-22.png\"]','uploads/products/thumbnail/kharazi-product-22.png','uploads/products/thumbnail/kharazi-product-22.png','uploads/products/thumbnail/kharazi-product-22.png','youtube',NULL,'تور, ساده, سفید, ۳ متری','تور ساده سفید به طول ۳ متر. مناسب زیر دامن، تزئین لباس عروس و کارهای هنری.',132000,92000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,87,'بسته',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'تور ساده سفید ۳ متری | خرازی پرنسا','تور ساده سفید به طول ۳ متر. مناسب زیر دامن، تزئین لباس عروس و کارهای هنری.','uploads/products/thumbnail/kharazi-product-22.png',NULL,'kharazi-product-22',0.00,'55983',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(23,'کاموا اکریلیک ضخیم رنگ‌بندی','admin',12,7,123,183,8,'[\"uploads/products/photos/kharazi-product-23.png\"]','uploads/products/thumbnail/kharazi-product-23.png','uploads/products/thumbnail/kharazi-product-23.png','uploads/products/thumbnail/kharazi-product-23.png','youtube',NULL,'کاموا, اکریلیک, ضخیم','کاموا اکریلیک ضخیم با متراژ مناسب بافت شال، کلاه و پتو. نرم و ضدحساسیت. رنگ‌بندی متنوع.',98000,68000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,210,'کلاف',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'کاموا اکریلیک ضخیم رنگ‌بندی | خرازی پرنسا','کاموا اکریلیک ضخیم با متراژ مناسب بافت شال، کلاه و پتو. نرم و ضدحساسیت. رنگ‌بندی متنوع.','uploads/products/thumbnail/kharazi-product-23.png',NULL,'kharazi-product-23',0.00,'78933',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(24,'کاموا پشمی نرم زمستانی','admin',12,7,123,184,8,'[\"uploads/products/photos/kharazi-product-24.png\"]','uploads/products/thumbnail/kharazi-product-24.png','uploads/products/thumbnail/kharazi-product-24.png','uploads/products/thumbnail/kharazi-product-24.png','youtube',NULL,'کاموا, پشمی, زمستانی','کاموا پشمی نرم مناسب بافت لباس زمستانی. گرمای بالا و حس لطیف روی پوست.',168000,117000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,138,'کلاف',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'کاموا پشمی نرم زمستانی | خرازی پرنسا','کاموا پشمی نرم مناسب بافت لباس زمستانی. گرمای بالا و حس لطیف روی پوست.','uploads/products/thumbnail/kharazi-product-24.png',NULL,'kharazi-product-24',0.00,'49721',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(25,'میل بافتنی فلزی سایز ۳','admin',12,7,124,186,8,'[\"uploads/products/photos/kharazi-product-25.png\"]','uploads/products/thumbnail/kharazi-product-25.png','uploads/products/thumbnail/kharazi-product-25.png','uploads/products/thumbnail/kharazi-product-25.png','youtube',NULL,'میل بافتنی, فلزی, سایز ۳','میل بافتنی فلزی سایز ۳ با سطح صیقلی. مناسب بافت نخ‌های نازک و کارهای ظریف.',62000,43000,0,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,176,'جفت',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'میل بافتنی فلزی سایز ۳ | خرازی پرنسا','میل بافتنی فلزی سایز ۳ با سطح صیقلی. مناسب بافت نخ‌های نازک و کارهای ظریف.','uploads/products/thumbnail/kharazi-product-25.png',NULL,'kharazi-product-25',0.00,'70693',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(26,'میل بافتنی چوبی ست ۵ سایز','admin',12,7,124,187,8,'[\"uploads/products/photos/kharazi-product-26.png\"]','uploads/products/thumbnail/kharazi-product-26.png','uploads/products/thumbnail/kharazi-product-26.png','uploads/products/thumbnail/kharazi-product-26.png','youtube',NULL,'میل بافتنی, چوبی, ست','ست ۵ سایز میل بافتنی چوبی از سایز ۳ تا ۸. سطح چوبی گرم که نخ روی آن سُر نمی‌خورد.',215000,150000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,92,'ست',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'میل بافتنی چوبی ست ۵ سایز | خرازی پرنسا','ست ۵ سایز میل بافتنی چوبی از سایز ۳ تا ۸. سطح چوبی گرم که نخ روی آن سُر نمی‌خورد.','uploads/products/thumbnail/kharazi-product-26.png',NULL,'kharazi-product-26',0.00,'81035',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(27,'قلاب بافی آلومینیومی ست ۸ عددی','admin',12,7,1000,189,8,'[\"uploads/products/photos/kharazi-product-27.png\"]','uploads/products/thumbnail/kharazi-product-27.png','uploads/products/thumbnail/kharazi-product-27.png','uploads/products/thumbnail/kharazi-product-27.png','youtube',NULL,'قلاب بافی, آلومینیومی, ۸ عددی','ست ۸ عددی قلاب بافی آلومینیومی در سایزهای مختلف. دسته ارگونومیک برای استفاده طولانی.',178000,124000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,108,'ست',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'قلاب بافی آلومینیومی ست ۸ عددی | خرازی پرنسا','ست ۸ عددی قلاب بافی آلومینیومی در سایزهای مختلف. دسته ارگونومیک برای استفاده طولانی.','uploads/products/thumbnail/kharazi-product-27.png',NULL,'kharazi-product-27',0.00,'49705',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(28,'نشانگر بافت بسته ۳۰ عددی','admin',12,7,1001,191,8,'[\"uploads/products/photos/kharazi-product-28.png\"]','uploads/products/thumbnail/kharazi-product-28.png','uploads/products/thumbnail/kharazi-product-28.png','uploads/products/thumbnail/kharazi-product-28.png','youtube',NULL,'نشانگر بافت, شمارنده, ۳۰ عددی','نشانگر بافت پلاستیکی رنگی در بستهٔ ۳۰ عددی. برای علامت‌گذاری محل کاهش و افزایش دانه.',45000,31000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,168,'بسته',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'نشانگر بافت بسته ۳۰ عددی | خرازی پرنسا','نشانگر بافت پلاستیکی رنگی در بستهٔ ۳۰ عددی. برای علامت‌گذاری محل کاهش و افزایش دانه.','uploads/products/thumbnail/kharazi-product-28.png',NULL,'kharazi-product-28',0.00,NULL,0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 10:34:13'),
(29,'دکمه پلاستیکی ۴ سوراخ بسته ۱۰۰ عددی','admin',12,8,1004,198,10,'[\"uploads/products/photos/kharazi-product-29.png\"]','uploads/products/thumbnail/kharazi-product-29.png','uploads/products/thumbnail/kharazi-product-29.png','uploads/products/thumbnail/kharazi-product-29.png','youtube',NULL,'دکمه پلاستیکی, ۴ سوراخ, ۱۰۰ عددی','دکمه پلاستیکی ۴ سوراخ در بستهٔ ۱۰۰ عددی. لبه صیقلی و مقاوم در برابر شست‌وشو. رنگ مشکی و سفید.',68000,47000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,245,'بسته',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'دکمه پلاستیکی ۴ سوراخ بسته ۱۰۰ عددی | خرازی پرنسا','دکمه پلاستیکی ۴ سوراخ در بستهٔ ۱۰۰ عددی. لبه صیقلی و مقاوم در برابر شست‌وشو. رنگ مشکی و سفید.','uploads/products/thumbnail/kharazi-product-29.png',NULL,'kharazi-product-29',0.00,'99744',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(30,'دکمه صدفی لباس مجلسی','admin',12,8,1004,199,10,'[\"uploads/products/photos/kharazi-product-30.png\"]','uploads/products/thumbnail/kharazi-product-30.png','uploads/products/thumbnail/kharazi-product-30.png','uploads/products/thumbnail/kharazi-product-30.png','youtube',NULL,'دکمه صدفی, مجلسی, تزئینی','دکمه صدفی با درخشندگی طبیعی. مناسب لباس مجلسی، بلوز و پیراهن. بستهٔ ۵۰ عددی.',142000,99000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,96,'بسته',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'دکمه صدفی لباس مجلسی | خرازی پرنسا','دکمه صدفی با درخشندگی طبیعی. مناسب لباس مجلسی، بلوز و پیراهن. بستهٔ ۵۰ عددی.','uploads/products/thumbnail/kharazi-product-30.png',NULL,'kharazi-product-30',0.00,'61759',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(31,'زیپ مخفی ۳۰ سانتی رنگ‌بندی','admin',12,8,1005,201,7,'[\"uploads/products/photos/kharazi-product-31.png\"]','uploads/products/thumbnail/kharazi-product-31.png','uploads/products/thumbnail/kharazi-product-31.png','uploads/products/thumbnail/kharazi-product-31.png','youtube',NULL,'زیپ مخفی, ۳۰ سانتی, رنگ‌بندی','زیپ مخفی ۳۰ سانتی‌متر با کشویی نرم. مناسب دوخت لباس، دامن و پیراهن. در رنگ‌های هم‌رنگ پارچه.',38000,26000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,220,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'زیپ مخفی ۳۰ سانتی رنگ‌بندی | خرازی پرنسا','زیپ مخفی ۳۰ سانتی‌متر با کشویی نرم. مناسب دوخت لباس، دامن و پیراهن. در رنگ‌های هم‌رنگ پارچه.','uploads/products/thumbnail/kharazi-product-31.png',NULL,'kharazi-product-31',0.00,'48861',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(32,'زیپ فلزی ۲۰ سانتی مشکی','admin',12,8,1005,202,7,'[\"uploads/products/photos/kharazi-product-32.png\"]','uploads/products/thumbnail/kharazi-product-32.png','uploads/products/thumbnail/kharazi-product-32.png','uploads/products/thumbnail/kharazi-product-32.png','youtube',NULL,'زیپ فلزی, ۲۰ سانتی, مشکی','زیپ فلزی ۲۰ سانتی‌متر با دندانه فلزی مقاوم. مناسب شلوار جین، کیف و کاپشن.',54000,37000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,178,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'زیپ فلزی ۲۰ سانتی مشکی | خرازی پرنسا','زیپ فلزی ۲۰ سانتی‌متر با دندانه فلزی مقاوم. مناسب شلوار جین، کیف و کاپشن.','uploads/products/thumbnail/kharazi-product-32.png',NULL,'kharazi-product-32',0.00,'54144',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(33,'قزن کیف فلزی طلایی','admin',12,8,1010,204,11,'[\"uploads/products/photos/kharazi-product-33.png\"]','uploads/products/thumbnail/kharazi-product-33.png','uploads/products/thumbnail/kharazi-product-33.png','uploads/products/thumbnail/kharazi-product-33.png','youtube',NULL,'قزن کیف, فلزی, طلایی','قزن کیف فلزی با روکش طلایی. ظاهر شیک و قفل محکم. مناسب کیف دستی و کوله.',89000,62000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,134,'جفت',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'قزن کیف فلزی طلایی | خرازی پرنسا','قزن کیف فلزی با روکش طلایی. ظاهر شیک و قفل محکم. مناسب کیف دستی و کوله.','uploads/products/thumbnail/kharazi-product-33.png',NULL,'kharazi-product-33',0.00,'70793',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(34,'کش باریک لباس بسته ۵ متری','admin',12,8,1012,210,7,'[\"uploads/products/photos/kharazi-product-34.png\"]','uploads/products/thumbnail/kharazi-product-34.png','uploads/products/thumbnail/kharazi-product-34.png','uploads/products/thumbnail/kharazi-product-34.png','youtube',NULL,'کش باریک, لباس, ۵ متری','کش باریک لباس به طول ۵ متر. کشسانی بالا و برگشت‌پذیری خوب. مناسب کمر لباس و آستین.',42000,29000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,198,'بسته',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'کش باریک لباس بسته ۵ متری | خرازی پرنسا','کش باریک لباس به طول ۵ متر. کشسانی بالا و برگشت‌پذیری خوب. مناسب کمر لباس و آستین.','uploads/products/thumbnail/kharazi-product-34.png',NULL,'kharazi-product-34',0.00,'93695',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(35,'قیچی خیاطی ۸ اینچ حرفه‌ای','admin',12,9,1014,216,16,'[\"uploads/products/photos/kharazi-product-35.png\"]','uploads/products/thumbnail/kharazi-product-35.png','uploads/products/thumbnail/kharazi-product-35.png','uploads/products/thumbnail/kharazi-product-35.png','youtube',NULL,'قیچی خیاطی, ۸ اینچ, حرفه‌ای','قیچی خیاطی ۸ اینچ با تیغه فولادی ضدزنگ و پیچ تنظیم. برش دقیق و راحت حتی روی چند لایه پارچه.',685000,478000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,64,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'قیچی خیاطی ۸ اینچ حرفه‌ای | خرازی پرنسا','قیچی خیاطی ۸ اینچ با تیغه فولادی ضدزنگ و پیچ تنظیم. برش دقیق و راحت حتی روی چند لایه پارچه.','uploads/products/thumbnail/kharazi-product-35.png',NULL,'kharazi-product-35',0.00,'95642',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(36,'قیچی خیاطی ۱۰ اینچ برش پارچه','admin',12,9,1014,218,16,'[\"uploads/products/photos/kharazi-product-36.png\"]','uploads/products/thumbnail/kharazi-product-36.png','uploads/products/thumbnail/kharazi-product-36.png','uploads/products/thumbnail/kharazi-product-36.png','youtube',NULL,'قیچی خیاطی, ۱۰ اینچ, برش','قیچی خیاطی ۱۰ اینچ مخصوص برش پارچه‌های ضخیم. دسته ارگونومیک و تیغه بلند برای برش سریع.',892000,623000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,42,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'قیچی خیاطی ۱۰ اینچ برش پارچه | خرازی پرنسا','قیچی خیاطی ۱۰ اینچ مخصوص برش پارچه‌های ضخیم. دسته ارگونومیک و تیغه بلند برای برش سریع.','uploads/products/thumbnail/kharazi-product-36.png',NULL,'kharazi-product-36',0.00,'66764',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(37,'قیچی گلدوزی نوک‌کج','admin',12,9,1020,219,16,'[\"uploads/products/photos/kharazi-product-37.png\"]','uploads/products/thumbnail/kharazi-product-37.png','uploads/products/thumbnail/kharazi-product-37.png','uploads/products/thumbnail/kharazi-product-37.png','youtube',NULL,'قیچی گلدوزی, نوک‌کج, ظریف','قیچی گلدوزی با نوک کج و تیغه ظریف. مناسب کارهای دقیق، بریدن نخ و گلدوزی دستی.',184000,128000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,118,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'قیچی گلدوزی نوک‌کج | خرازی پرنسا','قیچی گلدوزی با نوک کج و تیغه ظریف. مناسب کارهای دقیق، بریدن نخ و گلدوزی دستی.','uploads/products/thumbnail/kharazi-product-37.png',NULL,'kharazi-product-37',0.00,'28934',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(38,'درفش خیاطی با دسته چوبی','admin',12,9,1021,221,9,'[\"uploads/products/photos/kharazi-product-38.png\"]','uploads/products/thumbnail/kharazi-product-38.png','uploads/products/thumbnail/kharazi-product-38.png','uploads/products/thumbnail/kharazi-product-38.png','youtube',NULL,'درفش, خیاطی, دسته چوبی','درفش خیاطی با دسته چوبی و نوک فولادی. برای باز کردن بخیه و بیرون کشیدن نخ کاربرد دارد.',96000,67000,0,'[]','[]','[\"#FFD700\"]',NULL,1,1,0,156,'عدد',10.00,'percent',0.00,'amount','flat_rate',150000.00,0,'درفش خیاطی با دسته چوبی | خرازی پرنسا','درفش خیاطی با دسته چوبی و نوک فولادی. برای باز کردن بخیه و بیرون کشیدن نخ کاربرد دارد.','uploads/products/thumbnail/kharazi-product-38.png',NULL,'kharazi-product-38',0.00,'45823',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(39,'متر خیاطی ۱۵۰ سانتی','admin',12,9,1022,223,9,'[\"uploads/products/photos/kharazi-product-39.png\"]','uploads/products/thumbnail/kharazi-product-39.png','uploads/products/thumbnail/kharazi-product-39.png','uploads/products/thumbnail/kharazi-product-39.png','youtube',NULL,'متر خیاطی, ۱۵۰ سانتی, اندازه‌گیری','متر خیاطی پارچه‌ای ۱۵۰ سانتی با دو طرف مدرج. انعطاف‌پذیر و مناسب اندازه‌گیری اندام.',58000,40000,0,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,204,'عدد',8.00,'percent',0.00,'amount','flat_rate',150000.00,0,'متر خیاطی ۱۵۰ سانتی | خرازی پرنسا','متر خیاطی پارچه‌ای ۱۵۰ سانتی با دو طرف مدرج. انعطاف‌پذیر و مناسب اندازه‌گیری اندام.','uploads/products/thumbnail/kharazi-product-39.png',NULL,'kharazi-product-39',0.00,'38970',0,NULL,NULL,'2026-09-09 13:13:58','2026-09-09 13:13:58'),
(61,'رولت خیاطی و گچ رنگ‌بندی','admin',12,9,1023,226,9,'[\"uploads/products/photos/kharazi-product-61.png\"]','uploads/products/thumbnail/kharazi-product-61.png','uploads/products/thumbnail/kharazi-product-61.png','uploads/products/thumbnail/kharazi-product-61.png','youtube',NULL,'رولت, گچ خیاطی, علامت‌گذاری','ست رولت خیاطی و گچ در رنگ‌های مختلف. برای علامت‌گذاری الگو روی پارچه، با قابلیت پاک شدن.',74000,51000,1,'[]','[]','[\"#FFB6C1\"]',NULL,1,1,1,148,'ست',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'رولت خیاطی و گچ رنگ‌بندی | خرازی پرنسا','ست رولت خیاطی و گچ در رنگ‌های مختلف. برای علامت‌گذاری الگو روی پارچه، با قابلیت پاک شدن.','uploads/products/thumbnail/kharazi-product-61.png',NULL,'kharazi-product-61',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 09:59:35'),
(62,'منجوق شیشه‌ای رنگ‌بندی بسته ۵۰۰ گرمی','admin',12,12,1030,231,15,'[\"uploads/products/photos/kharazi-product-62.png\"]','uploads/products/thumbnail/kharazi-product-62.png','uploads/products/thumbnail/kharazi-product-62.png','uploads/products/thumbnail/kharazi-product-62.png','youtube',NULL,'منجوق شیشه‌ای, رنگ‌بندی, ۵۰۰ گرمی','منجوق شیشه‌ای درخشان در رنگ‌های متنوع، بستهٔ ۵۰۰ گرمی. مناسب منجوق‌کاری، تزئین لباس و کارهای هنری.',168000,117000,1,'[]','[]','[\"#C0C0C0\"]',NULL,1,1,1,186,'بسته',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'منجوق شیشه‌ای رنگ‌بندی بسته ۵۰۰ گرمی | خرازی پرنسا','منجوق شیشه‌ای درخشان در رنگ‌های متنوع، بستهٔ ۵۰۰ گرمی. مناسب منجوق‌کاری، تزئین لباس و کارهای هنری.','uploads/products/thumbnail/kharazi-product-62.png',NULL,'kharazi-product-62',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:40:04'),
(63,'منجوق پلاستیکی درشت بسته ۳۰۰ گرمی','admin',12,12,1030,232,15,'[\"uploads/products/photos/kharazi-product-63.png\"]','uploads/products/thumbnail/kharazi-product-63.png','uploads/products/thumbnail/kharazi-product-63.png','uploads/products/thumbnail/kharazi-product-63.png','youtube',NULL,'منجوق پلاستیکی, درشت, کاردستی','منجوق پلاستیکی درشت و سبک، مناسب کاردستی کودکان و تزئین وسایل. بستهٔ ۳۰۰ گرمی.',96000,67000,1,'[]','[]','[\"#FFB6C1\",\"#C0C0C0\"]',NULL,1,1,1,164,'بسته',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'منجوق پلاستیکی درشت بسته ۳۰۰ گرمی | خرازی پرنسا','منجوق پلاستیکی درشت و سبک، مناسب کاردستی کودکان و تزئین وسایل. بستهٔ ۳۰۰ گرمی.','uploads/products/thumbnail/kharazi-product-63.png',NULL,'kharazi-product-63',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:06:34'),
(64,'پولک درخشان رنگ‌بندی بسته ۲۰۰ گرمی','admin',12,12,1031,234,15,'[\"uploads/products/photos/kharazi-product-64.png\"]','uploads/products/thumbnail/kharazi-product-64.png','uploads/products/thumbnail/kharazi-product-64.png','uploads/products/thumbnail/kharazi-product-64.png','youtube',NULL,'پولک, درخشان, ۲۰۰ گرمی','پولک درخشان با سطح بازتابنده در رنگ‌های متنوع. مناسب تزئین لباس، رقص و کارهای نمایشی.',118000,82000,1,'[]','[]','[\"#0000FF\",\"#C0C0C0\"]',NULL,1,1,1,152,'بسته',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پولک درخشان رنگ‌بندی بسته ۲۰۰ گرمی | خرازی پرنسا','پولک درخشان با سطح بازتابنده در رنگ‌های متنوع. مناسب تزئین لباس، رقص و کارهای نمایشی.','uploads/products/thumbnail/kharazi-product-64.png',NULL,'kharazi-product-64',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:07:41'),
(65,'نگین چسبی کریستال بسته ۱۰۰ عددی','admin',12,12,1032,237,11,'[\"uploads/products/photos/kharazi-product-65.png\"]','uploads/products/thumbnail/kharazi-product-65.png','uploads/products/thumbnail/kharazi-product-65.png','uploads/products/thumbnail/kharazi-product-65.png','youtube',NULL,'نگین چسبی, کریستال, ۱۰۰ عددی','نگین چسبی کریستال با پشت چسب‌دار در بستهٔ ۱۰۰ عددی. برای تزئین سریع لباس، کیف و گوشی.',142000,99000,1,'[]','[]','[\"#0000FF\",\"#C0C0C0\"]',NULL,1,1,0,138,'بسته',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'نگین چسبی کریستال بسته ۱۰۰ عددی | خرازی پرنسا','نگین چسبی کریستال با پشت چسب‌دار در بستهٔ ۱۰۰ عددی. برای تزئین سریع لباس، کیف و گوشی.','uploads/products/thumbnail/kharazi-product-65.png',NULL,'kharazi-product-65',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:10:16'),
(66,'مروارید مصنوعی ۵ میلی بسته ۲۰۰ عددی','admin',12,12,1033,239,11,'[\"uploads/products/photos/kharazi-product-66.png\"]','uploads/products/thumbnail/kharazi-product-66.png','uploads/products/thumbnail/kharazi-product-66.png','uploads/products/thumbnail/kharazi-product-66.png','youtube',NULL,'مروارید, مصنوعی, ۵ میلی','مروارید مصنوعی با روکش صدفی و قطر ۵ میلی‌متر. مناسب منجوق‌کاری، تزئین لباس عروس و ساخت زیورآلات.',89000,62000,1,'[]','[]','[\"#0000FF\",\"#FFD700\"]',NULL,1,1,1,172,'بسته',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'مروارید مصنوعی ۵ میلی بسته ۲۰۰ عددی | خرازی پرنسا','مروارید مصنوعی با روکش صدفی و قطر ۵ میلی‌متر. مناسب منجوق‌کاری، تزئین لباس عروس و ساخت زیورآلات.','uploads/products/thumbnail/kharazi-product-66.png',NULL,'kharazi-product-66',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:16:04'),
(67,'سوزن منجوق ظریف بسته ۲۵ عددی','admin',12,12,1035,243,15,'[\"uploads/products/photos/kharazi-product-67.png\"]','uploads/products/thumbnail/kharazi-product-67.png','uploads/products/thumbnail/kharazi-product-67.png','uploads/products/thumbnail/kharazi-product-67.png','youtube',NULL,'سوزن منجوق, ظریف, ۲۵ عددی','سوزن منجوق ظریف با چشم باریک، مناسب رد کردن منجوق و مروارید ریز. بستهٔ ۲۵ عددی.',48000,33000,1,'[]','[]','[\"#008000\",\"#C0C0C0\"]',NULL,1,1,1,196,'بسته',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'سوزن منجوق ظریف بسته ۲۵ عددی | خرازی پرنسا','سوزن منجوق ظریف با چشم باریک، مناسب رد کردن منجوق و مروارید ریز. بستهٔ ۲۵ عددی.','uploads/products/thumbnail/kharazi-product-67.png',NULL,'kharazi-product-67',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:17:05'),
(68,'پارچه نخی ساده عرض ۱۵۰ سانتی','admin',12,13,1040,246,12,'[\"uploads/products/photos/kharazi-product-68.png\"]','uploads/products/thumbnail/kharazi-product-68.png','uploads/products/thumbnail/kharazi-product-68.png','uploads/products/thumbnail/kharazi-product-68.png','youtube',NULL,'پارچه نخی, ساده, تابستانی','پارچه نخی ساده با عرض ۱۵۰ سانتی‌متر. خنک و تنفس‌پذیر، مناسب دوخت لباس تابستانی و پیراهن.',128000,89000,1,'[]','[]','[\"#FFD700\",\"#C0C0C0\"]',NULL,1,1,0,142,'متر',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'پارچه نخی ساده عرض ۱۵۰ سانتی | خرازی پرنسا','پارچه نخی ساده با عرض ۱۵۰ سانتی‌متر. خنک و تنفس‌پذیر، مناسب دوخت لباس تابستانی و پیراهن.','uploads/products/thumbnail/kharazi-product-68.png',NULL,'kharazi-product-68',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:17:54'),
(69,'پارچه نخی طرح‌دار گلدار','admin',12,13,1040,247,12,'[\"uploads/products/photos/kharazi-product-69.png\"]','uploads/products/thumbnail/kharazi-product-69.png','uploads/products/thumbnail/kharazi-product-69.png','uploads/products/thumbnail/kharazi-product-69.png','youtube',NULL,'پارچه نخی, طرح‌دار, گلدار','پارچه نخی با طرح گلدار و رنگ‌بندی ملایم. مناسب دوخت پیراهن، بلوز و لباس کودک.',156000,109000,1,'[]','[]','[\"#D2691E\",\"#FFB6C1\"]',NULL,1,1,1,98,'متر',0.00,'amount',0.00,'amount','flat_rate',500000.00,0,'پارچه نخی طرح‌دار گلدار | خرازی پرنسا','پارچه نخی با طرح گلدار و رنگ‌بندی ملایم. مناسب دوخت پیراهن، بلوز و لباس کودک.','uploads/products/thumbnail/kharazi-product-69.png',NULL,'kharazi-product-69',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:18:53'),
(70,'پارچه ساتن لباسی براق','admin',12,13,1041,248,12,'[\"uploads/products/photos/kharazi-product-70.png\"]','uploads/products/thumbnail/kharazi-product-70.png','uploads/products/thumbnail/kharazi-product-70.png','uploads/products/thumbnail/kharazi-product-70.png','youtube',NULL,'پارچه ساتن, لباسی, براق','پارچه ساتن براق با سطح صاف. مناسب دوخت لباس مجلسی، دامن و بلوز. زیبایی و درخشندگی بالا.',218000,152000,1,'[]','[]','[\"#C0C0C0\"]',NULL,1,1,0,116,'متر',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پارچه ساتن لباسی براق | خرازی پرنسا','پارچه ساتن براق با سطح صاف. مناسب دوخت لباس مجلسی، دامن و بلوز. زیبایی و درخشندگی بالا.','uploads/products/thumbnail/kharazi-product-70.png',NULL,'kharazi-product-70',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:20:03'),
(71,'پارچه ساتن سنگین مجلسی','admin',12,13,1041,249,12,'[\"uploads/products/photos/kharazi-product-71.png\"]','uploads/products/thumbnail/kharazi-product-71.png','uploads/products/thumbnail/kharazi-product-71.png','uploads/products/thumbnail/kharazi-product-71.png','youtube',NULL,'پارچه ساتن, سنگین, مجلسی','پارچه ساتن سنگین با ایستایی خوب. مناسب لباس مجلسی و طراحی‌های حجم‌دار. لااقل چین‌خوردگی.',296000,207000,0,'[]','[]','[\"#000000\",\"#C0C0C0\"]',NULL,1,1,0,74,'متر',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پارچه ساتن سنگین مجلسی | خرازی پرنسا','پارچه ساتن سنگین با ایستایی خوب. مناسب لباس مجلسی و طراحی‌های حجم‌دار. لااقل چین‌خوردگی.','uploads/products/thumbnail/kharazi-product-71.png',NULL,'kharazi-product-71',0.00,'151652',0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 13:19:41'),
(72,'پارچه مخمل کبریتی','admin',12,13,1042,250,12,'[\"uploads/products/photos/kharazi-product-72.png\"]','uploads/products/thumbnail/kharazi-product-72.png','uploads/products/thumbnail/kharazi-product-72.png','uploads/products/thumbnail/kharazi-product-72.png','youtube',NULL,'پارچه مخمل, کبریتی, لوکس','پارچه مخمل کبریتی با بافت راه‌راه و سطح نمدی. حس لوکس و مناسب لباس زمستانی و دکوراسیون.',324000,226000,1,'[]','[]','[\"#000000\",\"#FFD700\"]',NULL,1,1,1,68,'متر',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پارچه مخمل کبریتی | خرازی پرنسا','پارچه مخمل کبریتی با بافت راه‌راه و سطح نمدی. حس لوکس و مناسب لباس زمستانی و دکوراسیون.','uploads/products/thumbnail/kharazi-product-72.png',NULL,'kharazi-product-72',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:20:46'),
(73,'پارچه کتان طبیعی','admin',12,13,1043,252,12,'[\"uploads/products/photos/kharazi-product-73.png\"]','uploads/products/thumbnail/kharazi-product-73.png','uploads/products/thumbnail/kharazi-product-73.png','uploads/products/thumbnail/kharazi-product-73.png','youtube',NULL,'پارچه کتان, طبیعی, مقاوم','پارچه کتان طبیعی با بافت درشت و استحکام بالا. مناسب لباس تابستانی، کیف و رومیزی.',265000,185000,1,'[]','[]','[\"#C0C0C0\",\"#FFFFFF\"]',NULL,1,1,1,92,'متر',12.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پارچه کتان طبیعی | خرازی پرنسا','پارچه کتان طبیعی با بافت درشت و استحکام بالا. مناسب لباس تابستانی، کیف و رومیزی.','uploads/products/thumbnail/kharazi-product-73.png',NULL,'kharazi-product-73',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:22:38'),
(74,'پارچه حریر ساده مجلسی','admin',12,13,1050,254,12,'[\"uploads/products/photos/kharazi-product-74.png\"]','uploads/products/thumbnail/kharazi-product-74.png','uploads/products/thumbnail/kharazi-product-74.png','uploads/products/thumbnail/kharazi-product-74.png','youtube',NULL,'پارچه حریر, ساده, مجلسی','پارچه حریر ساده و سبک با دراپه روان. مناسب لایه رویی لباس مجلسی، شال و دکوراسیون.',142000,99000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,128,'متر',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پارچه حریر ساده مجلسی | خرازی پرنسا','پارچه حریر ساده و سبک با دراپه روان. مناسب لایه رویی لباس مجلسی، شال و دکوراسیون.','uploads/products/thumbnail/kharazi-product-74.png',NULL,'kharazi-product-74',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:41:50'),
(75,'پارچه فوتر پنبه‌ای بچگانه','admin',12,13,1051,256,12,'[\"uploads/products/photos/kharazi-product-75.png\"]','uploads/products/thumbnail/kharazi-product-75.png','uploads/products/thumbnail/kharazi-product-75.png','uploads/products/thumbnail/kharazi-product-75.png','youtube',NULL,'پارچه فوتر, پنبه‌ای, بچگانه','پارچه فوتر پنبه‌ای نرم و گرم. مناسب دوخت لباس کودک، هودی و شلوار راحتی. ضدحساسیت.',178000,124000,1,'[]','[]','[\"#FFB6C1\",\"#C0C0C0\"]',NULL,1,1,0,134,'متر',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پارچه فوتر پنبه‌ای بچگانه | خرازی پرنسا','پارچه فوتر پنبه‌ای نرم و گرم. مناسب دوخت لباس کودک، هودی و شلوار راحتی. ضدحساسیت.','uploads/products/thumbnail/kharazi-product-75.png',NULL,'kharazi-product-75',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:24:14'),
(76,'چرخ خیاطی خانگی ۱۲ دوخت','admin',12,14,1052,258,13,'[\"uploads/products/photos/kharazi-product-76.png\"]','uploads/products/thumbnail/kharazi-product-76.png','uploads/products/thumbnail/kharazi-product-76.png','uploads/products/thumbnail/kharazi-product-76.png','youtube',NULL,'چرخ خیاطی, خانگی, ۱۲ دوخت','چرخ خیاطی خانگی با ۱۲ نوع دوخت کاربردی، دوخت معکوس و تنظیم طول کوک. مناسب دوخت‌های روزمره و خانگی.',7450000,5200000,1,'[]','[]','[\"#000000\"]',NULL,1,1,1,18,'دستگاه',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'چرخ خیاطی خانگی ۱۲ دوخت | خرازی پرنسا','چرخ خیاطی خانگی با ۱۲ نوع دوخت کاربردی، دوخت معکوس و تنظیم طول کوک. مناسب دوخت‌های روزمره و خانگی.','uploads/products/thumbnail/kharazi-product-76.png',NULL,'kharazi-product-76',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:25:41'),
(77,'چرخ خیاطی خانگی الکترونیکی ۳۲ دوخت','admin',12,14,1052,259,13,'[\"uploads/products/photos/kharazi-product-77.png\"]','uploads/products/thumbnail/kharazi-product-77.png','uploads/products/thumbnail/kharazi-product-77.png','uploads/products/thumbnail/kharazi-product-77.png','youtube',NULL,'چرخ خیاطی, الکترونیکی, ۳۲ دوخت','چرخ خیاطی الکترونیکی با ۳۲ نوع دوخت، نمایشگر دیجیتال و کنترل سرعت. مناسب خیاطان نیمه‌حرفه‌ای.',14800000,10300000,1,'[]','[]','[\"#000000\",\"#FFD700\"]',NULL,1,1,1,11,'دستگاه',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'چرخ خیاطی خانگی الکترونیکی ۳۲ دوخت | خرازی پرنسا','چرخ خیاطی الکترونیکی با ۳۲ نوع دوخت، نمایشگر دیجیتال و کنترل سرعت. مناسب خیاطان نیمه‌حرفه‌ای.','uploads/products/thumbnail/kharazi-product-77.png',NULL,'kharazi-product-77',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:26:33'),
(78,'ماسموره چرخ خیاطی بسته ۱۰ عددی','admin',12,14,1060,262,13,'[\"uploads/products/photos/kharazi-product-78.png\"]','uploads/products/thumbnail/kharazi-product-78.png','uploads/products/thumbnail/kharazi-product-78.png','uploads/products/thumbnail/kharazi-product-78.png','youtube',NULL,'ماسموره, بابین, ۱۰ عددی','ماسموره (بابین) چرخ خیاطی در بستهٔ ۱۰ عددی. سازگار با چرخ‌های خانگی رایج. جنس مقاوم.',76000,53000,1,'[]','[]','[\"#000000\"]',NULL,1,1,0,188,'بسته',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'ماسموره چرخ خیاطی بسته ۱۰ عددی | خرازی پرنسا','ماسموره (بابین) چرخ خیاطی در بستهٔ ۱۰ عددی. سازگار با چرخ‌های خانگی رایج. جنس مقاوم.','uploads/products/thumbnail/kharazi-product-78.png',NULL,'kharazi-product-78',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:27:30'),
(79,'پایه سوزن چرخ خیاطی','admin',12,14,1060,263,13,'[\"uploads/products/photos/kharazi-product-79.png\"]','uploads/products/thumbnail/kharazi-product-79.png','uploads/products/thumbnail/kharazi-product-79.png','uploads/products/thumbnail/kharazi-product-79.png','youtube',NULL,'پایه سوزن, قطعات چرخ, فلزی','پایه (پیچ) نگهدارنده سوزن چرخ خیاطی. فلزی و مقاوم. سازگار با اکثر مدل‌های خانگی.',92000,64000,1,'[]','[]','[\"#000000\",\"#FFD700\"]',NULL,1,1,1,146,'عدد',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پایه سوزن چرخ خیاطی | خرازی پرنسا','پایه (پیچ) نگهدارنده سوزن چرخ خیاطی. فلزی و مقاوم. سازگار با اکثر مدل‌های خانگی.','uploads/products/thumbnail/kharazi-product-79.png',NULL,'kharazi-product-79',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:28:22'),
(80,'روغن چرخ خیاطی ۱۰۰ میلی‌لیتر','admin',12,14,1061,265,13,'[\"uploads/products/photos/kharazi-product-80.png\"]','uploads/products/thumbnail/kharazi-product-80.png','uploads/products/thumbnail/kharazi-product-80.png','uploads/products/thumbnail/kharazi-product-80.png','youtube',NULL,'روغن چرخ, نگهداری, ۱۰۰ میلی‌لیتر','روغن مخصوص چرخ خیاطی با قطره‌چکان، حجم ۱۰۰ میلی‌لیتر. روان‌کننده و کاهش‌دهنده صدای چرخ.',58000,40000,1,'[]','[]','[\"#FFD700\",\"#8B4513\"]',NULL,1,1,1,214,'عدد',5.00,'percent',0.00,'amount','flat_rate',500000.00,0,'روغن چرخ خیاطی ۱۰۰ میلی‌لیتر | خرازی پرنسا','روغن مخصوص چرخ خیاطی با قطره‌چکان، حجم ۱۰۰ میلی‌لیتر. روان‌کننده و کاهش‌دهنده صدای چرخ.','uploads/products/thumbnail/kharazi-product-80.png',NULL,'kharazi-product-80',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:30:14'),
(81,'پدال چرخ خیاطی یدکی','admin',12,14,1062,267,13,'[\"uploads/products/photos/kharazi-product-81.png\"]','uploads/products/thumbnail/kharazi-product-81.png','uploads/products/thumbnail/kharazi-product-81.png','uploads/products/thumbnail/kharazi-product-81.png','youtube',NULL,'پدال چرخ, یدکی, لوازم جانبی','پدال چرخ خیاطی یدکی با کابل و اتصال استاندارد. کنترل دقیق سرعت دوخت.',285000,199000,1,'[]','[]','[\"#C0C0C0\",\"#FFFFFF\"]',NULL,1,1,0,62,'عدد',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'پدال چرخ خیاطی یدکی | خرازی پرنسا','پدال چرخ خیاطی یدکی با کابل و اتصال استاندارد. کنترل دقیق سرعت دوخت.','uploads/products/thumbnail/kharazi-product-81.png',NULL,'kharazi-product-81',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:29:24'),
(82,'کیف خیاطی پارچه‌ای جادار','admin',12,15,1070,272,19,'[\"uploads/products/photos/kharazi-product-82.png\"]','uploads/products/thumbnail/kharazi-product-82.png','uploads/products/thumbnail/kharazi-product-82.png','uploads/products/thumbnail/kharazi-product-82.png','youtube',NULL,'کیف خیاطی, پارچه‌ای, جادار','کیف خیاطی پارچه‌ای با جیب‌های متعدد و بند دوشی. فضای کافی برای قیچی، نخ، سوزن و لوازم کوچک.',342000,239000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,1,84,'عدد',8.00,'percent',0.00,'amount','flat_rate',500000.00,0,'کیف خیاطی پارچه‌ای جادار | خرازی پرنسا','کیف خیاطی پارچه‌ای با جیب‌های متعدد و بند دوشی. فضای کافی برای قیچی، نخ، سوزن و لوازم کوچک.','uploads/products/thumbnail/kharazi-product-82.png',NULL,'kharazi-product-82',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:31:35'),
(83,'جعبه چوبی لوازم خیاطی سه طبقه','admin',12,15,1071,274,19,'[\"uploads/products/photos/kharazi-product-83.png\"]','uploads/products/thumbnail/kharazi-product-83.png','uploads/products/thumbnail/kharazi-product-83.png','uploads/products/thumbnail/kharazi-product-83.png','youtube',NULL,'جعبه چوبی, لوازم خیاطی, سه طبقه','جعبه چوبی سه طبقه برای نگهداری منظم لوازم خیاطی. طراحی جمع‌وجور با درپوش. چوب طبیعی.',468000,327000,1,'[]','[]','[\"#FFFFFF\"]',NULL,1,1,0,46,'عدد',10.00,'percent',0.00,'amount','flat_rate',500000.00,0,'جعبه چوبی لوازم خیاطی سه طبقه | خرازی پرنسا','جعبه چوبی سه طبقه برای نگهداری منظم لوازم خیاطی. طراحی جمع‌وجور با درپوش. چوب طبیعی.','uploads/products/thumbnail/kharazi-product-83.png',NULL,'kharazi-product-83',0.00,NULL,0,NULL,NULL,'2026-09-09 13:19:41','2026-09-09 10:44:49');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `repair_orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `repair_orders` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `repair_status_histories` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `repair_technicians` (
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
INSERT IGNORE INTO `repair_technicians` VALUES
(1,2,'طلاسازی',5,NULL,1,'2026-08-22 18:08:12','2026-08-22 18:08:12');
/*!40000 ALTER TABLE `repair_technicians` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reviews`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `reviews` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `role_user` (
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
INSERT IGNORE INTO `role_user` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `roles` (
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
INSERT IGNORE INTO `roles` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `searches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `query` text NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
INSERT IGNORE INTO `searches` VALUES
(1,'نخ',4,'2026-10-16 17:14:13','2026-10-16 17:53:12'),
(2,'قیچی',4,'2026-10-16 17:14:13','2026-10-16 17:53:12'),
(3,'کاموا',4,'2026-10-16 17:14:13','2026-10-16 17:53:12'),
(4,'پارچه',4,'2026-10-16 17:14:14','2026-10-16 17:53:12'),
(5,'دکمه',4,'2026-10-16 17:14:14','2026-10-16 17:53:13'),
(6,'گلدوزی',2,'2026-10-16 17:53:13','2026-10-16 17:53:13');
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `seller_withdraw_requests`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `seller_withdraw_requests` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `sellers` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `seo_settings` (
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
INSERT IGNORE INTO `seo_settings` VALUES
(1,'خرازی پرنسا | فروشگاه لوازم خیاطی، گلدوزی و هنری','خرازی پرنسا؛ فروشگاه آنلاین لوازم خیاطی، گلدوزی، روبان، کاموا، پارچه و ابزار خیاطی با ارسال به سراسر ایران.','لوازم خیاطی,گلدوزی,روبان,کاموا,پارچه,قیچی خیاطی,منجوق,دکمه و زیپ,نخ و سوزن','خرازی پرنسا','فروشگاه آنلاین لوازم خیاطی، گلدوزی و هنری',NULL,'خرازی پرنسا','فروشگاه آنلاین لوازم خیاطی، گلدوزی و هنری',NULL,'2026-09-07 05:36:26','2026-09-07 05:36:26','','خرازی پرنسا',7,NULL,'خرازی پرنسا؛ فروشگاه آنلاین لوازم خیاطی، گلدوزی، روبان، کاموا، پارچه و ابزار خیاطی با ارسال به سراسر ایران.');
/*!40000 ALTER TABLE `seo_settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `shops`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `shops` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `sliders` (
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
INSERT IGNORE INTO `sliders` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `staff` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `sub_categories` (
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
INSERT IGNORE INTO `sub_categories` VALUES
(105,'نخ دوخت',4,'sewing-thread','نخ دوخت | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(106,'سوزن دوخت دستی',4,'hand-needle','سوزن دوخت دستی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(107,'سوزن چرخ خیاطی',4,'machine-needle','سوزن چرخ خیاطی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(108,'ماسموره و بابین',4,'bobbin','ماسموره و بابین | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(109,'سنجاق و گیره',4,'pins-and-clips','سنجاق و گیره | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(110,'لوازم رفوگری',4,'darning','لوازم رفوگری | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(111,'نخ گلدوزی',5,'embroidery-floss','نخ گلدوزی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(112,'حلقه و قاب گلدوزی',5,'embroidery-hoop','حلقه و قاب گلدوزی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(113,'پارچه آیدا',5,'aida-fabric','پارچه آیدا | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(114,'کیت گلدوزی',5,'embroidery-kit','کیت گلدوزی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(115,'طرح و الگوی گلدوزی',5,'embroidery-pattern','طرح و الگوی گلدوزی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(116,'سوزن گلدوزی',5,'embroidery-needle','سوزن گلدوزی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(117,'روبان ساتن',6,'satin-ribbon','روبان ساتن | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(118,'روبان مخمل',6,'velvet-ribbon','روبان مخمل | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(119,'روبان چاپی',6,'printed-ribbon','روبان چاپی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(120,'دانتل و گیپور',6,'lace-guipure','دانتل و گیپور | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(121,'تور',6,'tulle','تور | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(122,'نوار اریب و کش',6,'bias-tape','نوار اریب و کش | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(123,'کاموا',7,'yarn','کاموا | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(124,'میل بافتنی',7,'knitting-needles','میل بافتنی | خرازی پرنسا','','2025-12-31 12:35:17','2025-12-31 12:35:17'),
(1000,'قلاب بافی',7,'crochet-hook','قلاب بافی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1001,'لوازم جانبی بافت',7,'knitting-accessories','لوازم جانبی بافت | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1002,'نخ ماکرامه',7,'macrame-cord','نخ ماکرامه | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1003,'کیت بافتنی',7,'knitting-kit','کیت بافتنی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1004,'دکمه',8,'buttons','دکمه | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1005,'زیپ',8,'zippers','زیپ | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1010,'قزن و بست',8,'clasps','قزن و بست | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1011,'یراق کیف',8,'bag-hardware','یراق کیف | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1012,'کش و بند',8,'elastic-band','کش و بند | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1013,'برچسب و لیبل',8,'labels','برچسب و لیبل | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1014,'قیچی خیاطی',9,'tailor-scissors','قیچی خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1020,'قیچی گلدوزی',9,'embroidery-scissors','قیچی گلدوزی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1021,'درفش و بشکاف',9,'seam-ripper','درفش و بشکاف | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1022,'متر و اندازه‌گیری',9,'measuring-tools','متر و اندازه‌گیری | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1023,'رولت و گچ خیاطی',9,'marking-tools','رولت و گچ خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1024,'ابزار چرخ خیاطی',9,'machine-tools','ابزار چرخ خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1030,'منجوق',12,'beads','منجوق | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1031,'پولک',12,'sequins','پولک | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1032,'نگین چسبی',12,'rhinestones','نگین چسبی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1033,'مروارید',12,'pearls','مروارید | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1034,'سنگ تزئینی',12,'decorative-stones','سنگ تزئینی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1035,'لوازم منجوق‌کاری',12,'beading-tools','لوازم منجوق‌کاری | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1040,'پارچه نخی',13,'cotton-fabric','پارچه نخی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1041,'پارچه ساتن',13,'satin-fabric','پارچه ساتن | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1042,'پارچه مخمل',13,'velvet-fabric','پارچه مخمل | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1043,'پارچه کتان',13,'linen-fabric','پارچه کتان | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1050,'پارچه حریر',13,'chiffon-fabric','پارچه حریر | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1051,'پارچه بافت',13,'knit-fabric','پارچه بافت | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1052,'چرخ خیاطی خانگی',14,'home-sewing-machine','چرخ خیاطی خانگی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1053,'چرخ خیاطی صنعتی',14,'industrial-sewing-machine','چرخ خیاطی صنعتی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1060,'قطعات چرخ',14,'machine-parts','قطعات چرخ | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1061,'روغن و نگهداری',14,'oil-and-care','روغن و نگهداری | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1062,'لوازم جانبی چرخ',14,'machine-accessories','لوازم جانبی چرخ | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1063,'میز و پایه چرخ',14,'machine-table','میز و پایه چرخ | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1070,'کیف خیاطی',15,'sewing-bag','کیف خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1071,'جعبه و سبد',15,'storage-box','جعبه و سبد | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1072,'سازماندهنده',15,'organizer','سازماندهنده | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1080,'پایه نخ و ماسموره',15,'thread-stand','پایه نخ و ماسموره | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1081,'کیف سوزن',15,'needle-case','کیف سوزن | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17'),
(1082,'لوازم حمل چرخ',15,'machine-carrier','لوازم حمل چرخ | خرازی پرنسا',NULL,'2026-05-15 10:03:17','2026-05-15 10:03:17');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sub_sub_categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `sub_sub_categories` (
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
INSERT IGNORE INTO `sub_sub_categories` VALUES
(130,105,'نخ پلی‌استر','sewing-thread-1','نخ پلی‌استر | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(131,105,'نخ نخی (کتان)','sewing-thread-2','نخ نخی (کتان) | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(132,105,'نخ ابریشمی','sewing-thread-3','نخ ابریشمی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(133,106,'سوزن دوخت بلند','hand-needle-1','سوزن دوخت بلند | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(134,106,'سوزن دوخت کوتاه','hand-needle-2','سوزن دوخت کوتاه | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(135,106,'سوزن دوخت مخصوص جین','hand-needle-3','سوزن دوخت مخصوص جین | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(136,107,'سوزن چرخ یونیورسال','machine-needle-1','سوزن چرخ یونیورسال | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(137,107,'سوزن چرخ جین','machine-needle-2','سوزن چرخ جین | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(138,107,'سوزن چرخ کشدوزی','machine-needle-3','سوزن چرخ کشدوزی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(139,108,'ماسموره پلاستیکی','bobbin-1','ماسموره پلاستیکی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(140,108,'ماسموره فلزی','bobbin-2','ماسموره فلزی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(141,108,'ماسموره مخصوص چرخ صنعتی','bobbin-3','ماسموره مخصوص چرخ صنعتی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(142,109,'سنجاق ته‌گرد','pins-and-clips-1','سنجاق ته‌گرد | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(143,109,'گیره قورباغه‌ای','pins-and-clips-2','گیره قورباغه‌ای | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(144,109,'سنجاق قفلی','pins-and-clips-3','سنجاق قفلی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(145,110,'نخ رفوگری','darning-1','نخ رفوگری | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(146,110,'قارچ رفوگری','darning-2','قارچ رفوگری | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(147,110,'پارچه توری رفوگری','darning-3','پارچه توری رفوگری | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(148,111,'نخ گلدوزی پنبه‌ای','embroidery-floss-1','نخ گلدوزی پنبه‌ای | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(149,111,'نخ گلدوزی ابریشمی','embroidery-floss-2','نخ گلدوزی ابریشمی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(150,111,'نخ متالیک','embroidery-floss-3','نخ متالیک | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(151,112,'حلقه گلدوزی چوبی','embroidery-hoop-1','حلقه گلدوزی چوبی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(152,112,'حلقه گلدوزی پلاستیکی','embroidery-hoop-2','حلقه گلدوزی پلاستیکی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(153,112,'قاب ایستاده','embroidery-hoop-3','قاب ایستاده | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(154,113,'آیدا ۱۴ خانه','aida-fabric-1','آیدا ۱۴ خانه | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(155,113,'آیدا ۱۶ خانه','aida-fabric-2','آیدا ۱۶ خانه | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(156,113,'آیدا رنگی','aida-fabric-3','آیدا رنگی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(157,114,'کیت گلدوزی مبتدی','embroidery-kit-1','کیت گلدوزی مبتدی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(158,114,'کیت گلدوزی گل','embroidery-kit-2','کیت گلدوزی گل | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(159,114,'کیت شماره‌دوزی کودک','embroidery-kit-3','کیت شماره‌دوزی کودک | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(160,115,'طرح چاپی','embroidery-pattern-1','طرح چاپی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(161,115,'دفترچه الگو','embroidery-pattern-2','دفترچه الگو | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(162,115,'طرح دیجیتال','embroidery-pattern-3','طرح دیجیتال | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(163,116,'سوزن گلدوزی نوک‌تیز','embroidery-needle-1','سوزن گلدوزی نوک‌تیز | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(164,116,'سوزن گلدوزی نوک‌کج','embroidery-needle-2','سوزن گلدوزی نوک‌کج | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(165,116,'سوزن گلدوزی چشم‌گشاد','embroidery-needle-3','سوزن گلدوزی چشم‌گشاد | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(166,117,'روبان ساتن ۱ سانتی','satin-ribbon-1','روبان ساتن ۱ سانتی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(167,117,'روبان ساتن ۲ سانتی','satin-ribbon-2','روبان ساتن ۲ سانتی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(168,117,'روبان ساتن پهن','satin-ribbon-3','روبان ساتن پهن | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(169,118,'روبان مخمل ۱ سانتی','velvet-ribbon-1','روبان مخمل ۱ سانتی | خرازی پرنسا','','2025-12-31 12:43:55','2025-12-31 12:43:55'),
(170,118,'روبان مخمل پهن','velvet-ribbon-2','روبان مخمل پهن | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(171,118,'روبان مخمل کشی','velvet-ribbon-3','روبان مخمل کشی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(172,119,'روبان چاپی گلدار','printed-ribbon-1','روبان چاپی گلدار | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(173,119,'روبان پولک‌دار','printed-ribbon-2','روبان پولک‌دار | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(174,119,'روبان چاپی راه‌راه','printed-ribbon-3','روبان چاپی راه‌راه | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(175,120,'دانتل گلدار','lace-guipure-1','دانتل گلدار | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(176,120,'گیپور ژاپنی','lace-guipure-2','گیپور ژاپنی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(177,120,'دانتل کشی','lace-guipure-3','دانتل کشی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(178,121,'تور ساده','tulle-1','تور ساده | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(179,121,'تور گلدار','tulle-2','تور گلدار | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(180,121,'تور سخت','tulle-3','تور سخت | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(181,122,'نوار اریب آماده','bias-tape-1','نوار اریب آماده | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(182,122,'کش توری','bias-tape-2','کش توری | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(183,123,'کاموا اکریلیک','yarn-1','کاموا اکریلیک | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(184,123,'کاموا پشمی','yarn-2','کاموا پشمی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(185,123,'کاموا نخی','yarn-3','کاموا نخی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(186,124,'میل بافتنی فلزی','knitting-needles-1','میل بافتنی فلزی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(187,124,'میل بافتنی چوبی','knitting-needles-2','میل بافتنی چوبی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(188,124,'میل بافتنی دوسر','knitting-needles-3','میل بافتنی دوسر | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(189,1000,'قلاب بافی فلزی','crochet-hook-1','قلاب بافی فلزی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(190,1000,'قلاب بافی ارگونومیک','crochet-hook-2','قلاب بافی ارگونومیک | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(191,1001,'نشانگر بافت','knitting-accessories-1','نشانگر بافت | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(192,1001,'شمارنده ردیف','knitting-accessories-2','شمارنده ردیف | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(193,1001,'سوزن کمکی','knitting-accessories-3','سوزن کمکی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(194,1002,'نخ ماکرامه پنبه‌ای','macrame-cord-1','نخ ماکرامه پنبه‌ای | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(195,1002,'نخ ماکرامه چوبی','macrame-cord-2','نخ ماکرامه چوبی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(196,1003,'کیت بافت کلاه','knitting-kit-1','کیت بافت کلاه | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(197,1003,'کیت بافت شال','knitting-kit-2','کیت بافت شال | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(198,1004,'دکمه پلاستیکی','buttons-1','دکمه پلاستیکی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(199,1004,'دکمه صدفی','buttons-2','دکمه صدفی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(200,1004,'دکمه چوبی','buttons-3','دکمه چوبی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(201,1005,'زیپ مخفی','zippers-1','زیپ مخفی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(202,1005,'زیپ فلزی','zippers-2','زیپ فلزی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(203,1005,'زیپ پلاستیکی','zippers-3','زیپ پلاستیکی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(204,1010,'قزن کیف','clasps-1','قزن کیف | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(205,1010,'بست فشاری','clasps-2','بست فشاری | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(206,1010,'گیره مگنتی','clasps-3','گیره مگنتی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(207,1011,'حلقه کیف','bag-hardware-1','حلقه کیف | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(208,1011,'زنجیر کیف','bag-hardware-2','زنجیر کیف | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(209,1011,'پایه کیف','bag-hardware-3','پایه کیف | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(210,1012,'کش باریک','elastic-band-1','کش باریک | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(211,1012,'کش پهن','elastic-band-2','کش پهن | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(212,1012,'بند کشی','elastic-band-3','بند کشی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(213,1013,'لیبل برند','labels-1','لیبل برند | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(214,1013,'برچسب سایز','labels-2','برچسب سایز | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(215,1013,'برچسب شست‌وشو','labels-3','برچسب شست‌وشو | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(216,1014,'قیچی خیاطی ۸ اینچ','tailor-scissors-1','قیچی خیاطی ۸ اینچ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(217,1014,'قیچی خیاطی ۱۰ اینچ','tailor-scissors-2','قیچی خیاطی ۱۰ اینچ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(218,1014,'قیچی برش پارچه','tailor-scissors-3','قیچی برش پارچه | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(219,1020,'قیچی گلدوزی نوک‌کج','embroidery-scissors-1','قیچی گلدوزی نوک‌کج | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(220,1020,'قیچی گلدوزی کوچک','embroidery-scissors-2','قیچی گلدوزی کوچک | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(221,1021,'درفش خیاطی','seam-ripper-1','درفش خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(222,1021,'بشکاف شکاف‌دهنده','seam-ripper-2','بشکاف شکاف‌دهنده | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(223,1022,'متر خیاطی','measuring-tools-1','متر خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(224,1022,'متر فلزی','measuring-tools-2','متر فلزی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(225,1022,'گونیا خیاطی','measuring-tools-3','گونیا خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(226,1023,'رولت خیاطی','marking-tools-1','رولت خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(227,1023,'گچ خیاطی','marking-tools-2','گچ خیاطی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(228,1023,'ماژیک محو‌شدنی','marking-tools-3','ماژیک محو‌شدنی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(229,1024,'پیچگوشتی چرخ','machine-tools-1','پیچگوشتی چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(230,1024,'انبردست کوچک','machine-tools-2','انبردست کوچک | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(231,1030,'منجوق شیشه‌ای','beads-1','منجوق شیشه‌ای | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(232,1030,'منجوق پلاستیکی','beads-2','منجوق پلاستیکی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(233,1030,'منجوق صدفی','beads-3','منجوق صدفی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(234,1031,'پولک درخشان','sequins-1','پولک درخشان | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(235,1031,'پولک مرواریدی','sequins-2','پولک مرواریدی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(236,1031,'پولک رنگی','sequins-3','پولک رنگی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(237,1032,'نگین چسبی کریستال','rhinestones-1','نگین چسبی کریستال | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(238,1032,'نگین چسبی رنگی','rhinestones-2','نگین چسبی رنگی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(239,1033,'مروارید مصنوعی','pearls-1','مروارید مصنوعی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(240,1033,'مروارید شیشه‌ای','pearls-2','مروارید شیشه‌ای | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(241,1034,'سنگ تخت چسبی','decorative-stones-1','سنگ تخت چسبی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(242,1034,'سنگ براق','decorative-stones-2','سنگ براق | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(243,1035,'سوزن منجوق','beading-tools-1','سوزن منجوق | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(244,1035,'نخ منجوق‌کاری','beading-tools-2','نخ منجوق‌کاری | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(245,1035,'سینی منجوق','beading-tools-3','سینی منجوق | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(246,1040,'نخ پنبه‌ای ساده','cotton-fabric-1','نخ پنبه‌ای ساده | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(247,1040,'نخ پنبه‌ای طرح‌دار','cotton-fabric-2','نخ پنبه‌ای طرح‌دار | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(248,1041,'ساتن لباسی','satin-fabric-1','ساتن لباسی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(249,1041,'ساتن سنگین','satin-fabric-2','ساتن سنگین | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(250,1042,'مخمل کبریتی','velvet-fabric-1','مخمل کبریتی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(251,1042,'مخمل ساده','velvet-fabric-2','مخمل ساده | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(252,1043,'کتان طبیعی','linen-fabric-1','کتان طبیعی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(253,1043,'کتان مخلوط','linen-fabric-2','کتان مخلوط | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(254,1050,'حریر ساده','chiffon-fabric-1','حریر ساده | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(255,1050,'حریر گلدار','chiffon-fabric-2','حریر گلدار | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(256,1051,'فوتر پنبه‌ای','knit-fabric-1','فوتر پنبه‌ای | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(257,1051,'جورس بافت','knit-fabric-2','جورس بافت | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(258,1052,'چرخ خانگی مکانیکی','home-sewing-machine-1','چرخ خانگی مکانیکی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(259,1052,'چرخ خانگی الکترونیکی','home-sewing-machine-2','چرخ خانگی الکترونیکی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(260,1053,'چرخ راسته‌دوز صنعتی','industrial-sewing-machine-1','چرخ راسته‌دوز صنعتی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(261,1053,'چرخ میان‌دوز','industrial-sewing-machine-2','چرخ میان‌دوز | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(262,1060,'ماسموره چرخ','machine-parts-1','ماسموره چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(263,1060,'پایه سوزن','machine-parts-2','پایه سوزن | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(264,1060,'تسمه چرخ','machine-parts-3','تسمه چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(265,1061,'روغن چرخ','oil-and-care-1','روغن چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(266,1061,'قطره‌چکان روغن','oil-and-care-2','قطره‌چکان روغن | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(267,1062,'پای دوخت','machine-accessories-1','پای دوخت | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(268,1062,'پدال چرخ','machine-accessories-2','پدال چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(269,1062,'لامپ چرخ','machine-accessories-3','لامپ چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(270,1063,'میز چرخ','machine-table-1','میز چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(271,1063,'پایه چرخ','machine-table-2','پایه چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(272,1070,'کیف خیاطی پارچه‌ای','sewing-bag-1','کیف خیاطی پارچه‌ای | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(273,1070,'کیف خیاطی چرمی','sewing-bag-2','کیف خیاطی چرمی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(274,1071,'جعبه چوبی لوازم','storage-box-1','جعبه چوبی لوازم | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(275,1071,'سبد تاشو','storage-box-2','سبد تاشو | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(276,1072,'سازماندهنده دیواری','organizer-1','سازماندهنده دیواری | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(277,1072,'کاور لوازم','organizer-2','کاور لوازم | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(278,1080,'پایه نخ رومیزی','thread-stand-1','پایه نخ رومیزی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(279,1080,'پایه ماسموره','thread-stand-2','پایه ماسموره | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(280,1081,'کیف سوزن پارچه‌ای','needle-case-1','کیف سوزن پارچه‌ای | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(281,1081,'جعبه سوزن چوبی','needle-case-2','جعبه سوزن چوبی | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(282,1082,'کاور چرخ','machine-carrier-1','کاور چرخ | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06'),
(283,1082,'چرخ دستی لوازم','machine-carrier-2','چرخ دستی لوازم | خرازی پرنسا',NULL,'2026-05-15 10:08:06','2026-05-15 10:08:06');
/*!40000 ALTER TABLE `sub_sub_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `subscribers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `subscribers` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `ticket_replies` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `tickets` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `users` (
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
INSERT IGNORE INTO `users` VALUES
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `wallets` (
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `wishlists` (
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

-- Dump completed on 2026-10-16 17:54:04
