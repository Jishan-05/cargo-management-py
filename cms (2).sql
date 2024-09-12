-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2024 at 06:45 PM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user_id`, `phone_number`, `address`) VALUES
(1, 4, '9878789890', '6 vv dd cdfvdf dff');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add admin', 7, 'add_admin'),
(26, 'Can change admin', 7, 'change_admin'),
(27, 'Can delete admin', 7, 'delete_admin'),
(28, 'Can view admin', 7, 'view_admin'),
(29, 'Can add booking', 8, 'add_booking'),
(30, 'Can change booking', 8, 'change_booking'),
(31, 'Can delete booking', 8, 'delete_booking'),
(32, 'Can view booking', 8, 'view_booking'),
(33, 'Can add city', 9, 'add_city'),
(34, 'Can change city', 9, 'change_city'),
(35, 'Can delete city', 9, 'delete_city'),
(36, 'Can view city', 9, 'view_city'),
(37, 'Can add country', 10, 'add_country'),
(38, 'Can change country', 10, 'change_country'),
(39, 'Can delete country', 10, 'delete_country'),
(40, 'Can view country', 10, 'view_country'),
(41, 'Can add customer', 11, 'add_customer'),
(42, 'Can change customer', 11, 'change_customer'),
(43, 'Can delete customer', 11, 'delete_customer'),
(44, 'Can view customer', 11, 'view_customer'),
(45, 'Can add deliveryroute', 12, 'add_deliveryroute'),
(46, 'Can change deliveryroute', 12, 'change_deliveryroute'),
(47, 'Can delete deliveryroute', 12, 'delete_deliveryroute'),
(48, 'Can view deliveryroute', 12, 'view_deliveryroute'),
(49, 'Can add employee', 13, 'add_employee'),
(50, 'Can change employee', 13, 'change_employee'),
(51, 'Can delete employee', 13, 'delete_employee'),
(52, 'Can view employee', 13, 'view_employee'),
(53, 'Can add parcel', 14, 'add_parcel'),
(54, 'Can change parcel', 14, 'change_parcel'),
(55, 'Can delete parcel', 14, 'delete_parcel'),
(56, 'Can view parcel', 14, 'view_parcel'),
(57, 'Can add parcelstatus', 15, 'add_parcelstatus'),
(58, 'Can change parcelstatus', 15, 'change_parcelstatus'),
(59, 'Can delete parcelstatus', 15, 'delete_parcelstatus'),
(60, 'Can view parcelstatus', 15, 'view_parcelstatus'),
(61, 'Can add pricing', 16, 'add_pricing'),
(62, 'Can change pricing', 16, 'change_pricing'),
(63, 'Can delete pricing', 16, 'delete_pricing'),
(64, 'Can view pricing', 16, 'view_pricing'),
(65, 'Can add state', 17, 'add_state'),
(66, 'Can change state', 17, 'change_state'),
(67, 'Can delete state', 17, 'delete_state'),
(68, 'Can view state', 17, 'view_state'),
(69, 'Can add user', 18, 'add_user'),
(70, 'Can change user', 18, 'change_user'),
(71, 'Can delete user', 18, 'delete_user'),
(72, 'Can view user', 18, 'view_user'),
(73, 'Can add auth group', 19, 'add_authgroup'),
(74, 'Can change auth group', 19, 'change_authgroup'),
(75, 'Can delete auth group', 19, 'delete_authgroup'),
(76, 'Can view auth group', 19, 'view_authgroup'),
(77, 'Can add auth group permissions', 20, 'add_authgrouppermissions'),
(78, 'Can change auth group permissions', 20, 'change_authgrouppermissions'),
(79, 'Can delete auth group permissions', 20, 'delete_authgrouppermissions'),
(80, 'Can view auth group permissions', 20, 'view_authgrouppermissions'),
(81, 'Can add auth permission', 21, 'add_authpermission'),
(82, 'Can change auth permission', 21, 'change_authpermission'),
(83, 'Can delete auth permission', 21, 'delete_authpermission'),
(84, 'Can view auth permission', 21, 'view_authpermission'),
(85, 'Can add auth user', 22, 'add_authuser'),
(86, 'Can change auth user', 22, 'change_authuser'),
(87, 'Can delete auth user', 22, 'delete_authuser'),
(88, 'Can view auth user', 22, 'view_authuser'),
(89, 'Can add auth user groups', 23, 'add_authusergroups'),
(90, 'Can change auth user groups', 23, 'change_authusergroups'),
(91, 'Can delete auth user groups', 23, 'delete_authusergroups'),
(92, 'Can view auth user groups', 23, 'view_authusergroups'),
(93, 'Can add auth user user permissions', 24, 'add_authuseruserpermissions'),
(94, 'Can change auth user user permissions', 24, 'change_authuseruserpermissions'),
(95, 'Can delete auth user user permissions', 24, 'delete_authuseruserpermissions'),
(96, 'Can view auth user user permissions', 24, 'view_authuseruserpermissions'),
(97, 'Can add django admin log', 25, 'add_djangoadminlog'),
(98, 'Can change django admin log', 25, 'change_djangoadminlog'),
(99, 'Can delete django admin log', 25, 'delete_djangoadminlog'),
(100, 'Can view django admin log', 25, 'view_djangoadminlog'),
(101, 'Can add django content type', 26, 'add_djangocontenttype'),
(102, 'Can change django content type', 26, 'change_djangocontenttype'),
(103, 'Can delete django content type', 26, 'delete_djangocontenttype'),
(104, 'Can view django content type', 26, 'view_djangocontenttype'),
(105, 'Can add django migrations', 27, 'add_djangomigrations'),
(106, 'Can change django migrations', 27, 'change_djangomigrations'),
(107, 'Can delete django migrations', 27, 'delete_djangomigrations'),
(108, 'Can view django migrations', 27, 'view_djangomigrations'),
(109, 'Can add django session', 28, 'add_djangosession'),
(110, 'Can change django session', 28, 'change_djangosession'),
(111, 'Can delete django session', 28, 'delete_djangosession'),
(112, 'Can view django session', 28, 'view_djangosession'),
(113, 'Can add feedback', 29, 'add_feedback'),
(114, 'Can change feedback', 29, 'change_feedback'),
(115, 'Can delete feedback', 29, 'delete_feedback'),
(116, 'Can view feedback', 29, 'view_feedback');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `parcel_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT current_timestamp(),
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_status` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `parcel_id`, `customer_id`, `booking_date`, `amount_paid`, `payment_status`, `created_at`) VALUES
(5, 45, 4, '2024-09-12 14:07:32', 77500.00, 'Accepted', '2024-09-12 14:03:58'),
(6, 46, 4, '2024-09-12 14:07:38', 77500.00, 'Accepted', '2024-09-12 14:04:12'),
(7, 47, 4, '2024-09-12 15:29:23', 77500.00, 'Accepted', '2024-09-12 15:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `Address`, `state_id`) VALUES
(1, 'Ahmedabad', '12, Mangal Murti Complex, Kalupur, AHmedabad - 380024', 1),
(2, 'Vadodara', '1/200, Near Vadodara railway station, Vadodara, Gujarat - 370025', 1),
(3, 'Mahesana', 'Shop no 1/2, Mehsana complex, Mehsana Highway, Gujarat - 380035', 1),
(11, 'Mumbai', '56 all india colony ahmedabad', 3),
(12, 'Surat', '567, keem chokdi surat 394500', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'India'),
(5, 'Indonesia'),
(8, 'japan'),
(9, 'Russia');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `user_id`, `phone_number`, `address`) VALUES
(1, 3, '9714353300', 'c 58 al hanifiya park vatva ahmedabad'),
(2, 5, '9767895678', 'b 67 abc park near xyz arcade bapunagar ahmedabad'),
(3, 7, '9876567899', '34 rty apartment biok '),
(4, 8, '9876567894', 'f 78  fgg ghgn  gnn'),
(5, 9, '9876567894', '78 bhg vvvvv vvvvv '),
(6, 10, '8765678987', '67 bgh road near hirawadi  circle ahmedabad'),
(7, 11, '5678998765', 'g bg hnhn bbgb'),
(8, NULL, '8765678765', ''),
(9, 15, '9876787676', 'c 676  ffb bffv fb ');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryroute`
--

CREATE TABLE `deliveryroute` (
  `id` int(11) NOT NULL,
  `from_city_id` int(11) DEFAULT NULL,
  `to_city_id` int(11) DEFAULT NULL,
  `distance_km` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveryroute`
--

INSERT INTO `deliveryroute` (`id`, `from_city_id`, `to_city_id`, `distance_km`) VALUES
(2, 3, 1, 78.00),
(3, 1, 2, 110.00),
(4, 2, 1, 110.00),
(5, 2, 3, 130.00);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'system', 'admin'),
(19, 'system', 'authgroup'),
(20, 'system', 'authgrouppermissions'),
(21, 'system', 'authpermission'),
(22, 'system', 'authuser'),
(23, 'system', 'authusergroups'),
(24, 'system', 'authuseruserpermissions'),
(8, 'system', 'booking'),
(9, 'system', 'city'),
(10, 'system', 'country'),
(11, 'system', 'customer'),
(12, 'system', 'deliveryroute'),
(25, 'system', 'djangoadminlog'),
(26, 'system', 'djangocontenttype'),
(27, 'system', 'djangomigrations'),
(28, 'system', 'djangosession'),
(13, 'system', 'employee'),
(29, 'system', 'feedback'),
(14, 'system', 'parcel'),
(15, 'system', 'parcelstatus'),
(16, 'system', 'pricing'),
(17, 'system', 'state'),
(18, 'system', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-30 16:36:19.130053'),
(2, 'auth', '0001_initial', '2024-08-30 16:36:20.195296'),
(3, 'admin', '0001_initial', '2024-08-30 16:36:20.380409'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-30 16:36:20.393380'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-30 16:36:20.435801'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-30 16:36:20.566391'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-30 16:36:20.642950'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-30 16:36:20.691382'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-30 16:36:20.704369'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-30 16:36:20.850971'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-30 16:36:20.855867'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-30 16:36:20.874229'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-30 16:36:20.928039'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-30 16:36:20.986391'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-30 16:36:21.042850'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-30 16:36:21.054252'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-30 16:36:21.103713'),
(18, 'sessions', '0001_initial', '2024-08-30 16:36:21.184602'),
(19, 'system', '0001_initial', '2024-08-30 16:36:21.200267'),
(20, 'system', '0002_authgroup_authgrouppermissions_authpermission_and_more', '2024-08-30 17:21:21.124488'),
(21, 'system', '0003_feedback', '2024-09-05 07:14:05.035747');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6org9yavp9f0pb1eq4eat97dtio563xg', 'eyJ1c2VyX2lkIjo0fQ:1sol1W:5aJLDR4xO7izZfkyM2bJ0jP1wO1HF7MXp6aJwvei3F4', '2024-09-26 14:42:18.476611'),
('ai09gz0q6ia6tt6wj1k2qieclvq43jv6', 'eyJ1c2VyX2lkIjo4fQ:1soObe:0DRTy6hEw08XrPqBTahq0ljPecvjde1z76ImFcv6afI', '2024-09-25 14:46:06.360506'),
('ita6kvb7x2x3f2fy1h1m94bjyekgphjg', 'eyJ1c2VyX2lkIjo4fQ:1sokTZ:Agr5pv5qIDygxP9S3DIT-rZjCiEhy8rap0hO2X-ySLY', '2024-09-26 14:07:13.781246'),
('nvv6rv9f0z3nf8cx7axjv86df6krsyui', 'eyJ1c2VyX2lkIjo3fQ:1sljFU:C55sq-Nbar0NgpP8Gs9B8elSb4vhBBbP9jlH4Zl_UYc', '2024-09-18 06:12:12.946779'),
('vnoumxe5obpa8pacz1o7jcv8dhf4d5zv', 'eyJ1c2VyX2lkIjo0fQ:1skVqX:hhyOq3Fk0sRrtllFqIuIzJAw8rBp5_IkaKJwC402WLU', '2024-09-14 21:41:25.463552');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `user_id`, `phone_number`, `position`, `address`) VALUES
(1, 12, '67976546789', 'manager', 'a 67 nr ty hall '),
(2, 10, NULL, 'driver', ''),
(6, 13, '6789876709', 'manager', '');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `feedback_text` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `createdby`, `feedback_text`, `created_at`) VALUES
(1, 1, 'good service\r\n', '2024-09-05 07:28:51'),
(9, 2, 'impressive work', '2024-09-05 11:20:10'),
(15, NULL, 'yujhj', '2024-09-10 14:22:20'),
(16, 4, 'fd', '2024-09-10 14:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Id` int(11) NOT NULL,
  `CreatedOn` date NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Price` varchar(255) NOT NULL,
  `BookingId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Id`, `CreatedOn`, `CustomerName`, `Description`, `Price`, `BookingId`) VALUES
(2, '2024-09-12', 'Danish Shaikh', 'Ahmedabad to Vadodara', '77500.00', 5),
(3, '2024-09-12', 'Danish Shaikh', 'Ahmedabad to Vadodara', '77500.00', 6),
(4, '2024-09-12', 'Danish Shaikh', 'Ahmedabad to Vadodara', '77500.00', 7);

-- --------------------------------------------------------

--
-- Table structure for table `parcel`
--

CREATE TABLE `parcel` (
  `id` int(11) NOT NULL,
  `tracking_id` varchar(255) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `parcel_type` varchar(100) NOT NULL,
  `from_city_id` int(11) DEFAULT NULL,
  `to_city_id` int(11) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcel`
--

INSERT INTO `parcel` (`id`, `tracking_id`, `customer_id`, `parcel_type`, `from_city_id`, `to_city_id`, `weight`, `height`, `length`, `width`, `price`, `status`, `created_at`, `updated_at`) VALUES
(45, 'dbb76a25-c6d6-454f-9307-b65a1a57e623', 4, 'small', 1, 2, NULL, NULL, NULL, NULL, 77500.00, 'In Transit', '2024-09-12 14:03:58', '2024-09-12 15:26:46'),
(46, '70dc5573-a588-4398-8494-17c86501e941', 4, 'medium', 1, 2, NULL, NULL, NULL, NULL, 77500.00, 'Booked', '2024-09-12 14:04:12', '2024-09-12 14:07:38'),
(47, 'e55209c9-eafa-42d7-b5e7-e54fab0326dc', 4, 'small', 1, 2, NULL, NULL, NULL, NULL, 77500.00, 'Arrived', '2024-09-12 15:24:39', '2024-09-12 15:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `parcelstatus`
--

CREATE TABLE `parcelstatus` (
  `id` int(11) NOT NULL,
  `parcel_id` int(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `updated_by_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcelstatus`
--

INSERT INTO `parcelstatus` (`id`, `parcel_id`, `status`, `updated_by_user_id`, `updated_at`) VALUES
(14, 45, 'Payment accepted', 4, '2024-09-12 14:07:32'),
(15, 45, 'Parcel arrived at Ahmedabad', 4, '2024-09-12 14:07:32'),
(16, 46, 'Payment accepted', 4, '2024-09-12 14:07:38'),
(17, 46, 'Parcel arrived at Ahmedabad', 4, '2024-09-12 14:07:38'),
(18, 45, 'In Transit', 4, '2024-09-12 15:26:46'),
(19, 47, 'Payment accepted', 4, '2024-09-12 15:29:23'),
(20, 47, 'Parcel arrived at Ahmedabad', 4, '2024-09-12 15:29:23'),
(21, 47, 'In Transit', 4, '2024-09-12 15:29:42'),
(22, 47, 'Parcel arrived at Vadodara', 4, '2024-09-12 15:29:43'),
(23, 47, 'Parcel arrived at Vadodara', 4, '2024-09-12 15:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `id` int(11) NOT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `price_per_km` decimal(10,2) DEFAULT NULL,
  `price_per_kg` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `base_price`, `price_per_km`, `price_per_kg`, `created_at`, `updated_at`) VALUES
(1, 100.00, 100.00, 100.00, '2024-08-31 08:06:27', '2024-09-05 19:48:28'),
(3, 500.00, 700.00, 678.00, '2024-09-01 14:29:56', '2024-09-01 14:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `name`, `country_id`) VALUES
(1, 'Gujarat', 1),
(2, 'Rajesthan', 1),
(3, 'Maharashtra', 1),
(4, 'Punjab', 1),
(9, 'Himachal Pradesh', 1),
(10, 'Uttarakhand', 1),
(11, 'Tamilnadu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Employee','Customer') NOT NULL,
  `date_joined` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `first_name`, `last_name`, `role`, `date_joined`) VALUES
(2, 'Rohit', '@rohit345', 'rohitmehra12@gmail.com', 'Rohit', 'randeria', 'Employee', '2024-08-04 16:06:35'),
(3, 'jishan', 'mj7890', 'jisha0786@gmail.com', 'Mansuri', 'Jishan', 'Customer', '2024-08-03 00:36:00'),
(4, 'Monit Dube', '@monit123', 'monit123@gmail.com', 'Monit', 'Dube', 'Admin', '2024-09-01 16:06:46'),
(5, 'faizan', 'fz4567', 'faizan23@gmail.com', 'Mansuri', 'Faizan', 'Customer', '2024-09-09 16:06:54'),
(6, 'akshay', 'ak4747', 'ak78@gmail.com', 'Akshay ', 'panchal', 'Employee', '2024-09-01 16:06:59'),
(7, 'Tejas Parmar', 'pbkdf2_sha256$870000$EHhNDQ2yxdQLoAJVXfZUMm$Vp+3J2n5eXn2XcSof7dzAWiRm0t22yaIYhlKohrp4S8=', 'tej67@gmail.com', 'Tejas', 'Parmar', 'Customer', '2024-09-01 16:07:03'),
(8, 'Danish', 'pbkdf2_sha256$870000$HaS8UWzhCZ6KXbZCgqMLRU$w0cd627RHw1oe/kf9qOKnicIxONwBO1NVHwbw/A4ui4=', 'danis34@gmail.com', 'Danish', 'Shaikh', 'Customer', '2024-08-14 21:35:00'),
(9, 'harry', 'pbkdf2_sha256$870000$3M7RubYjqlPpMTKFrl5Ax5$bW7Sahvu0HnoLCu7O6lZd3CsUZZXwuIYYe81Qg3RzbE=', 'harry67@gmail.com', 'harry', 'patel', 'Customer', '2024-08-31 20:28:36'),
(10, 'punit', 'punpun789', 'punpk90@gmail.om', 'punit', 'pathak', 'Customer', '2024-08-31 20:36:07'),
(11, 'manan', 'pbkdf2_sha256$870000$wNyEqMSx0XqJqAECkwpabD$va2WwggOXzsOaQNydbQSaj9z3ByO3OZAuakApXBXZmk=', 'manak6@gmail.com', 'manan', 'kolate', 'Customer', '2024-08-31 20:49:14'),
(12, 'jignesss', 'jigjig00', 'jig78@gmail.com', 'jignesss', 'patel', 'Employee', '2024-08-31 21:34:08'),
(13, 'rohan', 'rohan7890', 'rk092@gmail.com', 'rohan', 'kumar', 'Employee', '2024-09-01 17:38:13'),
(14, 'amaan', 'amn789amn789', 'amaan78@gmail.com', 'amaan', 'ansari', 'Employee', '2024-09-02 05:52:45'),
(15, 'Darshan', 'pbkdf2_sha256$870000$oyQ8lAY31jp3tkrRYlborI$l9qMHdzS5hrEYP/dSbAo4J7ya8mwU124SwkkGz+2rEQ=', 'darashan56@gmail.com', 'Darshan', 'panchal', 'Customer', '2024-09-08 07:16:26'),
(16, 'Afzal', 'Admin@123', 'afzal@gmail.com', 'Afzal', 'Mansuri', 'Employee', '2024-09-12 16:15:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_ibfk_1` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_ibfk_1` (`parcel_id`),
  ADD KEY `booking_ibfk_2` (`customer_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_ibfk_1` (`state_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_ibfk_1` (`user_id`);

--
-- Indexes for table `deliveryroute`
--
ALTER TABLE `deliveryroute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveryroute_ibfk_1` (`from_city_id`),
  ADD KEY `deliveryroute_ibfk_2` (`to_city_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_ibfk_1` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_ibfk_1` (`createdby`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Invoice_Booking` (`BookingId`);

--
-- Indexes for table `parcel`
--
ALTER TABLE `parcel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_id` (`tracking_id`),
  ADD KEY `parcel_ibfk_1` (`customer_id`),
  ADD KEY `parcel_ibfk_2` (`from_city_id`),
  ADD KEY `parcel_ibfk_3` (`to_city_id`);

--
-- Indexes for table `parcelstatus`
--
ALTER TABLE `parcelstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parcelstatus_ibfk_1` (`parcel_id`),
  ADD KEY `parcelstatus_ibfk_2` (`updated_by_user_id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_ibfk_1` (`country_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `deliveryroute`
--
ALTER TABLE `deliveryroute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parcel`
--
ALTER TABLE `parcel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `parcelstatus`
--
ALTER TABLE `parcelstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`parcel_id`) REFERENCES `parcel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deliveryroute`
--
ALTER TABLE `deliveryroute`
  ADD CONSTRAINT `deliveryroute_ibfk_1` FOREIGN KEY (`from_city_id`) REFERENCES `city` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveryroute_ibfk_2` FOREIGN KEY (`to_city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FK_Invoice_Booking` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parcel`
--
ALTER TABLE `parcel`
  ADD CONSTRAINT `parcel_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcel_ibfk_2` FOREIGN KEY (`from_city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcel_ibfk_3` FOREIGN KEY (`to_city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parcelstatus`
--
ALTER TABLE `parcelstatus`
  ADD CONSTRAINT `parcelstatus_ibfk_1` FOREIGN KEY (`parcel_id`) REFERENCES `parcel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parcelstatus_ibfk_2` FOREIGN KEY (`updated_by_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
