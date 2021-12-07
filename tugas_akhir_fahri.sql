-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2021 at 01:25 PM
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
  `jurusan` varchar(255) NOT NULL,
  `fakultas` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `no_induk`, `nama_dosen`, `jurusan`, `fakultas`, `email`, `id_role`) VALUES
(2, '1000', 'Dadang Konelo', 'Elektro', 'Saintek', 'dadangdosen@gmail.com', 14),
(6, '1994', 'Rizal Dwi Prayogo S.St, M.Kom', 'Informatika', 'Sains dan Teknologi', 'yogo@gmail.com', 25),
(7, '4456716', 'Sutadi', 'Informatika', 'Sains dan Teknologi', 'sutadi@gmail.com', 27),
(8, '555666', 'Rinando', 'Teknik ELektro', 'Elektro', 'rinan@gmail.com', NULL);

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
(5, '9901-Jojoba-5984-22229-1-PB.pdf', NULL, 'storage/repo/9901-Jojoba-5984-22229-1-PB.pdf'),
(6, '180102021-odod-document.pdf', NULL, 'storage/repo/180102021-odod-document.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ta`
--

CREATE TABLE `jadwal_ta` (
  `id` int(11) NOT NULL,
  `id_sidang` int(11) DEFAULT NULL,
  `nim` varchar(255) NOT NULL,
  `penguji_1` bigint(20) DEFAULT NULL,
  `penguji_2` bigint(20) DEFAULT NULL,
  `datetime` date NOT NULL,
  `jam` varchar(255) NOT NULL,
  `link_zoom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_ta`
--

INSERT INTO `jadwal_ta` (`id`, `id_sidang`, `nim`, `penguji_1`, `penguji_2`, `datetime`, `jam`, `link_zoom`) VALUES
(2, NULL, '180102021', NULL, NULL, '2021-12-05', '17:35', NULL),
(4, NULL, '9901', NULL, NULL, '2021-12-02', '11:54', NULL);

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
(4, 'PPA', 'Dospem dua', 'Penelitian Cyber Security', 1, 1, 2),
(7, 'RDP', NULL, 'Penelitian Machine Learning', 5, 1, 2),
(8, 'PPA', NULL, 'Komunikasi Jaringan Data', 6, 1, 2);

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
  `id_role` int(11) DEFAULT NULL,
  `pas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `no_hp`, `email`, `jenkel`, `program_studi`, `fakultas`, `id_role`, `pas`) VALUES
(2, '232323', 'Jojo', '08219312', 'jojo@gmail.com', 'L', 'Informatikas', 'Sainteks', 26, ''),
(6, '9901', 'Jojoba', NULL, 'jojoba@gmail.com', 'L', 'Informatika', 'Sains dan Teknologi', 11, ''),
(7, '9090', 'Mahasiswa1', NULL, 'mahasiswa@gmail.com', 'P', 'IF', 'IF', 12, ''),
(8, '180102021', 'odod', '12345678910213', 'odod@gmail.com', 'L', 'IF', 'IF', 13, ''),
(12, '321213321', 'Ripat Gege', '082317657262', 'ripaldi@gmail.com', 'P', 'Informatika', 'Saintek', 22, '$2y$10$85oTU6fPxtqsv4jfLcJIROx2xafUVHnuXPsrM.RvAUbWpLS92pGJi'),
(14, '180102022', 'Rinaldi Munirs', '082317657262', 'munir@gmail.com', 'L', 'Informatika', 'Humaniora', NULL, NULL);

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
-- Table structure for table `nilai_pembimbing`
--

CREATE TABLE `nilai_pembimbing` (
  `id` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `pbb1` varchar(255) NOT NULL,
  `pbb2` varchar(255) NOT NULL,
  `nilai_pbb1` float NOT NULL,
  `nilai_pbb2` float NOT NULL,
  `rata_rata` float NOT NULL,
  `nilai_akhir` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai_pembimbing`
--

INSERT INTO `nilai_pembimbing` (`id`, `nim`, `pbb1`, `pbb2`, `nilai_pbb1`, `nilai_pbb2`, `rata_rata`, `nilai_akhir`) VALUES
(3, '180102021', 'Dadang', 'Joni', 90, 80, 85, 170),
(4, '9901', '90', '80', 90, 80, 85, 170);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_penguji`
--

CREATE TABLE `nilai_penguji` (
  `id` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `penguji_1` varchar(255) NOT NULL,
  `penguji_2` varchar(255) NOT NULL,
  `penguji_3` varchar(255) NOT NULL,
  `pemaparan_p1` float NOT NULL,
  `pemaparan_p2` float NOT NULL,
  `pemaparan_p3` float NOT NULL,
  `materi_pokok_p1` float NOT NULL,
  `materi_pokok_p2` float NOT NULL,
  `materi_pokok_p3` float NOT NULL,
  `masalah_p1` float NOT NULL,
  `masalah_p2` float NOT NULL,
  `masalah_p3` float NOT NULL,
  `jumlah_p1` float NOT NULL,
  `jumlah_p2` float NOT NULL,
  `jumlah_p3` float NOT NULL,
  `rata_rata` float NOT NULL,
  `nilai_akhir` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai_penguji`
--

INSERT INTO `nilai_penguji` (`id`, `nim`, `penguji_1`, `penguji_2`, `penguji_3`, `pemaparan_p1`, `pemaparan_p2`, `pemaparan_p3`, `materi_pokok_p1`, `materi_pokok_p2`, `materi_pokok_p3`, `masalah_p1`, `masalah_p2`, `masalah_p3`, `jumlah_p1`, `jumlah_p2`, `jumlah_p3`, `rata_rata`, `nilai_akhir`) VALUES
(1, '180102021', 'DADA', 'DEDE', 'DIDI', 90, 90, 90, 90, 90, 90, 90, 90, 90, 270, 270, 270, 90, 810);

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
  `status` enum('Pengajuan','Disetujui','Revisi','Selesai','Sidang','Lulus') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`id`, `id_judul`, `nim`, `id_repo`, `approve_by`, `waktu_pengajuan`, `status`) VALUES
(14, 4, '9901', 5, 1000, '2021-12-01 05:51:55', 'Sidang'),
(15, 7, '180102021', 6, 1000, '2021-12-01 09:21:14', 'Sidang');

-- --------------------------------------------------------

--
-- Table structure for table `revisi_proposal`
--

CREATE TABLE `revisi_proposal` (
  `id` int(11) NOT NULL,
  `revisi_text` text DEFAULT NULL,
  `revisi_ke` int(11) NOT NULL,
  `status_revisi` enum('Belum','Selesai','Tinjau','Penilaian','Sidang','Lulus') NOT NULL,
  `nim` int(11) NOT NULL,
  `revisi_by` int(11) DEFAULT NULL,
  `id_repo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `revisi_proposal`
--

INSERT INTO `revisi_proposal` (`id`, `revisi_text`, `revisi_ke`, `status_revisi`, `nim`, `revisi_by`, `id_repo`) VALUES
(5, 'Revisi paragraf sekian bla bla bla', 2, 'Penilaian', 9901, 1000, 5),
(7, 'revisi disini', 2, 'Lulus', 180102021, 1000, 6),
(8, NULL, 0, 'Tinjau', 9090, NULL, NULL);

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
('MNQGTLEwqyhK9FtlUWiOxiny73qIY7Z1Ewrx8DJy', 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieE01ZERuamE2bENrZTZWTmptZmRtTjI1VXkwSFVhMm5hN1JiektIbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZWxha3NhbmFhbi1zaWRhbmcvY2V0YWstaGFzaWwvMTgwMTAyMDIxIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjc7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNjM4NzY2NTg3O319', 1638773097);

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
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 'Admin Jaya Jaya Jaya', 'admin', '12345', 'admin@gmail.com', NULL, '$2y$10$bYF6I8jwLeDo/sq/knlwRO7.sfOWL/qlNdFO76ylEtfXe2KYjMIEi', 'CLBINDy52Y6WkYwrYlVC6VF86YbwemXb8zHDGOARnwL9LdRAAPnQxMROfBZH', '2021-11-23 02:33:27', '2021-11-23 02:33:27'),
(11, 'Jojoba', 'mahasiswa', '9901', 'jojoba@gmail.com', NULL, '$2y$10$MN5GSu29zJTtD.uqIIvHjOQPEffGUns8W7HYmKURiLptp1aoTTy1a', NULL, '2021-11-23 18:02:26', '2021-11-23 18:02:26'),
(12, 'Mahasiswa1', 'mahasiswa', '9090', 'mahasiswa@gmail.com', NULL, '$2y$10$aIhBpa2pw6L8qJDX9jW/e.qRTBwxoUjMNnLautKsiO2h6Ac/JoV3S', NULL, '2021-11-23 18:05:42', '2021-11-23 18:05:42'),
(13, 'odod', 'mahasiswa', '180102021', 'odod@gmail.com', NULL, '$2y$10$bYF6I8jwLeDo/sq/knlwRO7.sfOWL/qlNdFO76ylEtfXe2KYjMIEi', NULL, '2021-11-23 18:08:53', '2021-11-23 18:08:53'),
(14, 'Dadang Konelo', 'dosen', '1000', 'dadangdosen@gmail.com', NULL, '$2y$10$bYF6I8jwLeDo/sq/knlwRO7.sfOWL/qlNdFO76ylEtfXe2KYjMIEi', 'R7PKfAPTGloOi2UXvTWtw9dMEKgPR4xkpC1EIUb7fIQdlmdBE1TL8YIwIKbF', NULL, NULL),
(22, 'Ripat', 'mahasiswa', '321213321', 'ripaldi@gmail.com', NULL, '$2y$10$/iAQtMYnCpjYSa0P6o5fs.CDey9BE/X1vDTiNF6eQQ0e6vPePbGUy', NULL, '2021-12-01 21:11:54', '2021-12-01 21:11:54'),
(25, 'Rizal Dwi Prayogo S.St, M.Kom', 'dosen_fungsional', '1994', 'yogo@gmail.com', NULL, '$2y$10$bYF6I8jwLeDo/sq/knlwRO7.sfOWL/qlNdFO76ylEtfXe2KYjMIEi', NULL, '2021-12-03 01:54:13', '2021-12-03 01:54:13'),
(26, 'Jojo', 'mahasiswa', '232323', 'jojo@gmail.com', NULL, '', NULL, '2021-12-04 01:16:11', '2021-12-04 01:16:11'),
(27, 'Sutadi', 'dosen_penguji', '4456716', 'sutadi@gmail.com', NULL, '$2y$10$hidC1X86mBuF10hfvLdK8enTGFsBx2uBdRxmytW/NEQaUo4k3ntPG', NULL, '2021-12-04 01:17:51', '2021-12-04 01:17:51');

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
-- Indexes for table `nilai_pembimbing`
--
ALTER TABLE `nilai_pembimbing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_penguji`
--
ALTER TABLE `nilai_penguji`
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
-- Indexes for table `revisi_proposal`
--
ALTER TABLE `revisi_proposal`
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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_repo`
--
ALTER TABLE `file_repo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jadwal_ta`
--
ALTER TABLE `jadwal_ta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `judul_ta`
--
ALTER TABLE `judul_ta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai_pembimbing`
--
ALTER TABLE `nilai_pembimbing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nilai_penguji`
--
ALTER TABLE `nilai_penguji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `revisi_proposal`
--
ALTER TABLE `revisi_proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
