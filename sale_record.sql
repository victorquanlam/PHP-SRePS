-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2018 at 03:17 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sale_record`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_stock`
--

CREATE TABLE `order_stock` (
  `orders_stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` float NOT NULL,
  `orders_stock_status` enum('Pending','Processing','Completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_stock`
--

INSERT INTO `order_stock` (`orders_stock_id`, `product_id`, `quantity`, `total`, `orders_stock_status`) VALUES
(34, 1000001, 100, 3799, 'Pending'),
(35, 1000001, 100, 3799, 'Pending'),
(36, 1000004, 25, 374.75, 'Pending'),
(37, 1000001, 12, 455.88, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `price`) VALUES
(1000001, 'Ultiboost High Strength Cranberry 90 Capsules', 37.99),
(1000002, 'Glucosamine Sulfate 1500mg', 29.99),
(1000003, 'Ultiboost Grape Seed', 24.99),
(1000004, 'Calcium + Vitamin D 150 Tablets', 14.99),
(1000005, 'Omega3 Fish Oil Trio 180 Capsules ', 34.99),
(1000006, 'Panamax 500mg 100 Tablets ', 1.99),
(1000007, 'Men\'s Ultivite 120 Tablets ', 35.49),
(1000008, 'Vitamin C 500mg 300 Tablets', 12.99),
(1000009, 'Vitamin D3 1000IU 300 Capsules', 24.99),
(1000010, 'Rapid Paracetamol Pain Relief Caplets 500mg 20 ', 4.69);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL,
  `sale_date` date NOT NULL,
  `sale_name` varchar(255) NOT NULL,
  `quantity` int(5) NOT NULL,
  `discount` float NOT NULL,
  `payment_type` enum('Credit Card','Cash','Eftpos') NOT NULL,
  `payment_status` enum('Pending','Processing','Completed') NOT NULL,
  `total` float NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_id`, `sale_date`, `sale_name`, `quantity`, `discount`, `payment_type`, `payment_status`, `total`, `product_id`) VALUES
(1043, '2018-06-02', 'Sam William', 3, 0, 'Credit Card', 'Completed', 14.07, 1000010),
(1044, '2018-06-02', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 74.97, 1000009),
(1045, '2018-06-02', 'Sam William', 4, 0, 'Cash', 'Pending', 139.96, 1000005),
(1046, '2018-06-02', 'James Johnson', 4, 0, 'Eftpos', 'Completed', 51.96, 1000008),
(1047, '2018-06-02', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 24.99, 1000003),
(1048, '2018-06-03', 'Sam William', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1049, '2018-06-03', 'Sam William', 5, 0, 'Cash', 'Completed', 149.95, 1000002),
(1050, '2018-06-03', 'Sam William', 2, 0, 'Eftpos', 'Completed', 9.38, 1000010),
(1051, '2018-06-03', 'James Johnson', 3, 0, 'Cash', 'Completed', 14.07, 1000010),
(1052, '2018-06-04', 'Michael Smith', 1, 0, 'Credit Card', 'Completed', 24.99, 1000003),
(1053, '2018-06-04', 'Sam William', 4, 0, 'Credit Card', 'Completed', 59.96, 1000004),
(1054, '2018-06-04', 'Michael Smith', 5, 0, 'Cash', 'Completed', 74.95, 1000004),
(1055, '2018-06-04', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 44.97, 1000004),
(1056, '2018-06-04', 'Michael Smith', 2, 0, 'Cash', 'Completed', 49.98, 1000003),
(1057, '2018-06-05', 'James Johnson', 5, 0, 'Credit Card', 'Completed', 74.95, 1000004),
(1058, '2018-06-05', 'Michael Smith', 3, 0, 'Credit Card', 'Completed', 74.97, 1000009),
(1059, '2018-06-05', 'Michael Smith', 2, 0, 'Eftpos', 'Completed', 49.98, 1000009),
(1060, '2018-06-05', 'Sam William', 2, 0, 'Credit Card', 'Completed', 3.98, 1000006),
(1061, '2018-06-06', 'Michael Smith', 2, 0, 'Eftpos', 'Completed', 75.98, 1000001),
(1062, '2018-06-06', 'Sam William', 2, 0, 'Credit Card', 'Completed', 25.98, 1000008),
(1063, '2018-06-06', 'Sam William', 3, 0, 'Eftpos', 'Completed', 44.97, 1000004),
(1064, '2018-06-07', 'Sam William', 5, 0, 'Cash', 'Completed', 74.95, 1000004),
(1065, '2018-06-07', 'James Johnson', 5, 0, 'Credit Card', 'Completed', 124.95, 1000003),
(1066, '2018-06-07', 'Michael Smith', 2, 0, 'Cash', 'Completed', 69.98, 1000005),
(1067, '2018-06-07', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 35.49, 1000007),
(1068, '2018-06-07', 'Sam William', 4, 0, 'Cash', 'Completed', 51.96, 1000008),
(1069, '2018-06-08', 'James Johnson', 2, 0, 'Cash', 'Completed', 49.98, 1000009),
(1070, '2018-06-08', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1071, '2018-06-08', 'Michael Smith', 2, 0, 'Cash', 'Completed', 75.98, 1000001),
(1072, '2018-06-08', 'Sam William', 4, 0, 'Eftpos', 'Completed', 59.96, 1000004),
(1073, '2018-06-09', 'Sam William', 1, 0, 'Credit Card', 'Completed', 4.69, 1000010),
(1074, '2018-06-09', 'Sam William', 5, 0, 'Cash', 'Completed', 124.95, 1000009),
(1075, '2018-06-09', 'Sam William', 1, 0, 'Credit Card', 'Completed', 34.99, 1000005),
(1076, '2018-06-09', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 38.97, 1000008),
(1077, '2018-06-10', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 177.45, 1000007),
(1078, '2018-06-10', 'James Johnson', 5, 0, 'Credit Card', 'Completed', 174.95, 1000005),
(1079, '2018-06-10', 'James Johnson', 2, 0, 'Cash', 'Completed', 9.38, 1000010),
(1080, '2018-06-10', 'Sam William', 2, 0, 'Eftpos', 'Completed', 70.98, 1000007),
(1081, '2018-06-10', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 141.96, 1000007),
(1082, '2018-06-11', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 23.45, 1000010),
(1083, '2018-06-11', 'Sam William', 2, 0, 'Credit Card', 'Completed', 75.98, 1000001),
(1084, '2018-06-11', 'Michael Smith', 5, 0, 'Cash', 'Completed', 64.95, 1000008),
(1085, '2018-06-11', 'Sam William', 1, 0, 'Cash', 'Completed', 14.99, 1000004),
(1086, '2018-06-12', 'James Johnson', 5, 0, 'Cash', 'Completed', 64.95, 1000008),
(1087, '2018-06-12', 'Michael Smith', 3, 0, 'Cash', 'Completed', 104.97, 1000005),
(1088, '2018-06-12', 'Michael Smith', 5, 0, 'Cash', 'Completed', 149.95, 1000002),
(1089, '2018-06-12', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 49.98, 1000003),
(1090, '2018-06-13', 'Michael Smith', 4, 0, 'Cash', 'Completed', 151.96, 1000001),
(1091, '2018-06-13', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 124.95, 1000003),
(1092, '2018-06-14', 'Sam William', 1, 0, 'Eftpos', 'Completed', 37.99, 1000001),
(1093, '2018-06-14', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 24.99, 1000009),
(1094, '2018-06-14', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 12.99, 1000008),
(1095, '2018-06-14', 'Sam William', 3, 0, 'Cash', 'Completed', 5.97, 1000006),
(1096, '2018-06-14', 'Michael Smith', 5, 0, 'Cash', 'Completed', 124.95, 1000003),
(1097, '2018-06-15', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 1.99, 1000006),
(1098, '2018-06-15', 'James Johnson', 2, 0, 'Cash', 'Completed', 49.98, 1000003),
(1099, '2018-06-15', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 14.99, 1000004),
(1100, '2018-06-15', 'Sam William', 4, 0, 'Cash', 'Completed', 139.96, 1000005),
(1101, '2018-06-15', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 99.96, 1000003),
(1102, '2018-06-16', 'Michael Smith', 3, 0, 'Credit Card', 'Completed', 106.47, 1000007),
(1103, '2018-06-16', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 74.97, 1000003),
(1104, '2018-06-16', 'Sam William', 1, 0, 'Cash', 'Completed', 34.99, 1000005),
(1105, '2018-06-16', 'Sam William', 4, 0, 'Eftpos', 'Completed', 7.96, 1000006),
(1106, '2018-06-17', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 12.99, 1000008),
(1107, '2018-06-17', 'Sam William', 3, 0, 'Cash', 'Completed', 89.97, 1000002),
(1108, '2018-06-18', 'Sam William', 5, 0, 'Credit Card', 'Completed', 174.95, 1000005),
(1109, '2018-06-18', 'Sam William', 5, 0, 'Credit Card', 'Completed', 64.95, 1000008),
(1110, '2018-06-18', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 139.96, 1000005),
(1111, '2018-06-18', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 38.97, 1000008),
(1112, '2018-06-18', 'Michael Smith', 3, 0, 'Credit Card', 'Completed', 5.97, 1000006),
(1113, '2018-06-19', 'Sam William', 5, 0, 'Eftpos', 'Completed', 189.95, 1000001),
(1114, '2018-06-19', 'Sam William', 3, 0, 'Eftpos', 'Completed', 113.97, 1000001),
(1115, '2018-06-19', 'Michael Smith', 3, 0, 'Cash', 'Completed', 5.97, 1000006),
(1116, '2018-06-19', 'Sam William', 4, 0, 'Eftpos', 'Completed', 99.96, 1000009),
(1117, '2018-06-20', 'James Johnson', 4, 0, 'Eftpos', 'Completed', 99.96, 1000003),
(1118, '2018-06-20', 'Sam William', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1119, '2018-06-20', 'Michael Smith', 2, 0, 'Cash', 'Completed', 49.98, 1000003),
(1120, '2018-06-21', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 59.96, 1000004),
(1121, '2018-06-21', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 124.95, 1000009),
(1122, '2018-06-21', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 99.96, 1000003),
(1123, '2018-06-21', 'Sam William', 3, 0, 'Cash', 'Completed', 44.97, 1000004),
(1124, '2018-06-21', 'Sam William', 3, 0, 'Eftpos', 'Completed', 38.97, 1000008),
(1125, '2018-06-22', 'James Johnson', 2, 0, 'Cash', 'Completed', 75.98, 1000001),
(1126, '2018-06-22', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 3.98, 1000006),
(1127, '2018-06-22', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 113.97, 1000001),
(1128, '2018-06-22', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 189.95, 1000001),
(1129, '2018-06-23', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 49.98, 1000003),
(1130, '2018-06-23', 'Sam William', 4, 0, 'Eftpos', 'Completed', 141.96, 1000007),
(1131, '2018-06-23', 'Michael Smith', 5, 0, 'Cash', 'Completed', 149.95, 1000002),
(1132, '2018-06-24', 'Sam William', 2, 0, 'Credit Card', 'Completed', 25.98, 1000008),
(1133, '2018-06-24', 'Sam William', 5, 0, 'Eftpos', 'Completed', 177.45, 1000007),
(1134, '2018-06-24', 'Sam William', 2, 0, 'Credit Card', 'Completed', 3.98, 1000006),
(1135, '2018-06-25', 'Sam William', 2, 0, 'Cash', 'Completed', 9.38, 1000010),
(1136, '2018-06-25', 'Michael Smith', 1, 0, 'Credit Card', 'Completed', 29.99, 1000002),
(1137, '2018-06-25', 'Sam William', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1138, '2018-06-26', 'Michael Smith', 2, 0, 'Cash', 'Completed', 29.98, 1000004),
(1139, '2018-06-26', 'James Johnson', 5, 0, 'Cash', 'Completed', 9.95, 1000006),
(1140, '2018-06-26', 'Sam William', 4, 0, 'Cash', 'Completed', 7.96, 1000006),
(1141, '2018-06-27', 'Sam William', 5, 0, 'Cash', 'Completed', 174.95, 1000005),
(1142, '2018-06-27', 'Sam William', 3, 0, 'Cash', 'Completed', 38.97, 1000008),
(1143, '2018-06-27', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 113.97, 1000001),
(1144, '2018-06-27', 'Sam William', 3, 0, 'Eftpos', 'Completed', 74.97, 1000009),
(1145, '2018-06-28', 'Michael Smith', 3, 0, 'Credit Card', 'Completed', 38.97, 1000008),
(1146, '2018-06-28', 'James Johnson', 5, 0, 'Cash', 'Completed', 9.95, 1000006),
(1147, '2018-06-29', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 51.96, 1000008),
(1148, '2018-06-29', 'Sam William', 2, 0, 'Cash', 'Completed', 3.98, 1000006),
(1149, '2018-06-30', 'Sam William', 4, 0, 'Cash', 'Completed', 139.96, 1000005),
(1150, '2018-06-30', 'Sam William', 4, 0, 'Eftpos', 'Completed', 141.96, 1000007),
(1151, '2018-07-01', 'Sam William', 4, 0, 'Cash', 'Completed', 51.96, 1000008),
(1152, '2018-07-01', 'Sam William', 4, 0, 'Cash', 'Completed', 18.76, 1000010),
(1153, '2018-07-01', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 64.95, 1000008),
(1154, '2018-07-02', 'James Johnson', 4, 0, 'Cash', 'Completed', 99.96, 1000009),
(1155, '2018-07-02', 'Michael Smith', 2, 0, 'Eftpos', 'Completed', 70.98, 1000007),
(1156, '2018-07-02', 'Sam William', 1, 0, 'Eftpos', 'Completed', 35.49, 1000007),
(1157, '2018-07-03', 'Sam William', 3, 0, 'Credit Card', 'Completed', 89.97, 1000002),
(1158, '2018-07-03', 'Sam William', 1, 0, 'Credit Card', 'Completed', 24.99, 1000003),
(1159, '2018-07-03', 'James Johnson', 3, 0, 'Cash', 'Completed', 113.97, 1000001),
(1160, '2018-07-03', 'James Johnson', 5, 0, 'Credit Card', 'Completed', 64.95, 1000008),
(1161, '2018-07-04', 'Michael Smith', 5, 0, 'Cash', 'Completed', 9.95, 1000006),
(1162, '2018-07-04', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 7.96, 1000006),
(1163, '2018-07-04', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 119.96, 1000002),
(1164, '2018-07-04', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1165, '2018-07-04', 'Sam William', 1, 0, 'Cash', 'Completed', 24.99, 1000003),
(1166, '2018-07-05', 'Michael Smith', 2, 0, 'Cash', 'Completed', 49.98, 1000009),
(1167, '2018-07-05', 'Sam William', 4, 0, 'Cash', 'Completed', 99.96, 1000009),
(1168, '2018-07-05', 'James Johnson', 4, 0, 'Cash', 'Completed', 139.96, 1000005),
(1169, '2018-07-05', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 124.95, 1000003),
(1170, '2018-07-06', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 49.98, 1000009),
(1171, '2018-07-06', 'Sam William', 5, 0, 'Credit Card', 'Completed', 189.95, 1000001),
(1172, '2018-07-06', 'Michael Smith', 4, 0, 'Cash', 'Completed', 99.96, 1000003),
(1173, '2018-07-07', 'Sam William', 5, 0, 'Eftpos', 'Completed', 64.95, 1000008),
(1174, '2018-07-07', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 124.95, 1000003),
(1175, '2018-07-08', 'Sam William', 4, 0, 'Eftpos', 'Completed', 18.76, 1000010),
(1176, '2018-07-08', 'Sam William', 3, 0, 'Eftpos', 'Completed', 38.97, 1000008),
(1177, '2018-07-09', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 51.96, 1000008),
(1178, '2018-07-09', 'James Johnson', 3, 0, 'Cash', 'Completed', 44.97, 1000004),
(1179, '2018-07-09', 'Sam William', 1, 0, 'Credit Card', 'Completed', 34.99, 1000005),
(1180, '2018-07-09', 'Sam William', 1, 0, 'Credit Card', 'Completed', 24.99, 1000003),
(1181, '2018-07-10', 'Michael Smith', 3, 0, 'Cash', 'Completed', 113.97, 1000001),
(1182, '2018-07-10', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 69.98, 1000005),
(1183, '2018-07-10', 'Sam William', 2, 0, 'Credit Card', 'Completed', 49.98, 1000009),
(1184, '2018-07-10', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 75.98, 1000001),
(1185, '2018-07-10', 'Sam William', 3, 0, 'Eftpos', 'Completed', 106.47, 1000007),
(1186, '2018-07-11', 'James Johnson', 1, 0, 'Cash', 'Completed', 24.99, 1000009),
(1187, '2018-07-11', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 64.95, 1000008),
(1188, '2018-07-11', 'James Johnson', 2, 0, 'Cash', 'Completed', 59.98, 1000002),
(1189, '2018-07-11', 'Michael Smith', 3, 0, 'Credit Card', 'Completed', 5.97, 1000006),
(1190, '2018-07-12', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 139.96, 1000005),
(1191, '2018-07-12', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 174.95, 1000005),
(1192, '2018-07-12', 'Sam William', 1, 0, 'Eftpos', 'Completed', 4.69, 1000010),
(1193, '2018-07-12', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 59.96, 1000004),
(1194, '2018-07-12', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 49.98, 1000009),
(1195, '2018-07-13', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 149.95, 1000002),
(1196, '2018-07-13', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 124.95, 1000009),
(1197, '2018-07-13', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 51.96, 1000008),
(1198, '2018-07-14', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 69.98, 1000005),
(1199, '2018-07-14', 'James Johnson', 4, 0, 'Cash', 'Completed', 18.76, 1000010),
(1200, '2018-07-14', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 18.76, 1000010),
(1201, '2018-07-14', 'Michael Smith', 4, 0, 'Cash', 'Completed', 99.96, 1000009),
(1202, '2018-07-15', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 3.98, 1000006),
(1203, '2018-07-15', 'Sam William', 1, 0, 'Eftpos', 'Completed', 34.99, 1000005),
(1204, '2018-07-15', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 24.99, 1000009),
(1205, '2018-07-15', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 9.38, 1000010),
(1206, '2018-07-15', 'Sam William', 5, 0, 'Credit Card', 'Completed', 74.95, 1000004),
(1207, '2018-07-16', 'Sam William', 3, 0, 'Eftpos', 'Completed', 74.97, 1000003),
(1208, '2018-07-16', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 3.98, 1000006),
(1209, '2018-07-16', 'Sam William', 2, 0, 'Eftpos', 'Completed', 3.98, 1000006),
(1210, '2018-07-16', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 189.95, 1000001),
(1211, '2018-07-16', 'Michael Smith', 5, 0, 'Cash', 'Completed', 64.95, 1000008),
(1212, '2018-07-17', 'James Johnson', 1, 0, 'Cash', 'Completed', 4.69, 1000010),
(1213, '2018-07-17', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 9.95, 1000006),
(1214, '2018-07-17', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 1.99, 1000006),
(1215, '2018-07-18', 'James Johnson', 5, 0, 'Cash', 'Completed', 189.95, 1000001),
(1216, '2018-07-18', 'Sam William', 1, 0, 'Cash', 'Completed', 35.49, 1000007),
(1217, '2018-07-18', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 44.97, 1000004),
(1218, '2018-07-18', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1219, '2018-07-18', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 49.98, 1000009),
(1220, '2018-07-19', 'Michael Smith', 3, 0, 'Cash', 'Completed', 44.97, 1000004),
(1221, '2018-07-19', 'Sam William', 3, 0, 'Eftpos', 'Completed', 89.97, 1000002),
(1222, '2018-07-20', 'Sam William', 5, 0, 'Eftpos', 'Completed', 9.95, 1000006),
(1223, '2018-07-20', 'Sam William', 4, 0, 'Cash', 'Completed', 18.76, 1000010),
(1224, '2018-07-20', 'Sam William', 2, 0, 'Eftpos', 'Completed', 29.98, 1000004),
(1225, '2018-07-20', 'Sam William', 2, 0, 'Eftpos', 'Completed', 49.98, 1000003),
(1226, '2018-07-20', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 141.96, 1000007),
(1227, '2018-07-21', 'Sam William', 5, 0, 'Cash', 'Completed', 149.95, 1000002),
(1228, '2018-07-21', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 59.96, 1000004),
(1229, '2018-07-21', 'James Johnson', 1, 0, 'Cash', 'Completed', 24.99, 1000003),
(1230, '2018-07-22', 'Michael Smith', 4, 0, 'Cash', 'Completed', 99.96, 1000003),
(1231, '2018-07-22', 'Sam William', 3, 0, 'Cash', 'Completed', 113.97, 1000001),
(1232, '2018-07-23', 'Sam William', 5, 0, 'Eftpos', 'Completed', 189.95, 1000001),
(1233, '2018-07-23', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 5.97, 1000006),
(1234, '2018-07-23', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 35.49, 1000007),
(1235, '2018-07-23', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 59.96, 1000004),
(1236, '2018-07-24', 'Sam William', 3, 0, 'Cash', 'Completed', 113.97, 1000001),
(1237, '2018-07-24', 'Sam William', 1, 0, 'Eftpos', 'Completed', 34.99, 1000005),
(1238, '2018-07-24', 'Michael Smith', 4, 0, 'Cash', 'Completed', 51.96, 1000008),
(1239, '2018-07-24', 'Michael Smith', 4, 0, 'Cash', 'Completed', 99.96, 1000003),
(1240, '2018-07-25', 'Sam William', 2, 0, 'Credit Card', 'Completed', 69.98, 1000005),
(1241, '2018-07-25', 'James Johnson', 3, 0, 'Cash', 'Completed', 89.97, 1000002),
(1242, '2018-07-25', 'Michael Smith', 3, 0, 'Cash', 'Completed', 44.97, 1000004),
(1243, '2018-07-25', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 141.96, 1000007),
(1244, '2018-07-25', 'James Johnson', 3, 0, 'Cash', 'Completed', 106.47, 1000007),
(1245, '2018-07-26', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 49.98, 1000003),
(1246, '2018-07-26', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 174.95, 1000005),
(1247, '2018-07-26', 'Michael Smith', 4, 0, 'Cash', 'Completed', 151.96, 1000001),
(1248, '2018-07-26', 'Sam William', 3, 0, 'Eftpos', 'Completed', 38.97, 1000008),
(1249, '2018-07-26', 'Sam William', 2, 0, 'Eftpos', 'Completed', 70.98, 1000007),
(1250, '2018-07-27', 'James Johnson', 2, 0, 'Cash', 'Completed', 9.38, 1000010),
(1251, '2018-07-27', 'James Johnson', 5, 0, 'Cash', 'Completed', 124.95, 1000003),
(1252, '2018-07-27', 'Michael Smith', 4, 0, 'Cash', 'Completed', 151.96, 1000001),
(1253, '2018-07-27', 'Sam William', 4, 0, 'Eftpos', 'Completed', 141.96, 1000007),
(1254, '2018-07-27', 'Michael Smith', 3, 0, 'Cash', 'Completed', 44.97, 1000004),
(1255, '2018-07-28', 'Michael Smith', 1, 0, 'Cash', 'Completed', 24.99, 1000009),
(1256, '2018-07-28', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 4.69, 1000010),
(1257, '2018-07-28', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 151.96, 1000001),
(1258, '2018-07-28', 'Sam William', 3, 0, 'Credit Card', 'Completed', 5.97, 1000006),
(1259, '2018-07-28', 'James Johnson', 4, 0, 'Eftpos', 'Completed', 141.96, 1000007),
(1260, '2018-07-29', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 12.99, 1000008),
(1261, '2018-07-29', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1262, '2018-07-29', 'Michael Smith', 2, 0, 'Cash', 'Completed', 75.98, 1000001),
(1263, '2018-07-29', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 14.99, 1000004),
(1264, '2018-07-29', 'Michael Smith', 2, 0, 'Cash', 'Completed', 3.98, 1000006),
(1265, '2018-07-30', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 37.99, 1000001),
(1266, '2018-07-30', 'Sam William', 2, 0, 'Credit Card', 'Completed', 69.98, 1000005),
(1267, '2018-07-31', 'James Johnson', 4, 0, 'Cash', 'Completed', 151.96, 1000001),
(1268, '2018-07-31', 'Sam William', 3, 0, 'Eftpos', 'Completed', 74.97, 1000003),
(1269, '2018-08-01', 'Michael Smith', 4, 0, 'Cash', 'Completed', 59.96, 1000004),
(1270, '2018-08-01', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 74.97, 1000003),
(1271, '2018-08-01', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 1.99, 1000006),
(1272, '2018-08-01', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 14.07, 1000010),
(1273, '2018-08-02', 'Sam William', 2, 0, 'Cash', 'Completed', 59.98, 1000002),
(1274, '2018-08-02', 'James Johnson', 3, 0, 'Cash', 'Completed', 104.97, 1000005),
(1275, '2018-08-02', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 18.76, 1000010),
(1276, '2018-08-02', 'James Johnson', 2, 0, 'Cash', 'Completed', 75.98, 1000001),
(1277, '2018-08-03', 'Michael Smith', 3, 0, 'Credit Card', 'Completed', 74.97, 1000009),
(1278, '2018-08-03', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 104.97, 1000005),
(1279, '2018-08-03', 'James Johnson', 1, 0, 'Cash', 'Completed', 35.49, 1000007),
(1280, '2018-08-03', 'Michael Smith', 2, 0, 'Eftpos', 'Completed', 69.98, 1000005),
(1281, '2018-08-03', 'James Johnson', 4, 0, 'Cash', 'Completed', 51.96, 1000008),
(1282, '2018-08-04', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 70.98, 1000007),
(1283, '2018-08-04', 'Sam William', 4, 0, 'Eftpos', 'Completed', 141.96, 1000007),
(1284, '2018-08-04', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 35.49, 1000007),
(1285, '2018-08-04', 'Sam William', 1, 0, 'Credit Card', 'Completed', 12.99, 1000008),
(1286, '2018-08-04', 'Sam William', 5, 0, 'Cash', 'Completed', 174.95, 1000005),
(1287, '2018-08-05', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 9.95, 1000006),
(1288, '2018-08-05', 'James Johnson', 5, 0, 'Cash', 'Completed', 149.95, 1000002),
(1289, '2018-08-05', 'Sam William', 1, 0, 'Cash', 'Completed', 35.49, 1000007),
(1290, '2018-08-06', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 75.98, 1000001),
(1291, '2018-08-06', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 124.95, 1000009),
(1292, '2018-08-07', 'Michael Smith', 1, 0, 'Credit Card', 'Completed', 4.69, 1000010),
(1293, '2018-08-07', 'Sam William', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1294, '2018-08-07', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 124.95, 1000009),
(1295, '2018-08-07', 'James Johnson', 2, 0, 'Cash', 'Completed', 9.38, 1000010),
(1296, '2018-08-08', 'James Johnson', 4, 0, 'Eftpos', 'Completed', 18.76, 1000010),
(1297, '2018-08-08', 'James Johnson', 1, 0, 'Cash', 'Completed', 14.99, 1000004),
(1298, '2018-08-08', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 9.95, 1000006),
(1299, '2018-08-08', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 7.96, 1000006),
(1300, '2018-08-08', 'James Johnson', 4, 0, 'Cash', 'Completed', 139.96, 1000005),
(1301, '2018-08-09', 'Sam William', 4, 0, 'Cash', 'Completed', 141.96, 1000007),
(1302, '2018-08-09', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 64.95, 1000008),
(1303, '2018-08-09', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 24.99, 1000003),
(1304, '2018-08-09', 'Sam William', 2, 0, 'Eftpos', 'Completed', 69.98, 1000005),
(1305, '2018-08-10', 'James Johnson', 4, 0, 'Eftpos', 'Completed', 99.96, 1000009),
(1306, '2018-08-10', 'James Johnson', 1, 0, 'Cash', 'Completed', 14.99, 1000004),
(1307, '2018-08-10', 'Michael Smith', 4, 0, 'Credit Card', 'Completed', 7.96, 1000006),
(1308, '2018-08-10', 'James Johnson', 3, 0, 'Cash', 'Completed', 5.97, 1000006),
(1309, '2018-08-11', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 99.96, 1000003),
(1310, '2018-08-11', 'Sam William', 4, 0, 'Eftpos', 'Completed', 7.96, 1000006),
(1311, '2018-08-12', 'Sam William', 1, 0, 'Cash', 'Completed', 14.99, 1000004),
(1312, '2018-08-12', 'Michael Smith', 4, 0, 'Cash', 'Completed', 7.96, 1000006),
(1313, '2018-08-12', 'Sam William', 2, 0, 'Credit Card', 'Completed', 49.98, 1000003),
(1314, '2018-08-12', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 29.99, 1000002),
(1315, '2018-08-12', 'Michael Smith', 2, 0, 'Eftpos', 'Completed', 29.98, 1000004),
(1316, '2018-08-13', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1317, '2018-08-13', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 35.49, 1000007),
(1318, '2018-08-13', 'Sam William', 1, 0, 'Credit Card', 'Completed', 12.99, 1000008),
(1319, '2018-08-13', 'James Johnson', 4, 0, 'Eftpos', 'Completed', 99.96, 1000003),
(1320, '2018-08-14', 'Sam William', 4, 0, 'Credit Card', 'Completed', 18.76, 1000010),
(1321, '2018-08-14', 'Sam William', 5, 0, 'Eftpos', 'Completed', 9.95, 1000006),
(1322, '2018-08-15', 'Michael Smith', 5, 0, 'Cash', 'Completed', 9.95, 1000006),
(1323, '2018-08-15', 'Sam William', 1, 0, 'Credit Card', 'Completed', 29.99, 1000002),
(1324, '2018-08-15', 'Sam William', 2, 0, 'Credit Card', 'Completed', 29.98, 1000004),
(1325, '2018-08-15', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 4.69, 1000010),
(1326, '2018-08-16', 'Michael Smith', 5, 0, 'Cash', 'Completed', 174.95, 1000005),
(1327, '2018-08-16', 'Michael Smith', 1, 0, 'Credit Card', 'Completed', 14.99, 1000004),
(1328, '2018-08-16', 'James Johnson', 5, 0, 'Cash', 'Completed', 23.45, 1000010),
(1329, '2018-08-16', 'James Johnson', 5, 0, 'Cash', 'Completed', 124.95, 1000009),
(1330, '2018-08-17', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 177.45, 1000007),
(1331, '2018-08-17', 'Sam William', 1, 0, 'Cash', 'Completed', 24.99, 1000009),
(1332, '2018-08-17', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1333, '2018-08-17', 'Michael Smith', 3, 0, 'Cash', 'Completed', 74.97, 1000009),
(1334, '2018-08-18', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 75.98, 1000001),
(1335, '2018-08-18', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 38.97, 1000008),
(1336, '2018-08-18', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 49.98, 1000009),
(1337, '2018-08-18', 'Sam William', 5, 0, 'Cash', 'Completed', 74.95, 1000004),
(1338, '2018-08-18', 'Sam William', 5, 0, 'Eftpos', 'Completed', 124.95, 1000009),
(1339, '2018-08-19', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 7.96, 1000006),
(1340, '2018-08-19', 'Michael Smith', 3, 0, 'Cash', 'Completed', 74.97, 1000003),
(1341, '2018-08-19', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 14.07, 1000010),
(1342, '2018-08-20', 'Sam William', 4, 0, 'Eftpos', 'Completed', 99.96, 1000009),
(1343, '2018-08-20', 'Sam William', 4, 0, 'Eftpos', 'Completed', 151.96, 1000001),
(1344, '2018-08-20', 'James Johnson', 2, 0, 'Cash', 'Completed', 25.98, 1000008),
(1345, '2018-08-21', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1346, '2018-08-21', 'James Johnson', 2, 0, 'Cash', 'Completed', 59.98, 1000002),
(1347, '2018-08-21', 'James Johnson', 4, 0, 'Cash', 'Completed', 139.96, 1000005),
(1348, '2018-08-21', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 1.99, 1000006),
(1349, '2018-08-22', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 9.38, 1000010),
(1350, '2018-08-22', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 9.38, 1000010),
(1351, '2018-08-22', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 25.98, 1000008),
(1352, '2018-08-23', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 75.98, 1000001),
(1353, '2018-08-23', 'Sam William', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1354, '2018-08-23', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 23.45, 1000010),
(1355, '2018-08-23', 'Michael Smith', 3, 0, 'Cash', 'Completed', 38.97, 1000008),
(1356, '2018-08-23', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 177.45, 1000007),
(1357, '2018-08-24', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 9.38, 1000010),
(1358, '2018-08-24', 'Sam William', 2, 0, 'Credit Card', 'Completed', 49.98, 1000009),
(1359, '2018-08-25', 'James Johnson', 2, 0, 'Cash', 'Completed', 3.98, 1000006),
(1360, '2018-08-25', 'James Johnson', 2, 0, 'Cash', 'Completed', 49.98, 1000009),
(1361, '2018-08-25', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 89.97, 1000002),
(1362, '2018-08-25', 'Michael Smith', 3, 0, 'Cash', 'Completed', 113.97, 1000001),
(1363, '2018-08-25', 'Sam William', 5, 0, 'Credit Card', 'Completed', 149.95, 1000002),
(1364, '2018-08-26', 'Sam William', 4, 0, 'Credit Card', 'Completed', 18.76, 1000010),
(1365, '2018-08-26', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 74.97, 1000009),
(1366, '2018-08-26', 'Sam William', 4, 0, 'Cash', 'Completed', 119.96, 1000002),
(1367, '2018-08-27', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 59.98, 1000002),
(1368, '2018-08-27', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 29.98, 1000004),
(1369, '2018-08-28', 'Sam William', 5, 0, 'Eftpos', 'Completed', 149.95, 1000002),
(1370, '2018-08-28', 'James Johnson', 5, 0, 'Cash', 'Completed', 124.95, 1000009),
(1371, '2018-08-28', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 119.96, 1000002),
(1372, '2018-08-28', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1373, '2018-08-28', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 113.97, 1000001),
(1374, '2018-08-29', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 5.97, 1000006),
(1375, '2018-08-29', 'Sam William', 1, 0, 'Credit Card', 'Completed', 24.99, 1000003),
(1376, '2018-08-30', 'Sam William', 5, 0, 'Eftpos', 'Completed', 177.45, 1000007),
(1377, '2018-08-30', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 59.98, 1000002),
(1378, '2018-08-30', 'Michael Smith', 4, 0, 'Cash', 'Completed', 59.96, 1000004),
(1379, '2018-08-31', 'James Johnson', 3, 0, 'Cash', 'Completed', 38.97, 1000008),
(1380, '2018-08-31', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 113.97, 1000001),
(1381, '2018-08-31', 'Sam William', 3, 0, 'Credit Card', 'Completed', 113.97, 1000001),
(1382, '2018-09-01', 'Sam William', 5, 0, 'Credit Card', 'Completed', 149.95, 1000002),
(1383, '2018-09-01', 'James Johnson', 3, 0, 'Cash', 'Completed', 106.47, 1000007),
(1384, '2018-09-01', 'Sam William', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1385, '2018-09-02', 'James Johnson', 4, 0, 'Cash', 'Completed', 7.96, 1000006),
(1386, '2018-09-02', 'Michael Smith', 1, 0, 'Cash', 'Completed', 4.69, 1000010),
(1387, '2018-09-02', 'James Johnson', 3, 0, 'Cash', 'Completed', 5.97, 1000006),
(1388, '2018-09-03', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 24.99, 1000003),
(1389, '2018-09-03', 'Michael Smith', 2, 0, 'Cash', 'Completed', 49.98, 1000003),
(1390, '2018-09-03', 'Sam William', 3, 0, 'Credit Card', 'Completed', 106.47, 1000007),
(1391, '2018-09-04', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 139.96, 1000005),
(1392, '2018-09-04', 'Michael Smith', 2, 0, 'Cash', 'Completed', 3.98, 1000006),
(1393, '2018-09-04', 'Michael Smith', 2, 0, 'Eftpos', 'Completed', 59.98, 1000002),
(1394, '2018-09-04', 'Sam William', 2, 0, 'Credit Card', 'Completed', 3.98, 1000006),
(1395, '2018-09-05', 'James Johnson', 4, 0, 'Cash', 'Completed', 99.96, 1000009),
(1396, '2018-09-05', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 49.98, 1000009),
(1397, '2018-09-05', 'Sam William', 4, 0, 'Eftpos', 'Completed', 59.96, 1000004),
(1398, '2018-09-06', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 29.99, 1000002),
(1399, '2018-09-06', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 34.99, 1000005),
(1400, '2018-09-07', 'Sam William', 1, 0, 'Cash', 'Completed', 14.99, 1000004),
(1401, '2018-09-07', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 106.47, 1000007),
(1402, '2018-09-07', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 174.95, 1000005),
(1403, '2018-09-08', 'James Johnson', 1, 0, 'Cash', 'Completed', 29.99, 1000002),
(1404, '2018-09-08', 'Michael Smith', 1, 0, 'Cash', 'Completed', 24.99, 1000003),
(1405, '2018-09-09', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 124.95, 1000009),
(1406, '2018-09-09', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 12.99, 1000008),
(1407, '2018-09-10', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 4.69, 1000010),
(1408, '2018-09-10', 'Michael Smith', 3, 0, 'Cash', 'Completed', 14.07, 1000010),
(1409, '2018-09-10', 'James Johnson', 2, 0, 'Cash', 'Completed', 49.98, 1000009),
(1410, '2018-09-10', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 74.95, 1000004),
(1411, '2018-09-11', 'Michael Smith', 3, 0, 'Eftpos', 'Completed', 44.97, 1000004),
(1412, '2018-09-11', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 139.96, 1000005),
(1413, '2018-09-12', 'Sam William', 1, 0, 'Eftpos', 'Completed', 29.99, 1000002),
(1414, '2018-09-12', 'Sam William', 5, 0, 'Cash', 'Completed', 64.95, 1000008),
(1415, '2018-09-13', 'Sam William', 4, 0, 'Cash', 'Completed', 7.96, 1000006),
(1416, '2018-09-13', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 177.45, 1000007),
(1417, '2018-09-14', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 74.97, 1000009),
(1418, '2018-09-14', 'James Johnson', 5, 0, 'Cash', 'Completed', 9.95, 1000006),
(1419, '2018-09-14', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 74.97, 1000003),
(1420, '2018-09-15', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 74.97, 1000009),
(1421, '2018-09-15', 'Michael Smith', 1, 0, 'Cash', 'Completed', 34.99, 1000005),
(1422, '2018-09-15', 'Michael Smith', 5, 0, 'Cash', 'Completed', 124.95, 1000003),
(1423, '2018-09-16', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 1.99, 1000006),
(1424, '2018-09-16', 'James Johnson', 4, 0, 'Cash', 'Completed', 99.96, 1000009),
(1425, '2018-09-16', 'Sam William', 2, 0, 'Eftpos', 'Completed', 75.98, 1000001),
(1426, '2018-09-16', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 119.96, 1000002),
(1427, '2018-09-16', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 59.96, 1000004),
(1428, '2018-09-17', 'Sam William', 2, 0, 'Cash', 'Completed', 49.98, 1000009),
(1429, '2018-09-17', 'Michael Smith', 4, 0, 'Cash', 'Completed', 99.96, 1000009),
(1430, '2018-09-17', 'Michael Smith', 1, 0, 'Credit Card', 'Completed', 24.99, 1000003),
(1431, '2018-09-17', 'Michael Smith', 5, 0, 'Eftpos', 'Completed', 124.95, 1000009),
(1432, '2018-09-17', 'Sam William', 4, 0, 'Eftpos', 'Completed', 59.96, 1000004),
(1433, '2018-09-18', 'James Johnson', 3, 0, 'Cash', 'Completed', 113.97, 1000001),
(1434, '2018-09-18', 'Sam William', 3, 0, 'Credit Card', 'Completed', 14.07, 1000010),
(1435, '2018-09-18', 'Michael Smith', 1, 0, 'Eftpos', 'Completed', 24.99, 1000009),
(1436, '2018-09-19', 'James Johnson', 1, 0, 'Eftpos', 'Completed', 34.99, 1000005),
(1437, '2018-09-19', 'James Johnson', 5, 0, 'Cash', 'Completed', 124.95, 1000009),
(1438, '2018-09-19', 'Sam William', 3, 0, 'Cash', 'Completed', 5.97, 1000006),
(1439, '2018-09-19', 'Sam William', 4, 0, 'Cash', 'Completed', 99.96, 1000009),
(1440, '2018-09-20', 'Sam William', 5, 0, 'Cash', 'Completed', 189.95, 1000001),
(1441, '2018-09-20', 'Sam William', 3, 0, 'Cash', 'Completed', 89.97, 1000002),
(1442, '2018-09-20', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 3.98, 1000006),
(1443, '2018-09-20', 'Sam William', 2, 0, 'Cash', 'Completed', 70.98, 1000007),
(1444, '2018-09-20', 'Michael Smith', 1, 0, 'Credit Card', 'Completed', 1.99, 1000006),
(1445, '2018-09-21', 'Sam William', 2, 0, 'Credit Card', 'Completed', 29.98, 1000004),
(1446, '2018-09-21', 'Sam William', 1, 0, 'Cash', 'Completed', 24.99, 1000009),
(1447, '2018-09-21', 'Michael Smith', 4, 0, 'Eftpos', 'Completed', 51.96, 1000008),
(1448, '2018-09-22', 'James Johnson', 1, 0, 'Cash', 'Completed', 37.99, 1000001),
(1449, '2018-09-22', 'James Johnson', 3, 0, 'Credit Card', 'Completed', 113.97, 1000001),
(1450, '2018-09-22', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 29.98, 1000004),
(1451, '2018-09-22', 'Sam William', 3, 0, 'Credit Card', 'Completed', 74.97, 1000003),
(1452, '2018-09-22', 'Michael Smith', 5, 0, 'Credit Card', 'Completed', 177.45, 1000007),
(1453, '2018-09-23', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 70.98, 1000007),
(1454, '2018-09-23', 'Sam William', 5, 0, 'Eftpos', 'Completed', 174.95, 1000005),
(1455, '2018-09-24', 'James Johnson', 4, 0, 'Credit Card', 'Completed', 139.96, 1000005),
(1456, '2018-09-24', 'Sam William', 4, 0, 'Credit Card', 'Completed', 51.96, 1000008),
(1457, '2018-09-24', 'James Johnson', 4, 0, 'Cash', 'Completed', 99.96, 1000003),
(1458, '2018-09-24', 'James Johnson', 1, 0, 'Credit Card', 'Completed', 12.99, 1000008),
(1459, '2018-09-25', 'Michael Smith', 2, 0, 'Credit Card', 'Completed', 9.38, 1000010),
(1460, '2018-09-25', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 44.97, 1000004),
(1461, '2018-09-25', 'Sam William', 1, 0, 'Eftpos', 'Completed', 35.49, 1000007),
(1462, '2018-09-26', 'James Johnson', 1, 0, 'Cash', 'Completed', 4.69, 1000010),
(1463, '2018-09-26', 'Sam William', 1, 0, 'Eftpos', 'Completed', 14.99, 1000004),
(1464, '2018-09-26', 'James Johnson', 3, 0, 'Cash', 'Completed', 89.97, 1000002),
(1465, '2018-09-26', 'James Johnson', 3, 0, 'Eftpos', 'Completed', 104.97, 1000005),
(1466, '2018-09-27', 'Sam William', 2, 0, 'Credit Card', 'Completed', 25.98, 1000008),
(1467, '2018-09-27', 'Sam William', 5, 0, 'Credit Card', 'Completed', 149.95, 1000002),
(1468, '2018-09-27', 'Sam William', 2, 0, 'Cash', 'Completed', 75.98, 1000001),
(1469, '2018-09-27', 'Sam William', 1, 0, 'Eftpos', 'Completed', 34.99, 1000005),
(1470, '2018-09-28', 'Sam William', 2, 0, 'Cash', 'Completed', 75.98, 1000001),
(1471, '2018-09-28', 'James Johnson', 5, 0, 'Credit Card', 'Completed', 124.95, 1000009),
(1472, '2018-09-28', 'Michael Smith', 2, 0, 'Eftpos', 'Completed', 49.98, 1000003),
(1473, '2018-09-28', 'James Johnson', 3, 0, 'Cash', 'Completed', 89.97, 1000002),
(1474, '2018-09-28', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 49.98, 1000009),
(1475, '2018-09-29', 'Sam William', 3, 0, 'Eftpos', 'Completed', 106.47, 1000007),
(1476, '2018-09-29', 'James Johnson', 2, 0, 'Eftpos', 'Completed', 3.98, 1000006),
(1477, '2018-09-29', 'James Johnson', 2, 0, 'Credit Card', 'Completed', 75.98, 1000001),
(1478, '2018-09-29', 'Sam William', 3, 0, 'Eftpos', 'Completed', 74.97, 1000009),
(1479, '2018-09-30', 'James Johnson', 5, 0, 'Eftpos', 'Completed', 23.45, 1000010),
(1480, '2018-09-30', 'James Johnson', 4, 0, 'Cash', 'Completed', 59.96, 1000004),
(1481, '2018-09-30', 'Sam William', 1, 0, 'Eftpos', 'Completed', 35.49, 1000007),
(1482, '2018-09-30', 'Michael Smith', 5, 0, 'Cash', 'Completed', 74.95, 1000004),
(1483, '2018-09-30', 'Sam William', 5, 0, 'Cash', 'Completed', 64.95, 1000008),
(1484, '2018-10-01', 'Sam Smith', 2, 0, 'Credit Card', 'Completed', 75.98, 1000001);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES
(1, 'admin', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_stock`
--
ALTER TABLE `order_stock`
  ADD PRIMARY KEY (`orders_stock_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `product_ids` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_stock`
--
ALTER TABLE `order_stock`
  MODIFY `orders_stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000011;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1485;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_stock`
--
ALTER TABLE `order_stock`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `product_ids` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
