-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2021 at 06:09 PM
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
-- Database: `sample_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_customer`
--

CREATE TABLE `m_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_customer`
--

INSERT INTO `m_customer` (`customer_id`, `customer_name`, `customer_address`, `customer_phone`) VALUES
(1, 'MD.rabius sani raju', 'Dhaka', '+8801987674842'),
(2, 'Abu Syed Ahmed', 'Dhaka', '+8801168745124'),
(3, 'Abu Syed Ahamed', 'Dhaka', '+8801248769754');

-- --------------------------------------------------------

--
-- Table structure for table `m_item`
--

CREATE TABLE `m_item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_price` decimal(10,0) DEFAULT NULL,
  `item_stock` decimal(10,0) DEFAULT NULL,
  `item_package` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_item`
--

INSERT INTO `m_item` (`item_id`, `item_name`, `item_price`, `item_stock`, `item_package`) VALUES
(3, 'Cokacola', '300', '400', 'PCS'),
(9, 'Frash Water', '500', '100', 'PCS'),
(10, 'Nescaf 500', '750', '8400', 'PCS'),
(15, 'Radhuni Oil', '550', '400', 'PCS'),
(17, 'Window Phone', '875', '458', 'PCS'),
(18, 'Test 001', '700', '500', 'PCS');

-- --------------------------------------------------------

--
-- Table structure for table `t_sales`
--

CREATE TABLE `t_sales` (
  `sales_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_sales`
--

INSERT INTO `t_sales` (`sales_id`, `customer_id`, `sales_date`, `discount`) VALUES
(2, 3, '2021-07-02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sales_detail`
--

CREATE TABLE `t_sales_detail` (
  `sales_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_sales_detail`
--

INSERT INTO `t_sales_detail` (`sales_id`, `item_id`, `item_qty`, `item_price`) VALUES
(1, 3, 2, 300),
(1, 1, 1, 850),
(1, 2, 1, 840),
(2, 3, 1, 300),
(2, 9, 1, 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_customer`
--
ALTER TABLE `m_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `m_item`
--
ALTER TABLE `m_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `t_sales`
--
ALTER TABLE `t_sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_customer`
--
ALTER TABLE `m_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_item`
--
ALTER TABLE `m_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_sales`
--
ALTER TABLE `t_sales`
  MODIFY `sales_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
