-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2020 at 05:25 AM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msh`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `details` text COLLATE utf8mb4_unicode_ci,
                         `price` decimal(20,2) NOT NULL,
                         `is_default_offered` tinyint(4) NOT NULL,
                         `is_active` tinyint(4) NOT NULL DEFAULT '1',
                         `created_by` bigint(20) UNSIGNED NOT NULL,
                         `updated_by` bigint(20) UNSIGNED NOT NULL,
                         `deleted_at` timestamp NULL DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `add_ons`
--

INSERT INTO `add_ons` (`id`, `description`, `details`, `price`, `is_default_offered`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Stand Up Paddle', NULL, '150.00', 1, 1, 1, 1, NULL, '2020-01-20 21:22:17', '2020-01-20 21:22:17'),
(2, 'Underwater Scooter', NULL, '150.00', 1, 1, 1, 1, NULL, '2020-01-20 21:22:37', '2020-01-20 21:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `ambassadors`
--

CREATE TABLE `ambassadors` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `guest_title_id` bigint(20) UNSIGNED DEFAULT NULL,
                             `instructor_profile` text COLLATE utf8mb4_unicode_ci,
                             `first_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `last_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `middle_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `birth_date` date DEFAULT NULL,
                             `nationality_id` bigint(20) UNSIGNED DEFAULT NULL,
                             `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `pob_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `pob_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `current_residency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `identification_card_type_id` bigint(20) UNSIGNED DEFAULT NULL,
                             `other_id_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `id_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `passport_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `expiration_date` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `is_active` tinyint(4) NOT NULL DEFAULT '1',
                             `created_by` bigint(20) UNSIGNED NOT NULL,
                             `updated_by` bigint(20) UNSIGNED NOT NULL,
                             `deleted_at` timestamp NULL DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ambassadors`
--

INSERT INTO `ambassadors` (`id`, `guest_title_id`, `instructor_profile`, `first_name`, `last_name`, `middle_name`, `birth_date`, `nationality_id`, `phone_number`, `email`, `pob_country`, `pob_city`, `current_residency`, `identification_card_type_id`, `other_id_type`, `id_number`, `passport_number`, `expiration_date`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'https://www.yogasailingholidays.com/', 'Emily', 'Jerde', '', NULL, NULL, '', 'emilyjerdelmt@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:02:38', '2020-03-11 07:50:04'),
(2, NULL, NULL, 'Alana', 'Michele', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:03:41', '2020-01-14 19:03:41'),
(3, NULL, NULL, 'Anthony', 'Cushion', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:03:58', '2020-01-14 19:03:58'),
(4, NULL, NULL, 'Rahul', 'Rathore', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:04:12', '2020-01-14 19:04:12'),
(5, NULL, NULL, 'Andres', 'Leal', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:04:23', '2020-01-14 19:04:23'),
(6, NULL, 'https://www.yogasailingholidays.com', 'Leilanie', 'Paz', '', NULL, NULL, '', 'leilanieyoga@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:04:33', '2020-03-11 07:51:52'),
(7, NULL, 'https://www.yogasailingholidays.com/', 'Dee', 'Ishani', '', NULL, NULL, '', 'dee@harakati.yoga', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:04:44', '2020-03-11 07:52:40'),
(8, NULL, NULL, 'Danielle', 'Pitcher', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:04:54', '2020-01-14 19:04:54'),
(9, NULL, 'https://www.yogasailingholidays.com/', 'Rebekka', 'Nerhovde', '', NULL, NULL, '', 'rebekkaneh@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 4, 1, NULL, '2020-01-14 19:04:58', '2020-03-11 07:54:43'),
(10, NULL, 'https://www.yogasailingholidays.com/', 'Stefanie', 'Blaskowitz', '', NULL, NULL, '', 'try.the.rolling.yogi@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:05:06', '2020-03-11 07:53:16'),
(11, NULL, NULL, 'Kamilla', 'Seljelid', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:05:20', '2020-01-14 19:05:20'),
(12, NULL, NULL, 'Maria', 'Johnson', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:05:25', '2020-01-14 19:05:25'),
(13, NULL, NULL, 'Rebekka', 'Nerhovde', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 1, '2020-03-03 05:17:16', '2020-01-14 19:05:30', '2020-03-03 05:17:16'),
(14, NULL, NULL, 'Maddie', 'Lynch', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:05:47', '2020-01-14 19:05:47'),
(15, NULL, NULL, 'Timur', 'Tugberk', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 1, '2020-03-03 05:19:29', '2020-01-14 19:05:50', '2020-03-03 05:19:29'),
(16, NULL, 'https://www.yogasailingholidays.com/', 'Chrissie', 'Alexander', '', NULL, NULL, '', 'chrissiealex@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:06:01', '2020-03-11 07:55:26'),
(17, NULL, NULL, 'Katie', 'Schiffgen', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:06:33', '2020-01-14 19:06:33'),
(18, NULL, NULL, 'Karina', 'Sell', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 1, '2020-03-03 05:17:46', '2020-01-14 19:07:05', '2020-03-03 05:17:46'),
(19, NULL, 'https://www.yogasailingholidays.com/', 'Cate', 'Murray', '', NULL, NULL, '', 'cate.eilee.murray@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:07:11', '2020-03-11 07:55:59'),
(20, NULL, NULL, 'Farah', 'Mostafa', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:07:56', '2020-01-14 19:07:56'),
(21, NULL, NULL, 'The', 'Globetrotter Guys', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:08:12', '2020-01-14 19:08:57'),
(22, NULL, NULL, 'Giulietta', 'Evans', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 1, '2020-03-03 05:06:58', '2020-01-14 19:08:42', '2020-03-03 05:06:58'),
(23, NULL, NULL, 'Danielle', 'DeGroot', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:08:56', '2020-01-14 19:08:56'),
(24, NULL, NULL, 'Two', 'Bad Tourists', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:09:14', '2020-01-14 19:09:14'),
(25, NULL, NULL, 'Amanda', 'Freels', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:09:24', '2020-01-14 19:09:24'),
(26, NULL, NULL, 'Keilimei', 'Trahan-McCarthy', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-14 19:09:28', '2020-01-14 19:09:28'),
(27, NULL, 'https://www.yogasailingholidays.com/', 'Ramone', 'Bisset', '', NULL, NULL, '', 'ramonebisset@hotmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:09:43', '2020-03-11 07:57:10'),
(28, NULL, NULL, 'Donna', 'Freakie', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:09:46', '2020-01-14 19:09:46'),
(29, NULL, NULL, 'Saeunn', 'Rut', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 1, '2020-03-03 05:00:42', '2020-01-14 19:09:54', '2020-03-03 05:00:42'),
(30, NULL, NULL, 'Charlotte', 'Pragnell', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:10:02', '2020-01-14 19:10:02'),
(31, NULL, 'https://www.yogasailingholidays.com/', 'Arezu', 'Kaywanfar', '', NULL, NULL, '', 'arezukay@yahoo.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:10:04', '2020-03-11 07:57:46'),
(32, NULL, NULL, 'Claire', 'Ewing', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 1, '2020-03-03 04:56:54', '2020-01-14 19:10:15', '2020-03-03 04:56:54'),
(33, NULL, NULL, 'Christina', 'Podegracz', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4, 4, NULL, '2020-01-14 19:10:18', '2020-01-14 19:10:18'),
(34, NULL, 'https://www.yogasailingholidays.com/', 'Megan', 'Sullivan', '', NULL, NULL, '', 'yogameg@live.com', '', '', '', NULL, NULL, NULL, '', '', 1, 5, 1, NULL, '2020-01-14 19:10:39', '2020-03-11 07:58:25'),
(35, NULL, NULL, 'Helen', 'Lipson', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 1, '2020-03-03 04:48:53', '2020-01-14 19:10:50', '2020-03-03 04:48:53'),
(36, NULL, NULL, 'Rahul', 'Rathore', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 1, '2020-03-03 04:48:48', '2020-01-20 21:41:18', '2020-03-03 04:48:48'),
(37, 2, 'https://www.yogasailingholidays.com/', 'Elke', 'Bancken', '', NULL, NULL, '', 'Ebancken@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 1, 1, NULL, '2020-03-04 05:12:58', '2020-03-11 07:53:47'),
(38, 2, 'https://www.yogasailingholidays.com/', 'Ariana', 'Speirs', '', NULL, NULL, '', 'arianaspeirs@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 1, 1, NULL, '2020-03-04 08:00:23', '2020-03-11 07:56:28'),
(39, 2, NULL, 'Carmen', 'Elena', '', NULL, NULL, '', 'carmen.frey@uzh.ch', '', '', '', NULL, NULL, NULL, '', '', 1, 1, 1, NULL, '2020-03-05 01:20:33', '2020-03-05 01:20:33'),
(40, 2, NULL, 'Arezu', 'Kaywanfar', '', NULL, NULL, '', 'arezukay@yahoo.com', '', '', '', NULL, NULL, NULL, '', '', 1, 1, 1, '2020-03-05 03:38:31', '2020-03-05 03:31:44', '2020-03-05 03:38:31'),
(41, 2, 'https://www.yogasailingholidays.com/', 'Marianne', 'Jezerinac', '', NULL, NULL, '', 'Mjmarjez@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 1, 1, NULL, '2020-03-05 03:43:22', '2020-03-11 07:58:49'),
(42, 7, NULL, 'Helena', 'Fierle', '', NULL, NULL, '', 'helena.fierle@gmail.com', '', '', '', NULL, NULL, NULL, '', '', 1, 4, 4, NULL, '2020-05-06 18:33:02', '2020-05-06 18:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `ambassador_itinerary_codes`
--

CREATE TABLE `ambassador_itinerary_codes` (
                                            `id` bigint(20) UNSIGNED NOT NULL,
                                            `itinerary_id` bigint(20) UNSIGNED NOT NULL,
                                            `ambassador_id` bigint(20) UNSIGNED NOT NULL,
                                            `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `discount_amount` decimal(20,2) NOT NULL,
                                            `is_active` tinyint(4) NOT NULL DEFAULT '1',
                                            `created_by` bigint(20) UNSIGNED NOT NULL,
                                            `updated_by` bigint(20) UNSIGNED NOT NULL,
                                            `deleted_at` timestamp NULL DEFAULT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ambassador_itinerary_codes`
--

INSERT INTO `ambassador_itinerary_codes` (`id`, `itinerary_id`, `ambassador_id`, `code`, `discount_amount`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 15, 9, 'RN040720', '50.00', 1, 1, 4, NULL, '2020-05-06 10:27:27', '2020-05-06 10:32:54'),
(2, 15, 11, 'KS040720', '50.00', 1, 4, 4, NULL, '2020-05-06 10:32:54', '2020-05-06 10:32:54'),
(3, 27, 38, 'AS080820', '50.00', 1, 4, 4, NULL, '2020-05-06 17:29:21', '2020-05-06 17:29:21'),
(4, 34, 31, 'AK290820', '50.00', 1, 4, 4, NULL, '2020-05-06 18:40:05', '2020-05-06 18:40:05'),
(5, 35, 34, 'MS120920', '50.00', 1, 4, 4, NULL, '2020-05-06 19:39:58', '2020-05-06 19:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `ambassador_media`
--

CREATE TABLE `ambassador_media` (
                                  `ambassador_id` bigint(20) UNSIGNED NOT NULL,
                                  `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ambassador_media`
--

INSERT INTO `ambassador_media` (`ambassador_id`, `media_id`) VALUES
(34, 1),
(1, 3),
(30, 4),
(6, 5),
(27, 6),
(26, 8),
(7, 7),
(25, 9),
(8, 10),
(20, 12),
(11, 13),
(9, 11),
(19, 14),
(17, 15),
(16, 16),
(14, 17),
(10, 44);

-- --------------------------------------------------------

--
-- Table structure for table `boats`
--

CREATE TABLE `boats` (
                       `id` bigint(20) UNSIGNED NOT NULL,
                       `boat_type_id` bigint(20) UNSIGNED NOT NULL,
                       `boat_brand_id` bigint(20) UNSIGNED NOT NULL,
                       `boat_model_id` bigint(20) UNSIGNED NOT NULL,
                       `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                       `is_active` tinyint(4) NOT NULL DEFAULT '1',
                       `created_by` bigint(20) UNSIGNED NOT NULL,
                       `updated_by` bigint(20) UNSIGNED NOT NULL,
                       `deleted_at` timestamp NULL DEFAULT NULL,
                       `created_at` timestamp NULL DEFAULT NULL,
                       `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boats`
--

INSERT INTO `boats` (`id`, `boat_type_id`, `boat_brand_id`, `boat_model_id`, `name`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Nabucco', 1, 1, 1, NULL, '2020-01-14 19:20:31', '2020-03-03 05:30:18'),
(2, 1, 1, 1, 'Lastovo', 1, 1, 1, NULL, '2020-01-14 19:20:33', '2020-01-14 19:44:25'),
(3, 2, 2, 2, 'Blue Steel', 1, 1, 1, NULL, '2020-01-20 18:22:38', '2020-01-20 18:22:38'),
(4, 1, 1, 1, 'MOJA TI', 1, 1, 1, NULL, '2020-03-04 07:43:45', '2020-03-04 07:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `boat_brands`
--

CREATE TABLE `boat_brands` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `is_active` tinyint(4) NOT NULL DEFAULT '1',
                             `created_by` bigint(20) UNSIGNED NOT NULL,
                             `updated_by` bigint(20) UNSIGNED NOT NULL,
                             `deleted_at` timestamp NULL DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_brands`
--

INSERT INTO `boat_brands` (`id`, `name`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Oceanis 48', 1, 4, 1, NULL, '2020-01-14 18:59:54', '2020-03-19 03:41:23'),
(2, 'Lagoon 42', 1, 4, 1, NULL, '2020-01-14 19:00:29', '2020-03-19 03:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `boat_cabins`
--

CREATE TABLE `boat_cabins` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `boat_id` bigint(20) UNSIGNED NOT NULL,
                             `cabin_type_id` bigint(20) UNSIGNED NOT NULL,
                             `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `cabin_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `occupancy` int(11) NOT NULL,
                             `is_active` tinyint(4) NOT NULL DEFAULT '1',
                             `created_by` bigint(20) UNSIGNED NOT NULL,
                             `updated_by` bigint(20) UNSIGNED NOT NULL,
                             `deleted_at` timestamp NULL DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_cabins`
--

INSERT INTO `boat_cabins` (`id`, `boat_id`, `cabin_type_id`, `code`, `cabin_description`, `occupancy`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Port', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:31', '2020-03-12 04:21:23'),
(2, 1, 2, 'Starboard', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:31', '2020-03-12 04:21:23'),
(3, 1, 3, 'Port', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:31', '2020-03-17 07:51:44'),
(4, 1, 3, 'Starboard', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:31', '2020-03-17 07:51:44'),
(5, 2, 2, 'Port', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:33', '2020-03-17 07:52:08'),
(6, 2, 2, 'Starboard', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:33', '2020-03-17 07:52:08'),
(7, 2, 3, 'Port', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:33', '2020-03-17 07:52:08'),
(8, 2, 3, 'Starboard', NULL, 2, 1, 1, 1, NULL, '2020-01-14 19:20:33', '2020-03-17 07:52:08'),
(9, 3, 1, 'Port', '', 2, 1, 1, 1, NULL, '2020-01-20 18:22:38', '2020-01-20 18:22:38'),
(10, 3, 2, 'Port', '', 2, 1, 1, 1, NULL, '2020-01-20 18:22:38', '2020-01-20 18:22:38'),
(11, 3, 1, 'Starboard', '', 2, 1, 1, 1, NULL, '2020-01-20 18:22:38', '2020-01-20 18:22:38'),
(12, 3, 2, 'Starboard', '', 2, 1, 1, 1, NULL, '2020-01-20 18:22:38', '2020-01-20 18:22:38'),
(13, 4, 2, 'Port Side', NULL, 2, 1, 1, 1, NULL, '2020-03-04 07:43:45', '2020-03-17 07:52:30'),
(14, 4, 2, 'Starboard', NULL, 2, 1, 1, 1, NULL, '2020-03-04 07:43:45', '2020-03-17 07:52:30'),
(15, 4, 3, 'Port Side', NULL, 2, 1, 1, 1, NULL, '2020-03-04 07:43:45', '2020-03-17 07:52:30'),
(16, 4, 3, 'Starboard', NULL, 2, 1, 1, 1, NULL, '2020-03-04 07:43:45', '2020-03-17 07:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `boat_cabin_media`
--

CREATE TABLE `boat_cabin_media` (
                                  `boat_cabin_id` bigint(20) UNSIGNED NOT NULL,
                                  `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_cabin_media`
--

INSERT INTO `boat_cabin_media` (`boat_cabin_id`, `media_id`) VALUES
(1, 22),
(2, 22),
(3, 18),
(4, 20),
(5, 22),
(6, 22),
(7, 18),
(8, 20);

-- --------------------------------------------------------

--
-- Table structure for table `boat_crews`
--

CREATE TABLE `boat_crews` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `crew_type_id` bigint(20) UNSIGNED NOT NULL,
                            `guest_title_id` bigint(20) UNSIGNED DEFAULT NULL,
                            `first_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `last_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `middle_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `birth_date` date DEFAULT NULL,
                            `nationality_id` bigint(20) UNSIGNED DEFAULT NULL,
                            `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `pob_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `pob_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `current_residency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `identification_card_type_id` bigint(20) UNSIGNED DEFAULT NULL,
                            `other_id_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `id_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `passport_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `expiration_date` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `is_active` tinyint(4) NOT NULL DEFAULT '1',
                            `created_by` bigint(20) UNSIGNED NOT NULL,
                            `updated_by` bigint(20) UNSIGNED NOT NULL,
                            `deleted_at` timestamp NULL DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_crews`
--

INSERT INTO `boat_crews` (`id`, `crew_type_id`, `guest_title_id`, `first_name`, `last_name`, `middle_name`, `birth_date`, `nationality_id`, `phone_number`, `email`, `pob_country`, `pob_city`, `current_residency`, `identification_card_type_id`, `other_id_type`, `id_number`, `passport_number`, `expiration_date`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'Rino', 'Katic', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 5, 5, NULL, '2020-01-20 21:24:16', '2020-01-20 21:24:16'),
(2, 1, NULL, 'Jonathan', 'Colwell', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, '2020-01-20 21:24:20', '2020-01-20 21:24:20'),
(3, 1, NULL, 'Balazs', 'Doczy', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, '2020-01-20 21:25:16', '2020-01-20 21:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `boat_media`
--

CREATE TABLE `boat_media` (
                            `boat_id` bigint(20) UNSIGNED NOT NULL,
                            `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_media`
--

INSERT INTO `boat_media` (`boat_id`, `media_id`) VALUES
(1, 26),
(1, 21),
(1, 20),
(1, 18),
(1, 19),
(1, 25),
(1, 28),
(1, 23),
(1, 24),
(1, 27),
(1, 29),
(1, 22),
(2, 29),
(2, 26),
(2, 27),
(2, 24),
(2, 23),
(2, 22),
(2, 21),
(2, 20),
(2, 18),
(2, 19),
(2, 25),
(2, 28),
(3, 37),
(3, 38),
(3, 36),
(3, 35),
(3, 34),
(3, 33),
(3, 31),
(3, 30);

-- --------------------------------------------------------

--
-- Table structure for table `boat_models`
--

CREATE TABLE `boat_models` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `is_active` tinyint(4) NOT NULL DEFAULT '1',
                             `created_by` bigint(20) UNSIGNED NOT NULL,
                             `updated_by` bigint(20) UNSIGNED NOT NULL,
                             `deleted_at` timestamp NULL DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_models`
--

INSERT INTO `boat_models` (`id`, `name`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Oceanis 48', 1, 4, 4, NULL, '2020-01-14 18:58:09', '2020-01-14 18:58:09'),
(2, 'Lagoon 42', 1, 4, 4, NULL, '2020-01-14 18:58:26', '2020-01-14 18:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `boat_types`
--

CREATE TABLE `boat_types` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `is_active` tinyint(4) NOT NULL DEFAULT '1',
                            `created_by` bigint(20) UNSIGNED NOT NULL,
                            `updated_by` bigint(20) UNSIGNED NOT NULL,
                            `deleted_at` timestamp NULL DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_types`
--

INSERT INTO `boat_types` (`id`, `name`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Monohull', 1, 4, 4, NULL, '2020-01-14 19:01:10', '2020-01-14 19:01:10'),
(2, 'Catamaran', 1, 4, 4, NULL, '2020-01-14 19:01:24', '2020-01-14 19:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
                          `id` bigint(20) UNSIGNED NOT NULL,
                          `reference_code_char` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `reference_code` int(11) NOT NULL,
                          `itinerary_id` bigint(20) UNSIGNED NOT NULL,
                          `user_id` bigint(20) UNSIGNED NOT NULL,
                          `is_early_bird` tinyint(4) NOT NULL DEFAULT '0',
                          `lead_source_id` text COLLATE utf8mb4_unicode_ci,
                          `ambassador_itinerary_code_id` bigint(20) UNSIGNED DEFAULT NULL,
                          `payment_reminder_sent` tinyint(4) NOT NULL DEFAULT '0',
                          `balance_reminder_sent` tinyint(4) NOT NULL DEFAULT '0',
                          `crew_details_reminder_sent` tinyint(4) NOT NULL DEFAULT '0',
                          `is_active` tinyint(4) NOT NULL DEFAULT '1',
                          `admin_booking` tinyint(4) NOT NULL DEFAULT '0',
                          `created_by` bigint(20) UNSIGNED NOT NULL,
                          `updated_by` bigint(20) UNSIGNED NOT NULL,
                          `deleted_at` timestamp NULL DEFAULT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `reference_code_char`, `reference_code`, `itinerary_id`, `user_id`, `is_early_bird`, `lead_source_id`, `ambassador_itinerary_code_id`, `payment_reminder_sent`, `balance_reminder_sent`, `crew_details_reminder_sent`, `is_active`, `admin_booking`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'MUDX', 100001, 15, 6, 1, '2', 2, 0, 1, 1, 1, 0, 6, 6, NULL, '2020-05-06 10:43:29', '2020-05-06 22:00:02'),
(2, 'HDGF', 100002, 15, 7, 1, '2', 2, 0, 1, 1, 1, 0, 7, 7, NULL, '2020-05-06 10:54:51', '2020-05-06 22:00:02'),
(3, 'ZKTL', 100003, 15, 8, 1, '2', 1, 1, 1, 1, 1, 0, 8, 8, NULL, '2020-05-06 11:13:15', '2020-05-10 22:00:02'),
(4, 'QHVG', 100004, 15, 9, 1, '2', 1, 0, 0, 0, 1, 0, 9, 9, NULL, '2020-05-06 11:18:42', '2020-05-06 11:18:42'),
(5, 'SZXG', 100005, 43, 10, 1, '14', NULL, 0, 0, 0, 1, 0, 10, 10, NULL, '2020-05-06 15:08:55', '2020-05-06 15:08:55'),
(6, 'GPIC', 100006, 43, 11, 1, '31', NULL, 0, 1, 1, 1, 0, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 22:00:02'),
(7, 'BVNL', 100007, 44, 12, 1, '14', NULL, 0, 1, 1, 1, 0, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 22:00:02'),
(8, 'KPOD', 100008, 44, 13, 1, '14', NULL, 1, 1, 1, 1, 0, 13, 13, NULL, '2020-05-06 15:50:57', '2020-05-10 22:00:02'),
(9, 'RBXQ', 100009, 44, 14, 1, '14', NULL, 0, 1, 1, 1, 0, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 22:00:02'),
(10, 'CNXQ', 100010, 45, 15, 1, '14', NULL, 0, 1, 1, 1, 0, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 22:00:02'),
(11, 'LZBJ', 100011, 31, 16, 1, '27', NULL, 0, 1, 1, 1, 0, 16, 16, NULL, '2020-05-06 17:25:31', '2020-05-06 22:00:02'),
(12, 'QKUY', 100012, 27, 17, 1, '2', 3, 1, 1, 1, 1, 0, 17, 17, NULL, '2020-05-06 17:31:40', '2020-05-10 22:00:02'),
(13, 'IMVQ', 100013, 27, 18, 1, '2', 3, 1, 1, 1, 1, 0, 18, 18, NULL, '2020-05-06 17:34:08', '2020-05-10 22:00:02'),
(14, 'ORGF', 100014, 27, 19, 1, '2', 3, 1, 1, 1, 1, 0, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-10 22:00:02'),
(15, 'ANJH', 100015, 47, 20, 1, '14', NULL, 0, 1, 1, 1, 0, 20, 20, NULL, '2020-05-06 17:43:02', '2020-05-06 22:00:02'),
(16, 'CQFE', 100016, 47, 21, 1, '14', NULL, 1, 1, 1, 1, 0, 21, 21, NULL, '2020-05-06 17:47:00', '2020-05-10 22:00:02'),
(17, 'ITZG', 100017, 48, 22, 1, '14', NULL, 0, 0, 0, 1, 0, 22, 22, NULL, '2020-05-06 18:03:11', '2020-05-06 18:03:11'),
(18, 'KBTS', 100018, 48, 23, 1, '14', NULL, 0, 1, 1, 1, 0, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 22:00:02'),
(19, 'HQMO', 100019, 49, 24, 1, '13', NULL, 0, 1, 1, 1, 0, 24, 24, '2020-05-11 06:58:46', '2020-05-06 18:25:30', '2020-05-11 06:58:46'),
(20, 'LWAX', 100020, 34, 25, 1, '13', NULL, 1, 1, 1, 1, 0, 25, 25, NULL, '2020-05-06 18:43:55', '2020-05-10 22:00:02'),
(21, 'DULG', 100021, 50, 26, 1, '13', NULL, 0, 0, 0, 1, 0, 26, 26, NULL, '2020-05-06 18:50:02', '2020-05-06 18:50:02'),
(22, 'DMWY', 100022, 13, 27, 1, '27', NULL, 0, 0, 0, 1, 0, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(23, 'WVOJ', 100023, 13, 28, 1, '21', NULL, 0, 1, 1, 1, 0, 28, 28, '2020-05-07 15:24:42', '2020-05-06 19:11:14', '2020-05-07 15:24:42'),
(24, 'TVWB', 100024, 13, 29, 1, '2', NULL, 0, 0, 0, 1, 0, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(25, 'IJYH', 100025, 13, 30, 1, '21', NULL, 1, 1, 1, 1, 0, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-10 22:00:02'),
(26, 'ZDVI', 100026, 35, 31, 1, '13', NULL, 0, 1, 1, 1, 0, 31, 31, '2020-05-11 04:04:43', '2020-05-06 19:47:03', '2020-05-11 04:04:43'),
(27, 'LJYG', 100027, 37, 32, 1, '32', NULL, 0, 1, 1, 1, 0, 32, 32, NULL, '2020-05-06 19:56:06', '2020-05-06 22:00:02'),
(28, 'XYAB', 100028, 37, 33, 1, '32', NULL, 0, 1, 1, 1, 0, 33, 33, NULL, '2020-05-06 20:03:38', '2020-05-06 22:00:02'),
(29, 'SBXF', 100029, 37, 34, 1, '13', NULL, 0, 1, 1, 1, 0, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 22:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `booking_add_ons`
--

CREATE TABLE `booking_add_ons` (
                                 `id` bigint(20) UNSIGNED NOT NULL,
                                 `booking_id` bigint(20) UNSIGNED NOT NULL,
                                 `add_on_id` bigint(20) UNSIGNED NOT NULL,
                                 `price` decimal(20,2) NOT NULL,
                                 `qty` int(11) NOT NULL,
                                 `total` decimal(20,2) NOT NULL,
                                 `is_active` tinyint(4) NOT NULL DEFAULT '1',
                                 `created_by` bigint(20) UNSIGNED NOT NULL,
                                 `updated_by` bigint(20) UNSIGNED NOT NULL,
                                 `deleted_at` timestamp NULL DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_cabins`
--

CREATE TABLE `booking_cabins` (
                                `id` bigint(20) UNSIGNED NOT NULL,
                                `booking_id` bigint(20) UNSIGNED NOT NULL,
                                `guest_id` bigint(20) UNSIGNED NOT NULL,
                                `itinerary_cabin_id` bigint(20) UNSIGNED NOT NULL,
                                `original_itinerary_cabin_id` bigint(20) UNSIGNED NOT NULL,
                                `occupancy` int(11) NOT NULL,
                                `is_cabin_occupied` tinyint(4) NOT NULL,
                                `price_per_person` decimal(20,2) NOT NULL,
                                `cabin_price` decimal(20,2) NOT NULL,
                                `early_bird_price` decimal(20,2) NOT NULL,
                                `cabin_early_bird_price` decimal(20,2) NOT NULL,
                                `total_amount_due` decimal(20,2) NOT NULL,
                                `is_active` tinyint(4) NOT NULL DEFAULT '1',
                                `created_by` bigint(20) UNSIGNED NOT NULL,
                                `updated_by` bigint(20) UNSIGNED NOT NULL,
                                `deleted_at` timestamp NULL DEFAULT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_cabins`
--

INSERT INTO `booking_cabins` (`id`, `booking_id`, `guest_id`, `itinerary_cabin_id`, `original_itinerary_cabin_id`, `occupancy`, `is_cabin_occupied`, `price_per_person`, `cabin_price`, `early_bird_price`, `cabin_early_bird_price`, `total_amount_due`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 61, 61, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 6, 6, NULL, '2020-05-06 10:43:29', '2020-05-06 10:43:29'),
(2, 2, 2, 62, 62, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 7, 7, NULL, '2020-05-06 10:54:51', '2020-05-06 10:54:51'),
(3, 3, 3, 62, 62, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 8, 8, NULL, '2020-05-06 11:13:15', '2020-05-06 11:13:15'),
(4, 4, 4, 63, 63, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 9, 9, NULL, '2020-05-06 11:18:42', '2020-05-06 11:18:42'),
(5, 5, 5, 175, 175, 2, 0, '1295.00', '2490.00', '1245.00', '2240.00', '2240.00', 1, 10, 10, NULL, '2020-05-06 15:08:55', '2020-05-06 15:08:55'),
(6, 6, 6, 173, 173, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1295.00', 1, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(7, 6, 7, 173, 173, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(8, 7, 8, 177, 177, 1, 0, '1345.00', '2690.00', '1295.00', '2590.00', '1295.00', 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(9, 7, 9, 177, 177, 1, 0, '1345.00', '2690.00', '1295.00', '2590.00', '1295.00', 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(10, 8, 10, 179, 179, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 13, 13, NULL, '2020-05-06 15:50:57', '2020-05-06 15:50:57'),
(11, 9, 11, 179, 179, 1, 0, '1390.00', '2680.00', '1340.00', '2580.00', '1240.00', 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(12, 9, 12, 180, 180, 1, 0, '1390.00', '2680.00', '1340.00', '2580.00', '1340.00', 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(13, 9, 13, 180, 180, 1, 0, '1390.00', '2680.00', '1340.00', '2580.00', '1340.00', 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(14, 10, 14, 181, 181, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(15, 10, 15, 181, 181, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(16, 10, 16, 183, 183, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(17, 10, 17, 183, 183, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(18, 10, 18, 184, 184, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(19, 10, 19, 184, 184, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(20, 11, 20, 113, 113, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1490.00', 1, 16, 16, NULL, '2020-05-06 17:25:31', '2020-05-06 17:25:31'),
(21, 12, 21, 89, 89, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 17, 17, NULL, '2020-05-06 17:31:40', '2020-05-06 17:31:40'),
(22, 13, 22, 90, 90, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 18, 18, NULL, '2020-05-06 17:34:09', '2020-05-06 17:34:09'),
(23, 13, 23, 90, 90, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 18, 18, NULL, '2020-05-06 17:34:09', '2020-05-06 17:34:09'),
(24, 14, 24, 91, 91, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(25, 14, 25, 91, 91, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(26, 14, 26, 92, 92, 1, 0, '1490.00', '2905.00', '0.00', '0.00', '1440.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(27, 15, 27, 191, 191, 2, 0, '1345.00', '2590.00', '0.00', '0.00', '2590.00', 1, 20, 20, NULL, '2020-05-06 17:43:02', '2020-05-06 17:43:02'),
(28, 16, 28, 189, 189, 1, 0, '1345.00', '2590.00', '0.00', '0.00', '1345.00', 1, 21, 21, NULL, '2020-05-06 17:47:00', '2020-05-06 17:47:00'),
(29, 17, 29, 194, 194, 1, 0, '1345.00', '2690.00', '1145.00', '2290.00', '1145.00', 1, 22, 22, NULL, '2020-05-06 18:03:11', '2020-05-06 18:03:11'),
(30, 18, 30, 195, 195, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(31, 18, 31, 195, 195, 1, 0, '1345.00', '2690.00', '0.00', '0.00', '1345.00', 1, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(32, 19, 32, 197, 197, 1, 0, '1345.00', '2590.00', '0.00', '0.00', '1345.00', 1, 24, 24, '2020-05-11 06:58:46', '2020-05-06 18:25:30', '2020-05-11 06:58:46'),
(33, 19, 33, 197, 197, 1, 0, '1345.00', '2590.00', '0.00', '0.00', '1345.00', 1, 24, 24, '2020-05-11 06:58:46', '2020-05-06 18:25:30', '2020-05-11 06:58:46'),
(34, 20, 34, 129, 129, 1, 0, '1490.00', '2880.00', '0.00', '0.00', '1490.00', 1, 25, 25, NULL, '2020-05-06 18:43:55', '2020-05-06 18:43:55'),
(35, 21, 35, 201, 201, 2, 0, '1345.00', '2590.00', '0.00', '0.00', '2590.00', 1, 26, 26, NULL, '2020-05-06 18:50:02', '2020-05-06 18:50:02'),
(36, 22, 36, 55, 55, 1, 0, '1120.00', '2140.00', '0.00', '0.00', '1120.00', 1, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(37, 22, 37, 55, 55, 1, 0, '1120.00', '2140.00', '0.00', '0.00', '1120.00', 1, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(38, 23, 38, 56, 56, 1, 0, '995.00', '1890.00', '0.00', '0.00', '995.00', 1, 28, 28, '2020-05-07 15:24:42', '2020-05-06 19:11:14', '2020-05-07 15:24:42'),
(39, 23, 39, 56, 56, 1, 0, '995.00', '1890.00', '0.00', '0.00', '995.00', 1, 28, 28, '2020-05-07 15:24:42', '2020-05-06 19:11:14', '2020-05-07 15:24:42'),
(40, 24, 40, 53, 53, 1, 0, '995.00', '1890.00', '0.00', '0.00', '995.00', 1, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(41, 24, 41, 53, 53, 1, 0, '995.00', '1890.00', '0.00', '0.00', '995.00', 1, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(42, 25, 42, 54, 54, 1, 0, '1120.00', '2230.00', '0.00', '0.00', '1120.00', 1, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(43, 25, 43, 54, 54, 1, 0, '1120.00', '2230.00', '0.00', '0.00', '1120.00', 1, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(44, 26, 44, 134, 134, 1, 0, '995.00', '1890.00', '0.00', '0.00', '995.00', 1, 31, 31, '2020-05-11 04:04:43', '2020-05-06 19:47:03', '2020-05-11 04:04:43'),
(45, 26, 45, 134, 134, 1, 0, '995.00', '1890.00', '0.00', '0.00', '995.00', 1, 31, 31, '2020-05-11 04:04:43', '2020-05-06 19:47:03', '2020-05-11 04:04:43'),
(46, 27, 46, 145, 145, 1, 0, '1490.00', '2880.00', '0.00', '0.00', '1490.00', 1, 32, 32, NULL, '2020-05-06 19:56:06', '2020-05-06 19:56:06'),
(47, 28, 47, 145, 145, 1, 0, '1440.00', '2780.00', '0.00', '0.00', '1440.00', 1, 33, 33, NULL, '2020-05-06 20:03:38', '2020-05-06 20:03:38'),
(48, 29, 48, 146, 146, 1, 0, '1440.00', '2780.00', '0.00', '0.00', '1440.00', 1, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23'),
(49, 29, 49, 146, 146, 1, 0, '1440.00', '2780.00', '0.00', '0.00', '1440.00', 1, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `booking_cabin_discounts`
--

CREATE TABLE `booking_cabin_discounts` (
                                         `id` bigint(20) UNSIGNED NOT NULL,
                                         `booking_cabin_id` bigint(20) UNSIGNED NOT NULL,
                                         `discount_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `qty` decimal(20,2) NOT NULL,
                                         `amount` decimal(20,2) NOT NULL,
                                         `total` decimal(20,2) NOT NULL,
                                         `is_active` tinyint(4) NOT NULL DEFAULT '1',
                                         `created_by` bigint(20) UNSIGNED NOT NULL,
                                         `updated_by` bigint(20) UNSIGNED NOT NULL,
                                         `deleted_at` timestamp NULL DEFAULT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_cabin_discounts`
--

INSERT INTO `booking_cabin_discounts` (`id`, `booking_cabin_id`, `discount_description`, `qty`, `amount`, `total`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ambassador Promo Code - KS040720', '1.00', '50.00', '50.00', 1, 6, 6, NULL, '2020-05-06 10:43:29', '2020-05-06 10:43:29'),
(2, 2, 'Ambassador Promo Code - KS040720', '1.00', '50.00', '50.00', 1, 7, 7, NULL, '2020-05-06 10:54:51', '2020-05-06 10:54:51'),
(3, 3, 'Ambassador Promo Code - RN040720', '1.00', '50.00', '50.00', 1, 8, 8, NULL, '2020-05-06 11:13:15', '2020-05-06 11:13:15'),
(4, 4, 'Ambassador Promo Code - RN040720', '1.00', '50.00', '50.00', 1, 9, 9, NULL, '2020-05-06 11:18:42', '2020-05-06 11:18:42'),
(5, 5, 'Early Bird Promo', '1.00', '250.00', '250.00', 1, 10, 10, NULL, '2020-05-06 15:08:55', '2020-05-06 15:08:55'),
(6, 6, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(7, 7, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(8, 8, 'Early Bird Promo', '1.00', '100.00', '100.00', 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(9, 8, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(10, 9, 'Early Bird Promo', '1.00', '100.00', '100.00', 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(11, 9, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(12, 11, 'Early Bird Promo', '1.00', '50.00', '50.00', 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(13, 11, 'Bring a Friend Promo (2 friend/s)', '2.00', '50.00', '100.00', 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(14, 12, 'Early Bird Promo', '1.00', '100.00', '100.00', 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(15, 13, 'Early Bird Promo', '1.00', '100.00', '100.00', 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(16, 14, 'Bring a Friend Promo (5 friend/s)', '5.00', '50.00', '250.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(17, 15, 'Bring a Friend Promo (5 friend/s)', '5.00', '50.00', '250.00', 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(18, 21, 'Ambassador Promo Code - AS080820', '1.00', '50.00', '50.00', 1, 17, 17, NULL, '2020-05-06 17:31:40', '2020-05-06 17:31:40'),
(19, 22, 'Ambassador Promo Code - AS080820', '1.00', '50.00', '50.00', 1, 18, 18, NULL, '2020-05-06 17:34:09', '2020-05-06 17:34:09'),
(20, 22, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 18, 18, NULL, '2020-05-06 17:34:09', '2020-05-06 17:34:09'),
(21, 23, 'Ambassador Promo Code - AS080820', '1.00', '50.00', '50.00', 1, 18, 18, NULL, '2020-05-06 17:34:09', '2020-05-06 17:34:09'),
(22, 23, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 18, 18, NULL, '2020-05-06 17:34:09', '2020-05-06 17:34:09'),
(23, 24, 'Ambassador Promo Code - AS080820', '1.00', '50.00', '50.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(24, 24, 'Bring a Friend Promo (2 friend/s)', '2.00', '50.00', '100.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(25, 25, 'Ambassador Promo Code - AS080820', '1.00', '50.00', '50.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(26, 25, 'Bring a Friend Promo (2 friend/s)', '2.00', '50.00', '100.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(27, 26, 'Ambassador Promo Code - AS080820', '1.00', '50.00', '50.00', 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(28, 29, 'Early Bird Promo', '1.00', '200.00', '200.00', 1, 22, 22, NULL, '2020-05-06 18:03:11', '2020-05-06 18:03:11'),
(29, 30, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(30, 31, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(31, 32, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 24, 24, NULL, '2020-05-06 18:25:30', '2020-05-06 18:25:30'),
(32, 33, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 24, 24, NULL, '2020-05-06 18:25:30', '2020-05-06 18:25:30'),
(33, 36, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(34, 37, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(35, 38, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 28, 28, NULL, '2020-05-06 19:11:14', '2020-05-06 19:11:14'),
(36, 39, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 28, 28, NULL, '2020-05-06 19:11:15', '2020-05-06 19:11:15'),
(37, 40, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(38, 41, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(39, 42, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(40, 43, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(41, 44, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 31, 31, NULL, '2020-05-06 19:47:03', '2020-05-06 19:47:03'),
(42, 45, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 31, 31, NULL, '2020-05-06 19:47:03', '2020-05-06 19:47:03'),
(43, 48, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23'),
(44, 49, 'Bring a Friend Promo (1 friend/s)', '1.00', '50.00', '50.00', 1, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `booking_invoices`
--

CREATE TABLE `booking_invoices` (
                                  `id` bigint(20) UNSIGNED NOT NULL,
                                  `booking_id` bigint(20) UNSIGNED NOT NULL,
                                  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `sub_total` decimal(20,2) NOT NULL,
                                  `discount` decimal(20,2) NOT NULL,
                                  `grand_total` decimal(20,2) NOT NULL,
                                  `deposit_amount_due` decimal(20,2) NOT NULL,
                                  `payment_terms` bigint(20) UNSIGNED NOT NULL COMMENT '1=FULL PAYMENT, 2=DEPOSIT',
                                  `is_active` tinyint(4) NOT NULL DEFAULT '1',
                                  `created_by` bigint(20) UNSIGNED NOT NULL,
                                  `updated_by` bigint(20) UNSIGNED NOT NULL,
                                  `deleted_at` timestamp NULL DEFAULT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_invoices`
--

INSERT INTO `booking_invoices` (`id`, `booking_id`, `invoice_number`, `sub_total`, `discount`, `grand_total`, `deposit_amount_due`, `payment_terms`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '100001', '1440.00', '0.00', '1440.00', '400.00', 2, 1, 6, 6, NULL, '2020-05-06 10:43:29', '2020-05-06 10:43:29'),
(2, 2, '100002', '1440.00', '0.00', '1440.00', '400.00', 2, 1, 7, 7, NULL, '2020-05-06 10:54:51', '2020-05-06 10:54:51'),
(3, 3, '100003', '1440.00', '0.00', '1440.00', '0.00', 1, 1, 8, 8, NULL, '2020-05-06 11:13:15', '2020-05-06 11:13:15'),
(4, 4, '100004', '1440.00', '0.00', '1440.00', '0.00', 1, 1, 9, 9, NULL, '2020-05-06 11:18:42', '2020-05-06 11:18:42'),
(5, 5, '100005', '2240.00', '0.00', '2240.00', '0.00', 1, 1, 10, 10, NULL, '2020-05-06 15:08:55', '2020-05-06 15:08:55'),
(6, 6, '100006', '2640.00', '0.00', '2640.00', '800.00', 2, 1, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(7, 7, '100007', '2590.00', '0.00', '2590.00', '800.00', 2, 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(8, 8, '100008', '1345.00', '0.00', '1345.00', '500.00', 2, 1, 13, 13, NULL, '2020-05-06 15:50:57', '2020-05-06 15:50:57'),
(9, 9, '100009', '3920.00', '0.00', '3920.00', '1500.00', 2, 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(10, 10, '100010', '8070.00', '0.00', '8070.00', '3000.00', 2, 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(11, 11, '100011', '1490.00', '0.00', '1490.00', '400.00', 2, 1, 16, 16, NULL, '2020-05-06 17:25:31', '2020-05-06 17:25:31'),
(12, 12, '100012', '1440.00', '0.00', '1440.00', '500.00', 2, 1, 17, 17, NULL, '2020-05-06 17:31:40', '2020-05-06 17:31:40'),
(13, 13, '100013', '2880.00', '0.00', '2880.00', '1000.00', 2, 1, 18, 18, NULL, '2020-05-06 17:34:08', '2020-05-06 17:34:08'),
(14, 14, '100014', '4320.00', '0.00', '4320.00', '1500.00', 2, 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(15, 15, '100015', '2590.00', '0.00', '2590.00', '500.00', 2, 1, 20, 20, NULL, '2020-05-06 17:43:02', '2020-05-06 17:43:02'),
(16, 16, '100016', '1345.00', '0.00', '1345.00', '500.00', 2, 1, 21, 21, NULL, '2020-05-06 17:47:00', '2020-05-06 17:47:00'),
(17, 17, '100017', '1145.00', '0.00', '1145.00', '0.00', 1, 1, 22, 22, NULL, '2020-05-06 18:03:11', '2020-05-06 18:03:11'),
(18, 18, '100018', '2690.00', '0.00', '2690.00', '1000.00', 2, 1, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(19, 19, '100019', '2690.00', '0.00', '2690.00', '800.00', 2, 1, 24, 24, '2020-05-11 06:58:46', '2020-05-06 18:25:30', '2020-05-11 06:58:46'),
(20, 20, '100020', '1490.00', '0.00', '1490.00', '0.00', 1, 1, 25, 25, NULL, '2020-05-06 18:43:55', '2020-05-06 18:43:55'),
(21, 21, '100021', '2590.00', '0.00', '2590.00', '0.00', 1, 1, 26, 26, NULL, '2020-05-06 18:50:02', '2020-05-06 18:50:02'),
(22, 22, '100022', '2240.00', '0.00', '2240.00', '0.00', 1, 1, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(23, 23, '100023', '1990.00', '0.00', '1990.00', '800.00', 2, 1, 28, 28, '2020-05-07 15:24:42', '2020-05-06 19:11:14', '2020-05-07 15:24:42'),
(24, 24, '100024', '1990.00', '0.00', '1990.00', '0.00', 1, 1, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(25, 25, '100025', '2240.00', '0.00', '2240.00', '0.00', 1, 1, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(26, 26, '100026', '1990.00', '0.00', '1990.00', '1000.00', 2, 1, 31, 31, '2020-05-11 04:04:43', '2020-05-06 19:47:03', '2020-05-11 04:04:43'),
(27, 27, '100027', '1490.00', '0.00', '1490.00', '400.00', 2, 1, 32, 32, NULL, '2020-05-06 19:56:06', '2020-05-06 19:56:06'),
(28, 28, '100028', '1440.00', '0.00', '1440.00', '400.00', 2, 1, 33, 33, NULL, '2020-05-06 20:03:38', '2020-05-06 20:03:38'),
(29, 29, '100029', '2880.00', '0.00', '2880.00', '800.00', 2, 1, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `booking_invoice_payments`
--

CREATE TABLE `booking_invoice_payments` (
                                          `id` bigint(20) UNSIGNED NOT NULL,
                                          `invoice_payment_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `booking_invoice_id` bigint(20) UNSIGNED NOT NULL,
                                          `payment_type_id` bigint(20) UNSIGNED NOT NULL,
                                          `paypal_response` longtext COLLATE utf8mb4_unicode_ci,
                                          `amount_paid` decimal(20,2) NOT NULL,
                                          `is_active` tinyint(4) NOT NULL DEFAULT '1',
                                          `created_by` bigint(20) UNSIGNED NOT NULL,
                                          `updated_by` bigint(20) UNSIGNED NOT NULL,
                                          `deleted_at` timestamp NULL DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_invoice_payments`
--

INSERT INTO `booking_invoice_payments` (`id`, `invoice_payment_number`, `booking_invoice_id`, `payment_type_id`, `paypal_response`, `amount_paid`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '100001', 1, 3, NULL, '250.00', 1, 4, 4, NULL, '2020-05-06 10:45:45', '2020-05-06 10:45:45'),
(2, '100002', 2, 3, NULL, '250.00', 1, 4, 4, NULL, '2020-05-06 10:55:43', '2020-05-06 10:55:43'),
(3, '100003', 4, 3, NULL, '1440.00', 1, 4, 4, NULL, '2020-05-06 11:19:37', '2020-05-06 11:19:37'),
(4, '100004', 5, 1, NULL, '2240.00', 1, 4, 4, NULL, '2020-05-06 15:10:58', '2020-05-06 15:10:58'),
(5, '100005', 6, 3, NULL, '1000.00', 1, 4, 4, NULL, '2020-05-06 15:24:43', '2020-05-06 15:24:43'),
(6, '100006', 7, 3, NULL, '1000.00', 1, 4, 4, NULL, '2020-05-06 15:41:53', '2020-05-06 15:41:53'),
(7, '100007', 9, 4, NULL, '1200.00', 1, 4, 4, NULL, '2020-05-06 17:01:05', '2020-05-06 17:01:05'),
(8, '100008', 10, 3, NULL, '2400.00', 1, 4, 4, NULL, '2020-05-06 17:12:32', '2020-05-06 17:12:32'),
(9, '100009', 11, 4, NULL, '372.50', 1, 4, 4, NULL, '2020-05-06 17:26:36', '2020-05-06 17:26:36'),
(10, '100010', 15, 3, NULL, '800.00', 1, 4, 4, NULL, '2020-05-06 17:44:12', '2020-05-06 17:44:12'),
(11, '100011', 17, 2, NULL, '1145.00', 1, 4, 4, NULL, '2020-05-06 18:04:32', '2020-05-06 18:04:32'),
(12, '100012', 18, 2, NULL, '1000.00', 1, 4, 4, NULL, '2020-05-06 18:17:18', '2020-05-06 18:17:18'),
(13, '100013', 19, 3, NULL, '800.00', 1, 4, 4, NULL, '2020-05-06 18:27:12', '2020-05-06 18:27:12'),
(14, '100014', 21, 3, NULL, '2590.00', 1, 4, 4, NULL, '2020-05-06 18:51:07', '2020-05-06 18:51:07'),
(15, '100015', 22, 3, NULL, '2240.00', 1, 4, 4, NULL, '2020-05-06 19:03:18', '2020-05-06 19:03:18'),
(16, '100016', 23, 3, NULL, '800.00', 1, 4, 4, NULL, '2020-05-06 19:12:10', '2020-05-06 19:12:10'),
(17, '100017', 24, 3, NULL, '1990.00', 1, 4, 4, NULL, '2020-05-06 19:18:26', '2020-05-06 19:18:26'),
(18, '100018', 26, 3, NULL, '800.00', 1, 4, 4, NULL, '2020-05-06 19:48:54', '2020-05-06 19:48:54'),
(19, '100019', 27, 2, NULL, '400.00', 1, 4, 4, NULL, '2020-05-06 19:57:28', '2020-05-06 19:57:28'),
(20, '100020', 28, 2, NULL, '400.00', 1, 4, 4, NULL, '2020-05-06 20:22:10', '2020-05-06 20:22:10'),
(21, '100021', 29, 2, NULL, '800.00', 1, 4, 4, NULL, '2020-05-06 20:22:54', '2020-05-06 20:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `booking_referrals`
--

CREATE TABLE `booking_referrals` (
                                   `id` bigint(20) UNSIGNED NOT NULL,
                                   `referrer_id` bigint(20) UNSIGNED NOT NULL,
                                   `referred_id` bigint(20) UNSIGNED NOT NULL,
                                   `discount` decimal(20,2) NOT NULL,
                                   `is_applied` tinyint(4) NOT NULL DEFAULT '0',
                                   `is_active` tinyint(4) NOT NULL DEFAULT '1',
                                   `created_by` bigint(20) UNSIGNED NOT NULL,
                                   `updated_by` bigint(20) UNSIGNED NOT NULL,
                                   `deleted_at` timestamp NULL DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cabin_types`
--

CREATE TABLE `cabin_types` (
                             `id` bigint(20) UNSIGNED NOT NULL,
                             `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                             `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `is_active` tinyint(4) NOT NULL DEFAULT '1',
                             `created_by` bigint(20) UNSIGNED NOT NULL,
                             `updated_by` bigint(20) UNSIGNED NOT NULL,
                             `deleted_at` timestamp NULL DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cabin_types`
--

INSERT INTO `cabin_types` (`id`, `name`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Master', 'The master cabin is at the back of the boat and is a lot more spacious than the forward cabin.  It has a double mattress bed and shared bathroom with shower.', 1, 4, 1, NULL, '2020-01-14 19:12:26', '2020-03-17 07:45:45'),
(2, 'Forward', 'The forward cabin is at the front of the boat and is slightly smaller than the aft cabin.  It does have a double mattress bed and a private bathroom with shower.', 1, 4, 1, NULL, '2020-01-14 19:12:39', '2020-03-17 07:46:00'),
(3, 'Aft', 'The aft cabin is at the back of the boat and is a lot more spacious than the forward cabin.  It has a double mattress bed and shared bathroom with shower.', 1, 1, 1, NULL, '2020-03-17 07:46:32', '2020-03-17 07:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `city_ports`
--

CREATE TABLE `city_ports` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `itinerary_city_id` bigint(20) UNSIGNED NOT NULL,
                            `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `is_active` tinyint(4) NOT NULL DEFAULT '1',
                            `created_by` bigint(20) UNSIGNED NOT NULL,
                            `updated_by` bigint(20) UNSIGNED NOT NULL,
                            `deleted_at` timestamp NULL DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city_ports`
--

INSERT INTO `city_ports` (`id`, `itinerary_city_id`, `name`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Marina Kastela', 1, 1, 1, NULL, '2020-01-20 18:37:34', '2020-01-20 18:37:34'),
(2, 2, 'Lefkas Marina', 1, 5, 5, NULL, '2020-01-20 18:37:40', '2020-01-20 18:37:40'),
(3, 3, 'ACI Dubrovnik', 1, 1, 1, NULL, '2020-01-20 18:39:10', '2020-01-20 18:39:10'),
(4, 4, 'Hodges Creek / Maya Cove', 1, 1, 1, NULL, '2020-01-20 18:45:16', '2020-01-20 18:45:16'),
(5, 5, 'Alimos Marina', 1, 5, 5, NULL, '2020-01-20 18:49:28', '2020-01-20 18:49:28'),
(6, 6, 'Tourlos', 1, 1, 1, NULL, '2020-01-20 19:52:30', '2020-01-20 19:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `crew_types`
--

CREATE TABLE `crew_types` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `is_active` tinyint(4) NOT NULL DEFAULT '1',
                            `created_by` bigint(20) UNSIGNED NOT NULL,
                            `updated_by` bigint(20) UNSIGNED NOT NULL,
                            `deleted_at` timestamp NULL DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crew_types`
--

INSERT INTO `crew_types` (`id`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Skipper', 1, 5, 5, NULL, '2020-01-20 21:23:02', '2020-01-20 21:23:02'),
(2, 'Hostess', 1, 1, 1, NULL, '2020-01-20 21:23:02', '2020-01-20 21:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `diet_options`
--

CREATE TABLE `diet_options` (
                              `id` bigint(20) UNSIGNED NOT NULL,
                              `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `is_active` tinyint(4) NOT NULL DEFAULT '1',
                              `created_by` bigint(20) UNSIGNED NOT NULL,
                              `updated_by` bigint(20) UNSIGNED NOT NULL,
                              `deleted_at` timestamp NULL DEFAULT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diet_options`
--

INSERT INTO `diet_options` (`id`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Meat Protein', 1, 1, 1, NULL, '2020-03-17 07:58:28', '2020-03-17 07:58:28'),
(2, 'Vegan', 1, 1, 1, NULL, '2020-03-17 07:58:38', '2020-03-17 07:58:38'),
(3, 'Vegetarian', 1, 1, 1, NULL, '2020-03-17 07:58:52', '2020-03-17 07:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `exclusions`
--

CREATE TABLE `exclusions` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `details` text COLLATE utf8mb4_unicode_ci,
                            `is_default_checked` tinyint(4) NOT NULL,
                            `is_active` tinyint(4) NOT NULL DEFAULT '1',
                            `created_by` bigint(20) UNSIGNED NOT NULL,
                            `updated_by` bigint(20) UNSIGNED NOT NULL,
                            `deleted_at` timestamp NULL DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exclusions`
--

INSERT INTO `exclusions` (`id`, `description`, `details`, `is_default_checked`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Restaurant Dinner', NULL, 1, 1, 1, 1, NULL, '2020-01-20 20:54:40', '2020-01-20 20:54:40'),
(2, 'Excursions', NULL, 1, 1, 1, 1, NULL, '2020-01-20 20:55:32', '2020-01-20 20:55:32'),
(3, 'Water Taxi', NULL, 1, 1, 1, 1, NULL, '2020-01-20 21:00:34', '2020-01-20 21:00:34'),
(4, 'Alcohol / Mixes', 'Bring your own alcohol and mixes.', 1, 1, 1, 1, NULL, '2020-01-20 21:01:12', '2020-01-20 21:01:12'),
(5, 'Crew Gratuities', 'Gratuities are excluded from the total booking price. The standard skippers\' gratuity is at least 5% and if you are satisfied with the service we have provided, you can show us your appreciation by means of gratuity proportionate to your level of satisfaction.', 1, 1, 1, 4, NULL, '2020-01-20 21:13:14', '2020-01-20 22:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Male', 1, 1, 1, NULL, '2020-03-24 11:46:52', '2020-03-24 11:46:53'),
(2, 'Female', 1, 1, 1, NULL, '2020-03-24 11:47:19', '2020-03-24 11:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_sdk_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_analytics` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guest_title_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `nationality_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_code_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pob_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pob_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_residency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification_card_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `other_id_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_issues` text COLLATE utf8mb4_unicode_ci,
  `allergies` text COLLATE utf8mb4_unicode_ci,
  `diet_option_id` text COLLATE utf8mb4_unicode_ci,
  `other_concerns` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`id`, `guest_title_id`, `gender_id`, `first_name`, `last_name`, `middle_name`, `birth_date`, `nationality_id`, `country_code_id`, `phone_number`, `email`, `pob_country`, `pob_city`, `current_residency`, `identification_card_type_id`, `other_id_type`, `id_number`, `passport_number`, `expiration_date`, `medical_issues`, `allergies`, `diet_option_id`, `other_concerns`, `user_id`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, NULL, 'Sarah', 'Rhuggenaath', '', NULL, NULL, 150, '683944463', 'Srhuggenaath92@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 6, 6, NULL, '2020-05-06 10:43:29', '2020-05-06 10:43:29'),
(2, 7, NULL, 'Sabine', 'Greijmans', '', NULL, NULL, 150, '654362553', 'Sabine-greijmans@live.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 7, 7, NULL, '2020-05-06 10:54:51', '2020-05-06 10:54:51'),
(3, 7, NULL, 'Marianne', 'Danielsen', '', NULL, NULL, 150, '683944463', 'marsjen@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 8, 8, NULL, '2020-05-06 11:13:15', '2020-05-06 11:13:15'),
(4, 1, NULL, 'Martin', 'Langenhuizen', '', NULL, NULL, 80, '1723805260', 'martinlangenhuizen@posteo.de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, 9, 9, NULL, '2020-05-06 11:18:42', '2020-05-06 11:18:42'),
(5, 1, NULL, 'Jim', 'Rowland', '', NULL, NULL, 226, '7026771720', 'jamiefso2@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, 10, 10, NULL, '2020-05-06 15:08:55', '2020-05-06 15:08:55'),
(6, 1, NULL, 'Shane', 'Isackson', '', NULL, NULL, 13, '852 5930 2849', 'shaneisackson@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(7, 1, NULL, 'Christopher', 'McInnes', '', NULL, NULL, 13, '852 5514 2466', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 11, 11, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(8, 1, NULL, 'Anthony', 'DiVito', '', NULL, NULL, 226, '0008889999', 'anthony.div@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(9, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12, 12, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(10, 1, NULL, 'Frank', 'Steveson', '', NULL, NULL, 226, '0008889999', 'Fsteveson@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, 13, 13, NULL, '2020-05-06 15:50:57', '2020-05-06 15:50:57'),
(11, 1, NULL, 'Bryan', 'Oklin', '', NULL, NULL, 226, '4123038128', 'bmo124@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(12, 1, NULL, 'Gregory', 'Taylor', '', NULL, NULL, 226, '4434544470', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(13, 1, NULL, 'Garrett', 'Koller', '', NULL, NULL, 226, '9184396362', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, 14, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(14, 1, NULL, 'Julio', 'Carbonell', '', NULL, NULL, 226, '9544780258', 'julio.carbonell.s@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(15, 1, NULL, 'Mikal', 'Cartier', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(16, 1, NULL, 'Kurt', 'Fishmab', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(17, 1, NULL, 'Elliot', 'Fishburn', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(18, 1, NULL, 'Michael', 'Kreitzer', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(19, 1, NULL, 'Chris', 'Wheeler', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 15, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(20, 7, NULL, 'Fernanda', 'Dore', '', NULL, NULL, 226, '0008889999', 'fernanda.dore@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 1, 16, 16, NULL, '2020-05-06 17:25:31', '2020-05-06 17:25:31'),
(21, 7, NULL, 'Linda', 'Alfred', '', NULL, NULL, 226, '0008889999', 'lindaallred43@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 1, 17, 17, NULL, '2020-05-06 17:31:40', '2020-05-06 17:31:40'),
(22, 7, NULL, 'Melanie', 'Slavens', '', NULL, NULL, 226, '0008889999', 'melanieslavens@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 1, 18, 18, NULL, '2020-05-06 17:34:08', '2020-05-06 17:34:08'),
(23, 7, NULL, 'Gracie', 'Slavens', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 18, 18, NULL, '2020-05-06 17:34:09', '2020-05-06 17:34:09'),
(24, 7, NULL, 'Jessie', 'Steel', '', NULL, NULL, 226, '0008889999', 'jessie.jdsteel@comcast.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(25, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(26, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 19, 19, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(27, 1, NULL, 'Jamie', 'Mcfadden', '', NULL, NULL, 226, '4078653699', 'chefjamie@me.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1, 20, 20, NULL, '2020-05-06 17:43:02', '2020-05-06 17:43:02'),
(28, 1, NULL, 'Philippe', 'Mayersohn', '', NULL, NULL, 226, '9179405702', 'philippe.meyersohn@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 1, 21, 21, NULL, '2020-05-06 17:47:00', '2020-05-06 17:47:00'),
(29, 1, NULL, 'Lars', 'Kindem', '', NULL, NULL, 226, '9178613535', 'larsgkiii@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 1, 22, 22, NULL, '2020-05-06 18:03:11', '2020-05-06 18:03:11'),
(30, 1, NULL, 'Pierre', 'Noblecourt', '', NULL, NULL, 226, '0008889999', 'n_pierre5@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 1, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(31, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 23, 23, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(32, 1, NULL, 'Marco', 'Corsco', '', NULL, NULL, 226, '6141386394', 'marcocorso777@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 1, 24, 24, NULL, '2020-05-06 18:25:30', '2020-05-06 18:25:30'),
(33, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 24, 24, NULL, '2020-05-06 18:25:30', '2020-05-06 18:25:30'),
(34, 7, NULL, 'Sandy', 'Addona', '', NULL, NULL, 226, '3478210828', 'Sandyaddona@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 25, 25, NULL, '2020-05-06 18:43:55', '2020-05-06 18:43:55'),
(35, 1, NULL, 'David', 'Smith', '', NULL, NULL, 226, '0008889999', 'edwinmerman@att.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 1, 26, 26, NULL, '2020-05-06 18:50:02', '2020-05-06 18:50:02'),
(36, 1, NULL, 'Miles', 'Schreiner', '', NULL, NULL, 226, '0008889999', 'milesmschreiner@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 1, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(37, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 27, 27, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(38, 1, 1, 'Mark', 'Conti', '', NULL, NULL, 13, '0407383536', 'mconti4dustfree@gmail.com', '', '', '', NULL, NULL, '', '', '', '', '', '', '', 28, 1, 28, 2, NULL, '2020-05-06 19:11:14', '2020-05-07 15:21:17'),
(39, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 28, 28, NULL, '2020-05-06 19:11:14', '2020-05-06 19:11:14'),
(40, 7, NULL, 'Anita', 'Sthankiya', '', NULL, NULL, 226, '0008889999', 'anita@keepingitsocial.ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 1, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(41, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 29, 29, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(42, 7, NULL, 'Melissa', 'Anderson', '', NULL, NULL, 226, '0008889999', 'kranderski@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 1, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(43, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 30, 30, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(44, 7, NULL, 'Jacqui', 'Vanderzeil', '', NULL, NULL, 226, '0008889999', 'jacstar@me.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, 1, 31, 31, NULL, '2020-05-06 19:47:03', '2020-05-06 19:47:03'),
(45, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 31, 31, NULL, '2020-05-06 19:47:03', '2020-05-06 19:47:03'),
(46, 7, NULL, 'Anita', 'Raffaelli', '', NULL, NULL, 226, '0008889999', 'anitaraffaelli55@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 1, 32, 32, NULL, '2020-05-06 19:56:06', '2020-05-06 19:56:06'),
(47, 7, NULL, 'Linda', 'Dennis', '', NULL, NULL, 226, '0008889999', 'lindadennis02@msn.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 1, 33, 33, NULL, '2020-05-06 20:03:38', '2020-05-06 20:03:38'),
(48, 7, NULL, 'Jodi', 'Maricich', '', NULL, NULL, 226, '0008889999', 'jodi@jamdesigngroup.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 1, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23'),
(49, NULL, NULL, '', '', '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 34, 34, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `guest_titles`
--

CREATE TABLE `guest_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guest_titles`
--

INSERT INTO `guest_titles` (`id`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Mr.', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(2, 'Ms.', 1, 1, 1, '2020-03-17 06:50:09', '2019-11-19 18:30:31', '2020-03-17 06:50:09'),
(3, 'Dr.', 1, 1, 1, '2020-03-17 06:49:14', '2020-03-11 04:07:31', '2020-03-17 06:49:14'),
(4, 'Miss', 1, 1, 1, '2020-03-11 04:09:36', '2020-03-11 04:09:15', '2020-03-11 04:09:36'),
(5, 'Atty.', 1, 1, 1, '2020-03-17 06:49:18', '2020-03-11 04:09:48', '2020-03-17 06:49:18'),
(6, 'Engr.', 1, 1, 1, '2020-03-17 06:49:23', '2020-03-11 04:10:02', '2020-03-17 06:49:23'),
(7, 'Miss', 1, 1, 1, NULL, '2020-03-17 06:49:57', '2020-03-17 06:49:57'),
(8, 'Mrs.', 1, 1, 1, NULL, '2020-03-17 06:50:22', '2020-03-17 06:50:22');

-- --------------------------------------------------------

--
-- Table structure for table `identification_card_types`
--

CREATE TABLE `identification_card_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inclusions`
--

CREATE TABLE `inclusions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `is_default_checked` tinyint(4) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inclusions`
--

INSERT INTO `inclusions` (`id`, `description`, `details`, `is_default_checked`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Private Yacht (Beneteau Oceanis 48)', NULL, 1, 1, 5, 5, NULL, '2020-01-20 20:55:21', '2020-01-20 20:55:21'),
(2, 'Your Crew (Skipper and Hostess)', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:01:01', '2020-01-20 21:01:01'),
(3, 'Early Check-in and Champagne Arrival', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:01:25', '2020-01-20 21:01:25'),
(4, 'On-board Meals (Breakfast & Lunch)', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:01:50', '2020-01-20 21:01:50'),
(5, 'One Way Fee', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:02:28', '2020-01-20 21:02:28'),
(6, 'Fuel', 'Up to €150 for Croatia\nUp to €200 for Greece', 1, 1, 5, 5, NULL, '2020-01-20 21:04:25', '2020-01-20 21:04:25'),
(7, 'Marina Fees (Circa €600 per Week)', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:04:47', '2020-01-20 21:04:47'),
(8, 'Water, Taxes, WiFi (4G unlimited data)', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:04:57', '2020-01-20 21:04:57'),
(9, 'Final Cleaning Fee', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:05:13', '2020-01-20 21:05:13'),
(10, 'NO ‘departure taxes’', NULL, 1, 1, 5, 5, NULL, '2020-01-20 21:05:25', '2020-01-20 21:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itinerary_brand_id` bigint(20) UNSIGNED NOT NULL,
  `itinerary_country_id` bigint(20) UNSIGNED NOT NULL,
  `disclaimer` text COLLATE utf8mb4_unicode_ci,
  `check_in_date` date NOT NULL,
  `check_in_time` time NOT NULL,
  `check_out_date` date NOT NULL,
  `check_out_time` time NOT NULL,
  `city_id_from` bigint(20) UNSIGNED NOT NULL,
  `city_id_to` bigint(20) UNSIGNED NOT NULL,
  `city_port_id_from` bigint(20) UNSIGNED NOT NULL,
  `city_port_id_to` bigint(20) UNSIGNED NOT NULL,
  `is_locked_to_ambassador` tinyint(4) NOT NULL,
  `ambassador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_shared_offered` tinyint(4) NOT NULL DEFAULT '1',
  `is_private_offered` tinyint(4) NOT NULL DEFAULT '1',
  `is_double_offered` tinyint(4) NOT NULL DEFAULT '1',
  `is_referral_active` tinyint(4) NOT NULL,
  `referral_price` decimal(20,2) NOT NULL,
  `is_early_bird_active` tinyint(4) NOT NULL,
  `early_bird_cut_off_date` date DEFAULT NULL,
  `boat_id` bigint(20) UNSIGNED NOT NULL,
  `is_private_charter_active` tinyint(4) NOT NULL,
  `private_charter_price` decimal(20,2) NOT NULL,
  `deposit_per_person` decimal(20,2) NOT NULL,
  `is_displayed` tinyint(4) NOT NULL DEFAULT '1',
  `is_cabin_same_price` tinyint(4) NOT NULL DEFAULT '1',
  `price_per_person` decimal(20,2) DEFAULT NULL,
  `cabin_price` decimal(20,2) DEFAULT NULL,
  `early_bird_price` decimal(20,2) DEFAULT NULL,
  `cabin_early_bird_price` decimal(20,2) DEFAULT NULL,
  `is_cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itineraries`
--

INSERT INTO `itineraries` (`id`, `itinerary_brand_id`, `itinerary_country_id`, `disclaimer`, `check_in_date`, `check_in_time`, `check_out_date`, `check_out_time`, `city_id_from`, `city_id_to`, `city_port_id_from`, `city_port_id_to`, `is_locked_to_ambassador`, `ambassador_id`, `is_shared_offered`, `is_private_offered`, `is_double_offered`, `is_referral_active`, `referral_price`, `is_early_bird_active`, `early_bird_cut_off_date`, `boat_id`, `is_private_charter_active`, `private_charter_price`, `deposit_per_person`, `is_displayed`, `is_cabin_same_price`, `price_per_person`, `cabin_price`, `early_bird_price`, `cabin_early_bird_price`, `is_cancelled`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '2020-05-30', '13:00:00', '2020-06-06', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 0, '0.00', '400.00', 0, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 05:45:13', '2020-05-06 09:10:42'),
(2, 2, 1, NULL, '2020-06-13', '13:00:00', '2020-06-20', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, '2020-03-31', 2, 1, '6960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 05:58:30', '2020-05-06 09:14:19'),
(3, 1, 1, NULL, '2020-06-06', '13:00:00', '2020-06-13', '08:00:00', 3, 1, 3, 1, 0, 6, 1, 1, 1, 1, '50.00', 0, NULL, 2, 0, '0.00', '400.00', 0, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:31:39', '2020-05-06 09:13:06'),
(4, 2, 1, '', '2020-06-20', '13:00:00', '2020-06-27', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '6960.00', '400.00', 1, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 1, NULL, '2020-03-03 07:35:53', '2020-03-03 07:35:53'),
(5, 1, 1, NULL, '2020-06-13', '13:00:00', '2020-06-20', '08:00:00', 1, 3, 1, 3, 0, 7, 1, 1, 1, 1, '50.00', 0, NULL, 2, 0, '0.00', '400.00', 0, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:36:05', '2020-05-06 09:27:59'),
(6, 2, 1, '', '2020-07-11', '13:00:00', '2020-07-18', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '6960.00', '400.00', 1, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 1, NULL, '2020-03-03 07:37:53', '2020-03-03 07:51:31'),
(7, 2, 1, NULL, '2020-07-18', '13:00:00', '2020-07-25', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '6960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:49:44', '2020-05-06 09:20:21'),
(8, 1, 1, NULL, '2020-06-20', '13:00:00', '2020-06-27', '08:00:00', 3, 1, 3, 1, 0, 10, 1, 1, 1, 1, '50.00', 0, NULL, 2, 0, '0.00', '400.00', 0, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:51:42', '2020-05-06 09:15:55'),
(9, 2, 1, NULL, '2020-08-01', '13:00:00', '2020-08-08', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '6960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:52:37', '2020-05-06 09:22:18'),
(10, 2, 1, NULL, '2020-08-08', '13:00:00', '2020-08-15', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '6960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:53:01', '2020-05-06 09:23:05'),
(11, 2, 1, NULL, '2020-08-22', '13:00:00', '2020-08-29', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '6960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:54:31', '2020-05-06 09:24:11'),
(12, 1, 1, NULL, '2020-06-27', '13:00:00', '2020-07-04', '08:00:00', 1, 3, 1, 3, 0, 37, 1, 1, 1, 1, '50.00', 0, NULL, 1, 0, '0.00', '400.00', 0, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 07:56:14', '2020-05-06 09:17:20'),
(13, 2, 1, 'DISCLAIMER: For mono hulls (Oceanis 48), please take note that cabin type requests are not guaranteed and is subject to change depending on the situation /availability.', '2020-09-05', '13:00:00', '2020-09-12', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 0, '50.00', 0, NULL, 1, 1, '7960.00', '400.00', 1, 1, '1120.00', '2230.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 08:02:28', '2020-05-06 19:27:17'),
(14, 2, 1, NULL, '2020-09-19', '13:00:00', '2020-09-26', '08:00:00', 1, 1, 1, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '6960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 08:05:56', '2020-05-06 09:25:52'),
(15, 1, 1, NULL, '2020-07-04', '13:00:00', '2020-07-11', '08:00:00', 3, 1, 3, 1, 0, 9, 1, 1, 1, 1, '50.00', 0, NULL, 2, 0, '0.00', '400.00', 1, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 08:07:05', '2020-05-06 10:32:54'),
(16, 1, 1, NULL, '2020-07-11', '13:00:00', '2020-07-18', '08:00:00', 1, 3, 1, 3, 0, 16, 1, 1, 1, 1, '50.00', 0, NULL, 2, 0, '0.00', '400.00', 1, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-03 08:14:30', '2020-05-05 13:53:13'),
(18, 2, 1, NULL, '2020-05-30', '13:00:00', '2020-06-06', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 2, 1, '6960.00', '0.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 04:43:35', '2020-05-06 09:11:02'),
(19, 2, 1, NULL, '2020-06-06', '13:00:00', '2020-06-13', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 2, 1, '6960.00', '0.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 04:49:53', '2020-05-06 09:13:36'),
(24, 1, 1, NULL, '2020-07-18', '13:00:00', '2020-07-25', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 0, '0.00', 0, NULL, 1, 1, '8760.00', '2000.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 05:00:54', '2020-05-06 09:21:00'),
(25, 1, 1, NULL, '2020-07-25', '13:00:00', '2020-08-01', '08:00:00', 1, 3, 1, 3, 0, 19, 1, 1, 1, 1, '50.00', 0, NULL, 4, 0, '0.00', '400.00', 0, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 07:45:25', '2020-05-05 13:54:28'),
(26, 2, 1, NULL, '2020-06-27', '13:00:00', '2020-07-04', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 0, '50.00', 0, NULL, 1, 0, '6960.00', '0.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 08:02:15', '2020-05-06 09:17:46'),
(27, 1, 1, NULL, '2020-08-08', '13:00:00', '2020-08-15', '08:00:00', 1, 3, 1, 3, 0, 38, 1, 1, 1, 0, '50.00', 0, NULL, 2, 0, '0.00', '500.00', 1, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 08:03:11', '2020-05-06 17:29:21'),
(28, 2, 1, NULL, '2020-07-04', '13:00:00', '2020-07-11', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 0, '50.00', 0, NULL, 2, 0, '6960.00', '2000.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 08:09:32', '2020-05-06 09:18:58'),
(29, 2, 1, NULL, '2020-07-25', '13:00:00', '2020-08-01', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 0, '50.00', 0, NULL, 2, 0, '6960.00', '2000.00', 1, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 08:14:02', '2020-05-05 13:54:55'),
(30, 3, 1, 'DISCLAIMER: For mono hulls (Oceanis 48), please take note that cabin type requests are not guaranteed and is subject to change depending on the situation /availability', '2020-09-12', '13:00:00', '2020-09-19', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '7960.00', '400.00', 1, 1, '1390.00', '2705.00', '0.00', '0.00', 0, 1, 1, 1, NULL, '2020-03-04 08:19:36', '2020-03-05 08:30:08'),
(31, 1, 1, NULL, '2020-08-08', '13:00:00', '2020-08-15', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 0, '0.00', '400.00', 1, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 08:41:33', '2020-05-05 14:38:50'),
(32, 1, 1, NULL, '2020-08-22', '13:00:00', '2020-08-29', '08:00:00', 1, 3, 1, 3, 0, 27, 1, 1, 1, 1, '50.00', 0, NULL, 1, 0, '0.00', '400.00', 1, 1, '1490.00', '2905.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-04 08:47:03', '2020-05-05 14:40:20'),
(33, 1, 1, NULL, '2020-08-29', '13:00:00', '2020-09-05', '08:00:00', 3, 1, 3, 1, 0, 42, 1, 1, 1, 1, '50.00', 0, '2020-04-04', 1, 0, '0.00', '500.00', 1, 1, '1490.00', '2905.00', NULL, NULL, 0, 1, 1, 4, NULL, '2020-03-05 01:25:42', '2020-05-06 18:35:53'),
(34, 1, 1, NULL, '2020-08-29', '13:00:00', '2020-09-05', '08:00:00', 3, 1, 3, 1, 0, 31, 1, 1, 1, 1, '50.00', 0, NULL, 2, 0, '0.00', '500.00', 1, 1, '1490.00', '2880.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 03:32:55', '2020-05-06 18:40:05'),
(35, 1, 1, NULL, '2020-09-12', '13:00:00', '2020-09-19', '08:00:00', 3, 1, 3, 1, 0, 34, 1, 1, 1, 0, '50.00', 0, NULL, 2, 0, '0.00', '500.00', 1, 1, '995.00', '1890.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 03:39:16', '2020-05-06 19:45:25'),
(36, 1, 1, NULL, '2020-09-12', '13:00:00', '2020-09-19', '08:00:00', 3, 1, 3, 1, 0, 41, 1, 1, 1, 0, '50.00', 0, NULL, 2, 0, '0.00', '500.00', 1, 1, '1490.00', '2880.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 03:43:41', '2020-05-06 19:51:20'),
(37, 1, 1, NULL, '2020-09-19', '13:00:00', '2020-09-26', '08:00:00', 1, 1, 1, 1, 0, NULL, 1, 1, 1, 0, '50.00', 0, NULL, 2, 0, '0.00', '400.00', 1, 1, '1440.00', '2780.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 03:46:33', '2020-05-06 20:00:17'),
(38, 1, 1, NULL, '2020-09-19', '13:00:00', '2020-09-26', '08:00:00', 1, 1, 1, 1, 0, 41, 1, 1, 1, 1, '50.00', 0, NULL, 1, 0, '0.00', '400.00', 1, 1, '1490.00', '2880.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 03:55:25', '2020-05-06 20:24:44'),
(39, 3, 1, NULL, '2020-06-06', '13:00:00', '2020-06-13', '08:00:00', 3, 1, 3, 1, 0, 5, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '9960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 04:52:05', '2020-05-06 09:13:55'),
(40, 3, 1, NULL, '2020-06-20', '13:00:00', '2020-06-27', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '9960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 04:53:37', '2020-05-06 09:16:23'),
(41, 3, 1, NULL, '2020-06-27', '13:00:00', '2020-07-04', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '9960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 04:58:31', '2020-05-06 09:18:10'),
(42, 3, 1, NULL, '2020-07-04', '13:00:00', '2020-07-11', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '9960.00', '400.00', 0, 1, '0.00', '0.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 05:00:07', '2020-05-06 09:19:25'),
(43, 3, 1, NULL, '2020-07-25', '13:00:00', '2020-08-01', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '9960.00', '500.00', 1, 1, '1395.00', '2715.00', NULL, NULL, 0, 1, 1, 4, NULL, '2020-03-05 05:02:56', '2020-05-06 15:40:21'),
(44, 3, 1, NULL, '2020-08-01', '13:00:00', '2020-08-08', '08:00:00', 3, 1, 3, 1, 0, 21, 1, 1, 1, 1, '50.00', 0, '2020-06-01', 1, 0, '9960.00', '500.00', 1, 1, '1345.00', '2690.00', '1340.00', '2580.00', 0, 1, 1, 4, NULL, '2020-03-05 05:05:18', '2020-05-06 17:04:32'),
(45, 3, 1, NULL, '2020-08-01', '13:00:00', '2020-08-08', '08:00:00', 3, 1, 3, 1, 0, 21, 1, 1, 1, 0, '50.00', 0, NULL, 1, 0, '9960.00', '500.00', 1, 1, '1345.00', '2690.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 07:10:04', '2020-05-06 17:05:52'),
(46, 3, 1, NULL, '2020-08-15', '13:00:00', '2020-08-22', '08:00:00', 3, 1, 3, 1, 0, 24, 1, 1, 1, 0, '50.00', 0, NULL, 1, 0, '9960.00', '500.00', 1, 1, '1345.00', '2690.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 07:12:43', '2020-05-06 18:10:34'),
(47, 3, 1, NULL, '2020-08-15', '13:00:00', '2020-08-22', '08:00:00', 3, 1, 3, 1, 0, 24, 1, 1, 1, 1, '50.00', 0, NULL, 1, 0, '9960.00', '500.00', 1, 1, '1345.00', '2590.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 07:17:50', '2020-05-06 17:39:14'),
(48, 3, 1, NULL, '2020-08-15', '13:00:00', '2020-08-22', '08:00:00', 3, 1, 3, 1, 0, 24, 1, 1, 1, 0, '50.00', 0, '2020-06-01', 1, 0, '9960.00', '500.00', 1, 1, '1345.00', '2690.00', NULL, NULL, 0, 1, 1, 4, NULL, '2020-03-05 07:19:30', '2020-05-06 18:08:58'),
(49, 3, 1, NULL, '2020-08-22', '13:00:00', '2020-08-29', '08:00:00', 1, 3, 1, 3, 0, NULL, 1, 1, 1, 0, '50.00', 0, NULL, 1, 1, '9960.00', '400.00', 1, 1, '1345.00', '2590.00', NULL, NULL, 0, 1, 1, 4, NULL, '2020-03-05 07:48:25', '2020-05-06 18:22:57'),
(50, 3, 1, 'DISCLAIMER: For mono hulls (Oceanis 48), please take note that cabin type requests are not guaranteed and is subject to change depending on the situation /availability', '2020-09-05', '13:00:00', '2020-09-12', '08:00:00', 3, 1, 3, 1, 0, NULL, 1, 1, 1, 1, '50.00', 0, NULL, 1, 1, '9960.00', '400.00', 1, 1, '1345.00', '2590.00', '0.00', '0.00', 0, 1, 1, 4, NULL, '2020-03-05 08:19:37', '2020-05-06 18:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_add_ons`
--

CREATE TABLE `itinerary_add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itinerary_id` bigint(20) UNSIGNED NOT NULL,
  `add_on_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `available_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_add_ons`
--

INSERT INTO `itinerary_add_ons` (`id`, `itinerary_id`, `add_on_id`, `price`, `available_qty`) VALUES
(4, 4, 1, '150.00', 1),
(7, 6, 1, '150.00', 1),
(31, 30, 1, '150.00', 1),
(77, 16, 1, '150.00', 1),
(79, 25, 1, '150.00', 1),
(80, 29, 1, '150.00', 1),
(89, 32, 1, '150.00', 1),
(99, 1, 1, '150.00', 1),
(100, 18, 1, '150.00', 1),
(104, 3, 1, '150.00', 1),
(105, 19, 1, '150.00', 1),
(106, 39, 1, '150.00', 1),
(107, 39, 2, '150.00', 1),
(108, 2, 1, '150.00', 1),
(109, 8, 1, '150.00', 1),
(110, 40, 1, '150.00', 1),
(111, 40, 2, '150.00', 1),
(112, 12, 1, '150.00', 1),
(113, 26, 1, '150.00', 1),
(114, 41, 1, '150.00', 1),
(115, 41, 2, '150.00', 1),
(116, 28, 1, '150.00', 1),
(117, 7, 1, '150.00', 1),
(118, 24, 1, '150.00', 1),
(119, 9, 1, '150.00', 1),
(120, 10, 1, '150.00', 1),
(121, 11, 1, '150.00', 1),
(122, 14, 1, '150.00', 1),
(123, 5, 1, '150.00', 1),
(128, 15, 1, '150.00', 1),
(138, 43, 1, '150.00', 1),
(141, 45, 1, '150.00', 1),
(142, 31, 1, '150.00', 1),
(143, 27, 1, '150.00', 1),
(145, 47, 1, '150.00', 1),
(149, 46, 1, '150.00', 1),
(150, 49, 1, '150.00', 1),
(151, 33, 1, '150.00', 1),
(152, 34, 1, '150.00', 1),
(153, 50, 1, '150.00', 1),
(158, 35, 1, '150.00', 1),
(159, 36, 1, '150.00', 1),
(161, 38, 1, '150.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_brands`
--

CREATE TABLE `itinerary_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_ambassador_required` tinyint(4) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_brands`
--

INSERT INTO `itinerary_brands` (`id`, `slug`, `description`, `details`, `color`, `is_ambassador_required`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'yogasailingholidays', 'Yoga Sailing Holidays', 'Yoga Sailing Holidays is exactly that, we provide a yoga retreat on a sailing holiday in Croatia. While you sail Croatia, we also include a yoga instructor on your sailing holiday to give you a European yoga retreat style experience with daily yoga in the most beautiful locations and evening meditation.', '#ff8000', 1, 1, 5, 5, NULL, '2020-01-20 18:28:05', '2020-01-20 18:28:05'),
(2, 'medsailingholidays', 'Med Sailing Holidays', 'Sail the week down the Dalmatian coastline, we stop in secluded bays for your afternoon swim break and lunch.  You will get to explore the hidden gems that are only accessible by boat.', '#00ff40', 1, 1, 1, 1, NULL, '2020-01-20 18:28:11', '2020-01-20 18:29:23'),
(3, 'pridesailingholidays', 'Pride Sailing Holidays', 'Pride Sailing are brand of the Med Sailing Holidays group, who offer niche island hopping / sailing holiday experiences.', '#0080ff', 1, 1, 1, 1, NULL, '2020-01-20 18:30:43', '2020-01-20 18:30:43'),
(4, 'wineweek', 'Wine Week', 'You will spend 7 days island-hopping across the stunning Dalmatian coastline on one of our fully crewed sailing yachts, with skipper and hostess to make sure your Croatian sailing holiday is as smooth as a Cabernet Sauvignon. Our Croatian sailing itinerary runs from Split to Dubrovnik and includes the best destinations that Croatia has to offer, including Croatia\'s National Park Mljet, the fortified town of Korčula and one of the most captivating islands, Vis. There are plenty of hidden gems on the journey and we promise, the trip will be like nothing you’ve ever done before!', '#ffff00', 1, 1, 5, 5, NULL, '2020-01-20 18:31:08', '2020-01-20 18:31:08'),
(5, 'fitnessweek', 'Fitness Week', 'Sail Croatia and incorporate fitness activities such as TRX and cross-fit routines in your island-hopping adventure for a truly one of a kind sailing holiday in Croatia.', '#8080ff', 1, 1, 1, 1, NULL, '2020-01-20 18:32:54', '2020-01-20 18:32:54'),
(6, 'diveweek', 'Dive Week', '\'Dive Week\' is a wonderful blend of sailing, swimming, leisure time and diving in the most beautiful waters in the world.  For the divers among us, there\'s no better way to unwind, explore beautiful islands and do what we love; exploring the underwater.', '#ec0ef1', 1, 1, 5, 5, NULL, '2020-01-20 18:32:57', '2020-01-20 18:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_cabins`
--

CREATE TABLE `itinerary_cabins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `boat_cabin_id` bigint(20) UNSIGNED NOT NULL,
  `itinerary_id` bigint(20) UNSIGNED NOT NULL,
  `ambassador_allocation` bigint(20) NOT NULL DEFAULT '0',
  `price_per_person` decimal(20,2) NOT NULL,
  `cabin_price` decimal(20,2) NOT NULL,
  `early_bird_price` decimal(20,2) DEFAULT NULL,
  `cabin_early_bird_price` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_cabins`
--

INSERT INTO `itinerary_cabins` (`id`, `boat_cabin_id`, `itinerary_id`, `ambassador_allocation`, `price_per_person`, `cabin_price`, `early_bird_price`, `cabin_early_bird_price`) VALUES
(1, 1, 1, 0, '1490.00', '2905.00', '0.00', '0.00'),
(2, 2, 1, 0, '1490.00', '2905.00', '0.00', '0.00'),
(3, 3, 1, 0, '1490.00', '2905.00', '0.00', '0.00'),
(4, 4, 1, 0, '1490.00', '2905.00', '0.00', '0.00'),
(5, 5, 2, 0, '0.00', '0.00', '0.00', '0.00'),
(6, 6, 2, 0, '0.00', '0.00', '0.00', '0.00'),
(7, 7, 2, 0, '0.00', '0.00', '0.00', '0.00'),
(8, 8, 2, 0, '0.00', '0.00', '0.00', '0.00'),
(9, 5, 3, 0, '1490.00', '2905.00', '0.00', '0.00'),
(10, 6, 3, 0, '1490.00', '2905.00', '0.00', '0.00'),
(11, 7, 3, 0, '1490.00', '2905.00', '0.00', '0.00'),
(12, 8, 3, 0, '1490.00', '2905.00', '0.00', '0.00'),
(13, 1, 4, 0, '1120.00', '2170.00', NULL, NULL),
(14, 2, 4, 0, '1120.00', '2170.00', NULL, NULL),
(15, 3, 4, 0, '1120.00', '2170.00', NULL, NULL),
(16, 4, 4, 0, '1120.00', '2170.00', NULL, NULL),
(17, 5, 5, 0, '1490.00', '2905.00', '0.00', '0.00'),
(18, 6, 5, 0, '1490.00', '2905.00', '0.00', '0.00'),
(19, 7, 5, 0, '1490.00', '2905.00', '0.00', '0.00'),
(20, 8, 5, 0, '1490.00', '2905.00', '0.00', '0.00'),
(21, 1, 6, 0, '1120.00', '2170.00', NULL, NULL),
(22, 2, 6, 0, '1120.00', '2170.00', NULL, NULL),
(23, 3, 6, 0, '1120.00', '2170.00', NULL, NULL),
(24, 4, 6, 0, '1120.00', '2170.00', NULL, NULL),
(25, 1, 7, 0, '0.00', '0.00', '0.00', '0.00'),
(26, 2, 7, 0, '0.00', '0.00', '0.00', '0.00'),
(27, 3, 7, 0, '0.00', '0.00', '0.00', '0.00'),
(28, 4, 7, 0, '0.00', '0.00', '0.00', '0.00'),
(29, 5, 8, 0, '1490.00', '2905.00', '0.00', '0.00'),
(30, 6, 8, 0, '1490.00', '2905.00', '0.00', '0.00'),
(31, 7, 8, 0, '1490.00', '2905.00', '0.00', '0.00'),
(32, 8, 8, 0, '1490.00', '2905.00', '0.00', '0.00'),
(33, 1, 9, 0, '0.00', '0.00', '0.00', '0.00'),
(34, 2, 9, 0, '0.00', '0.00', '0.00', '0.00'),
(35, 3, 9, 0, '0.00', '0.00', '0.00', '0.00'),
(36, 4, 9, 0, '0.00', '0.00', '0.00', '0.00'),
(37, 1, 10, 0, '0.00', '0.00', '0.00', '0.00'),
(38, 2, 10, 0, '0.00', '0.00', '0.00', '0.00'),
(39, 3, 10, 0, '0.00', '0.00', '0.00', '0.00'),
(40, 4, 10, 0, '0.00', '0.00', '0.00', '0.00'),
(41, 1, 11, 0, '0.00', '0.00', '0.00', '0.00'),
(42, 2, 11, 0, '0.00', '0.00', '0.00', '0.00'),
(43, 3, 11, 0, '0.00', '0.00', '0.00', '0.00'),
(44, 4, 11, 0, '0.00', '0.00', '0.00', '0.00'),
(49, 1, 12, 0, '1490.00', '2905.00', '0.00', '0.00'),
(50, 2, 12, 0, '1490.00', '2905.00', '0.00', '0.00'),
(51, 3, 12, 0, '1490.00', '2905.00', '0.00', '0.00'),
(52, 4, 12, 0, '1490.00', '2905.00', '0.00', '0.00'),
(53, 1, 13, 0, '1120.00', '2230.00', '0.00', '0.00'),
(54, 2, 13, 0, '1120.00', '2230.00', '0.00', '0.00'),
(55, 3, 13, 0, '1120.00', '2230.00', '0.00', '0.00'),
(56, 4, 13, 0, '1120.00', '2230.00', '0.00', '0.00'),
(57, 1, 14, 0, '0.00', '0.00', '0.00', '0.00'),
(58, 2, 14, 0, '0.00', '0.00', '0.00', '0.00'),
(59, 3, 14, 0, '0.00', '0.00', '0.00', '0.00'),
(60, 4, 14, 0, '0.00', '0.00', '0.00', '0.00'),
(61, 5, 15, 1, '1490.00', '2905.00', '0.00', '0.00'),
(62, 6, 15, 0, '1490.00', '2905.00', '0.00', '0.00'),
(63, 7, 15, 0, '1490.00', '2905.00', '0.00', '0.00'),
(64, 8, 15, 0, '1490.00', '2905.00', '0.00', '0.00'),
(65, 5, 16, 0, '1490.00', '2905.00', '0.00', '0.00'),
(66, 6, 16, 0, '1490.00', '2905.00', '0.00', '0.00'),
(67, 7, 16, 0, '1490.00', '2905.00', '0.00', '0.00'),
(68, 8, 16, 0, '1490.00', '2905.00', '0.00', '0.00'),
(69, 5, 18, 0, '0.00', '0.00', '0.00', '0.00'),
(70, 6, 18, 0, '0.00', '0.00', '0.00', '0.00'),
(71, 7, 18, 0, '0.00', '0.00', '0.00', '0.00'),
(72, 8, 18, 0, '0.00', '0.00', '0.00', '0.00'),
(73, 5, 19, 0, '0.00', '0.00', '0.00', '0.00'),
(74, 6, 19, 0, '0.00', '0.00', '0.00', '0.00'),
(75, 7, 19, 0, '0.00', '0.00', '0.00', '0.00'),
(76, 8, 19, 0, '0.00', '0.00', '0.00', '0.00'),
(77, 1, 24, 0, '0.00', '0.00', '0.00', '0.00'),
(78, 2, 24, 0, '0.00', '0.00', '0.00', '0.00'),
(79, 3, 24, 0, '0.00', '0.00', '0.00', '0.00'),
(80, 4, 24, 0, '0.00', '0.00', '0.00', '0.00'),
(81, 13, 25, 0, '1490.00', '2905.00', '0.00', '0.00'),
(82, 14, 25, 0, '1490.00', '2905.00', '0.00', '0.00'),
(83, 15, 25, 0, '1490.00', '2905.00', '0.00', '0.00'),
(84, 16, 25, 0, '1490.00', '2905.00', '0.00', '0.00'),
(89, 5, 27, 1, '1490.00', '2905.00', '0.00', '0.00'),
(90, 6, 27, 0, '1490.00', '2905.00', '0.00', '0.00'),
(91, 7, 27, 0, '1490.00', '2905.00', '0.00', '0.00'),
(92, 8, 27, 0, '1490.00', '2905.00', '0.00', '0.00'),
(93, 1, 26, 0, '0.00', '0.00', '0.00', '0.00'),
(94, 2, 26, 0, '0.00', '0.00', '0.00', '0.00'),
(95, 3, 26, 0, '0.00', '0.00', '0.00', '0.00'),
(96, 4, 26, 0, '0.00', '0.00', '0.00', '0.00'),
(101, 5, 28, 0, '0.00', '0.00', '0.00', '0.00'),
(102, 6, 28, 0, '0.00', '0.00', '0.00', '0.00'),
(103, 7, 28, 0, '0.00', '0.00', '0.00', '0.00'),
(104, 8, 28, 0, '0.00', '0.00', '0.00', '0.00'),
(105, 5, 29, 0, '0.00', '0.00', '0.00', '0.00'),
(106, 6, 29, 0, '0.00', '0.00', '0.00', '0.00'),
(107, 7, 29, 0, '0.00', '0.00', '0.00', '0.00'),
(108, 8, 29, 0, '0.00', '0.00', '0.00', '0.00'),
(109, 1, 30, 0, '1390.00', '2705.00', '0.00', '0.00'),
(110, 2, 30, 0, '1390.00', '2705.00', '0.00', '0.00'),
(111, 3, 30, 0, '1390.00', '2705.00', '0.00', '0.00'),
(112, 4, 30, 0, '1390.00', '2705.00', '0.00', '0.00'),
(113, 1, 31, 0, '1490.00', '2905.00', '0.00', '0.00'),
(114, 2, 31, 0, '1490.00', '2905.00', '0.00', '0.00'),
(115, 3, 31, 0, '1490.00', '2905.00', '0.00', '0.00'),
(116, 4, 31, 0, '1490.00', '2905.00', '0.00', '0.00'),
(117, 1, 32, 0, '1490.00', '2905.00', '0.00', '0.00'),
(118, 2, 32, 0, '1490.00', '2905.00', '0.00', '0.00'),
(119, 3, 32, 0, '1490.00', '2905.00', '0.00', '0.00'),
(120, 4, 32, 0, '1490.00', '2905.00', '0.00', '0.00'),
(121, 1, 33, 1, '1490.00', '2905.00', NULL, NULL),
(122, 2, 33, 0, '1490.00', '2905.00', NULL, NULL),
(123, 3, 33, 0, '1490.00', '2905.00', NULL, NULL),
(124, 4, 33, 0, '1490.00', '2905.00', NULL, NULL),
(129, 5, 34, 1, '1490.00', '2880.00', '0.00', '0.00'),
(130, 6, 34, 0, '1490.00', '2880.00', '0.00', '0.00'),
(131, 7, 34, 0, '1490.00', '2880.00', '0.00', '0.00'),
(132, 8, 34, 0, '1490.00', '2880.00', '0.00', '0.00'),
(133, 5, 35, 1, '995.00', '1890.00', '0.00', '0.00'),
(134, 6, 35, 0, '995.00', '1890.00', '0.00', '0.00'),
(135, 7, 35, 0, '995.00', '1890.00', '0.00', '0.00'),
(136, 8, 35, 0, '995.00', '1890.00', '0.00', '0.00'),
(137, 5, 36, 1, '1490.00', '2880.00', '0.00', '0.00'),
(138, 6, 36, 0, '1490.00', '2880.00', '0.00', '0.00'),
(139, 7, 36, 0, '1490.00', '2880.00', '0.00', '0.00'),
(140, 8, 36, 0, '1490.00', '2880.00', '0.00', '0.00'),
(145, 5, 37, 0, '1440.00', '2780.00', '0.00', '0.00'),
(146, 6, 37, 0, '1440.00', '2780.00', '0.00', '0.00'),
(147, 7, 37, 0, '1440.00', '2780.00', '0.00', '0.00'),
(148, 8, 37, 0, '1440.00', '2780.00', '0.00', '0.00'),
(153, 1, 38, 1, '1490.00', '2880.00', '0.00', '0.00'),
(154, 2, 38, 0, '1490.00', '2880.00', '0.00', '0.00'),
(155, 3, 38, 0, '1490.00', '2880.00', '0.00', '0.00'),
(156, 4, 38, 0, '1490.00', '2880.00', '0.00', '0.00'),
(157, 1, 39, 0, '0.00', '0.00', '0.00', '0.00'),
(158, 2, 39, 0, '0.00', '0.00', '0.00', '0.00'),
(159, 3, 39, 0, '0.00', '0.00', '0.00', '0.00'),
(160, 4, 39, 0, '0.00', '0.00', '0.00', '0.00'),
(161, 1, 40, 0, '0.00', '0.00', '0.00', '0.00'),
(162, 2, 40, 0, '0.00', '0.00', '0.00', '0.00'),
(163, 3, 40, 0, '0.00', '0.00', '0.00', '0.00'),
(164, 4, 40, 0, '0.00', '0.00', '0.00', '0.00'),
(165, 1, 41, 0, '0.00', '0.00', '0.00', '0.00'),
(166, 2, 41, 0, '0.00', '0.00', '0.00', '0.00'),
(167, 3, 41, 0, '0.00', '0.00', '0.00', '0.00'),
(168, 4, 41, 0, '0.00', '0.00', '0.00', '0.00'),
(169, 1, 42, 0, '0.00', '0.00', '0.00', '0.00'),
(170, 2, 42, 0, '0.00', '0.00', '0.00', '0.00'),
(171, 3, 42, 0, '0.00', '0.00', '0.00', '0.00'),
(172, 4, 42, 0, '0.00', '0.00', '0.00', '0.00'),
(173, 1, 43, 0, '1395.00', '2715.00', NULL, NULL),
(174, 2, 43, 0, '1395.00', '2715.00', NULL, NULL),
(175, 3, 43, 0, '1395.00', '2715.00', NULL, NULL),
(176, 4, 43, 0, '1395.00', '2715.00', NULL, NULL),
(177, 1, 44, 2, '1345.00', '2690.00', '1340.00', '2580.00'),
(178, 2, 44, 0, '1345.00', '2690.00', '1340.00', '2580.00'),
(179, 3, 44, 0, '1345.00', '2690.00', '1340.00', '2580.00'),
(180, 4, 44, 0, '1345.00', '2690.00', '1340.00', '2580.00'),
(181, 1, 45, 0, '1345.00', '2690.00', '0.00', '0.00'),
(182, 2, 45, 0, '1345.00', '2690.00', '0.00', '0.00'),
(183, 3, 45, 0, '1345.00', '2690.00', '0.00', '0.00'),
(184, 4, 45, 0, '1345.00', '2690.00', '0.00', '0.00'),
(185, 1, 46, 0, '1345.00', '2690.00', '0.00', '0.00'),
(186, 2, 46, 0, '1345.00', '2690.00', '0.00', '0.00'),
(187, 3, 46, 0, '1345.00', '2690.00', '0.00', '0.00'),
(188, 4, 46, 0, '1345.00', '2690.00', '0.00', '0.00'),
(189, 1, 47, 0, '1345.00', '2590.00', '0.00', '0.00'),
(190, 2, 47, 0, '1345.00', '2590.00', '0.00', '0.00'),
(191, 3, 47, 0, '1345.00', '2590.00', '0.00', '0.00'),
(192, 4, 47, 0, '1345.00', '2590.00', '0.00', '0.00'),
(193, 1, 48, 2, '1345.00', '2690.00', NULL, NULL),
(194, 2, 48, 1, '1345.00', '2690.00', NULL, NULL),
(195, 3, 48, 0, '1345.00', '2690.00', NULL, NULL),
(196, 4, 48, 0, '1345.00', '2690.00', NULL, NULL),
(197, 1, 49, 0, '1345.00', '2590.00', NULL, NULL),
(198, 2, 49, 0, '1345.00', '2590.00', NULL, NULL),
(199, 3, 49, 0, '1345.00', '2590.00', NULL, NULL),
(200, 4, 49, 0, '1345.00', '2590.00', NULL, NULL),
(201, 1, 50, 0, '1345.00', '2590.00', '0.00', '0.00'),
(202, 2, 50, 0, '1345.00', '2590.00', '0.00', '0.00'),
(203, 3, 50, 0, '1345.00', '2590.00', '0.00', '0.00'),
(204, 4, 50, 0, '1345.00', '2590.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_cities`
--

CREATE TABLE `itinerary_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_cities`
--

INSERT INTO `itinerary_cities` (`id`, `name`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Split', 1, 1, 1, NULL, '2020-01-20 18:37:34', '2020-01-20 18:37:34'),
(2, 'Lefkada', 1, 5, 5, NULL, '2020-01-20 18:37:40', '2020-01-20 18:37:40'),
(3, 'Dubrovnik', 1, 1, 1, NULL, '2020-01-20 18:39:10', '2020-01-20 18:39:10'),
(4, 'Tortola', 1, 1, 1, NULL, '2020-01-20 18:45:16', '2020-01-20 18:45:16'),
(5, 'Athens', 1, 5, 5, NULL, '2020-01-20 18:49:28', '2020-01-20 18:49:28'),
(6, 'Mykonos', 1, 1, 1, NULL, '2020-01-20 19:52:30', '2020-01-20 19:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_countries`
--

CREATE TABLE `itinerary_countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_displayed` tinyint(4) NOT NULL DEFAULT '1',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_countries`
--

INSERT INTO `itinerary_countries` (`id`, `slug`, `name`, `is_displayed`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'croatia', 'Croatia', 1, 1, 1, 1, NULL, '2020-01-20 18:34:21', '2020-01-20 18:34:21'),
(2, 'greece', 'Greece', 1, 1, 5, 1, NULL, '2020-01-20 18:34:35', '2020-03-11 04:28:01'),
(3, 'britishvirginislands', 'British Virgin Islands', 1, 1, 1, 1, NULL, '2020-01-20 18:35:04', '2020-01-20 18:35:04'),
(4, 'thailand', 'Thailand', 0, 1, 5, 5, NULL, '2020-01-20 18:35:24', '2020-01-20 18:35:24'),
(5, 'fiji', 'Fiji', 0, 1, 1, 1, NULL, '2020-01-20 18:35:26', '2020-01-20 18:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_country_media`
--

CREATE TABLE `itinerary_country_media` (
  `itinerary_country_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_country_media`
--

INSERT INTO `itinerary_country_media` (`itinerary_country_id`, `media_id`) VALUES
(1, 54),
(1, 53),
(1, 52),
(2, 57),
(2, 56),
(2, 55),
(3, 58),
(3, 59),
(3, 60);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_crews`
--

CREATE TABLE `itinerary_crews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itinerary_id` bigint(20) UNSIGNED NOT NULL,
  `crew_type_id` bigint(20) UNSIGNED NOT NULL,
  `boat_crew_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_crews`
--

INSERT INTO `itinerary_crews` (`id`, `itinerary_id`, `crew_type_id`, `boat_crew_id`) VALUES
(1, 3, 1, 2),
(2, 3, 2, 1),
(5, 1, 1, 2),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_exclusions`
--

CREATE TABLE `itinerary_exclusions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itinerary_id` bigint(20) UNSIGNED NOT NULL,
  `exclusion_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_exclusions`
--

INSERT INTO `itinerary_exclusions` (`id`, `itinerary_id`, `exclusion_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 1),
(7, 2, 2),
(8, 2, 3),
(9, 2, 4),
(10, 2, 5),
(11, 3, 1),
(12, 3, 2),
(13, 3, 3),
(14, 3, 4),
(15, 3, 5),
(16, 4, 1),
(17, 4, 2),
(18, 4, 3),
(19, 4, 4),
(20, 4, 5),
(21, 5, 1),
(22, 5, 2),
(23, 5, 3),
(24, 5, 4),
(25, 5, 5),
(26, 6, 1),
(27, 6, 2),
(28, 6, 3),
(29, 6, 4),
(30, 6, 5),
(31, 7, 1),
(32, 7, 2),
(33, 7, 3),
(34, 7, 4),
(35, 7, 5),
(36, 8, 1),
(37, 8, 2),
(38, 8, 3),
(39, 8, 4),
(40, 8, 5),
(41, 9, 1),
(42, 9, 2),
(43, 9, 3),
(44, 9, 4),
(45, 9, 5),
(46, 10, 1),
(47, 10, 2),
(48, 10, 3),
(49, 10, 4),
(50, 10, 5),
(51, 11, 1),
(52, 11, 2),
(53, 11, 3),
(54, 11, 4),
(55, 11, 5),
(56, 12, 1),
(57, 12, 2),
(58, 12, 3),
(59, 12, 4),
(60, 12, 5),
(66, 14, 1),
(67, 14, 2),
(68, 14, 3),
(69, 14, 4),
(70, 14, 5),
(71, 15, 1),
(72, 15, 2),
(73, 15, 3),
(74, 15, 4),
(75, 15, 5),
(76, 16, 1),
(77, 16, 2),
(78, 16, 3),
(79, 16, 4),
(80, 16, 5),
(86, 18, 1),
(87, 18, 2),
(88, 18, 3),
(89, 18, 4),
(90, 18, 5),
(91, 19, 1),
(92, 19, 2),
(93, 19, 3),
(94, 19, 4),
(95, 19, 5),
(116, 24, 1),
(117, 24, 2),
(118, 24, 3),
(119, 24, 4),
(120, 24, 5),
(121, 25, 1),
(122, 25, 2),
(123, 25, 3),
(124, 25, 4),
(125, 25, 5),
(126, 26, 1),
(127, 26, 2),
(128, 26, 3),
(129, 26, 4),
(130, 26, 5),
(131, 27, 1),
(132, 27, 2),
(133, 27, 3),
(134, 27, 4),
(135, 27, 5),
(136, 28, 1),
(137, 28, 2),
(138, 28, 3),
(139, 28, 4),
(140, 28, 5),
(141, 29, 1),
(142, 29, 2),
(143, 29, 3),
(144, 29, 4),
(145, 29, 5),
(146, 30, 1),
(147, 30, 2),
(148, 30, 3),
(149, 30, 4),
(150, 30, 5),
(151, 31, 1),
(152, 31, 2),
(153, 31, 3),
(154, 31, 4),
(155, 31, 5),
(156, 32, 1),
(157, 32, 2),
(158, 32, 3),
(159, 32, 4),
(160, 32, 5),
(161, 33, 1),
(162, 33, 2),
(163, 33, 3),
(164, 33, 4),
(165, 33, 5),
(166, 34, 1),
(167, 34, 2),
(168, 34, 3),
(169, 34, 4),
(170, 34, 5),
(171, 35, 1),
(172, 35, 2),
(173, 35, 3),
(174, 35, 4),
(175, 35, 5),
(176, 36, 1),
(177, 36, 2),
(178, 36, 3),
(179, 36, 4),
(180, 36, 5),
(186, 38, 1),
(187, 38, 2),
(188, 38, 3),
(189, 38, 4),
(190, 38, 5),
(191, 39, 1),
(192, 39, 2),
(193, 39, 3),
(194, 39, 4),
(195, 39, 5),
(196, 40, 1),
(197, 40, 2),
(198, 40, 3),
(199, 40, 4),
(200, 40, 5),
(201, 41, 1),
(202, 41, 2),
(203, 41, 3),
(204, 41, 4),
(205, 41, 5),
(211, 43, 1),
(212, 43, 2),
(213, 43, 3),
(214, 43, 4),
(215, 43, 5),
(221, 45, 1),
(222, 45, 2),
(223, 45, 3),
(224, 45, 4),
(225, 45, 5),
(226, 46, 1),
(227, 46, 2),
(228, 46, 3),
(229, 46, 4),
(230, 46, 5),
(231, 47, 1),
(232, 47, 2),
(233, 47, 3),
(234, 47, 4),
(235, 47, 5),
(241, 49, 1),
(242, 49, 2),
(243, 49, 3),
(244, 49, 4),
(245, 49, 5),
(246, 50, 1),
(247, 50, 2),
(248, 50, 3),
(249, 50, 4),
(250, 50, 5);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_inclusions`
--

CREATE TABLE `itinerary_inclusions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itinerary_id` bigint(20) UNSIGNED NOT NULL,
  `inclusion_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_inclusions`
--

INSERT INTO `itinerary_inclusions` (`id`, `itinerary_id`, `inclusion_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 1),
(12, 2, 2),
(13, 2, 3),
(14, 2, 4),
(15, 2, 5),
(16, 2, 6),
(17, 2, 7),
(18, 2, 8),
(19, 2, 9),
(20, 2, 10),
(21, 3, 1),
(22, 3, 2),
(23, 3, 3),
(24, 3, 4),
(25, 3, 5),
(26, 3, 6),
(27, 3, 7),
(28, 3, 8),
(29, 3, 9),
(30, 3, 10),
(31, 4, 1),
(32, 4, 2),
(33, 4, 3),
(34, 4, 4),
(35, 4, 5),
(36, 4, 6),
(37, 4, 7),
(38, 4, 8),
(39, 4, 9),
(40, 4, 10),
(41, 5, 1),
(42, 5, 2),
(43, 5, 3),
(44, 5, 4),
(45, 5, 5),
(46, 5, 6),
(47, 5, 7),
(48, 5, 8),
(49, 5, 9),
(50, 5, 10),
(51, 6, 1),
(52, 6, 2),
(53, 6, 3),
(54, 6, 4),
(55, 6, 5),
(56, 6, 6),
(57, 6, 7),
(58, 6, 8),
(59, 6, 9),
(60, 6, 10),
(61, 7, 1),
(62, 7, 2),
(63, 7, 3),
(64, 7, 4),
(65, 7, 5),
(66, 7, 6),
(67, 7, 7),
(68, 7, 8),
(69, 7, 9),
(70, 7, 10),
(71, 8, 1),
(72, 8, 2),
(73, 8, 3),
(74, 8, 4),
(75, 8, 5),
(76, 8, 6),
(77, 8, 7),
(78, 8, 8),
(79, 8, 9),
(80, 8, 10),
(81, 9, 1),
(82, 9, 2),
(83, 9, 3),
(84, 9, 4),
(85, 9, 5),
(86, 9, 6),
(87, 9, 7),
(88, 9, 8),
(89, 9, 9),
(90, 9, 10),
(91, 10, 1),
(92, 10, 2),
(93, 10, 3),
(94, 10, 4),
(95, 10, 5),
(96, 10, 6),
(97, 10, 7),
(98, 10, 8),
(99, 10, 9),
(100, 10, 10),
(101, 11, 1),
(102, 11, 2),
(103, 11, 3),
(104, 11, 4),
(105, 11, 5),
(106, 11, 6),
(107, 11, 7),
(108, 11, 8),
(109, 11, 9),
(110, 11, 10),
(111, 12, 1),
(112, 12, 2),
(113, 12, 3),
(114, 12, 4),
(115, 12, 5),
(116, 12, 6),
(117, 12, 7),
(118, 12, 8),
(119, 12, 9),
(120, 12, 10),
(131, 14, 1),
(132, 14, 2),
(133, 14, 3),
(134, 14, 4),
(135, 14, 5),
(136, 14, 6),
(137, 14, 7),
(138, 14, 8),
(139, 14, 9),
(140, 14, 10),
(141, 15, 1),
(142, 15, 2),
(143, 15, 3),
(144, 15, 4),
(145, 15, 5),
(146, 15, 6),
(147, 15, 7),
(148, 15, 8),
(149, 15, 9),
(150, 15, 10),
(151, 16, 1),
(152, 16, 2),
(153, 16, 3),
(154, 16, 4),
(155, 16, 5),
(156, 16, 6),
(157, 16, 7),
(158, 16, 8),
(159, 16, 9),
(160, 16, 10),
(171, 18, 1),
(172, 18, 2),
(173, 18, 3),
(174, 18, 4),
(175, 18, 5),
(176, 18, 6),
(177, 18, 7),
(178, 18, 8),
(179, 18, 9),
(180, 18, 10),
(181, 19, 1),
(182, 19, 2),
(183, 19, 3),
(184, 19, 4),
(185, 19, 5),
(186, 19, 6),
(187, 19, 7),
(188, 19, 8),
(189, 19, 9),
(190, 19, 10),
(231, 24, 1),
(232, 24, 2),
(233, 24, 3),
(234, 24, 4),
(235, 24, 5),
(236, 24, 6),
(237, 24, 7),
(238, 24, 8),
(239, 24, 9),
(240, 24, 10),
(241, 25, 1),
(242, 25, 2),
(243, 25, 3),
(244, 25, 4),
(245, 25, 5),
(246, 25, 6),
(247, 25, 7),
(248, 25, 8),
(249, 25, 9),
(250, 25, 10),
(251, 26, 1),
(252, 26, 2),
(253, 26, 3),
(254, 26, 4),
(255, 26, 5),
(256, 26, 6),
(257, 26, 7),
(258, 26, 8),
(259, 26, 9),
(260, 26, 10),
(261, 27, 1),
(262, 27, 2),
(263, 27, 3),
(264, 27, 4),
(265, 27, 5),
(266, 27, 6),
(267, 27, 7),
(268, 27, 8),
(269, 27, 9),
(270, 27, 10),
(271, 28, 1),
(272, 28, 2),
(273, 28, 3),
(274, 28, 4),
(275, 28, 5),
(276, 28, 6),
(277, 28, 7),
(278, 28, 8),
(279, 28, 9),
(280, 28, 10),
(281, 29, 1),
(282, 29, 2),
(283, 29, 3),
(284, 29, 4),
(285, 29, 5),
(286, 29, 6),
(287, 29, 7),
(288, 29, 8),
(289, 29, 9),
(290, 29, 10),
(291, 30, 1),
(292, 30, 2),
(293, 30, 3),
(294, 30, 4),
(295, 30, 5),
(296, 30, 6),
(297, 30, 7),
(298, 30, 8),
(299, 30, 9),
(300, 30, 10),
(301, 31, 1),
(302, 31, 2),
(303, 31, 3),
(304, 31, 4),
(305, 31, 5),
(306, 31, 6),
(307, 31, 7),
(308, 31, 8),
(309, 31, 9),
(310, 31, 10),
(311, 32, 1),
(312, 32, 2),
(313, 32, 3),
(314, 32, 4),
(315, 32, 5),
(316, 32, 6),
(317, 32, 7),
(318, 32, 8),
(319, 32, 9),
(320, 32, 10),
(321, 33, 1),
(322, 33, 2),
(323, 33, 3),
(324, 33, 4),
(325, 33, 5),
(326, 33, 6),
(327, 33, 7),
(328, 33, 8),
(329, 33, 9),
(330, 33, 10),
(331, 34, 1),
(332, 34, 2),
(333, 34, 3),
(334, 34, 4),
(335, 34, 5),
(336, 34, 6),
(337, 34, 7),
(338, 34, 8),
(339, 34, 9),
(340, 34, 10),
(341, 35, 1),
(342, 35, 2),
(343, 35, 3),
(344, 35, 4),
(345, 35, 5),
(346, 35, 6),
(347, 35, 7),
(348, 35, 8),
(349, 35, 9),
(350, 35, 10),
(351, 36, 1),
(352, 36, 2),
(353, 36, 3),
(354, 36, 4),
(355, 36, 5),
(356, 36, 6),
(357, 36, 7),
(358, 36, 8),
(359, 36, 9),
(360, 36, 10),
(371, 38, 1),
(372, 38, 2),
(373, 38, 3),
(374, 38, 4),
(375, 38, 5),
(376, 38, 6),
(377, 38, 7),
(378, 38, 8),
(379, 38, 9),
(380, 38, 10),
(381, 39, 1),
(382, 39, 2),
(383, 39, 3),
(384, 39, 4),
(385, 39, 5),
(386, 39, 6),
(387, 39, 7),
(388, 39, 8),
(389, 39, 9),
(390, 39, 10),
(391, 40, 1),
(392, 40, 2),
(393, 40, 3),
(394, 40, 4),
(395, 40, 5),
(396, 40, 6),
(397, 40, 7),
(398, 40, 8),
(399, 40, 9),
(400, 40, 10),
(401, 41, 1),
(402, 41, 2),
(403, 41, 3),
(404, 41, 4),
(405, 41, 5),
(406, 41, 6),
(407, 41, 7),
(408, 41, 8),
(409, 41, 9),
(410, 41, 10),
(421, 43, 1),
(422, 43, 2),
(423, 43, 3),
(424, 43, 4),
(425, 43, 5),
(426, 43, 6),
(427, 43, 7),
(428, 43, 8),
(429, 43, 9),
(430, 43, 10),
(441, 45, 1),
(442, 45, 2),
(443, 45, 3),
(444, 45, 4),
(445, 45, 5),
(446, 45, 6),
(447, 45, 7),
(448, 45, 8),
(449, 45, 9),
(450, 45, 10),
(451, 46, 1),
(452, 46, 2),
(453, 46, 3),
(454, 46, 4),
(455, 46, 5),
(456, 46, 6),
(457, 46, 7),
(458, 46, 8),
(459, 46, 9),
(460, 46, 10),
(461, 47, 1),
(462, 47, 2),
(463, 47, 3),
(464, 47, 4),
(465, 47, 5),
(466, 47, 6),
(467, 47, 7),
(468, 47, 8),
(469, 47, 9),
(470, 47, 10),
(481, 49, 1),
(482, 49, 2),
(483, 49, 3),
(484, 49, 4),
(485, 49, 5),
(486, 49, 6),
(487, 49, 7),
(488, 49, 8),
(489, 49, 9),
(490, 49, 10),
(491, 50, 1),
(492, 50, 2),
(493, 50, 3),
(494, 50, 4),
(495, 50, 5),
(496, 50, 6),
(497, 50, 7),
(498, 50, 8),
(499, 50, 9),
(500, 50, 10);

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_media`
--

CREATE TABLE `itinerary_media` (
  `itinerary_id` bigint(20) UNSIGNED NOT NULL,
  `media_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_media`
--

INSERT INTO `itinerary_media` (`itinerary_id`, `media_id`) VALUES
(1, 43),
(2, 43),
(2, 42),
(2, 41),
(2, 40),
(2, 39),
(3, 43),
(3, 42),
(3, 41),
(3, 40),
(3, 39),
(4, 42),
(4, 41),
(4, 39),
(4, 40),
(5, 43),
(5, 42),
(5, 41),
(5, 40),
(5, 39),
(8, 43),
(8, 42),
(8, 41),
(8, 40),
(8, 39),
(15, 43),
(15, 42),
(15, 41),
(15, 40),
(15, 39),
(6, 43),
(6, 42),
(6, 41),
(6, 40),
(6, 39),
(7, 43),
(7, 42),
(7, 41),
(7, 40),
(7, 39),
(16, 43),
(16, 42),
(16, 41),
(16, 40),
(16, 39),
(9, 42),
(9, 43),
(9, 41),
(9, 40),
(9, 39),
(11, 43),
(11, 42),
(11, 41),
(11, 40),
(11, 39),
(13, 43),
(13, 42),
(13, 41),
(13, 40),
(13, 39),
(14, 43),
(14, 42),
(14, 41),
(14, 40),
(14, 39),
(10, 43),
(10, 42),
(10, 41),
(10, 40),
(10, 39),
(18, 43),
(18, 42),
(18, 41),
(18, 40),
(18, 39),
(19, 43),
(19, 42),
(19, 41),
(19, 40),
(19, 39),
(24, 43),
(24, 42),
(24, 41),
(24, 40),
(24, 39),
(12, 43),
(12, 42),
(12, 41),
(12, 40),
(12, 39),
(25, 43),
(25, 42),
(25, 41),
(25, 40),
(25, 39),
(27, 43),
(27, 42),
(27, 41),
(27, 40),
(27, 39),
(26, 43),
(26, 42),
(26, 41),
(26, 40),
(26, 39),
(28, 43),
(28, 42),
(28, 41),
(28, 40),
(28, 39),
(29, 43),
(29, 42),
(29, 41),
(29, 40),
(29, 39),
(30, 43),
(30, 42),
(31, 43),
(31, 42),
(31, 41),
(31, 40),
(31, 39),
(32, 43),
(32, 42),
(32, 41),
(32, 40),
(32, 39),
(33, 43),
(33, 42),
(33, 41),
(33, 40),
(33, 39),
(34, 43),
(34, 42),
(34, 41),
(34, 40),
(34, 39),
(35, 43),
(35, 42),
(35, 41),
(35, 40),
(35, 39),
(36, 40),
(36, 42),
(36, 43),
(36, 41),
(36, 39),
(37, 39),
(37, 43),
(37, 41),
(37, 42),
(37, 40),
(38, 39),
(38, 43),
(38, 41),
(38, 40),
(38, 42),
(39, 46),
(39, 47),
(39, 48),
(39, 49),
(39, 42),
(39, 43),
(40, 49),
(40, 48),
(40, 47),
(40, 46),
(40, 42),
(40, 43),
(41, 48),
(41, 49),
(41, 47),
(41, 46),
(41, 42),
(41, 43),
(42, 47),
(42, 48),
(42, 49),
(42, 46),
(42, 42),
(42, 43),
(43, 46),
(43, 47),
(43, 48),
(43, 49),
(43, 42),
(43, 43),
(44, 49),
(44, 48),
(44, 47),
(44, 46),
(44, 42),
(44, 43),
(45, 49),
(45, 48),
(45, 47),
(45, 46),
(45, 43),
(45, 42),
(46, 49),
(46, 48),
(46, 47),
(46, 42),
(46, 43),
(46, 46),
(47, 49),
(47, 48),
(47, 47),
(47, 46),
(47, 42),
(47, 43),
(48, 49),
(48, 48),
(48, 47),
(48, 46),
(48, 43),
(48, 42),
(49, 49),
(49, 48),
(49, 47),
(49, 46),
(49, 43),
(49, 42),
(50, 49),
(50, 48),
(50, 47),
(50, 46),
(50, 43),
(50, 42),
(30, 49),
(30, 48),
(30, 47),
(30, 46);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Blog', 1, 1, 1, NULL, '2020-03-17 07:26:08', '2020-03-17 07:26:08'),
(2, 'Yoga Instructor', 1, 1, 1, NULL, '2020-03-17 07:26:32', '2020-03-17 07:26:32'),
(3, 'Book Yoga Retreats', 1, 1, 1, '2020-03-24 01:28:11', '2020-03-17 07:27:14', '2020-03-24 01:28:11'),
(4, 'Facebook', 1, 1, 1, NULL, '2020-03-17 07:27:33', '2020-03-17 07:27:33'),
(5, 'Twitter', 1, 1, 1, NULL, '2020-03-17 07:27:41', '2020-03-17 07:27:41'),
(6, 'Instagram', 1, 1, 1, NULL, '2020-03-17 07:27:50', '2020-03-17 07:27:50'),
(7, 'Internet', 1, 1, 1, NULL, '2020-03-17 07:28:05', '2020-03-17 07:28:05'),
(8, 'Tour Radar', 1, 1, 1, '2020-03-24 01:28:28', '2020-03-17 07:29:01', '2020-03-24 01:28:28'),
(9, 'Yovada', 1, 1, 1, '2020-03-24 01:28:40', '2020-03-17 07:29:29', '2020-03-24 01:28:40'),
(10, 'Yoga Trade Jobs', 1, 1, 1, '2020-03-24 01:28:54', '2020-03-17 07:29:40', '2020-03-24 01:28:54'),
(11, 'National Geographic', 1, 1, 1, NULL, '2020-03-17 07:30:13', '2020-03-17 07:30:13'),
(12, 'Advertisement', 1, 1, 1, NULL, '2020-03-17 07:30:48', '2020-03-17 07:30:48'),
(13, 'Google', 1, 1, 1, NULL, '2020-03-17 07:31:18', '2020-03-17 07:31:18'),
(14, 'Ambassador', 1, 1, 1, NULL, '2020-03-19 03:44:01', '2020-03-19 03:44:01'),
(15, 'Antlos', 1, 1, 1, '2020-03-24 01:29:11', '2020-03-19 03:45:23', '2020-03-24 01:29:11'),
(16, 'Borrow A Boat', 1, 1, 1, '2020-03-24 01:29:20', '2020-03-19 03:46:29', '2020-03-24 01:29:20'),
(17, 'Koda Sail', 1, 1, 1, '2020-03-24 01:29:31', '2020-03-19 03:49:40', '2020-03-24 01:29:31'),
(18, 'Other', 1, 1, 1, NULL, '2020-03-19 04:20:48', '2020-03-19 04:20:48'),
(19, 'Other Search Engines', 1, 1, 1, NULL, '2020-03-19 04:21:06', '2020-03-19 04:21:06'),
(20, 'Referral', 1, 1, 1, NULL, '2020-03-19 04:22:03', '2020-03-19 04:22:03'),
(21, 'Referral - From Customer', 1, 1, 1, NULL, '2020-03-19 04:22:35', '2020-03-19 04:22:35'),
(22, 'Retreat Guru', 1, 1, 1, '2020-03-24 01:29:44', '2020-03-19 04:22:57', '2020-03-24 01:29:44'),
(23, 'SailGay', 1, 1, 1, '2020-03-24 01:29:56', '2020-03-19 04:23:14', '2020-03-24 01:29:56'),
(24, 'Soul Seed', 1, 1, 1, '2020-03-24 01:30:06', '2020-03-19 04:23:39', '2020-03-24 01:30:06'),
(25, 'The Globetrotter Guys', 1, 1, 1, '2020-03-24 01:30:20', '2020-03-19 04:23:58', '2020-03-24 01:30:20'),
(26, 'Travel Agent', 1, 1, 1, NULL, '2020-03-19 04:24:19', '2020-03-19 04:24:19'),
(27, 'Travel Website', 1, 1, 1, NULL, '2020-03-19 04:24:41', '2020-03-19 04:24:41'),
(28, 'Trip Advisor', 1, 1, 1, NULL, '2020-03-19 04:24:56', '2020-03-19 04:24:56'),
(29, 'Two Bad Tourists', 1, 1, 1, '2020-03-24 01:30:36', '2020-03-19 04:25:16', '2020-03-24 01:30:36'),
(30, 'Wavy', 1, 1, 1, '2020-03-24 01:30:51', '2020-03-19 04:25:36', '2020-03-24 01:30:51'),
(31, 'Website', 1, 1, 1, NULL, '2020-03-19 04:25:50', '2020-03-19 04:25:50'),
(32, 'Word of Mouth', 1, 1, 1, NULL, '2020-03-19 04:26:17', '2020-03-19 04:26:17');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `type`, `extension`, `batch_code`, `original_file_name`, `new_file_name`, `full_path`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'png', '93600120d706326b22264e804a90a839', 'photo.png', '239885a115a6b61c868309941e18278d.png', 'https://backend.mshbookingengine.com/media/239885a115a6b61c868309941e18278d.png', 1, 1, 1, NULL, '2020-03-03 04:50:06', '2020-03-03 04:50:06'),
(2, 1, 'jpg', '2b0792698b9a37b8a98a3bbec4cffc68', 'WIN_20200210_12_49_25_Pro.jpg', 'ff3c0227ab33813f26d71fe54cffa6ae.jpg', 'https://backend.mshbookingengine.com/media/ff3c0227ab33813f26d71fe54cffa6ae.jpg', 1, 1, 1, NULL, '2020-03-03 04:53:06', '2020-03-03 04:53:06'),
(3, 1, 'JPG', '7de482392a037cfaa547584b9de1219e', 'manenay.JPG', 'dd7c45e44cc19013f6303a5b0c97c5af.JPG', 'https://backend.mshbookingengine.com/media/dd7c45e44cc19013f6303a5b0c97c5af.JPG', 1, 1, 1, NULL, '2020-03-03 04:58:26', '2020-03-03 04:58:26'),
(4, 1, 'jpeg', 'b2d48bd1b7b536dca83ce2294cadd84a', 'c2.jpeg', '208f989f6b15ccb78f0a9934888bbcda.jpeg', 'https://backend.mshbookingengine.com/media/208f989f6b15ccb78f0a9934888bbcda.jpeg', 1, 1, 1, NULL, '2020-03-03 04:59:20', '2020-03-03 04:59:20'),
(5, 1, 'jpg', '5bd547cd802df4ddcd28818e0d74e612', 'Leilanie Paz.jpg', '4c8ee5b54969bd8577bf2b31a25fb6fa.jpg', 'https://backend.mshbookingengine.com/media/4c8ee5b54969bd8577bf2b31a25fb6fa.jpg', 1, 1, 1, NULL, '2020-03-03 05:01:25', '2020-03-03 05:01:25'),
(6, 1, 'jpg', 'fe504a62feb766c4f864a97240732046', 'pic2.jpg', '550aee2d708d967fc08744f1e675dcba.jpg', 'https://backend.mshbookingengine.com/media/550aee2d708d967fc08744f1e675dcba.jpg', 1, 1, 1, NULL, '2020-03-03 05:01:58', '2020-03-03 05:01:58'),
(7, 1, 'jpg', 'bc1728209497b6dbc0914887d1472705', 'IMG_4409.jpg', '0b8d736bc8ab3552b653e753256691ba.jpg', 'https://backend.mshbookingengine.com/media/0b8d736bc8ab3552b653e753256691ba.jpg', 1, 1, 1, NULL, '2020-03-03 05:02:41', '2020-03-03 05:02:41'),
(8, 1, 'jpg', '1280de3e74b3eabdae6af62e49b1f10b', 'IMG_5537 copy.jpg', 'cfe9c6aec80cdd300e2aabac2ed6c6f5.jpg', 'https://backend.mshbookingengine.com/media/cfe9c6aec80cdd300e2aabac2ed6c6f5.jpg', 1, 1, 1, NULL, '2020-03-03 05:02:42', '2020-03-03 05:02:42'),
(9, 1, 'jpg', '761991fc084c736dfdc2544d94e12878', 'amanda.jpg', 'ae09514be59ac58c14f98c62cc0386d9.jpg', 'https://backend.mshbookingengine.com/media/ae09514be59ac58c14f98c62cc0386d9.jpg', 1, 1, 1, NULL, '2020-03-03 05:04:51', '2020-03-03 05:04:51'),
(10, 1, 'JPG', '9c524004b015958f32621baf8bec20cb', 'Danielle Pitcher.JPG', '9c04c7198d611650daf550a78c11f794.JPG', 'https://backend.mshbookingengine.com/media/9c04c7198d611650daf550a78c11f794.JPG', 1, 1, 1, NULL, '2020-03-03 05:08:15', '2020-03-03 05:08:15'),
(11, 1, 'JPG', 'ce59bbc81f64fa1555c3f4cc5c307b3a', 'Rebekka Nerhovde.JPG', 'd155ea87eda98357b8bcef710b75030d.JPG', 'https://backend.mshbookingengine.com/media/d155ea87eda98357b8bcef710b75030d.JPG', 1, 1, 1, NULL, '2020-03-03 05:15:26', '2020-03-03 05:15:26'),
(12, 1, 'jpg', 'ff2dccedc8db132d527a8f761957f10c', 'Farah.jpg', '5f12dc4cbb7907a1e0e84c40eb4314fd.jpg', 'https://backend.mshbookingengine.com/media/5f12dc4cbb7907a1e0e84c40eb4314fd.jpg', 1, 1, 1, NULL, '2020-03-03 05:16:09', '2020-03-03 05:16:09'),
(13, 1, 'jpg', '33e8fe7f1bc4178ea11e9da237ffc319', 'Kamilla.jpg', '7c7912d2510081ebcdac3d7c6e126f38.jpg', 'https://backend.mshbookingengine.com/media/7c7912d2510081ebcdac3d7c6e126f38.jpg', 1, 1, 1, NULL, '2020-03-03 05:16:28', '2020-03-03 05:16:28'),
(14, 1, 'jpg', 'bd395861059523b68218bf4344f7d3dd', 'photo.jpg', '76adcff0b2358bae0983e815b0c1e1b1.jpg', 'https://backend.mshbookingengine.com/media/76adcff0b2358bae0983e815b0c1e1b1.jpg', 1, 1, 1, NULL, '2020-03-03 05:16:45', '2020-03-03 05:16:45'),
(15, 1, 'jpg', 'bbd0325afcc5943d0355d131447b5ddb', '81.jpg', '1361c85f73e19f00b0c946877b8ac38b.jpg', 'https://backend.mshbookingengine.com/media/1361c85f73e19f00b0c946877b8ac38b.jpg', 1, 1, 1, NULL, '2020-03-03 05:18:20', '2020-03-03 05:18:20'),
(16, 1, 'jpg', 'e43003bb8c9651e23135e60e8dbc4204', 'chrisse2.jpg', '57d402fbb2ed2c99494903276b2c272d.jpg', 'https://backend.mshbookingengine.com/media/57d402fbb2ed2c99494903276b2c272d.jpg', 1, 1, 1, NULL, '2020-03-03 05:19:00', '2020-03-03 05:19:00'),
(17, 1, 'JPG', '3f95466a598c23438f599d08dd9aa487', 'Maddie Lynch.JPG', 'c854e34d21d84353e23da25494b80b94.JPG', 'https://backend.mshbookingengine.com/media/c854e34d21d84353e23da25494b80b94.JPG', 1, 1, 1, NULL, '2020-03-03 05:27:53', '2020-03-03 05:27:53'),
(18, 1, 'jpg', '2512b1b7688fd7c56a6c5a416b12b6fe', 'Aft Cabin (Port).jpg', '8557ab35378eddc4f260e236a0b0e02e.jpg', 'https://backend.mshbookingengine.com/media/8557ab35378eddc4f260e236a0b0e02e.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:11', '2020-03-03 05:30:11'),
(19, 1, 'jpg', '5f4c196574f62ab5f36816ced5eb0643', 'Cockpit.jpg', 'b5c48a22dbf820bb5c1a6567d8996381.jpg', 'https://backend.mshbookingengine.com/media/b5c48a22dbf820bb5c1a6567d8996381.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(20, 1, 'jpg', '39f4023003c733124a157a9b30b52e9a', 'Aft Cabin (Starboard).jpg', '89e9b9ad3503b105b23f80dd6ba44b2d.jpg', 'https://backend.mshbookingengine.com/media/89e9b9ad3503b105b23f80dd6ba44b2d.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(21, 1, 'jpg', '09cffeadafb784a57e5bfabca0b41e12', 'Aft cabin.jpg', 'b72e8daa4058aec187108cd399dc0082.jpg', 'https://backend.mshbookingengine.com/media/b72e8daa4058aec187108cd399dc0082.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(22, 1, 'jpg', 'd1481cd37f8e173787ab81bd17ddb849', 'Forward cabin.jpg', 'c6bf8ea144463d9875b2c6d3ab702ba4.jpg', 'https://backend.mshbookingengine.com/media/c6bf8ea144463d9875b2c6d3ab702ba4.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(23, 1, 'jpg', '6f638b2f08f169658a0f6ddfb490cf17', 'Galley.jpg', '8f4f1294ae7cbff9e002c34c1dfdbe8d.jpg', 'https://backend.mshbookingengine.com/media/8f4f1294ae7cbff9e002c34c1dfdbe8d.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(24, 1, 'jpg', 'cb951d8437447bba24620978211ab264', 'Head.jpg', '6c3dfa64fe8b82e93027000716be718b.jpg', 'https://backend.mshbookingengine.com/media/6c3dfa64fe8b82e93027000716be718b.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(25, 1, 'jpg', '5e89e2543441b518026f28ade9d3c009', 'Cockpit 2.jpg', 'f550dbdb1a46986ba01c28dda37b0d04.jpg', 'https://backend.mshbookingengine.com/media/f550dbdb1a46986ba01c28dda37b0d04.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(26, 1, 'jpg', '6032319dc043bfad756333993e0a9988', 'Layout.jpg', 'e25a08aa9ee5375904f549f4f7d82e23.jpg', 'https://backend.mshbookingengine.com/media/e25a08aa9ee5375904f549f4f7d82e23.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(27, 1, 'jpg', 'b28616b737228ea9ca831206a8b0d3ca', 'Crew bunks.jpg', '0c38a71ab276eb81107bbb7be5c5ea94.jpg', 'https://backend.mshbookingengine.com/media/0c38a71ab276eb81107bbb7be5c5ea94.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(28, 1, 'jpg', 'b1fbcd36ae4101fb07b836165941996a', 'Helm station.jpg', '6d46ed6f394b6ac9e684c7340a6bc042.jpg', 'https://backend.mshbookingengine.com/media/6d46ed6f394b6ac9e684c7340a6bc042.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(29, 1, 'jpg', '275c2d77d666edceea335f54a53becca', 'Saloon.jpg', '367c86986639dd721abdfa7e7c4f7a21.jpg', 'https://backend.mshbookingengine.com/media/367c86986639dd721abdfa7e7c4f7a21.jpg', 1, 1, 1, NULL, '2020-03-03 05:30:12', '2020-03-03 05:30:12'),
(30, 1, 'jpg', 'ec1d37f66ac002c879532ce2fdb9d74f', 'Master Cabin.jpg', '2ee2c21d9ca8c24d34722a68dd3c941f.jpg', 'https://backend.mshbookingengine.com/media/2ee2c21d9ca8c24d34722a68dd3c941f.jpg', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(31, 1, 'jpg', 'a7753748807f1ab5035482208328e874', 'Outdoors.jpg', '69125b50213bd5c0e16d7aedbbe4291f.jpg', 'https://backend.mshbookingengine.com/media/69125b50213bd5c0e16d7aedbbe4291f.jpg', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(32, 1, 'jpg', '0317c94c282548c21f9dfb36cdd01aff', 'Forward cabin.jpg', '50d601e5cf1941048a2b94d8e83e4688.jpg', 'https://backend.mshbookingengine.com/media/50d601e5cf1941048a2b94d8e83e4688.jpg', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(33, 1, 'jpg', '0846815b45b2061eff12901c6a04fcda', 'Galley.jpg', '0f8d352bb63d4f023302f9ad2a28e84c.jpg', 'https://backend.mshbookingengine.com/media/0f8d352bb63d4f023302f9ad2a28e84c.jpg', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(34, 1, 'jpg', 'b90dbacd8bee4132c14f089ac19d8f87', 'Port quarter.jpg', '7dea7107b3e18adb88d868b0e7569f28.jpg', 'https://backend.mshbookingengine.com/media/7dea7107b3e18adb88d868b0e7569f28.jpg', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(35, 1, 'jpg', '3e3cc05dddbe65dcdfe3dacf9a351e15', 'Saloon.jpg', '14763354cdaeccc9fe99532c29b8842f.jpg', 'https://backend.mshbookingengine.com/media/14763354cdaeccc9fe99532c29b8842f.jpg', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(36, 1, 'jpg', '85370a9ac731d2efb1812cfd2f9d3b57', 'Saloon 2.jpg', '37997fe7998ed509422a2e162771b0a0.jpg', 'https://backend.mshbookingengine.com/media/37997fe7998ed509422a2e162771b0a0.jpg', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(37, 1, 'png', '6d9450125c8bab556453ad5e09a39bc9', 'Layout.png', 'f86777dc28ba91b9ecd9d912570f3000.png', 'https://backend.mshbookingengine.com/media/f86777dc28ba91b9ecd9d912570f3000.png', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(38, 1, 'png', '5506bfc0c4f3fbbf347a70efe947fe48', 'L42 Forward cabin.png', 'eaec1b1f335a3a2234ffcb17060bdfae.png', 'https://backend.mshbookingengine.com/media/eaec1b1f335a3a2234ffcb17060bdfae.png', 1, 1, 1, NULL, '2020-03-03 05:31:06', '2020-03-03 05:31:06'),
(39, 1, 'jpg', '803ebb5b59d741962ec85f94ebc4bebf', 'G0040414-1 (Large).jpg', '7bf02ebaf27df0e3ff7f42d7a6fb6a05.jpg', 'https://backend.mshbookingengine.com/media/7bf02ebaf27df0e3ff7f42d7a6fb6a05.jpg', 1, 1, 1, NULL, '2020-03-03 05:38:15', '2020-03-03 05:38:15'),
(40, 1, 'jpg', '3232fc2f7fdd34e49167d46e9828e48f', 'G0180021-1 (Large).jpg', '47aabba332a7d3d0b12c5764e2352bea.jpg', 'https://backend.mshbookingengine.com/media/47aabba332a7d3d0b12c5764e2352bea.jpg', 1, 1, 1, NULL, '2020-03-03 05:38:15', '2020-03-03 05:38:15'),
(41, 1, 'jpg', '4a759e54d58242e3855dc7e4f197fb92', 'G0021661-1 (Large).jpg', '9905ff1f9f92412bd092e3cbfea81f93.jpg', 'https://backend.mshbookingengine.com/media/9905ff1f9f92412bd092e3cbfea81f93.jpg', 1, 1, 1, NULL, '2020-03-03 05:38:15', '2020-03-03 05:38:15'),
(42, 1, 'jpg', 'ba5fbb6fda9c487d02abdfb964f13538', 'medsailingholidays-19 (Large).jpg', '9bfc8cbbed7b9cba80145e0b6434aaaa.jpg', 'https://backend.mshbookingengine.com/media/9bfc8cbbed7b9cba80145e0b6434aaaa.jpg', 1, 1, 1, NULL, '2020-03-03 05:38:15', '2020-03-03 05:38:15'),
(43, 1, 'jpg', '6fa15ac86071df9d78ff104369f7cddd', 'GOPR1619-1.jpg', '26d2269b439c0520b0ffed4fc641e526.jpg', 'https://backend.mshbookingengine.com/media/26d2269b439c0520b0ffed4fc641e526.jpg', 1, 1, 1, NULL, '2020-03-03 05:42:52', '2020-03-03 05:42:52'),
(44, 1, 'jpg', '40ed65a6eed42a7cff26a60831f9c198', 'photo.jpg', '8b3f60ab60fa7810f0a997f0714f3683.jpg', 'https://backend.mshbookingengine.com/media/8b3f60ab60fa7810f0a997f0714f3683.jpg', 1, 1, 1, NULL, '2020-03-03 07:54:07', '2020-03-03 07:54:07'),
(45, 1, 'jpg', 'e30f5d5c5185c8c54842e8c8454d2806', 'photo4.jpg', 'a7b2b546945237044956c2a1c8f7b1c3.jpg', 'https://backend.mshbookingengine.com/media/a7b2b546945237044956c2a1c8f7b1c3.jpg', 1, 1, 1, NULL, '2020-03-04 07:50:07', '2020-03-04 07:50:07'),
(46, 1, 'jpg', '431084587eceb8c51dde396e6b7b88fb', 'IMG-20190722-WA0023.jpg', '4b4a508fe52d457b438f9e0e79edc2d3.jpg', 'https://backend.mshbookingengine.com/media/4b4a508fe52d457b438f9e0e79edc2d3.jpg', 1, 1, 1, NULL, '2020-03-05 04:46:04', '2020-03-05 04:46:04'),
(47, 1, 'jpg', 'c97762f850923ffda95b8e2ab16a2207', 'IMG-20190713-WA0022.jpg', '873fd18fba3cc45a1c66ffbe52f1a6a8.jpg', 'https://backend.mshbookingengine.com/media/873fd18fba3cc45a1c66ffbe52f1a6a8.jpg', 1, 1, 1, NULL, '2020-03-05 04:46:05', '2020-03-05 04:46:05'),
(48, 1, 'jpg', '3e30edfd46dcbe2b7a77b01e0b5f88bb', 'IMG-20190816-WA0055.jpg', 'ad3b2437daf3d5060dbe0f88a3c581b2.jpg', 'https://backend.mshbookingengine.com/media/ad3b2437daf3d5060dbe0f88a3c581b2.jpg', 1, 1, 1, NULL, '2020-03-05 04:51:26', '2020-03-05 04:51:26'),
(49, 1, 'jpg', '09019e4d9b6409514ea3ba0b2d583121', 'IMG-20190828-WA0022.jpg', '7ad151437d6f1edba801eb633e45d1c0.jpg', 'https://backend.mshbookingengine.com/media/7ad151437d6f1edba801eb633e45d1c0.jpg', 1, 1, 1, NULL, '2020-03-05 04:51:26', '2020-03-05 04:51:26'),
(50, 1, 'jpg', '26da9977a624fdd4504871353cbccc3f', 'medsailingholidays-4.jpg', '2a0e789cdd8db4bb6b4e88b98d6ba4bf.jpg', 'https://backend.mshbookingengine.com/media/2a0e789cdd8db4bb6b4e88b98d6ba4bf.jpg', 1, 1, 1, NULL, '2020-03-11 04:17:08', '2020-03-11 04:17:08'),
(51, 1, 'jpg', 'c5467fa4f57153d906a29ca17ab6d3b2', 'medsailingholidays-4.jpg', '9640cf603043a940f80b4053b086cab3.jpg', 'https://backend.mshbookingengine.com/media/9640cf603043a940f80b4053b086cab3.jpg', 1, 1, 1, NULL, '2020-03-11 04:18:09', '2020-03-11 04:18:09'),
(52, 1, 'jpg', 'd0f472d5dd8ae4cd66f9d98df722862f', 'medsailingholidays-4.jpg', '27052101af37e41772614645076568e1.jpg', 'https://backend.mshbookingengine.com/media/27052101af37e41772614645076568e1.jpg', 1, 1, 1, NULL, '2020-03-11 04:18:51', '2020-03-11 04:18:51'),
(53, 1, 'jpg', '5569cf056ff218d276d3ecc61c6af42b', 'medsailingholidays-8.jpg', 'dbe23cefaa8e7cfbc6730efb95a5145f.jpg', 'https://backend.mshbookingengine.com/media/dbe23cefaa8e7cfbc6730efb95a5145f.jpg', 1, 1, 1, NULL, '2020-03-11 04:19:27', '2020-03-11 04:19:27'),
(54, 1, 'jpg', '6cbab3a23061a94fc00dd54a1b68dc75', 'medsailingholidays-15.jpg', 'e1492cdcb09d3a331747bc24117325f3.jpg', 'https://backend.mshbookingengine.com/media/e1492cdcb09d3a331747bc24117325f3.jpg', 1, 1, 1, NULL, '2020-03-11 04:20:31', '2020-03-11 04:20:31'),
(55, 1, 'JPG', '1c7da292ff133a36243acf9055f32458', 'IMG_5659.JPG', '7928ab728e84ef50f7489d43a96c04c9.JPG', 'https://backend.mshbookingengine.com/media/7928ab728e84ef50f7489d43a96c04c9.JPG', 1, 1, 1, NULL, '2020-03-11 04:23:29', '2020-03-11 04:23:29'),
(56, 1, 'jpg', 'a567de3229a75e9b00c550112283030d', 'Kefalonia.jpg', '9a7f73f041d8a1ad5ee8542829a82e4b.jpg', 'https://backend.mshbookingengine.com/media/9a7f73f041d8a1ad5ee8542829a82e4b.jpg', 1, 1, 1, NULL, '2020-03-11 04:26:14', '2020-03-11 04:26:14'),
(57, 1, 'jpg', 'ecf39914683873e23a321c15c26b67b2', '045_20190710-IMG_1758.jpg', 'eea8cd496a6160d56ed88e96b4e84b9f.jpg', 'https://backend.mshbookingengine.com/media/eea8cd496a6160d56ed88e96b4e84b9f.jpg', 1, 1, 1, NULL, '2020-03-11 04:27:42', '2020-03-11 04:27:42'),
(58, 1, 'jpg', '9f7c0f5b57bd7598ff60c146a83e77ac', 'BVI.jpg', '693a3677cb5f5576ef6259f00d966d38.jpg', 'https://backend.mshbookingengine.com/media/693a3677cb5f5576ef6259f00d966d38.jpg', 1, 1, 1, NULL, '2020-03-11 04:29:11', '2020-03-11 04:29:11'),
(59, 1, 'jpg', 'a4a667c4a4ce4c5f8554327441f38a7d', 'snorkeling.jpg', 'b216cd2002287c06e70c321763178add.jpg', 'https://backend.mshbookingengine.com/media/b216cd2002287c06e70c321763178add.jpg', 1, 1, 1, NULL, '2020-03-11 04:29:54', '2020-03-11 04:29:54'),
(60, 1, 'jpg', 'd7a327a259703c22b4b46c0383a7b0fb', 'Cooper Island.jpg', 'bbad5c1bb88eb66ecabb41a21160a708.jpg', 'https://backend.mshbookingengine.com/media/bbad5c1bb88eb66ecabb41a21160a708.jpg', 1, 1, 1, NULL, '2020-03-11 04:31:57', '2020-03-11 04:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_06_26_025326_create_system_routes_table', 1),
(9, '2019_06_26_030607_create_roles_table', 1),
(10, '2019_06_26_033918_create_system_route_metas_table', 1),
(11, '2019_06_26_045846_create_pivot_table_role_route', 1),
(12, '2019_07_04_031712_create_boat_types_table', 1),
(13, '2019_07_04_031901_create_itineraries_table', 1),
(14, '2019_07_04_032649_create_boat_models_table', 1),
(15, '2019_07_04_033036_create_boat_brands_table', 1),
(16, '2019_07_04_033633_create_cabin_types_table', 1),
(17, '2019_07_04_033818_create_itinerary_countries_table', 1),
(18, '2019_07_04_034308_create_city_ports_table', 1),
(19, '2019_07_04_034641_create_ambassador_itinerary_codes_table', 1),
(20, '2019_07_04_034653_create_boats_table', 1),
(21, '2019_07_04_034704_create_itinerary_crews_table', 1),
(22, '2019_07_04_034727_create_itinerary_inclusions_table', 1),
(23, '2019_07_04_034744_create_itinerary_exclusions_table', 1),
(24, '2019_07_04_034759_create_itinerary_add_ons_table', 1),
(25, '2019_07_04_034815_create_itinerary_cabins_table', 1),
(26, '2019_07_04_034833_create_bookings_table', 1),
(27, '2019_07_04_034846_create_payment_types_table', 1),
(28, '2019_07_04_034859_create_guests_table', 1),
(29, '2019_07_04_034922_create_booking_cabins_table', 1),
(30, '2019_07_04_034936_create_booking_add_ons_table', 1),
(31, '2019_07_04_034958_create_identification_card_types_table', 1),
(32, '2019_07_04_035031_create_boat_media_table', 1),
(33, '2019_07_04_035038_create_nationalities_table', 1),
(34, '2019_07_04_035147_create_guest_titles_table', 1),
(35, '2019_07_04_035546_create_boat_cabins_table', 1),
(36, '2019_07_04_035606_create_booking_referrals_table', 1),
(37, '2019_07_04_050417_create_boat_cabin_media_table', 1),
(38, '2019_07_04_051030_create_itinerary_cities_table', 1),
(39, '2019_07_04_051246_create_inclusions_table', 1),
(40, '2019_07_04_052842_create_crew_types_table', 1),
(41, '2019_07_05_042355_create_boat_crews_table', 1),
(42, '2019_07_05_043348_create_itinerary_brands_table', 1),
(43, '2019_07_05_043930_create_exclusions_table', 1),
(44, '2019_07_05_044253_create_ambassadors_table', 1),
(45, '2019_07_05_044833_create_add_ons_table', 1),
(46, '2019_07_23_024535_create_media_table', 1),
(47, '2019_10_23_033934_create_booking_invoices_table', 1),
(48, '2019_10_23_034033_create_booking_invoice_payments_table', 1),
(49, '2019_11_18_021207_create_general_settings_table', 1),
(50, '2020_01_28_051648_create_booking_cabin_discounts_table', 1),
(51, '2020_02_26_063358_create_itinerary_country_media_table', 1),
(52, '2020_02_28_070504_create_itinerary_media_table', 1),
(53, '2020_02_28_100753_create_ambassador_media_table', 1),
(54, '2020_03_10_032728_add_instructor_profile_to_ambassadors_table', 1),
(55, '2020_03_10_040158_add_description_to_cabin_types_table', 1),
(56, '2020_03_12_054057_create_table_diet_options', 2),
(57, '2020_03_12_064257_rename_diet_column_to_diet_id_on_guests_table', 3),
(58, '2020_03_12_064352_change_diet_id_column_type_to_big_integer_on_guests_table', 4),
(59, '2020_03_12_074531_create_gender_table', 5),
(60, '2020_03_12_080041_add_gender_id_on_guests_table', 6),
(61, '2020_03_12_085934_add_other_concerns_column_on_guest_table', 7),
(62, '2020_03_13_023501_create_lead_sources_table', 8),
(63, '2020_03_13_063628_add_lead_source_id_on_bookings_table', 9),
(64, '2020_03_19_032913_create_refunds_table', 10),
(65, '2020_03_19_033528_create_refund_details_table', 11),
(66, '2020_03_27_041609_add_available_qty_itinerary_add_ons_table', 12),
(67, '2020_03_31_024112_create_jobs_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `iso` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nice_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` int(10) UNSIGNED NOT NULL,
  `is_preferred` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nationalities`
--

INSERT INTO `nationalities` (`id`, `iso`, `description`, `nice_name`, `iso3`, `num_code`, `country_code`, `is_preferred`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', '4', 93, 0, 1, 0, 0, NULL, NULL, NULL),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', '8', 355, 0, 1, 0, 0, NULL, NULL, NULL),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', '12', 213, 0, 1, 0, 0, NULL, NULL, NULL),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', '16', 1684, 0, 1, 0, 0, NULL, NULL, NULL),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', '20', 376, 0, 1, 0, 0, NULL, NULL, NULL),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', '24', 244, 0, 1, 0, 0, NULL, NULL, NULL),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', '660', 1264, 0, 1, 0, 0, NULL, NULL, NULL),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', '', '', 0, 0, 1, 0, 0, NULL, NULL, NULL),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', '28', 1268, 0, 1, 0, 0, NULL, NULL, NULL),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', '32', 54, 0, 1, 0, 0, NULL, NULL, NULL),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', '51', 374, 0, 1, 0, 0, NULL, NULL, NULL),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', '533', 297, 0, 1, 0, 0, NULL, NULL, NULL),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', '36', 61, 1, 1, 0, 1, NULL, NULL, '2020-03-19 01:50:13'),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', '40', 43, 0, 1, 0, 0, NULL, NULL, NULL),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', '31', 994, 0, 1, 0, 0, NULL, NULL, NULL),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', '44', 1242, 0, 1, 0, 0, NULL, NULL, NULL),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', '48', 973, 0, 1, 0, 0, NULL, NULL, NULL),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', '50', 880, 0, 1, 0, 0, NULL, NULL, NULL),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', '52', 1246, 0, 1, 0, 0, NULL, NULL, NULL),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', '112', 375, 0, 1, 0, 0, NULL, NULL, NULL),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', '56', 32, 0, 1, 0, 0, NULL, NULL, NULL),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', '84', 501, 0, 1, 0, 0, NULL, NULL, NULL),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', '204', 229, 0, 1, 0, 0, NULL, NULL, NULL),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', '60', 1441, 0, 1, 0, 0, NULL, NULL, NULL),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', '64', 975, 0, 1, 0, 0, NULL, NULL, NULL),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', '68', 591, 0, 1, 0, 0, NULL, NULL, NULL),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', '70', 387, 0, 1, 0, 0, NULL, NULL, NULL),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', '72', 267, 0, 1, 0, 0, NULL, NULL, NULL),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', '', '', 0, 0, 1, 0, 0, NULL, NULL, NULL),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', '76', 55, 0, 1, 0, 0, NULL, NULL, NULL),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', '', '', 246, 0, 1, 0, 0, NULL, NULL, NULL),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', '96', 673, 0, 1, 0, 0, NULL, NULL, NULL),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', '100', 359, 0, 1, 0, 0, NULL, NULL, NULL),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', '854', 226, 0, 1, 0, 0, NULL, NULL, NULL),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', '108', 257, 0, 1, 0, 0, NULL, NULL, NULL),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', '116', 855, 0, 1, 0, 0, NULL, NULL, NULL),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', '120', 237, 0, 1, 0, 0, NULL, NULL, NULL),
(38, 'CA', 'CANADA', 'Canada', 'CAN', '124', 1, 1, 1, 0, 1, NULL, NULL, '2020-03-19 01:51:52'),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', '132', 238, 0, 1, 0, 0, NULL, NULL, NULL),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', '136', 1345, 0, 1, 0, 0, NULL, NULL, NULL),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', '140', 236, 0, 1, 0, 0, NULL, NULL, NULL),
(42, 'TD', 'CHAD', 'Chad', 'TCD', '148', 235, 0, 1, 0, 0, NULL, NULL, NULL),
(43, 'CL', 'CHILE', 'Chile', 'CHL', '152', 56, 0, 1, 0, 0, NULL, NULL, NULL),
(44, 'CN', 'CHINA', 'China', 'CHN', '156', 86, 0, 1, 0, 0, NULL, NULL, NULL),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', '', '', 61, 0, 1, 0, 0, NULL, NULL, NULL),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', '', '', 672, 0, 1, 0, 0, NULL, NULL, NULL),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', '170', 57, 0, 1, 0, 0, NULL, NULL, NULL),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', '174', 269, 0, 1, 0, 0, NULL, NULL, NULL),
(49, 'CG', 'CONGO', 'Congo', 'COG', '178', 242, 0, 1, 0, 0, NULL, NULL, NULL),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', '180', 242, 0, 1, 0, 0, NULL, NULL, NULL),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', '184', 682, 0, 1, 0, 0, NULL, NULL, NULL),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', '188', 506, 0, 1, 0, 0, NULL, NULL, NULL),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', '384', 225, 0, 1, 0, 0, NULL, NULL, NULL),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', '191', 385, 0, 1, 0, 0, NULL, NULL, NULL),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', '192', 53, 0, 1, 0, 0, NULL, NULL, NULL),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', '196', 357, 0, 1, 0, 0, NULL, NULL, NULL),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', '203', 420, 0, 1, 0, 0, NULL, NULL, NULL),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', '208', 45, 0, 1, 0, 0, NULL, NULL, NULL),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', '262', 253, 0, 1, 0, 0, NULL, NULL, NULL),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', '212', 1767, 0, 1, 0, 0, NULL, NULL, NULL),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', '214', 1809, 0, 1, 0, 0, NULL, NULL, NULL),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', '218', 593, 0, 1, 0, 0, NULL, NULL, NULL),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', '818', 20, 0, 1, 0, 0, NULL, NULL, NULL),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', '222', 503, 0, 1, 0, 0, NULL, NULL, NULL),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', '226', 240, 0, 1, 0, 0, NULL, NULL, NULL),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', '232', 291, 0, 1, 0, 0, NULL, NULL, NULL),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', '233', 372, 0, 1, 0, 0, NULL, NULL, NULL),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', '231', 251, 0, 1, 0, 0, NULL, NULL, NULL),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', '238', 500, 0, 1, 0, 0, NULL, NULL, NULL),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', '234', 298, 0, 1, 0, 0, NULL, NULL, NULL),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', '242', 679, 0, 1, 0, 0, NULL, NULL, NULL),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', '246', 358, 0, 1, 0, 0, NULL, NULL, NULL),
(73, 'FR', 'FRANCE', 'France', 'FRA', '250', 33, 0, 1, 0, 0, NULL, NULL, NULL),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', '254', 594, 0, 1, 0, 0, NULL, NULL, NULL),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', '258', 689, 0, 1, 0, 0, NULL, NULL, NULL),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', '', '', 0, 0, 1, 0, 0, NULL, NULL, NULL),
(77, 'GA', 'GABON', 'Gabon', 'GAB', '266', 241, 0, 1, 0, 0, NULL, NULL, NULL),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', '270', 220, 0, 1, 0, 0, NULL, NULL, NULL),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', '268', 995, 0, 1, 0, 0, NULL, NULL, NULL),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', '276', 49, 0, 1, 0, 0, NULL, NULL, NULL),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', '288', 233, 0, 1, 0, 0, NULL, NULL, NULL),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', '292', 350, 0, 1, 0, 0, NULL, NULL, NULL),
(83, 'GR', 'GREECE', 'Greece', 'GRC', '300', 30, 0, 1, 0, 0, NULL, NULL, NULL),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', '304', 299, 0, 1, 0, 0, NULL, NULL, NULL),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', '308', 1473, 0, 1, 0, 0, NULL, NULL, NULL),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', '312', 590, 0, 1, 0, 0, NULL, NULL, NULL),
(87, 'GU', 'GUAM', 'Guam', 'GUM', '316', 1671, 0, 1, 0, 0, NULL, NULL, NULL),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', '320', 502, 0, 1, 0, 0, NULL, NULL, NULL),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', '324', 224, 0, 1, 0, 0, NULL, NULL, NULL),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', '624', 245, 0, 1, 0, 0, NULL, NULL, NULL),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', '328', 592, 0, 1, 0, 0, NULL, NULL, NULL),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', '332', 509, 0, 1, 0, 0, NULL, NULL, NULL),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', '', '', 0, 0, 1, 0, 0, NULL, NULL, NULL),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', '336', 39, 0, 1, 0, 0, NULL, NULL, NULL),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', '340', 504, 0, 1, 0, 0, NULL, NULL, NULL),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', '344', 852, 0, 1, 0, 0, NULL, NULL, NULL),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', '348', 36, 0, 1, 0, 0, NULL, NULL, NULL),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', '352', 354, 0, 1, 0, 0, NULL, NULL, NULL),
(99, 'IN', 'INDIA', 'India', 'IND', '356', 91, 0, 1, 0, 0, NULL, NULL, NULL),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', '360', 62, 0, 1, 0, 0, NULL, NULL, NULL),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', '364', 98, 0, 1, 0, 0, NULL, NULL, NULL),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', '368', 964, 0, 1, 0, 0, NULL, NULL, NULL),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', '372', 353, 0, 1, 0, 0, NULL, NULL, NULL),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', '376', 972, 0, 1, 0, 0, NULL, NULL, NULL),
(105, 'IT', 'ITALY', 'Italy', 'ITA', '380', 39, 0, 1, 0, 0, NULL, NULL, NULL),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', '388', 1876, 0, 1, 0, 0, NULL, NULL, NULL),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', '392', 81, 0, 1, 0, 0, NULL, NULL, NULL),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', '400', 962, 0, 1, 0, 0, NULL, NULL, NULL),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', '398', 7, 0, 1, 0, 0, NULL, NULL, NULL),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', '404', 254, 0, 1, 0, 0, NULL, NULL, NULL),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', '296', 686, 0, 1, 0, 0, NULL, NULL, NULL),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', '408', 850, 0, 1, 0, 0, NULL, NULL, NULL),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', '410', 82, 0, 1, 0, 0, NULL, NULL, NULL),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', '414', 965, 0, 1, 0, 0, NULL, NULL, NULL),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', '417', 996, 0, 1, 0, 0, NULL, NULL, NULL),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', '418', 856, 0, 1, 0, 0, NULL, NULL, NULL),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', '428', 371, 0, 1, 0, 0, NULL, NULL, NULL),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', '422', 961, 0, 1, 0, 0, NULL, NULL, NULL),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', '426', 266, 0, 1, 0, 0, NULL, NULL, NULL),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', '430', 231, 0, 1, 0, 0, NULL, NULL, NULL),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', '434', 218, 0, 1, 0, 0, NULL, NULL, NULL),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', '438', 423, 0, 1, 0, 0, NULL, NULL, NULL),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', '440', 370, 0, 1, 0, 0, NULL, NULL, NULL),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', '442', 352, 0, 1, 0, 0, NULL, NULL, NULL),
(125, 'MO', 'MACAO', 'Macao', 'MAC', '446', 853, 0, 1, 0, 0, NULL, NULL, NULL),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', '807', 389, 0, 1, 0, 0, NULL, NULL, NULL),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', '450', 261, 0, 1, 0, 0, NULL, NULL, NULL),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', '454', 265, 0, 1, 0, 0, NULL, NULL, NULL),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', '458', 60, 0, 1, 0, 0, NULL, NULL, NULL),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', '462', 960, 0, 1, 0, 0, NULL, NULL, NULL),
(131, 'ML', 'MALI', 'Mali', 'MLI', '466', 223, 0, 1, 0, 0, NULL, NULL, NULL),
(132, 'MT', 'MALTA', 'Malta', 'MLT', '470', 356, 0, 1, 0, 0, NULL, NULL, NULL),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', '584', 692, 0, 1, 0, 0, NULL, NULL, NULL),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', '474', 596, 0, 1, 0, 0, NULL, NULL, NULL),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', '478', 222, 0, 1, 0, 0, NULL, NULL, NULL),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', '480', 230, 0, 1, 0, 0, NULL, NULL, NULL),
(137, 'YT', 'MAYOTTE', 'Mayotte', '', '', 269, 0, 1, 0, 0, NULL, NULL, NULL),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', '484', 52, 0, 1, 0, 0, NULL, NULL, NULL),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', '583', 691, 0, 1, 0, 0, NULL, NULL, NULL),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', '498', 373, 0, 1, 0, 0, NULL, NULL, NULL),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', '492', 377, 0, 1, 0, 0, NULL, NULL, NULL),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', '496', 976, 0, 1, 0, 0, NULL, NULL, NULL),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', '500', 1664, 0, 1, 0, 0, NULL, NULL, NULL),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', '504', 212, 0, 1, 0, 0, NULL, NULL, NULL),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', '508', 258, 0, 1, 0, 0, NULL, NULL, NULL),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', '104', 95, 0, 1, 0, 0, NULL, NULL, NULL),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', '516', 264, 0, 1, 0, 0, NULL, NULL, NULL),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', '520', 674, 0, 1, 0, 0, NULL, NULL, NULL),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', '524', 977, 0, 1, 0, 0, NULL, NULL, NULL),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', '528', 31, 0, 1, 0, 0, NULL, NULL, NULL),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', '530', 599, 0, 1, 0, 0, NULL, NULL, NULL),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', '540', 687, 0, 1, 0, 0, NULL, NULL, NULL),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', '554', 64, 1, 1, 0, 1, NULL, NULL, '2020-03-19 01:52:11'),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', '558', 505, 0, 1, 0, 0, NULL, NULL, NULL),
(155, 'NE', 'NIGER', 'Niger', 'NER', '562', 227, 0, 1, 0, 0, NULL, NULL, NULL),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', '566', 234, 0, 1, 0, 0, NULL, NULL, NULL),
(157, 'NU', 'NIUE', 'Niue', 'NIU', '570', 683, 0, 1, 0, 0, NULL, NULL, NULL),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', '574', 672, 0, 1, 0, 0, NULL, NULL, NULL),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', '580', 1670, 0, 1, 0, 0, NULL, NULL, NULL),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', '578', 47, 0, 1, 0, 0, NULL, NULL, NULL),
(161, 'OM', 'OMAN', 'Oman', 'OMN', '512', 968, 0, 1, 0, 0, NULL, NULL, NULL),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', '586', 92, 0, 1, 0, 0, NULL, NULL, NULL),
(163, 'PW', 'PALAU', 'Palau', 'PLW', '585', 680, 0, 1, 0, 0, NULL, NULL, NULL),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', '', '', 970, 0, 1, 0, 0, NULL, NULL, NULL),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', '591', 507, 0, 1, 0, 0, NULL, NULL, NULL),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', '598', 675, 0, 1, 0, 0, NULL, NULL, NULL),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', '600', 595, 0, 1, 0, 0, NULL, NULL, NULL),
(168, 'PE', 'PERU', 'Peru', 'PER', '604', 51, 0, 1, 0, 0, NULL, NULL, NULL),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', '608', 63, 0, 1, 0, 0, NULL, NULL, NULL),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', '612', 0, 0, 1, 0, 0, NULL, NULL, NULL),
(171, 'PL', 'POLAND', 'Poland', 'POL', '616', 48, 0, 1, 0, 0, NULL, NULL, NULL),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', '620', 351, 0, 1, 0, 0, NULL, NULL, NULL),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', '630', 1787, 0, 1, 0, 0, NULL, NULL, NULL),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', '634', 974, 0, 1, 0, 0, NULL, NULL, NULL),
(175, 'RE', 'REUNION', 'Reunion', 'REU', '638', 262, 0, 1, 0, 0, NULL, NULL, NULL),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', '642', 40, 0, 1, 0, 0, NULL, NULL, NULL),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', '643', 70, 0, 1, 0, 0, NULL, NULL, NULL),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', '646', 250, 0, 1, 0, 0, NULL, NULL, NULL),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', '654', 290, 0, 1, 0, 0, NULL, NULL, NULL),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', '659', 1869, 0, 1, 0, 0, NULL, NULL, NULL),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', '662', 1758, 0, 1, 0, 0, NULL, NULL, NULL),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', '666', 508, 0, 1, 0, 0, NULL, NULL, NULL),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', '670', 1784, 0, 1, 0, 0, NULL, NULL, NULL),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', '882', 684, 0, 1, 0, 0, NULL, NULL, NULL),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', '674', 378, 0, 1, 0, 0, NULL, NULL, NULL),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', '678', 239, 0, 1, 0, 0, NULL, NULL, NULL),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', '682', 966, 0, 1, 0, 0, NULL, NULL, NULL),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', '686', 221, 0, 1, 0, 0, NULL, NULL, NULL),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', '', '', 381, 0, 1, 0, 0, NULL, NULL, NULL),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', '690', 248, 0, 1, 0, 0, NULL, NULL, NULL),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', '694', 232, 0, 1, 0, 0, NULL, NULL, NULL),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', '702', 65, 0, 1, 0, 0, NULL, NULL, NULL),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', '703', 421, 0, 1, 0, 0, NULL, NULL, NULL),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', '705', 386, 0, 1, 0, 0, NULL, NULL, NULL),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', '90', 677, 0, 1, 0, 0, NULL, NULL, NULL),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', '706', 252, 0, 1, 0, 0, NULL, NULL, NULL),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', '710', 27, 0, 1, 0, 0, NULL, NULL, NULL),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', '', '', 0, 0, 1, 0, 0, NULL, NULL, NULL),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', '724', 34, 0, 1, 0, 0, NULL, NULL, NULL),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', '144', 94, 0, 1, 0, 0, NULL, NULL, NULL),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', '736', 249, 0, 1, 0, 0, NULL, NULL, NULL),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', '740', 597, 0, 1, 0, 0, NULL, NULL, NULL),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', '744', 47, 0, 1, 0, 0, NULL, NULL, NULL),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', '748', 268, 0, 1, 0, 0, NULL, NULL, NULL),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', '752', 46, 0, 1, 0, 0, NULL, NULL, NULL),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', '756', 41, 0, 1, 0, 0, NULL, NULL, NULL),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', '760', 963, 0, 1, 0, 0, NULL, NULL, NULL),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', '158', 886, 0, 1, 0, 0, NULL, NULL, NULL),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', '762', 992, 0, 1, 0, 0, NULL, NULL, NULL),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', '834', 255, 0, 1, 0, 0, NULL, NULL, NULL),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', '764', 66, 0, 1, 0, 0, NULL, NULL, NULL),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', '', '', 670, 0, 1, 0, 0, NULL, NULL, NULL),
(213, 'TG', 'TOGO', 'Togo', 'TGO', '768', 228, 0, 1, 0, 0, NULL, NULL, NULL),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', '772', 690, 0, 1, 0, 0, NULL, NULL, NULL),
(215, 'TO', 'TONGA', 'Tonga', 'TON', '776', 676, 0, 1, 0, 0, NULL, NULL, NULL),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', '780', 1868, 0, 1, 0, 0, NULL, NULL, NULL),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', '788', 216, 0, 1, 0, 0, NULL, NULL, NULL),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', '792', 90, 0, 1, 0, 0, NULL, NULL, NULL),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', '795', 7370, 0, 1, 0, 0, NULL, NULL, NULL),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', '796', 1649, 0, 1, 0, 0, NULL, NULL, NULL),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', '798', 688, 0, 1, 0, 0, NULL, NULL, NULL),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', '800', 256, 0, 1, 0, 0, NULL, NULL, NULL),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', '804', 380, 0, 1, 0, 0, NULL, NULL, NULL),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', '784', 971, 0, 1, 0, 0, NULL, NULL, NULL),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', '826', 44, 1, 1, 0, 1, NULL, NULL, '2020-03-19 01:49:19'),
(226, 'US', 'UNITED STATES', 'United States', 'USA', '840', 1, 1, 1, 0, 1, NULL, NULL, '2020-03-19 01:49:07'),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', '', '', 1, 0, 1, 0, 0, NULL, NULL, NULL),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', '858', 598, 0, 1, 0, 0, NULL, NULL, NULL),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', '860', 998, 0, 1, 0, 0, NULL, NULL, NULL),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', '548', 678, 0, 1, 0, 0, NULL, NULL, NULL),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', '862', 58, 0, 1, 0, 0, NULL, NULL, NULL),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', '704', 84, 0, 1, 0, 0, NULL, NULL, NULL),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', '92', 1284, 0, 1, 0, 0, NULL, NULL, NULL),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', '850', 1340, 0, 1, 0, 0, NULL, NULL, NULL),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', '876', 681, 0, 1, 0, 0, NULL, NULL, NULL),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', '732', 212, 0, 1, 0, 0, NULL, NULL, NULL),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', '887', 967, 0, 1, 0, 0, NULL, NULL, NULL),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', '894', 260, 0, 1, 0, 0, NULL, NULL, NULL),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', '716', 263, 0, 1, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00517b54ace673f46ecdbb61dee645d8ecb97973daf83f85b5fd8360f95e231b7cccff07a5877dfe', 1, 2, NULL, '[]', 0, '2020-03-19 01:40:48', '2020-03-19 01:40:48', '2021-03-19 02:40:48'),
('00ada8935b9a76f3caed757bc7e077e795c2b5de5dadcc3f2817c498ffb88b746388911cb66dff20', 1, 2, NULL, '[]', 0, '2020-03-19 02:14:55', '2020-03-19 02:14:55', '2021-03-19 03:14:55'),
('020cc924f122d0bfe3cb6e91b8ebfdbaffbd5da1efe7623b5c4541d63b2b65fb897d12a8f76cfad4', 1, 2, NULL, '[]', 0, '2020-03-12 04:21:03', '2020-03-12 04:21:03', '2021-03-12 05:21:03'),
('09b19ddfdcaf4cdb7de55e0a8b550059eb7a91c51e444cdf346d216a51451fcc910d7d11c9b73e55', 1, 2, NULL, '[]', 0, '2020-03-11 07:48:12', '2020-03-11 07:48:12', '2021-03-11 08:48:12'),
('0f9ae0fe092ce6f085375cb3a2b0ce35c2cef73cf700a3a0e3df6a3fd844d3e3c5ced1fb4534ddb6', 1, 2, NULL, '[]', 0, '2020-03-20 01:40:39', '2020-03-20 01:40:39', '2021-03-20 02:40:39'),
('1214f4b98fce61f760433c0f85327b1839a481d5879399b891067560dd71f0e2967b16ee4aeed751', 1, 2, NULL, '[]', 0, '2020-03-17 03:02:34', '2020-03-17 03:02:34', '2021-03-17 04:02:34'),
('1222730acdaf01c6e60c88926bedb20f05e394abf2139cefa262a410c680226f24a4dfd0e86f62b6', 1, 2, NULL, '[]', 0, '2020-03-19 05:12:23', '2020-03-19 05:12:23', '2021-03-19 06:12:23'),
('1245db69e727694e1fc8cdcfcddb03342eb22c6d7bd35d057aa7ae9985b73b5b72aaaf8727bf7d62', 1, 2, NULL, '[]', 0, '2020-05-07 08:45:27', '2020-05-07 08:45:27', '2021-05-07 10:45:27'),
('130ab620dbf1ac1975abe0adebf39b51ca359d59634deaf8b5f354767801477052f11364e102dea3', 32, 1, 'authToken', '[]', 0, '2020-05-06 19:56:06', '2020-05-06 19:56:06', '2021-05-06 21:56:06'),
('1481d1afa944109be976489859a80fcfc719eb553e96c6bec470a2878253969d9a773af8d72d667b', 1, 2, NULL, '[]', 0, '2020-03-19 03:23:42', '2020-03-19 03:23:42', '2021-03-19 04:23:42'),
('17ad58c39f5a70a1cf14794a3a7d326bc702f384bb4f9f1f907eeb5534b51629dbfa91b254cf5953', 21, 1, 'authToken', '[]', 0, '2020-05-06 17:47:00', '2020-05-06 17:47:00', '2021-05-06 19:47:00'),
('183288c599c78ca3cbd4c401491d083a9bf60a4c951714860b373f0513f89223dcf78992fe0511df', 1, 2, NULL, '[]', 0, '2020-03-24 06:13:19', '2020-03-24 06:13:19', '2021-03-24 07:13:19'),
('18708d20f6247246090dbe2e55443d6eb3cd0ca1d7c7df7649b8a4bdabf2fed46d11f3e4a210aa42', 14, 1, 'authToken', '[]', 0, '2020-03-19 02:20:06', '2020-03-19 02:20:06', '2021-03-19 03:20:06'),
('1a9d06507a7f59f05ed5f068dfc46d75907d1d3eaba6fbb40a6720d1dc36ba089092ee8ee3dc2542', 11, 1, 'authToken', '[]', 0, '2020-03-12 01:55:43', '2020-03-12 01:55:43', '2021-03-12 02:55:43'),
('1ce5cb186c96bebe15456dce27fcdd7c39c7311e36e7ff285074b8cf73e3e8239c74fd45afd0dae0', 4, 2, NULL, '[]', 0, '2020-05-05 10:03:59', '2020-05-05 10:03:59', '2021-05-05 12:03:59'),
('1e8146d4f2813cedb157f2994e1d6f9fecb55d30bc16779cf43977ce447970b8dbe5d24d3b83285b', 1, 2, NULL, '[]', 0, '2020-04-06 08:55:43', '2020-04-06 08:55:43', '2021-04-06 10:55:43'),
('2242e1b98d0afb302ac489090a2a88c92837fda23afd9a84af2b2844b9ca0414336848cdfe318d56', 2, 2, NULL, '[]', 0, '2020-05-07 08:35:58', '2020-05-07 08:35:58', '2021-05-07 10:35:58'),
('2251e23e3cabce0e724c1c2c99db2732092049a955dfdab0713f1f80ca2eb2aa0efeb578effe2640', 1, 2, NULL, '[]', 0, '2020-03-27 00:44:06', '2020-03-27 00:44:06', '2021-03-27 01:44:06'),
('27138b0350697ab1e64d230d486492a241ee9e50303b194109bb7415c746d9dc5da41f8cfbfda134', 1, 2, NULL, '[]', 0, '2020-03-17 07:29:03', '2020-03-17 07:29:03', '2021-03-17 08:29:03'),
('29facf09f2a43c18dc69f67c1fe7dd34767355aaab736b4b7954bab6c71204c973c1a23cf2ae9d3b', 1, 2, NULL, '[]', 0, '2020-04-27 10:59:24', '2020-04-27 10:59:24', '2021-04-27 12:59:24'),
('2a932690cee33ad595284b2001dc4e3d7c335e5827aba2b58f9f3023e2b1183815fd69925d139363', 22, 2, NULL, '[]', 0, '2020-05-04 09:50:33', '2020-05-04 09:50:33', '2021-05-04 11:50:33'),
('2c510598280bd834ba5713a8732f4551202adb0cd68928c3fc6a01bae8d6a1154f54b3aa771087b2', 1, 2, NULL, '[]', 0, '2020-03-19 01:36:17', '2020-03-19 01:36:17', '2021-03-19 02:36:17'),
('2d978ef00da43786b942c092b23a4f40efa32b2527b6f2ed3699d2b783f5018b8e4761c33f090136', 24, 1, 'authToken', '[]', 0, '2020-05-06 18:25:30', '2020-05-06 18:25:30', '2021-05-06 20:25:30'),
('2db40cf811c7b98ed6d1730fd97f1628450897f3ae5692028c27f74deea7c08eb5dc324e58e6598b', 1, 2, NULL, '[]', 0, '2020-04-17 06:51:35', '2020-04-17 06:51:35', '2021-04-17 08:51:35'),
('2e0054263e932baf497aa71ef5d74ffa63e330ed089506ffa3e0374396d2def8c6d2f46fedb1edf4', 1, 2, NULL, '[]', 0, '2020-04-17 07:14:46', '2020-04-17 07:14:46', '2021-04-17 09:14:46'),
('2f9979bec99fb01d849b38614999be13a8ed3d3ce2cf587c9cef4bebfcd931372dea96566c3b4197', 1, 2, NULL, '[]', 0, '2020-04-27 09:48:23', '2020-04-27 09:48:23', '2021-04-27 11:48:23'),
('31caafdf947488078a71efb4b2d3355f505f9544329329aa667a6533e508b3737b53b0f2e5d1808e', 1, 2, NULL, '[]', 0, '2020-03-12 02:23:17', '2020-03-12 02:23:17', '2021-03-12 03:23:17'),
('331a2276bfd517ac755010fdd08805c46f566587075d64ae04ac28399e51e5b43febe0abb3e6e56c', 1, 2, NULL, '[]', 0, '2020-03-17 07:24:56', '2020-03-17 07:24:56', '2021-03-17 08:24:56'),
('34c88abb242760de9719f11b5ae09084009533daaccc472b7ed6654f74aad921a106e9de7e9686fd', 22, 1, 'authToken', '[]', 0, '2020-04-17 06:49:30', '2020-04-17 06:49:30', '2021-04-17 08:49:30'),
('3556c7dd27328522dea355672bb731f42f2c3bdd517ab26ff14259d0327eb1221806a0459f191514', 1, 2, NULL, '[]', 0, '2020-03-11 02:13:50', '2020-03-11 02:13:50', '2021-03-11 03:13:50'),
('3b8c0640b11ae6d2dbf1910a527db27f55953ac4118545823a1d83de80af700fa57339085dd5d8f7', 1, 2, NULL, '[]', 0, '2020-04-23 19:52:56', '2020-04-23 19:52:56', '2021-04-23 21:52:56'),
('3dd237e7c5daa2c6a6fbcb91657f5d7beaeadaebaefdb6a00d2677efb0ef077c82f1fb9644e632ce', 1, 2, NULL, '[]', 0, '2020-05-06 10:07:54', '2020-05-06 10:07:54', '2021-05-06 12:07:54'),
('3e09bc1b378d6d47ac6894dc42426c28169459bc5011a77d526a15165103f16dfca4d71e76c2f894', 1, 2, NULL, '[]', 0, '2020-03-23 23:07:44', '2020-03-23 23:07:44', '2021-03-24 00:07:44'),
('4267accfb4dae61585306043f9a4bf61a504e2d612a55d0524ce6a0c3389b5eb634184f0d0791a78', 1, 2, NULL, '[]', 0, '2020-05-07 15:20:13', '2020-05-07 15:20:13', '2021-05-07 17:20:13'),
('4311213144d1ec52f52539f7266dffa104f0c39b77d46974770c4ffa326d7ee1c795e4ae931c84f5', 1, 2, NULL, '[]', 0, '2020-05-11 07:38:30', '2020-05-11 07:38:30', '2021-05-11 09:38:30'),
('439915792e32b49f79e4e3e003468298cd249f3a7fe8d6b00a33902b21709b5f8ce9aa17ac4b1c89', 23, 2, NULL, '[]', 0, '2020-06-09 09:11:57', '2020-06-09 09:11:57', '2021-06-09 11:11:57'),
('4482ee1aa6cb03e38ae95273fc9573527b2c0da0b49671c0bfd23faef61ae9cfbc53c0a28dc42d46', 1, 2, NULL, '[]', 0, '2020-03-12 01:19:21', '2020-03-12 01:19:21', '2021-03-12 02:19:21'),
('46ba9c7053f80a56e90cebb64905a3a40527f91b1ff890a7e46b283a7d66db60948160c584219e39', 10, 1, 'authToken', '[]', 0, '2020-05-06 15:08:55', '2020-05-06 15:08:55', '2021-05-06 17:08:55'),
('4cf87e6991e2bb56c701ae006f7aed252502e9d568c5b25350f1e6a6b1e0cf2fd8829d0c64150853', 1, 2, NULL, '[]', 0, '2020-03-19 02:38:13', '2020-03-19 02:38:13', '2021-03-19 03:38:13'),
('4fbe3ed625d7314496542f13c5046eddaef81326a62dca91b9e99eed62a2850d7eb7a157d082e728', 1, 2, NULL, '[]', 0, '2020-03-20 01:35:34', '2020-03-20 01:35:34', '2021-03-20 02:35:34'),
('55bd8f515951968e26586c1c996429daa2071b0482f0968710aafe9d953538253fee5257cb0e6661', 9, 1, 'authToken', '[]', 0, '2020-03-11 23:21:13', '2020-03-11 23:21:13', '2021-03-12 00:21:13'),
('5b0959964c383d0bf32083be458bf214451b5b9e3923cf4aa2c4326b634bb9b960d90dd376e5f83d', 26, 1, 'authToken', '[]', 0, '2020-05-06 18:50:02', '2020-05-06 18:50:02', '2021-05-06 20:50:02'),
('5b23c1ce8cfbc50435623a46640c7f5ca2b6ddc20d6aa6f92367523b963f8de5953e5b4ba322b596', 1, 2, NULL, '[]', 0, '2020-03-17 06:48:56', '2020-03-17 06:48:56', '2021-03-17 07:48:56'),
('5cf1d4ff844cb8aa3ae1c1d9554b554e9c5c155bc5d8d9b7f0d8de4f0ed082258d2565d8ef4bc63a', 1, 2, NULL, '[]', 0, '2020-06-09 08:50:16', '2020-06-09 08:50:16', '2021-06-09 10:50:16'),
('5eefd009a9eee660801e2541aea256c7d95baeed818029db234e25b8377a6b52ea2d9e8e63dbcf87', 19, 1, 'authToken', '[]', 0, '2020-05-06 17:36:39', '2020-05-06 17:36:39', '2021-05-06 19:36:39'),
('5fe14ec650144a44eebd48b7ea6cdbac9e8c2c236aa56fac2453b54e93d1570381cccd3f5752fc97', 2, 2, NULL, '[]', 0, '2020-05-07 08:18:53', '2020-05-07 08:18:53', '2021-05-07 10:18:53'),
('60ccc4257f3b52c5c9c85e0835d41b96cae8f4fafdc70baa1165f811cd98b534b825d1c28b61c68c', 23, 1, 'authToken', '[]', 0, '2020-05-06 18:13:14', '2020-05-06 18:13:14', '2021-05-06 20:13:14'),
('65dc9810ef500fad4277e1639c7f8e89398a57f0b7f530f7c045b59d9c567d0e59271aca99856040', 1, 2, NULL, '[]', 0, '2020-04-17 07:42:46', '2020-04-17 07:42:46', '2021-04-17 09:42:46'),
('660065eb468f9278bd23f4dc649c310c023e6d505efc9320c9811ad4258b1a2020d05657ae41458a', 1, 2, NULL, '[]', 0, '2020-05-14 07:44:36', '2020-05-14 07:44:36', '2021-05-14 09:44:36'),
('66eb4283641d130ff8cc4e1f4e398cc9e91777161fe4c37ec86880b88289f916ec335e76754387b6', 31, 1, 'authToken', '[]', 0, '2020-05-06 19:47:03', '2020-05-06 19:47:03', '2021-05-06 21:47:03'),
('66fc9ef5614f864f08535e4aeb938f7a17913454f067effb949503e0090e429b86d3bb42fce39b65', 1, 2, NULL, '[]', 0, '2020-03-19 02:55:16', '2020-03-19 02:55:16', '2021-03-19 03:55:16'),
('6922680327620d8feb007bdaab03f17575174bfa1589866c5a129f1fdef7f8b4636828ba2d173891', 13, 1, 'authToken', '[]', 0, '2020-05-06 15:50:57', '2020-05-06 15:50:57', '2021-05-06 17:50:57'),
('69d0c5ecd5f987c71c8277b8285d53b5f51675eb9b3c40cf38e8d4b5b02233a82605b379afca8af5', 1, 2, NULL, '[]', 0, '2020-03-19 02:54:55', '2020-03-19 02:54:55', '2021-03-19 03:54:55'),
('69ea8907047a5534f6f7cfdfe15ffcc0fb134876d47c0df39590d3ce4fa420a1a3b1c4d47fea3422', 1, 2, NULL, '[]', 0, '2020-03-12 01:18:54', '2020-03-12 01:18:54', '2021-03-12 02:18:54'),
('6b8fa20d98447d681ced84f83c51eb4394212173ba2ddbf66b6007fa8f7de365ff528d0625a58ded', 1, 2, NULL, '[]', 0, '2020-04-23 19:49:15', '2020-04-23 19:49:15', '2021-04-23 21:49:15'),
('7086a18941c52bfabf8f2f172354f29e16e0dd87adbaff388530ed4c8df6ce485c4311fb90005791', 1, 2, NULL, '[]', 0, '2020-03-16 04:36:21', '2020-03-16 04:36:21', '2021-03-16 05:36:21'),
('71239c242d4d02d98f0a4b43c82f85d506a1ed49c3c31ea30cffbc032db5bb7b4c9b3cd367dddca0', 10, 1, 'authToken', '[]', 0, '2020-03-12 01:39:16', '2020-03-12 01:39:16', '2021-03-12 02:39:16'),
('74840e7e9c67e410dd5fd165e76c6ecef8f9a8a5836b64f68b6a6ad559b5b2aca2b8f7eb3b1de0a3', 1, 2, NULL, '[]', 0, '2020-03-24 01:23:06', '2020-03-24 01:23:06', '2021-03-24 02:23:06'),
('757305b7cbbfbff0e696c79c3428f4e58fa8f47376e80afb2b4e3ffb8b5fcfe7f5a30953ed43317c', 22, 1, 'authToken', '[]', 0, '2020-05-06 18:03:11', '2020-05-06 18:03:11', '2021-05-06 20:03:11'),
('7b1c49963d2f31666396efa6a141509aac40f6dd38341ada3d4ebb6b6f613b0d1ab8959bdcf964ad', 19, 1, 'authToken', '[]', 0, '2020-03-27 00:41:39', '2020-03-27 00:41:39', '2021-03-27 01:41:39'),
('7ca17ff1b25ff942217ad47dd074ea742152af27d36208e57993cfa9a8e588331ed89489d58a7a29', 33, 1, 'authToken', '[]', 0, '2020-05-06 20:03:38', '2020-05-06 20:03:38', '2021-05-06 22:03:38'),
('7e05b0959fd8013a564f44b24e46f12e309c02add7d027ab1ef412f1a2ff4db3974198100aa4df1a', 23, 2, NULL, '[]', 0, '2020-06-09 09:08:06', '2020-06-09 09:08:06', '2021-06-09 11:08:06'),
('8622e72f3f386c626bcf559c0b8f054cbc02260061b6063e382b5c45ce2ba64597829c58399c2883', 7, 1, 'authToken', '[]', 0, '2020-03-11 05:46:03', '2020-03-11 05:46:03', '2021-03-11 06:46:03'),
('88cd74d14e4a942b9982068e38f939aab1fed84e96b57fde44638cd494d6fdfdc422ea209e71e9e4', 11, 1, 'authToken', '[]', 0, '2020-05-06 15:23:38', '2020-05-06 15:23:38', '2021-05-06 17:23:38'),
('8a2b5943d3ffd173d1aa72fcc88217e19c93ed2e457189a17ed4c36a53cefa8d125432b1c6d83336', 30, 1, 'authToken', '[]', 0, '2020-05-06 19:40:32', '2020-05-06 19:40:32', '2021-05-06 21:40:32'),
('8aec6b1dd6a65f21db449b676e0dd72d40c7a6e760099b1a4a5e408cd109dc2763232bf39eabb24f', 2, 2, NULL, '[]', 0, '2020-05-07 08:35:07', '2020-05-07 08:35:07', '2021-05-07 10:35:07'),
('8b7a5643359d950e47af256c0273ef0560d09571716a49b1e61fca470d55fba8ee9577472ac3b956', 20, 1, 'authToken', '[]', 0, '2020-03-27 00:43:01', '2020-03-27 00:43:01', '2021-03-27 01:43:01'),
('8bce882ba63e10844d94711324fc05718f062a92ff420ef7f8ffcc1ebac4b222ac67fea29c7fb5e2', 6, 2, NULL, '[]', 0, '2020-06-09 09:02:54', '2020-06-09 09:02:54', '2021-06-09 11:02:54'),
('8c3bd1c828bd4677cda990d761930286fdc0efd24bd03f8ace8463ffd97b0c92e6a5c08164a5cada', 17, 1, 'authToken', '[]', 0, '2020-05-06 17:31:40', '2020-05-06 17:31:40', '2021-05-06 19:31:40'),
('8cee9137fbf7073dfc2e8c376767b0c07fe6ab9ea9780cd1c2493d6e46d5fe43c6be40e6ae7aeca8', 14, 2, NULL, '[]', 0, '2020-03-19 08:07:03', '2020-03-19 08:07:03', '2021-03-19 09:07:03'),
('8e1ad99bc2783c458fe20d167cf6040899b64a61ff62a8dead7c498ac28a766c5160de5922e26685', 9, 1, 'authToken', '[]', 0, '2020-05-06 11:18:42', '2020-05-06 11:18:42', '2021-05-06 13:18:42'),
('8fa6708bc62aeffc291e3a1336f1a13b59ec174b73ef0790428bdcebb44c95cd588e82324ff7ef73', 16, 1, 'authToken', '[]', 0, '2020-05-06 17:25:31', '2020-05-06 17:25:31', '2021-05-06 19:25:31'),
('921ed80932ea3e50b722fc77dfe94b72267d7ee3593a656da000cb58350e216ffaaaa8c19e891fce', 1, 2, NULL, '[]', 0, '2020-03-20 09:15:46', '2020-03-20 09:15:46', '2021-03-20 10:15:46'),
('92f2bb5389f9cf01554446465005c4d59b67f7e88b8711bfc5a0119522c13fa9b2710c4e7abd15f0', 14, 1, 'authToken', '[]', 0, '2020-05-06 16:57:52', '2020-05-06 16:57:52', '2021-05-06 18:57:52'),
('973a57575110e3ad04a278ee13aa32f41abefdf75eb157939c5757520676ec536a6e1ebc5b8d2a4e', 1, 2, NULL, '[]', 0, '2020-03-11 04:02:03', '2020-03-11 04:02:03', '2021-03-11 05:02:03'),
('983bab222ba3a3a4f2ccba7baf3f2804b369cbd906d944e5ca6b136cbdd0cd108b26e7f8d379e043', 8, 1, 'authToken', '[]', 0, '2020-03-11 06:01:37', '2020-03-11 06:01:37', '2021-03-11 07:01:37'),
('986d4879c8d02827affa5f4732c98539da71ef23a4d0a551497a550e663d4a8775d0212d9abdc213', 1, 2, NULL, '[]', 0, '2020-03-19 03:40:27', '2020-03-19 03:40:27', '2021-03-19 04:40:27'),
('98896f0bd68e20941617873941de5bde664ae41de9faa60c77fc9e7ba6f072b4d9cbde117b87debf', 1, 2, NULL, '[]', 0, '2020-03-20 01:35:02', '2020-03-20 01:35:02', '2021-03-20 02:35:02'),
('99ac30d572e5323fb338176e20242866edb860e381c89ca6fb16dafb95602828bee348a044b1530b', 22, 1, 'authToken', '[]', 0, '2020-04-03 14:12:24', '2020-04-03 14:12:24', '2021-04-03 16:12:24'),
('9a19ac31b404526b259177313cf079c037e1458dae21fb4ba9515d71ebbad65bfc70de8388ac0948', 1, 2, NULL, '[]', 0, '2020-03-11 07:42:41', '2020-03-11 07:42:41', '2021-03-11 08:42:41'),
('a031153c5074c19b9cdb7ed8a0439338576269d8d1489895ddae380b7c5be430396640530e9dde82', 1, 2, NULL, '[]', 0, '2020-04-06 08:42:51', '2020-04-06 08:42:51', '2021-04-06 10:42:51'),
('a1cd4b37eacbf2785907f77cd7a778609e89a6bc14d14b352d61bff5e9b42da8c77a63aa1f9f513e', 18, 1, 'authToken', '[]', 0, '2020-05-06 17:34:08', '2020-05-06 17:34:08', '2021-05-06 19:34:08'),
('a3a41a690e7c110fcc715bdc2c79b795c94c7b537888bad9d97ab01f60cdb4ce0a96de47f4d496a7', 1, 2, NULL, '[]', 0, '2020-03-23 02:32:25', '2020-03-23 02:32:25', '2021-03-23 03:32:25'),
('a727418f35d3e2d6df72d0ba2bd0fe05624f793b153b6b67a26d3465469223262bb745892c7587fa', 20, 1, 'authToken', '[]', 0, '2020-03-27 01:39:17', '2020-03-27 01:39:17', '2021-03-27 02:39:17'),
('a88e068fad055a4c2d4fa3ba0b7ba1b54668269498aa5da9ed6986cfeefd96ebf61d2c4542484607', 1, 2, NULL, '[]', 0, '2020-05-06 13:32:57', '2020-05-06 13:32:57', '2021-05-06 15:32:57'),
('aab2f669ef037cc0165bf1691cf7843d1b47aebc73155a326b073fde7188c9eee01db516f7e17bdf', 1, 2, NULL, '[]', 0, '2020-03-11 01:56:48', '2020-03-11 01:56:48', '2021-03-11 02:56:48'),
('adb5393180b43d6eb015e773ddd5dfb2070da01508cdccceef27312159244508b494efe4f166efac', 1, 2, NULL, '[]', 0, '2020-03-19 01:30:23', '2020-03-19 01:30:23', '2021-03-19 02:30:23'),
('add6070c208208caa377602eedab57b1e37afe00947ca9bc5c577e493522d4a3cf90cf9b2ffa4e23', 1, 2, NULL, '[]', 0, '2020-04-16 11:38:13', '2020-04-16 11:38:13', '2021-04-16 13:38:13'),
('ae71b996fa7b710ad7d7c8cb14e7eaf232b15e3a9ea2d04e3e6260627752d492416e443f1e68b0d5', 21, 1, 'authToken', '[]', 0, '2020-04-03 14:04:14', '2020-04-03 14:04:14', '2021-04-03 16:04:14'),
('aebc5d8937cbd2e83a3c9db9284b55178a2df30e203b3a8f7a7203f3864fb7d57128b40228902572', 34, 1, 'authToken', '[]', 0, '2020-05-06 20:19:23', '2020-05-06 20:19:23', '2021-05-06 22:19:23'),
('b2634e0b150686f1b7e35fbf6f1710f80b4f41e6bf520ee12ef43f4cadf4f637eed27f44305812a2', 6, 1, 'authToken', '[]', 0, '2020-05-06 10:43:29', '2020-05-06 10:43:29', '2021-05-06 12:43:29'),
('b4a147bd0b571b853353c00a89823c94d938a72c8c6a7a1efbd459ef15f07a5581c3dbbff91db905', 1, 2, NULL, '[]', 0, '2020-04-27 10:56:45', '2020-04-27 10:56:45', '2021-04-27 12:56:45'),
('b4a239ef96767ec786d67dcf21222f7d7bae3cba93a4d9f2a0d1e74a75a84d92a18f0f580906d79e', 20, 1, 'authToken', '[]', 0, '2020-05-06 17:43:02', '2020-05-06 17:43:02', '2021-05-06 19:43:02'),
('b4ea1c4642dfa3ad6c4d6a6d889dcd3531a0c7410f52b7f1b986984a861fcee4d54c6a5220bbb437', 1, 2, NULL, '[]', 0, '2020-05-04 09:51:22', '2020-05-04 09:51:22', '2021-05-04 11:51:22'),
('b54cb4c15cf7a9fb06b786dbd80bd7bea3156f5d6b67b88bb079de482c60fe69b052582d8dd2f246', 13, 1, 'authToken', '[]', 0, '2020-03-19 01:58:16', '2020-03-19 01:58:16', '2021-03-19 02:58:16'),
('b7113c55feb7a3f4889337cc78435de6fb90437666f36850affa5053c481ff5127ab3c24050f7227', 1, 2, NULL, '[]', 0, '2020-03-20 04:06:33', '2020-03-20 04:06:33', '2021-03-20 05:06:33'),
('b8807857155f3edd5405f7d528cbb6092bce04305d7ff83b5b1f733c5c6d3e50e490d1abfd4eaafe', 18, 1, 'authToken', '[]', 0, '2020-03-23 02:36:08', '2020-03-23 02:36:08', '2021-03-23 03:36:08'),
('b90e4e0f67e4a5c23043151690d2089922fd6111e3f78216f12fc07cbc5cc0435b16f36c01d997e9', 15, 1, 'authToken', '[]', 0, '2020-05-06 17:11:08', '2020-05-06 17:11:08', '2021-05-06 19:11:08'),
('b9abf933b25baa39b1565f3dc588f319ad6bd68ea7f35362b082cc1d52c7e3b051aaa378e763e6f1', 11, 2, NULL, '[]', 0, '2020-03-12 02:25:03', '2020-03-12 02:25:03', '2021-03-12 03:25:03'),
('c18cd3c15c2e7e107efdd05cef86fab2194e7254879b8149b001676795626e0ac9b0031aa2cb28ec', 1, 2, NULL, '[]', 0, '2020-03-19 01:41:33', '2020-03-19 01:41:33', '2021-03-19 02:41:33'),
('c1c860ba0f1341ca831982e07c254a88648b607676e8107a3e6e2c9854fd1d88565e3dd74b5867da', 1, 2, NULL, '[]', 0, '2020-03-19 01:43:35', '2020-03-19 01:43:35', '2021-03-19 02:43:35'),
('c2d6e5109f9f979f914d4feb5d3b88e63f89e081b4722a33f208536ba0e07171d0329544116c9c09', 1, 2, NULL, '[]', 0, '2020-03-11 02:14:35', '2020-03-11 02:14:35', '2021-03-11 03:14:35'),
('c353e5bff005a3af02f03df6567977b37db7c0969c4aa920ed1387b1ed59b43e8591ecbae650fa4b', 7, 1, 'authToken', '[]', 0, '2020-05-06 10:54:51', '2020-05-06 10:54:51', '2021-05-06 12:54:51'),
('c6b8d842c266709da9a769951458df6ea83fc2e9908e4b47801af8f821f91d18ae7179c80c9f3bea', 2, 2, NULL, '[]', 0, '2020-05-07 08:34:21', '2020-05-07 08:34:21', '2021-05-07 10:34:21'),
('c73ba50b6959b1c73bddc2a4d6e9a920dd1f428569909a16455307dcf5727c6a8cbb7ac82c7ef82e', 1, 2, NULL, '[]', 0, '2020-03-20 01:38:15', '2020-03-20 01:38:15', '2021-03-20 02:38:15'),
('c8ec69cecdc591de89115407a083950270e4b238d55017d9b58632c37802e3a5764493db28d8b393', 9, 2, NULL, '[]', 0, '2020-03-12 01:56:47', '2020-03-12 01:56:47', '2021-03-12 02:56:47'),
('ca638cf2d49dd1367bd8737afc42f07b966eb1c67e43a69fd4b9944ae6f417c42121c3e3b4056173', 11, 1, 'authToken', '[]', 0, '2020-03-12 02:18:50', '2020-03-12 02:18:50', '2021-03-12 03:18:50'),
('cb2726173cd29ccbf23e5212b661bc65511e2065da69df4bde10ce8ea263b5aacd1fb9713b022c2b', 12, 1, 'authToken', '[]', 0, '2020-05-06 15:39:54', '2020-05-06 15:39:54', '2021-05-06 17:39:54'),
('cf7a93a78a993c67ae367c73cdde9719b9858c1591c7e6c0b4f9f782e6fc085d288511f0851b1ab8', 25, 1, 'authToken', '[]', 0, '2020-05-06 18:43:55', '2020-05-06 18:43:55', '2021-05-06 20:43:55'),
('d1c31e7c7d99fcf8a436466970ff0f710677ce0744fd38891f6963fd5b9e3041c4cc9a390daead75', 1, 2, NULL, '[]', 0, '2020-03-19 02:40:14', '2020-03-19 02:40:14', '2021-03-19 03:40:14'),
('d2501bf883620f1cfb12f6ec38d1d0fe38fa45fa8b63023af898a862325e296f19bed34964bc9346', 1, 2, NULL, '[]', 0, '2020-03-19 02:14:59', '2020-03-19 02:14:59', '2021-03-19 03:14:59'),
('d78f0d1d0f117f03f5bfe75da5900c663d64317555146c292914cb3c0d489d0f3b04b125c2eadc30', 14, 2, NULL, '[]', 0, '2020-03-19 02:51:16', '2020-03-19 02:51:16', '2021-03-19 03:51:16'),
('d7c076549dd753f4fbaa2a4912ea667aba8f7d808c12412ba658b9707c82b0dca8d6f8736a599f73', 1, 2, NULL, '[]', 0, '2020-03-11 02:02:00', '2020-03-11 02:02:00', '2021-03-11 03:02:00'),
('d8efccd4514781d3ae3e0da1bf93bc588fb42420f270f4fa982ac47adfe3708c67d394aeb970279c', 23, 1, 'authToken', '[]', 0, '2020-04-17 07:42:33', '2020-04-17 07:42:33', '2021-04-17 09:42:33'),
('dca7395d24889a566bdf3fbe3ae1774a145000ef1573cd1cd598dcee9233035295755b3759b35ef1', 1, 2, NULL, '[]', 0, '2020-03-19 01:38:33', '2020-03-19 01:38:33', '2021-03-19 02:38:33'),
('e13f9c89a8b85db2d28eff7890e839337cbda74ec6147b87e43d10c3cf5c4fbda1d9f688766e737b', 11, 2, NULL, '[]', 0, '2020-03-12 02:23:49', '2020-03-12 02:23:49', '2021-03-12 03:23:49'),
('e29d545e9cf8c63e5149ad25cffca4d809660c68e40515f43a01ae0ba1c0923e2811690034f09620', 27, 1, 'authToken', '[]', 0, '2020-05-06 18:57:50', '2020-05-06 18:57:50', '2021-05-06 20:57:50'),
('e2ffaf1aaff44cad234202ef19250c642aef6ca0e39d6bd4d28fbf6d3676b6b4d08d55cd7f60c7c3', 1, 2, NULL, '[]', 0, '2020-05-06 10:18:51', '2020-05-06 10:18:51', '2021-05-06 12:18:51'),
('e5194a8b17d46a9dd1543510659c0d326f425e1b9e3399fd03367a00e87d1c71bdfff37f7d5fa93f', 1, 2, NULL, '[]', 0, '2020-03-12 03:00:57', '2020-03-12 03:00:57', '2021-03-12 04:00:57'),
('e77f43d11e224c19bff6d5202a4c039f56557cf966a457b9346550e8eacfb46590f1142de6db48b7', 19, 1, 'authToken', '[]', 0, '2020-03-27 00:40:49', '2020-03-27 00:40:49', '2021-03-27 01:40:49'),
('e7e1e68e83812e0312b2b3be793a763986cc82bc185cf0bf3e612dd570601b75a2d3f96f5e3b2773', 28, 1, 'authToken', '[]', 0, '2020-05-06 19:11:14', '2020-05-06 19:11:14', '2021-05-06 21:11:14'),
('e8164c453ce6f3aabd1f3952bd4ae043b37fe12abed30ef3a240dfb25d738561256e4120f0a43260', 1, 2, NULL, '[]', 0, '2020-03-12 01:18:08', '2020-03-12 01:18:08', '2021-03-12 02:18:08'),
('e9effb647beb60b717d6ca63f97c35958c8601ddc06ba98a57ccbba85878cd34cd3207c18853cb9d', 29, 1, 'authToken', '[]', 0, '2020-05-06 19:17:27', '2020-05-06 19:17:27', '2021-05-06 21:17:27'),
('ea058d6cde62f0ec6bb3fc2f606ae819da422ab38fbdaf4799cb3fccbc66a7c996a27916dfcf384a', 12, 1, 'authToken', '[]', 0, '2020-03-19 01:34:11', '2020-03-19 01:34:11', '2021-03-19 02:34:11'),
('ecbc21d931857e75cce5c36e231cd9dfe40156bda3e397d873c0740381cc4c0bf213bf33a40b7057', 1, 2, NULL, '[]', 0, '2020-03-11 04:12:04', '2020-03-11 04:12:04', '2021-03-11 05:12:04'),
('f34a30f73c3a309f45c8cba25dc4f65691afe5ae3a0cb5ead2182716805bece0c3766e2815f15022', 4, 2, NULL, '[]', 0, '2020-05-06 09:02:46', '2020-05-06 09:02:46', '2021-05-06 11:02:46'),
('f450f19eef88db2ca5599d7a7defe3e30d94e045eb2c60cba0295ebcf41deab6352b2a4649f927fc', 1, 2, NULL, '[]', 0, '2020-03-17 08:32:29', '2020-03-17 08:32:29', '2021-03-17 09:32:29'),
('f59b2ac3badc0de973d4e6ae54bd164f258fbd1ce90e94ad511ccf74a1cb9d28a844d408e441c087', 1, 2, NULL, '[]', 0, '2020-03-17 08:03:15', '2020-03-17 08:03:15', '2021-03-17 09:03:15'),
('f65b73f18b462c68a3450c039adb010b633cd0e68fb117286c2801ed57b43f74289bf5ab19f77061', 24, 1, 'authToken', '[]', 0, '2020-04-27 09:55:59', '2020-04-27 09:55:59', '2021-04-27 11:55:59'),
('fadba4f11ddf9e7374e82e157c12e4159f9b9265176d8a0068de5b8bb35039a3ae22e5138a9e016c', 8, 1, 'authToken', '[]', 0, '2020-05-06 11:13:15', '2020-05-06 11:13:15', '2021-05-06 13:13:15'),
('faeb61c1ac971e03667b47e1e3b88d5b571909b5ae96ed9c9eea510bfd8568c1893f3b02431c12e2', 6, 1, 'authToken', '[]', 0, '2020-03-11 05:25:24', '2020-03-11 05:25:24', '2021-03-11 06:25:24'),
('fc188c84b09c5e03c28e3ac9142ec544dde7e0171da7a4db523fde04c54e2019aceaeb7dbfd68ed0', 1, 2, NULL, '[]', 0, '2020-06-09 09:22:48', '2020-06-09 09:22:48', '2021-06-09 11:22:48'),
('febedf7baaa1788dc83fc147ce046901c5fbe3be079b6fdee8fb9205b42ada17124ae9ef7dca5ec0', 1, 2, NULL, '[]', 0, '2020-04-24 16:19:21', '2020-04-24 16:19:21', '2021-04-24 18:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '4E7b9veMrkNDTeta1axrjUirFyIw9LRYJ7Gh6N3n', 'http://localhost', 1, 0, 0, '2020-03-11 00:55:14', '2020-03-11 00:55:14'),
(2, NULL, 'Laravel Password Grant Client', 'HjAZPGgui21WgUtUV9DCyagEiMFkzXkBG75VQR0v', 'http://localhost', 0, 1, 0, '2020-03-11 00:55:14', '2020-03-11 00:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-03-11 00:55:14', '2020-03-11 00:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('018a76fd1cfd4fdb58bc341280d2c3cf139b85ea5ce11f6f3ce7a1777b6268218eea23fcbe2161e9', 'e13f9c89a8b85db2d28eff7890e839337cbda74ec6147b87e43d10c3cf5c4fbda1d9f688766e737b', 0, '2021-03-12 03:23:49'),
('024e737af4f34b7e3effcc026a7b043d4d6162caea1fd870e085732595e9c8f0ed18a51b0916e526', '98896f0bd68e20941617873941de5bde664ae41de9faa60c77fc9e7ba6f072b4d9cbde117b87debf', 0, '2021-03-20 02:35:02'),
('027182b461f6570d9e05abaa1af2b22e474ac96585b26e00b663cae4495b65532a2f6c4f533450a0', 'd2501bf883620f1cfb12f6ec38d1d0fe38fa45fa8b63023af898a862325e296f19bed34964bc9346', 0, '2021-03-19 03:14:59'),
('06009566bec7493796265378dd82453a5f05d18fc726f26185e9ab64539065686ba3b9a5062e2467', 'c8ec69cecdc591de89115407a083950270e4b238d55017d9b58632c37802e3a5764493db28d8b393', 0, '2021-03-12 02:56:47'),
('0820b1a1e4f4d4f37908cf3f05e92ef7718ed3ba2f05812c0f84b962fb8998909eff3a58d03ae3a9', 'b4a147bd0b571b853353c00a89823c94d938a72c8c6a7a1efbd459ef15f07a5581c3dbbff91db905', 0, '2021-04-27 12:56:45'),
('08d37745fc357dca801c53cee02cc20b03c179f314a0a44d2ab89404b381c3c2b7f7578b01f51dd0', 'febedf7baaa1788dc83fc147ce046901c5fbe3be079b6fdee8fb9205b42ada17124ae9ef7dca5ec0', 0, '2021-04-24 18:19:21'),
('0a0b4dc77182414978965450b55e88af4d43f2652d5ed4105e544355c3604703d72a6db6bc9ad694', 'c1c860ba0f1341ca831982e07c254a88648b607676e8107a3e6e2c9854fd1d88565e3dd74b5867da', 0, '2021-03-19 02:43:35'),
('133c3290b2aac1936f57f2fef32160d4d336118bb436bb76a5eb1ee8c56883822de4e1a8bcad38af', '9a19ac31b404526b259177313cf079c037e1458dae21fb4ba9515d71ebbad65bfc70de8388ac0948', 0, '2021-03-11 08:42:41'),
('181eb716ea7279ff45e58a988a3822cb07c66e0cce6cce53c3859a7e68e1dd5eb4d01d551ebe602e', '4fbe3ed625d7314496542f13c5046eddaef81326a62dca91b9e99eed62a2850d7eb7a157d082e728', 0, '2021-03-20 02:35:34'),
('18dc284a1a2b39a4015252d02bfba32c3b9087ea0958778fd0a6b450ed377d6922fd55670d8fd6de', '3dd237e7c5daa2c6a6fbcb91657f5d7beaeadaebaefdb6a00d2677efb0ef077c82f1fb9644e632ce', 0, '2021-05-06 12:07:54'),
('2130d42ffe9b14119a75b6bd0e3b48df024404afcb2d6e7509db1943b78c3b832f95b7ec1d5fdeba', 'e8164c453ce6f3aabd1f3952bd4ae043b37fe12abed30ef3a240dfb25d738561256e4120f0a43260', 0, '2021-03-12 02:18:08'),
('2197e2a5cc365502f9ec42882dbdda98745c418d7997488a7e4c15b6acd33c2187a6d5a9d444112d', 'd7c076549dd753f4fbaa2a4912ea667aba8f7d808c12412ba658b9707c82b0dca8d6f8736a599f73', 0, '2021-03-11 03:02:00'),
('2505d1398a3735eecb4ffff1dd3ca4fc70f4e3c30d05364cd5d633c5da51d1bb169c7b29d2a43fbd', '6b8fa20d98447d681ced84f83c51eb4394212173ba2ddbf66b6007fa8f7de365ff528d0625a58ded', 0, '2021-04-23 21:49:15'),
('2e1f6140b089656316bdf854fd94359df61d5aeeefbfdbd14b20c05d313881f713fe70bd1fbfd669', '3556c7dd27328522dea355672bb731f42f2c3bdd517ab26ff14259d0327eb1221806a0459f191514', 0, '2021-03-11 03:13:50'),
('2e712fb253d439aa42dd185544aab81d9dd01fb6079761c8a5344d8197ecbb26caea50a852028e24', '4311213144d1ec52f52539f7266dffa104f0c39b77d46974770c4ffa326d7ee1c795e4ae931c84f5', 0, '2021-05-11 09:38:30'),
('30384ac3ce732449ef844c9287f62ef760d9680eaf005371b6811c2e14351706cede3101307d4039', '1214f4b98fce61f760433c0f85327b1839a481d5879399b891067560dd71f0e2967b16ee4aeed751', 0, '2021-03-17 04:02:34'),
('308991b7b1d95d74f94b801d5fe9a2fd10ea324cd80a9e41077d1e2efe403e27eb3fc362758a63e4', '2a932690cee33ad595284b2001dc4e3d7c335e5827aba2b58f9f3023e2b1183815fd69925d139363', 0, '2021-05-04 11:50:33'),
('31a1b4a6ea4645d6a80cccf9459ca9dd194c4d7b24ca3ce51e31d3c484444ffdb40c8fbc62288a6c', '65dc9810ef500fad4277e1639c7f8e89398a57f0b7f530f7c045b59d9c567d0e59271aca99856040', 0, '2021-04-17 09:42:46'),
('32fe907cbddf1b0e90fcfca59b680568125e8541a8647c1c21c1952248b7a5188ff6e84c0c5a6c74', '2c510598280bd834ba5713a8732f4551202adb0cd68928c3fc6a01bae8d6a1154f54b3aa771087b2', 0, '2021-03-19 02:36:17'),
('35ea346b06dc27aaab9923cd971842ab373864e3ea4c55be12f76fc3d4a44053c12379697439b81c', '3e09bc1b378d6d47ac6894dc42426c28169459bc5011a77d526a15165103f16dfca4d71e76c2f894', 0, '2021-03-24 00:07:44'),
('3767772e7f5caaedee5333045102678d2b79c0aea305392e586457570af187539478eccce721de63', 'b7113c55feb7a3f4889337cc78435de6fb90437666f36850affa5053c481ff5127ab3c24050f7227', 0, '2021-03-20 05:06:33'),
('3b00ecbe618bab059966b57a92820b63260c12b6e7b95cab344968a35265bb14f98c9a446c3d9f5e', '8aec6b1dd6a65f21db449b676e0dd72d40c7a6e760099b1a4a5e408cd109dc2763232bf39eabb24f', 0, '2021-05-07 10:35:07'),
('3d064c14b0f0e0fc29800fcd6cbd56f4b61a308e950935f37017034db400a6ee47476cc5e67e384f', '4cf87e6991e2bb56c701ae006f7aed252502e9d568c5b25350f1e6a6b1e0cf2fd8829d0c64150853', 0, '2021-03-19 03:38:13'),
('4000e042f84f9ae2e98d8e1a0a777a4d7def8b89d9a2631ed140c63bb93996b8f78f2cf9c03cd052', 'c18cd3c15c2e7e107efdd05cef86fab2194e7254879b8149b001676795626e0ac9b0031aa2cb28ec', 0, '2021-03-19 02:41:33'),
('479e732ccbd7a09d697c430071d2f981da378dfb9ec570f07a0e4252a874777176418b9c34a79d0e', '183288c599c78ca3cbd4c401491d083a9bf60a4c951714860b373f0513f89223dcf78992fe0511df', 0, '2021-03-24 07:13:19'),
('47ab448951388cdb0e54b49539f6263e5d53c2d376a10496d557a6b6ae19916fdbc8815355a16a61', 'a88e068fad055a4c2d4fa3ba0b7ba1b54668269498aa5da9ed6986cfeefd96ebf61d2c4542484607', 0, '2021-05-06 15:32:57'),
('50a24c916905d1c137e2a743471b628f6434cf507cd1c8f834bc0ad4b6a44cb6b731e2e150be3174', '1ce5cb186c96bebe15456dce27fcdd7c39c7311e36e7ff285074b8cf73e3e8239c74fd45afd0dae0', 0, '2021-05-05 12:03:59'),
('542d0c45e051c663f919ee2d471ca0787eb0c4ad5b8cfebfdcc0e88d38348c9ceaac285626204b2f', '4482ee1aa6cb03e38ae95273fc9573527b2c0da0b49671c0bfd23faef61ae9cfbc53c0a28dc42d46', 0, '2021-03-12 02:19:21'),
('54db1dcb7b1cef9d83cfd1ccfaeea09420b1ad54b389967bb9cf6cfda9d8fda4ce43a598fb8bcbfd', 'c6b8d842c266709da9a769951458df6ea83fc2e9908e4b47801af8f821f91d18ae7179c80c9f3bea', 0, '2021-05-07 10:34:21'),
('571d332311bbc0a2f98e6af13d77aa7063af48f8bcd74684b9a5f4df4422fce6e5c2c6d53c9f2ec1', 'a031153c5074c19b9cdb7ed8a0439338576269d8d1489895ddae380b7c5be430396640530e9dde82', 0, '2021-04-06 10:42:51'),
('5ac274070ff2e2f6216b96ba6d42c5a3a03f4e963d5d00b8ab3a2582e6582d4d55547a2263d6b3aa', '3b8c0640b11ae6d2dbf1910a527db27f55953ac4118545823a1d83de80af700fa57339085dd5d8f7', 0, '2021-04-23 21:52:56'),
('5ca2ad666a70682d7759da53de72e8e91787bc80a084688d794cb9cee4a7d8ad13ee7dbed60c9d16', '5fe14ec650144a44eebd48b7ea6cdbac9e8c2c236aa56fac2453b54e93d1570381cccd3f5752fc97', 0, '2021-05-07 10:18:54'),
('5eb3749b204ca4594389d4af7c81df96b63ae09d6f6967ad522a04e46740683e0816ef4207eb3648', '29facf09f2a43c18dc69f67c1fe7dd34767355aaab736b4b7954bab6c71204c973c1a23cf2ae9d3b', 0, '2021-04-27 12:59:24'),
('60edec2cfdf6b88e1ef2e42ee5e53d06ef3e9ea792b5bc56df039a48794f732f3a3ac0eda602c3f9', 'aab2f669ef037cc0165bf1691cf7843d1b47aebc73155a326b073fde7188c9eee01db516f7e17bdf', 0, '2021-03-11 02:56:48'),
('6265c817703a90e13943c12672813483b414e0ca96a6aa7b5207b0013db96ff671f61e072735660d', 'adb5393180b43d6eb015e773ddd5dfb2070da01508cdccceef27312159244508b494efe4f166efac', 0, '2021-03-19 02:30:23'),
('654813e561500f8bde6e7b9c1820c0c5e0a939c90a95ae8ccbbb02bfaa779a27df185d1013c7e906', 'b9abf933b25baa39b1565f3dc588f319ad6bd68ea7f35362b082cc1d52c7e3b051aaa378e763e6f1', 0, '2021-03-12 03:25:03'),
('6b936299dae128786000a3c5705b0fd73ee3b1bf311f94b965c5a35e5335b48fc02b8bced94f8098', '2242e1b98d0afb302ac489090a2a88c92837fda23afd9a84af2b2844b9ca0414336848cdfe318d56', 0, '2021-05-07 10:35:58'),
('6c41c5bf60a85154ac71421ad85661c4967187b376b6b3116c2b8a597ee9ab45cf778276a3d28ff1', '2f9979bec99fb01d849b38614999be13a8ed3d3ce2cf587c9cef4bebfcd931372dea96566c3b4197', 0, '2021-04-27 11:48:23'),
('7494ce5fbb97a5c0471dcb5951527d9103e2aaedcf01f3bd6cc8660dcfd4e19e55c9fc2b84f3e257', '020cc924f122d0bfe3cb6e91b8ebfdbaffbd5da1efe7623b5c4541d63b2b65fb897d12a8f76cfad4', 0, '2021-03-12 05:21:03'),
('7904c32def0a952e2497a39550416a04057b52cfe65b1c0a76d4b4983386d34c45b2d1f3efd7f3c3', 'd78f0d1d0f117f03f5bfe75da5900c663d64317555146c292914cb3c0d489d0f3b04b125c2eadc30', 0, '2021-03-19 03:51:16'),
('79b22f57b940f946e5a6cffa08163e99b9fedf1c93f4a6e2a24b4af0d6ecbe60fe342431cbfaab0e', 'f59b2ac3badc0de973d4e6ae54bd164f258fbd1ce90e94ad511ccf74a1cb9d28a844d408e441c087', 0, '2021-03-17 09:03:15'),
('7b005f26c390f5b2ae41695e481f519be7f973bc7d8608a1efe5c184a6d9dadeb46343836e217b67', '331a2276bfd517ac755010fdd08805c46f566587075d64ae04ac28399e51e5b43febe0abb3e6e56c', 0, '2021-03-17 08:24:56'),
('7c33033a345880a7eee9664248c5a7047da16bad86f174703ff34d36b8572c325f10b1a45ff91a9f', 'ecbc21d931857e75cce5c36e231cd9dfe40156bda3e397d873c0740381cc4c0bf213bf33a40b7057', 0, '2021-03-11 05:12:04'),
('7d57c4bc1f9940d8a2fa89dfbdbc59b071fc471abade407f663c22d8a03ecf751df3f5a3bf877c19', '8cee9137fbf7073dfc2e8c376767b0c07fe6ab9ea9780cd1c2493d6e46d5fe43c6be40e6ae7aeca8', 0, '2021-03-19 09:07:03'),
('7f545ca08e05b8825fb81ad0254398cd28a5c624c1c2c1afab4f75a1409ffccc92d3a1dfa9a34eb0', 'f34a30f73c3a309f45c8cba25dc4f65691afe5ae3a0cb5ead2182716805bece0c3766e2815f15022', 0, '2021-05-06 11:02:46'),
('7fbadbed2088a34a79a72a1500ba212a5c64ebe7c9834551f381b83dec437dda29d6639dd9058b32', '4267accfb4dae61585306043f9a4bf61a504e2d612a55d0524ce6a0c3389b5eb634184f0d0791a78', 0, '2021-05-07 17:20:13'),
('83aae963274f373719092d00e3dc292219955b4d91a7b6a6902fc8c3a0fdab8718b3f1ee85f50431', '69ea8907047a5534f6f7cfdfe15ffcc0fb134876d47c0df39590d3ce4fa420a1a3b1c4d47fea3422', 0, '2021-03-12 02:18:54'),
('851c97bcdc0c4d4826613c9411f9b7a4224383f24e625f180655d5f3fd0a8eeb11e275c360d0935a', '986d4879c8d02827affa5f4732c98539da71ef23a4d0a551497a550e663d4a8775d0212d9abdc213', 0, '2021-03-19 04:40:27'),
('85bd6f4e3260b1f50d10330b19f7b1e120a031dd38843bb853477ad17c8bea936b5d0fcfa3482573', '1e8146d4f2813cedb157f2994e1d6f9fecb55d30bc16779cf43977ce447970b8dbe5d24d3b83285b', 0, '2021-04-06 10:55:43'),
('86fc832e2086f3a67a5255a65765167443e5d5c437610613748e92bc68539eab80aaa2d7ce390a03', 'd1c31e7c7d99fcf8a436466970ff0f710677ce0744fd38891f6963fd5b9e3041c4cc9a390daead75', 0, '2021-03-19 03:40:14'),
('905ab534ef48bd53c395d0d28927cc4a3cba07e240e397951b5a54be24555725cc155dac2d467450', '8bce882ba63e10844d94711324fc05718f062a92ff420ef7f8ffcc1ebac4b222ac67fea29c7fb5e2', 0, '2021-06-09 11:02:54'),
('909135d59b20437b81582dfb645d54a0f63645ce6c7e4a8f33d42d229d8f13b58ca15850c825b7ed', '1245db69e727694e1fc8cdcfcddb03342eb22c6d7bd35d057aa7ae9985b73b5b72aaaf8727bf7d62', 0, '2021-05-07 10:45:27'),
('927659ebddf76ed86ddcb091429842cda4d32c0f70d8ac0432e586f859e5f11337bc76e2cb09f84c', '660065eb468f9278bd23f4dc649c310c023e6d505efc9320c9811ad4258b1a2020d05657ae41458a', 0, '2021-05-14 09:44:36'),
('92805497c6114963549796210006a1e7b29e6e2a53f542b833fa93f3bf38fad6f5b786fb8326d078', '2251e23e3cabce0e724c1c2c99db2732092049a955dfdab0713f1f80ca2eb2aa0efeb578effe2640', 0, '2021-03-27 01:44:06'),
('9407755be83fadc89e8fba71ef0c258830891df800c2e85e7cf98dbed7e1348dd1cbab96bb7b69da', 'fc188c84b09c5e03c28e3ac9142ec544dde7e0171da7a4db523fde04c54e2019aceaeb7dbfd68ed0', 0, '2021-06-09 11:22:48'),
('99ccbc4e579138f928d313a6dffd1e5dce7c159356eab0ca4f5fbb68dc3d4be7dbf668b89efff679', 'b4ea1c4642dfa3ad6c4d6a6d889dcd3531a0c7410f52b7f1b986984a861fcee4d54c6a5220bbb437', 0, '2021-05-04 11:51:22'),
('a0622db55c5fe0243e79dec8f91e4e13b460d44e9abb4989ae1b6e349addfb02ff8f8104211533d8', '27138b0350697ab1e64d230d486492a241ee9e50303b194109bb7415c746d9dc5da41f8cfbfda134', 0, '2021-03-17 08:29:03'),
('a129c37d052016347290ad09fe0f5251f65f9f959e841173adb83f4a161046559f31565e373165bb', 'add6070c208208caa377602eedab57b1e37afe00947ca9bc5c577e493522d4a3cf90cf9b2ffa4e23', 0, '2021-04-16 13:38:13'),
('a957d29892eb324bbf0544de046d72b6a667f0f00c19acb165370eecea903d984a2d17b57099f5f8', 'dca7395d24889a566bdf3fbe3ae1774a145000ef1573cd1cd598dcee9233035295755b3759b35ef1', 0, '2021-03-19 02:38:33'),
('ab82d42aed30f3acf3a6f2c7fff2f85acc14575dfcf104fbdc648d8464a7e123be5609d6d8c665a7', '7e05b0959fd8013a564f44b24e46f12e309c02add7d027ab1ef412f1a2ff4db3974198100aa4df1a', 0, '2021-06-09 11:08:06'),
('ad21bc8f9947be82dcf4b5f88afc39fd08b9a355332575d09c4a7ffeef311668966e7a575ef615c0', 'c73ba50b6959b1c73bddc2a4d6e9a920dd1f428569909a16455307dcf5727c6a8cbb7ac82c7ef82e', 0, '2021-03-20 02:38:15'),
('ad694a9cefecc8397c5498f7f4b3069df1621ed34445ef9b8b38e9097dc9a331472d7890845675ed', '31caafdf947488078a71efb4b2d3355f505f9544329329aa667a6533e508b3737b53b0f2e5d1808e', 0, '2021-03-12 03:23:17'),
('afc81e0a6a3a8f7b91d4b93892062569e4561058d0fdd0ef43a1f42c114f04ad8ed2c5db18d16d2f', '66fc9ef5614f864f08535e4aeb938f7a17913454f067effb949503e0090e429b86d3bb42fce39b65', 0, '2021-03-19 03:55:16'),
('b2269418afc6fd9e4727c83dd17f8d2684c5cfbe5147e9066d768826c6278fccfdba8b95ca137253', '973a57575110e3ad04a278ee13aa32f41abefdf75eb157939c5757520676ec536a6e1ebc5b8d2a4e', 0, '2021-03-11 05:02:03'),
('c62e106f66866c3ab8724feeda7e67ff82ddf828b0a8de5eec2d023ddc89be71105f502f170587f7', 'e2ffaf1aaff44cad234202ef19250c642aef6ca0e39d6bd4d28fbf6d3676b6b4d08d55cd7f60c7c3', 0, '2021-05-06 12:18:51'),
('c9a12ea4df6956419c4f09bd2db0987d3b3800721c6cff778a4c55d8c2a3f80507e0ec17b071afb2', '0f9ae0fe092ce6f085375cb3a2b0ce35c2cef73cf700a3a0e3df6a3fd844d3e3c5ced1fb4534ddb6', 0, '2021-03-20 02:40:39'),
('ca38da32b332dd93c0e77631ad7dae69f14a6f34bfe0f5e1ba60b0feaaa3a937f6aa117d24d01192', '00517b54ace673f46ecdbb61dee645d8ecb97973daf83f85b5fd8360f95e231b7cccff07a5877dfe', 0, '2021-03-19 02:40:48'),
('ce51c31e85db2860a04e85084f188ce7e7ce6d861146a7c856e83410b13606ec42811d05863221d1', '7086a18941c52bfabf8f2f172354f29e16e0dd87adbaff388530ed4c8df6ce485c4311fb90005791', 0, '2021-03-16 05:36:21'),
('cf66ffdcb0deadee59c5051f9fdcb0ab7d9afb90b69b1fb6c4100cf39c30f28fafce86124c5434b6', '74840e7e9c67e410dd5fd165e76c6ecef8f9a8a5836b64f68b6a6ad559b5b2aca2b8f7eb3b1de0a3', 0, '2021-03-24 02:23:06'),
('d2c451910f26da714ea321f2584ff9b8c21d111540fc34cad32112bfb2a3fe13ad7baafa38cc0a4d', 'a3a41a690e7c110fcc715bdc2c79b795c94c7b537888bad9d97ab01f60cdb4ce0a96de47f4d496a7', 0, '2021-03-23 03:32:25'),
('d4f4eb01e68b91f6e037bb792a1fc128087b19e0a4ca8fb58ba26a9f38bce2d4acd652190d09340e', '5cf1d4ff844cb8aa3ae1c1d9554b554e9c5c155bc5d8d9b7f0d8de4f0ed082258d2565d8ef4bc63a', 0, '2021-06-09 10:50:16'),
('d93916b159a9f855be61c9c10168d4cd01255487a4721acd9ec50749ec00426383c9a38173fccdf1', 'e5194a8b17d46a9dd1543510659c0d326f425e1b9e3399fd03367a00e87d1c71bdfff37f7d5fa93f', 0, '2021-03-12 04:00:57'),
('d93ea2c87075002d543a95d95c9b650858f0e3228ffd9a6e03061ec3af219437921561fa67ea9982', '5b23c1ce8cfbc50435623a46640c7f5ca2b6ddc20d6aa6f92367523b963f8de5953e5b4ba322b596', 0, '2021-03-17 07:48:56'),
('db6f0b6ba5f6dc629edf831bfab26cdb1705a8ee3186b706345e9350c075e7945def04c4fb0eaa06', 'c2d6e5109f9f979f914d4feb5d3b88e63f89e081b4722a33f208536ba0e07171d0329544116c9c09', 0, '2021-03-11 03:14:35'),
('dc81670a909944ce76a1fcc64b7b79d5ab9779defc2c1d6b3380ed6e6ce4c4a031b42d856016ba14', '2db40cf811c7b98ed6d1730fd97f1628450897f3ae5692028c27f74deea7c08eb5dc324e58e6598b', 0, '2021-04-17 08:51:35'),
('e154ebc5537756874b74353642c447419bc4f9742f4d31901520cef5e4c3a7e6fb6a8a7483889d59', '2e0054263e932baf497aa71ef5d74ffa63e330ed089506ffa3e0374396d2def8c6d2f46fedb1edf4', 0, '2021-04-17 09:14:46'),
('e76e1bcbf3f4141ee299db1b201aa89672eda1a7d541595cdf0f39a3a22d48dae7379e6843a25155', '1222730acdaf01c6e60c88926bedb20f05e394abf2139cefa262a410c680226f24a4dfd0e86f62b6', 0, '2021-03-19 06:12:23'),
('e786ccf5d426528c4101661bff0303d4ca3c7401194d3fd82657e803ec9f0765e85c339589b69af8', 'f450f19eef88db2ca5599d7a7defe3e30d94e045eb2c60cba0295ebcf41deab6352b2a4649f927fc', 0, '2021-03-17 09:32:29'),
('e7cfc8c0bf26ec3a441815ca87f1758c7ddfa1cefdaa947ea3b3209040a26c533c0e660709620ee6', '00ada8935b9a76f3caed757bc7e077e795c2b5de5dadcc3f2817c498ffb88b746388911cb66dff20', 0, '2021-03-19 03:14:55'),
('e9b3f38871d462d78060d6d50ca5260e310526c972f8dcaed4b63db53b088a008129458a48d50971', '439915792e32b49f79e4e3e003468298cd249f3a7fe8d6b00a33902b21709b5f8ce9aa17ac4b1c89', 0, '2021-06-09 11:11:57'),
('ea4f1d9a4654ec89e241c1dc4e1f4ad4a3d8ad7b672d3c9225453fc45f130cfc050d26044da3d176', '1481d1afa944109be976489859a80fcfc719eb553e96c6bec470a2878253969d9a773af8d72d667b', 0, '2021-03-19 04:23:42'),
('eee5d1372eb3e55aa05e1401db9bbb375f0d6a2fa820f068612910ce3907a6d215ef74018174c138', '69d0c5ecd5f987c71c8277b8285d53b5f51675eb9b3c40cf38e8d4b5b02233a82605b379afca8af5', 0, '2021-03-19 03:54:55'),
('efaf9b0bf85eae86ed5b1dc5e8f6bcd7d37b9d1efccc4086e41428111cf24b6db773b30d325b5f3b', '09b19ddfdcaf4cdb7de55e0a8b550059eb7a91c51e444cdf346d216a51451fcc910d7d11c9b73e55', 0, '2021-03-11 08:48:12'),
('fc90b4dbed2bae6020f6be25294082c56be3a221f3feadd54f7907ad9aafadb4949c3f05f07f6c5a', '921ed80932ea3e50b722fc77dfe94b72267d7ee3593a656da000cb58350e216ffaaaa8c19e891fce', 0, '2021-03-20 10:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Credit Card', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(2, 'Paypal', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(3, 'Bank Transfer', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(4, 'Money Order', 1, 1, 1, NULL, '2020-04-28 08:58:43', '2020-04-28 08:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status_id` bigint(20) NOT NULL DEFAULT '0',
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_details`
--

CREATE TABLE `refund_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_id` bigint(20) NOT NULL,
  `booking_cabin_id` bigint(20) NOT NULL,
  `amount_refunded` decimal(20,5) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(2, 'Administrator', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(3, 'Site Manager', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(4, 'Guest', 1, 1, 1, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_route`
--

CREATE TABLE `role_route` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `route_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_route`
--

INSERT INTO `role_route` (`role_id`, `route_id`) VALUES
(1, 1),
(1, 26),
(4, 1),
(4, 26);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `props` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `path`, `redirect`, `name`, `component`, `parent_id`, `props`, `is_active`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '/', '/bookings', 'Home', 'containers/MainContainer', -1, 0, 1, 1, 1, NULL, '2019-07-09 16:39:33', '2019-07-12 18:45:31'),
(2, '/dashboard', '/bookings', 'Dashboard', 'views/Dashboard', 1, 0, 1, 1, 1, NULL, '2019-07-09 16:39:33', '2019-07-12 19:16:47'),
(4, '/boat-models', '', 'BoatModels', 'views/content/maintenance/boat_models/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(5, '/boat-types', '', 'BoatTypes', 'views/content/maintenance/boat_types/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(6, '/boat-brands', '', 'BoatBrands', 'views/content/maintenance/boat_brands/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(7, '/cabin-types', '', 'CabinTypes', 'views/content/maintenance/cabin_types/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(8, '/nationalities', '', 'Nationalities', 'views/content/maintenance/nationalities/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(9, '/guest-titles', '', 'GuestTitles', 'views/content/maintenance/guest_titles/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(10, '/payment-types', '', 'PaymentTypes', 'views/content/maintenance/payment_types/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(11, '/identification-card-types', '', 'IdentificationCardTypes', 'views/content/maintenance/identification_card_types/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(12, '/crew-types', '', 'CrewTypes', 'views/content/maintenance/crew_types/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(13, '/inclusions', '', 'Inclusions', 'views/content/maintenance/inclusions/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(14, '/exclusions', '', 'Exclusions', 'views/content/maintenance/exclusions/View', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(15, '/add-ons', '', 'AddOns', 'views/content/maintenance/add_ons/View', 1, 0, 1, 1, 1, NULL, '2019-07-17 07:34:54', '2019-07-17 07:34:54'),
(16, '/itinerary-brands', '', 'ItineraryBrands', 'views/content/maintenance/itinerary_brands/View', 1, 0, 1, 1, 1, NULL, '2019-07-17 09:17:18', '2019-07-17 09:17:18'),
(17, '/boats', '', 'Boats', 'views/content/maintenance/boats/View', 1, 0, 1, 1, 1, NULL, '2019-07-25 20:34:00', '2019-07-25 20:36:48'),
(18, '/galleries', '', 'Galleries', 'views/content/maintenance/galleries/View', 1, 0, 1, 1, 1, NULL, '2019-08-04 02:10:31', '2019-08-04 02:10:31'),
(19, '/itinerary-cities', '', 'ItineraryCities', 'views/content/maintenance/itinerary_cities/View', 1, 0, 1, 1, 1, NULL, '2019-08-07 00:30:28', '2019-08-07 00:30:28'),
(20, '/itineraries', '', 'Itineraries', 'views/content/itineraries/Index', 1, 0, 1, 1, 1, NULL, '2019-08-11 23:52:57', '2019-08-11 23:52:57'),
(21, '/itinerary-countries', '', 'ItineraryCountries', 'views/content/maintenance/itinerary_countries/View', 1, 0, 1, 1, 1, NULL, '2019-08-26 00:35:30', '2019-08-26 00:35:30'),
(22, '/boat-crews', '', 'BoatCrews', 'views/content/maintenance/boat_crews/View', 1, 0, 1, 1, 1, NULL, '2019-08-26 01:10:04', '2019-08-26 01:10:04'),
(23, '/itineraries/create', '', 'Create', 'views/content/itineraries/Create', 1, 0, 1, 1, 1, NULL, '2019-08-26 18:26:28', '2019-08-26 18:58:27'),
(24, '/boat-ambassadors', '', 'BoatAmbassadors', 'views/content/maintenance/boat_ambassadors/View', 1, 0, 1, 1, 1, NULL, '2019-08-26 01:10:04', '2019-08-26 01:10:04'),
(25, '/bookings', '', 'Bookings', 'views/content/bookings/Index', 1, 0, 1, 1, 1, NULL, '2019-08-26 01:10:04', '2019-08-26 01:10:04'),
(26, '/print', '/print', 'Print', 'containers/PrintContainer', -1, 0, 1, 1, 1, NULL, '2019-07-09 16:39:33', '2019-07-12 18:45:31'),
(27, '/print/receipt/:booking_id', '', 'PrintReceipt', 'views/content/print/Receipt', 26, 0, 1, 1, 1, NULL, '2019-07-09 16:39:33', '2019-07-12 19:16:47'),
(28, '/print/itinerary/:booking_id', '', 'PrintItinerary', 'views/content/print/Index', 26, 0, 1, 1, 1, NULL, '2019-07-09 16:39:33', '2019-07-12 19:16:47'),
(29, '/', '/dashboard', 'Guest Dashboard', 'containers/MainContainer', -1, 0, 1, 1, 1, NULL, '2019-07-09 16:39:33', '2019-07-12 18:45:31'),
(30, '/print/boat-manifest/:itinerary_id', '', 'PrintBoatManifest', 'views/content/print/BoatManifest', 26, 0, 1, 1, 1, NULL, '2019-07-09 16:39:33', '2019-07-12 19:16:47'),
(31, '/my-account', '', 'MyAccount', 'views/content/maintenance/my_account/Index', 1, 0, 1, 1, 1, NULL, '2020-02-25 05:46:00', '2020-02-25 05:46:01'),
(32, '/system-routes', '', 'SystemRoutes', 'views/content/system_routes/Index', 1, 0, 1, 1, 1, NULL, NULL, NULL),
(33, '/diet-options', '', 'DietOptions', 'views/content/maintenance/diet_options/View', 1, 0, 1, 1, 1, NULL, '2020-03-12 03:48:29', '2020-03-12 03:48:29'),
(34, '/gender', '', 'Gender', 'views/content/maintenance/genders/View', 1, 0, 1, 1, 1, NULL, '2020-03-12 05:54:06', '2020-03-12 05:54:06'),
(35, '/lead-sources', '', 'LeadSources', 'views/content/maintenance/lead_sources/View', 1, 0, 1, 1, 1, NULL, '2020-03-13 00:48:04', '2020-03-13 00:48:04'),
(36, '/print/crew-list/:itinerary_id', '', 'PrintCrewList', 'views/content/print/CrewList', 26, 0, 1, 1, 1, NULL, '2020-03-24 05:45:12', '2020-03-24 05:45:45'),
(37, '/master-list', '', 'MasterList', 'views/content/reports/MasterList', 1, 0, 1, 1, 1, NULL, '2020-04-13 12:28:52', '2020-04-13 12:28:54'),
(38, '/book/itinerary/:itinerary_id', '', 'AdminBooking', 'views/content/admin_booking/Index', 1, 0, 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `route_metas`
--

CREATE TABLE `route_metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `route_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `image`, `thumbnail`, `last_name`, `first_name`, `middle_name`, `default`, `email`, `role_id`, `email_verified_at`, `password`, `is_active`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Super Admin', 'Super Admin', 'Super Admin', '', 'a@admin.com', 1, NULL, '$2y$10$zleu0t2qRgVXFY8M1r3w5uFC9YkA862SpZaTy79O/BKGJDt1odFiy', 1, NULL, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(2, NULL, NULL, 'Woodcock', 'Geoff', 'na', '', 'geoff@medsailingholidays.com', 1, NULL, '$2y$10$zleu0t2qRgVXFY8M1r3w5uFC9YkA862SpZaTy79O/BKGJDt1odFiy', 1, NULL, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(3, NULL, NULL, 'Araneta', 'Amanda', 'na', '', 'amandaaraneta@medsailing.com', 1, NULL, '$2y$10$zleu0t2qRgVXFY8M1r3w5uFC9YkA862SpZaTy79O/BKGJDt1odFiy', 1, NULL, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(4, NULL, NULL, 'Lamata', 'Roger', 'na', '', 'rogerlamata@medsailing.com', 1, NULL, '$2y$10$zleu0t2qRgVXFY8M1r3w5uFC9YkA862SpZaTy79O/BKGJDt1odFiy', 1, NULL, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(5, NULL, NULL, 'Gemal', 'Mark', 'na', '', 'markgemal@medsailing.com', 1, NULL, '$2y$10$zleu0t2qRgVXFY8M1r3w5uFC9YkA862SpZaTy79O/BKGJDt1odFiy', 1, NULL, NULL, '2019-11-19 18:30:31', '2019-11-19 18:30:31'),
(6, NULL, NULL, 'Rhuggenaath', 'Sarah', NULL, 'MF9WZN', 'Srhuggenaath92@gmail.com', 4, NULL, '$2y$10$zXdv0VyT3Lj1gTafg7NvSO4FJM.zxbPFZdJXfvCi6jP1v5uIu9gvO', 1, NULL, NULL, '2020-05-06 10:43:29', '2020-05-06 10:43:29'),
(7, NULL, NULL, 'Greijmans', 'Sabine', NULL, 'MUBHSV', 'Sabine-greijmans@live.com', 4, NULL, '$2y$10$9ZMjSOJ2qYxXj1mHt2QybOL9x8Q7GDLO/vGppXEvDYsklooNdSuii', 1, NULL, NULL, '2020-05-06 10:54:51', '2020-05-06 10:54:51'),
(8, NULL, NULL, 'Danielsen', 'Marianne', NULL, 'Q8Z2M9', 'marsjen@yahoo.com', 4, NULL, '$2y$10$2tQN53l6wraZkDFYLewDUuZUzo8XC7P0xiNdUaIs9LUrF2N8FwEku', 1, NULL, NULL, '2020-05-06 11:13:15', '2020-05-06 11:13:15'),
(9, NULL, NULL, 'Langenhuizen', 'Martin', NULL, 'B4G35K', 'martinlangenhuizen@posteo.de', 4, NULL, '$2y$10$dezH6zcDc82f/H37Cb.coO6Z41Bf2nmaUzMB5m5KCSl3s2caD3AMe', 1, NULL, NULL, '2020-05-06 11:18:42', '2020-05-06 11:18:42'),
(10, NULL, NULL, 'Rowland', 'Jim', NULL, 'C0LQWN', 'jamiefso2@hotmail.com', 4, NULL, '$2y$10$LEiY0D4Ebrz7HbucG1Dp8OnBuuSbGO.ejSlrPUQrtD9qEa4XqgwlW', 1, NULL, NULL, '2020-05-06 15:08:55', '2020-05-06 15:08:55'),
(11, NULL, NULL, 'Isackson', 'Shane', NULL, 'XGV058', 'shaneisackson@hotmail.com', 4, NULL, '$2y$10$9bH/BcCkWehLhRjvIGjEeeVLQsuZlgdw9xrXFEevJWLh4FERVdhIC', 1, NULL, NULL, '2020-05-06 15:23:38', '2020-05-06 15:23:38'),
(12, NULL, NULL, 'DiVito', 'Anthony', NULL, '5W4OQ9', 'anthony.div@gmail.com', 4, NULL, '$2y$10$5YNfgbzsTTdEzT04aGhRFelRefaoO//irrh317TSqzKaVO0SJt2.O', 1, NULL, NULL, '2020-05-06 15:39:54', '2020-05-06 15:39:54'),
(13, NULL, NULL, 'Steveson', 'Frank', NULL, '5JBWZR', 'Fsteveson@hotmail.com', 4, NULL, '$2y$10$FzktWc9D6pe9Lqz8tLeOL.Aie0ITLMi5qognylgf9MGR3X3IB7LTO', 1, NULL, NULL, '2020-05-06 15:50:57', '2020-05-06 15:50:57'),
(14, NULL, NULL, 'Oklin', 'Bryan', NULL, 'EQ2ABZ', 'bmo124@gmail.com', 4, NULL, '$2y$10$lSlczeiHW10r1e0xljmsR.U5vdHIwwbTFOJaOU1LWgbQjDCF8zZ5m', 1, NULL, NULL, '2020-05-06 16:57:52', '2020-05-06 16:57:52'),
(15, NULL, NULL, 'Carbonell', 'Julio', NULL, 'TYOZEW', 'julio.carbonell.s@gmail.com', 4, NULL, '$2y$10$cd8GlSB1hcNuJJ6sZWHIMukI2MADZjRUqWJlBkIpgm.EW.iapUCeC', 1, NULL, NULL, '2020-05-06 17:11:08', '2020-05-06 17:11:08'),
(16, NULL, NULL, 'Dore', 'Fernanda', NULL, 'LBOYG9', 'fernanda.dore@gmail.com', 4, NULL, '$2y$10$z5BL.2/UTeKW1p9W6hxoZ.2gbZM1yMxS6xTPLUII3fImBtxpnjx1e', 1, NULL, NULL, '2020-05-06 17:25:31', '2020-05-06 17:25:31'),
(17, NULL, NULL, 'Alfred', 'Linda', NULL, '85FCQK', 'lindaallred43@yahoo.com', 4, NULL, '$2y$10$8RN51.cEeuw3AXQjAuL7HuIDJ/mw2toX3GQ1QLsyUmqvrf9wOAT9y', 1, NULL, NULL, '2020-05-06 17:31:40', '2020-05-06 17:31:40'),
(18, NULL, NULL, 'Slavens', 'Melanie', NULL, 'VM3YQN', 'melanieslavens@gmail.com', 4, NULL, '$2y$10$QoFNpwxgckXt7rpNPUo1A.7S3ohDM3Y.xs2tURulVAfRXzti3WP6W', 1, NULL, NULL, '2020-05-06 17:34:08', '2020-05-06 17:34:08'),
(19, NULL, NULL, 'Steel', 'Jessie', NULL, 'N07Y9Z', 'jessie.jdsteel@comcast.net', 4, NULL, '$2y$10$mWVV3hpSiN7XFRLolD1GUutg7vv2y748gQF.4R.jTceDScg0UfzQa', 1, NULL, NULL, '2020-05-06 17:36:39', '2020-05-06 17:36:39'),
(20, NULL, NULL, 'Mcfadden', 'Jamie', NULL, '4XO7QB', 'chefjamie@me.com', 4, NULL, '$2y$10$ixWMYqrwypXQIkX9euaSd.w2RMj63tEcEZTPOxM9bfbKK58GTjd3S', 1, NULL, NULL, '2020-05-06 17:43:02', '2020-05-06 17:43:02'),
(21, NULL, NULL, 'Mayersohn', 'Philippe', NULL, 'L3SDC8', 'philippe.meyersohn@hotmail.com', 4, NULL, '$2y$10$BFrLQ9zhEV9kBf1vbAH4lOvn0q0riPq.WRGZSLyNGLVvgK8REBr6m', 1, NULL, NULL, '2020-05-06 17:47:00', '2020-05-06 17:47:00'),
(22, NULL, NULL, 'Kindem', 'Lars', NULL, '5LE0UF', 'larsgkiii@gmail.com', 4, NULL, '$2y$10$fnzfUFFbMtzQpjx.iy.A/OuYkLTEaDLNDNjmvMIKZpy3NVBi1KxrO', 1, NULL, NULL, '2020-05-06 18:03:11', '2020-05-06 18:03:11'),
(23, NULL, NULL, 'Noblecourt', 'Pierre', NULL, 'P2GR3F', 'n_pierre5@hotmail.com', 4, NULL, '$2y$10$tgU7oWM0Fj3m24o0KTtEGeczpoOXBAV5vooUjcKAX5JbszUtLzIJ6', 1, NULL, NULL, '2020-05-06 18:13:14', '2020-05-06 18:13:14'),
(24, NULL, NULL, 'Corsco', 'Marco', NULL, 'Y2JP6H', 'marcocorso777@gmail.com', 4, NULL, '$2y$10$AE1d6rArO7YXDvxr28D3Qu23c7o2hJIh0k1DfT7Z0qvX7.9VAUkwK', 1, NULL, NULL, '2020-05-06 18:25:30', '2020-05-06 18:25:30'),
(25, NULL, NULL, 'Addona', 'Sandy', NULL, 'OKLFR3', 'Sandyaddona@gmail.com', 4, NULL, '$2y$10$GFg4GGs1clJFpv37cbJESexUuNM.wCpXE.r110AMOt80gE6RW5TFO', 1, NULL, NULL, '2020-05-06 18:43:55', '2020-05-06 18:43:55'),
(26, NULL, NULL, 'Smith', 'David', NULL, '6JZ802', 'edwinmerman@att.net', 4, NULL, '$2y$10$O7hBooERZ4acNy7ynA2Lyee.DvBy0fIJr0nIi4IFHxk76waG/o7Nm', 1, NULL, NULL, '2020-05-06 18:50:02', '2020-05-06 18:50:02'),
(27, NULL, NULL, 'Schreiner', 'Miles', NULL, 'TDPSWN', 'milesmschreiner@gmail.com', 4, NULL, '$2y$10$gDl7lIGzpLuVb8b/PoQcXOlt0LIOEmMtEdL48AYkSG4PHdVeRmiGa', 1, NULL, NULL, '2020-05-06 18:57:50', '2020-05-06 18:57:50'),
(28, NULL, NULL, 'Conti', 'Mark', NULL, 'TVX20F', 'mconti4dustfree@gmail.com', 4, NULL, '$2y$10$GPcjTcSQxJ0RB1j6sNCIbepUrkXA1anj.tlvwZb.Rd7d9Xdxocovm', 1, NULL, NULL, '2020-05-06 19:11:14', '2020-05-06 19:11:14'),
(29, NULL, NULL, 'Sthankiya', 'Anita', NULL, 'RF8CDU', 'anita@keepingitsocial.ca', 4, NULL, '$2y$10$TymXCvZk89TcnB5gRb6yD./SXrrch4E1TdWgTSl5nGinH5q0dwGX2', 1, NULL, NULL, '2020-05-06 19:17:27', '2020-05-06 19:17:27'),
(30, NULL, NULL, 'Anderson', 'Melissa', NULL, 'OUJT0Q', 'kranderski@gmail.com', 4, NULL, '$2y$10$Btj1alfn954GVgij6Mmvl.JR0yNpdbGrycq8xb88eyZi7r1z8SWzC', 1, NULL, NULL, '2020-05-06 19:40:32', '2020-05-06 19:40:32'),
(31, NULL, NULL, 'Vanderzeil', 'Jacqui', NULL, 'MQJV4Y', 'jacstar@me.com', 4, NULL, '$2y$10$YDq40m34xi2tKF.y9yWaueprU2oJss7XZUL9peo4.CcSj9GFEYzBq', 1, NULL, NULL, '2020-05-06 19:47:03', '2020-05-06 19:47:03'),
(32, NULL, NULL, 'Raffaelli', 'Anita', NULL, 'VW8MAX', 'anitaraffaelli55@gmail.com', 4, NULL, '$2y$10$pzu585fvrXEXu.OgscYaSOTxdwM989Rdcq99zBpZwZghxzz8LoL/K', 1, NULL, NULL, '2020-05-06 19:56:06', '2020-05-06 19:56:06'),
(33, NULL, NULL, 'Dennis', 'Linda', NULL, 'OW92CF', 'lindadennis02@msn.com', 4, NULL, '$2y$10$9MX0xFAWbwzBIToXsr7bSuKnwyyE6lK7dxgphyB5XgWnsby0ZalxS', 1, NULL, NULL, '2020-05-06 20:03:38', '2020-05-06 20:03:38'),
(34, NULL, NULL, 'Maricich', 'Jodi', NULL, 'FWDXPU', 'jodi@jamdesigngroup.com', 4, NULL, '$2y$10$ldRkER9L3atdnfo6eMpI2eTLuA6SF0iV1bgQEuJeAH3euohTOsI2m', 1, NULL, NULL, '2020-05-06 20:19:23', '2020-05-06 20:19:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ambassadors`
--
ALTER TABLE `ambassadors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ambassador_itinerary_codes`
--
ALTER TABLE `ambassador_itinerary_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boat_brands`
--
ALTER TABLE `boat_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boat_cabins`
--
ALTER TABLE `boat_cabins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boat_crews`
--
ALTER TABLE `boat_crews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boat_models`
--
ALTER TABLE `boat_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boat_types`
--
ALTER TABLE `boat_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_add_ons`
--
ALTER TABLE `booking_add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_cabins`
--
ALTER TABLE `booking_cabins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_cabin_discounts`
--
ALTER TABLE `booking_cabin_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_invoices`
--
ALTER TABLE `booking_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_invoice_payments`
--
ALTER TABLE `booking_invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_referrals`
--
ALTER TABLE `booking_referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cabin_types`
--
ALTER TABLE `cabin_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_ports`
--
ALTER TABLE `city_ports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crew_types`
--
ALTER TABLE `crew_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diet_options`
--
ALTER TABLE `diet_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exclusions`
--
ALTER TABLE `exclusions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_titles`
--
ALTER TABLE `guest_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identification_card_types`
--
ALTER TABLE `identification_card_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inclusions`
--
ALTER TABLE `inclusions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_add_ons`
--
ALTER TABLE `itinerary_add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_brands`
--
ALTER TABLE `itinerary_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_cabins`
--
ALTER TABLE `itinerary_cabins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_cities`
--
ALTER TABLE `itinerary_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_countries`
--
ALTER TABLE `itinerary_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_crews`
--
ALTER TABLE `itinerary_crews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_exclusions`
--
ALTER TABLE `itinerary_exclusions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_inclusions`
--
ALTER TABLE `itinerary_inclusions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_details`
--
ALTER TABLE `refund_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_metas`
--
ALTER TABLE `route_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ambassadors`
--
ALTER TABLE `ambassadors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `ambassador_itinerary_codes`
--
ALTER TABLE `ambassador_itinerary_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `boats`
--
ALTER TABLE `boats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `boat_brands`
--
ALTER TABLE `boat_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `boat_cabins`
--
ALTER TABLE `boat_cabins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `boat_crews`
--
ALTER TABLE `boat_crews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `boat_models`
--
ALTER TABLE `boat_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `boat_types`
--
ALTER TABLE `boat_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `booking_add_ons`
--
ALTER TABLE `booking_add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `booking_cabins`
--
ALTER TABLE `booking_cabins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `booking_cabin_discounts`
--
ALTER TABLE `booking_cabin_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `booking_invoices`
--
ALTER TABLE `booking_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `booking_invoice_payments`
--
ALTER TABLE `booking_invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `booking_referrals`
--
ALTER TABLE `booking_referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cabin_types`
--
ALTER TABLE `cabin_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `city_ports`
--
ALTER TABLE `city_ports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `crew_types`
--
ALTER TABLE `crew_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `diet_options`
--
ALTER TABLE `diet_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `exclusions`
--
ALTER TABLE `exclusions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `guest_titles`
--
ALTER TABLE `guest_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `identification_card_types`
--
ALTER TABLE `identification_card_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inclusions`
--
ALTER TABLE `inclusions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `itinerary_add_ons`
--
ALTER TABLE `itinerary_add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `itinerary_brands`
--
ALTER TABLE `itinerary_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `itinerary_cabins`
--
ALTER TABLE `itinerary_cabins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;
--
-- AUTO_INCREMENT for table `itinerary_cities`
--
ALTER TABLE `itinerary_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `itinerary_countries`
--
ALTER TABLE `itinerary_countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `itinerary_crews`
--
ALTER TABLE `itinerary_crews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `itinerary_exclusions`
--
ALTER TABLE `itinerary_exclusions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;
--
-- AUTO_INCREMENT for table `itinerary_inclusions`
--
ALTER TABLE `itinerary_inclusions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `refund_details`
--
ALTER TABLE `refund_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `route_metas`
--
ALTER TABLE `route_metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
