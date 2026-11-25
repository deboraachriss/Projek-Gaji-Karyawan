-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2024 at 08:29 AM
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
-- Database: `db_c`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `username`, `password`) VALUES
(1, 'admin1', '1234'),
(2, 'admin2', '4321'),
(3, 'deb2', '2222'),
(4, 'feli', '999'),
(5, 'admin1', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tb_gaji`
--

CREATE TABLE `tb_gaji` (
  `id_penggajian` int(11) NOT NULL,
  `gaji_perjam` double NOT NULL DEFAULT 30000,
  `jam_kerja` int(11) DEFAULT NULL,
  `tunjangan` double DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `id_karyawan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_gaji`
--

INSERT INTO `tb_gaji` (`id_penggajian`, `gaji_perjam`, `jam_kerja`, `tunjangan`, `status`, `id_karyawan`) VALUES
(1, 56944, 180, 10250000, 'lunas', 1),
(2, 56944, 180, 10250000, 'lunas', 3),
(3, 56944, 180, 10250000, 'lunas', 6),
(4, 56944, 180, 10250000, 'lunas', 9),
(5, 56944, 180, 10250000, 'lunas', 11),
(6, 56944, 180, 10250000, 'lunas', 14),
(7, 56944, 180, 10250000, 'lunas', 16),
(8, 56944, 180, 10250000, 'lunas', 18),
(9, 56944, 180, 10250000, 'lunas', 19),
(10, 56944, 180, 10250000, 'lunas', 21),
(11, 56944, 180, 10250000, 'lunas', 29),
(12, 56944, 180, 10250000, 'lunas', 4),
(13, 56944, 180, 10250000, 'lunas', 7),
(14, 56944, 180, 10250000, 'lunas', 12),
(15, 56944, 180, 10250000, 'lunas', 25),
(16, 56944, 180, 10250000, 'lunas', 27),
(17, 30000, 120, 0, 'lunas', 13),
(18, 30000, 120, 0, 'lunas', 17),
(19, 30000, 120, 0, 'lunas', 22),
(20, 30000, 120, 0, 'lunas', 24),
(21, 30000, 120, 0, 'belum lunas', 26),
(22, 30000, 120, 0, 'belum lunas', 2),
(23, 30000, 120, 0, 'belum lunas', 5),
(24, 30000, 120, 0, 'belum lunas', 8),
(25, 30000, 120, 0, 'belum lunas', 10),
(26, 30000, 120, 0, 'belum lunas', 15),
(27, 30000, 120, 0, 'belum lunas', 20),
(28, 30000, 120, 0, 'belum lunas', 28),
(29, 30000, 120, 0, 'belum lunas', 30),
(30, 30000, 180, 10250000, 'Lunas', 23),
(31, 30000, 120, 10250000, 'Lunas', 37),
(32, 56944, 180, NULL, 'Belum Lunas', 38),
(33, 30000, 120, NULL, 'Belum Lunas', 39),
(34, 56944, 180, 0, 'Belum Lunas', 40),
(35, 30000, 120, 0, 'Belum Lunas', 41),
(36, 56944, 180, 0, 'Belum Lunas', 42),
(37, 30000, 120, 0, 'Lunas', 43),
(38, 56944, 180, 0, 'Lunas', 44),
(39, 30000, 120, 0, 'Lunas', 45);

--
-- Triggers `tb_gaji`
--
DELIMITER $$
CREATE TRIGGER `after_insert_gaji` AFTER INSERT ON `tb_gaji` FOR EACH ROW BEGIN
    INSERT INTO tb_transaksi (id_karyawan, total_gaji, status_transaksi)
    VALUES (NEW.id_karyawan, (NEW.gaji_perjam * NEW.jam_kerja * 12 + NEW.tunjangan), 'Belum Lunas');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_karyawan`
--

CREATE TABLE `tb_karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jabatan` varchar(10) NOT NULL,
  `no_rek` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_karyawan`
--

INSERT INTO `tb_karyawan` (`id_karyawan`, `nama`, `alamat`, `tanggal_masuk`, `jabatan`, `no_rek`, `email`, `no_hp`) VALUES
(1, 'Felicia Wijaya', 'Jl. Merdeka No.1', '2023-01-15', 'tetap', 12345678, 'felicia.wijaya@uksw.edu', 2147483647),
(2, 'Aisya Rizky', 'Jl. Sudirman No.2', '2023-03-20', 'honorer', 23456789, 'aisya.rizky@uksw.edu', 2147483647),
(3, 'Debora Chrisdiar', 'Jl. Gatot Subroto No.3', '2024-07-10', 'tetap', 34567890, 'debora.chrisdiar@uksw.edu', 2147483647),
(4, 'Yeremia Alfa', 'Jl. Ahmad Yani No.4', '2022-09-12', 'tetap', 45678901, 'yeremia.alfa@uksw.edu', 2147483647),
(5, 'Rio Arya', 'Jl. Siliwangi No.5', '2024-01-05', 'honorer', 56789012, 'rio.arya@uksw.edu', 2147483647),
(6, 'Ezra Ezra', 'Jl. Diponegoro No.6', '2021-05-15', 'tetap', 67890123, 'ezra.ezra@uksw.edu', 2147483647),
(7, 'Joko Wibowo', 'Jl. Kartini No.7', '2020-02-20', 'tetap', 78901234, 'joko.wibowo@uksw.edu', 2147483647),
(8, 'Hana Widya', 'Jl. RA Kartini No.8', '2019-08-25', 'honorer', 89012345, 'hana.widya@uksw.edu', 2147483647),
(9, 'Vadel Bajideh', 'Jl. Bung Tomo No.9', '2020-06-30', 'tetap', 90123456, 'vadel.bajideh@uksw.edu', 2147483647),
(10, 'Laura Lolly', 'Jl. WR Supratman No.10', '2021-11-22', 'honorer', 12345670, 'laura.lolly@email.com', 2147483647),
(11, 'Sugeno Sugeni', 'Jl. Imam Bonjol No.11', '2023-12-10', 'tetap', 23456781, 'sugeno.sugeni@email.com', 2147483647),
(12, 'Lala Pooh', 'Jl. KH Ahmad Dahlan No.12', '2019-03-15', 'tetap', 34567892, 'lala.pooh@uksw.edu', 2147483647),
(13, 'Justin Bibir', 'Jl. RA Kartini No.13', '2020-07-19', 'honorer', 45678903, 'justin.bibir@uksw.edu', 2147483647),
(14, 'Telor Sewift', 'Jl. HOS Tjokroaminoto No.14', '2024-12-25', 'tetap', 56789014, 'telor.sewift@uksw.edu', 2147483647),
(15, 'Satria Mahatir', 'Jl. Teuku Umar No.15', '2024-03-01', 'honorer', 67890125, 'satria.mahatir@uksw.edu', 2147483647),
(16, 'Sumanto Sucipto', 'Jl. KH Wahid Hasyim No.16', '2020-04-05', 'tetap', 78901236, 'sumanto.sucipto@uksw.edu', 2147483647),
(17, 'Tsuka Moto', 'Jl. KH Ahmad Dahlan No.17', '2021-11-12', 'honorer', 89012347, 'tsuka.moto@uksw.edu', 2147483647),
(18, 'Laura Siburian', 'Jl. Sudirman No.18', '2021-02-14', 'tetap', 90123458, 'laura.siburian@uksw.edu', 2147483647),
(19, 'Laura Siburaan', 'Jl. Gatot Subroto No.19', '2023-05-18', 'tetap', 12345671, 'laura.siburaan@uksw.edu', 2147483647),
(20, 'Agnes Monica', 'Jl. Merdeka No.20', '2020-09-22', 'honorer', 23456782, 'agnes.monica@uksw.edu', 2147483647),
(21, 'Elly Sugigi', 'Jl. Ahmad Yani No.21', '2022-01-01', 'tetap', 34567893, 'elly.sugigi@uksw.edu', 2147483647),
(22, 'Tinky Winkie', 'Jl. Siliwangi No.22', '2020-06-15', 'honorer', 45678904, 'tinky.winkie@uksw.edu', 2147483647),
(23, 'Sudirman', 'Jl. Bung Tomo No.23', '2023-03-18', 'tetap', 56789015, 'sudirman@uksw.edu', 2147483647),
(24, 'Budi Kristy', 'Jl. Diponegoro No.24', '2021-07-22', 'honorer', 67890126, 'budy.kristy@uksw.edu', 2147483647),
(25, 'Spongebob Suherman', 'Jl. Kartini No.25', '2020-11-15', 'tetap', 78901237, 'sponegbob.suherman@uksw.edu', 2147483647),
(26, 'Susanti Handayani', 'Jl. Imam Bonjol No.26', '2014-09-30', 'honorer', 89012348, 'susanti.handayani@uksw.edu', 2147483647),
(27, 'Aholiab Sanjaya', 'Jl. Bung Karno No.27', '2022-02-14', 'tetap', 90123459, 'aholiab.sanjaya@uksw.edu', 2147483647),
(28, 'Patimura Sunjaya', 'Jl. RA Kartini No.28', '2021-06-21', 'honorer', 12345672, 'patimura.sunjaya@uksw.edu', 2147483647),
(29, 'Cahya Bulan', 'Jl. HOS Tjokroaminoto No.29', '2022-03-10', 'tetap', 23456783, 'cahya.bulan@uksw.edu', 2147483647),
(30, 'R.A Kartini', 'Jl. KH Wahid Hasyim No.30', '2024-10-25', 'honorer', 34567894, 'kartini@uksw.edu', 2147483647),
(31, 'Halo', 'hi', '2023-09-09', 'Honorer', 123, 'f@mail.com', 98),
(32, 'Sapi', 'Jl. Salatiga', '2022-09-09', 'Tetap', 123, 's@sapi.com', 91),
(33, 'Hi', 'Hi', '2020-09-09', 'Honorer', 123123, 'shsh', 99),
(34, 'Baru', 'Coba', '2021-09-09', 'Honorer', 12345678, 'baru', 91),
(35, 'hi', 'hi', '2023-10-12', 'Tetap', 12345678, 'f', 98),
(36, 'soimah', 'slatiga', '2023-09-09', 'Honorer', 123671661, 'soim@g.com', 929),
(37, 'soimah', 'salatiga', '2020-02-02', 'Honorer', 124511181, 'soimh@g.com', 8272910),
(38, 'sn', 'sk20', '2029-09-09', 'Tetap', 262627, 'g@g.c', 63636),
(39, 'jjs', 'sl', '2020-02-20', 'Honorer', 27272, 'ge@em.c', 227),
(40, 'ne', 'd', '2020-09-09', 'Tetap', 2, 'f@', 29),
(41, 'jjs', 'fs', '2024-09-09', 'Honorer', 7272, 'ff@.com', 2627),
(42, 'djdk', 'sjjs', '2024-09-09', 'Tetap', 27272, 'shsh@djj.com', 727282),
(43, 'ya', 'kaa', '2024-09-09', 'Honorer', 62, 'dh', 2),
(44, 'x2', 'd', '2023-09-08', 'Tetap', 22, 'f', 2),
(45, 'coba', 'baru', '2024-09-08', 'Honorer', 2272, 'd', 28);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `total_gaji` int(11) NOT NULL,
  `status_transaksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_karyawan`, `total_gaji`, `status_transaksi`) VALUES
(32, 26, 3600000, 'belum lunas'),
(33, 2, 3600000, 'belum lunas'),
(34, 5, 3600000, 'belum lunas'),
(35, 8, 3600000, 'belum lunas'),
(36, 10, 3600000, 'belum lunas'),
(37, 15, 3600000, 'belum lunas'),
(38, 20, 3600000, 'belum lunas'),
(39, 28, 3600000, 'belum lunas'),
(40, 30, 3600000, 'belum lunas'),
(41, 23, 15650000, 'belum lunas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD PRIMARY KEY (`id_penggajian`),
  ADD KEY `fk_karyawan` (`id_karyawan`);

--
-- Indexes for table `tb_karyawan`
--
ALTER TABLE `tb_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  MODIFY `id_penggajian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tb_karyawan`
--
ALTER TABLE `tb_karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD CONSTRAINT `fk_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`);

--
-- Constraints for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
