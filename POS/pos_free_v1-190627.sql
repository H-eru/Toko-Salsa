-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2019 at 04:57 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_free_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kdbrg` varchar(50) NOT NULL,
  `nmbrg` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kdbrg`, `nmbrg`, `harga`, `stock`, `tanggal`, `category_id`, `id_satuan`) VALUES
(5, 'ZAM01', 'ZAM ZAM', 600000, 18, '2019-06-18 18:14:19', 31, 2),
(7, 'KRM005', 'Kurma 1', 200000, 18, '2019-06-18 20:05:56', 23, 1),
(8, '0889988', 'AIR MINERAL', 400000, 100, '2019-06-24 17:47:54', 31, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(250) DEFAULT NULL,
  `category_status` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`) VALUES
(23, 'Makanan', 'Y'),
(31, 'Minuman', 'Y'),
(32, 'Aksesoris', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(5) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `alamat_pembeli` text NOT NULL,
  `kelurahan` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabkot` varchar(50) NOT NULL,
  `prov` varchar(50) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_pembeli`, `alamat_pembeli`, `kelurahan`, `kecamatan`, `kabkot`, `prov`, `no_telepon`, `tanggal`) VALUES
(1, 'teguh dumadi', 'Jalan Lettunapis 01/rw', 'Sudimara Timur', 'ciledug', 'Tangerang', 'Banten', '081286115887', '2019-06-26 21:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `ekspedisi`
--

CREATE TABLE `ekspedisi` (
  `id_ekspedisi` int(5) NOT NULL,
  `nmekspedisi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ekspedisi`
--

INSERT INTO `ekspedisi` (`id_ekspedisi`, `nmekspedisi`) VALUES
(3, 'JNT'),
(4, 'TIKI'),
(5, 'JNE');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_session` varchar(100) NOT NULL,
  `tgl_keranjang` date NOT NULL,
  `jam_keranjang` text NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id_orders` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `product_id` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order` datetime NOT NULL,
  `jam_order` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_telepon`
--

CREATE TABLE `order_telepon` (
  `id_orders` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `product_id` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_ekspedisi` int(5) NOT NULL,
  `bank` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `tgl_order` datetime NOT NULL,
  `jam_order` time NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(5) NOT NULL,
  `nmsatuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nmsatuan`) VALUES
(1, 'KG'),
(2, 'Liter'),
(3, 'PCS');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `user_foto` text,
  `user_name` varchar(255) DEFAULT NULL,
  `user_username` varchar(40) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_level` varchar(200) NOT NULL,
  `user_create_date` datetime DEFAULT NULL,
  `user_status` enum('N','Y') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_foto`, `user_name`, `user_username`, `user_password`, `user_level`, `user_create_date`, `user_status`) VALUES
(43, '3100620919download aplikasi pos web denangan booststrap.jpg', 'Nisa Istifadah', 'admin', '$2y$10$DlmbzphG8R0/jKJS5mzS5e.NvitZtMRnaDeCcVHN8q1NbyN3m3V/C', 'super admin', '2017-09-19 07:35:34', 'Y'),
(44, '2831885844download aplikasi pos berbasis web.jpg', 'Aliqa  Aâ€™yunina', 'aliqa', '$2y$10$Gukorg8JuLhU6HFt.t40lecEDiz19rqWUe2EDcHd6Vn1xETb5Eqdu', 'admin', '2017-09-19 07:43:31', 'Y'),
(46, '1275021613download aplikasi pos web dengan php dan mysql.jpg', 'Rosita Hima', 'rosita', '$2y$10$4QVVpa0wi1aPvFLt6uSgwefkn3wfQUp4JQPWv9p.o88RNmRWg4fjW', 'kasir', '2017-10-11 10:29:12', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kdbrg` (`kdbrg`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `tanggal` (`tanggal`),
  ADD KEY `id_satuan` (`id_satuan`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `ekspedisi`
--
ALTER TABLE `ekspedisi`
  ADD PRIMARY KEY (`id_ekspedisi`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ekspedisi`
--
ALTER TABLE `ekspedisi`
  MODIFY `id_ekspedisi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`) ON UPDATE CASCADE;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
