CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE  Libros (
    id_libro INT  PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    anio YEAR,
    genero VARCHAR(100),
    prestado DEFAULT false
);

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
)

CREATE TABLE LibroAutor (
    id_libro INT,
    id_autor INT,
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
)

CREATE TABLE Bibliotecario (
    id_biblio INT  PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_cliente INT,
    id_biblio INT,
    activo BOOLEAN,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_biblio) REFERENCES Bibliotecario(id_biblio)
);

CREATE TABLE IF NOT EXISTS AuditoriaPrestamos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_prestamo INT,
    accion VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

