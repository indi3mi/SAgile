-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 18, 2023 at 05:56 PM
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
  `SystemAnalyst` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(13, 3, 'fs', 'ad', '2021-06-23', '2021-07-23', '', '', '', '', '', '', '', '2021-06-22 22:27:33', '2021-06-22 22:27:33', '', 0),
(17, 1, 'New', 'Project', '2021-06-27', '2021-07-27', '', '', '', '', '', '', '', '2021-06-26 18:47:11', '2021-06-26 18:47:11', '', 0),
(18, 1, 'SDA', 'SDA prototype', '2022-01-25', '2022-02-25', '', '', '', '', '', '', '', '2022-01-25 05:52:01', '2022-01-25 05:52:01', '', 0),
(19, 17, 'Project jota2', 'project under megah holding', '2022-11-15', '2023-02-15', '', '', '', '', '', '', '', '2022-11-15 09:04:29', '2022-11-15 09:04:29', '', 0),
(20, 18, 'Voting System', 'online voting', '2022-11-27', '2023-03-15', '', '', '', '', '', '', '', '2022-11-27 14:55:08', '2022-12-30 09:25:38', 'In Progress', 50),
(21, 18, 'Food Delivery', 'sedapnya', '2022-12-07', '2023-07-05', '', '', '', '', '', '', '', '2022-12-07 08:41:58', '2022-12-07 08:41:58', 'In Progress', 33),
(23, 18, 'Library System', 'UTM library system', '2022-12-20', '2022-12-26', '', '', '', '', '', '', '', '2022-12-20 15:13:43', '2022-12-20 15:13:43', 'Completed', 100),
(25, 18, 'Diet Tracker', 'Everyday meal preparation', '2023-01-18', '2023-02-08', '17', '5', '1', '4', '18', '10', '9', '2023-01-18 15:51:10', '2023-01-18 15:51:10', 'New', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
