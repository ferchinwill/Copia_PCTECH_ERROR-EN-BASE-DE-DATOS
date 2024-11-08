CREATE DATABASE Tienda_PC_Gaming;
USE Tienda_PC_Gaming;

-- Tabla de Categoría
CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    ID_Categoria_Padre INT,
    FOREIGN KEY (ID_Categoria_Padre) REFERENCES Categoria(ID_Categoria)
);

-- Tabla de Producto
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Especificaciones TEXT,
    Marca VARCHAR(50),
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT DEFAULT 0,
    Descuento DECIMAL(5, 2) DEFAULT 0.00,
    URL_Imagen VARCHAR(255),
    ID_Categoria INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

-- Tabla de Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(15),
    Direccion TEXT,
    Metodo_Pago_Preferido VARCHAR(50)
);

-- Tabla de Carrito
CREATE TABLE Carrito (
    ID_Carrito INT PRIMARY KEY AUTO_INCREMENT,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Precio_Total DECIMAL(10, 2) DEFAULT 0.00,
    Estado ENUM('Activo', 'Completado', 'Pendiente') DEFAULT 'Activo',
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

---- Tabla de ItemCarrito (para la relación Muchos-a-Muchos entre Carrito y Producto)
--CREATE TABLE ItemCarrito (
--    ID_ItemCarrito INT PRIMARY KEY AUTO_INCREMENT,
--    ID_Carrito INT,
--    ID_Producto INT,
--    Cantidad INT DEFAULT 1,
--    Precio DECIMAL(10, 2),
--    FOREIGN KEY (ID_Carrito) REFERENCES Carrito(ID_Carrito) ON DELETE CASCADE,
--    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
--);
--
---- Tabla de Pedidos
--CREATE TABLE Pedido (
--    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
--    Fecha_Pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
--    Direccion_Envio TEXT,
--    Estado_Pedido ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
--    Metodo_Pago VARCHAR(50),
--    Estado_Pago ENUM('Pagado', 'No Pagado', 'Reembolsado') DEFAULT 'No Pagado',
--    Monto_Total DECIMAL(10, 2),
--    ID_Cliente INT,
--    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
--);
--
---- Tabla de ItemPedido (para la relación Muchos-a-Muchos entre Pedido y Producto)
--CREATE TABLE ItemPedido (
--    ID_ItemPedido INT PRIMARY KEY AUTO_INCREMENT,
--    ID_Pedido INT,
--    ID_Producto INT,
--    Cantidad INT DEFAULT 1,
--    Precio DECIMAL(10, 2),
--    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido) ON DELETE CASCADE,
--    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
--);
