-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 04:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `register_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `account_type_id` int(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `rate` varchar(200) NOT NULL,
  `code` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `number` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `profile_pic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bankaccounts`
--

CREATE TABLE `bankaccounts` (
  `account_id` int(20) NOT NULL,
  `account_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `account_number` varchar(200) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `account_rates` varchar(200) NOT NULL,
  `account_status` varchar(200) NOT NULL,
  `account_amount` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_national_id` varchar(200) NOT NULL,
  `user_phone` varchar(200) NOT NULL,
  `user_number` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_address` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(20) NOT NULL,
  `notification_details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `staff_number` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `sex` varchar(200) NOT NULL,
  `profile_pic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(20) NOT NULL,
  `system_name` longtext NOT NULL,
  `system_tagline` longtext NOT NULL,
  `system_logo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `tr_id` int(11) DEFAULT NULL,
  `tr_code` varchar(200) NOT NULL,
  `account_id` varchar(200) NOT NULL,
  `account_name` varchar(200) NOT NULL,
  `account_number` varchar(200) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `account_amount` varchar(200) NOT NULL,
  `tr_type` varchar(200) NOT NULL,
  `tr_status` varchar(200) NOT NULL,
  `transaction_amount` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_national_id` varchar(200) NOT NULL,
  `user_country` varchar(200) NOT NULL,
  `user_phone` varchar(200) NOT NULL,
  `receiving_account_number` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `receiving_account_name` varchar(200) NOT NULL,
  `receiving_account_holder` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` varchar(200) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_token_hash` varchar(64) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `country`, `password_hash`, `reset_token_hash`, `reset_token_expires_at`) VALUES
(22, 'Justice Orogun', 'justicemaroorogun@gmail.com', NULL, '$2y$10$B9mgc2SWGfjngs.9LH1HHu0R1lz/bEC/CDrbQrxB9EkLHXGyLAtFG', 'fb9669f9f6b4dcc2fc2cbace73915d49cc319194e2b705decedb4e499ecb6ac3', '2023-11-14 13:02:40'),
(23, 'Johnson', 'johnson101@gmail.com', NULL, '$2y$10$yW3XFodvuujQMfW6aFiIP.Zo39oKo0ngG0Nb5Jo2BSNO6cHQ6SVoy', NULL, NULL),
(33, 'Justice', 'justiceorogun@gmail.com', NULL, '$2y$10$o1tvLfE4gDaMg1f0FAQEl.sh/Zk9732ZtRn/n8mAqJe2rTkRrQvc6', NULL, NULL),
(34, 'Jay Jay', 'jayorogun@gmail.com', NULL, '$2y$10$OACsPe639qjZCT02LQ.RiuhgfvfT3lGiVXEsie64qIWcISbrKDjZe', NULL, NULL),
(35, 'Johnson', 'okekerk@gmail.com', NULL, '$2y$10$2VRcsHWCpFNu7g6K3x/a.Ov5GCZC.jYXtGWP2B1VIHcHnpIplZumG', NULL, NULL),
(36, 'Justice', 'justice@example.com', NULL, '$2y$10$7E10tOU9j/tf2NVvpJSLL.8gXOyAKzjUCUws7SWVSob0y2j.czB9.', '2ee5879560d861fd6e7a7487a342b338da6cbdc4aa23758703efc9f99995d8da', '2023-11-13 11:51:04'),
(39, 'Wesley', 'wesleyrobertson108@gmail.com', NULL, '$2y$10$jn/Myb4fuDHIr9Y9.6NaWONsrxxAkBa6TV7lmm3FoxA8eBS/9S9ZO', NULL, NULL),
(40, 'Johnson', 'johnsonbuhari@gmail.com', NULL, '$2y$10$eLxNfkMxJjlDjXK0xZu1kOqFFM0euCc70FEkOG/Sd.julzwpoQOw6', 'd0e2b9764d462119b0e77684988a9a8d2c535f7c11eab02875de1e3e587e8414', '2023-11-20 14:02:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`account_type_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `reset_token_hash` (`reset_token_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `account_type_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  MODIFY `account_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
