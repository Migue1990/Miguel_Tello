-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Productos` ;

CREATE TABLE IF NOT EXISTS `Productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `categoria` VARCHAR(50) NOT NULL,
  `stock_disponible` INT NOT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clientes` ;

CREATE TABLE IF NOT EXISTS `Clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `correo_electronico` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos` ;

CREATE TABLE IF NOT EXISTS `Pedidos` (
  `id_Pedidos` INT NOT NULL AUTO_INCREMENT,
  `fecha_pedido` DATETIME NOT NULL,
  `estado_pedido` VARCHAR(45) NOT NULL,
  `metodo_pago` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_Pedidos`),
  CONSTRAINT `fk_Pedidos_Clientes1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proveedores` ;

CREATE TABLE IF NOT EXISTS `Proveedores` (
  `id_Proveedores` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `correo_electronico` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_Proveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventario` ;

CREATE TABLE IF NOT EXISTS `Inventario` (
  `id_Inventario` INT NOT NULL AUTO_INCREMENT,
  `id_producto` INT NOT NULL,
  `cantidad_disponibles` INT NOT NULL,
  `fecha_movimiento` DATETIME NOT NULL,
  `tipo_movimiento` VARCHAR(45) NOT NULL,
  `id_Productos` INT NOT NULL,
  PRIMARY KEY (`id_Inventario`),
  CONSTRAINT `fk_Inventario_Productos1`
    FOREIGN KEY (`id_Productos`)
    REFERENCES `Productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pedidos_Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedidos_Productos` ;

CREATE TABLE IF NOT EXISTS `Pedidos_Productos` (
  `id_Pedidos_Productos` INT NOT NULL AUTO_INCREMENT,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `id_Pedidos` INT NOT NULL,
  `id_Productos` INT NOT NULL,
  PRIMARY KEY (`id_Pedidos_Productos`),
  CONSTRAINT `fk_Pedidos_Productos_Pedidos1`
    FOREIGN KEY (`id_Pedidos`)
    REFERENCES `Pedidos` (`id_Pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Productos_Productos1`
    FOREIGN KEY (`id_Productos`)
    REFERENCES `Productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Compras_Proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Compras_Proveedores` ;

CREATE TABLE IF NOT EXISTS `Compras_Proveedores` (
  `id_Compras_Proveedores` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT NULL,
  `fecha_compra` DATETIME NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `id_Pedidos` INT NOT NULL,
  `id_Proveedores` INT NOT NULL,
  PRIMARY KEY (`id_Compras_Proveedores`, `id_Proveedores`),
  CONSTRAINT `fk_Compras_Proveedores_Pedidos1`
    FOREIGN KEY (`id_Pedidos`)
    REFERENCES `Pedidos` (`id_Pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compras_Proveedores_Proveedores1`
    FOREIGN KEY (`id_Proveedores`)
    REFERENCES `Proveedores` (`id_Proveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Productos`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (1, 'iPhone 13', 'Teléfono inteligente de Apple con 128GB de almacenamiento', 7.999, 'Teléfonos Móviles', 50);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (2, 'Samsung Galaxy S21', 'Teléfono inteligente de Samsung con 256GB de almacenamiento', 10.000, 'Teléfonos Móviles', 40);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (3, 'MacBook Pro', 'Laptop de Apple con pantalla de 16 pulgadas y 512GB SSD', 5.000, 'Laptops', 30);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (4, 'Dell XPS 13', 'Laptop de Dell con pantalla de 13.3 pulgadas y 256GB SSD', 500, 'Laptops', 20);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (5, 'iPad Pro', 'Tablet de Apple con pantalla de 12.9 pulgadas y 128GB', 20.000, 'Tablets', 15);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (6, 'Samsung Galaxy Tab S7', 'Tablet de Samsung con pantalla de 11 pulgadas y 128GB', 66.000, 'Tablets', 30);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (7, 'AirPods Pro', 'Auriculares inalámbricos de Apple con cancelación de ruido', 10.500, 'Accesorios', 40);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (8, 'Sony WH-1000XM4', 'Auriculares inalámbricos de Sony con cancelación de ruido', 1.000, 'Accesorios', 50);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (9, 'Apple Watch Series 6', 'Reloj inteligente de Apple con GPS', 30.000, 'Accesorios', 40);
INSERT INTO `Productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`, `stock_disponible`) VALUES (10, 'Amazon Echo Dot', 'Altavoz inteligente con Alexa', 10.000, 'Accesorios', 50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Clientes`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (1, 'Juan Pérez', 'bs as. ciudadela 450', 'juan.martinez@hotmail.com', '1125637780');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (2, 'María Gómez', 'Calle Falsa 123, Ciudad', 'maria.perez@gmail.com', '1166687550');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (3, 'Carlos López', 'av.militar 3027 bs as', 'carlos.gomez@hotmail.com', '1125602031');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (4, 'Ana Martínez', 'balbin 6628', 'ana.fernandez@gmail.com', '1141656860');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (5, 'Luis Fernández', 'barragan 1030', 'luis.garcia@hotmail.com', '1124843854');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (6, 'Laura García', 'lavallol 20203', 'laura@gmail.com', '1157371189');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (7, 'Pedro Sánchez', 'beiro 3027', 'pedro2020@gmail.com', '1169674806');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (8, 'Lucía Romero', 'comesaña 5050', 'romerocris@hotmail.com', '1171409204');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (9, 'Jorge Torres', 'besares 3020. ciudadela', 'jorgeventas@gmail.com', '1163893700');
INSERT INTO `Clientes` (`id_cliente`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (10, 'Marta Ruiz', 'los andes 5050. ', 'marta2030@hotmai.com', '1135603172');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pedidos`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (1, '2024-01-12', 'Pendiente', 'Tarjeta de Crédito', 1);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (2, '2024-01-01', 'Enviado', 'paypal', 2);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (3, '2024-01-02', 'entregado', 'Tarjeta de Débito', 3);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (4, '2024-01-03', 'Cancelado', 'Transferencia Bancaria', 4);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (5, '2024-01-04', 'Pendiente', 'Tarjeta de Crédito', 5);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (6, '2024-01-05', 'Enviado', 'paypal', 6);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (7, '2024-01-06', 'Entregado', 'Tarjeta de Débito', 7);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (8, '2024-01-07', 'Cancelado', 'Transferencia Bancaria', 8);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (9, '2024-01-08', 'Pendiente', 'Tarjeta de Crédito', 9);
INSERT INTO `Pedidos` (`id_Pedidos`, `fecha_pedido`, `estado_pedido`, `metodo_pago`, `id_cliente`) VALUES (10, '2024-01-09', 'Enviado', 'paypal', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Proveedores`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (1, 'Apple Inc', '\'1 Infinite Loop', 'contact@apple.com', '8005551234');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (2, 'Samsung Electronics', '129 Samsung-ro, Suwon-si', 'contact@samsung.com', '8005555678');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (3, 'Dell Technologies', '1 Dell Way, Round Rock, TX', 'contact@dell.com', '8005558765');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (4, 'Sony Corporation', '1-7-1 Konan, Minato-ku, Tokio', 'contact@sony.com', '8005552345');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (5, 'Amazon', '410 Terry Ave N, Seattle', 'contact@amazon.com', '8005553456');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (6, 'Microsoft', '1 Microsoft Way, Redmond, WA', 'contact@microsoft.com', '8005556789');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (7, 'HP Inc.', '1501 Page Mill Road, Palo Alto, CA', 'contact@hp.com', '8005555432');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (8, 'Lenovo', '1501 Page Mill Road', 'contact@hp.com', '8005555432');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (9, 'HP Inc', '1009 Think Place, Morrisville', 'contact@lenovo.com', '8005556543');
INSERT INTO `Proveedores` (`id_Proveedores`, `nombre`, `direccion`, `correo_electronico`, `telefono`) VALUES (10, 'Asus', '15 Li-Te Road, Beitou, Taipéi, Taiwán', 'contact@asus.com', '8005557890');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Inventario`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (1, 1, 50, '2024-06-01', 'entrada', 1);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (2, 2, 60, '2024-06-03', 'salida', 2);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (3, 3, 70, '2024-06-04', 'entrada', 3);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (4, 4, 80, '2024-05-20', 'salida', 4);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (5, 5, 25, '2024-06-22', 'entrada', 5);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (6, 6, 100, '2024-06-29', 'salida', 6);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (7, 7, 60, '2024-06-31', 'entrada', 7);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (8, 8, 80, '2024-07-31', 'entrada', 8);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (9, 9, 10, '2024-04-18', 'salida', 9);
INSERT INTO `Inventario` (`id_Inventario`, `id_producto`, `cantidad_disponibles`, `fecha_movimiento`, `tipo_movimiento`, `id_Productos`) VALUES (10, 10, 20, '2024-03-20', 'entrada', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pedidos_Productos`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (1, 1, 1, 1, 1);
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (2, 2, 2, 2, 2);
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (3, 3, 1, 3, 3);
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (4, 4, 3, 4, 4);
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (5, 5, 1, 5, 5);
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (6, 6, 2, 6, 6);
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (7, 7, 1, 7, 7);
INSERT INTO `Pedidos_Productos` (`id_Pedidos_Productos`, `id_producto`, `cantidad`, `id_Pedidos`, `id_Productos`) VALUES (8, 8, 2, 8, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Compras_Proveedores`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Compras_Proveedores` (`id_Compras_Proveedores`, `id_proveedor`, `fecha_compra`, `total`, `id_Pedidos`, `id_Proveedores`) VALUES (1, 1, '2024-06-21', 12.50, 1, 1);
INSERT INTO `Compras_Proveedores` (`id_Compras_Proveedores`, `id_proveedor`, `fecha_compra`, `total`, `id_Pedidos`, `id_Proveedores`) VALUES (2, 2, '2024-06-22', 30.000, 2, 2);
INSERT INTO `Compras_Proveedores` (`id_Compras_Proveedores`, `id_proveedor`, `fecha_compra`, `total`, `id_Pedidos`, `id_Proveedores`) VALUES (3, 3, '2024-06-20', 50.000, 3, 3);
INSERT INTO `Compras_Proveedores` (`id_Compras_Proveedores`, `id_proveedor`, `fecha_compra`, `total`, `id_Pedidos`, `id_Proveedores`) VALUES (4, 4, '2024-06-29', 100, 4, 4);
INSERT INTO `Compras_Proveedores` (`id_Compras_Proveedores`, `id_proveedor`, `fecha_compra`, `total`, `id_Pedidos`, `id_Proveedores`) VALUES (5, 5, '2024-06-31', 3.000, 5, 5);

COMMIT;

-- Consultas SQL Específicas:--

-- 1. Cantidad de pedidos mensuales:--
-- Resultado: Año, Mes y Cantidad de pedidos.

SELECT 
    YEAR(fecha_pedido) AS Año,
    MONTH(fecha_pedido) AS Mes,
    COUNT(*) AS Cantidad_Pedidos
FROM 
    Pedidos
GROUP BY 
    Año, Mes
ORDER BY 
    Año, Mes;
    
  --  2. Cantidad mensual pedida de cada artículo:--
-- Resultado: Año, Mes, Artículo y Cantidad de unidades pedidas.--

SELECT 
    EXTRACT(YEAR FROM p.fecha_pedido) AS Año,
    EXTRACT(MONTH FROM p.fecha_pedido) AS Mes,
    pr.nombre AS Artículo,
    SUM(pp.cantidad) AS Cantidad_Unidades
FROM 
    Pedidos p
JOIN 
    Pedidos_Productos pp ON p.id_Pedidos = pp.id_Pedidos
JOIN 
    Productos pr ON pp.id_producto = pr.id_producto
GROUP BY 
    Año, Mes, Artículo
ORDER BY 
    Año, Mes, Artículo;
    
   -- 3. Ranking de artículos:--
-- Resultado: Artículo, Año, Mes y Cantidad pedida.--

SELECT 
    pr.nombre AS Artículo,
    EXTRACT(YEAR FROM p.fecha_pedido) AS Año,
    EXTRACT(MONTH FROM p.fecha_pedido) AS Mes,
    SUM(pp.cantidad) AS Cantidad_Pedida
FROM 
    Pedidos p
JOIN 
    Pedidos_Productos pp ON p.id_Pedidos = pp.id_Pedidos
JOIN 
    Productos pr ON pp.id_producto = pr.id_producto
GROUP BY 
    Artículo, Año, Mes
ORDER BY 
    Año, Mes, Cantidad_Pedida DESC;
    
  --  4. Clientes con más pedidos realizados:--
-- Resultado: Cliente, Cantidad de pedidos.--
    
    SELECT 
    c.nombre AS Cliente,
    COUNT(p.id_Pedidos) AS Cantidad_Pedidos
FROM 
    Pedidos p
JOIN 
    Clientes c ON p.id_cliente = c.id_cliente
GROUP BY 
    Cliente
ORDER BY 
    Cantidad_Pedidos DESC;
    
   -- 5. Ingreso mensual total por ventas:--
-- Resultado: Año, Mes e Ingreso total. --

SELECT 
    EXTRACT(YEAR FROM p.fecha_pedido) AS Año,
    EXTRACT(MONTH FROM p.fecha_pedido) AS Mes,
    SUM(pp.cantidad * pr.precio) AS Ingreso_Total
FROM 
    Pedidos p
JOIN 
    Pedidos_Productos pp ON p.id_Pedidos = pp.id_Pedidos
JOIN 
    Productos pr ON pp.id_producto = pr.id_producto
GROUP BY 
    Año, Mes
ORDER BY 
    Año, Mes;
    
    -- 6. Productos con stock bajo (menos de 10 unidades):--
-- Resultado: Producto, Stock disponible. --


SELECT 
    nombre AS Producto,
    stock_disponible AS Stock_Disponible
FROM 
    Productos
WHERE 
    stock_disponible < 10;
    
   -- 7. Pedidos pendientes de entrega:
-- Resultado: Pedido, Cliente, Fecha del pedido.--

SELECT 
    p.id_Pedidos AS Pedido,
    c.nombre AS Cliente,
    p.fecha_pedido AS Fecha_Del_Pedido
FROM 
    Pedidos p
JOIN 
    Clientes c ON p.id_cliente = c.id_cliente
WHERE 
    p.estado_pedido = 'Pendiente';
    
-- 8. Productos más vendidos por categoría:
-- Resultado: Categoría, Producto, Cantidad vendida.

SELECT 
    pr.categoria AS Categoría,
    pr.nombre AS Producto,
    SUM(pp.cantidad) AS Cantidad_Vendida
FROM 
    Pedidos p
JOIN 
    Pedidos_Productos pp ON p.id_Pedidos = pp.id_Pedidos
JOIN 
    Productos pr ON pp.id_producto = pr.id_producto
GROUP BY 
    Categoría, Producto
ORDER BY 
    Categoría, Cantidad_Vendida DESC;
    
 