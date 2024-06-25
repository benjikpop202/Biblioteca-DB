
--Procedimiento y transaccion registrar_prestamo--
DELIMITER //

CREATE PROCEDURE registrar_prestamo (
    IN p_id_libro INT,
    IN p_id_usuario INT,
    IN p_fecha_prestamo DATE
)
BEGIN
    DECLARE libro_prestado INT;
    DECLARE rand_bibliotecario_id INT;
    DECLARE new_prestamo_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN

        ROLLBACK;
    
        INSERT INTO AuditoriaPrestamos (id_prestamo, accion, fecha) VALUES (NULL, 'Error al registrar el préstamo', now());
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*)
    INTO libro_prestado
    FROM prestamos
    WHERE id_libro = p_id_libro AND fecha_devolucion IS NULL;


    SELECT id_bibliotecario
    INTO rand_bibliotecario_id
    FROM bibliotecario
    ORDER BY RAND()
    LIMIT 1;

    IF libro_prestado = 0 THEN
        INSERT INTO prestamos (id_libro, id_usuario, id_bibliotecario, fecha_prestamo, activo)
        VALUES (p_id_libro, p_id_usuario, rand_bibliotecario_id, p_fecha_prestamo, true);
        
        SET new_prestamo_id = LAST_INSERT_ID();
        
        UPDATE libros
        SET prestado = true
        WHERE id_libro = p_id_libro;

        INSERT INTO AuditoriaPrestamos (id_prestamo, accion, fecha)
        VALUES (new_prestamo_id, 'Registrar nuevo préstamo', now());

        COMMIT;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro ya está prestado.';
    END IF;
END //

DELIMITER ;


-- vista de prestamos actulaes --
CREATE VIEW vista_prestamos_actuales AS 
SELECT l.titulo AS Libro, c.nombre AS Cliente, p.fecha_prestamo 
FROM prestamos p
INNER JOIN libros l ON p.id_libro = l.id_libro
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE p.activo = true

-- trigger ---
DELIMITER //

CREATE TRIGGER actualizar_fecha_devolucion
BEFORE UPDATE ON prestamos
FOR EACH ROW
BEGIN
    IF NEW.fecha_devolucion IS NOT NULL AND OLD.fecha_devolucion IS NULL THEN
        SET NEW.fecha_devolucion = CURDATE();
        SET NEW.activo = false;
        UPDATE libros
        SET prestado = false
        WHERE id_libro = NEW.id_libro;
    END IF;
END //

DELIMITER ;