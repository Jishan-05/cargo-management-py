-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2024 at 06:24 AM
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
(1, 4, '9878789678', '6 narol akruti township ahmedabad\r\n');

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
(116, 'Can view feedback', 29, 'view_feedback'),
(117, 'Can add contactus', 30, 'add_contactus'),
(118, 'Can change contactus', 30, 'change_contactus'),
(119, 'Can delete contactus', 30, 'delete_contactus'),
(120, 'Can view contactus', 30, 'view_contactus'),
(121, 'Can add invoice', 31, 'add_invoice'),
(122, 'Can change invoice', 31, 'change_invoice'),
(123, 'Can delete invoice', 31, 'delete_invoice'),
(124, 'Can view invoice', 31, 'view_invoice');

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
(50, 90, 13, '2024-09-18 03:52:14', 44100.00, 'Accepted', '2024-09-18 03:51:06'),
(51, 91, 13, '2024-09-18 04:13:10', 44100.00, 'Accepted', '2024-09-18 04:13:10');

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
(1, 'Ahmedabad', '34, Om Shanti nagar-2, Narol-Vatva Road, Ahmedabad-382405', 1),
(2, 'Vadodara', '1/200, Near Vadodara railway station, Vadodara, Gujarat - 370025', 1),
(3, 'Mahesana', 'Shop no 1/2, Mehsana complex, Mehsana Highway, Gujarat - 380035', 1),
(12, 'Surat', '567, keem chokdi surat 394500', 1),
(15, 'junagadh', '78 gopal apartment junagadh 357700', 1);

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

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`Id`, `Name`, `Email`, `PhoneNumber`, `Message`) VALUES
(3, 'jishan', 'jisha0786@gmail.com', '9714353300', 'c vb  v'),
(4, 'ahmedabad', 'jig78@gmail.com', '9714353300', 'x cvbfn'),
(5, 'fdgh', 'jig78@gmail.com', '9876786787', 'gfnbh v chyj n'),
(6, 'ji', '', '', ''),
(7, 'jishan', 'jishan2@gmail.com', '9714353300', 'i want to send parcel'),
(8, 'jishan', 'jishan2@gmail.com', '9714353300', 'i want to send parcel');

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
(1, 'India');

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
(6, 10, '8765678987', '67 bgh road near hirawadi  circle ahmedabad'),
(13, 23, '9876567894', 'c 909 vatva ahmedabad');

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
(3, 1, 2, 110.00),
(4, 2, 1, 110.00),
(16, 1, 12, 111.00),
(18, 12, 3, 111.00),
(21, 12, 1, 111.00),
(22, 3, 12, 111.00);

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
(30, 'system', 'contactus'),
(10, 'system', 'country'),
(11, 'system', 'customer'),
(12, 'system', 'deliveryroute'),
(25, 'system', 'djangoadminlog'),
(26, 'system', 'djangocontenttype'),
(27, 'system', 'djangomigrations'),
(28, 'system', 'djangosession'),
(13, 'system', 'employee'),
(29, 'system', 'feedback'),
(31, 'system', 'invoice'),
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
(21, 'system', '0003_feedback', '2024-09-05 07:14:05.035747'),
(22, 'system', '0004_contactus_invoice', '2024-09-12 19:18:46.587482');

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
('ai09gz0q6ia6tt6wj1k2qieclvq43jv6', 'eyJ1c2VyX2lkIjo4fQ:1soObe:0DRTy6hEw08XrPqBTahq0ljPecvjde1z76ImFcv6afI', '2024-09-25 14:46:06.360506'),
('cksasly8r3hd7iaql2sgw6h4l2d9ls7c', 'eyJ1c2VyX2lkIjo4fQ:1spKq8:C8Myoca8emO3WrS3mnsTGF-XXCFOL2vg8THW_lwLRbk', '2024-09-28 04:56:56.965737'),
('nvv6rv9f0z3nf8cx7axjv86df6krsyui', 'eyJ1c2VyX2lkIjo3fQ:1sljFU:C55sq-Nbar0NgpP8Gs9B8elSb4vhBBbP9jlH4Zl_UYc', '2024-09-18 06:12:12.946779'),
('sf0h5on892qere2wk0cwpes1v5eig4zo', 'eyJ1c2VyX2lkIjo0fQ:1sqljZ:sFwBiwzAkb85GB5ZwzNA9mwyWyXLfhbMw-4UMtO9oCs', '2024-10-02 03:52:05.670519'),
('uproobyci9s9enukrukzgoqwnt8azwic', 'eyJ1c2VyX2lkIjo4fQ:1sqQN0:yU2Y4Or5tbEUD_eWM2-OfkXFQmkr24YQd9reuBXF9p0', '2024-10-01 05:03:22.438883'),
('urhu8z40ldmeuwwmj3m6l0a5hw2al6jv', '.eJwdyEsKgCAQANC7zFpDS1O7jPiZYogi1FbR3ZPe8j2AtdERGmZ_FUoIi1JSiEEwuCsWTxmWcWLQSkg7ndsfoFY5pxiQW4eZqxgMj9pqrnujM9b0gfcDeKkcUA:1sqlic:Med8U4DqpPDLroZU66Lx-qKq2Ry_hpsylvbwARJuUCE', '2024-10-02 03:51:06.911598'),
('ux3gxv0jj0gc6xzvsoepnxk7w1zrtzx7', 'eyJ1c2VyX2lkIjoyMn0:1sqlxF:0sII-kkQZQUPTbdTOGRVkWwEPTeT9HIqmrNizYTNUu0', '2024-10-02 04:06:13.745284'),
('vnoumxe5obpa8pacz1o7jcv8dhf4d5zv', 'eyJ1c2VyX2lkIjo0fQ:1skVqX:hhyOq3Fk0sRrtllFqIuIzJAw8rBp5_IkaKJwC402WLU', '2024-09-14 21:41:25.463552'),
('ypbjuy6zwfbew895gb0b9x6el40yhkzd', 'eyJ1c2VyX2lkIjo4fQ:1sp5bL:5MCQbDJvZccdrHIPl5f8wSBeSD3xCrx-PzHYsz-nMIo', '2024-09-27 12:40:39.916757');

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
(11, 22, '9876788760', 'driver', 'c 78 rt colony ahmedabad ');

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
(25, 13, 'thanks for delivery', '2024-09-18 03:53:39');

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
(43, '2024-09-18', 'Danish Shaikh', 'Ahmedabad to Vadodara', '44100.00', 50),
(44, '2024-09-18', 'Danish Shaikh', 'Ahmedabad to Vadodara', '44100.0000', 51);

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
(90, '4f16cbae-89ed-4ba7-b585-516ce9787ba7', 13, 'large', 1, 2, NULL, NULL, NULL, NULL, 44100.00, 'Delivered', '2024-09-18 03:51:06', '2024-09-18 03:53:23'),
(91, 'ce468368-97cf-4e8a-98ea-b13ba33f4da8', 13, 'large', 1, 2, NULL, NULL, NULL, NULL, 44100.00, 'Delivered', '2024-09-18 04:13:10', '2024-09-18 04:13:59');

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
(184, 90, 'Payment accepted', 4, '2024-09-18 03:52:14'),
(185, 90, 'Parcel arrived at Ahmedabad', 4, '2024-09-18 03:52:14'),
(186, 90, 'In Transit', 4, '2024-09-18 03:53:00'),
(187, 90, 'Parcel arrived at Vadodara', 4, '2024-09-18 03:53:13'),
(188, 90, 'Parcel delivered from Vadodara', 4, '2024-09-18 03:53:23'),
(189, 91, 'Payment accepted', 22, '2024-09-18 04:13:10'),
(190, 91, 'Parcel arrived at Ahmedabad', 22, '2024-09-18 04:13:10'),
(191, 91, 'In Transit', 22, '2024-09-18 04:13:36'),
(192, 91, 'Parcel arrived at Vadodara', 22, '2024-09-18 04:13:53'),
(193, 91, 'Parcel delivered from Vadodara', 22, '2024-09-18 04:13:59');

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
(1, 100.00, 100.00, 100.00, '2024-08-31 08:06:27', '2024-09-05 19:48:28');

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
(1, 'Gujarat', 1);

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
(3, 'jishan', 'mj7890', 'jisha0786@gmail.com', 'Mansuri', 'Jishan', 'Customer', '2024-08-03 00:36:00'),
(4, 'Monit Dube', '@monit123', 'monit123@gmail.com', 'Monit ', 'Dube', 'Admin', '2024-09-01 16:06:46'),
(5, 'faizan', 'fz4567', 'faizan23@gmail.com', 'Mansuri', 'Faizan', 'Customer', '2024-09-09 16:06:54'),
(10, 'punit', 'punpun789', 'punpk90@gmail.om', 'punit', 'pathak', 'Customer', '2024-08-31 20:36:07'),
(22, 'jigness', 'jigjig1010', 'jig78@gmail.com', 'jignes', 'panchal', 'Employee', '2024-09-17 11:31:48'),
(23, 'Danish', 'pbkdf2_sha256$870000$8DwmYs6O27GHfMolYd3rDZ$7nrOStEorHqX9fNHsSMU5ihX68wUmN4V9cD9pX76NUE=', 'danis34@gmail.com', 'Danish', 'Shaikh', 'Customer', '2024-09-18 03:42:52');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `deliveryroute`
--
ALTER TABLE `deliveryroute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `parcel`
--
ALTER TABLE `parcel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `parcelstatus`
--
ALTER TABLE `parcelstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
