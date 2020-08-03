-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 04, 2020 at 05:07 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `orderTABLE`
--

CREATE TABLE `orderTABLE` (
  `id` int(11) NOT NULL,
  `OrderDateTime` text COLLATE utf8_unicode_ci NOT NULL,
  `idUser` text COLLATE utf8_unicode_ci NOT NULL,
  `NameUser` text COLLATE utf8_unicode_ci NOT NULL,
  `idShop` text COLLATE utf8_unicode_ci NOT NULL,
  `NameShop` text COLLATE utf8_unicode_ci NOT NULL,
  `Distance` text COLLATE utf8_unicode_ci NOT NULL,
  `Transport` text COLLATE utf8_unicode_ci NOT NULL,
  `idFood` text COLLATE utf8_unicode_ci NOT NULL,
  `NameFood` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` text COLLATE utf8_unicode_ci NOT NULL,
  `Amount` text COLLATE utf8_unicode_ci NOT NULL,
  `Sum` text COLLATE utf8_unicode_ci NOT NULL,
  `idRider` text COLLATE utf8_unicode_ci NOT NULL,
  `Status` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderTABLE`
--

INSERT INTO `orderTABLE` (`id`, `OrderDateTime`, `idUser`, `NameUser`, `idShop`, `NameShop`, `Distance`, `Transport`, `idFood`, `NameFood`, `Price`, `Amount`, `Sum`, `idRider`, `Status`) VALUES
(1, '2020-08-04 05:05', '1', 'มาสเตอร์ ผู้ซื้อ', '2', 'อึ่ง อร่อยโครต จริงๆ', '1.72', '45', '[12, 17]', '[เลือดหมู ข้าวเปล่า, สุกี่แห้ง]', '[80, 50]', '[3, 2]', '[240, 100]', 'none', 'UserOrder'),
(2, '2020-08-04 05:06', '1', 'มาสเตอร์ ผู้ซื้อ', '15', 'โนบิตะ อร่อย มาก', '2.48', '45', '[1, 3, 6, 7]', '[ลูกชิ้นหมู, ขนมจีนแกงไก่, สลัดไข่, หมูผัดเผ็ด]', '[10, 60, 60, 80]', '[5, 1, 2, 2]', '[50, 60, 120, 160]', 'none', 'UserOrder');

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
-- Indexes for table `foodTABLE`
--
ALTER TABLE `foodTABLE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderTABLE`
--
ALTER TABLE `orderTABLE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userTABLE`
--
ALTER TABLE `userTABLE`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodTABLE`
--
ALTER TABLE `foodTABLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orderTABLE`
--
ALTER TABLE `orderTABLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userTABLE`
--
ALTER TABLE `userTABLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
