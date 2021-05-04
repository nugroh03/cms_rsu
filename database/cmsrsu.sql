-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 04 Bulan Mei 2021 pada 19.44
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmsrsu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tiket`
--

CREATE TABLE `tbl_tiket` (
  `tiket_id` int(11) NOT NULL,
  `unit_id` varchar(20) NOT NULL,
  `nip` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `unit_name` varchar(20) NOT NULL,
  `time` varchar(50) NOT NULL,
  `location` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `no_tlp` varchar(15) NOT NULL,
  `status_tiket` varchar(10) NOT NULL,
  `image_before` text NOT NULL,
  `image_after` text NOT NULL,
  `trash` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `unit_id` int(11) NOT NULL,
  `name_unit` varchar(20) NOT NULL,
  `image` text NOT NULL,
  `trash` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_unit`
--

INSERT INTO `tbl_unit` (`unit_id`, `name_unit`, `image`, `trash`) VALUES
(1, 'Bangunan', '', 0),
(2, 'IT', '', 0),
(3, 'Kendaraan', '', 0),
(4, 'Alkes', '', 0),
(5, 'Electrikal', '', 0),
(6, 'Sanitary', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `token` text COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `nip` varchar(15) COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `role` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `trash` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `token`, `name`, `nip`, `role`, `password`, `trash`) VALUES
(1, '', '', '089680406367', '', 'e10adc3949ba59abbe56e057f20f883e', 0),
(5, '', 'nugroho', '987', '', 'e10adc3949ba59abbe56e057f20f883e', 0),
(6, '', 'Mang Asep', '8765', '', 'e10adc3949ba59abbe56e057f20f883e', 0),
(7, '158bca7758bfc6d9f073954cebcf084232117832', 'Mas Sigit', '98789', '', 'e10adc3949ba59abbe56e057f20f883e', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
  ADD PRIMARY KEY (`tiket_id`);

--
-- Indeks untuk tabel `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_tiket`
--
ALTER TABLE `tbl_tiket`
  MODIFY `tiket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
