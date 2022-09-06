-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-11-2019 a las 22:58:28
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `SysHor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bachiller`
--

CREATE TABLE `bachiller` (
  `idbachiller` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `condicion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bachiller`
--

INSERT INTO `bachiller` (`idbachiller`, `descripcion`, `condicion`) VALUES
(5, 'Basico', 1),
(6, 'Informatica', 1),
(7, 'Ciencias Sociales', 1),
(8, 'Ciencias Basicas', 1),
(9, 'Administracion', 1),
(10, 'Electricidad', 1),
(11, 'Mecanica', 1),
(12, 'Construccion Civil', 1),
(13, 'Agro', 1),
(14, 'Contable', 1),
(15, 'Salud', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `descripcion`) VALUES
(7, 'Septimo'),
(8, 'Octavo'),
(9, 'Noveno'),
(10, 'Primero'),
(11, 'Segundo'),
(12, 'Tercero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_grado`
--

CREATE TABLE `detalle_grado` (
  `iddetalle_grado` int(11) NOT NULL,
  `condicion` tinyint(1) DEFAULT NULL,
  `idcurso` int(11) NOT NULL,
  `idbachiller` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_grado`
--

INSERT INTO `detalle_grado` (`iddetalle_grado`, `condicion`, `idcurso`, `idbachiller`, `idusuario`) VALUES
(4, 1, 10, 6, 4),
(5, 1, 11, 6, 5),
(6, 1, 12, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `iddias` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`iddias`, `descripcion`) VALUES
(6, 'Lunes'),
(7, 'Martes'),
(8, 'Miercoles'),
(9, 'Jueves'),
(10, 'Viernes'),
(11, 'Sabado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Horario`
--

CREATE TABLE `Horario` (
  `idHorario` int(11) NOT NULL,
  `Hora` varchar(50) DEFAULT NULL,
  `condicion` tinyint(1) DEFAULT NULL,
  `idmaterias` int(11) NOT NULL,
  `iddias` int(11) NOT NULL,
  `idpabellon` int(11) NOT NULL,
  `idprofes` int(11) NOT NULL,
  `iddetalle_grado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Horario`
--

INSERT INTO `Horario` (`idHorario`, `Hora`, `condicion`, `idmaterias`, `iddias`, `idpabellon`, `idprofes`, `iddetalle_grado`) VALUES
(10, '1RA A 2NDA', 1, 20, 6, 7, 3, 4),
(11, '3RA A 6TA', 1, 17, 6, 7, 4, 4),
(12, '7MA A 8VA', 1, 28, 6, 7, 5, 4),
(13, '1RA A 2NDA', 1, 20, 7, 7, 3, 4),
(14, '3RA A 4TA', 1, 29, 7, 7, 6, 4),
(15, '5TA A 6TA', 1, 30, 7, 7, 5, 4),
(16, '7MA A 8VA', 1, 31, 7, 7, 5, 4),
(17, '1RA A 2NDA', 1, 32, 8, 7, 8, 4),
(18, '3RA A 4TA', 1, 33, 8, 7, 9, 4),
(19, '5TA A 7MA', 1, 15, 8, 7, 10, 4),
(20, '8VA', 1, 33, 8, 7, 10, 4),
(21, '1RA A 2NDA', 1, 34, 9, 7, 11, 4),
(22, '3RA A 4TA', 1, 26, 9, 7, 12, 4),
(23, '5TA Y 6TA', 1, 35, 9, 7, 7, 4),
(24, '7MA A 8VA', 1, 18, 9, 7, 13, 4),
(25, '1RA A 2NDA', 1, 16, 10, 7, 4, 4),
(26, '3RA A 4TA', 1, 23, 10, 7, 14, 4),
(27, '5TA A 6TA', 1, 36, 10, 7, 15, 4),
(28, '7MA A 8VA', 1, 33, 10, 7, 16, 4),
(29, '1RA A 7MA', 1, 17, 11, 7, 4, 4),
(30, '1RA A 4TA', 1, 37, 6, 8, 17, 5),
(31, '5TA A 6TA', 1, 18, 6, 8, 13, 5),
(32, '7MA A 8VA', 1, 38, 6, 8, 17, 5),
(33, '1RA A 3RA (MAÑANA)', 1, 15, 7, 8, 18, 5),
(34, '4TA (MAÑANA)', 1, 29, 7, 8, 5, 5),
(35, '5TA A 6TA (MAÑANA)', 1, 26, 7, 8, 6, 5),
(36, '2NDA A 5TA (TARDE)', 1, 20, 7, 8, 19, 5),
(37, '6TA A 8VA (TARDE)', 1, 16, 7, 8, 3, 5),
(38, '1RA A 2NDA (MAÑANA)', 1, 33, 8, 8, 16, 5),
(39, '3RA A 4TA (MAÑANA)', 1, 32, 8, 8, 8, 5),
(40, '5TA (MAÑANA)', 1, 29, 8, 8, 5, 5),
(41, '6TA A 8VA (MAÑANA)', 1, 33, 8, 8, 5, 5),
(42, '1RA A 2NDA (MAÑANA)', 1, 19, 9, 8, 21, 5),
(43, '3RA A 8VA (MAÑANA)', 1, 17, 9, 8, 17, 5),
(44, '1RA A 2TA (MAÑANA)', 1, 34, 10, 8, 22, 5),
(45, '3RA A 4TA (MAÑANA)', 1, 39, 10, 8, 5, 5),
(46, '5TA A 6TA (MAÑANA)', 1, 34, 10, 8, 22, 5),
(47, '7MA A 8VA (MAÑANA)', 1, 32, 10, 8, 8, 5),
(48, '1RA A 2NDA (TARDE)', 1, 29, 8, 8, 5, 5),
(49, '3RA A 6TA (TARDE)', 1, 36, 8, 8, 11, 5),
(50, '7MA A 8VA (TARDE)', 1, 23, 8, 8, 20, 5),
(51, '1RA A 3RA (MAÑANA)', 1, 15, 6, 9, 30, 6),
(52, '4tA A 6TA (MAÑANA)', 1, 16, 6, 9, 24, 6),
(53, '7MA A 8VA (MAÑANA)', 1, 40, 6, 9, 24, 6),
(54, '1RA A 2NDA (TARDE)', 1, 23, 6, 9, 20, 6),
(55, '3RA A 4TA (TARDE)', 1, 24, 6, 9, 27, 6),
(56, '5TA A 7MA (TARDE', 1, 40, 6, 9, 24, 6),
(57, '1RA A 8VA (MAÑANA)', 1, 17, 7, 9, 17, 6),
(58, '1RA A 4TA (MAÑANA)', 1, 17, 8, 9, 17, 6),
(59, '5TA A 6TA (MAÑANA)', 1, 18, 8, 9, 25, 6),
(60, '7MA A 8VA (MAÑANA)', 1, 19, 8, 9, 26, 6),
(61, '1RA A 4TA (MAÑANA)', 1, 20, 9, 9, 24, 6),
(62, '5TA A 6TA (MAÑANA)', 1, 19, 9, 9, 26, 6),
(63, '1RA A 2NDA (TARDE)', 1, 26, 9, 9, 6, 6),
(64, '3RA A 4TA (TARDE)', 1, 24, 9, 9, 27, 6),
(65, '5TA A 8VA (TARDE)', 1, 27, 9, 9, 28, 6),
(66, '1RA A 2NDA (MAÑANA)', 1, 21, 10, 9, 9, 6),
(67, '3RA A 6TA (MAÑANA)', 1, 33, 10, 9, 29, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idmaterias` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `condicion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idmaterias`, `descripcion`, `condicion`) VALUES
(15, 'Matematica', 1),
(16, 'Matematica Aplicada', 1),
(17, 'Gabinete', 1),
(18, 'Educ. Fisica', 1),
(19, 'Administracion Financiera', 1),
(20, 'Algoritmica', 1),
(21, 'Orientacion', 1),
(22, 'Lengua Castellana', 1),
(23, 'Historia y Geografia', 1),
(24, 'Psicologia', 1),
(25, 'Web Master', 1),
(26, 'Ciencias Naturales', 1),
(27, 'Economia', 1),
(28, 'Sociologia', 1),
(29, 'Guarani', 1),
(30, 'F. Etica', 1),
(31, 'Diseño', 1),
(32, 'Ingles', 1),
(33, 'Literatura', 1),
(34, 'Quimica', 1),
(35, 'Desarrollo P&amp;S', 1),
(36, 'Fisica', 1),
(37, 'Hardware', 1),
(38, 'Software', 1),
(39, 'Educ. P/ la Seg. Vial', 1),
(40, 'Plan Optativo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pabellon`
--

CREATE TABLE `pabellon` (
  `idpabellon` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pabellon`
--

INSERT INTO `pabellon` (`idpabellon`, `descripcion`) VALUES
(7, '1'),
(8, '2'),
(9, '3'),
(10, '4'),
(11, '5'),
(12, '6'),
(13, '7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Admin'),
(2, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profes`
--

CREATE TABLE `profes` (
  `idprofes` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `condicion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profes`
--

INSERT INTO `profes` (`idprofes`, `descripcion`, `condicion`) VALUES
(3, 'Luis Velazquez', 1),
(4, 'Cristobal Romero', 1),
(5, 'Idelina Jara', 1),
(6, 'Laura Martinez', 1),
(7, 'Rudy Ruiz Diaz', 1),
(8, 'Zunilda Ramirez', 1),
(9, 'Raquel Alvarenga', 1),
(10, 'Nelly Yegros', 1),
(11, 'Julia Cordobe', 1),
(12, 'Gloria Acosta', 1),
(13, 'Samuel Cristaldo', 1),
(14, 'Fabio Acosta', 1),
(15, 'Lorena Samaniego', 1),
(16, 'Griselda Samaniego', 1),
(17, 'Jorge Arévalos', 1),
(18, 'Raul Paniagua', 1),
(19, 'Pablo Benítez', 1),
(20, 'Berta Rios', 1),
(21, 'Carlos Salinas', 1),
(22, 'Jorge Bogado', 1),
(23, 'Magín Quintana', 1),
(24, 'Ruben Mercado', 1),
(25, 'Alfirio Vera', 1),
(26, 'Rosanna Rivas', 1),
(27, 'Liz Marlenes S', 1),
(28, 'Cinthia Melgarejo', 1),
(29, 'Lujan Silva', 1),
(30, 'Margin Quintana', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `condicion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nickname`, `password`, `condicion`) VALUES
(1, 'Equinox766', '2761decf684178677070cfc078c2f773c5a3e97478727ebe9049029755d12232', 1),
(4, 'INFOR001', 'b4ffb5381a1b3d17749c114673a824af06be7a36441fbbed35ff1d7ea62fe087', 1),
(5, 'INFOR002', 'aeb7b879bd383819f5b0c6f64f3e7f56964e6ee935793c7a492890b02c62b13c', 1),
(6, 'INFOR003', 'cb22a5d403ef1208a26f8020eb4fd47db815a1efcf23e4241ee40489b0fe99b0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idpermiso`, `idusuario`) VALUES
(1, 1, 1),
(2, 2, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bachiller`
--
ALTER TABLE `bachiller`
  ADD PRIMARY KEY (`idbachiller`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`);

--
-- Indices de la tabla `detalle_grado`
--
ALTER TABLE `detalle_grado`
  ADD PRIMARY KEY (`iddetalle_grado`),
  ADD KEY `fk_detalle_grado_curso1_idx` (`idcurso`),
  ADD KEY `fk_detalle_grado_bachiller1_idx` (`idbachiller`),
  ADD KEY `fk_detalle_grado_usuario1_idx` (`idusuario`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`iddias`);

--
-- Indices de la tabla `Horario`
--
ALTER TABLE `Horario`
  ADD PRIMARY KEY (`idHorario`),
  ADD KEY `fk_Horario_materias1_idx` (`idmaterias`),
  ADD KEY `fk_Horario_dias1_idx` (`iddias`),
  ADD KEY `fk_Horario_pabellon1_idx` (`idpabellon`),
  ADD KEY `fk_Horario_profes1_idx` (`idprofes`),
  ADD KEY `fk_Horario_detalle_grado1_idx` (`iddetalle_grado`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idmaterias`);

--
-- Indices de la tabla `pabellon`
--
ALTER TABLE `pabellon`
  ADD PRIMARY KEY (`idpabellon`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `profes`
--
ALTER TABLE `profes`
  ADD PRIMARY KEY (`idprofes`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_usuario_permiso_permiso1_idx` (`idpermiso`),
  ADD KEY `fk_usuario_permiso_usuario1_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bachiller`
--
ALTER TABLE `bachiller`
  MODIFY `idbachiller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detalle_grado`
--
ALTER TABLE `detalle_grado`
  MODIFY `iddetalle_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Horario`
--
ALTER TABLE `Horario`
  MODIFY `idHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idmaterias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `pabellon`
--
ALTER TABLE `pabellon`
  MODIFY `idpabellon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profes`
--
ALTER TABLE `profes`
  MODIFY `idprofes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_grado`
--
ALTER TABLE `detalle_grado`
  ADD CONSTRAINT `fk_detalle_grado_bachiller1` FOREIGN KEY (`idbachiller`) REFERENCES `bachiller` (`idbachiller`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_grado_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_grado_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Horario`
--
ALTER TABLE `Horario`
  ADD CONSTRAINT `fk_Horario_detalle_grado1` FOREIGN KEY (`iddetalle_grado`) REFERENCES `detalle_grado` (`iddetalle_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Horario_dias1` FOREIGN KEY (`iddias`) REFERENCES `dias` (`iddias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Horario_materias1` FOREIGN KEY (`idmaterias`) REFERENCES `materias` (`idmaterias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Horario_pabellon1` FOREIGN KEY (`idpabellon`) REFERENCES `pabellon` (`idpabellon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Horario_profes1` FOREIGN KEY (`idprofes`) REFERENCES `profes` (`idprofes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_usuario_permiso_permiso1` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
