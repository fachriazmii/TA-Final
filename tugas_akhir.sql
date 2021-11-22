-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 02, 2021 at 07:57 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_akhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` varchar(255) NOT NULL,
  `nama_dosen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `file_repo`
--

CREATE TABLE `file_repo` (
  `id` bigint(20) NOT NULL,
  `nama` text NOT NULL,
  `cloud_path` text NOT NULL,
  `local_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `pbb1` varchar(255) NOT NULL,
  `pbb2` varchar(255) NOT NULL,
  `judul` text NOT NULL,
  `kuota` int(3) NOT NULL,
  `aktif` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` varchar(255) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `id` int(11) NOT NULL,
  `id_judul` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `id_repo` bigint(20) NOT NULL,
  `approve_by` bigint(20) UNSIGNED NOT NULL,
  `waktu_pengajuan` datetime NOT NULL,
  `status` enum('Pengajuan','Disetujui','Revisi','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`);

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


-- Indexes for table `pendaftaran_sidang`
--
ALTER TABLE `pendaftaran_sidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `file_repo`
--
ALTER TABLE `file_repo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_ta`
--
ALTER TABLE `jadwal_ta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `judul_ta`
--
ALTER TABLE `judul_ta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendaftaran_sidang`
--
ALTER TABLE `pendaftaran_sidang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pendaftaran_sidang`
--
ALTER TABLE `pendaftaran_sidang`
  ADD CONSTRAINT `pendaftaran_sidang_ibfk_8` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
