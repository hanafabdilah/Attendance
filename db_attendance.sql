-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2021 at 06:02 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-03-01 22:54:58', '2021-03-01 23:03:27'),
(2, 7, 1, '2021-03-02 01:51:45', '2021-03-02 08:53:31'),
(3, 8, 0, '2021-03-02 09:00:53', '2021-02-02 09:00:53'),
(4, 8, 1, '2021-02-02 23:59:43', '2021-02-02 23:59:58'),
(5, 7, 1, '2021-02-03 00:00:47', '2021-02-03 00:01:15'),
(6, 12, 1, '2021-02-03 04:42:27', '2021-02-03 04:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_details`
--

CREATE TABLE `attendance_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `long` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_details`
--

INSERT INTO `attendance_details` (`id`, `attendance_id`, `long`, `lat`, `address`, `photo`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, '52.7878788', '13.878787', 'Berlin, German', 'admin-1612245298.png', 'in', '2021-02-01 22:54:58', '2021-02-01 22:54:58'),
(2, 1, '52.7878788', '13.878787', 'Berlin, German', 'admin-1612245807.png', 'out', '2021-02-01 23:03:27', '2021-02-01 23:03:27'),
(3, 2, '52.7878788', '13.878787', 'Berlin, German', 'hanafi-abdilah-1612255906.png', 'in', '2021-02-02 01:51:46', '2021-02-02 01:51:46'),
(4, 2, '52.7878788', '13.878787', 'Berlin, German', 'hanafi-abdilah-1612256011.png', 'out', '2021-02-02 08:53:31', '2021-02-02 08:53:31'),
(5, 3, '52.7878788', '13.878787', 'Berlin, German', 'abdilah-1612256453.png', 'in', '2021-02-02 09:00:53', '2021-02-02 09:00:53'),
(6, 4, '52.7878788', '13.878787', 'Berlin, German', 'abdilah-1612310384.png', 'in', '2021-02-02 23:59:44', '2021-02-02 23:59:44'),
(7, 4, '52.7878788', '13.878787', 'Berlin, German', 'abdilah-1612310398.png', 'out', '2021-02-02 23:59:58', '2021-02-02 23:59:58'),
(8, 5, '52.7878788', '13.878787', 'Berlin, German', 'hanafi-abdilah-1612310447.png', 'in', '2021-02-03 00:00:47', '2021-02-03 00:00:47'),
(9, 5, '52.7878788', '13.878787', 'Berlin, German', 'hanafi-abdilah-1612310475.png', 'out', '2021-02-03 00:01:15', '2021-02-03 00:01:15'),
(10, 6, '52.7878788', '13.878787', 'Berlin, German', 'hanafi-abdilah-1612327347.jpeg', 'in', '2021-02-03 04:42:27', '2021-02-03 04:42:27'),
(11, 6, '52.7878788', '13.878787', 'Berlin, German', 'hanafi-abdilah-1612327377.jpeg', 'out', '2021-02-03 04:42:57', '2021-02-03 04:42:57');

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_02_02_023855_create_attendance_details_table', 1),
(4, '2021_02_02_024446_create_attendances_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(13, 'App\\User', 12, 'web', '5e93a53b05f837b1dccb6398e96fce0f8aeed2dbbf0d4b6d68394849a4d0d377', '[\"*\"]', '2021-02-03 04:42:57', '2021-02-03 04:41:18', '2021-02-03 04:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@mail.com', NULL, '$2y$10$ceDR6wQIIiFhAhRMGlV7keEYyomRKEJ8H0IFujIIZnTwwNc0XW/4y', 1, 'admin-1612319939.jpeg', 'fBHxUieDSDGW8kWbtN5GCeZ1qONOMHVvPce8qHNWlfft2wZaH5a0XyxfxKjY', '2021-02-01 21:52:35', '2021-02-03 04:17:13'),
(9, 'tes', 'tes@mail.com', NULL, '$2y$10$zgRi8QKp3XG2pB03TxC5ROtufGWmoUsVl9rZn7B1rOyUG.PDXKyzK', 0, 'tes-1612319981.jpeg', NULL, '2021-02-03 02:39:41', '2021-02-03 02:39:41'),
(11, 'tes', 'tes@gmail.com', NULL, '$2y$10$MoOjK1fsmLMGS/iyUaYBYuXra2A3JtWdhgUz8PX4vNtguq1yo4n5m', 0, NULL, NULL, '2021-02-03 02:41:47', '2021-02-03 02:41:47'),
(12, 'Hanafi Abdilah', 'handilah81@gmail.com', NULL, '$2y$10$vohfg/oc2JQGD.C7.b06H.mb4tpRLSzi2FK5EsM6nwFziyVwjN3I.', 0, '-1612327320.jpeg', NULL, '2021-02-03 04:24:37', '2021-02-03 04:42:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_details`
--
ALTER TABLE `attendance_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attendance_details`
--
ALTER TABLE `attendance_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
