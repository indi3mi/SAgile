-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 30, 2023 at 04:52 PM
-- Server version: 5.7.40
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kanban`
--
CREATE DATABASE IF NOT EXISTS `kanban` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kanban`;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `name`, `file_path`, `created_at`, `updated_at`) VALUES
(1, '1611019679_intro.docx', '/storage/uploads/1611019678_intro.docx', '2021-01-18 17:27:59', '2021-01-18 17:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `boardId` int(11) NOT NULL,
  `totalTaskFilter` int(11) NOT NULL,
  `tasksDoneFilter` int(11) NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `title`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(18, 'Progress Meeting', '2022-12-30 00:00:00', '2022-12-31 00:00:00', '2022-12-31 15:34:09', '2023-01-24 17:01:55'),
(24, 'Standup Meeting', '2023-01-11 00:00:00', '2023-01-12 00:00:00', '2023-01-18 21:49:31', '2023-01-24 17:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `charts`
--

CREATE TABLE `charts` (
  `id` int(10) UNSIGNED NOT NULL,
  `boardId` int(11) NOT NULL,
  `sprintname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storyPointsTotal` double(5,1) NOT NULL,
  `tasksTotal` double(5,1) NOT NULL,
  `tasksDone` double(5,1) NOT NULL,
  `storyPointsDone` double(5,1) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `sprintDay` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coding_standards`
--

CREATE TABLE `coding_standards` (
  `codestand_id` bigint(20) UNSIGNED NOT NULL,
  `codestand_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coding_standards`
--

INSERT INTO `coding_standards` (`codestand_id`, `codestand_name`, `created_at`, `updated_at`) VALUES
(1, 'Security includes', NULL, '2021-06-26 04:32:05'),
(4, 'QR code', '2021-06-14 21:00:39', '2021-06-14 21:00:39'),
(6, 'example', '2021-06-26 18:53:35', '2021-06-26 18:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `defect`
--

CREATE TABLE `defect` (
  `def_id` int(11) NOT NULL,
  `def_title` varchar(70) NOT NULL,
  `def_desc` varchar(255) NOT NULL,
  `def_status` varchar(50) NOT NULL COMMENT '1-New, 2-Assigned, 3-Open, 4-Fixed, 5-Pending Retest, 6-Retest, 7-Verified, 8-Closed',
  `def_severity` varchar(50) NOT NULL COMMENT '5-Critical, 4-Major, 3-Moderate, 2-Minor, 1-Cosmetic',
  `def_actual_result` varchar(255) NOT NULL,
  `def_expected_result` varchar(255) NOT NULL,
  `def_flow` longtext NOT NULL,
  `def_attachment` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defect`
--

INSERT INTO `defect` (`def_id`, `def_title`, `def_desc`, `def_status`, `def_severity`, `def_actual_result`, `def_expected_result`, `def_flow`, `def_attachment`, `project_id`, `createdBy`, `created_at`, `updated_at`) VALUES
(2, 'Modal does not pop up', 'Modal does not pop up when button is clicked', 'New', 'Cosmetic', 'No action', 'Modal will pop up upon click', 'step1\nstep2\nstep3', 'WhatsApp Image 2023-01-13 at 14.38.12.jpeg', 20, 18, '2022-12-05 07:19:48', '2022-12-05 07:19:48'),
(3, 'System error upon submit', 'System display error', 'New', 'Critical', 'error', 'Return to homepage', 'step1\nstep2\nstep3', 'WhatsApp Image 2023-01-13 at 14.38.12.jpeg', 20, 18, '2022-12-05 08:24:34', '2022-12-05 08:24:34'),
(5, 'Defect Voting', 'Unable to click', 'New', 'Cosmetic', 'ada defect', 'tiada defect', 'step1\nstep2\nstep3', 'WhatsApp Image 2023-01-13 at 14.38.12.jpeg', 20, 19, '2023-01-18 19:57:15', '2023-01-18 19:57:15'),
(6, 'Unable to Order', 'foodmeow not allow order cat', 'Fixed', 'Critical', 'error', 'submit successfully', 'step1\r\nstep2\r\nstep3', 'WhatsApp Image 2023-01-13 at 14.38.12.jpeg', 21, 19, '2023-01-24 09:49:09', '2023-01-24 09:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `defect_features`
--

CREATE TABLE `defect_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `defect_features`
--

INSERT INTO `defect_features` (`id`, `title`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'login', 'cannot input email', '2021-06-26 16:25:51', '2021-06-26 16:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `forumID` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `forumTitle` varchar(50) DEFAULT NULL,
  `forumDesc` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(50) NOT NULL,
  `thread_parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`forumID`, `project_id`, `forumTitle`, `forumDesc`, `updated_at`, `created_at`, `createdBy`, `thread_parent`) VALUES
(28, 23, 'OPAC ILS', 'I want to know how to browse OPAC. Can anyone help?', '2023-01-24 16:57:47', '2023-01-24 16:57:47', '18', 0),
(29, 23, NULL, 'How can i borrow a book?', '2023-01-24 17:00:45', '2023-01-24 17:00:45', '18', 28),
(30, 19, 'I want to rent car', 'I want to rent car', '2023-01-25 04:05:50', '2023-01-25 04:05:50', '17', 0),
(31, 19, NULL, 'What car do you want?', '2023-01-25 04:06:47', '2023-01-25 04:06:47', '17', 30);

-- --------------------------------------------------------

--
-- Table structure for table `mappings`
--

CREATE TABLE `mappings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ustory_id` int(11) NOT NULL,
  `type_NFR` int(11) NOT NULL,
  `id_NFR` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mappings`
--

INSERT INTO `mappings` (`id`, `ustory_id`, `type_NFR`, `id_NFR`, `created_at`, `updated_at`) VALUES
(1, 25, 1, 1, '2021-06-26 01:50:17', '2021-06-26 01:50:17'),
(2, 25, 1, 1, '2021-06-26 01:50:40', '2021-06-26 01:50:40'),
(3, 25, 2, 2, '2021-06-26 01:50:40', '2021-06-26 01:50:40'),
(4, 25, 1, 1, '2021-06-26 01:51:08', '2021-06-26 01:51:08'),
(5, 25, 2, 2, '2021-06-26 01:51:08', '2021-06-26 01:51:08'),
(6, 25, 1, 1, '2021-06-26 01:51:50', '2021-06-26 01:51:50'),
(7, 25, 2, 2, '2021-06-26 01:51:50', '2021-06-26 01:51:50'),
(8, 25, 1, 1, '2021-06-26 01:52:18', '2021-06-26 01:52:18'),
(9, 25, 2, 2, '2021-06-26 01:52:18', '2021-06-26 01:52:18'),
(10, 25, 1, 1, '2021-06-26 02:01:26', '2021-06-26 02:01:26'),
(11, 25, 2, 2, '2021-06-26 02:01:26', '2021-06-26 02:01:26'),
(12, 38, 1, 1, '2021-06-26 07:45:51', '2021-06-26 07:45:51'),
(13, 38, 2, 2, '2021-06-26 07:45:51', '2021-06-26 07:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_03_16_084930_create_roles_table', 1),
(3, '2019_03_27_154105_create_projects_table', 1),
(4, '2019_05_05_171853_create_priorities_table', 1),
(5, '2019_05_05_174636_create_security_features_table', 1),
(6, '2019_05_07_143235_create_performance_features_table', 1),
(7, '2019_05_09_031717_create_product_features_table', 1),
(8, '2019_05_26_195719_create_defect_features_table', 1),
(9, '2019_06_29_163059_create_mappings_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2020_05_27_040214_create_tasks_table', 1),
(12, '2020_05_27_042541_create_statuses_table', 1),
(13, '2020_08_09_024542_create_teams_table', 1),
(14, '2020_08_18_123517_create_users_table', 1),
(15, '2020_08_20_012325_create_attachments_table', 1),
(16, '2020_08_23_090144_create_team_mappings_table', 1),
(17, '2020_09_12_015732_create_sprint_table', 1),
(18, '2020_09_14_083251_create_user_stories_table', 1),
(19, '2020_09_17_133209_create_coding_standards_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('40877e99-cf4f-4961-8fc1-5f05b1720fb2', 'App\\Notifications\\NotificationController', 19, 'App\\User', '{\"proj_name\":\"Diet Tracker\"}', '2023-01-18 15:51:25', '2023-01-18 15:51:11', '2023-01-18 15:51:25'),
('7b29d4e2-bb64-42dc-997e-f6a3ab03d395', 'App\\Notifications\\ForumNotification', 18, 'App\\User', '{\"forumLink\":\"http:\\/\\/localhost:8000\\/forum\\/23\\/28\\/detail\",\"forumTitle\":\"OPAC ILS\",\"commenter\":\"Faizah Faiqah\"}', '2023-01-24 17:01:04', '2023-01-24 17:00:46', '2023-01-24 17:01:04'),
('bb8b2dd2-a31e-4a0c-a6e5-d24f19895dce', 'App\\Notifications\\NotificationController', 19, 'App\\User', '{\"proj_name\":\"Fashion E-commerce\"}', '2023-01-24 16:51:24', '2023-01-18 15:51:11', '2023-01-24 16:51:24'),
('d4507795-4cb9-4ac5-bbe9-557d5c4e7900', 'App\\Notifications\\ForumNotification', 17, 'App\\User', '{\"forumLink\":\"http:\\/\\/localhost:8000\\/forum\\/19\\/30\\/detail\",\"forumTitle\":\"I want to rent car\",\"commenter\":\"Faizah Faiqah\"}', NULL, '2023-01-25 04:06:51', '2023-01-25 04:06:51'),
('d8f9096f-5d36-4a6c-8e85-d96b5ee23d2a', 'App\\Notifications\\NotificationController', 17, 'App\\User', '{\"proj_name\":\"Project Megah Holding\"}', '2023-01-25 04:04:13', '2023-01-18 15:51:11', '2023-01-25 04:04:13'),
('e609b478-ac3e-487c-9aa8-34a1f15342e1', 'App\\Notifications\\ForumNotification', 17, 'App\\User', '{\"forumLink\":\"http:\\/\\/localhost:8000\\/forum\\/19\\/5\\/detail\",\"forumTitle\":\"Aum Jeevan\",\"commenter\":\"Faizah Faiqah\"}', '2023-01-24 14:23:10', '2023-01-24 14:22:38', '2023-01-24 14:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nadia.nzr26@gmail.com', '$2y$10$yKi0wckYnSUcWTgvOF7oLul7Cg9bWg5fRUqNq2Y/HbFBXY89rifmW', '2021-06-12 23:02:51'),
('nadia.nzr26@gmail.com', '$2y$10$yKi0wckYnSUcWTgvOF7oLul7Cg9bWg5fRUqNq2Y/HbFBXY89rifmW', '2021-06-12 23:02:51');

-- --------------------------------------------------------

--
-- Table structure for table `performance_features`
--

CREATE TABLE `performance_features` (
  `perfeature_id` bigint(20) UNSIGNED NOT NULL,
  `perfeature_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `performance_features`
--

INSERT INTO `performance_features` (`perfeature_id`, `perfeature_name`, `created_at`, `updated_at`) VALUES
(1, 'Loading Time', '2021-01-18 16:39:02', '2021-01-18 16:39:02'),
(2, 'Buffering Time', '2021-01-18 16:39:09', '2021-01-18 16:39:09'),
(3, 'Response Time', '2021-01-18 16:39:22', '2021-01-18 16:39:22'),
(4, 'Time', '2021-01-18 17:26:55', '2021-01-18 17:26:55'),
(8, 'example', '2021-06-26 18:52:38', '2021-06-26 18:52:38'),
(6, 'Loadings times', '2021-06-14 20:59:39', '2021-06-14 20:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `prio_id` bigint(20) UNSIGNED NOT NULL,
  `prio_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`prio_id`, `prio_name`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, NULL),
(2, '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profeature_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL,
  `proj_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proj_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ProjectManager` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScrumMaster` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SystemAnalyst` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ChiefProgrammer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programmer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SoftwareTester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_project` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `proj_name`, `proj_desc`, `start_date`, `end_date`, `ProjectManager`, `ScrumMaster`, `SystemAnalyst`, `ChiefProgrammer`, `Programmer`, `SoftwareTester`, `User`, `created_at`, `updated_at`, `status_project`, `progress`) VALUES
(1, 1, 'Java', 'Programming', '2021-01-05', '2021-07-30', '', '', '', '', '', '', '', NULL, '2022-12-31 02:46:00', 'New', 0),
(2, 1, 'Newy', 'New', '2021-06-10', '2021-07-10', '', '', '', '', '', '', '', '2021-06-10 00:03:17', '2021-06-13 22:44:05', '', 0),
(18, 1, 'SDA', 'SDA prototype', '2022-01-25', '2022-02-25', '', '', '', '', '', '', '', '2022-01-25 05:52:01', '2022-01-25 05:52:01', '', 0),
(19, 17, 'Car Rental System', 'Car renting services', '2022-11-15', '2023-02-15', '', '', '', '', '', '', '', '2022-11-15 09:04:29', '2022-11-15 09:04:29', '', 50),
(20, 19, 'Voting System', 'online voting', '2022-11-27', '2023-03-15', '', '', '', '', '', '', '', '2022-11-27 14:55:08', '2022-12-30 09:25:38', 'In Progress', 0),
(21, 19, 'Food Delivery', 'Food Delivery System', '2022-12-07', '2023-07-05', '', '', '', '', '', '', '', '2022-12-07 08:41:58', '2022-12-07 08:41:58', 'In Progress', 33),
(23, 18, 'Library System', 'UTM library system', '2022-12-20', '2022-12-26', '', '', '', '', '', '', '', '2022-12-20 15:13:43', '2022-12-20 15:13:43', 'Completed', 100),
(25, 18, 'Diet Tracker', 'Everyday meal preparation', '2023-01-18', '2023-02-08', '17', '5', '1', '4', '18', '10', '9', '2023-01-18 15:51:10', '2023-01-18 15:51:10', 'New', 0),
(26, 17, 'Project Megah Holding', 'project under megah holding', '2023-01-24', '2023-02-07', '17', '19', NULL, '4', '14', '10', '18', '2023-01-24 13:57:55', '2023-01-24 13:57:55', 'New', 0),
(27, 19, 'Fashion E-commerce', 'made in Malaysia', '2023-01-25', '2023-02-08', '17', '19', NULL, '4', '14', '3', '18', '2023-01-24 16:42:52', '2023-01-24 16:42:52', 'New', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Project Manager', NULL, NULL),
(2, 'Scrum Master', '2021-01-04 08:43:41', '2021-01-04 08:43:41'),
(3, 'Software Tester', '2021-01-04 08:43:55', '2021-01-04 08:43:55'),
(4, 'Chief Programmer', '2021-01-04 08:44:23', '2021-01-04 08:44:23'),
(5, 'Programmer', '2021-01-18 17:25:15', '2021-01-18 17:25:15'),
(7, 'System Analyst', '2021-06-14 21:01:08', '2021-06-26 04:34:09'),
(11, 'User', '2021-06-26 18:53:48', '2021-06-26 18:53:48'),
(10, 'PM', '2021-06-26 08:35:39', '2021-06-26 08:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `security_features`
--

CREATE TABLE `security_features` (
  `SecFeature_id` bigint(20) UNSIGNED NOT NULL,
  `secfeature_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secfeature_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `security_features`
--

INSERT INTO `security_features` (`SecFeature_id`, `secfeature_name`, `secfeature_desc`, `created_at`, `updated_at`) VALUES
(1, 'SQL Injection', 'Avoid any hacker', '2021-01-18 16:37:58', '2021-01-18 16:37:58'),
(2, 'Cross_Site Scripting', 'Malicious Scripts', '2021-01-18 16:38:24', '2021-01-18 16:38:24'),
(3, 'SQL', 'sql', '2021-01-18 17:27:10', '2021-01-18 17:27:10'),
(6, 'DDos', 'asdasd', '2021-06-26 04:29:39', '2021-06-26 04:29:39'),
(7, 'test', 'test', '2021-06-26 08:34:30', '2021-06-26 08:34:30'),
(8, 'example', 'ex', '2021-06-26 18:52:51', '2021-06-26 18:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `sprint`
--

CREATE TABLE `sprint` (
  `sprint_id` bigint(20) UNSIGNED NOT NULL,
  `sprint_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sprint_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_sprint` date NOT NULL,
  `end_sprint` date NOT NULL,
  `proj_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sprint`
--

INSERT INTO `sprint` (`sprint_id`, `sprint_name`, `sprint_desc`, `start_sprint`, `end_sprint`, `proj_name`, `users_name`, `created_at`, `updated_at`) VALUES
(1, 'Sprint 1', 'Sprint 1', '2021-01-05', '2021-02-05', 'Java', 'nadianazri', NULL, NULL),
(2, 'Sprint 2', 'Sprint 2', '2021-01-12', '2021-02-05', 'Java', 'diyana', '2021-02-12 06:07:36', '2021-02-12 06:07:36'),
(3, 'Sprint 3', 'Sprint 3', '2021-02-01', '2021-02-28', 'Java', 'haniza', '2021-06-10 19:10:06', '2021-06-10 19:10:06'),
(8, 'Sprint 4', 'Sprint 4', '2021-06-15', '2021-07-15', 'Java', 'nazirah', '2021-06-14 20:55:33', '2021-06-14 20:55:33'),
(9, 'Sprint 1', 'Sprint 1', '2021-06-11', '2021-06-18', 'Newy', 'diyana', '2021-06-25 20:29:27', '2021-06-25 20:29:27'),
(10, 'Sprint 1', 'Sprint 1', '2021-06-24', '2021-07-01', 'fs', 'haniza', '2021-06-25 20:30:06', '2021-06-25 20:30:06'),
(11, 'Sprint 1', 'Sprint 1', '2021-06-27', '2021-07-03', 'adas', 'diyana', '2021-06-26 04:05:29', '2021-06-26 04:05:29'),
(13, 'Sprint 1', 'Sprint 1', '2021-06-27', '2021-07-04', 'ada', 'diyana', '2021-06-26 05:00:02', '2021-06-26 05:00:02'),
(14, 'Sprint 1', 'Sprint', '2021-06-27', '2021-07-04', 'asasdas', 'nazirah', '2021-06-26 05:04:36', '2021-06-26 05:08:11'),
(16, 'Sprint 2', 'Sprint 2', '2021-07-11', '2021-07-18', 'asasdas', 'nazirah', '2021-06-26 05:27:38', '2021-06-26 05:27:38'),
(17, 'Sprint 4', 'Sprint 4', '2021-06-27', '2021-07-04', 'asasdas', 'haniza', '2021-06-26 05:37:55', '2021-06-26 05:37:55'),
(21, 'Sprint 1001', 'Sprint 1', '2021-06-28', '2021-07-04', 'New', 'nazirah', '2021-06-26 18:48:15', '2021-06-26 18:48:15'),
(23, 'Sprint 100', 'Sprint 100', '2021-01-12', '2021-01-21', 'Java', 'haniza', '2022-01-23 08:51:30', '2022-01-23 08:51:30'),
(26, 'Sprint 1', 'first sprint', '2023-01-25', '2023-02-08', 'Car Rental System', 'faizahUser', '2023-01-25 04:10:09', '2023-01-25 04:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `title`, `slug`, `order`, `user_id`) VALUES
(62, 'Backlog', 'backlog', 1, 14),
(2, 'Up Next', 'up-next', 2, 1),
(3, 'In Progress', 'in-progress', 3, 1),
(4, 'Done', 'done', 4, 1),
(5, 'Backlog', 'backlog', 1, 2),
(6, 'Up Next', 'up-next', 2, 2),
(7, 'In Progress', 'in-progress', 3, 2),
(8, 'Done', 'done', 4, 2),
(9, 'Backlog', 'backlog', 1, 3),
(10, 'Up Next', 'up-next', 2, 3),
(11, 'In Progress', 'in-progress', 3, 3),
(12, 'Done', 'done', 4, 3),
(13, 'Backlog', 'backlog', 1, 4),
(14, 'Up Next', 'up-next', 2, 4),
(15, 'In Progress', 'in-progress', 3, 4),
(16, 'Done', 'done', 4, 4),
(17, 'Backlog', 'backlog', 1, 5),
(18, 'Up Next', 'up-next', 2, 5),
(19, 'In Progress', 'in-progress', 3, 5),
(20, 'Done', 'done', 4, 5),
(64, 'In Progress', 'in-progress', 3, 14),
(65, 'Done', 'done', 4, 14),
(66, 'Backlog', 'backlog', 1, 15),
(67, 'Up Next2', 'up-next2', 2, 15),
(53, 'fin', 'fin', 5, 13),
(72, 'Backlog', 'backlog', 1, 16),
(61, 'Backlog', 'Backlog', 1, 1),
(63, 'Up Next2', 'up-next2', 2, 14),
(52, 'Done', 'done', 4, 13),
(51, 'In Progress', 'in-progress', 3, 13),
(50, 'Up Next2', 'up-next2', 2, 13),
(49, 'Backlog', 'backlog', 1, 13),
(37, 'Backlog', 'backlog', 1, 10),
(38, 'Up Next', 'up-next', 2, 10),
(39, 'In Progress', 'in-progress', 3, 10),
(40, 'Done', 'done', 4, 10),
(41, 'Backlog', 'backlog', 1, 11),
(42, 'Up Next', 'up-next', 2, 11),
(43, 'In Progress', 'in-progress', 3, 11),
(44, 'Done', 'done', 4, 11),
(45, 'Backlog', 'backlog', 1, 12),
(46, 'Up Next', 'up-next', 2, 12),
(47, 'In Progress', 'in-progress', 3, 12),
(48, 'Done', 'done', 4, 12),
(68, 'In Progress', 'in-progress', 3, 15),
(69, 'Done', 'done', 4, 15),
(73, 'Up Next2', 'up-next2', 2, 16),
(74, 'In Progress', 'in-progress', 3, 16),
(75, 'Done', 'done', 4, 16),
(77, 'pending', 'pending', 5, 1),
(78, 'Backlog', 'backlog', 1, 17),
(79, 'Up Next2', 'up-next2', 2, 17),
(80, 'In Progress', 'in-progress', 3, 17),
(81, 'Done', 'done', 4, 17);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `taskID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `taskDesc` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`taskID`, `projectID`, `userID`, `taskDesc`, `status`, `updated_at`, `created_at`) VALUES
(1, 17, 17, 'design on figma', 'Done', '2023-01-18 23:56:58', NULL),
(2, 17, 17, 'frontend coding ', 'In Progress', '2023-01-18 23:56:58', NULL),
(3, 17, 17, 'backend coding', 'In Progress', '2023-01-18 23:56:58', NULL),
(4, 23, 17, 'design frontend', 'Done', '2023-01-18 23:56:58', NULL),
(5, 23, 17, 'fix errors', 'Done', '2023-01-18 23:56:58', NULL),
(6, 17, 17, 'fix errors', 'In Progress', '2023-01-18 23:56:58', NULL),
(7, 20, 19, 'front-end', 'In Progress', '2023-01-18 23:57:35', '2023-01-18 23:57:35'),
(9, 20, 19, 'back-end', 'In Progress', '2023-01-19 00:11:18', '2023-01-19 00:11:18'),
(11, 19, 17, 'front end', 'In Progress', '2023-01-24 15:38:05', '2023-01-24 15:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `u_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sprint_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `start_date`, `end_date`, `order`, `user_id`, `status_id`, `u_id`, `sprint_id`, `created_at`, `updated_at`) VALUES
(1, 'Register', 'Registration form', '0000-00-00', '0000-00-00', 2, 1, 61, '1', '', '2021-01-18 16:45:49', '2021-08-19 19:41:21'),
(2, 'Login', 'Login form', '0000-00-00', '0000-00-00', 1, 1, 1, '1', '', '2021-01-18 16:46:04', '2021-01-30 04:58:04'),
(3, 'Project', 'Project', '0000-00-00', '0000-00-00', 2, 1, 1, '1', '', '2021-01-18 17:28:29', '2021-01-30 04:58:04'),
(4, 'Pro', 'a', '0000-00-00', '0000-00-00', 2, 1, 3, '1', '', '2021-01-30 04:55:46', '2021-08-19 17:59:12'),
(5, 'a', 'a', '0000-00-00', '0000-00-00', 1, 1, 3, '2', '', '2021-02-12 06:11:14', '2021-08-19 17:59:12'),
(6, 'jhkjhl', 'jhbkj', '0000-00-00', '0000-00-00', 2, 1, 61, '2', '', '2021-04-18 06:58:34', '2021-08-19 19:41:10'),
(7, 'login', 'login', '0000-00-00', '0000-00-00', 1, 1, 77, '2', '', '2021-06-14 20:58:45', '2021-08-19 19:41:21'),
(8, 'login', 'login', '0000-00-00', '0000-00-00', 1, 1, 2, '2', '', '2021-06-26 18:51:25', '2021-06-26 19:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `teammappings`
--

CREATE TABLE `teammappings` (
  `teammapping_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teammappings`
--

INSERT INTO `teammappings` (`teammapping_id`, `username`, `role_name`, `team_name`, `created_at`, `updated_at`) VALUES
(1, 'diyana', 'Software Tester', 'Ab', NULL, NULL),
(11, 'nadianazri', 'Project Manager', 'Ab', '2021-06-12 19:50:42', '2021-06-12 19:50:42'),
(5, 'nadia', 'Project Manager', 'B', NULL, NULL),
(19, 'nazirah', 'Programmer', 'Ab', '2021-06-26 18:49:58', '2021-06-26 18:49:58'),
(18, 'Atiqah', 'Software Tester', 'E', NULL, NULL),
(17, 'misha', 'Scrum Master', 'CA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(10) UNSIGNED NOT NULL,
  `team_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`, `created_at`, `updated_at`) VALUES
(1, 'Ab', '2021-01-04 07:43:54', '2021-01-05 02:06:25'),
(4, 'B', '2021-01-04 23:56:37', '2021-01-04 23:56:37'),
(13, 'CA', '2021-06-26 04:18:30', '2021-06-26 04:18:35'),
(14, 'D', '2021-06-26 08:11:06', '2021-06-26 08:11:06'),
(16, 'E', '2021-06-26 18:49:08', '2021-06-26 18:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `role_name`, `country`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nadiah Nazri', 'nadianazri', 'Project Manager', 'Malaysia', 'nadia.nzr26@gmail.com', NULL, '$2y$10$b4HqpmJjGcXKqsfhz2AMEOxV3FMHzeoNsYCDmR5YntdP1fXNjMCni', NULL, '2020-12-30 18:07:57', '2020-12-30 18:07:57'),
(12, 'Nadiah', 'nadia', 'Project Manager', 'Australia', 'nadia@gmail.com', NULL, '$2y$10$sC5Px3ngFS8tt0CmQEAG9.Dl1N6TZBYkk5/MM20TL3kZU9KoiMY.C', NULL, '2021-01-18 17:23:09', '2021-01-18 17:23:09'),
(3, 'Diyana', 'diyana', 'Software Tester', 'Finland', 'diyana@gmail.com', NULL, '$2y$10$V4s/rCNaU/OW6sjXWf6ZKeA/jJ20RJ1kdyTfeMLGEBBneQYQxrrIq', NULL, '2021-01-05 00:03:57', '2021-01-05 00:03:57'),
(4, 'Haniza', 'haniza', 'Chief Programmer', 'Australia', 'haniza@gmail.com', NULL, '$2y$10$A3msmyq2clwpzivyNV28zOfCHCIv/JThF95KzymxzUvmocglmeb6m', NULL, '2021-01-05 00:04:36', '2021-01-05 00:04:36'),
(5, 'Misha', 'misha', 'Scrum Master', 'Liberia', 'misha@gmail.com', NULL, '$2y$10$NEItS8NMTvVJhKkNnbQoguCqB4zLWccnehbJh4IRwJKVEoYPsCJuW', NULL, '2021-01-05 00:05:09', '2021-01-05 00:05:09'),
(9, 'Hafizah', 'hafizah', 'Scrum Master', 'Liberia', 'hafizah@gmail.com', NULL, '$2y$10$UIi0X86rHTJjkdZGi8kNDu8o1A072umT3uvrDOHt9BL1jcgakvhOi', NULL, '2021-01-18 16:17:55', '2021-01-18 16:17:55'),
(10, 'Atiqah', 'atiqah', 'Software Tester', 'Vietnam', 'atiqah@gmail.com', NULL, '$2y$10$MVXkIfsvNdgHR58lh4sM7uNgEO4YmPxDj1lGjfOoe4CDqUrSFkknW', NULL, '2021-01-18 16:18:44', '2021-01-18 16:18:44'),
(14, 'Nazirah', 'nazirah', 'Programmer', 'Malaysia', 'nazirah@gmail.com', NULL, '$2y$10$N7E1jhW4Aar7fdr0HvpQfOgt8tTz1/ucFEoH9Nq4BoaCCJW/FqRgq', NULL, '2021-06-13 20:50:04', '2021-06-13 20:50:04'),
(15, 'Nadiah', 'nadiahnzr', 'Software Tester', 'Malaysia', 'nadia26@gmail.com', NULL, '$2y$10$uyePCq0Rbwk1rCGThFZBH.RZ2Buk9Hl4OUeXHtGiqUkSo9W8ww5TG', NULL, '2021-06-14 20:43:55', '2021-06-14 20:43:55'),
(16, 'Nazira', 'nazira', 'Programmer', 'Malaysia', 'nazirah99@gmail.com', NULL, '$2y$10$NJfQ1s5aDAcelL7yBGT7VeYEFoqVUvf7co9CPBDYD8.vfLkeye/Vq', NULL, '2021-06-26 18:46:08', '2021-06-26 18:46:08'),
(17, 'Faizah Faiqah', 'faizahPM', 'Project Manager', 'Afghanistan', 'haqifaq@gmail.com', NULL, '$2y$10$9Vu4NxAfYdNrh6Sv1z7qh.ttLXqiQU7Xw9z1npzAtrEFnPtvQZbrS', 'nEINBPJrVYOvQztm90KUtawDZ4DsNvI2HE7v4yOFekcIOHlv1NUiNtWZY4hm', '2022-11-15 08:37:40', '2022-11-15 08:37:40'),
(18, 'Faizah Faiqah', 'faizahUser', 'User', 'Afghanistan', 'haqifaq@user.com', NULL, '$2y$10$9Vu4NxAfYdNrh6Sv1z7qh.ttLXqiQU7Xw9z1npzAtrEFnPtvQZbrS', 'LBjHF8EPlBQg76Mfeqfa4QfXRNk0pC4nXNE9wKDiLD8rVxnYhREEKuf62Vvi', '2022-11-15 08:37:40', '2022-11-15 08:37:40'),
(19, 'Faizah Faiqah', 'faizahScrumMaster', 'Scrum Master', 'Afghanistan', 'haqifaq@SM.com', NULL, '$2y$10$9Vu4NxAfYdNrh6Sv1z7qh.ttLXqiQU7Xw9z1npzAtrEFnPtvQZbrS', 'VaxQlYog9opa28pBgAqXht3E62eKJlKuZJ36a6SM7MZB4Hl4mDLVarjDmwZ9', '2022-11-15 08:37:40', '2022-11-15 08:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_stories`
--

CREATE TABLE `user_stories` (
  `u_id` bigint(20) UNSIGNED NOT NULL,
  `user_story` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_story` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prio_story` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sprint_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perfeature_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secfeature_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_stories`
--

INSERT INTO `user_stories` (`u_id`, `user_story`, `desc_story`, `due_day`, `prio_story`, `title`, `sprint_id`, `perfeature_id`, `secfeature_id`, `created_at`, `updated_at`) VALUES
(1, 'Team feature', 'Team', '0', '2', 'Backlog', '1', '', '', '2021-06-10 05:28:50', '2022-01-10 07:14:25'),
(2, 'login', 'login', '4', '2', 'Backlog', '1', '', '', '2021-06-10 05:29:31', '2021-06-10 05:29:31'),
(3, 'reg', 'reg', '3', '2', 'Backlog', '1', '', '', '2021-06-10 05:33:34', '2021-06-10 05:33:34'),
(21, 'new', 'new', '2', '2', 'In Progress', '1', '', '', '2021-06-12 23:25:57', '2021-06-12 23:25:57'),
(22, 'Team feature', 'Team', '0', '2', 'Up Next', '1', '', '', '2021-06-14 20:56:16', '2021-06-14 20:56:16'),
(24, 'sda', 'qwq', '6', '2', 'Done', '10', '', '', '2021-06-25 21:33:09', '2021-06-25 21:33:09'),
(25, 'asef', 'asfdasdf', '7', '2', 'Backlog', '9', '', '', '2021-06-25 21:38:13', '2021-06-26 01:22:55'),
(26, 'aweda', 'dawdaw', '8', '2', 'In Progress', '11', '', '', '2021-06-26 04:53:19', '2021-06-26 04:53:19'),
(42, 'Login', 'login', '', '1', 'In Progress', '21', '[\"Loading Time\",\"Buffering Time\"]', '[\"SQL Injection\",\"Cross_Site Scripting\"]', '2021-06-26 18:48:51', '2021-06-26 18:48:51'),
(44, 'customer want to add event', 'customer want to add event', '30/01/2023', '2', 'Backlog', 's01', '[\"Buffering Time\",\"Response Time\"]', '[\"SQL Injection\",\"Cross_Site Scripting\"]', '2023-01-25 04:11:31', '2023-01-25 04:11:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `boards_slug_unique` (`slug`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charts`
--
ALTER TABLE `charts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charts_sprintname_index` (`sprintname`),
  ADD KEY `charts_slug_index` (`slug`);

--
-- Indexes for table `coding_standards`
--
ALTER TABLE `coding_standards`
  ADD PRIMARY KEY (`codestand_id`);

--
-- Indexes for table `defect`
--
ALTER TABLE `defect`
  ADD PRIMARY KEY (`def_id`);

--
-- Indexes for table `defect_features`
--
ALTER TABLE `defect_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`forumID`);

--
-- Indexes for table `mappings`
--
ALTER TABLE `mappings`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `performance_features`
--
ALTER TABLE `performance_features`
  ADD PRIMARY KEY (`perfeature_id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`prio_id`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `security_features`
--
ALTER TABLE `security_features`
  ADD PRIMARY KEY (`SecFeature_id`);

--
-- Indexes for table `sprint`
--
ALTER TABLE `sprint`
  ADD PRIMARY KEY (`sprint_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`taskID`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teammappings`
--
ALTER TABLE `teammappings`
  ADD PRIMARY KEY (`teammapping_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `team_name` (`team_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_stories`
--
ALTER TABLE `user_stories`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `charts`
--
ALTER TABLE `charts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coding_standards`
--
ALTER TABLE `coding_standards`
  MODIFY `codestand_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `defect`
--
ALTER TABLE `defect`
  MODIFY `def_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `defect_features`
--
ALTER TABLE `defect_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `forumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `mappings`
--
ALTER TABLE `mappings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance_features`
--
ALTER TABLE `performance_features`
  MODIFY `perfeature_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `prio_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `security_features`
--
ALTER TABLE `security_features`
  MODIFY `SecFeature_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sprint`
--
ALTER TABLE `sprint`
  MODIFY `sprint_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `taskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `teammappings`
--
ALTER TABLE `teammappings`
  MODIFY `teammapping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_stories`
--
ALTER TABLE `user_stories`
  MODIFY `u_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
