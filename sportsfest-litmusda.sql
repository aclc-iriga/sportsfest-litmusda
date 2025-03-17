-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 05:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportsfest-litmusda`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'SUPER USER', 'no-avatar.jpg', 'admin', 'admin', NULL, NULL, NULL, '2023-02-19 07:36:32', '2025-03-17 04:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `arrangements`
--

CREATE TABLE `arrangements` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arrangements`
--

INSERT INTO `arrangements` (`id`, `event_id`, `team_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 22, 2, 1, '2025-03-13 05:16:25', '2025-03-13 05:16:25'),
(2, 22, 1, 2, '2025-03-13 05:16:26', '2025-03-13 05:16:26'),
(3, 23, 2, 1, '2025-03-13 05:16:29', '2025-03-13 05:16:29'),
(4, 23, 1, 2, '2025-03-13 05:16:31', '2025-03-13 05:16:31'),
(5, 24, 2, 1, '2025-03-13 05:16:35', '2025-03-13 05:16:35'),
(6, 24, 1, 2, '2025-03-13 05:16:36', '2025-03-13 05:16:36'),
(7, 25, 2, 1, '2025-03-13 05:16:40', '2025-03-13 05:16:40'),
(8, 25, 1, 2, '2025-03-13 05:16:41', '2025-03-13 05:16:41'),
(9, 26, 2, 1, '2025-03-13 05:16:43', '2025-03-13 05:16:43'),
(10, 26, 1, 2, '2025-03-13 05:16:44', '2025-03-13 05:16:44'),
(11, 27, 2, 1, '2025-03-13 05:16:46', '2025-03-13 05:16:46'),
(12, 27, 1, 2, '2025-03-13 05:16:47', '2025-03-13 05:16:47'),
(13, 29, 2, 1, '2025-03-13 05:16:49', '2025-03-13 05:16:49'),
(14, 29, 1, 2, '2025-03-13 05:16:51', '2025-03-13 05:16:54'),
(15, 28, 2, 1, '2025-03-13 05:16:57', '2025-03-13 05:16:57'),
(16, 28, 1, 2, '2025-03-13 05:17:00', '2025-03-13 05:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `competition_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `competition_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'ball', 'Ball Games', '2023-02-19 06:33:56', '2023-02-19 06:33:56'),
(2, 1, 'board', 'Board Games', '2023-02-19 06:34:11', '2023-02-19 06:34:11'),
(3, 1, 'athletics', 'Athletics', '2024-04-05 01:43:57', '2024-04-05 02:02:47'),
(4, 1, 'e-games', 'E-Games', '2024-04-05 02:30:37', '2024-04-05 02:51:15'),
(5, 2, 'literary', 'Literary Competitions', '2023-02-19 06:38:21', '2024-04-05 02:51:56'),
(6, 2, 'music', 'Music Competitions', '2023-02-19 06:38:38', '2024-04-05 02:51:52'),
(7, 2, 'dance', 'Dance Competitions', '2023-02-19 06:40:04', '2024-04-05 02:51:49'),
(12, 3, 'skill', 'Skill Competitions', '2025-03-12 12:04:10', '2025-03-12 12:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'sports', 'Sports', '2023-02-19 06:14:39', '2023-02-19 06:40:47'),
(2, 'litmusda', 'Literary, Music, and Dance', '2023-02-19 06:14:39', '2023-02-19 06:14:59'),
(3, 'skills', 'Skills', '2025-03-12 11:51:31', '2025-03-12 11:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `event_id`, `title`, `percentage`, `created_at`, `updated_at`) VALUES
(61, 1, 'Rating', 100, '2025-03-10 07:32:28', '2025-03-10 07:32:28'),
(62, 2, 'Rating', 100, '2025-03-10 07:32:43', '2025-03-10 07:32:43'),
(63, 3, 'Rating', 100, '2025-03-10 07:32:57', '2025-03-10 07:32:57'),
(64, 4, 'Rating', 100, '2025-03-10 07:33:47', '2025-03-10 07:33:47'),
(65, 5, 'Rating', 100, '2025-03-10 07:34:02', '2025-03-10 07:34:02'),
(66, 6, 'Rating', 100, '2025-03-10 07:34:16', '2025-03-10 07:34:16'),
(67, 7, 'Rating', 100, '2025-03-10 07:34:39', '2025-03-10 07:34:39'),
(68, 8, 'Rating', 100, '2025-03-10 07:35:03', '2025-03-10 07:35:03'),
(69, 10, 'Rating', 100, '2025-03-10 07:35:19', '2025-03-10 07:35:19'),
(70, 20, 'Rating', 100, '2025-03-10 07:36:56', '2025-03-10 07:36:56'),
(71, 21, 'Rating ', 100, '2025-03-10 07:37:11', '2025-03-10 07:37:11'),
(72, 22, 'Content', 40, '2025-03-10 07:37:58', '2025-03-10 07:37:58'),
(73, 22, 'Delivery', 30, '2025-03-10 07:38:07', '2025-03-10 07:38:07'),
(74, 22, 'Voice', 20, '2025-03-10 07:38:17', '2025-03-10 07:38:17'),
(75, 22, 'Personality', 10, '2025-03-10 07:38:28', '2025-03-10 07:38:28'),
(76, 23, 'Speech Content', 40, '2025-03-10 07:39:04', '2025-03-10 07:39:04'),
(77, 23, 'Poise & Delivery', 30, '2025-03-10 07:40:25', '2025-03-10 07:40:25'),
(78, 23, 'Voice Quality', 20, '2025-03-10 07:42:25', '2025-03-10 07:42:25'),
(79, 23, 'Time', 5, '2025-03-10 07:42:38', '2025-03-10 07:42:38'),
(80, 23, 'Audience Response', 5, '2025-03-10 07:43:09', '2025-03-10 07:43:09'),
(81, 24, 'Nilalaman', 40, '2025-03-10 07:43:40', '2025-03-13 04:26:17'),
(82, 24, 'Paraan ng Pagbigkas', 30, '2025-03-10 07:44:04', '2025-03-13 04:26:24'),
(83, 24, 'Interpretasyon', 20, '2025-03-10 07:44:43', '2025-03-10 07:44:43'),
(84, 24, 'Kaangkupan ng Kilos o Galaw', 10, '2025-03-10 07:45:26', '2025-03-13 06:43:30'),
(86, 25, 'Tone Quality', 40, '2025-03-10 07:47:02', '2025-03-10 07:47:02'),
(87, 25, 'Interpretation, Delivery, Dynamics', 40, '2025-03-10 07:47:37', '2025-03-10 07:47:37'),
(88, 25, 'Stage Presence', 20, '2025-03-10 07:48:01', '2025-03-10 07:48:01'),
(89, 26, 'Tone Quality', 40, '2025-03-10 07:48:28', '2025-03-10 07:48:28'),
(90, 26, 'Interpretation, Delivery, Dynamics', 40, '2025-03-10 07:49:22', '2025-03-10 07:49:22'),
(91, 26, 'Stage Presence', 20, '2025-03-10 07:49:59', '2025-03-10 07:49:59'),
(92, 27, 'Tone Quality ', 40, '2025-03-10 07:50:22', '2025-03-10 07:50:22'),
(93, 27, 'Blending and Interpretation/Counterpoint', 40, '2025-03-10 07:50:54', '2025-03-10 07:50:54'),
(94, 27, 'Stage Presence', 20, '2025-03-10 07:51:26', '2025-03-10 07:51:26'),
(95, 29, 'Performance', 30, '2025-03-10 07:51:53', '2025-03-10 07:51:53'),
(96, 29, 'Choreography and Originality', 20, '2025-03-10 07:52:18', '2025-03-10 07:52:18'),
(97, 29, 'Technique/Style', 20, '2025-03-10 07:52:43', '2025-03-10 07:52:43'),
(98, 29, 'Rhythm and Timing', 20, '2025-03-10 07:53:14', '2025-03-10 07:53:14'),
(99, 29, 'Costume', 10, '2025-03-10 07:53:28', '2025-03-10 07:53:28'),
(100, 28, 'Performance ', 40, '2025-03-10 07:54:08', '2025-03-10 07:54:08'),
(101, 28, 'Choreography', 30, '2025-03-10 07:54:29', '2025-03-10 07:54:29'),
(102, 28, 'Music', 20, '2025-03-10 07:54:38', '2025-03-10 07:54:38'),
(103, 28, 'Costume', 10, '2025-03-10 07:54:46', '2025-03-10 07:54:46'),
(104, 30, 'Choreography, Synchronization, Mastery and Dynamism', 40, '2025-03-10 07:57:16', '2025-03-10 07:57:16'),
(105, 30, 'Relevance to the Theme', 25, '2025-03-10 07:57:35', '2025-03-10 07:57:35'),
(106, 30, 'Costume and Props', 25, '2025-03-10 07:57:49', '2025-03-10 07:57:49'),
(107, 30, 'Over-All Impact', 10, '2025-03-10 07:58:11', '2025-03-10 07:58:11'),
(108, 31, 'Rating', 100, '2025-03-10 07:58:32', '2025-03-10 07:58:32'),
(109, 32, 'Rating', 100, '2025-03-10 07:58:47', '2025-03-10 07:58:47'),
(110, 33, 'Rating', 100, '2025-03-10 07:59:01', '2025-03-10 07:59:01'),
(111, 34, 'Rating', 100, '2025-03-10 07:59:14', '2025-03-10 07:59:14'),
(112, 35, 'Rating', 100, '2025-03-10 07:59:24', '2025-03-10 07:59:24'),
(114, 37, 'Rating', 100, '2025-03-10 07:59:59', '2025-03-10 07:59:59'),
(115, 38, 'Rating', 100, '2025-03-10 08:00:13', '2025-03-10 08:00:13'),
(116, 39, 'Rating', 100, '2025-03-10 08:00:28', '2025-03-10 08:00:28'),
(117, 40, 'Rating', 100, '2025-03-10 08:00:44', '2025-03-10 08:00:44'),
(118, 41, 'Rating', 100, '2025-03-10 08:00:59', '2025-03-10 08:00:59'),
(119, 42, 'Rating', 100, '2025-03-10 08:01:32', '2025-03-10 08:01:32'),
(120, 43, 'Rating', 100, '2025-03-12 12:06:24', '2025-03-12 12:06:24'),
(121, 44, 'Rating', 100, '2025-03-12 12:06:36', '2025-03-12 12:06:36'),
(122, 45, 'Rating', 100, '2025-03-12 12:06:51', '2025-03-12 12:06:51'),
(123, 8, 'Rating', 100, '2025-03-13 03:10:25', '2025-03-13 03:10:25'),
(125, 47, 'Rating', 100, '2025-03-13 03:22:00', '2025-03-13 03:22:00'),
(126, 48, 'Rating', 100, '2025-03-13 03:22:13', '2025-03-13 03:22:13'),
(127, 49, 'Rating', 100, '2025-03-13 03:22:24', '2025-03-13 03:22:24'),
(128, 50, 'Rating', 100, '2025-03-13 03:22:40', '2025-03-13 03:22:40'),
(129, 51, 'Rating', 100, '2025-03-13 03:31:37', '2025-03-13 03:31:37'),
(130, 52, 'Rating', 100, '2025-03-13 03:31:49', '2025-03-13 03:31:49'),
(131, 53, 'Rating', 100, '2025-03-13 03:34:23', '2025-03-13 03:34:23'),
(132, 54, 'Rating', 100, '2025-03-13 03:34:32', '2025-03-13 03:34:32'),
(133, 55, 'Rating', 100, '2025-03-13 03:34:42', '2025-03-13 03:34:42'),
(134, 56, 'Rating', 100, '2025-03-13 03:34:51', '2025-03-13 03:34:51');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eliminations`
--

CREATE TABLE `eliminations` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'basketball-men-5x5', 'Basketball Men 5x5', '2024-04-04 07:10:38', '2025-03-12 12:21:34'),
(2, 1, 'basketball-men-3x3', 'Basketball Men 3x3', '2024-04-04 07:11:31', '2025-03-12 12:21:50'),
(3, 1, 'basketball-women-3x3', 'BasketBall Women 3x3', '2024-04-05 09:05:48', '2025-03-10 06:59:50'),
(4, 1, 'volleyball-men', 'Volleyball Men', '2024-04-04 07:12:14', '2025-03-10 07:00:00'),
(5, 1, 'volleyball-women', 'VolleyBall Women', '2024-04-04 07:12:02', '2025-03-10 08:20:40'),
(6, 1, 'sepak-takraw', 'Sepak Takraw ', '2024-04-05 09:05:05', '2025-03-13 04:08:33'),
(7, 1, 'badminton-single-men', 'Badminton Single Men', '2024-04-04 07:11:45', '2025-03-10 07:00:21'),
(8, 1, 'badminton-single-women', 'Badminton Single Women', '2024-04-05 09:06:37', '2025-03-10 06:55:02'),
(10, 1, 'badminton-double-men', 'Badminton Double Men', '2024-04-05 09:07:21', '2025-03-10 07:05:02'),
(20, 4, 'mobile-legends-a', 'Mobile Legends (Category A)', '2024-04-05 02:31:07', '2024-04-05 10:12:14'),
(21, 4, 'mobile-legends-b', 'Mobile Legends (Category B)', '2024-04-05 02:32:32', '2024-04-05 10:12:16'),
(22, 5, 'oration', 'Oration', '2023-02-21 02:05:03', '2024-04-05 10:12:19'),
(23, 5, 'extemporaneous-speaking', 'Extemporaneous Speaking', '2024-04-04 07:16:44', '2024-04-05 10:12:24'),
(24, 5, 'tigsik', 'Tigsik', '2024-04-04 07:17:01', '2024-04-05 10:12:30'),
(25, 6, 'vocal-solo-male', 'Vocal Solo Male', '2023-02-21 02:16:39', '2024-04-05 10:12:33'),
(26, 6, 'vocal-solo-female', 'Vocal Solo Female', '2023-02-21 02:16:39', '2024-04-05 10:12:35'),
(27, 6, 'vocal-duet', 'Vocal Duet', '2023-02-21 02:16:39', '2024-04-05 10:12:37'),
(28, 7, 'folk-dance', 'Folk Dance', '2023-02-21 02:16:39', '2025-03-13 05:31:13'),
(29, 7, 'jazz-dance', 'Jazz Dance', '2023-02-21 02:16:39', '2025-03-13 05:31:08'),
(30, 7, 'mass-demo', 'Mass Demo', '2024-04-05 05:23:56', '2025-03-10 07:21:23'),
(31, 1, 'badminton-double-women', 'Badminton Double Women', '2025-03-10 07:05:32', '2025-03-10 07:05:32'),
(32, 1, 'table-tennis-men', 'Table Tennis Men', '2025-03-10 07:06:24', '2025-03-10 07:06:24'),
(33, 1, 'table-tennis-women', 'Table Tennis Women', '2025-03-10 07:06:59', '2025-03-10 07:06:59'),
(34, 2, 'chess-men', 'Chess Men', '2025-03-10 07:09:04', '2025-03-10 07:09:04'),
(35, 2, 'chess-women', 'Chess Women', '2025-03-10 07:09:41', '2025-03-10 07:09:41'),
(37, 2, 'word-factory-men', 'Word-Factory-Men', '2025-03-10 07:12:54', '2025-03-10 07:12:54'),
(38, 2, 'word-factory-women', 'Word Factory Women', '2025-03-10 07:13:27', '2025-03-10 07:13:27'),
(39, 2, 'scrabble-men', 'Scrabble Men', '2025-03-10 07:14:55', '2025-03-10 07:14:55'),
(40, 2, 'scrabble-women', 'Scrabble Women', '2025-03-10 07:15:28', '2025-03-10 07:15:28'),
(41, 2, 'games-of-the-general-men', 'Games of the general Men', '2025-03-10 07:18:27', '2025-03-10 07:18:27'),
(42, 2, 'games-of-the-general-women', 'Games of the general Women', '2025-03-10 07:19:24', '2025-03-10 07:19:24'),
(43, 12, 'short-film', 'Short Film', '2025-03-12 12:04:55', '2025-03-12 12:04:55'),
(44, 12, 'photography', 'Photography', '2025-03-12 12:05:24', '2025-03-12 12:05:24'),
(45, 12, 'digital-poster-making', 'Digital Poster Making', '2025-03-12 12:05:57', '2025-03-12 12:05:57'),
(47, 3, '100m-run-men', '100m Run Men', '2025-03-13 03:18:21', '2025-03-13 03:27:36'),
(48, 3, '4x100m-relay-men', '4x100m Relay Men', '2025-03-13 03:20:53', '2025-03-13 03:28:11'),
(49, 3, 'discuss-throw-men', 'Discuss Throw Men', '2025-03-13 03:21:21', '2025-03-13 03:21:21'),
(50, 3, 'discuss-throw-women', 'Discuss Throw Women', '2025-03-13 03:21:42', '2025-03-13 03:21:42'),
(51, 3, '100m-run-women', '100m  Run Women', '2025-03-13 03:27:54', '2025-03-13 03:27:54'),
(52, 3, '4x100m-relay-women', '4x100m Relay Women', '2025-03-13 03:29:51', '2025-03-13 03:29:51'),
(53, 3, 'javelin-throw-men', 'Javelin Throw Men', '2025-03-13 03:32:54', '2025-03-13 03:32:54'),
(54, 3, 'javelin-throw-women', 'Javelin Throw Women', '2025-03-13 03:33:21', '2025-03-13 03:33:21'),
(55, 3, 'shot-put-men', 'Shot Put Men', '2025-03-13 03:33:41', '2025-03-13 03:33:41'),
(56, 3, 'shot-put-women', 'Shot Put Women', '2025-03-13 03:34:02', '2025-03-13 03:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tabulator', 'no-avatar.jpg', 'tabulator', 'tabulator01', NULL, NULL, NULL, '2024-04-05 01:29:50', '2025-03-17 04:04:01'),
(2, 1, 'Judge 01', 'no-avatar.jpg', 'judge01', 'judge01', NULL, NULL, NULL, '2024-04-05 01:57:56', '2025-03-17 04:04:44'),
(3, 2, 'Judge 02', 'no-avatar.jpg', 'judge02', 'judge02', NULL, NULL, NULL, '2024-04-05 01:58:16', '2025-03-17 04:04:50'),
(4, 3, 'Judge 03', 'no-avatar.jpg', 'judge03', 'judge03', NULL, NULL, NULL, '2024-04-05 01:58:36', '2025-03-17 04:04:55'),
(5, 4, 'Judge 04', 'no-avatar.jpg', 'judge04', 'judge04', NULL, NULL, NULL, '2025-03-10 08:57:04', '2025-03-17 04:04:59'),
(6, 5, 'Judge 05', 'no-avatar.jpg', 'judge05', 'judge05', NULL, NULL, NULL, '2025-03-10 08:57:42', '2025-03-17 04:05:04'),
(12, 6, 'Judge 06', 'no-avatar.jpg', 'judge06', 'judge06', NULL, NULL, NULL, '2025-03-11 01:03:19', '2025-03-17 04:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `judge_event`
--

CREATE TABLE `judge_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `is_chairman` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge_event`
--

INSERT INTO `judge_event` (`id`, `judge_id`, `event_id`, `is_chairman`, `created_at`, `updated_at`) VALUES
(19, 4, 22, 0, '2024-04-05 02:12:07', '2024-04-05 02:56:24'),
(20, 4, 25, 1, '2024-04-05 02:12:13', '2025-03-13 05:10:24'),
(21, 4, 26, 1, '2024-04-05 02:12:19', '2025-03-13 05:10:23'),
(22, 4, 27, 1, '2024-04-05 02:12:27', '2025-03-13 05:10:23'),
(23, 4, 28, 0, '2024-04-05 02:12:32', '2024-04-05 02:56:51'),
(24, 4, 29, 0, '2024-04-05 02:12:40', '2024-04-05 02:57:01'),
(25, 4, 23, 0, '2024-04-05 02:12:56', '2024-04-05 02:57:04'),
(26, 4, 24, 0, '2024-04-05 02:13:06', '2024-04-05 02:57:08'),
(28, 1, 1, 0, '2024-04-05 02:13:37', '2024-04-05 02:57:15'),
(29, 1, 2, 0, '2024-04-05 02:13:44', '2024-04-05 02:57:18'),
(30, 1, 7, 0, '2024-04-05 02:13:52', '2024-04-05 02:57:26'),
(31, 1, 5, 0, '2024-04-05 02:14:01', '2024-04-05 02:57:30'),
(32, 1, 4, 0, '2024-04-05 02:14:08', '2024-04-05 02:57:41'),
(37, 1, 20, 0, '2024-04-05 02:44:19', '2024-04-05 02:58:20'),
(38, 1, 21, 0, '2024-04-05 02:44:25', '2024-04-05 02:58:24'),
(49, 1, 6, 0, '2024-04-05 09:09:30', '2024-04-05 09:09:30'),
(50, 1, 3, 0, '2024-04-05 09:09:35', '2024-04-05 09:09:35'),
(51, 1, 8, 0, '2024-04-05 09:09:40', '2024-04-05 09:09:40'),
(52, 1, 10, 0, '2024-04-05 09:09:45', '2024-04-05 09:09:45'),
(64, 6, 22, 0, '2025-03-10 08:59:07', '2025-03-10 08:59:07'),
(65, 6, 24, 0, '2025-03-10 08:59:14', '2025-03-10 08:59:14'),
(66, 6, 25, 0, '2025-03-10 08:59:17', '2025-03-10 08:59:17'),
(67, 6, 27, 0, '2025-03-10 08:59:20', '2025-03-10 08:59:20'),
(68, 6, 26, 0, '2025-03-10 08:59:24', '2025-03-10 08:59:24'),
(69, 6, 29, 0, '2025-03-10 08:59:27', '2025-03-10 08:59:27'),
(70, 6, 28, 0, '2025-03-10 08:59:31', '2025-03-10 08:59:31'),
(73, 6, 23, 0, '2025-03-10 09:09:39', '2025-03-10 09:09:39'),
(74, 1, 31, 0, '2025-03-10 13:15:38', '2025-03-10 13:15:38'),
(75, 1, 32, 0, '2025-03-10 13:16:00', '2025-03-10 13:16:00'),
(76, 1, 33, 0, '2025-03-10 13:16:07', '2025-03-10 13:16:07'),
(77, 1, 34, 0, '2025-03-10 13:16:14', '2025-03-10 13:16:14'),
(78, 1, 37, 0, '2025-03-10 13:16:21', '2025-03-10 13:16:21'),
(79, 1, 38, 0, '2025-03-10 13:16:27', '2025-03-10 13:16:27'),
(80, 1, 35, 0, '2025-03-10 13:16:34', '2025-03-10 13:16:34'),
(81, 1, 39, 0, '2025-03-10 13:16:37', '2025-03-10 13:16:37'),
(82, 1, 40, 0, '2025-03-10 13:16:40', '2025-03-10 13:16:40'),
(83, 1, 41, 0, '2025-03-10 13:16:43', '2025-03-10 13:16:43'),
(84, 1, 42, 0, '2025-03-10 13:16:46', '2025-03-10 13:16:46'),
(96, 12, 30, 1, '2025-03-11 01:03:53', '2025-03-11 01:04:00'),
(97, 2, 22, 0, '2025-03-11 10:24:38', '2025-03-11 10:24:38'),
(98, 2, 23, 0, '2025-03-11 10:24:43', '2025-03-11 10:24:43'),
(99, 2, 24, 0, '2025-03-11 10:24:48', '2025-03-11 10:24:48'),
(100, 2, 25, 0, '2025-03-11 10:25:06', '2025-03-11 10:25:06'),
(101, 2, 26, 0, '2025-03-11 10:25:10', '2025-03-11 10:25:10'),
(102, 2, 27, 0, '2025-03-11 10:25:17', '2025-03-11 10:25:17'),
(103, 2, 29, 1, '2025-03-11 10:25:22', '2025-03-13 05:10:13'),
(104, 2, 28, 1, '2025-03-11 10:25:26', '2025-03-13 05:10:13'),
(105, 3, 22, 0, '2025-03-11 10:25:48', '2025-03-11 10:25:48'),
(106, 3, 24, 0, '2025-03-11 10:25:52', '2025-03-11 10:25:52'),
(107, 3, 25, 0, '2025-03-11 10:25:56', '2025-03-11 10:25:56'),
(108, 3, 26, 0, '2025-03-11 10:25:59', '2025-03-11 10:25:59'),
(109, 3, 27, 0, '2025-03-11 10:26:02', '2025-03-11 10:26:02'),
(110, 3, 29, 0, '2025-03-11 10:26:05', '2025-03-11 10:26:05'),
(111, 3, 28, 0, '2025-03-11 10:26:08', '2025-03-11 10:26:08'),
(112, 3, 23, 0, '2025-03-11 10:26:26', '2025-03-11 10:26:26'),
(113, 5, 22, 1, '2025-03-11 10:27:08', '2025-03-13 05:10:29'),
(114, 5, 23, 1, '2025-03-11 10:27:11', '2025-03-13 05:10:31'),
(115, 5, 24, 1, '2025-03-11 10:27:14', '2025-03-13 05:10:32'),
(116, 5, 25, 0, '2025-03-11 10:27:18', '2025-03-11 10:27:18'),
(117, 5, 26, 0, '2025-03-11 10:27:21', '2025-03-11 10:27:21'),
(118, 5, 27, 0, '2025-03-11 10:27:24', '2025-03-11 10:27:24'),
(119, 5, 29, 0, '2025-03-11 10:27:27', '2025-03-11 10:27:27'),
(120, 5, 28, 0, '2025-03-11 10:27:29', '2025-03-11 10:27:29'),
(121, 1, 43, 0, '2025-03-12 12:07:55', '2025-03-12 12:07:55'),
(122, 1, 44, 0, '2025-03-12 12:08:00', '2025-03-12 12:08:00'),
(123, 1, 45, 0, '2025-03-12 12:08:04', '2025-03-12 12:08:04'),
(125, 1, 47, 0, '2025-03-13 03:26:35', '2025-03-13 03:26:35'),
(126, 1, 48, 0, '2025-03-13 03:26:40', '2025-03-13 03:26:40'),
(127, 1, 49, 0, '2025-03-13 03:26:45', '2025-03-13 03:26:45'),
(128, 1, 50, 0, '2025-03-13 03:26:51', '2025-03-13 03:26:51'),
(129, 1, 51, 0, '2025-03-13 03:32:04', '2025-03-13 03:32:04'),
(130, 1, 52, 0, '2025-03-13 03:32:12', '2025-03-13 03:32:12'),
(131, 1, 53, 0, '2025-03-13 03:35:08', '2025-03-13 03:35:08'),
(132, 1, 54, 0, '2025-03-13 03:35:16', '2025-03-13 03:35:16'),
(133, 1, 55, 0, '2025-03-13 03:35:20', '2025-03-13 03:35:20'),
(134, 1, 56, 0, '2025-03-13 03:35:26', '2025-03-13 03:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `noshows`
--

CREATE TABLE `noshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `event_id`, `rank`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 12, '2024-04-04 07:23:52', '2024-04-05 03:01:53'),
(2, 1, 2, 10, '2024-04-04 07:23:52', '2024-04-05 03:02:01'),
(3, 1, 3, 8, '2024-04-04 07:23:52', '2024-04-05 03:02:05'),
(4, 2, 1, 12, '2024-04-04 07:23:52', '2024-04-05 03:02:08'),
(5, 2, 2, 10, '2024-04-04 07:23:52', '2024-04-05 03:02:11'),
(6, 2, 3, 8, '2024-04-04 07:23:52', '2024-04-05 03:02:16'),
(7, 4, 1, 12, '2024-04-04 07:23:52', '2024-04-05 03:02:53'),
(8, 4, 2, 10, '2024-04-04 07:23:52', '2024-04-05 03:34:51'),
(9, 4, 3, 8, '2024-04-04 07:23:52', '2024-04-05 03:35:08'),
(10, 5, 1, 12, '2024-04-04 07:23:52', '2025-03-10 07:24:09'),
(11, 5, 2, 10, '2024-04-04 07:23:52', '2025-03-10 07:24:13'),
(12, 5, 3, 8, '2024-04-04 07:23:52', '2025-03-10 07:24:18'),
(13, 7, 1, 10, '2024-04-04 07:23:52', '2024-04-05 03:38:35'),
(14, 7, 2, 7, '2024-04-04 07:23:52', '2024-04-05 03:38:41'),
(15, 7, 3, 5, '2024-04-04 07:23:52', '2024-04-05 03:38:49'),
(22, 22, 1, 10, '2023-03-04 11:19:20', '2024-04-05 03:38:15'),
(23, 22, 2, 7, '2023-03-04 11:19:20', '2024-04-05 03:38:11'),
(24, 22, 3, 5, '2023-03-04 11:19:20', '2024-04-05 03:38:09'),
(25, 25, 1, 10, '2023-03-04 11:20:10', '2024-04-05 03:38:05'),
(26, 25, 2, 7, '2023-03-04 11:20:10', '2024-04-05 03:38:01'),
(27, 25, 3, 5, '2023-03-04 11:20:10', '2024-04-05 03:37:57'),
(28, 26, 1, 10, '2023-03-04 11:20:10', '2024-04-05 03:37:53'),
(29, 26, 2, 7, '2023-03-04 11:20:10', '2024-04-05 03:37:48'),
(30, 26, 3, 5, '2023-03-04 11:20:10', '2024-04-05 03:37:38'),
(31, 27, 1, 10, '2023-03-04 11:20:10', '2024-04-05 03:37:34'),
(32, 27, 2, 7, '2023-03-04 11:20:10', '2024-04-05 03:37:32'),
(33, 27, 3, 5, '2023-03-04 11:20:10', '2024-04-05 03:37:29'),
(34, 28, 1, 15, '2023-03-04 11:21:23', '2025-03-10 07:28:29'),
(35, 28, 2, 13, '2023-03-04 11:21:23', '2024-04-05 03:37:20'),
(36, 28, 3, 10, '2023-03-04 11:21:23', '2024-04-05 03:37:16'),
(37, 29, 1, 15, '2023-03-04 11:21:23', '2024-04-05 03:37:08'),
(38, 29, 2, 13, '2023-03-04 11:21:23', '2024-04-05 03:37:05'),
(39, 29, 3, 10, '2023-03-04 11:21:23', '2024-04-05 03:37:00'),
(58, 23, 1, 10, '2024-04-04 07:23:52', '2024-04-04 07:27:28'),
(59, 23, 2, 7, '2024-04-04 07:23:53', '2024-04-04 07:27:35'),
(60, 23, 3, 5, '2024-04-04 07:23:53', '2024-04-04 07:27:42'),
(61, 24, 1, 10, '2024-04-04 07:23:53', '2024-04-04 07:27:49'),
(62, 24, 2, 7, '2024-04-04 07:23:53', '2024-04-04 07:28:14'),
(63, 24, 3, 5, '2024-04-04 07:23:53', '2024-04-04 07:28:20'),
(70, 20, 1, 10, '2024-04-05 02:41:26', '2024-04-05 02:41:35'),
(71, 20, 2, 7, '2024-04-05 02:41:26', '2024-04-05 02:41:43'),
(72, 20, 3, 5, '2024-04-05 02:41:26', '2024-04-05 08:24:01'),
(73, 21, 1, 10, '2024-04-05 02:41:27', '2024-04-05 02:41:58'),
(74, 21, 2, 7, '2024-04-05 02:41:27', '2024-04-05 02:42:04'),
(75, 21, 3, 5, '2024-04-05 02:41:27', '2024-04-05 02:42:17'),
(79, 30, 1, 20, '2024-04-05 05:31:42', '2024-04-05 05:53:26'),
(80, 30, 2, 15, '2024-04-05 05:31:42', '2025-03-10 07:31:03'),
(81, 30, 3, 10, '2024-04-05 05:31:42', '2025-03-10 07:31:08'),
(100, 6, 1, 12, '2024-04-05 09:16:51', '2025-03-10 07:24:32'),
(101, 6, 2, 10, '2024-04-05 09:16:51', '2025-03-10 07:24:36'),
(102, 6, 3, 8, '2024-04-05 09:16:51', '2025-03-10 07:24:45'),
(103, 3, 1, 12, '2024-04-05 09:16:51', '2024-04-05 09:17:31'),
(104, 3, 2, 10, '2024-04-05 09:16:51', '2024-04-05 09:17:39'),
(105, 3, 3, 8, '2024-04-05 09:16:51', '2024-04-05 09:17:44'),
(106, 8, 1, 10, '2024-04-05 09:16:51', '2024-04-05 09:17:53'),
(107, 8, 2, 7, '2024-04-05 09:16:51', '2024-04-05 09:17:58'),
(108, 8, 3, 5, '2024-04-05 09:16:51', '2024-04-05 09:18:11'),
(109, 10, 1, 10, '2024-04-05 09:16:51', '2025-03-10 07:25:51'),
(110, 10, 2, 7, '2024-04-05 09:16:51', '2025-03-10 07:25:54'),
(111, 10, 3, 5, '2024-04-05 09:16:51', '2025-03-10 07:25:58'),
(112, 31, 1, 10, '2025-03-10 07:15:58', '2025-03-10 07:24:57'),
(113, 31, 2, 7, '2025-03-10 07:15:58', '2025-03-10 07:25:04'),
(114, 31, 3, 5, '2025-03-10 07:15:58', '2025-03-10 07:25:08'),
(115, 32, 1, 10, '2025-03-10 07:15:58', '2025-03-10 07:25:16'),
(116, 32, 2, 7, '2025-03-10 07:15:58', '2025-03-10 07:25:20'),
(117, 32, 3, 5, '2025-03-10 07:15:58', '2025-03-10 07:25:25'),
(118, 33, 1, 10, '2025-03-10 07:15:58', '2025-03-10 07:25:30'),
(119, 33, 2, 7, '2025-03-10 07:15:58', '2025-03-10 07:25:34'),
(120, 33, 3, 5, '2025-03-10 07:15:58', '2025-03-10 07:25:40'),
(121, 34, 1, 9, '2025-03-10 07:15:58', '2025-03-10 07:26:15'),
(122, 34, 2, 6, '2025-03-10 07:15:58', '2025-03-10 07:26:19'),
(123, 34, 3, 3, '2025-03-10 07:15:58', '2025-03-10 07:26:25'),
(124, 35, 1, 9, '2025-03-10 07:15:58', '2025-03-10 07:26:29'),
(125, 35, 2, 6, '2025-03-10 07:15:58', '2025-03-10 07:26:33'),
(126, 35, 3, 3, '2025-03-10 07:15:58', '2025-03-10 07:26:37'),
(127, 37, 1, 9, '2025-03-10 07:15:58', '2025-03-10 07:26:41'),
(128, 37, 2, 6, '2025-03-10 07:15:58', '2025-03-10 07:26:44'),
(129, 37, 3, 3, '2025-03-10 07:15:58', '2025-03-10 07:26:47'),
(130, 38, 1, 9, '2025-03-10 07:15:58', '2025-03-10 07:26:53'),
(131, 38, 2, 6, '2025-03-10 07:15:58', '2025-03-10 07:26:57'),
(132, 38, 3, 3, '2025-03-10 07:15:58', '2025-03-10 07:27:01'),
(133, 39, 1, 9, '2025-03-10 07:15:58', '2025-03-10 07:27:04'),
(134, 39, 2, 6, '2025-03-10 07:15:58', '2025-03-10 07:27:08'),
(135, 39, 3, 3, '2025-03-10 07:15:58', '2025-03-10 07:27:11'),
(136, 40, 1, 9, '2025-03-10 07:15:58', '2025-03-10 07:27:16'),
(137, 40, 2, 6, '2025-03-10 07:15:58', '2025-03-10 07:27:20'),
(138, 40, 3, 3, '2025-03-10 07:15:58', '2025-03-10 07:27:24'),
(142, 41, 1, 9, '2025-03-10 07:23:38', '2025-03-10 07:27:29'),
(143, 41, 2, 6, '2025-03-10 07:23:38', '2025-03-10 07:27:33'),
(144, 41, 3, 3, '2025-03-10 07:23:38', '2025-03-10 07:27:35'),
(145, 42, 1, 9, '2025-03-10 07:23:38', '2025-03-10 07:27:39'),
(146, 42, 2, 6, '2025-03-10 07:23:38', '2025-03-10 07:27:42'),
(147, 42, 3, 3, '2025-03-10 07:23:38', '2025-03-10 07:27:46'),
(148, 43, 1, 15, '2025-03-12 12:08:24', '2025-03-12 12:08:57'),
(149, 43, 2, 12, '2025-03-12 12:08:24', '2025-03-12 12:09:04'),
(150, 43, 3, 10, '2025-03-12 12:08:24', '2025-03-12 12:09:09'),
(151, 44, 1, 10, '2025-03-12 12:08:24', '2025-03-12 12:09:20'),
(152, 44, 2, 7, '2025-03-12 12:08:24', '2025-03-12 12:09:26'),
(153, 44, 3, 5, '2025-03-12 12:08:24', '2025-03-12 12:09:31'),
(154, 45, 1, 10, '2025-03-12 12:08:24', '2025-03-12 12:09:39'),
(155, 45, 2, 7, '2025-03-12 12:08:24', '2025-03-12 12:09:42'),
(156, 45, 3, 5, '2025-03-12 12:08:24', '2025-03-12 12:09:49'),
(160, 47, 1, 9, '2025-03-13 03:24:47', '2025-03-13 03:25:22'),
(161, 47, 2, 6, '2025-03-13 03:24:47', '2025-03-13 03:25:27'),
(162, 47, 3, 3, '2025-03-13 03:24:47', '2025-03-13 03:25:32'),
(163, 48, 1, 9, '2025-03-13 03:24:47', '2025-03-13 03:25:36'),
(164, 48, 2, 6, '2025-03-13 03:24:47', '2025-03-13 03:25:42'),
(165, 48, 3, 3, '2025-03-13 03:24:47', '2025-03-13 03:25:47'),
(166, 49, 1, 9, '2025-03-13 03:24:47', '2025-03-13 03:25:51'),
(167, 49, 2, 6, '2025-03-13 03:24:47', '2025-03-13 03:25:57'),
(168, 49, 3, 3, '2025-03-13 03:24:47', '2025-03-13 03:26:04'),
(169, 50, 1, 9, '2025-03-13 03:24:47', '2025-03-13 03:26:10'),
(170, 50, 2, 6, '2025-03-13 03:24:47', '2025-03-13 03:26:16'),
(171, 50, 3, 3, '2025-03-13 03:24:47', '2025-03-13 03:26:22'),
(172, 55, 1, 9, '2025-03-13 03:42:00', '2025-03-13 12:02:08'),
(173, 55, 2, 6, '2025-03-13 03:42:00', '2025-03-13 12:02:14'),
(174, 55, 3, 3, '2025-03-13 03:42:00', '2025-03-13 12:02:19'),
(175, 52, 1, 9, '2025-03-13 03:43:15', '2025-03-13 12:01:14'),
(176, 52, 2, 6, '2025-03-13 03:43:15', '2025-03-13 12:01:18'),
(177, 52, 3, 3, '2025-03-13 03:43:15', '2025-03-13 12:01:28'),
(178, 51, 1, 9, '2025-03-13 03:52:41', '2025-03-13 12:00:49'),
(179, 51, 2, 6, '2025-03-13 03:52:41', '2025-03-13 12:01:04'),
(180, 51, 3, 3, '2025-03-13 03:52:41', '2025-03-13 12:01:08'),
(181, 53, 1, 9, '2025-03-13 03:52:43', '2025-03-13 12:01:39'),
(182, 53, 2, 6, '2025-03-13 03:52:43', '2025-03-13 12:01:43'),
(183, 53, 3, 3, '2025-03-13 03:52:43', '2025-03-13 12:01:47'),
(184, 54, 1, 9, '2025-03-13 03:52:44', '2025-03-13 12:01:52'),
(185, 54, 2, 6, '2025-03-13 03:52:44', '2025-03-13 12:02:00'),
(186, 54, 3, 3, '2025-03-13 03:52:44', '2025-03-13 12:02:04'),
(187, 56, 1, 9, '2025-03-13 03:52:46', '2025-03-13 12:02:49'),
(188, 56, 2, 6, '2025-03-13 03:52:46', '2025-03-13 12:02:53'),
(189, 56, 3, 3, '2025-03-13 03:52:46', '2025-03-13 12:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `criteria_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(32) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `color`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Abnegation', 'yellow', 'abnegation.png', '2023-02-19 06:45:06', '2025-03-10 08:10:50'),
(2, 'Erudite', 'blue', 'erudite.png', '2023-02-19 06:45:27', '2025-03-10 08:10:58'),
(3, 'Dauntless', 'red', 'dauntless.png', '2023-02-19 06:45:42', '2025-03-10 08:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `technicals`
--

CREATE TABLE `technicals` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technicals`
--

INSERT INTO `technicals` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'TECHNICAL', 'no-avatar.jpg', 'technical01', 'technical01', NULL, NULL, NULL, '2023-02-19 08:58:58', '2025-03-17 04:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE `technical_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technical_event`
--

INSERT INTO `technical_event` (`id`, `technical_id`, `event_id`, `created_at`, `updated_at`) VALUES
(2, 1, 25, '2023-02-25 12:11:35', '2024-04-05 03:41:19'),
(3, 1, 26, '2023-02-25 12:11:35', '2024-04-05 03:41:23'),
(4, 1, 27, '2023-02-25 12:11:35', '2024-04-05 03:41:25'),
(5, 1, 28, '2023-02-25 12:11:35', '2024-04-05 03:41:28'),
(6, 1, 29, '2023-02-25 12:11:35', '2024-04-05 03:41:30'),
(8, 1, 24, '2024-04-05 02:06:44', '2024-04-05 03:41:36'),
(15, 1, 22, '2025-03-10 09:08:04', '2025-03-10 09:08:04'),
(17, 1, 23, '2025-03-10 09:09:29', '2025-03-10 09:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `event_id`, `rank`, `title`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Basketball (Men) 3x3 Champion', '2024-04-05 08:31:27', '2025-03-12 12:18:12'),
(2, 2, 2, '1st Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:32:11'),
(3, 2, 3, '2nd Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:32:20'),
(4, 1, 1, 'Basketball (Men) 5x5 Champion', '2024-04-05 08:31:27', '2025-03-12 12:18:05'),
(5, 1, 2, '1st Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:31:44'),
(6, 1, 3, '2nd Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:31:54'),
(7, 7, 1, 'Badminton Single (Men) Champion ', '2024-04-05 08:31:27', '2025-03-12 12:17:40'),
(8, 7, 2, '1st Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:34:08'),
(9, 7, 3, '2nd Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:34:14'),
(13, 5, 1, 'Volleyball (Women) Champion', '2024-04-05 08:31:27', '2025-03-12 12:18:32'),
(14, 5, 2, '1st Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:33:31'),
(15, 5, 3, '2nd Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:33:40'),
(16, 4, 1, 'Volleyball (Men) Champion', '2024-04-05 08:31:27', '2025-03-12 12:13:46'),
(17, 4, 2, '1st Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:32:44'),
(18, 4, 3, '2nd Runner Up', '2024-04-05 08:31:27', '2024-04-05 08:33:13'),
(46, 20, 1, 'Mobile Legends (Category A) Champion', '2024-04-05 08:31:27', '2024-04-05 08:39:11'),
(47, 20, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:39:21'),
(48, 20, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:39:40'),
(49, 21, 1, 'Mobile Legends (Category B) Champion', '2024-04-05 08:31:28', '2024-04-05 08:39:55'),
(50, 21, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:40:05'),
(51, 21, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:40:12'),
(52, 22, 1, 'Oration Champion', '2024-04-05 08:31:28', '2024-04-05 08:40:16'),
(53, 22, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:40:21'),
(54, 22, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:40:26'),
(55, 23, 1, 'Extemporaneous Speaking Champion', '2024-04-05 08:31:28', '2024-04-05 08:41:00'),
(56, 23, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:04'),
(57, 23, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:07'),
(58, 24, 1, 'Tigsik Champion', '2024-04-05 08:31:28', '2024-04-05 08:41:14'),
(59, 24, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:19'),
(60, 24, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:28'),
(61, 25, 1, 'Vocal Solo Male Champion', '2024-04-05 08:31:28', '2024-04-05 08:41:43'),
(62, 25, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:46'),
(63, 25, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:42:05'),
(64, 26, 1, 'Vocal Solo Female Champion', '2024-04-05 08:31:28', '2024-04-05 08:42:26'),
(65, 26, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:47'),
(66, 26, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:42:07'),
(67, 27, 1, 'Vocal Duet Champion', '2024-04-05 08:31:28', '2024-04-05 08:42:33'),
(68, 27, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:48'),
(69, 27, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:42:08'),
(70, 29, 1, 'Jazz Dance Champion', '2024-04-05 08:31:28', '2024-04-05 08:42:39'),
(71, 29, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:52'),
(72, 29, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:42:10'),
(73, 28, 1, 'Folk Dance Champion', '2024-04-05 08:31:28', '2024-04-05 08:42:45'),
(74, 28, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:54'),
(75, 28, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:42:11'),
(76, 30, 1, 'Mass Demo Champion', '2024-04-05 08:31:28', '2025-03-11 10:22:29'),
(77, 30, 2, '1st Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:41:59'),
(78, 30, 3, '2nd Runner Up', '2024-04-05 08:31:28', '2024-04-05 08:42:15'),
(79, 6, 1, 'Sepak Takraw (Men) Champion ', '2024-04-05 09:09:56', '2025-03-13 03:12:13'),
(80, 6, 2, '1st Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:31'),
(81, 6, 3, '2nd Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:57'),
(82, 3, 1, 'Basketball (Women) 3x3 Champion', '2024-04-05 09:09:56', '2025-03-12 12:18:22'),
(83, 3, 2, '1st Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:32'),
(84, 3, 3, '2nd Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:49'),
(85, 8, 1, 'Badminton Single (Women) Champion', '2024-04-05 09:09:56', '2025-03-12 12:18:46'),
(86, 8, 2, '1st Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:35'),
(87, 8, 3, '2nd Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:50'),
(88, 10, 1, 'Badminton Double (Men) Champion', '2024-04-05 09:09:56', '2025-03-12 12:18:54'),
(89, 10, 2, '1st Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:44'),
(90, 10, 3, '2nd Runner Up', '2024-04-05 09:09:56', '2024-04-05 09:10:48'),
(91, 31, 1, 'Badminton Double(Women) Champion ', '2025-03-10 08:13:26', '2025-03-12 12:18:58'),
(92, 31, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:14:32'),
(93, 31, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:14:38'),
(94, 32, 1, 'Table Tennis (Men) Champion ', '2025-03-10 08:13:26', '2025-03-12 12:19:12'),
(95, 32, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:15:20'),
(96, 32, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:15:25'),
(97, 33, 1, 'Table Tennis (Women) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:15:48'),
(98, 33, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:15:50'),
(99, 33, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:15:58'),
(100, 34, 1, 'Chess (Men) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:16:20'),
(101, 34, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:16:22'),
(102, 34, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:16:28'),
(103, 35, 1, 'Chess (Women) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:16:35'),
(104, 35, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:16:38'),
(105, 35, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:16:42'),
(106, 37, 1, 'Word Factory (Men) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:17:09'),
(107, 37, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:17:12'),
(108, 37, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:17:21'),
(109, 38, 1, 'Word Factory (Women) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:17:31'),
(110, 38, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:17:36'),
(111, 38, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:17:41'),
(112, 39, 1, 'Scrabble (Men) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:17:56'),
(113, 39, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:17:58'),
(114, 39, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:18:03'),
(115, 40, 1, 'Scrabble (Women) Champion', '2025-03-10 08:13:26', '2025-03-10 08:18:14'),
(116, 40, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:18:17'),
(117, 40, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:18:19'),
(118, 41, 1, 'Games of the general (Men) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:18:51'),
(119, 41, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:18:54'),
(120, 41, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:19:00'),
(121, 42, 1, 'Games of the general (Women) Champion ', '2025-03-10 08:13:26', '2025-03-10 08:19:10'),
(122, 42, 2, '1st Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:19:12'),
(123, 42, 3, '2nd Runner Up', '2025-03-10 08:13:26', '2025-03-10 08:19:44'),
(127, 43, 1, 'Short Film Champion', '2025-03-12 12:10:05', '2025-03-12 12:10:55'),
(128, 43, 2, '1st Runner Up', '2025-03-12 12:10:05', '2025-03-12 12:11:04'),
(129, 43, 3, '2nd Runner Up', '2025-03-12 12:10:05', '2025-03-12 12:11:09'),
(130, 44, 1, ' Photography Champion', '2025-03-12 12:10:05', '2025-03-12 12:11:17'),
(131, 44, 2, '1st Runner Up', '2025-03-12 12:10:05', '2025-03-12 12:11:20'),
(132, 44, 3, '2nd Runner Up', '2025-03-12 12:10:05', '2025-03-12 12:11:24'),
(133, 45, 1, 'Digital Poster Making  Champion', '2025-03-12 12:10:05', '2025-03-12 12:11:34'),
(134, 45, 2, '1st Runner Up', '2025-03-12 12:10:05', '2025-03-12 12:11:37'),
(135, 45, 3, '2nd Runner Up', '2025-03-12 12:10:05', '2025-03-12 12:11:42'),
(139, 47, 1, '100m Run Champion', '2025-03-13 03:22:57', '2025-03-13 03:23:14'),
(140, 47, 2, '1st Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:23:19'),
(141, 47, 3, '2nd Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:23:23'),
(142, 48, 1, '4x100m Relay Champion', '2025-03-13 03:22:57', '2025-03-13 03:23:33'),
(143, 48, 2, '1st Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:23:39'),
(144, 48, 3, '2nd Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:23:44'),
(145, 49, 1, 'Discuss Throw (Men) Champion', '2025-03-13 03:22:57', '2025-03-13 03:24:01'),
(146, 49, 2, '1st Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:24:05'),
(147, 49, 3, '2nd Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:24:09'),
(148, 50, 1, ' Discuss Throw (Women) Champion', '2025-03-13 03:22:57', '2025-03-13 03:24:26'),
(149, 50, 2, '1st Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:24:33'),
(150, 50, 3, '2nd Runner Up', '2025-03-13 03:22:57', '2025-03-13 03:24:44'),
(151, 51, 1, '100m Run (Women) Champion', '2025-03-13 03:30:11', '2025-03-13 03:30:29'),
(152, 51, 2, '1st Runner Up', '2025-03-13 03:30:11', '2025-03-13 03:30:36'),
(153, 51, 3, '2nd Runner Up', '2025-03-13 03:30:11', '2025-03-13 03:30:42'),
(154, 52, 1, '4x100m Relay (Women) Champion', '2025-03-13 03:30:11', '2025-03-13 03:47:01'),
(155, 52, 2, '1st Runner Up', '2025-03-13 03:30:11', '2025-03-13 03:30:39'),
(156, 52, 3, '2nd Runner Up', '2025-03-13 03:30:11', '2025-03-13 03:30:45'),
(157, 53, 1, 'Javelin Throw (Men) Champion', '2025-03-13 03:35:32', '2025-03-13 03:35:52'),
(158, 53, 2, '1st Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:35:56'),
(159, 53, 3, '2nd Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:36:08'),
(160, 54, 1, 'Javelin Throw (Women) Champion', '2025-03-13 03:35:32', '2025-03-13 03:36:27'),
(161, 54, 2, '1st Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:35:59'),
(162, 54, 3, '2nd Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:36:10'),
(163, 55, 1, 'Shot Put (Men) Champion', '2025-03-13 03:35:32', '2025-03-13 03:36:42'),
(164, 55, 2, '1st Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:36:00'),
(165, 55, 3, '2nd Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:36:11'),
(166, 56, 1, 'Shot Put (Women) Champion', '2025-03-13 03:35:32', '2025-03-13 03:45:38'),
(167, 56, 2, '1st Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:36:04'),
(168, 56, 3, '2nd Runner Up', '2025-03-13 03:35:32', '2025-03-13 03:36:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`category_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `noshows`
--
ALTER TABLE `noshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicals`
--
ALTER TABLE `technicals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangements`
--
ALTER TABLE `arrangements`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `noshows`
--
ALTER TABLE `noshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `technicals`
--
ALTER TABLE `technicals`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technical_event`
--
ALTER TABLE `technical_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD CONSTRAINT `arrangements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrangements_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD CONSTRAINT `eliminations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eliminations_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD CONSTRAINT `judge_event_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noshows`
--
ALTER TABLE `noshows`
  ADD CONSTRAINT `noshows_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noshows_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD CONSTRAINT `technical_event_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
