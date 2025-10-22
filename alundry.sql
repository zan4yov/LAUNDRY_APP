-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Nov 2024 pada 04.37
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cucian`
--

CREATE TABLE `cucian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_order` varchar(10) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `atas_nama` varchar(255) DEFAULT NULL,
  `snap_token` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `no_wa` varchar(255) DEFAULT NULL,
  `jenis_order` enum('online','offline') NOT NULL,
  `jenis_ambil` enum('diantar','ambil sendiri') NOT NULL,
  `ongkir_antar` double DEFAULT 0,
  `ongkir_jemput` double DEFAULT 0,
  `wkt_order` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estimasi` timestamp NULL DEFAULT NULL,
  `wkt_selesai` timestamp NULL DEFAULT NULL,
  `wkt_diambil` timestamp NULL DEFAULT NULL,
  `alamat_antar` varchar(255) DEFAULT NULL,
  `berat` double DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `status_cucian` enum('menunggu','diproses','selesai','diambil') NOT NULL,
  `status_bayar` enum('dibayar','belum dibayar') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cucian`
--

INSERT INTO `cucian` (`id`, `no_order`, `kategori_id`, `user_id`, `atas_nama`, `snap_token`, `no_telp`, `no_wa`, `jenis_order`, `jenis_ambil`, `ongkir_antar`, `ongkir_jemput`, `wkt_order`, `estimasi`, `wkt_selesai`, `wkt_diambil`, `alamat_antar`, `berat`, `total_harga`, `status_cucian`, `status_bayar`, `created_at`, `updated_at`) VALUES
(1, 'xtquc2lyad', 5, 1, 'Belinda Pertiwi', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-25 03:59:03', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 8, 11890, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(2, 'nnu1mn122t', 5, 1, 'Faizah Hariyah', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-25 03:59:03', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 51327, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(3, 'lgfdku7uwi', 1, 1, 'Gawati Juli Hartati S.IP', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-25 03:59:03', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 4, 16144, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(4, 'dkesq1w8xd', 5, 1, 'Ciaobella Suartini', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(5, 'dz1whwvnp9', 5, 1, 'Nurul Namaga S.IP', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(6, 'uq7yjqunui', 3, 1, 'Restu Wastuti', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 71523, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(7, 'elya4nhwj6', 4, 1, 'Cemani Prasetyo', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 3, 56025, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(8, 'knpr32kwlg', 2, 1, 'Bakidin Gunawan S.H.', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 6, 39984, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(9, 'ey3jj5uuxc', 5, 1, 'Lega Samosir', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 8, 35100, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(10, 'fyalnv44bm', 4, 1, 'Oni Nurdiyanti', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 9, 26310, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(11, 'gzh3nlo6zh', 2, 1, 'Galak Daru Sirait', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 2, 17205, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(12, 'lisaobsxqd', 1, 1, 'Ian Irawan', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 6, 46626, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(13, 'icopogjmni', 2, 1, 'Ulya Yolanda', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 18:18:17', '2024-11-25 09:19:35', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 1, 75754, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(14, 'v9gq8fp3ui', 5, 1, 'Gawati Nabila Mulyani S.H.', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', '2024-11-23 12:26:30', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 2, 13866, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(15, 'otmnqcgovb', 4, 1, 'Lamar Mangunsong', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', '2024-11-23 12:26:30', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 8, 51556, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(16, 'tn7bjavbev', 1, 1, 'Bakiono Natsir', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 00:45:07', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 49936, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(17, 'smmjf0nf2h', 1, 1, 'Hani Wirda Purwanti', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-21 00:45:07', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 4, 70967, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(18, 'dmooeihlkd', 2, 1, 'Harsaya Nashiruddin', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', '2024-11-21 17:13:05', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 1, 38818, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(19, 'xeatxvfrwd', 3, 1, 'Nyana Sihombing', NULL, '62895706077200', '62895706077200', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', '2024-11-21 17:13:05', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 4, 24673, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(20, '1xilxssjqa', 3, 1, 'Darijan Situmorang', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(21, '40azesqwyv', 3, 1, 'Cemplunk Kuswoyo', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(22, '1qmhjyadwl', 3, 1, 'Zalindra Zulaika', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(23, 'gvny1utc74', 3, 1, 'Liman Among Mangunsong', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-20 05:32:24', '2024-11-21 20:46:08', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 8, 42644, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(24, 's0mewrgb5p', 3, 1, 'Empluk Zulkarnain', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-20 05:32:24', '2024-11-21 20:46:08', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 13030, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(25, 'dkosnrzvio', 3, 1, 'Ayu Halimah M.Kom.', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-20 05:32:24', '2024-11-21 20:46:08', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 8, 86857, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(26, 'kct3iqxkvx', 1, 1, 'Kenari Simanjuntak', NULL, '62895706077200', '62895706077200', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-20 05:32:24', '2024-11-21 20:46:08', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 1, 44049, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(27, 'tms3o6zhaf', 4, 2, 'Cinthia Paulin Mandasari M.TI.', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-22 21:34:32', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 1, 65600, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(28, '7lxtx3mf3r', 2, 2, 'Jaeman Wibowo', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-22 21:34:32', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 2, 41763, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(29, 't4spaowumr', 5, 2, 'Elisa Ira Hariyah', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-22 21:34:32', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 3, 27493, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(30, 'evj70galvi', 4, 2, 'Gasti Yani Yulianti S.Pt', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(31, 'ecpzzrmfcr', 4, 2, 'Hardana Wijaya', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(32, '5y10hqng7a', 3, 2, 'Salman Wibowo', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 6, 34675, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(33, '9khnd8iipe', 2, 2, 'Anita Patricia Agustina', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 7, 53348, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(34, '7lrgmsgpw5', 4, 2, 'Nilam Hassanah S.H.', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 7, 57633, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(35, 'rzvekkszhd', 2, 2, 'Rama Saefullah', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 3, 55381, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(36, 'bb65sdbpax', 2, 2, 'Martana Maryadi', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 10, 87613, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(37, '9wc7dwmhf4', 4, 2, 'Dirja Kusuma Napitupulu S.Ked', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 7, 53340, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(38, 'lcbkzdyxut', 1, 2, 'Gara Ihsan Widodo M.M.', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 10, 12547, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(39, 'p14ueeeef8', 4, 2, 'Ega Virman Thamrin', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 22:56:43', '2024-11-21 09:59:12', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 9, 22041, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(40, '7cvfb0h9tn', 2, 2, 'Elon Mulya Permadi', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', '2024-11-27 01:08:27', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 1, 46576, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(41, '2jo36xdw4w', 2, 2, 'Asmadi Napitupulu', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', '2024-11-27 01:08:27', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 8, 13317, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(42, 'plukbdl9jg', 3, 2, 'Endah Shakila Hastuti', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 13:26:33', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 1, 70067, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(43, 'f1jbsgow5z', 5, 2, 'Adika Hardiansyah', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', NULL, '2024-11-24 13:26:33', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 5, 99069, 'selesai', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(44, 'lxqbbtfmzl', 1, 2, 'Prabawa Waskita', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', '2024-11-22 22:50:59', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 10, 42777, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(45, 'o8zkdmmbf0', 4, 2, 'Eva Hassanah', NULL, '6281323135707', '6281323135707', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:38', '2024-11-22 22:50:59', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 1, 85174, 'diproses', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(46, 'cpcpupmatp', 4, 2, 'Bakidin Pardi Dabukke', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(47, 'nycmgqznge', 4, 2, 'Salsabila Halimah', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(48, 'sow9dpcmrn', 4, 2, 'Septi Rahayu', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(49, '51hzzblldw', 2, 2, 'Oman Haryanto', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-22 05:10:18', '2024-11-21 14:46:51', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 4, 72207, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(50, 'dkfcyyerxd', 4, 2, 'Pardi Saragih S.T.', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-22 05:10:18', '2024-11-21 14:46:51', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 3, 53976, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(51, '3yn91uzdl0', 1, 2, 'Paramita Nuraini S.Sos', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-22 05:10:18', '2024-11-21 14:46:51', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 3, 55743, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(52, 'bdd5ya9jqk', 2, 2, 'Mutia Kuswandari', NULL, '6281323135707', '6281323135707', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:38', NULL, '2024-11-22 05:10:18', '2024-11-21 14:46:51', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 5, 91038, 'diambil', 'dibayar', '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(53, 'bogt8bhvnt', 3, 3, 'Nabila Utami', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 20:36:18', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 1, 14962, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(54, 'jgcqqrnlmw', 1, 3, 'Sakura Padmasari', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 20:36:18', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 7, 75022, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(55, 'bbjp9odwih', 3, 3, 'Gilda Wastuti', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 20:36:18', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 9, 63361, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(56, '6dzuip80d5', 4, 3, 'Emin Vero Samosir S.Farm', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(57, 'b5cygq4ehn', 4, 3, 'Ikin Rusman Marbun S.Kom', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(58, '9ckhafsusz', 4, 3, 'Safina Pratiwi', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 3, 11770, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(59, 'kscbaokuax', 1, 3, 'Maida Pudjiastuti S.T.', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 9, 38168, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(60, 'siiwjmb3zv', 3, 3, 'Maimunah Kani Hasanah S.IP', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 8, 77183, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(61, 'qahy982tij', 2, 3, 'Restu Lestari', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 6, 19090, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(62, 'zvh63sy6vi', 4, 3, 'Patricia Puspasari', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 9, 67610, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(63, 'i6bnntboqi', 1, 3, 'Lala Winarsih', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 9, 29525, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(64, '0io8uuflqu', 1, 3, 'Prasetya Argono Jailani S.Gz', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 6, 60764, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(65, 'buxfqcqvip', 3, 3, 'Cengkal Pranowo', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 04:42:16', '2024-11-22 02:58:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 9, 80926, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(66, 'skbiexfxp3', 2, 3, 'Prakosa Ramadan', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', '2024-11-25 12:33:55', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 8, 44367, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(67, 'sljify7k1o', 3, 3, 'Kariman Asmadi Megantara S.Kom', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', '2024-11-25 12:33:55', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 9, 51136, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(68, 'hdzklvgmvn', 3, 3, 'Ajimat Erik Sitompul', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-25 12:04:43', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 1, 99393, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(69, 'mpmcl5ld4q', 4, 3, 'Martaka Daruna Hidayat M.Kom.', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-25 12:04:43', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 10, 86717, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(70, 's2yhbrzhiy', 2, 3, 'Maida Puspita S.H.', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', '2024-11-23 02:26:49', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 10, 29478, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(71, 'r6mfoeqxjz', 1, 3, 'Sabrina Violet Puspita', NULL, '6287881823267', '6287881823267', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', '2024-11-23 02:26:49', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 5, 67398, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(72, 'n2b4bqn7qg', 1, 3, 'Maimunah Purwanti', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(73, 'xw1vc4nmi5', 1, 3, 'Kamal Ramadan S.Farm', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(74, 'xrx7drv5iu', 1, 3, 'Gada Kawaca Kurniawan S.H.', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(75, 'vb0naut2xr', 5, 3, 'Ilyas Jailani M.Pd', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 05:46:13', '2024-11-22 02:12:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 2, 30916, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(76, 'dyim19epuj', 3, 3, 'Dasa Marpaung', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 05:46:13', '2024-11-22 02:12:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 4, 48383, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(77, 'jscg3ad44g', 3, 3, 'Irma Nilam Hariyah', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 05:46:13', '2024-11-22 02:12:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 5, 60376, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(78, 'yeaylssuhn', 1, 3, 'Wardaya Ozy Simanjuntak', NULL, '6287881823267', '6287881823267', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 05:46:13', '2024-11-22 02:12:01', 'Jln. Warga No. 259, Jambi 59410, Lampung', 7, 80606, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(79, 'sppex4sqpe', 1, 4, 'Oman Wacana', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-26 19:29:06', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 4, 30965, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(80, 'dnlhz7fcqg', 1, 4, 'Gantar Nugroho', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-26 19:29:06', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 24571, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(81, 'ncbepdalcf', 3, 4, 'Damar Wacana', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-26 19:29:06', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 77927, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(82, 'zlib0impt0', 2, 4, 'Zelaya Pratiwi', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(83, 'ebizbvaygf', 2, 4, 'Julia Ellis Aryani S.Psi', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(84, 'fwom1q0rfn', 2, 4, 'Purwadi Zulkarnain', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 10, 73643, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(85, 'biteyshftl', 5, 4, 'Gada Hairyanto Tarihoran M.M.', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 6, 77618, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(86, 'axwl4xfilh', 2, 4, 'Karimah Farida', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 4, 97887, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(87, '5vvujjx4co', 3, 4, 'Atma Anggriawan', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 55346, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(88, 'dwpgllxnyn', 1, 4, 'Daniswara Pangestu M.TI.', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 2, 19673, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(89, 'rtva84galb', 3, 4, 'Zelda Titin Susanti S.H.', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 5, 20622, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(90, 'givjsp8haq', 4, 4, 'Farah Queen Oktaviani', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 6, 61105, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(91, '4b71adkcto', 2, 4, 'Yunita Yuliana Utami S.Farm', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 19:17:03', '2024-11-22 02:56:44', 'Gg. Bakin No. 269, Madiun 34546, DIY', 10, 77021, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(92, '9ie8yegdz8', 4, 4, 'Bakianto Kariman Siregar S.H.', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', '2024-11-23 04:17:11', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 2, 75788, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(93, 'aiicqe5esw', 5, 4, 'Mutia Rahmawati', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', '2024-11-23 04:17:11', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 24233, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(94, '9mfjskzbvt', 2, 4, 'Elvina Kezia Uyainah', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-26 00:49:13', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 16968, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(95, 'i5ehnvnqep', 4, 4, 'Aurora Zulaika', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-26 00:49:13', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 89489, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(96, '6dkr5guirk', 2, 4, 'Hana Wastuti S.I.Kom', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', '2024-11-25 15:50:20', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 78097, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(97, 'h8fkjyxzqy', 2, 4, 'Ratna Paramita Usada', NULL, '6281279715551', '6281279715551', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', '2024-11-25 15:50:20', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 36386, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(98, 'vxngrvlurr', 1, 4, 'Abyasa Jagaraga Natsir S.Psi', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(99, 'g3nxrnjnnx', 1, 4, 'Latika Tina Melani S.E.I', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(100, 'kt6ivclvks', 1, 4, 'Rama Prasetya S.Farm', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(101, 'hinsyg012e', 2, 4, 'Uchita Novitasari M.Pd', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-25 17:05:16', '2024-11-23 14:49:22', 'Gg. Bakin No. 269, Madiun 34546, DIY', 5, 39361, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(102, 'zbfmqhuivh', 2, 4, 'Nadia Nasyiah', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-25 17:05:16', '2024-11-23 14:49:22', 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 35564, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(103, 'dtdt3q6qnu', 5, 4, 'Silvia Permata', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-25 17:05:16', '2024-11-23 14:49:22', 'Gg. Bakin No. 269, Madiun 34546, DIY', 4, 26601, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(104, 'aty5tthhed', 2, 4, 'Citra Mandasari', NULL, '6281279715551', '6281279715551', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-25 17:05:16', '2024-11-23 14:49:22', 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 27016, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(105, 'yu7cbe68fo', 3, 5, 'Sari Fujiati', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 08:17:46', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 9, 54864, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(106, 'hoxj82sfzh', 2, 5, 'Maya Tari Hasanah', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 08:17:46', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 1, 77298, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(107, 'r4osmcapyz', 1, 5, 'Kacung Prasasta M.M.', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-21 08:17:46', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 8, 26059, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(108, 'lp6vhedzvs', 5, 5, 'Prabowo Gunawan', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(109, 'sewllppf5y', 5, 5, 'Kairav Jailani', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(110, 'tbnyd4z4zq', 2, 5, 'Galak Tamba', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 9, 43960, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(111, 'rs1cyf03rc', 2, 5, 'Bancar Rajasa S.Kom', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 6, 56593, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(112, '8psnhwyjg9', 5, 5, 'Cinthia Utami', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 2, 56174, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(113, 'j2yt7to7fy', 4, 5, 'Dadap Sirait S.I.Kom', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 7, 86163, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(114, '5puhwshd75', 2, 5, 'Jayadi Mitra Situmorang', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 3, 80760, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(115, 'zecbwia7tt', 4, 5, 'Pia Padmi Puspasari M.Farm', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 7, 44888, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(116, '6mwh0wk5gh', 4, 5, 'Hamima Mayasari', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 5, 99793, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(117, '2m2z0qaxdo', 1, 5, 'Malik Budiyanto', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 03:06:01', '2024-11-25 06:47:52', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 1, 94824, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(118, 'd9nmkmke2z', 4, 5, 'Cakrabuana Simbolon', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', '2024-11-22 17:08:14', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 4, 47221, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(119, 'rhemkiewgk', 3, 5, 'Septi Rahayu', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', '2024-11-22 17:08:14', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 4, 76362, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(120, 'suerbwiei9', 5, 5, 'Reksa Tampubolon', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 22:03:05', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 1, 91897, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(121, 'q9cxpm9vlc', 3, 5, 'Shakila Kusmawati', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', NULL, '2024-11-23 22:03:05', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 10, 44554, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(122, '7x4zhmj40a', 3, 5, 'Jindra Cakrabirawa Wasita', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', '2024-11-23 14:28:29', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 1, 40238, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(123, 'iduuwctu04', 2, 5, 'Jayadi Winarno', NULL, '6281230103784', '6281230103784', 'online', 'diantar', 2000, 2000, '2024-11-20 03:33:39', '2024-11-23 14:28:29', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 10, 32158, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(124, 'hot12jgwev', 4, 5, 'Ibrani Jagaraga Rajasa S.Gz', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(125, 'lrue6tlrhl', 4, 5, 'Humaira Prastuti S.Pd', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(126, 'bx7ibr5mwl', 4, 5, 'Rahmi Shania Widiastuti S.Gz', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', NULL, NULL, 'menunggu', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(127, 'thlgrn7wmq', 2, 5, 'Hana Usada', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 05:07:31', '2024-11-20 22:44:45', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 2, 89231, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(128, 'wr5qmeg0f6', 1, 5, 'Raina Kusmawati', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 05:07:31', '2024-11-20 22:44:45', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 4, 42819, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(129, 'wdbanaxukl', 5, 5, 'Padmi Prastuti S.E.I', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 05:07:31', '2024-11-20 22:44:45', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 9, 75468, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(130, '6rmfdbh1jo', 5, 5, 'Johan Maryadi', NULL, '6281230103784', '6281230103784', 'online', 'ambil sendiri', 0, 2000, '2024-11-20 03:33:39', NULL, '2024-11-24 05:07:31', '2024-11-20 22:44:45', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 8, 99137, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(131, 'mhnugaxlzu', 2, NULL, 'Jabal Salahudin S.E.', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-25 04:19:16', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 22629, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(132, 'qs2mt0q1qb', 3, NULL, 'Shakila Ina Andriani M.Farm', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-25 04:19:16', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 7, 48949, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(133, 'okm7urypw6', 1, NULL, 'Niyaga Utama', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-22 06:57:24', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 7, 25905, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(134, 'mg48xdtfvg', 3, NULL, 'Naradi Adriansyah', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-22 06:57:24', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 5, 25174, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(135, 'hudspr0kab', 1, NULL, 'Bakda Najmudin', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-22 06:57:24', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 3, 47973, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(136, '8gmzytkqka', 1, NULL, 'Jumari Nababan', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 15:15:03', '2024-11-26 04:59:31', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 4, 70993, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(137, 'xzrxrg4feb', 5, NULL, 'Dian Agustina', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 15:15:03', '2024-11-26 04:59:31', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 3, 18663, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(138, 'a36fp8f39j', 2, NULL, 'Fathonah Yulianti', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 15:15:03', '2024-11-26 04:59:31', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 78881, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(139, 'jd6rewvubr', 1, NULL, 'Michelle Yolanda', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 15:15:03', '2024-11-26 04:59:31', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 9, 79780, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(140, 'tgalcermp9', 2, NULL, 'Mutia Wahyuni', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 20:03:51', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 4, 97720, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(141, 'tyar79xgvw', 3, NULL, 'Chelsea Jane Mandasari', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 20:03:51', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 6, 13759, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(142, 'sreazwluww', 1, NULL, 'Violet Mandasari', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 20:03:51', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 4, 68590, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(143, 'hlvv2kvdxp', 3, NULL, 'Lanang Prabowo', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-24 02:34:28', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 8, 86905, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(144, 'auadhn6dtp', 1, NULL, 'Eka Kezia Safitri', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-24 02:34:28', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 7, 64364, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(145, 'd8emx3nggu', 5, NULL, 'Ina Riyanti', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-24 02:34:28', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 2, 57713, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(146, 'w0nxsc5cia', 4, NULL, 'Lintang Susanti', NULL, '62895706077200', '62895706077200', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-24 02:34:28', NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 16867, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(147, 'vz3jqpxzqh', 3, NULL, 'Surya Maheswara', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-20 19:37:13', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 10, 23681, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(148, 'jfxwdvwcjo', 3, NULL, 'Hana Widya Widiastuti S.Pt', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-20 19:37:13', NULL, NULL, 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 3, 14862, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(149, '9vvilxo6cv', 5, NULL, 'Rahmi Pertiwi', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 03:52:02', '2024-11-21 14:23:50', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 2, 26276, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(150, '4lll8wgsrv', 2, NULL, 'Laras Pertiwi', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 03:52:02', '2024-11-21 14:23:50', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 9, 90712, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(151, 'jsh3agjrg0', 1, NULL, 'Natalia Wulandari', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 03:52:02', '2024-11-21 14:23:50', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 5, 33533, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(152, 'or5kd4uqup', 2, NULL, 'Gatra Nasrullah Kusumo', NULL, '62895706077200', '62895706077200', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 03:52:02', '2024-11-21 14:23:50', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', 7, 95698, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(153, 'b4fhtkoxfp', 3, NULL, 'Janet Qori Lestari', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-23 05:03:05', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 4, 82284, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(154, 'mqvkblwsxt', 1, NULL, 'Tina Hastuti', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-23 05:03:05', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 8, 83239, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(155, 'es4ignxvnd', 5, NULL, 'Zaenab Maryati', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 16:11:24', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 9, 17671, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(156, 'r9hzvyopnn', 2, NULL, 'Nova Vanya Permata', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 16:11:24', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 2, 27008, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39');
INSERT INTO `cucian` (`id`, `no_order`, `kategori_id`, `user_id`, `atas_nama`, `snap_token`, `no_telp`, `no_wa`, `jenis_order`, `jenis_ambil`, `ongkir_antar`, `ongkir_jemput`, `wkt_order`, `estimasi`, `wkt_selesai`, `wkt_diambil`, `alamat_antar`, `berat`, `total_harga`, `status_cucian`, `status_bayar`, `created_at`, `updated_at`) VALUES
(157, 'ea3zrfrm94', 3, NULL, 'Halima Bella Namaga', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 16:11:24', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 8, 29854, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(158, 'usxwvctygm', 4, NULL, 'Gatot Eka Adriansyah', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 10:44:17', '2024-11-23 06:12:02', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 10, 48225, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(159, 'znkoolrflz', 2, NULL, 'Rachel Andriani', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 10:44:17', '2024-11-23 06:12:02', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 8, 42511, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(160, 'xh4wcmogqf', 5, NULL, 'Cemplunk Damanik', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 10:44:17', '2024-11-23 06:12:02', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 5, 72398, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(161, '87vssgykz5', 1, NULL, 'Diana Uyainah', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 10:44:17', '2024-11-23 06:12:02', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 8, 33724, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(162, 'h3rsljndaq', 1, NULL, 'Capa Nugraha Sihombing S.Ked', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 22:49:53', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 4, 22302, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(163, 'eyvxixp9cs', 5, NULL, 'Nalar Jayeng Mustofa', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 22:49:53', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 5, 92164, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(164, 'ixvt70prwj', 5, NULL, 'Mutia Yolanda S.Kom', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 22:49:53', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 2, 65750, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(165, '5bjjsmsgxk', 5, NULL, 'Puji Hartati M.Ak', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 06:10:16', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 3, 18804, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(166, 'xztt5eebre', 4, NULL, 'Paiman Narpati', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 06:10:16', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 2, 74571, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(167, 'ftfsvmvp8h', 2, NULL, 'Sakti Habibi', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 06:10:16', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 5, 22589, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(168, 'qpxx151trg', 5, NULL, 'Iriana Nadine Uyainah', NULL, '6281323135707', '6281323135707', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 06:10:16', NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 1, 35932, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(169, 'uieyebxanp', 5, NULL, 'Ratih Pia Astuti', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-25 10:44:40', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 4, 36788, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(170, '1ws71qytbx', 5, NULL, 'Mursinin Januar', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-25 10:44:40', NULL, NULL, 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 8, 49941, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(171, 't3amvjptqi', 5, NULL, 'Argono Suryono S.Kom', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 14:12:14', '2024-11-26 10:09:05', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 6, 65346, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(172, 'salqokjawv', 2, NULL, 'Maida Hariyah S.Psi', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 14:12:14', '2024-11-26 10:09:05', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 2, 45322, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(173, 'pjo2b2vfgp', 4, NULL, 'Asman Tamba', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 14:12:14', '2024-11-26 10:09:05', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 6, 44815, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(174, 'javeem1yct', 5, NULL, 'Paris Farida', NULL, '6281323135707', '6281323135707', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 14:12:14', '2024-11-26 10:09:05', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', 6, 72039, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(175, 'wxz3oezjyp', 4, NULL, 'Zulaikha Lailasari S.Farm', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-21 10:57:02', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 1, 23362, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(176, '5szn1rrnmj', 4, NULL, 'Tania Laksita', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-21 10:57:02', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 5, 25312, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(177, '0pxxeqtx6d', 4, NULL, 'Cawisadi Sihombing S.Psi', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-25 13:36:44', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 10, 41592, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(178, 'pm5fkh3zqk', 1, NULL, 'Martani Halim', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-25 13:36:44', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 4, 87019, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(179, 'vnthwpyqcd', 2, NULL, 'Marsudi Cakrawala Mahendra S.Farm', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-25 13:36:44', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 5, 99517, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(180, '7njokhaysy', 4, NULL, 'Warsita Halim', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 11:56:47', '2024-11-24 23:46:37', 'Jln. Warga No. 259, Jambi 59410, Lampung', 4, 68417, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(181, 'zijj5s0pur', 1, NULL, 'Ivan Maheswara', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 11:56:47', '2024-11-24 23:46:37', 'Jln. Warga No. 259, Jambi 59410, Lampung', 3, 48246, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(182, 'tkzjcui2zi', 2, NULL, 'Genta Riyanti', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 11:56:47', '2024-11-24 23:46:37', 'Jln. Warga No. 259, Jambi 59410, Lampung', 7, 28143, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(183, 'm5dpomam51', 1, NULL, 'Jaeman Raditya Irawan', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 11:56:47', '2024-11-24 23:46:37', 'Jln. Warga No. 259, Jambi 59410, Lampung', 6, 81017, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(184, 'ejmvds0ahv', 3, NULL, 'Ida Cici Permata', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 19:58:24', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 4, 99698, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(185, 'dckl9oilmg', 4, NULL, 'Wulan Laksita', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 19:58:24', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 4, 48224, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(186, '6yi7sctshg', 3, NULL, 'Tiara Aisyah Yuliarti S.T.', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 19:58:24', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 5, 79306, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(187, 'anmuquykzh', 5, NULL, 'Cinthia Lailasari', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 05:30:38', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 2, 89697, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(188, 'ap0zai3den', 5, NULL, 'Queen Zulaika S.Farm', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 05:30:38', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 2, 87391, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(189, 'kpernm3ckz', 5, NULL, 'Adiarja Sihotang', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 05:30:38', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 7, 69832, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(190, 'ba6s5sgrrv', 1, NULL, 'Silvia Calista Sudiati', NULL, '6287881823267', '6287881823267', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 05:30:38', NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 2, 86844, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(191, 'znxj7ycoh2', 5, NULL, 'Johan Tamba', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-21 18:36:07', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 10, 77527, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(192, 'dwuwmsicsl', 5, NULL, 'Juli Yolanda', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-21 18:36:07', NULL, NULL, 'Jln. Warga No. 259, Jambi 59410, Lampung', 2, 73689, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(193, 'fm1zkpwtlk', 2, NULL, 'Hardi Setiawan', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 02:32:39', '2024-11-20 16:40:08', 'Jln. Warga No. 259, Jambi 59410, Lampung', 7, 30966, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(194, 'be6jcclohp', 4, NULL, 'Rahmi Uyainah', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 02:32:39', '2024-11-20 16:40:08', 'Jln. Warga No. 259, Jambi 59410, Lampung', 7, 99584, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(195, 'zcwven1cst', 4, NULL, 'Prasetyo Maheswara', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 02:32:39', '2024-11-20 16:40:08', 'Jln. Warga No. 259, Jambi 59410, Lampung', 10, 95211, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(196, 'egok95w6jt', 5, NULL, 'Samiah Padmasari', NULL, '6287881823267', '6287881823267', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 02:32:39', '2024-11-20 16:40:08', 'Jln. Warga No. 259, Jambi 59410, Lampung', 2, 26183, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(197, 'jnskzhyuoa', 5, NULL, 'Jamil Widodo S.I.Kom', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 21:32:21', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 52522, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(198, 'kur2rxofif', 5, NULL, 'Tania Mandasari S.T.', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 21:32:21', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 8, 47827, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(199, 'gj4iqd670o', 1, NULL, 'Anggabaya Sitorus', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 21:37:15', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 45207, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(200, 'dwwcgbw5j1', 2, NULL, 'Maman Adriansyah', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 21:37:15', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 4, 81604, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(201, 'j7vhs3qfpj', 3, NULL, 'Warsita Firmansyah M.Pd', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-20 21:37:15', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 8, 29410, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(202, 'ws4ucuhgln', 3, NULL, 'Tira Kuswandari', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 10:32:18', '2024-11-20 20:33:24', 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 69141, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(203, 'rkzjota4cz', 3, NULL, 'Ana Farida', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 10:32:18', '2024-11-20 20:33:24', 'Gg. Bakin No. 269, Madiun 34546, DIY', 10, 47397, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(204, 'hfos43bboo', 1, NULL, 'Maya Sudiati', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 10:32:18', '2024-11-20 20:33:24', 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 69135, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(205, 'rxopkgatjw', 1, NULL, 'Ade Dimaz Budiman', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-25 10:32:18', '2024-11-20 20:33:24', 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 20906, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(206, 'out9hbf3rw', 2, NULL, 'Paris Aryani M.Kom.', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 09:15:48', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 54084, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(207, '6g4vrwsqiv', 1, NULL, 'Sabri Martana Budiman S.H.', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 09:15:48', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 6, 55821, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(208, 'kptyowqlul', 4, NULL, 'Narji Kusumo', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-22 09:15:48', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 9, 71491, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(209, 'bukbw1bkg9', 5, NULL, 'Kania Kuswandari', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 11:41:45', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 4, 98685, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(210, 'slcyfqawkv', 1, NULL, 'Cakrajiya Wacana', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 11:41:45', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 9, 31152, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(211, 'v4vhavshqs', 1, NULL, 'Soleh Tampubolon S.H.', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 11:41:45', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 5, 36111, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(212, 'oxxth3ylgt', 1, NULL, 'Oni Mandasari S.Ked', NULL, '6281279715551', '6281279715551', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 11:41:45', NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 91869, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(213, 'ynga9koyic', 5, NULL, 'Edison Pradipta S.Ked', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-21 09:13:08', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 10, 62793, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(214, 'h3dvwmlssp', 3, NULL, 'Prasetyo Mansur', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-21 09:13:08', NULL, NULL, 'Gg. Bakin No. 269, Madiun 34546, DIY', 3, 53954, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(215, 'gmldsudsnt', 1, NULL, 'Makuta Hutagalung', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-20 16:39:23', '2024-11-21 05:11:11', 'Gg. Bakin No. 269, Madiun 34546, DIY', 8, 91783, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(216, 'w6ggvgudlh', 4, NULL, 'Julia Usamah', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-20 16:39:23', '2024-11-21 05:11:11', 'Gg. Bakin No. 269, Madiun 34546, DIY', 9, 95739, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(217, 'ekqpighll4', 5, NULL, 'Diah Cinthia Prastuti S.I.Kom', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-20 16:39:23', '2024-11-21 05:11:11', 'Gg. Bakin No. 269, Madiun 34546, DIY', 1, 51126, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(218, 'iwu0ihbdly', 1, NULL, 'Nova Dian Rahmawati S.T.', NULL, '6281279715551', '6281279715551', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-20 16:39:23', '2024-11-21 05:11:11', 'Gg. Bakin No. 269, Madiun 34546, DIY', 7, 67180, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(219, 'ikqgufamci', 2, NULL, 'Kayun Galih Tamba S.IP', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-24 17:04:05', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 3, 74636, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(220, 'nbssijbt7j', 1, NULL, 'Imam Habibi', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-24 17:04:05', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 3, 56658, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(221, 'otjjegwcus', 5, NULL, 'Liman Jono Mahendra', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-21 04:02:20', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 4, 46090, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(222, 'qozzkpin5c', 1, NULL, 'Cawuk Parman Santoso', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-21 04:02:20', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 8, 71196, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(223, 'zan1d5lmo9', 3, NULL, 'Bahuwirya Mahendra M.Ak', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', '2024-11-21 04:02:20', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 1, 61375, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(224, 'ofaalljxn0', 4, NULL, 'Waluyo Sitorus', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 02:13:40', '2024-11-23 16:19:27', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 4, 25975, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(225, 'y28o66xytd', 4, NULL, 'Hardana Natsir S.H.', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 02:13:40', '2024-11-23 16:19:27', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 7, 11815, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(226, '3qfj0tewhm', 3, NULL, 'Prabu Pangeran Saefullah S.IP', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 02:13:40', '2024-11-23 16:19:27', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 7, 82486, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(227, 'etyhutslie', 1, NULL, 'Galiono Candrakanta Tampubolon S.Psi', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 2000, 0, '2024-11-20 03:33:39', NULL, '2024-11-21 02:13:40', '2024-11-23 16:19:27', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 3, 37664, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(228, 'uikxaxnydk', 5, NULL, 'Cornelia Padmasari', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 08:55:56', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 9, 14227, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(229, 'hlknzkq1yf', 1, NULL, 'Opan Megantara', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 08:55:56', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 3, 73282, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(230, 'tiat8tsrfo', 4, NULL, 'Nugraha Adhiarja Sinaga', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-23 08:55:56', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 7, 64557, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(231, '8yu8gj1iyf', 1, NULL, 'Darimin Lantar Dabukke S.IP', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 19:19:44', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 4, 45275, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(232, '9erzefhreh', 1, NULL, 'Jagaraga Sitorus S.Farm', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 19:19:44', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 7, 78839, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(233, 'lcr8oxhapg', 2, NULL, 'Mutia Usada S.IP', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 19:19:44', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 1, 52918, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(234, '1657vogpnx', 2, NULL, 'Raditya Lurhur Januar M.TI.', NULL, '6281230103784', '6281230103784', 'offline', 'diantar', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 19:19:44', NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 3, 66581, 'selesai', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(235, 'gb6g5zvxid', 2, NULL, 'Emong Saptono', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-21 15:34:28', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 7, 79910, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(236, 'xraiiw3jmm', 1, NULL, 'Gadang Pangestu', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', '2024-11-21 15:34:28', NULL, NULL, 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 8, 29325, 'diproses', 'belum dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(237, 'wlrwm1xxzr', 5, NULL, 'Warta Halim Maulana', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 10:26:07', '2024-11-25 21:57:01', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 3, 84427, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(238, 'gz2uagqkuj', 1, NULL, 'Rahayu Safitri S.T.', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 10:26:07', '2024-11-25 21:57:01', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 9, 23674, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(239, 'ecd3xhyunw', 5, NULL, 'Daruna Widodo', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 10:26:07', '2024-11-25 21:57:01', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 10, 40469, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39'),
(240, '0w7xiutdus', 3, NULL, 'Hafshah Sudiati M.M.', NULL, '6281230103784', '6281230103784', 'offline', 'ambil sendiri', 0, 0, '2024-11-20 03:33:39', NULL, '2024-11-26 10:26:07', '2024-11-25 21:57:01', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', 9, 78259, 'diambil', 'dibayar', '2024-11-20 03:33:39', '2024-11-20 03:33:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `estimasi_hari` int(11) NOT NULL,
  `harga` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `estimasi_hari`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'CUCI KERING SETRIKA HEMAT', 4, 3000, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(2, 'CUCI KERING SETRIKA REGULER', 3, 4500, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(3, 'CUCI KERING SETRIKA EXPRESS', 1, 10000, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(4, 'CUCI KERING SPREI', 3, 10000, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(5, 'CUCI KERING SELIMUT', 3, 12000, '2024-11-20 03:33:38', '2024-11-20 03:33:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '2024_05_17_015904_create_cucian_table', 1),
(3, '2024_05_17_020123_create_kategori_table', 1),
(4, '2024_05_17_020146_create_pembelian_table', 1),
(5, '2024_06_20_023012_relation', 1),
(6, '2024_06_23_104211_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_beli` varchar(10) NOT NULL,
  `wkt_beli` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jenis_bahan` enum('detergen','pewangi','pelembut','pemutih') NOT NULL,
  `merk` varchar(255) NOT NULL,
  `jumlah_beli` double NOT NULL,
  `total_harga` double NOT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id`, `kode_beli`, `wkt_beli`, `jenis_bahan`, `merk`, `jumlah_beli`, `total_harga`, `bukti`, `created_at`, `updated_at`) VALUES
(1, 'xtnwyscelt', '2024-11-20 03:17:38', 'pewangi', 'Fa Namaga', 49, 4436223, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(2, 'lz8ieduphh', '2024-11-20 02:45:38', 'pelembut', 'Fa Pratama Pradana (Persero) Tbk', 70, 2451976, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(3, '15rx343jka', '2024-11-20 03:25:38', 'pewangi', 'Perum Novitasari Suartini', 48, 1991868, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(4, 'qvizrn5v91', '2024-11-20 03:07:38', 'pelembut', 'PT Dongoran Tampubolon', 59, 6391489, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(5, 'gxvcdipfhj', '2024-11-20 03:11:38', 'pewangi', 'UD Damanik Astuti Tbk', 65, 3087182, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(6, 'qqrlhnny6i', '2024-11-20 03:32:38', 'pewangi', 'PD Yulianti (Persero) Tbk', 70, 9457515, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(7, 'd3n6xuuiur', '2024-11-20 03:28:38', 'pewangi', 'UD Sudiati', 65, 5432954, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(8, 'jq9tbozx0g', '2024-11-20 03:28:38', 'pelembut', 'Yayasan Fujiati Susanti Tbk', 11, 8258874, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(9, 'sewthj7oed', '2024-11-20 02:58:38', 'pelembut', 'PJ Wahyuni', 29, 7474320, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(10, 'oi8i0ek9gn', '2024-11-20 03:00:38', 'pelembut', 'PD Mulyani Tbk', 25, 1357048, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(11, 'tkebioe4pl', '2024-11-20 02:58:38', 'pewangi', 'PJ Pudjiastuti Pangestu', 39, 5670877, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(12, 'bv309c3wkp', '2024-11-20 02:38:38', 'pewangi', 'PD Utami', 47, 5632939, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(13, 'eycrpajhmm', '2024-11-20 02:46:38', 'pelembut', 'UD Nugroho (Persero) Tbk', 83, 2798634, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(14, 'soh7jxu7jy', '2024-11-20 02:54:38', 'pewangi', 'Fa Astuti', 26, 2834968, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(15, 'lsxhj6vezs', '2024-11-20 02:45:38', 'detergen', 'PJ Mulyani (Persero) Tbk', 90, 185887, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(16, 'habgsslfvc', '2024-11-20 03:23:38', 'pewangi', 'Fa Maheswara Mansur (Persero) Tbk', 13, 3438041, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(17, 'kurmr4i2jz', '2024-11-20 02:48:38', 'detergen', 'PT Riyanti Tbk', 87, 3788599, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(18, 'jv5slu8ygz', '2024-11-20 02:41:38', 'pewangi', 'PJ Padmasari Riyanti Tbk', 55, 5725317, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(19, 'ayvj6rzkni', '2024-11-20 03:18:38', 'pelembut', 'Yayasan Situmorang Tbk', 96, 8370297, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(20, 'd5kbmv1ruh', '2024-11-20 03:26:38', 'pemutih', 'UD Suryatmi Tbk', 94, 2972021, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(21, 'ti9sahdik7', '2024-11-20 03:22:38', 'pemutih', 'PD Prakasa Gunarto Tbk', 91, 4918753, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(22, 'bkfgrvzdeg', '2024-11-20 03:06:38', 'pelembut', 'Fa Lazuardi Susanti Tbk', 42, 3912108, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(23, '2iyjnlfahx', '2024-11-20 02:38:38', 'pemutih', 'Perum Nuraini Tbk', 29, 8039701, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(24, 'iflmhvtshv', '2024-11-20 03:18:38', 'detergen', 'Fa Hasanah', 98, 3120752, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(25, 'gxv8nstmjo', '2024-11-20 03:31:38', 'pemutih', 'CV Suryatmi Mardhiyah (Persero) Tbk', 77, 8475352, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(26, 'attn6w0ulh', '2024-11-20 02:44:38', 'pewangi', 'CV Tamba Mandasari Tbk', 30, 5511678, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(27, 'zedsdlljtt', '2024-11-20 02:59:38', 'pewangi', 'PJ Prayoga Wijayanti (Persero) Tbk', 14, 8743965, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(28, 'q2qcexkqr3', '2024-11-20 03:09:38', 'pelembut', 'Fa Hidayanto', 49, 1306446, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(29, 'poejvxa50e', '2024-11-20 03:25:38', 'detergen', 'Perum Setiawan Puspasari Tbk', 32, 1651548, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(30, 'ghrikmeo2b', '2024-11-20 02:38:38', 'pewangi', 'Fa Saptono (Persero) Tbk', 16, 8063076, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(31, 'zqz9brxk0u', '2024-11-20 03:27:38', 'detergen', 'PT Agustina', 95, 1795046, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(32, 'fuske4qb6g', '2024-11-20 03:03:38', 'pelembut', 'PT Mandasari Nuraini', 58, 6786689, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(33, 'yeconpzvjd', '2024-11-20 03:08:38', 'pewangi', 'PD Rahayu', 84, 7302750, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(34, 'eurjqtxbqc', '2024-11-20 03:08:38', 'pelembut', 'Fa Padmasari Sihombing', 53, 4651220, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(35, 'b8aorz3qnd', '2024-11-20 03:07:38', 'pewangi', 'CV Kusumo Wacana', 65, 3096638, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(36, '0zmrrabgap', '2024-11-20 03:25:38', 'pelembut', 'Fa Agustina (Persero) Tbk', 97, 5793521, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(37, 'rlpsaxup3h', '2024-11-20 02:55:38', 'pemutih', 'UD Rahimah Tbk', 57, 3095166, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(38, '6p9lrnl7qn', '2024-11-20 03:20:38', 'pewangi', 'Yayasan Riyanti (Persero) Tbk', 10, 9661190, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(39, 'zoyc7ae1uo', '2024-11-20 03:20:38', 'pelembut', 'Perum Mayasari', 65, 1778214, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(40, '00cu5pxf7l', '2024-11-20 02:49:38', 'pelembut', 'PT Suryatmi Irawan', 47, 3472496, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(41, 'doghct9npm', '2024-11-20 03:10:38', 'pewangi', 'PT Firmansyah Tbk', 16, 7756950, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(42, 'stazfu314p', '2024-11-20 02:49:38', 'pewangi', 'PT Pradipta', 42, 1728928, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(43, 'ufvs8tbi0b', '2024-11-20 03:14:38', 'pewangi', 'PJ Palastri', 82, 7823614, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(44, 'yzjgsnswtz', '2024-11-20 03:07:38', 'detergen', 'PT Marbun (Persero) Tbk', 79, 6343168, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(45, 'd2txd4zkua', '2024-11-20 03:20:38', 'pelembut', 'PJ Lazuardi Wahyudin (Persero) Tbk', 65, 2994403, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(46, 'nnbjy3kkpt', '2024-11-20 02:47:38', 'detergen', 'PJ Agustina', 46, 1204259, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(47, 'cwikoyeeut', '2024-11-20 03:24:38', 'detergen', 'Perum Kuswoyo', 27, 3362117, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(48, 'fmku1i2hp1', '2024-11-20 02:41:38', 'pewangi', 'Perum Simbolon Dabukke Tbk', 98, 8005509, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(49, '3suk6zupsp', '2024-11-20 03:26:38', 'pelembut', 'Yayasan Prakasa', 87, 834817, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(50, 'h8hoqs3rti', '2024-11-20 03:30:38', 'detergen', 'PT Namaga Hariyah', 23, 9874676, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(51, 'zscvtlkujv', '2024-11-20 02:40:38', 'pewangi', 'PD Irawan', 65, 3600281, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(52, 'f4capotuqb', '2024-11-20 03:26:38', 'pewangi', 'PJ Zulkarnain Widodo', 27, 4409777, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(53, 'rqsaepc5qm', '2024-11-20 03:32:38', 'pewangi', 'Fa Yolanda Fujiati (Persero) Tbk', 52, 6552013, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(54, '1jy5gibcp4', '2024-11-20 03:02:38', 'detergen', 'PD Agustina Ramadan Tbk', 66, 1846225, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(55, 'gxmsddqmnp', '2024-11-20 03:14:38', 'detergen', 'Perum Hidayanto Wahyudin (Persero) Tbk', 47, 7668062, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(56, 'wdbcfmrtlz', '2024-11-20 03:14:38', 'pemutih', 'Perum Ramadan Haryanti Tbk', 82, 9737003, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(57, 'ctaftfk6vs', '2024-11-20 03:26:38', 'pemutih', 'CV Siregar Gunarto (Persero) Tbk', 17, 1213586, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(58, 'b4sx5eowx4', '2024-11-20 03:14:38', 'detergen', 'PJ Pranowo Tbk', 79, 2698100, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(59, 'vdwap74pwg', '2024-11-20 02:57:38', 'pemutih', 'UD Wijaya', 7, 2990075, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(60, 'cs7iyakyif', '2024-11-20 03:09:38', 'pemutih', 'Yayasan Mangunsong', 18, 5088953, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(61, 'umosmfjzgf', '2024-11-20 03:10:38', 'pemutih', 'PJ Purnawati', 58, 1077065, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(62, 'hh9snti7fy', '2024-11-20 03:30:38', 'detergen', 'Perum Utami', 25, 4698546, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(63, 'tuopffmuq2', '2024-11-20 03:08:38', 'pemutih', 'CV Uyainah', 15, 5055017, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(64, 'yygcrcwxnh', '2024-11-20 03:30:38', 'pewangi', 'PD Maryati Prasetya', 81, 7017955, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(65, 'floelsbuwc', '2024-11-20 03:08:38', 'pelembut', 'Fa Kuswandari Pradana (Persero) Tbk', 41, 6066354, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(66, 'zts3ggqadf', '2024-11-20 02:56:38', 'detergen', 'Perum Pradipta Saputra', 15, 9887709, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(67, 'y6gd16jbqh', '2024-11-20 03:06:38', 'pelembut', 'CV Waskita', 55, 9334677, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(68, 'lavykvpshe', '2024-11-20 03:23:38', 'pemutih', 'Fa Jailani (Persero) Tbk', 54, 6558025, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(69, '4ljwb0yjbn', '2024-11-20 03:08:38', 'pelembut', 'PD Hutapea', 57, 5192306, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(70, 'tcallibrvt', '2024-11-20 03:07:38', 'detergen', 'PJ Yuliarti', 49, 3564244, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(71, '7bv2d5vv1z', '2024-11-20 02:39:38', 'detergen', 'PD Mulyani Hassanah (Persero) Tbk', 6, 1603470, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(72, 'iphsoo4qoq', '2024-11-20 02:45:38', 'pewangi', 'Yayasan Prasetyo Setiawan', 35, 5439328, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(73, '5sy9yr67xp', '2024-11-20 02:41:38', 'pemutih', 'Fa Santoso Narpati', 46, 1719413, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(74, 'cjqcp9inno', '2024-11-20 02:50:38', 'pemutih', 'PJ Prastuti Mahendra (Persero) Tbk', 53, 168378, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(75, 'xl3v8ouhxn', '2024-11-20 02:46:38', 'pelembut', 'Fa Saptono Tbk', 90, 6591944, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(76, 'xnutpyazrl', '2024-11-20 03:16:38', 'pewangi', 'Perum Prakasa Marbun', 89, 9948715, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(77, 'tviki9rlme', '2024-11-20 03:17:38', 'pelembut', 'PJ Ramadan Simbolon', 44, 5932583, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(78, 'matbfcdvo3', '2024-11-20 02:55:38', 'pewangi', 'PD Usada Nasyidah', 67, 9235406, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(79, 'zl5mdpq0lr', '2024-11-20 02:42:38', 'detergen', 'CV Zulkarnain Wasita', 38, 970761, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(80, 'nlpnnx1222', '2024-11-20 03:15:38', 'pemutih', 'PD Iswahyudi Gunarto Tbk', 76, 8463888, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(81, 'edwvyavnpb', '2024-11-20 03:17:38', 'pewangi', 'UD Aryani (Persero) Tbk', 15, 1117611, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(82, 'gwht37dipz', '2024-11-20 03:19:38', 'pewangi', 'Perum Uyainah (Persero) Tbk', 24, 6966625, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(83, 'mxxidktuzc', '2024-11-20 03:18:38', 'pelembut', 'PD Fujiati Permadi', 36, 9171031, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(84, 'jrzr6drcu2', '2024-11-20 03:30:38', 'pewangi', 'UD Wasita Wulandari (Persero) Tbk', 31, 9683737, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(85, 'lxumqtezzk', '2024-11-20 02:44:38', 'pelembut', 'Yayasan Prasasta Mangunsong', 56, 6982548, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(86, 'tnxd5lcywv', '2024-11-20 03:25:38', 'pemutih', 'PJ Dabukke Tbk', 69, 6823751, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(87, 'dfy9khgepw', '2024-11-20 03:17:38', 'pewangi', 'PT Yuniar Marpaung (Persero) Tbk', 21, 7360849, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(88, 'bmmhqvfwra', '2024-11-20 02:56:38', 'detergen', 'PT Marpaung (Persero) Tbk', 67, 3336167, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(89, 'vj9cd5ohqt', '2024-11-20 02:57:38', 'pewangi', 'Yayasan Najmudin Prastuti', 8, 447655, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(90, '88wsgk2vnw', '2024-11-20 02:58:38', 'pelembut', 'Fa Saragih', 64, 6326378, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(91, 'dw6tofjidz', '2024-11-20 03:15:38', 'pemutih', 'PJ Prasetyo Tbk', 25, 6478275, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(92, 'pcxtltzh7w', '2024-11-20 03:13:38', 'pelembut', 'PJ Salahudin', 81, 8256311, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(93, 'hb25tscup6', '2024-11-20 02:40:38', 'pemutih', 'PD Prasetya', 37, 3843856, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(94, 'miuxrw5ice', '2024-11-20 03:32:38', 'pewangi', 'PD Jailani Tbk', 67, 5984835, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(95, '30ninrpw3l', '2024-11-20 03:16:38', 'pewangi', 'UD Tamba Riyanti', 43, 9477680, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(96, '6k8kvdjx6s', '2024-11-20 02:47:38', 'pewangi', 'PD Pudjiastuti', 58, 4891550, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(97, 'dpnvasmrrj', '2024-11-20 03:17:38', 'pemutih', 'Fa Namaga', 78, 5999263, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(98, 'n511hkat98', '2024-11-20 02:41:38', 'detergen', 'UD Siregar Winarsih', 89, 2938480, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(99, 'ekmhnbxh3x', '2024-11-20 03:00:38', 'pemutih', 'UD Wasita Tbk', 62, 8359770, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(100, 'tyfs9cocto', '2024-11-20 03:28:38', 'detergen', 'PJ Lailasari Rahimah Tbk', 24, 9210199, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('admin','pelanggan') NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `no_wa` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `nama`, `password`, `no_telp`, `no_wa`, `alamat`, `img`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'pelanggan', 'alvin@gmail.com', 'Achmad Alvin Ardiansyah', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '62895706077200', '62895706077200', 'Ds. Kyai Gede No. 848, Lhokseumawe 92730, Sulut', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(2, 'pelanggan', 'tufel@gmail.com', 'Ahmad Thufail', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '6281323135707', '6281323135707', 'Jln. Abdul Muis No. 266, Administrasi Jakarta Pusat 79681, Sulut', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(3, 'pelanggan', 'daffa@gmail.com', 'Daffa Cesario SafiI', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '6287881823267', '6287881823267', 'Jln. Warga No. 259, Jambi 59410, Lampung', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(4, 'pelanggan', 'fatur@gmail.com', 'Faturrahman Ardiansyah', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '6281279715551', '6281279715551', 'Gg. Bakin No. 269, Madiun 34546, DIY', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(5, 'pelanggan', 'yahya@gmail.com', 'Muhammad Ilham Yahya', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '6281230103784', '6281230103784', 'Jln. Nakula No. 778, Sawahlunto 64798, Sulbar', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(6, 'admin', 'jokowi@gmail.com', 'Joko Widodo', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '024 0784 379', '0858 261 667', 'Gg. Gambang No. 223, Pekanbaru 85021, Sulbar', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(7, 'admin', 'prabowo@gmail.com', 'Prabowo Subianto', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '(+62) 305 1261 151', '0983 6362 9621', 'Ds. Raya Setiabudhi No. 188, Probolinggo 47910, Kalbar', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38'),
(8, 'admin', 'anies@gmail.com', 'Anies Baswedan', '$2y$12$mAtMXSvkR5rLu/Jac/jYi.og2xlv3PyzGD8Mss/7lYo/WmitCFSBm', '0811 1520 9185', '0580 2981 220', 'Gg. Kebangkitan Nasional No. 353, Cimahi 39852, Maluku', NULL, NULL, '2024-11-20 03:33:38', '2024-11-20 03:33:38');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cucian`
--
ALTER TABLE `cucian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cucian_user_id_foreign` (`user_id`),
  ADD KEY `cucian_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cucian`
--
ALTER TABLE `cucian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cucian`
--
ALTER TABLE `cucian`
  ADD CONSTRAINT `cucian_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cucian_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
