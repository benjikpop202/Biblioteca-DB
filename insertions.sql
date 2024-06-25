USE biblioteca;

--Libros--
INSERT INTO libros (id_libro, titulo, descripcion, anio, genero) VALUES
(1, 'Cien años de soledad', 'Una de las obras más importantes de la literatura hispanoamericana, escrita por Gabriel García Márquez.', 1967, 'Realismo mágico'),
(2, '1984', 'Una novela distópica escrita por George Orwell que explora los peligros del totalitarismo.', 1949, 'Ciencia ficción'),
(3, 'Matar a un ruiseñor', 'Una obra clásica de la literatura estadounidense escrita por Harper Lee, que aborda temas de racismo e injusticia.', 1960, 'Ficción histórica'),
(4, 'Orgullo y prejuicio', 'Una novela romántica de Jane Austen que critica la sociedad de la época.', 1813, 'Romance'),
(5, 'El gran Gatsby', 'Una novela de F. Scott Fitzgerald que explora la decadencia y el exceso de la sociedad estadounidense en la década de 1920.', 1925, 'Ficción'),
(6, 'Crimen y castigo', 'Una novela de Fyodor Dostoyevsky que profundiza en los tormentos psicológicos de un joven estudiante que comete un asesinato.', 1866, 'Ficción psicológica'),
(7, 'Don Quijote de la Mancha', 'Una de las obras más influyentes de la literatura universal, escrita por Miguel de Cervantes.', 1605, 'Aventura'),
(8, 'El guardián entre el centeno', 'Una novela de J.D. Salinger que sigue las experiencias de un joven rebelde en la ciudad de Nueva York.', 1951, 'Ficción'),
(9, 'En busca del tiempo perdido', 'Una obra monumental de Marcel Proust que explora la memoria y el tiempo.', 1913, 'Ficción'),
(10, 'La odisea', 'Una épica griega atribuida a Homero que narra las aventuras de Odiseo en su regreso a Ítaca.', -800, 'Épica');



--Autores--
INSERT INTO Autores (id_autor, nombre, apellido, descripcion) VALUES
(1, 'Gabriel', 'García Márquez', 'Escritor colombiano, ganador del Premio Nobel de Literatura en 1982, conocido por su obra maestra "Cien años de soledad".'),
(2, 'George', 'Orwell', 'Escritor y periodista británico, conocido por sus novelas distópicas "1984" y "Rebelión en la granja".'),
(3, 'Harper', 'Lee', 'Escritora estadounidense, conocida por su novela "Matar a un ruiseñor", ganadora del Premio Pulitzer.'),
(4, 'Jane', 'Austen', 'Novelista inglesa, famosa por sus obras que critican la sociedad de su tiempo, como "Orgullo y prejuicio".'),
(5, 'F. Scott', 'Fitzgerald', 'Escritor estadounidense, conocido por sus novelas que capturan el espíritu de la Era del Jazz, como "El gran Gatsby".'),
(6, 'Fyodor', 'Dostoyevsky', 'Novelista ruso, uno de los escritores más importantes de la literatura mundial, conocido por "Crimen y castigo".'),
(7, 'Miguel de', 'Cervantes', 'Escritor español, autor de "Don Quijote de la Mancha", considerada la primera novela moderna.'),
(8, 'J.D.', 'Salinger', 'Escritor estadounidense, conocido por su novela "El guardián entre el centeno".'),
(9, 'Marcel', 'Proust', 'Escritor francés, conocido por su obra monumental "En busca del tiempo perdido".'),
(10, 'Homero', '', 'Poeta épico griego, tradicionalmente considerado el autor de "La Ilíada" y "La odisea".');

--LibroAutor--
INSERT INTO LibroAutor (id_libro, id_autor) VALUES
(1,1), (2,2), (3,3), (4,4), (5,5),(6,6), (7,7), (8,8), (9,9), (10,10);

--Bibliotecario--
INSERT INTO Bibliotecario (id_biblio, nombre, apellido, telefono, email) VALUES
(1, 'mariano', 'martinez', '+54321123', 'marianomartinez@gmail.com'),
(2, 'casandra', 'castillo', '+56321980', 'casandrabiblio@gmail.com'),
(3, 'Ana', 'lopez', '+54378920', 'anabiblio@gmail.com'),
(4, 'pedro', 'perez', '+51234567', 'PedroPedroPe@gmail.com'),
(5, 'maria', 'sosa', '+54671289', 'mariasas@gmail.com');

--Clientes--
INSERT INTO Clientes (id_cliente, nombre, apellido, direccion, telefono, email) VALUES 
(1, 'benjamin', 'sobarzo', 'tandil', '+5423901', 'benjaminsobarzo2018@gmail.com'),
(2, 'lucia', 'lopez', 'mar del plata', '+54321123', 'lucia23qgmail.com'),
(3, 'mariano', 'guzman', 'caba', '+54321456', 'marianolol@gmail.com'),
(4, 'antonela', 'soria', 'tres arrollos', 'antocrack@gmail.com'),
(5, 'jorge', 'mora', 'santiago', '+56789987', '@jorgeMan@gmail.com')
