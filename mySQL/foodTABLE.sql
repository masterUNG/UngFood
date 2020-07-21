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
-- Table structure for table `foodTABLE`
--

CREATE TABLE `foodTABLE` (
  `id` int(11) NOT NULL,
  `idShop` text COLLATE utf8_unicode_ci NOT NULL,
  `NameFood` text COLLATE utf8_unicode_ci NOT NULL,
  `PathImage` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` text COLLATE utf8_unicode_ci NOT NULL,
  `Detail` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodTABLE`
--

INSERT INTO `foodTABLE` (`id`, `idShop`, `NameFood`, `PathImage`, `Price`, `Detail`) VALUES
(1, '15', 'ลูกชิ้นหมู', '/UngFood/Food/food505877.jpg', '10', 'อร่อย มากๆๆ'),
(2, '15', 'ต้มเลือดหมู', '/UngFood/Food/food437263.jpg', '50', 'ซดๆๆๆ ร้อนๆ อร่อยมาก'),
(3, '15', 'ขนมจีนแกงไก่', '/UngFood/Food/food41565.jpg', '60', 'เผ็ด แต่ อร่อย'),
(4, '15', 'สุกี่แห้ง', '/UngFood/Food/food476330.jpg', '60', 'อร่อย มากๆๆๆ'),
(5, '15', 'กระเพราไข่ดาว', '/UngFood/Food/food486662.jpg', '50', 'เผ็ด แต่ อร่อยมาก'),
(6, '15', 'สลัดไข่', '/UngFood/Food/food81236.jpg', '60', 'ผัดสด กับ ไข่ต้ม'),
(7, '15', 'หมูผัดเผ็ด', '/UngFood/Food/food770077.jpg', '80', 'เผ็ดมากนะ'),
(12, '2', 'เลือดหมู ข้าวเปล่า', '/UngFood/Food/food698689.jpg', '80', 'อร่อย มากๆๆ'),
(16, '2', 'เค้กช้อกโกเล็ด', '/UngFood/Food/food682557.jpg', '300', 'ช้อคโกแล้ค'),
(17, '2', 'สุกี่แห้ง', '/UngFood/Food/food611185.jpg', '50', 'อร่อย สะอาด ทะเลเพียบๆๆๆ อร่อย สะอาด ทะเลเพียบๆๆๆ อร่อย สะอาด ทะเลเพียบๆๆๆ'),
(19, '16', 'เกาเหลา ข้าวเปล่า', '/UngFood/Food/food933585.jpg', '60', 'อิ่มอร่อย');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foodTABLE`
--
ALTER TABLE `foodTABLE`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodTABLE`
--
ALTER TABLE `foodTABLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
