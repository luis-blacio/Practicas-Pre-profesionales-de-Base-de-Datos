-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2025 a las 22:39:18
-- Versión del servidor: 11.8.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_pruebas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_prueba`
--

CREATE TABLE `caso_prueba` (
  `id` int(11) NOT NULL,
  `prioridad` varchar(20) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `idRequisito` int(11) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `caso_prueba`
--

INSERT INTO `caso_prueba` (`id`, `prioridad`, `titulo`, `estado`, `idRequisito`, `idTipo`) VALUES
(1, 'alta', 'Probar inicio de sesion', 'pendiente', 1, 1),
(2, 'media', 'Verificar listado de usuarios', 'completado', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `texto` text NOT NULL,
  `fecha` date NOT NULL,
  `idRequisito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `texto`, `fecha`, `idRequisito`) VALUES
(1, 'Se debe validar clave incorrecta', '2025-07-01', 1),
(2, 'Falta ordenar la lista de usuarios', '2025-07-01', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_ejecucion`
--

CREATE TABLE `historial_ejecucion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` text NOT NULL,
  `resultado` varchar(50) NOT NULL,
  `idCaso_Prueba` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_ejecucion`
--

INSERT INTO `historial_ejecucion` (`id`, `fecha`, `observaciones`, `resultado`, `idCaso_Prueba`) VALUES
(1, '2025-07-01', 'Inicio de sesion probado', 'exitoso', 1),
(2, '2025-07-01', 'Lista de usuarios visible', 'fallido', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriz_trazabilidad`
--

CREATE TABLE `matriz_trazabilidad` (
  `id` int(11) NOT NULL,
  `id_requisito` int(11) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `observaciones` text NOT NULL,
  `idCaso_Prueba` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `matriz_trazabilidad`
--

INSERT INTO `matriz_trazabilidad` (`id`, `id_requisito`, `estado`, `observaciones`, `idCaso_Prueba`) VALUES
(1, 1, 'pendiente', 'Caso de prueba en desarrollo', 1),
(2, 2, 'completo', 'Validado correctamente', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(50) NOT NULL,
  `idCaso_Prueba` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`id`, `tipo`, `fecha`, `estado`, `idCaso_Prueba`) VALUES
(1, 'email', '2025-07-01', 'enviado', 1),
(2, 'sms', '2025-07-01', 'pendiente', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `fecha`, `nombre`, `idUsuario`) VALUES
(1, '2025-07-01', 'Sistema de pruebas A', 1),
(2, '2025-07-01', 'App de gestion B', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisito`
--

CREATE TABLE `requisito` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `prioridad` varchar(20) NOT NULL,
  `idProyecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `requisito`
--

INSERT INTO `requisito` (`id`, `descripcion`, `tipo`, `prioridad`, `idProyecto`) VALUES
(1, 'Validar acceso con clave', 'funcional', 'alta', 1),
(2, 'Mostrar lista de usuarios', 'funcional', 'media', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `nombre`) VALUES
(1, 'unitario'),
(2, 'integracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave_acceso` varchar(255) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `rol`, `nombre`, `clave_acceso`, `correo`) VALUES
(1, 'admin', 'Carlos Lopez', '123456', 'carlos@example.com'),
(2, 'tester', 'Maria Perez', '654321', 'maria@example.com');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_casos_media`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_casos_media` (
`id` int(11)
,`prioridad` varchar(20)
,`titulo` varchar(100)
,`estado` varchar(50)
,`idRequisito` int(11)
,`idTipo` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_comentarios_lista_usuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_comentarios_lista_usuarios` (
`texto` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_proyectos_usuario2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_proyectos_usuario2` (
`nombre` varchar(100)
,`id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_requisito_acceso`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_requisito_acceso` (
`id` int(11)
,`descripcion` text
,`tipo` varchar(50)
,`prioridad` varchar(20)
,`idProyecto` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_titulos_prueba`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_titulos_prueba` (
`titulo` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_casos_fallidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_casos_fallidos` (
`titulo` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_casos_pendientes_alta`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_casos_pendientes_alta` (
`titulo` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_comentarios_requisito_usuarios`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_comentarios_requisito_usuarios` (
`texto` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_proyectos_funcionales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_proyectos_funcionales` (
`nombre` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_proyectos_usuario2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_proyectos_usuario2` (
`nombre` varchar(100)
,`id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_casos_media`
--
DROP TABLE IF EXISTS `view_casos_media`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_casos_media`  AS SELECT `caso_prueba`.`id` AS `id`, `caso_prueba`.`prioridad` AS `prioridad`, `caso_prueba`.`titulo` AS `titulo`, `caso_prueba`.`estado` AS `estado`, `caso_prueba`.`idRequisito` AS `idRequisito`, `caso_prueba`.`idTipo` AS `idTipo` FROM `caso_prueba` WHERE `caso_prueba`.`prioridad` = 'media' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_comentarios_lista_usuarios`
--
DROP TABLE IF EXISTS `view_comentarios_lista_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_comentarios_lista_usuarios`  AS SELECT `comentario`.`texto` AS `texto` FROM (`requisito` join `comentario` on(`requisito`.`id` = `comentario`.`idRequisito`)) WHERE lcase(`requisito`.`descripcion`) = 'mostrar lista de usuarios' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_proyectos_usuario2`
--
DROP TABLE IF EXISTS `view_proyectos_usuario2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_proyectos_usuario2`  AS SELECT `proyecto`.`nombre` AS `nombre`, `proyecto`.`id` AS `id` FROM `proyecto` WHERE `proyecto`.`idUsuario` = 2 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_requisito_acceso`
--
DROP TABLE IF EXISTS `view_requisito_acceso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_requisito_acceso`  AS SELECT `requisito`.`id` AS `id`, `requisito`.`descripcion` AS `descripcion`, `requisito`.`tipo` AS `tipo`, `requisito`.`prioridad` AS `prioridad`, `requisito`.`idProyecto` AS `idProyecto` FROM `requisito` WHERE lcase(`requisito`.`descripcion`) = 'validar acceso con clave' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_titulos_prueba`
--
DROP TABLE IF EXISTS `view_titulos_prueba`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_titulos_prueba`  AS SELECT `caso_prueba`.`titulo` AS `titulo` FROM `caso_prueba` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_casos_fallidos`
--
DROP TABLE IF EXISTS `vista_casos_fallidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_casos_fallidos`  AS SELECT `caso_prueba`.`titulo` AS `titulo` FROM (`historial_ejecucion` join `caso_prueba` on(`historial_ejecucion`.`idCaso_Prueba` = `caso_prueba`.`id`)) WHERE `historial_ejecucion`.`resultado` = 'fallido' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_casos_pendientes_alta`
--
DROP TABLE IF EXISTS `vista_casos_pendientes_alta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_casos_pendientes_alta`  AS SELECT `caso_prueba`.`titulo` AS `titulo` FROM `caso_prueba` WHERE `caso_prueba`.`prioridad` = 'alta' AND `caso_prueba`.`estado` = 'pendiente' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_comentarios_requisito_usuarios`
--
DROP TABLE IF EXISTS `vista_comentarios_requisito_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_comentarios_requisito_usuarios`  AS SELECT `comentario`.`texto` AS `texto` FROM (`requisito` join `comentario` on(`requisito`.`id` = `comentario`.`idRequisito`)) WHERE lcase(`requisito`.`descripcion`) = 'mostrar lista de usuarios' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_proyectos_funcionales`
--
DROP TABLE IF EXISTS `vista_proyectos_funcionales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_proyectos_funcionales`  AS SELECT DISTINCT `proyecto`.`nombre` AS `nombre` FROM (`proyecto` join `requisito` on(`proyecto`.`id` = `requisito`.`idProyecto`)) WHERE `requisito`.`tipo` = 'funcional' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_proyectos_usuario2`
--
DROP TABLE IF EXISTS `vista_proyectos_usuario2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_proyectos_usuario2`  AS SELECT `proyecto`.`nombre` AS `nombre`, `proyecto`.`id` AS `id` FROM `proyecto` WHERE `proyecto`.`idUsuario` = 2 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caso_prueba`
--
ALTER TABLE `caso_prueba`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRequisito` (`idRequisito`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRequisito` (`idRequisito`);

--
-- Indices de la tabla `historial_ejecucion`
--
ALTER TABLE `historial_ejecucion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCaso_Prueba` (`idCaso_Prueba`);

--
-- Indices de la tabla `matriz_trazabilidad`
--
ALTER TABLE `matriz_trazabilidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_requisito` (`id_requisito`),
  ADD KEY `idCaso_Prueba` (`idCaso_Prueba`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCaso_Prueba` (`idCaso_Prueba`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `requisito`
--
ALTER TABLE `requisito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caso_prueba`
--
ALTER TABLE `caso_prueba`
  ADD CONSTRAINT `caso_prueba_ibfk_1` FOREIGN KEY (`idRequisito`) REFERENCES `requisito` (`id`),
  ADD CONSTRAINT `caso_prueba_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`id`);

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`idRequisito`) REFERENCES `requisito` (`id`);

--
-- Filtros para la tabla `historial_ejecucion`
--
ALTER TABLE `historial_ejecucion`
  ADD CONSTRAINT `historial_ejecucion_ibfk_1` FOREIGN KEY (`idCaso_Prueba`) REFERENCES `caso_prueba` (`id`);

--
-- Filtros para la tabla `matriz_trazabilidad`
--
ALTER TABLE `matriz_trazabilidad`
  ADD CONSTRAINT `matriz_trazabilidad_ibfk_1` FOREIGN KEY (`id_requisito`) REFERENCES `requisito` (`id`),
  ADD CONSTRAINT `matriz_trazabilidad_ibfk_2` FOREIGN KEY (`idCaso_Prueba`) REFERENCES `caso_prueba` (`id`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`idCaso_Prueba`) REFERENCES `caso_prueba` (`id`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `requisito`
--
ALTER TABLE `requisito`
  ADD CONSTRAINT `requisito_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
