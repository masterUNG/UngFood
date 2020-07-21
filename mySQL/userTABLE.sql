-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 22, 2020 at 04:10 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `UngFood`
--

-- --------------------------------------------------------

--
-- Table structure for table `userTABLE`
--

CREATE TABLE `userTABLE` (
  `id` int(11) NOT NULL,
  `ChooseType` text COLLATE utf8_unicode_ci NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `User` text COLLATE utf8_unicode_ci NOT NULL,
  `Password` text COLLATE utf8_unicode_ci NOT NULL,
  `NameShop` text COLLATE utf8_unicode_ci NOT NULL,
  `Address` text COLLATE utf8_unicode_ci NOT NULL,
  `Phone` text COLLATE utf8_unicode_ci NOT NULL,
  `UrlPicture` text COLLATE utf8_unicode_ci NOT NULL,
  `Lat` text COLLATE utf8_unicode_ci NOT NULL,
  `Lng` text COLLATE utf8_unicode_ci NOT NULL,
  `Token` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userTABLE`
--

INSERT INTO `userTABLE` (`id`, `ChooseType`, `Name`, `User`, `Password`, `NameShop`, `Address`, `Phone`, `UrlPicture`, `Lat`, `Lng`, `Token`) VALUES
(1, 'User', 'มาสเตอร์ ผู้ซื้อ', 'masteruser', '123456', '', '', '', '', '', '', ''),
(2, 'Shop', 'ร้านมาสเตอร์ อึ่ง', 'mastershop', '123456', 'อึ่ง อร่อยโครต จริงๆ', '53 หมู่บ้านถาวรนิเวศน์1\r\nซอย บางนา-ตราด14\r\nบางนา กรุงเทพ 10260', '0818595309', '/UngFood/Shop/editShop66320.jpg', '13.673455', '100.606933', ''),
(3, 'Rider', 'มาสเตอร์อึ่ง ส่งของ', 'masterrider', '123456', '', '', '', '', '', '', ''),
(11, 'Shop', 'Apple Shop', 'appleShop', '123456', '', '', '', '', '', '', ''),
(14, 'User', 'โดรามอน', 'dora', '123456', '', '', '', '', '', '', ''),
(15, 'Shop', 'โนบิตะ', 'nopi', '123456', 'โนบิตะ อร่อย มาก', '1234 บางนา กรุงเทพ', '123456', '/UngFood/Shop/editShop35981.jpg', '13.665762', '100.644516', ''),
(16, 'Shop', 'TestShop1', 'shop1', '123456', 'ก้วยเตียว อึ่ง', '123/456 กทม', '123456', '/UngFood/Shop/shop793822.jpg', '13.670370', '100.622812', ''),
(17, 'User', 'apple User', 'appleuser', '123456', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userTABLE`
--
ALTER TABLE `userTABLE`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userTABLE`
--
ALTER TABLE `userTABLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
