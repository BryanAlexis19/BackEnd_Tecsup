-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-11-2021 a las 22:15:55
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemapos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCategorias` ()  BEGIN
SELECT *
FROM tbl_categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCategoriaById` (IN `id` INT)  BEGIN
SELECT *
FROM tbl_categoria
where categoria_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlatoByCategoria` (IN `catId` INT)  BEGIN SELECT * FROM tbl_plato where categoria_id = catId; END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add cargo', 1, 'add_cargo'),
(2, 'Can change cargo', 1, 'change_cargo'),
(3, 'Can delete cargo', 1, 'delete_cargo'),
(4, 'Can view cargo', 1, 'view_cargo'),
(5, 'Can add categoria', 2, 'add_categoria'),
(6, 'Can change categoria', 2, 'change_categoria'),
(7, 'Can delete categoria', 2, 'delete_categoria'),
(8, 'Can view categoria', 2, 'view_categoria'),
(9, 'Can add empleado', 3, 'add_empleado'),
(10, 'Can change empleado', 3, 'change_empleado'),
(11, 'Can delete empleado', 3, 'delete_empleado'),
(12, 'Can view empleado', 3, 'view_empleado'),
(13, 'Can add mesa', 4, 'add_mesa'),
(14, 'Can change mesa', 4, 'change_mesa'),
(15, 'Can delete mesa', 4, 'delete_mesa'),
(16, 'Can view mesa', 4, 'view_mesa'),
(17, 'Can add pedido', 5, 'add_pedido'),
(18, 'Can change pedido', 5, 'change_pedido'),
(19, 'Can delete pedido', 5, 'delete_pedido'),
(20, 'Can view pedido', 5, 'view_pedido'),
(21, 'Can add plato', 6, 'add_plato'),
(22, 'Can change plato', 6, 'change_plato'),
(23, 'Can delete plato', 6, 'delete_plato'),
(24, 'Can view plato', 6, 'view_plato'),
(25, 'Can add plato pedido', 7, 'add_platopedido'),
(26, 'Can change plato pedido', 7, 'change_platopedido'),
(27, 'Can delete plato pedido', 7, 'delete_platopedido'),
(28, 'Can view plato pedido', 7, 'view_platopedido'),
(29, 'Can add log entry', 8, 'add_logentry'),
(30, 'Can change log entry', 8, 'change_logentry'),
(31, 'Can delete log entry', 8, 'delete_logentry'),
(32, 'Can view log entry', 8, 'view_logentry'),
(33, 'Can add permission', 9, 'add_permission'),
(34, 'Can change permission', 9, 'change_permission'),
(35, 'Can delete permission', 9, 'delete_permission'),
(36, 'Can view permission', 9, 'view_permission'),
(37, 'Can add group', 10, 'add_group'),
(38, 'Can change group', 10, 'change_group'),
(39, 'Can delete group', 10, 'delete_group'),
(40, 'Can view group', 10, 'view_group'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add content type', 12, 'add_contenttype'),
(46, 'Can change content type', 12, 'change_contenttype'),
(47, 'Can delete content type', 12, 'delete_contenttype'),
(48, 'Can view content type', 12, 'view_contenttype'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$PngEDLYYQeIcBM2u5t7m51$bqfn2tVNOEmlQvI4iIKobDy0STqyrOKVm7qTpVIP8/k=', '2021-11-04 05:15:30.016775', 1, 'admin', '', '', 'librale19@gmail.com', 1, 1, '2021-11-04 05:15:04.974987'),
(3, 'pbkdf2_sha256$260000$u1woaI5l6gWHPr0Oy3UdMV$dlBz+U7nDB4VhLkUl9B7H/kb9OE45kIR/yd03vPsrKY=', NULL, 0, 'mozo1', '', '', '', 0, 1, '2021-11-05 02:11:57.961219');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-11-04 05:15:49.231575', '1', 'ENTRADAS', 1, '[{\"added\": {}}]', 2, 1),
(2, '2021-11-04 05:15:55.906301', '2', 'PLATOS DE FONDO', 1, '[{\"added\": {}}]', 2, 1),
(3, '2021-11-04 05:16:00.661040', '3', 'POSTRES', 1, '[{\"added\": {}}]', 2, 1),
(4, '2021-11-04 05:16:25.051200', '1', 'Mozo', 1, '[{\"added\": {}}]', 1, 1),
(5, '2021-11-04 05:17:03.832646', '1', 'Mesa object (1)', 1, '[{\"added\": {}}]', 4, 1),
(6, '2021-11-04 05:19:16.662560', '5', 'Bryan', 1, '[{\"added\": {}}]', 3, 1),
(7, '2021-11-04 05:19:26.396241', '2', '2', 1, '[{\"added\": {}}]', 4, 1),
(8, '2021-11-04 05:19:32.270372', '3', '3', 1, '[{\"added\": {}}]', 4, 1),
(9, '2021-11-04 05:35:48.057071', '1', 'Causa', 1, '[{\"added\": {}}]', 6, 1),
(10, '2021-11-04 21:56:46.432929', '4', 'Bebidas', 1, '[{\"added\": {}}]', 2, 1),
(11, '2021-11-04 21:56:52.958395', '4', 'BEBIDAS', 2, '[{\"changed\": {\"fields\": [\"Categoria nom\"]}}]', 2, 1),
(12, '2021-11-04 21:57:18.030159', '2', 'Lomo saltado', 1, '[{\"added\": {}}]', 6, 1),
(13, '2021-11-04 21:57:40.645092', '3', 'Cerveza Personal', 1, '[{\"added\": {}}]', 6, 1),
(14, '2021-11-04 21:58:30.560751', '4', 'Arroz con Leche', 1, '[{\"added\": {}}]', 6, 1),
(15, '2021-11-04 22:20:49.047310', '5', 'Aji de Gallina', 1, '[{\"added\": {}}]', 6, 1),
(16, '2021-11-05 02:08:03.119527', '2', 'Mozo1', 1, '[{\"added\": {}}]', 11, 1),
(17, '2021-11-05 02:11:34.900558', '2', 'Mozo1', 3, '', 11, 1),
(18, '2021-11-05 02:11:58.014467', '3', 'mozo1', 1, '[{\"added\": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'admin', 'logentry'),
(1, 'app', 'cargo'),
(2, 'app', 'categoria'),
(3, 'app', 'empleado'),
(4, 'app', 'mesa'),
(5, 'app', 'pedido'),
(6, 'app', 'plato'),
(7, 'app', 'platopedido'),
(10, 'auth', 'group'),
(9, 'auth', 'permission'),
(11, 'auth', 'user'),
(12, 'contenttypes', 'contenttype'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-11-04 05:14:08.809684'),
(2, 'auth', '0001_initial', '2021-11-04 05:14:09.598623'),
(3, 'admin', '0001_initial', '2021-11-04 05:14:09.886438'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-11-04 05:14:09.902948'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-11-04 05:14:09.917228'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-11-04 05:14:10.063884'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-11-04 05:14:10.146056'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-11-04 05:14:10.180402'),
(9, 'auth', '0004_alter_user_username_opts', '2021-11-04 05:14:10.194411'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-11-04 05:14:10.264729'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-11-04 05:14:10.273042'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-11-04 05:14:10.289436'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-11-04 05:14:10.377959'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-11-04 05:14:10.469035'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-11-04 05:14:10.500447'),
(16, 'auth', '0011_update_proxy_permissions', '2021-11-04 05:14:10.514958'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-11-04 05:14:10.601466'),
(18, 'sessions', '0001_initial', '2021-11-04 05:14:10.668047');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('opjd6lvsuhv7xi77flpyo2ofispxsd8v', '.eJxVjDsOwjAQBe_iGller7-U9DmDtf6AA8iW4qRC3B0ipYD2zcx7sUDbWsM2yhLmzM4M2Ol3i5Qepe0g36ndOk-9rcsc-a7wgw4-9Vyel8P9O6g06rf2oK1LzhkTC1ihJQqjMMpMKnpjCK9aZu0VIkgrCAWABJF1cZCkt8TeH6IONhE:1miV62:WmEq2Sq9g59ndPu9U3MUokpsv8FQHeSYNH6F-PRCHSc', '2021-11-18 05:15:30.023274');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cargo`
--

CREATE TABLE `tbl_cargo` (
  `cargo_id` int NOT NULL,
  `cargo_nom` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_cargo`
--

INSERT INTO `tbl_cargo` (`cargo_id`, `cargo_nom`) VALUES
(1, 'Mozo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `categoria_id` int NOT NULL,
  `categoria_nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`categoria_id`, `categoria_nom`) VALUES
(1, 'ENTRADAS'),
(2, 'PLATOS DE FONDO'),
(3, 'POSTRES'),
(4, 'BEBIDAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado`
--

CREATE TABLE `tbl_empleado` (
  `empleado_id` int NOT NULL,
  `empleado_nom` varchar(200) NOT NULL,
  `cargo_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_empleado`
--

INSERT INTO `tbl_empleado` (`empleado_id`, `empleado_nom`, `cargo_id`) VALUES
(5, 'Bryan', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mesa`
--

CREATE TABLE `tbl_mesa` (
  `mesa_id` int NOT NULL,
  `mesa_nro` varchar(3) NOT NULL,
  `mesa_cap` varchar(45) DEFAULT '1' COMMENT 'capacidad de la mesa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_mesa`
--

INSERT INTO `tbl_mesa` (`mesa_id`, `mesa_nro`, `mesa_cap`) VALUES
(1, '1', '4'),
(2, '2', '6'),
(3, '3', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedido`
--

CREATE TABLE `tbl_pedido` (
  `pedido_id` int NOT NULL,
  `pedido_fetch` datetime DEFAULT NULL,
  `pedido_nro` varchar(200) DEFAULT NULL,
  `pedido_est` varchar(100) DEFAULT NULL,
  `mesa_id` int NOT NULL,
  `empleado_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_plato`
--

CREATE TABLE `tbl_plato` (
  `plato_id` int NOT NULL,
  `plato_nom` varchar(200) NOT NULL,
  `plato_img` varchar(200) NOT NULL,
  `plato_pre` double NOT NULL,
  `categoria_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tbl_plato`
--

INSERT INTO `tbl_plato` (`plato_id`, `plato_nom`, `plato_img`, `plato_pre`, `categoria_id`) VALUES
(1, 'Causa', 'image/upload/v1636004147/vkj44uwzzc7xgbnjyucf.jpg', 15, 1),
(2, 'Lomo saltado', 'image/upload/v1636063037/z6qv24i3dtm9lqzq6g9q.jpg', 25, 2),
(3, 'Cerveza Personal', 'image/upload/v1636063060/tabtznevmi1qtoqlz4t5.png', 10, 4),
(4, 'Arroz con Leche', 'image/upload/v1636063110/khrccxx3s092y7wpfivc.jpg', 8, 3),
(5, 'Aji de Gallina', 'image/upload/v1636064448/oxkby45rndwumcrqulb9.jpg', 20, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_plato_pedido`
--

CREATE TABLE `tbl_plato_pedido` (
  `pedido_plato_id` int NOT NULL,
  `pedido_plato_cant` int DEFAULT NULL,
  `pedido_plato_pre` double DEFAULT NULL,
  `pedido_id` int NOT NULL,
  `plato_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `tbl_cargo`
--
ALTER TABLE `tbl_cargo`
  ADD PRIMARY KEY (`cargo_id`);

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD PRIMARY KEY (`empleado_id`),
  ADD KEY `fk_tbl_empleado_tbl_cargo1` (`cargo_id`);

--
-- Indices de la tabla `tbl_mesa`
--
ALTER TABLE `tbl_mesa`
  ADD PRIMARY KEY (`mesa_id`);

--
-- Indices de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `fk_tbl_pedido_tbl_mesa1` (`mesa_id`),
  ADD KEY `fk_tbl_pedido_tbl_empleado1` (`empleado_id`);

--
-- Indices de la tabla `tbl_plato`
--
ALTER TABLE `tbl_plato`
  ADD PRIMARY KEY (`plato_id`),
  ADD KEY `fk_tbl_plato_tbl_categoria` (`categoria_id`);

--
-- Indices de la tabla `tbl_plato_pedido`
--
ALTER TABLE `tbl_plato_pedido`
  ADD PRIMARY KEY (`pedido_plato_id`),
  ADD KEY `fk_tbl_plato_pedido_tbl_pedido1` (`pedido_id`),
  ADD KEY `fk_tbl_plato_pedido_tbl_plato1` (`plato_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tbl_cargo`
--
ALTER TABLE `tbl_cargo`
  MODIFY `cargo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `categoria_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  MODIFY `empleado_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_mesa`
--
ALTER TABLE `tbl_mesa`
  MODIFY `mesa_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  MODIFY `pedido_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_plato`
--
ALTER TABLE `tbl_plato`
  MODIFY `plato_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_plato_pedido`
--
ALTER TABLE `tbl_plato_pedido`
  MODIFY `pedido_plato_id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD CONSTRAINT `fk_tbl_empleado_tbl_cargo1` FOREIGN KEY (`cargo_id`) REFERENCES `tbl_cargo` (`cargo_id`);

--
-- Filtros para la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD CONSTRAINT `fk_tbl_pedido_tbl_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `tbl_empleado` (`empleado_id`),
  ADD CONSTRAINT `fk_tbl_pedido_tbl_mesa1` FOREIGN KEY (`mesa_id`) REFERENCES `tbl_mesa` (`mesa_id`);

--
-- Filtros para la tabla `tbl_plato`
--
ALTER TABLE `tbl_plato`
  ADD CONSTRAINT `fk_tbl_plato_tbl_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `tbl_categoria` (`categoria_id`);

--
-- Filtros para la tabla `tbl_plato_pedido`
--
ALTER TABLE `tbl_plato_pedido`
  ADD CONSTRAINT `fk_tbl_plato_pedido_tbl_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `tbl_pedido` (`pedido_id`),
  ADD CONSTRAINT `fk_tbl_plato_pedido_tbl_plato1` FOREIGN KEY (`plato_id`) REFERENCES `tbl_plato` (`plato_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
