-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2023 at 04:49 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adom`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'ad', 'ad', 'http://advance-ecommerce-in-laravel-9.test//storage/photos/7/banner/online-shopping-isometric-landing-page-web-banner_107791-3240.png', '<p>asdasd</p>', 'active', '2023-02-08 07:49:04', '2023-02-08 08:27:46'),
(3, 'sg', 'sg', 'http://advance-ecommerce-in-laravel-9.test//storage/photos/7/banner/1197678806.jpg', '<p>erf</p>', 'active', '2023-02-08 07:57:39', '2023-02-08 08:14:18'),
(4, 'sdg', 'sdg', 'http://advance-ecommerce-in-laravel-9.test//storage/photos/7/banner/online-shopping-isometric-landing-page-web-banne107791-3240.png', '<p>sdafsdfsdfgsd sdf</p>', 'active', '2023-02-08 08:29:54', '2023-02-08 08:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Adidas', 'test-brand', 'active', '2023-02-06 06:16:30', '2023-03-27 06:12:35'),
(3, 'Samsung', 'samsung', 'active', '2023-03-27 06:13:05', '2023-03-27 06:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Paddles', 'paddles', '<p>sdfsdf</p>', 'http://advance-ecommerce-in-laravel-9.test//storage/photos/7/category/istockphoto-1427977485-612x612.jpg', 1, NULL, NULL, 'active', '2023-02-06 06:20:34', '2023-03-06 11:07:29'),
(2, 'Nets', 'nets', NULL, NULL, 1, NULL, NULL, 'active', '2023-03-06 11:07:00', '2023-03-06 11:07:00'),
(3, 'Bags', 'bags', NULL, NULL, 1, NULL, NULL, 'active', '2023-03-06 11:07:13', '2023-03-06 11:07:13'),
(4, 'Balls', 'balls', NULL, NULL, 1, NULL, NULL, 'active', '2023-03-06 11:07:46', '2023-03-06 11:07:46'),
(5, 'Accessories', 'accessories', NULL, NULL, 1, NULL, NULL, 'active', '2023-03-06 11:07:53', '2023-03-06 11:07:53'),
(6, 'Ball Machines', 'ball-machines', NULL, NULL, 1, NULL, NULL, 'active', '2023-03-06 11:07:59', '2023-03-06 11:07:59'),
(7, 'Apparel', 'apparel', NULL, NULL, 1, NULL, NULL, 'active', '2023-03-06 11:08:06', '2023-03-06 11:08:06'),
(8, 'Shoes', 'shoes', NULL, NULL, 1, NULL, NULL, 'active', '2023-03-06 11:08:15', '2023-03-06 11:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2023_02_08_162944_create_payments_table', 2),
(23, '2023_04_06_102135_create_product_q_a_s_table', 3),
(24, '2023_04_07_061653_create_vendor_reviews_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('22f1be87-76cb-4ac3-a0d7-5afbb3f59796', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:56:00', '2023-04-07 03:56:00'),
('390a6c10-6dff-433e-a170-7a336327d77a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-02-08 09:56:22', '2023-02-08 09:56:22'),
('3bdec6fb-7b6b-4451-a2b6-64df8941beab', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-02-08 09:57:26', '2023-02-08 09:57:26'),
('3f1d152f-54ff-4e87-9e38-16edd9f9b7f5', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:56:29', '2023-02-08 12:56:29'),
('3fa3da30-03a7-40ad-9d72-d1c16cd90b67', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:46:06', '2023-02-08 12:46:06'),
('4b801fa0-1915-4cbf-a307-4e04c8cdd741', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-06 07:20:03', '2023-04-06 07:20:03'),
('4f65c8be-6f60-47b2-bb4d-dce0c781b387', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:49:35', '2023-02-08 12:49:35'),
('4fc059a2-4e6a-4dc7-b4f1-1cb963a3f0d7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-06 07:18:35', '2023-04-06 07:18:35'),
('69c3844d-88f4-4aff-983f-d5678b4f54e6', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/sit-ad-laudantium-a\",\"fas\":\"fa-star\"}', NULL, '2023-04-05 04:53:58', '2023-04-05 04:53:58'),
('72576a68-e240-4f13-9547-98f504c70953', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:22:56', '2023-02-08 12:22:56'),
('7945bad9-f27f-4a84-bf98-d1a09697f4a3', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:55:31', '2023-04-07 03:55:31'),
('8257d13d-96d3-4999-ae45-5764e9f3f066', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:55:05', '2023-04-07 03:55:05'),
('84f60f45-d807-42f8-b94f-735c93baa1b7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:43:15', '2023-02-08 12:43:15'),
('8796ec9c-2bd8-4d7f-808d-5db0c2ecc2fb', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:13:20', '2023-02-08 12:13:20'),
('8e1be0e1-35dd-41e9-a91f-6aa733181a3e', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:17:41', '2023-02-08 12:17:41'),
('98e30521-2db3-4e8f-a133-0de3ce470d59', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:40:37', '2023-02-08 12:40:37'),
('a92d4802-a7b6-4872-b1a9-7cf863e2ad1d', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:55:53', '2023-04-07 03:55:53'),
('aa8628c9-e9c8-4953-8956-e58b6158529d', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:42:52', '2023-02-08 12:42:52'),
('b76801ac-ac3c-4a9c-bf8b-c05b39ff35df', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/sit-ad-laudantium-a\",\"fas\":\"fa-star\"}', NULL, '2023-04-05 04:33:30', '2023-04-05 04:33:30'),
('bbd1a81a-ab4b-4736-adf3-274c9c637102', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:22:12', '2023-02-08 12:22:12'),
('c06081c8-cd7b-4bef-8bca-82f9ef9e611a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 11:54:20', '2023-02-08 11:54:20'),
('c07394b9-fb89-47e1-903b-30b003002849', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-06 07:19:58', '2023-04-06 07:19:58'),
('c17859d4-c5bd-40b2-834d-e3df8e6dc8a2', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-06 08:11:27', '2023-02-06 08:11:27'),
('c60ba6f5-0a10-4761-a23a-e7bce1265f73', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:42:57', '2023-02-08 12:42:57'),
('cc8e46d7-21c5-479a-bad8-06f9304a0d7c', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-06 08:11:58', '2023-02-06 08:11:58'),
('cce7cd50-f454-47f7-9987-dba61c229703', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 13:02:19', '2023-02-08 13:02:19'),
('cf9ff64e-545b-45da-a3dd-9f7bfdf8c994', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:55:42', '2023-04-07 03:55:42'),
('d3f9b0a7-40c2-4d50-9571-09a0df577791', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"https:\\/\\/adom.ad-wize.com\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 10:38:16', '2023-04-07 10:38:16'),
('d744c513-13fa-4b4b-972e-1e09d0766f13', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:40:56', '2023-02-08 12:40:56'),
('d817fd3d-3b73-419f-9db4-7962a9d7b032', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:55:47', '2023-04-07 03:55:47'),
('d9a99871-c04e-4293-9e0a-fd923e5b0483', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:58:21', '2023-02-08 12:58:21'),
('dc645c77-a55c-4348-bbb5-e125f93a1f8c', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-06 07:12:13', '2023-02-06 07:12:13'),
('e390d2e0-9314-4ab5-bcfe-56cc8d37fb48', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:55:25', '2023-04-07 03:55:25'),
('ee77504c-bc8e-4f90-b6a4-ae12eda60477', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:37:11', '2023-02-08 12:37:11'),
('f0cdc274-876d-4760-966e-b884d26f58d5', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/adom.test\\/vendor\\/order\\/24\",\"fas\":\"fa-file-alt\"}', NULL, '2023-03-28 02:06:23', '2023-03-28 02:06:23'),
('f5a40a90-b218-4dfa-aaae-01938bb0451f', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/adom.test\\/product-detail\\/asd\",\"fas\":\"fa-star\"}', NULL, '2023-04-07 03:55:18', '2023-04-07 03:55:18'),
('f6ae3fce-cb96-44af-9fbf-2bf31ac00011', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/adom.test\\/vendor\\/order\\/23\",\"fas\":\"fa-file-alt\"}', NULL, '2023-03-14 11:53:19', '2023-03-14 11:53:19'),
('fd097c7e-8bb8-41bd-885c-b8be8bbe2ff9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 7, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/advance-ecommerce-in-laravel-9.test\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-08 12:49:29', '2023-02-08 12:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `another_ship` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `another_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `another_zip` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `another_city` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `another_phone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `another_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `company_name`, `email`, `phone`, `country`, `zip_code`, `city`, `address`, `another_ship`, `another_address`, `another_zip`, `another_city`, `another_phone`, `another_email`, `note`, `created_at`, `updated_at`) VALUES
(22, 'ORD-MJKVQAAFSE', NULL, 1287.54, 1, NULL, 1337.54, 1, 'paypal', 'paid', 'delivered', 'Suki', 'Cook', NULL, 'xijiver@mailinator.com', '17', 'NP', 'Numquam beatae sint', NULL, '535 West Oak Drive', '0', NULL, NULL, NULL, NULL, NULL, 'Enim aut hic hic opt', '2023-02-08 13:02:18', '2023-02-10 13:41:09'),
(24, 'ORD-JVR0LGAGOE', NULL, 234.00, 1, NULL, 234.00, 2, 'cod', 'unpaid', 'delivered', 'Saad', 'Awan', NULL, 'saadkhan3977@gmail.com', '03042157462', 'PK', '75660', 'karachi', 'kharadar tower karachi', NULL, 'kharadar tower karachi', '75660', 'karachi', '030421574621', 'saadkhan3977@gmail.com', 'asdasd', '2023-03-28 02:06:22', '2023-03-28 05:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('saadkhan3977@gmail.com', '$2y$10$njzlqkRoKj18fwlgmYW7RO8gx1GGVvQ6IQHEX4YyFJQM1MOopSyOi', '2023-03-06 10:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(2, 'asd', 'asd', '<p>asd</p>', '<p>ds</p>', '<p>dasd</p>', 'http://adom.test/storage/photos/7/Logo/logo.png', 'new,old', NULL, NULL, NULL, 'active', '2023-03-08 09:57:37', '2023-03-08 10:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Accessories', 'accessories', 'active', '2023-03-28 06:14:20', '2023-03-28 06:14:20'),
(6, 'Apparel', 'apparel', 'active', '2023-03-28 06:14:26', '2023-03-28 06:14:26'),
(7, 'Bags', 'bags', 'active', '2023-03-28 06:14:34', '2023-03-28 06:14:34'),
(8, 'Ball Machines', 'ball-machines', 'active', '2023-03-28 06:14:41', '2023-03-28 06:14:41'),
(9, 'Balls', 'balls', 'active', '2023-03-28 06:14:46', '2023-03-28 06:14:46'),
(10, 'Nets', 'nets', 'active', '2023-03-28 06:14:53', '2023-03-28 06:14:53'),
(11, 'Paddles', 'paddles', 'active', '2023-03-28 06:15:00', '2023-03-28 06:15:00'),
(12, 'Shoes', 'shoes', 'active', '2023-03-28 06:15:07', '2023-03-28 06:15:07');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'new', 'new', 'active', '2023-03-07 13:27:52', '2023-03-07 13:27:52'),
(2, 'old', 'old', 'active', '2023-03-08 06:08:21', '2023-03-08 06:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `specification` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '1',
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `tags` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `cat_id`, `child_cat_id`, `brand_id`, `title`, `slug`, `summary`, `description`, `specification`, `photo`, `files`, `stock`, `size`, `condition`, `tags`, `sku`, `status`, `price`, `discount`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 7, 3, NULL, 2, 'Mens Grey Hooded Double Contrast Track Suit', 'asd', '<p><div id=\"block-okYuU7U7cD\" class=\"pdp-block pdp-block__rating-questions-summary\" style=\"margin: 0px; padding: 0px; display: table; width: 480px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"block-3ZD2WM6bVV\" class=\"pdp-block pdp-block__rating-questions\" style=\"margin: 0px; padding: 0px; display: table-cell; vertical-align: middle; text-align: left;\"><div id=\"module_product_review_star_1\" class=\"pdp-block module\" style=\"margin: 0px; padding: 0px;\"></div></div></div></p><div id=\"module_product_title_1\" class=\"pdp-block module\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"pdp-product-title\" style=\"margin: 13px 0px 11px; padding: 0px;\"><div class=\"pdp-mod-product-badge-wrapper\" style=\"margin: 4px 0px 0px; padding: 0px;\"><span class=\"pdp-mod-product-badge-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i2.bd8amOt9mOt9SV\" style=\"margin: 0px; padding: 0px; color: rgb(33, 33, 33); font-size: 22px; font-weight: 400; word-break: break-word; overflow-wrap: break-word;\">Mens Grey Hooded Double Contrast Track Suit</span></div></div></div>', '<h2 class=\"pdp-mod-section-title outer-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i3.bd8amOt9mOt9SV\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 24px; font-family: Roboto-Medium; font-size: 16px; line-height: 52px; color: rgb(33, 33, 33); overflow: hidden; text-overflow: ellipsis; white-space: nowrap; height: 52px; background: rgb(250, 250, 250);\">Product details of Mens Grey Hooded Double Contrast Track Suit</h2><div class=\"pdp-product-detail\" data-spm=\"product_detail\" style=\"margin: 0px; padding: 0px; position: relative; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><div class=\"pdp-product-desc \" style=\"margin: 0px; padding: 5px 14px 5px 24px; height: auto; overflow-y: hidden;\"><div class=\"html-content pdp-product-highlights\" style=\"margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden;\"><ul class=\"\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Mens Grey Hooded Double Contrast Track Suit</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Casual Style Track Suit</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Fabric : fleece</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Size: M, L &amp; XL</li></ul></div><div class=\"html-content detail-content\" style=\"margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245);\"><div style=\"margin: 0px; padding: 8px 0px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">Mens Grey Hooded Double Contrast Track Suit</span><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Winter Casual Style Track Suit</span></div><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Fabric : fleece</span></div><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Size: M, L &amp; XL</span></div><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Note: We recommend hand washing for long-lasting life.﻿</span></div></div></div><div class=\"pdp-mod-specification\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.bd8amOt9mOt9SV\" style=\"margin: 16px 0px 0px; padding: 0px 0px 10px; border-bottom: 1px solid rgb(239, 240, 245); font-size: 14px;\"><h2 class=\"pdp-mod-section-title \" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: Roboto-Medium; font-size: 16px; line-height: 19px; color: rgb(33, 33, 33); letter-spacing: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">Specifications of Mens Grey Hooded Double Contrast Track Suit</h2><div class=\"pdp-general-features\" style=\"margin: 0px; padding: 0px;\"><ul class=\"specification-keys\" style=\"margin: 16px -15px 0px; padding: 0px; list-style: none; height: auto;\"><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Brand</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">No Brand</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">SKU</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">129970584_PK-1289796826</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Apparel</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">Party</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Age Range</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">Standard</div></li></ul></div><div class=\"box-content\" style=\"margin: 28px 0px 0px; padding: 0px;\"><span class=\"key-title\" style=\"margin: 0px; padding: 0px; display: table-cell; width: 140px; color: rgb(117, 117, 117); word-break: break-word;\">What’s in the box</span><div class=\"html-content box-content-html\" style=\"margin: 0px; padding: 0px 0px 0px 18px; word-break: break-word; display: table-cell;\">1 X Mens Grey Hooded Double Contrast Track Suit</div></div></div></div></div>', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/bag1.png', NULL, 20, 'M,L,XL', 'hot', '', NULL, 'active', 2799.00, 54.00, 0, '2023-02-06 06:44:45', '2023-04-18 09:00:26'),
(2, 7, 3, NULL, 2, 'Men\'s Classic Plaid Jacket', 'mens-classic-plaid-jacket', '<p><div id=\"block-okYuU7U7cD\" class=\"pdp-block pdp-block__rating-questions-summary\" style=\"margin: 0px; padding: 0px; display: table; width: 480px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"block-3ZD2WM6bVV\" class=\"pdp-block pdp-block__rating-questions\" style=\"margin: 0px; padding: 0px; display: table-cell; vertical-align: middle; text-align: left;\"><div id=\"module_product_review_star_1\" class=\"pdp-block module\" style=\"margin: 0px; padding: 0px;\"></div></div></div></p><div id=\"module_product_title_1\" class=\"pdp-block module\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"pdp-product-title\" style=\"margin: 13px 0px 11px; padding: 0px;\"><div class=\"pdp-mod-product-badge-wrapper\" style=\"margin: 4px 0px 0px; padding: 0px;\"><span class=\"pdp-mod-product-badge-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i1.4cf3WMwpWMwpLI\" style=\"margin: 0px; padding: 0px; color: rgb(33, 33, 33); font-size: 22px; font-weight: 400; word-break: break-word; overflow-wrap: break-word;\">Stylish Jacket For Men</span></div></div></div>', '<h2 class=\"pdp-mod-section-title outer-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i5.77baYBAOYBAOFW\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 24px; font-family: Roboto-Medium; font-size: 16px; line-height: 52px; color: rgb(33, 33, 33); overflow: hidden; text-overflow: ellipsis; white-space: nowrap; height: 52px; background: rgb(250, 250, 250);\">Product details of Men\'s Classic Plaid Jacket</h2><div class=\"pdp-product-detail\" data-spm=\"product_detail\" style=\"margin: 0px; padding: 0px; position: relative; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><div class=\"pdp-product-desc \" style=\"margin: 0px; padding: 5px 14px 5px 24px; height: auto; overflow-y: hidden;\"><div class=\"html-content pdp-product-highlights\" style=\"margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden;\"><ul class=\"\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">100% New &amp; Good Quality</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Look Smart</li><li class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.77baYBAOYBAOFW\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Good Stitched</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Ready to Wear</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Easy Wash</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Premium Quality</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Fashionable Design</li></ul></div><div class=\"html-content detail-content\" style=\"margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">Men\'s Classic Plaid Jacket</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">For winter new Collection Zipper Upper Jacket</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">Full stitched ready to wear easy wash</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">Sizes.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">M</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">L</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">XL</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">Fabric. Fleece </span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 8px 0px; font-size: 14px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">Note : we recommend hand Wash.</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 14px;\"></p></div><div class=\"pdp-mod-specification\" style=\"margin: 16px 0px 0px; padding: 0px 0px 10px; border-bottom: 1px solid rgb(239, 240, 245); font-size: 14px;\"><h2 class=\"pdp-mod-section-title \" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: Roboto-Medium; font-size: 16px; line-height: 19px; color: rgb(33, 33, 33); letter-spacing: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">Specifications of Men\'s Classic Plaid Jacket</h2><div class=\"pdp-general-features\" style=\"margin: 0px; padding: 0px;\"><ul class=\"specification-keys\" style=\"margin: 16px -15px 0px; padding: 0px; list-style: none; height: auto;\"><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Brand</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">No Brand</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">SKU</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">179740023_PK-1357854643</div></li></ul></div><div class=\"box-content\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.77baYBAOYBAOFW\" style=\"margin: 28px 0px 0px; padding: 0px;\"><span class=\"key-title\" style=\"margin: 0px; padding: 0px; display: table-cell; width: 140px; color: rgb(117, 117, 117); word-break: break-word;\">What’s in the box</span><div class=\"html-content box-content-html\" style=\"margin: 0px; padding: 0px 0px 0px 18px; word-break: break-word; display: table-cell;\">1 x Pack Men\'s Classic Plaid Jacket</div></div></div></div></div>', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/bag2.png', NULL, 100, 'M,L,XL', 'hot', '', NULL, 'active', 2100.00, 62.00, 0, '2023-02-08 10:06:37', '2023-04-18 09:00:20'),
(3, 7, 3, NULL, 2, 'Billum ipsam nihil p', 'abc', '<p>asd</p>', '<p>asdsa</p>', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/bag3.png', NULL, 50, 'M', 'hot', '', NULL, 'active', 250.00, NULL, 0, '2023-03-03 11:01:48', '2023-04-18 09:00:06'),
(4, 7, 5, NULL, 2, 'Cillum ipsam nihil p', 'cillum-ipsam-nihil-p', 'Ullam ut error et de.fe', 'Labore ut repellendu.e', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/3.png', NULL, 980, 'M,L', 'new', '', NULL, 'active', 493.00, 91.00, 1, '2023-03-09 07:31:05', '2023-04-18 09:03:13'),
(5, 7, 8, NULL, 2, 'Nihil repellendus V', 'nihil-repellendus-v', 'Ad sint velit dicta .as', 'Cupiditate illo exce.sa', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/2.png', NULL, 471, 'M,L', 'new', 'new,old', NULL, 'active', 778.00, 49.00, 1, '2023-03-09 07:40:05', '2023-04-18 09:02:40'),
(6, 7, 1, NULL, 2, 'Sit ad laudantium a', 'sit-ad-laudantium-a', '<div style=\"text-align: justify;\"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</b></span></font></div>', 'Explicabo. Eius eos .as', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/1.png', NULL, 556, 'M,L,XL', 'default', 'new', 'asd', 'active', 236.00, 74.00, 1, '2023-03-09 11:05:40', '2023-04-18 09:01:34'),
(8, 7, 4, NULL, 3, 'test', 'test', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>', '<p>kljhsdkln</p>', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/ball1.png', NULL, 20, 'L', 'new', 'new,old', 'lfiufse', 'active', 179.00, 1.00, 0, '2023-03-10 13:00:28', '2023-04-18 08:59:10'),
(12, 7, 3, NULL, 2, 'Menss Grey Hooded Double Contrast Track Suit', 'debitis-ratione-est', '<p></p><div id=\"block-okYuU7U7cD\" class=\"pdp-block pdp-block__rating-questions-summary\" style=\"margin: 0px; padding: 0px; display: table; width: 480px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"block-3ZD2WM6bVV\" class=\"pdp-block pdp-block__rating-questions\" style=\"margin: 0px; padding: 0px; display: table-cell; vertical-align: middle; text-align: left;\"><div id=\"module_product_review_star_1\" class=\"pdp-block module\" style=\"margin: 0px; padding: 0px;\"></div></div></div><p></p><div id=\"module_product_title_1\" class=\"pdp-block module\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"pdp-product-title\" style=\"margin: 13px 0px 11px; padding: 0px;\"><div class=\"pdp-mod-product-badge-wrapper\" style=\"margin: 4px 0px 0px; padding: 0px;\"><span class=\"pdp-mod-product-badge-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i2.bd8amOt9mOt9SV\" style=\"margin: 0px; padding: 0px; color: rgb(33, 33, 33); font-size: 22px; font-weight: 400; word-break: break-word; overflow-wrap: break-word;\">Menss Grey Hooded Double Contrast Track Suit</span></div></div></div>', '<h2 class=\"pdp-mod-section-title outer-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i3.bd8amOt9mOt9SV\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 24px; font-family: Roboto-Medium; font-size: 16px; line-height: 52px; color: rgb(33, 33, 33); overflow: hidden; text-overflow: ellipsis; white-space: nowrap; height: 52px; background: rgb(250, 250, 250);\">Product details of Mens Grey Hooded Double Contrast Track Suit</h2><div class=\"pdp-product-detail\" data-spm=\"product_detail\" style=\"margin: 0px; padding: 0px; position: relative; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><div class=\"pdp-product-desc \" style=\"margin: 0px; padding: 5px 14px 5px 24px; height: auto; overflow-y: hidden;\"><div class=\"html-content pdp-product-highlights\" style=\"margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden;\"><ul class=\"\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Mens Grey Hooded Double Contrast Track Suit</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Casual Style Track Suit</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Fabric : fleece</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Size: M, L &amp; XL</li></ul></div><div class=\"html-content detail-content\" style=\"margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245);\"><div style=\"margin: 0px; padding: 8px 0px; white-space: pre-wrap;\"><span style=\"margin: 0px; padding: 0px;\">Mens Grey Hooded Double Contrast Track Suit</span><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Winter Casual Style Track Suit</span></div><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Fabric : fleece</span></div><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Size: M, L &amp; XL</span></div><div style=\"margin: 0px; padding: 8px 0px;\"><span style=\"margin: 0px; padding: 0px;\">Note: We recommend hand washing for long-lasting life.﻿</span></div></div></div><div class=\"pdp-mod-specification\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.bd8amOt9mOt9SV\" style=\"margin: 16px 0px 0px; padding: 0px 0px 10px; border-bottom: 1px solid rgb(239, 240, 245); font-size: 14px;\"><h2 class=\"pdp-mod-section-title \" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-family: Roboto-Medium; font-size: 16px; line-height: 19px; color: rgb(33, 33, 33); letter-spacing: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">Specifications of Mens Grey Hooded Double Contrast Track Suit</h2><div class=\"pdp-general-features\" style=\"margin: 0px; padding: 0px;\"><ul class=\"specification-keys\" style=\"margin: 16px -15px 0px; padding: 0px; list-style: none; height: auto;\"><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Brand</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">No Brand</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">SKU</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">129970584_PK-1289796826</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Apparel</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">Party</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Age Range</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">Standard</div></li></ul></div><div class=\"box-content\" style=\"margin: 28px 0px 0px; padding: 0px;\"><span class=\"key-title\" style=\"margin: 0px; padding: 0px; display: table-cell; width: 140px; color: rgb(117, 117, 117); word-break: break-word;\">What’s in the box</span><div class=\"html-content box-content-html\" style=\"margin: 0px; padding: 0px 0px 0px 18px; word-break: break-word; display: table-cell;\">1 X Mens Grey Hooded Double Contrast Track Suit</div></div></div></div></div>', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/bag4.png', NULL, 20, 'M,L,XL', 'hot', 'new', NULL, 'active', 2799.00, 54.00, 0, '2023-03-28 01:19:36', '2023-04-18 08:58:45'),
(13, 7, 1, NULL, 3, 'In voluptas id dicta', 'in-voluptas-id-dicta', '<p>sdf&nbsp;</p>', '<p>&nbsp;wa&nbsp;</p>', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/paddle1.png', NULL, 232, 'S,M', 'new', 'new', 'Dicta vel a voluptas', 'active', 50.00, 10.00, 0, '2023-04-18 06:36:50', '2023-04-18 08:57:44'),
(14, 7, 1, NULL, 2, 'Ut fugiat eligendi m', 'ut-fugiat-eligendi-m', 'Quisquam voluptate a.sert&nbsp;', 'Elit, earum ut sit, .se&nbsp;', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/paddle2.png', NULL, 445, 'S,M,L', 'new', 'new,old', 'Quos accusamus facer', 'active', 35.00, 3.00, 0, '2023-04-18 07:08:01', '2023-04-18 07:08:01'),
(15, 7, 1, NULL, 3, 'A sit odio ut conseq', 'a-sit-odio-ut-conseq', 'Tenetur id fuga. Et .dc', 'Sed sint, distinctio.awd', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/paddle3.png', NULL, 551, 'S,M', 'default', 'new,old', 'Veniam non qui cupi', 'active', 855.00, 15.00, 0, '2023-04-18 07:08:43', '2023-04-18 07:08:51'),
(16, 7, 1, NULL, 3, 'Voluptate duis ut co', 'voluptate-duis-ut-co', 'Est, dolores laborum.&nbsp;', 'Blanditiis enim cons.&nbsp;', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/paddle4.png', NULL, 78, 'S', 'hot', 'old', 'Facere ipsam omnis s', 'active', 50.00, 1.00, 0, '2023-04-18 07:09:25', '2023-04-18 08:57:28'),
(17, 7, 2, NULL, 2, 'Debitis qui nesciunt', 'debitis-qui-nesciunt', 'Ad ex quas voluptate.as', 'In cillum et asperio.awd', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/nets1.png', NULL, 617, 'M,L', 'hot', 'old', 'Laboris laboris quia', 'active', 890.00, 9.00, 0, '2023-04-18 08:49:39', '2023-04-18 08:49:39'),
(18, 7, 2, NULL, 3, 'Libero unde sapiente', 'libero-unde-sapiente', 'Veniam, voluptate si.sd', 'Ullamco exercitation.sf', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/nets2.png', NULL, 125, 'S,M,XL', 'hot', 'new,old', 'Dolor facilis in qui', 'active', 416.00, 4.00, 0, '2023-04-18 08:50:19', '2023-04-18 08:50:19'),
(19, 7, 2, NULL, 3, 'Incidunt ad aut dol', 'incidunt-ad-aut-dol', 'dEa non dolorem ut ut.', 'dExplicabo. Vitae ips.ad', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/nets3.png', NULL, 920, 'S,M,XL', 'default', 'new', 'Dolor et culpa conse', 'active', 953.00, 38.00, 0, '2023-04-18 08:50:44', '2023-04-18 08:50:44'),
(20, 7, 2, NULL, 3, 'Proident vel maiore', 'proident-vel-maiore', 'Nulla nostrud natus .rf', 'Et laboris obcaecati.f', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/nets4.png', NULL, 466, 'S,L,XL', 'hot', 'new,old', 'Quas eos ipsam et e', 'active', 674.00, 24.00, 0, '2023-04-18 08:51:10', '2023-04-18 08:57:12'),
(21, 7, 4, NULL, 2, 'Natus tempora conseq', 'natus-tempora-conseq', 'Quidem distinctio. S.fdg', 'Nostrum impedit, et .dg', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/ball2.png', NULL, 444, 'S', 'default', 'new', 'Saepe necessitatibus', 'active', 340.00, 8.00, 0, '2023-04-18 08:52:19', '2023-04-18 08:52:19'),
(22, 7, 4, NULL, 2, 'Repellendus Volupta', 'repellendus-volupta', 'Possimus, iste id, c.rtg', 'Lorem delectus, omni.f', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/ball3.png', NULL, 679, 'M', 'default', 'new', 'Unde quis assumenda', 'active', 256.00, 15.00, 0, '2023-04-18 08:53:06', '2023-04-18 08:53:06'),
(23, 7, 4, NULL, 3, 'Eos mollitia eu qui', 'eos-mollitia-eu-qui', 'Anim aspernatur quia.sd', 'Iusto pariatur? Sed .fs', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/ball4.png', NULL, 974, 'L', 'hot', 'old', 'Incididunt molestiae', 'active', 911.00, 34.00, 0, '2023-04-18 08:53:42', '2023-04-18 08:53:42'),
(24, 7, 5, NULL, 2, 'Vero quidem aperiam', 'vero-quidem-aperiam', 'Aliquam quos odio qu.f', 'Consectetur, qui qui.df', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/acc1.png', NULL, 842, 'S,L', 'default', 'new,old', 'Expedita eum nostrum', 'active', 691.00, 7.00, 0, '2023-04-18 08:54:28', '2023-04-18 08:54:28'),
(25, 7, 5, NULL, 2, 'Anim rerum maiores s', 'anim-rerum-maiores-s', 'Reprehenderit, ut en.d', 'Voluptatem. Nesciunt.d', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/acc2.png', NULL, 443, 'XL', 'default', 'new,old', 'Aliquam qui ut iste', 'active', 742.00, 68.00, 0, '2023-04-18 08:54:48', '2023-04-18 08:56:58'),
(26, 7, 5, NULL, 2, 'Sit dolor commodi e', 'sit-dolor-commodi-e', 'Velit, reprehenderit.sd', 'Itaque veniam, iste .d', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/acc3.png', NULL, 885, 'M,L,XL', 'default', 'new,old', 'Voluptas odit omnis', 'active', 24.00, 45.00, 0, '2023-04-18 08:55:11', '2023-04-18 08:56:41'),
(27, 7, 5, NULL, 2, 'Itaque rerum dicta t', 'itaque-rerum-dicta-t', 'Proident, ut id dele.d', 'Sunt, aut placeat, d.d', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/acc4.png', NULL, 167, 'M', 'default', 'old', 'Accusamus architecto', 'active', 123.00, 41.00, 0, '2023-04-18 08:55:31', '2023-04-18 08:56:29'),
(28, 7, 4, NULL, 2, 'Placeat adipisicing', 'placeat-adipisicing', 'Blanditiis animi, of.v', 'Nesciunt, et natus u.&nbsp;', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/4.png', NULL, 438, 'S,L', 'hot', 'new', 'Consectetur dolore', 'active', 581.00, 8.00, 1, '2023-04-18 09:06:15', '2023-04-18 09:06:15'),
(29, 7, 1, NULL, 2, 'Minima sint quam rem', 'minima-sint-quam-rem', 'Quibusdam dolor nece.&nbsp;', 'Lorem rem eos except.&nbsp;', NULL, 'https://adom.ad-wize.com/storage/photos/7/Product/carousel-main.jpg', NULL, 558, 'L', 'default', 'new,old', 'Deserunt beatae dist', 'active', 800.00, 16.00, 0, '2023-04-18 09:13:54', '2023-04-18 09:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_q_a`
--

CREATE TABLE `product_q_a` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_q_a`
--

INSERT INTO `product_q_a` (`id`, `product_id`, `user_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, '1', '19', 'asdas', 'asdasfcsdsdv sdfa', '2023-04-06 05:40:54', '2023-04-06 07:16:53'),
(2, '1', '20', 'xdgsdv', 'sdfg', '2023-04-07 03:53:41', '2023-04-07 10:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(17, 22, 1, 5, 'testing', 'active', '2023-04-07 10:38:16', '2023-04-07 10:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `files`, `address`, `phone`, `copyright`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', 'https://adom.ad-wize.com/storage/photos/7/Logo/logo.png', 'image.jpg', NULL, 'NO. 342 - London Oxford Street, 012 United Kingdom', '+92 304 2157 462', 'Copyright © 2023 Adam | Impact Enterprises LLC. All rights reserved.', 'saadkhan3977@gmail.com', NULL, '2023-04-18 11:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PDX', '50.00', 'active', '2023-02-08 13:00:49', '2023-02-08 13:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user','vendor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Admin', 'admin@gmail.com', NULL, '$2a$12$FT97GFMZbS3ZHL1g4LmSTOVkDs2H1o4zvdYlElInEc1ocCNT5CMYW', 'http://advance-ecommerce-in-laravel-9.test//storage/photos/7/profile/299815879_1710194642691788_5117155732056870252_n.jpg', 'admin', NULL, NULL, 'active', NULL, NULL, '2023-02-08 08:07:10'),
(20, 'user', 'user@gmail.com', NULL, '$2y$10$jpxCn1KANfsZXw16BY5DyeJ7hwp2hFiwQ1q0feAxi.VMdzf9Bo5oK', NULL, 'user', NULL, NULL, 'active', NULL, '2023-03-10 12:21:28', '2023-03-10 12:21:28'),
(21, 'jhon', 'jhon@gmail.com', NULL, '$2y$10$sw3A6jK0EKtRfjs2zTptA.7HdZOmQu1Y3ouUBsDt/5Hc6BQJfU71q', NULL, 'user', NULL, NULL, 'active', NULL, '2023-04-04 18:27:32', '2023-04-04 18:27:32'),
(22, 'smith@gmail.com', 'smith@gmail.com', NULL, '$2y$10$0xslZl839fRLYZP1N4Q58OJvN4rWKdjl5Ml0BiDU3LMdLoNlPfDoG', NULL, 'vendor', NULL, NULL, 'active', NULL, '2023-04-04 18:48:20', '2023-04-04 18:48:20'),
(23, 'impactpickleball', 'adam.impactpickleball@gmail.com', NULL, '$2y$10$aRLQYYwBq.ambpgXmSLDx..SZzzs7HsTkkJ7UlakKdUhwhuPbnHzO', NULL, 'vendor', NULL, NULL, 'active', NULL, '2023-04-18 20:38:18', '2023-04-18 20:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_reviews`
--

CREATE TABLE `vendor_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_reviews`
--

INSERT INTO `vendor_reviews` (`id`, `vendor_id`, `user_id`, `status`, `review`, `created_at`, `updated_at`) VALUES
(3, '22', '22', '1', 'das', '2023-04-07 10:41:58', '2023-04-07 10:41:58'),
(4, '7', '20', '0', 'hello', '2023-04-19 02:10:50', '2023-04-19 02:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 1287.54, 1, 1287.54, '2023-03-10 13:20:29', '2023-03-10 13:20:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_q_a`
--
ALTER TABLE `product_q_a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendor_reviews`
--
ALTER TABLE `vendor_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_q_a`
--
ALTER TABLE `product_q_a`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vendor_reviews`
--
ALTER TABLE `vendor_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
