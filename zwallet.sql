-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jan 2021 pada 15.02
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zwallet`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_balance`
--

CREATE TABLE `tb_balance` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login_token`
--

CREATE TABLE `tb_login_token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_otp_activation`
--

CREATE TABLE `tb_otp_activation` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_otp_reset`
--

CREATE TABLE `tb_otp_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tranfer`
--

CREATE TABLE `tb_tranfer` (
  `id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_type_transfer`
--

CREATE TABLE `tb_type_transfer` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_type_transfer`
--

INSERT INTO `tb_type_transfer` (`id`, `type`) VALUES
(1, 'out'),
(2, 'in');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL DEFAULT '',
  `pin` int(6) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL DEFAULT '/images/default.jpg',
  `is_active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_balance`
--
ALTER TABLE `tb_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_login_token`
--
ALTER TABLE `tb_login_token`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_otp_activation`
--
ALTER TABLE `tb_otp_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_otp_reset`
--
ALTER TABLE `tb_otp_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_tranfer`
--
ALTER TABLE `tb_tranfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_tranfer_ibfk_1` (`sender`),
  ADD KEY `tb_tranfer_ibfk_2` (`receiver`),
  ADD KEY `type` (`type`);

--
-- Indeks untuk tabel `tb_type_transfer`
--
ALTER TABLE `tb_type_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_balance`
--
ALTER TABLE `tb_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_login_token`
--
ALTER TABLE `tb_login_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_otp_activation`
--
ALTER TABLE `tb_otp_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_otp_reset`
--
ALTER TABLE `tb_otp_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_tranfer`
--
ALTER TABLE `tb_tranfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_type_transfer`
--
ALTER TABLE `tb_type_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_balance`
--
ALTER TABLE `tb_balance`
  ADD CONSTRAINT `tb_balance_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_tranfer`
--
ALTER TABLE `tb_tranfer`
  ADD CONSTRAINT `tb_tranfer_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_tranfer_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_tranfer_ibfk_3` FOREIGN KEY (`type`) REFERENCES `tb_type_transfer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
