-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2025 a las 19:50:31
-- Versión del servidor: 8.0.41
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `antojo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `id` int NOT NULL,
  `usuario` int NOT NULL,
  `accion` text NOT NULL,
  `fecha` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_encargo`
--

CREATE TABLE `detalles_encargo` (
  `id` int NOT NULL,
  `encargo_id` int NOT NULL,
  `foto_comida_id` int NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargos`
--

CREATE TABLE `encargos` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `fecha` timestamp NOT NULL,
  `estado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos comida`
--

CREATE TABLE `fotos comida` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `url` text NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partes_aplicacion`
--

CREATE TABLE `partes_aplicacion` (
  `id` int NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fechareg` datetime NOT NULL,
  `perfil` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `clave`, `telefono`, `fechareg`, `perfil`) VALUES
(1, 'pancho', 'yahir.alvarez2830@alumnos.udg.mx', 'scrypt:32768:8:1$vaaNa28gqVRAOCZw$d33afc51b8f0c46bfa1f6a0796338dce5a04c4fe0df5ac3bb8dd208c1f8ec40b81d7d4f512fd866942f4cb76fc0ba2c06bec8e2fb35dde229321736f9f0fe7e8', '3322344813', '2025-05-28 13:25:02', 'S'),
(2, 'ale', 'ale235@alumnos.udg.mx', 'scrypt:32768:8:1$i653HwoxGOrUZt4L$322f70967f30838b827c7773f9c1306063a32bf59923730eccff21eafa5d4adb060a6b82c500a0f50a2d7fcf699c9f4011623c499defc5f5eb13fc1464110341', '3325147891', '2025-05-28 13:27:23', 'S');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encargos`
--
ALTER TABLE `encargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fotos comida`
--
ALTER TABLE `fotos comida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partes_aplicacion`
--
ALTER TABLE `partes_aplicacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `encargos`
--
ALTER TABLE `encargos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fotos comida`
--
ALTER TABLE `fotos comida`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partes_aplicacion`
--
ALTER TABLE `partes_aplicacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
