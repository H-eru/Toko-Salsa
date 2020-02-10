-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2017 at 09:23 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `cart_session` varchar(32) DEFAULT NULL,
  `cart_date` date DEFAULT NULL,
  `cart_qty` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(23, 'Food', 'Y'),
(25, 'Beverages', 'Y'),
(30, 'alcoholic beverages', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(5) NOT NULL,
  `nama_petugas` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_order` datetime NOT NULL,
  `jam_order` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `nama_petugas`, `tgl_order`, `jam_order`) VALUES
(520, 'admin', '2017-11-01 07:24:11', '00:24:11'),
(521, 'admin', '2017-11-03 21:37:04', '15:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `product_id` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `product_id`, `jumlah`) VALUES
(520, 34, 1),
(521, 36, 1),
(521, 37, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE `orders_temp` (
  `id_orders_temp` int(5) NOT NULL,
  `product_id` int(11) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_desc` text,
  `product_images` text,
  `product_stock` int(11) DEFAULT NULL,
  `product_date` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_desc`, `product_images`, `product_stock`, `product_date`, `category_id`) VALUES
(34, 'Sosis Bakar Barbeque Toast', 67000, 'Sosis Bakar Barbeque Toast Simple & Praktis', '3149902149aplikasi penjualan pos aplikasi pos berbasis web (point of sales) dengan php mysql dan bootstrap-sosis super jumbo.jpg', 44, '2017-11-01 06:45:19', 23),
(36, 'Chicken Spinach Quiche', 3400, 'enak bangett', '5553413386aplikasi penjualan pos free (point of sales) dengan php mysql dan bootstrap-4.jpg', 33, '2017-11-01 06:48:15', 23),
(37, 'Coffee of the Day', 5000, 'Ngopi dulu baru di lanjut', '2191072555aplikasi penjualan pos gratis (point of sales) dengan php mysql dan bootstrap-2.jpg', 33, '2017-11-01 06:49:08', 25),
(38, 'Chocolate Beverages', 10000, 'halus dan coklat-y ... apa lagi yang Anda inginkan dari secangkir cokelat panas. Nikmati secangkir pemanasan di hari yang dingin.', '1803235657aplikasi penjualan pos online (point of sales) dengan php mysql dan bootstrap-6.jpg', 33, '2017-11-01 06:51:09', 25),
(39, 'Triple Chocolate Cake', 4000, 'Triple Chocolate Cake enak bangett', '2351628049aplikasi penjualan pos terbaik (point of sales) dengan php mysql dan bootstrap-10.jpg', 122, '2017-11-01 06:52:03', 23),
(40, 'Chocolate Cake', 4000, 'Chocolate nyummi', '4010850969aplikasi pos berbasis web aplikasi penjualan pos (point of sales) dengan php mysql dan bootstrap-1.jpg', 12, '2017-11-01 06:52:47', 25),
(41, 'Kentang Goreng', 5000, 'Kentang Goreng Kering Gurih', '5207650307aplikasi pos berbasis web aplikasi penjualan pos (point of sales) dengan php mysql dan bootstrap-3.jpg', 12, '2017-11-01 06:54:07', 23),
(42, 'Chocolate Chocho Mama', 4000, 'nikmati harimu dengan Chocolate Chocho Mama ', '2964061317aplikasi pos berbasis web aplikasi penjualan pos (point of sales) dengan php mysql dan bootstrap-5.jpg', 12, '2017-11-01 06:55:07', 25),
(44, 'Rich Blueberry Muffin', 12000, 'Rich Blueberry Muffin', '4990925192aplikasi pos berbasis web aplikasi penjualan pos (point of sales) dengan php mysql dan bootstrap-09.jpg', 122, '2017-11-01 06:56:59', 25);

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `orders_temp`
--
ALTER TABLE `orders_temp`
  ADD PRIMARY KEY (`id_orders_temp`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;
--
-- AUTO_INCREMENT for table `orders_temp`
--
ALTER TABLE `orders_temp`
  MODIFY `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2357;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
