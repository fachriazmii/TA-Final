-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2021 at 05:13 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_akhir_fahri`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(255) NOT NULL,
  `no_induk` varchar(255) NOT NULL,
  `nama_dosen` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `no_induk`, `nama_dosen`, `email`, `id_role`) VALUES
(2, '', 'Dadang Konelo', 'dadang@agmail.com', 14),
(3, '', 'Jan', 'jan@mail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_repo`
--

CREATE TABLE `file_repo` (
  `id` bigint(20) NOT NULL,
  `nama` text NOT NULL,
  `cloud_path` text DEFAULT NULL,
  `local_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `file_repo`
--

INSERT INTO `file_repo` (`id`, `nama`, `cloud_path`, `local_path`) VALUES
(4, '9090-Mahasiswa1-Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu.pdf', NULL, 'storage/repo/9090-Mahasiswa1-Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu.pdf'),
(5, '180102022-Ridho Subhan-Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu.pdf', NULL, 'storage/repo/180102022-Ridho Subhan-Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ta`
--

CREATE TABLE `jadwal_ta` (
  `id` int(11) NOT NULL,
  `id_sidang` int(11) NOT NULL,
  `penguji_1` bigint(20) NOT NULL,
  `penguji_2` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `link_zoom` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `judul_ta`
--

CREATE TABLE `judul_ta` (
  `id` int(11) NOT NULL,
  `pbb1` varchar(255) DEFAULT NULL,
  `pbb2` varchar(255) DEFAULT NULL,
  `judul` text DEFAULT NULL,
  `kuota` int(3) DEFAULT NULL,
  `aktif` int(2) NOT NULL DEFAULT 1,
  `id_dosen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `judul_ta`
--

INSERT INTO `judul_ta` (`id`, `pbb1`, `pbb2`, `judul`, `kuota`, `aktif`, `id_dosen`) VALUES
(4, 'Dospem satu', 'Dospem dua', 'Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu Penelitian Satu', 1, 1, NULL),
(7, 'Pembimbing 1', 'Pembimbing 2', 'Penelitian Kedua Contoh', 10, 1, NULL),
(8, 'Dosen 1 test', 'Dosen 2 test', 'Judul test', 10, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `nama` text NOT NULL,
  `no_hp` varchar(14) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `jenkel` varchar(255) DEFAULT NULL,
  `program_studi` varchar(255) DEFAULT NULL,
  `fakultas` varchar(255) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `no_hp`, `email`, `jenkel`, `program_studi`, `fakultas`, `id_role`) VALUES
(2, '232323', 'Jojo', '08219312', 'jojo@gmail.com', 'L', 'Informatikas', 'Sainteks', NULL),
(6, '9901', 'Jojoba', '08219312', 'jojoba@gmail.com', 'L', 'Informatika', 'Sains dan Teknologi', 11),
(7, '9090', 'Mahasiswa1', '08219312', 'mahasiswa@gmail.com', 'P', 'IF', 'IF', 4),
(8, '180102021', 'odod', '12345678910213', 'odod@gmail.com', 'L', 'IF', 'IF', 13),
(9, '180102022', 'Ridho Subhan', '082317657262', 'ridho@gmail.com', 'L', 'Informatika', 'Saintek', 3);

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_25_021805_create_sessions_table', 2);

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
-- Table structure for table `pendaftaran_sidang`
--

CREATE TABLE `pendaftaran_sidang` (
  `id` bigint(20) NOT NULL,
  `id_proposal` int(11) NOT NULL,
  `lulus_3_repo` bigint(20) NOT NULL,
  `bukti_bimbingan_repo` bigint(20) NOT NULL,
  `tak_repo` bigint(20) NOT NULL,
  `biodata_repo` bigint(20) NOT NULL,
  `bukti_foto_repo` bigint(20) NOT NULL,
  `biaya_wisuda_repo` bigint(20) NOT NULL,
  `skta_repo` bigint(20) NOT NULL,
  `judul_abstrak_repo` bigint(20) NOT NULL,
  `eprt_repo` bigint(20) NOT NULL,
  `inter_repo` bigint(20) NOT NULL,
  `status` enum('Pengajuan','Lengkap','Tidak Lengkap') NOT NULL,
  `approved_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `id` int(11) NOT NULL,
  `id_judul` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `id_repo` bigint(20) DEFAULT NULL,
  `approve_by` bigint(20) UNSIGNED DEFAULT NULL,
  `waktu_pengajuan` datetime NOT NULL,
  `status` enum('Pengajuan','Disetujui','Revisi','Selesai','Tidak Disetujui') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`id`, `id_judul`, `nim`, `id_repo`, `approve_by`, `waktu_pengajuan`, `status`) VALUES
(6, 4, '9090', 4, 14045, '2021-11-24 12:38:58', 'Disetujui'),
(14, 7, '180102022', NULL, NULL, '2021-11-25 14:58:26', 'Pengajuan');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Emq4g9h9Iad5seqvjJx18TzenZi5Io9HQiuehowt', 3, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Mobile Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSWFjd0dKbHY0WTZDNVJ5ZDhuZ2tFejU5cktCOUFHdzA4S3NOYlA5MyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGlsaWgtanVkdWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTYzNzg1MjI0ODt9fQ==', 1637852308),
('IpJ5fqyFqO72BOkNsfjPbbSvS97PvA16fLT5uS4p', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZ01ic2pCWTZHZXhER3lxSmIyMDR2NVBYOXVjMEYyTVRtTlhaSE1GQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9waWxpaC1qdWR1bCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNjM3ODQxNDk2O319', 1637844443);

-- --------------------------------------------------------

--
-- Table structure for table `sidang`
--

CREATE TABLE `sidang` (
  `id` int(11) NOT NULL,
  `id_daftar_sidang` int(11) NOT NULL,
  `penilaian_1` int(5) NOT NULL,
  `penilainan_2` int(5) NOT NULL,
  `revisi_1` text NOT NULL,
  `revisi_2` text NOT NULL,
  `acc_1` int(2) NOT NULL,
  `acc_2` int(2) NOT NULL,
  `acc_laa` int(2) NOT NULL,
  `acc_dekan` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `level`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Jaya Jaya Jaya', 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$m0vPdWinr2bAL4gTJYT5ruCenXE2tKzi7/HkZSBHGY4xzwjAhs9ji', 'SQHvlKjEFJ0SrfUYcoOMnlSxPyR3m3qj7EWbznR7vGGp0larn2PTFp6BPOW3', '2021-11-24 19:20:35', '2021-11-24 19:20:35'),
(2, 'Dosen', 'dosen', '14045', 'dosen@gmail.com', NULL, '$2y$10$iWqQx1zToUOPQu9pyecfK.V557PAVx09AHmdNi7iBjSsQPlpsjAIW', 'x0gjfyq13Qd51MXInAseUaxAxT0fAmTvEY1x3FRmkX9OuHcOJBKFi5QmAY81', '2021-11-24 19:20:35', '2021-11-24 19:20:35'),
(3, 'Ridho Subhan', 'mahasiswa', '180102022', 'ridho@gmail.com', NULL, '$2y$10$LFQ1YymnoTl6e62UEruhe.oNtP7y440b6KUJKaPDnLV.aeV7S5RWa', 'fFro6SwWu66OGreZpedflhi4YVZUGKFJEmS9m3mRgK2DatamX3yC8oGUS9Nj', '2021-11-24 20:25:59', '2021-11-24 20:25:59'),
(4, 'Mahasiswa1', 'mahasiswa', '9090', 'mahasiswa@gmail.com', NULL, '$2y$10$m0vPdWinr2bAL4gTJYT5ruCenXE2tKzi7/HkZSBHGY4xzwjAhs9ji', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_repo`
--
ALTER TABLE `file_repo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_ta`
--
ALTER TABLE `jadwal_ta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sidang` (`id_sidang`),
  ADD KEY `penguji_1` (`penguji_1`),
  ADD KEY `penguji_2` (`penguji_2`);

--
-- Indexes for table `judul_ta`
--
ALTER TABLE `judul_ta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
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
-- Indexes for table `pendaftaran_sidang`
--
ALTER TABLE `pendaftaran_sidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_repo`
--
ALTER TABLE `file_repo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal_ta`
--
ALTER TABLE `jadwal_ta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `judul_ta`
--
ALTER TABLE `judul_ta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pendaftaran_sidang`
--
ALTER TABLE `pendaftaran_sidang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
