-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 08, 2025 at 08:37 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `bags`
--

DROP TABLE IF EXISTS `bags`;
CREATE TABLE IF NOT EXISTS `bags` (
  `id` int NOT NULL,
  `bags_category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `bags_category_quantity` int DEFAULT '0',
  `bags_category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bags`
--

INSERT INTO `bags` (`id`, `bags_category_name`, `bags_category_quantity`, `bags_category_status`) VALUES
(1, 'Shopping Bag', 62, 0x31),
(2, 'Purse', 35, 0x31),
(3, 'Wallet', 75, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `banner_subtitle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `banner_title` text COLLATE utf8mb4_general_ci NOT NULL,
  `banner_items_price` int NOT NULL,
  `banner_image` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `banner_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `banner_subtitle`, `banner_title`, `banner_items_price`, `banner_image`, `banner_status`) VALUES
(1, 'Trending item', 'Women\'s latest fashion sale', 20, 'banner-1.jpg', 0x31),
(2, 'Trending accessories', 'Modern sunglasses', 15, 'banner-2.jpg', 0x31),
(3, 'Sale Offer', 'New fashion summer sale', 29, 'banner-3.jpg', 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` binary(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `img`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Clothes', 'dress.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31),
(2, 'Footwear', 'shoes.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31),
(3, 'Jewelry', 'jewelry.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31),
(4, 'Perfume', 'perfume.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31),
(5, 'Cosmetics', 'cosmetics.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31),
(6, 'Glasses', 'glasses.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31),
(7, 'Bags', 'bag.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31),
(8, 'Electronics', 'watch.svg', '2022-11-08 17:05:38', '2022-11-08 22:05:38', 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `category_bar`
--

DROP TABLE IF EXISTS `category_bar`;
CREATE TABLE IF NOT EXISTS `category_bar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `category_quantity` int NOT NULL,
  `category_img` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_bar`
--

INSERT INTO `category_bar` (`id`, `category_title`, `category_quantity`, `category_img`, `category_status`) VALUES
(1, 'Dress & frock', 53, 'coat.svg', 0x31),
(2, 'Glasses & lens', 68, 'glasses.svg', 0x31),
(3, 'Shorts & jeans', 84, 'shorts.svg', 0x31),
(4, 'T-shirts', 35, 'tee.svg', 0x31),
(5, 'Jacket', 16, 'jacket.svg', 0x31),
(6, 'Watch', 27, 'watch.svg', 0x31),
(7, 'Hat & caps', 39, 'hat.svg', 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `category_electronics`
--

DROP TABLE IF EXISTS `category_electronics`;
CREATE TABLE IF NOT EXISTS `category_electronics` (
  `id` int NOT NULL,
  `category_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_electronics`
--

INSERT INTO `category_electronics` (`id`, `category_name`, `status`) VALUES
(1, 'Desktop', 1),
(2, 'Laptop', 1),
(3, 'Camera', 1),
(4, 'Tablet', 1),
(5, 'Headphone', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

DROP TABLE IF EXISTS `clothes`;
CREATE TABLE IF NOT EXISTS `clothes` (
  `id` int NOT NULL,
  `cloth_category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `cloth_category_quantity` int DEFAULT '0',
  `coloth_category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clothes`
--

INSERT INTO `clothes` (`id`, `cloth_category_name`, `cloth_category_quantity`, `coloth_category_status`) VALUES
(1, 'Shirt', 300, 0x31),
(2, 'shorts & jeans', 60, 0x31),
(4, 'jacket', 50, 0x31),
(5, 'dress & frock', 87, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics`
--

DROP TABLE IF EXISTS `cosmetics`;
CREATE TABLE IF NOT EXISTS `cosmetics` (
  `id` int NOT NULL,
  `cosmetics_category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `cosmetics_category_quantity` int DEFAULT '0',
  `cosmetics_category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics`
--

INSERT INTO `cosmetics` (`id`, `cosmetics_category_name`, `cosmetics_category_quantity`, `cosmetics_category_status`) VALUES
(1, 'Shampoo', 68, 0x31),
(2, 'Sunscreen', 46, 0x31),
(3, 'Body Wash', 79, 0x31),
(4, 'Makeup Kit', 23, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_fname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_pwd` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `customer_role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_email` (`customer_email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_fname`, `customer_email`, `customer_pwd`, `customer_phone`, `customer_address`, `customer_role`) VALUES
(9, 'vishaladmin', 'admin@gmail.com', 'vishal', '6397180953', 'mathura, india', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_day`
--

DROP TABLE IF EXISTS `deal_of_the_day`;
CREATE TABLE IF NOT EXISTS `deal_of_the_day` (
  `deal_id` int NOT NULL,
  `deal_title` text COLLATE utf8mb4_general_ci NOT NULL,
  `deal_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `deal_net_price` double(10,2) NOT NULL,
  `deal_discounted_price` double(10,2) NOT NULL,
  `available_deal` int NOT NULL,
  `sold_deal` int NOT NULL,
  `deal_image` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `deal_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`deal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deal_of_the_day`
--

INSERT INTO `deal_of_the_day` (`deal_id`, `deal_title`, `deal_description`, `deal_net_price`, `deal_discounted_price`, `available_deal`, `sold_deal`, `deal_image`, `deal_status`) VALUES
(1, 'shampoo, conditioner & facewash packs', 'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor\r\n                        dolor sit amet consectetur Lorem ipsum dolor', 200.00, 150.00, 40, 20, 'shampoo.jpg', 0x31),
(2, 'Rose Gold diamonds Earring', 'Lorem ipsum dolor sit amet consectetur Lorem ipsum dolor\r\n                        dolor sit amet consectetur Lorem ipsum dolor', 250.00, 190.00, 40, 15, 'jewellery-1.jpg', 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `footwear`
--

DROP TABLE IF EXISTS `footwear`;
CREATE TABLE IF NOT EXISTS `footwear` (
  `id` int NOT NULL,
  `footwear_category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `footwear_category_quantity` int DEFAULT '0',
  `footwear_category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footwear`
--

INSERT INTO `footwear` (`id`, `footwear_category_name`, `footwear_category_quantity`, `footwear_category_status`) VALUES
(1, 'Sports', 45, 0x31),
(2, 'Formal', 75, 0x31),
(3, 'Casual', 35, 0x31),
(4, 'jacket', 50, 0x31),
(5, 'Safety Shoes', 26, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
CREATE TABLE IF NOT EXISTS `glasses` (
  `id` int NOT NULL,
  `glasses_category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `glasses_category_quantity` int DEFAULT '0',
  `glasses_category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `glasses`
--

INSERT INTO `glasses` (`id`, `glasses_category_name`, `glasses_category_quantity`, `glasses_category_status`) VALUES
(1, 'Sunglasses', 50, 0x31),
(2, 'Lenses', 48, 0x31),
(3, 'Lenses', 48, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `jewelry`
--

DROP TABLE IF EXISTS `jewelry`;
CREATE TABLE IF NOT EXISTS `jewelry` (
  `id` int NOT NULL,
  `Jewelry_category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Jewelry_category_quantity` int DEFAULT '0',
  `Jewelry_category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jewelry`
--

INSERT INTO `jewelry` (`id`, `Jewelry_category_name`, `Jewelry_category_quantity`, `Jewelry_category_status`) VALUES
(1, 'Earrings', 46, 0x31),
(2, 'Couple Rings', 73, 0x31),
(3, 'Necklace', 61, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `perfume`
--

DROP TABLE IF EXISTS `perfume`;
CREATE TABLE IF NOT EXISTS `perfume` (
  `id` int NOT NULL,
  `perfume_category_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `perfume_category_quantity` int DEFAULT '0',
  `perfume_category_status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perfume`
--

INSERT INTO `perfume` (`id`, `perfume_category_name`, `perfume_category_quantity`, `perfume_category_status`) VALUES
(1, 'Clothes Perfume', 12, 0x31),
(2, 'Deodorant', 60, 0x31),
(3, 'jacket', 50, 0x31),
(4, 'dress & frock', 87, 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_catag` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` int NOT NULL,
  `product_desc` text COLLATE utf8mb4_general_ci NOT NULL,
  `product_date` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `product_img` text COLLATE utf8mb4_general_ci NOT NULL,
  `product_left` int NOT NULL,
  `product_author` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `discounted_price` double(10,2) DEFAULT NULL,
  `image_1` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `image_2` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` binary(1) DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_catag`, `product_title`, `product_price`, `product_desc`, `product_date`, `product_img`, `product_left`, `product_author`, `category_id`, `section_id`, `discounted_price`, `image_1`, `image_2`, `created_at`, `updated_at`, `status`) VALUES
(1, 'men', 'jacket', 75, 'Mens Winter Leathers Jackets', '', 'jacket-3.jpg', 50, 'admin vishal', NULL, 7, 48.00, 'jacket-4.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(2, 'men', 'shirt', 56, 'Pure Garment Dyed Cotton Shirt', '', 'shirt-1.jpg', 50, 'admin vishal', NULL, 7, 45.00, 'shirt-2.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(3, 'men', 'Jacket', 65, 'MEN Yarn Fleece Full-Zip Jacket', '', 'jacket-5.jpg', 50, 'admin vishal', NULL, 7, 58.00, 'jacket-6.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(4, 'women', 'skirt', 25, 'Black Floral Wrap Midi Skirt', '', 'clothes-3.jpg', 50, 'admin vishal', NULL, 7, 35.00, 'clothes-4.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(5, 'men', 'casual', 105, 'Casual Men Brown shoes', '', 'shoe-2.jpg', 50, 'admin vishal', NULL, 7, 99.00, 'shoe-2_1.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(6, 'men', 'watches', 170, 'Pocket Watch Leather Pouch', '', 'watch-3.jpg', 50, 'admin vishal', NULL, 7, 150.00, 'watch-4.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(7, 'men', 'watches', 120, 'Smart watche Vital Plus', '', 'watch-1.jpg', 50, 'admin vishal', NULL, 7, 100.00, 'watch-2.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(8, 'women', 'party wear', 25, 'Womens Party Wear Shoes', '', 'party-wear-1.jpg', 50, 'admin vishal', NULL, 7, 30.00, 'party-wear-2.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(9, 'men', 'jacket', 45, 'Mens Winter Leathers Jackets', '', 'jacket-1.jpg', 50, 'admin vishal', NULL, 7, 32.00, 'jacket-2.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(10, 'men', 'sports', 64, 'Trekking & Running Shoes - black', '', 'sports-2.jpg', 50, 'admin vishal', NULL, 7, 58.00, 'sports-4.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(11, 'men', 'formal', 65, 'Men Leather Formal Wear shoes', '', 'shoe-1.jpg', 50, 'admin vishal', NULL, 7, 50.00, 'shoe-1_1.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(12, 'women', 'shorts', 85, 'Better Basics French Terry Sweatshorts', '', 'shorts-1.jpg', 50, 'admin vishal', NULL, 7, 78.00, 'shorts-2.jpg', NULL, '2023-06-16 18:33:06', '2023-06-16 23:33:06', 0x31),
(13, 'men', 'Jeans', 12, 'New Jeans for men. New summer Sale                   ', '16,6,2023', 'pant2.png', 100, 'vishal', NULL, NULL, 10.00, '', NULL, '2023-06-16 19:52:58', '2023-06-17 01:00:16', 0x31),
(14, 'men', 'Red Hoddie', 15, 'Red hoddie for men. New Design and bright color.', '16,6,2023', 'f3.png', 69, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-16 20:02:15', '2023-06-17 01:02:15', 0x31),
(15, 'men', 'Black T Shirt', 13, 'Black T Shit with half sleeves for men. Both summer and winter. High fashon.', '16,6,2023', 'p4.png', 99, 'vishal', NULL, NULL, 10.00, '', NULL, '2023-06-16 20:05:07', '2023-06-17 01:05:07', 0x31),
(16, 'all', 'T-Shirts', 16, 'Different color of t shirts pack of 3', '17,6,2023', 'p17.png', 150, 'vishal', NULL, NULL, 13.00, '', NULL, '2023-06-17 05:22:01', '2023-06-17 10:22:01', 0x31),
(17, 'all', 'Glasses & Lens', 12, 'Bock blue light. Improve night vision. And stylish look.', '17,6,2023', 'g3.png', 50, 'vishal', NULL, NULL, 10.00, '', NULL, '2023-06-17 05:24:06', '2023-06-17 10:24:06', 0x31),
(18, 'all', 'Jeans', 10, 'Jeans for both men and women.', '17,6,2023', 'f9.png', 100, 'vishal', NULL, NULL, 8.00, '', NULL, '2023-06-17 06:26:01', '2023-06-17 11:26:01', 0x31),
(19, 'all', 'Kitty Dress', 15, 'Kitty bear dress for kids.', '17,6,2023', 'f10.png', 100, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-17 06:27:33', '2023-06-17 11:27:33', 0x31),
(20, 'all', 'Bag', 15, 'Large size bag for carrying different accessories.', '17,6,2023', 'topcard3.png', 50, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-17 06:28:36', '2023-06-17 11:28:36', 0x31),
(21, 'all', 'Sports Shoes', 15, 'Sport shoes. Jogging shoes. Gym shoes.', '17,6,2023', 'b2.png', 20, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-17 06:30:08', '2023-06-17 11:30:08', 0x31),
(22, 'women', 'Purse', 15, 'Ornage purse for stunning look and carry accessories.', '17,6,2023', 'p5.png', 100, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-17 06:31:26', '2023-06-17 11:31:26', 0x31),
(23, 'women', 'Casual Slippers', 15, 'Casual function slippers for female.', '17,6,2023', 'p7.png', 100, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-17 06:32:33', '2023-06-17 11:32:33', 0x31),
(24, 'all', 'Clothes Perfume', 15, 'Fresh Fragrance perfume. Indoor and outdoor', '17,6,2023', 'perfume.png', 100, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-17 06:33:46', '2023-06-17 11:33:46', 0x31),
(25, 'women', 'Formal Shoes', 15, 'Formal shoes for female. Indoor and outdoor.', '17,6,2023', 'p10.jpg', 100, 'vishal', NULL, NULL, 12.00, '', NULL, '2023-06-17 06:35:09', '2023-06-17 11:35:09', 0x31),
(26, 'women', 'Socks', 10, 'Socks for indoor and outdoor.', '17,6,2023', 'f2.png', 100, 'vishal', NULL, NULL, 5.00, '', NULL, '2023-06-17 06:38:25', '2023-06-17 11:38:25', 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `review` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `review`) VALUES
(1, 'Iqso Fhd', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem ad\r\n            fugiat, itaque dolore culpa ipsa fuga, illum, maxime exercitationem\r\n            commodi nihil nobis nulla similique quibusdam sed expedita provident'),
(2, 'IFAD', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem ad\r\n            fugiat, itaque dolore culpa ipsa fuga, illum, maxime exercitationem\r\n            commodi nihil nobis nulla similique quibusdam sed expedita provident'),
(3, 'Eva Silk', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem ad\r\n            fugiat, itaque dolore culpa ipsa fuga, illum, maxime exercitationem\r\n            commodi nihil nobis nulla similique quibusdam sed expedita provident');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` binary(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `status`) VALUES
(2, 'new_arrival', 0x31),
(3, 'trending', 0x31),
(4, 'top_rated', 0x31),
(5, 'deal_of_day', 0x31),
(6, 'best_seller', 0x31),
(7, 'new_products', 0x31);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `website_name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `website_logo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `website_footer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`website_name`, `website_logo`, `website_footer`) VALUES
('HCA E-Commerce', 'HCA-E-COMMERCE.png', 'HCA E-Commerce');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
