//Cristian Cardona A00369414 - Juan Pablo Ordoñez A00378093

--eliminacion de tablas
DROP TABLE Reserva_Servicio_Adicional CASCADE CONSTRAINTS;
DROP TABLE Reserva_Actividad CASCADE CONSTRAINTS;
DROP TABLE Reserva_Habitacion CASCADE CONSTRAINTS;
DROP TABLE Reserva CASCADE CONSTRAINTS;
DROP TABLE Servicio_Adicional CASCADE CONSTRAINTS;
DROP TABLE Empleado CASCADE CONSTRAINTS;
DROP TABLE Actividad CASCADE CONSTRAINTS;
DROP TABLE Habitacion CASCADE CONSTRAINTS;
DROP TABLE Tipo_Habitacion CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;


--creacion de tablas

--creacion de la tabla cliente
CREATE TABLE Cliente (
    ID_Cliente NUMBER PRIMARY KEY,
    Nombre VARCHAR2(255) NOT NULL,
    Apellido VARCHAR2(255) NOT NULL,
    Email VARCHAR2(255),
    Numero_Telefonico VARCHAR2(15),
    Fecha_de_Nacimiento DATE
);

-- Creación de la tabla Tipo de Habitación (Dominio)
CREATE TABLE Tipo_Habitacion (
    ID_Tipo NUMBER PRIMARY KEY,
    Descripcion VARCHAR2(255) NOT NULL
);

-- Creación de la tabla Habitación
CREATE TABLE Habitacion (
    ID_Habitacion NUMBER PRIMARY KEY,
    ID_Tipo NUMBER NOT NULL,
    Costo_por_noche DECIMAL(10,2) NOT NULL,
    Estado VARCHAR2(255) NOT NULL,
    FOREIGN KEY (ID_Tipo) REFERENCES Tipo_Habitacion(ID_Tipo)
);

-- Creación de la tabla Actividad
CREATE TABLE Actividad (
    ID_Actividad NUMBER PRIMARY KEY,
    Nombre VARCHAR2(255) NOT NULL,
    Costo DECIMAL(10,2) NOT NULL,
    Capacidad INT NOT NULL
);

-- Creación de la tabla Empleado
CREATE TABLE Empleado (
    ID_Empleado NUMBER PRIMARY KEY,
    Nombre VARCHAR2(255) NOT NULL,
    Apellido VARCHAR2(255) NOT NULL,
    Cargo VARCHAR2(255) NOT NULL
);

-- Creación de la tabla Reserva (Entidad Débil)
CREATE TABLE Reserva (
    ID_Reserva NUMBER PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Cliente NUMBER NOT NULL,
    ID_Empleado NUMBER NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

-- Creación de la tabla Reserva_Habitacion (Relación)
CREATE TABLE Reserva_Habitacion (
    ID_Reserva NUMBER NOT NULL,
    ID_Habitacion NUMBER NOT NULL,
    FOREIGN KEY (ID_Reserva) REFERENCES Reserva(ID_Reserva),
    FOREIGN KEY (ID_Habitacion) REFERENCES Habitacion(ID_Habitacion)
);

-- Creación de la tabla Reserva_Actividad (Relación)
CREATE TABLE Reserva_Actividad (
    ID_Reserva NUMBER NOT NULL,
    ID_Actividad NUMBER NOT NULL,
    FOREIGN KEY (ID_Reserva) REFERENCES Reserva(ID_Reserva),
    FOREIGN KEY (ID_Actividad) REFERENCES Actividad(ID_Actividad)
);

-- Creación de la tabla Servicio_Adicional
CREATE TABLE Servicio_Adicional (
    ID_Servicio NUMBER PRIMARY KEY,
    Descripcion VARCHAR2(255) NOT NULL,
    Costo DECIMAL(10,2) NOT NULL
);

-- Creación de la tabla Reserva_Servicio_Adicional (Relación con Atributos)
CREATE TABLE Reserva_Servicio_Adicional (
    ID_Reserva NUMBER NOT NULL,
    ID_Servicio NUMBER NOT NULL,
    Cantidad INT NOT NULL,
    Costo_Total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Reserva) REFERENCES Reserva(ID_Reserva),
    FOREIGN KEY (ID_Servicio) REFERENCES Servicio_Adicional(ID_Servicio)
);


--inserts(10)

INSERT INTO Cliente VALUES (1, 'Juan', 'Perez', 'juan@email.com', '123456789', TO_DATE('1990-01-15', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (2, 'Maria', 'Lopez', 'maria@email.com', '987654321', TO_DATE('1985-05-20', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (3, 'Carlos', 'Gonzalez', 'carlos@email.com', '555111222', TO_DATE('1988-08-10', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (4, 'Ana', 'Martinez', 'ana@email.com', '333444555', TO_DATE('1995-03-25', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (5, 'Pedro', 'Ramirez', 'pedro@email.com', '777888999', TO_DATE('1980-12-05', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (6, 'Luisa', 'Hernandez', 'luisa@email.com', '111222333', TO_DATE('1987-06-15', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (7, 'Eduardo', 'Diaz', 'eduardo@email.com', '444555666', TO_DATE('1992-04-30', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (8, 'Silvia', 'Gutierrez', 'silvia@email.com', '666777888', TO_DATE('1983-09-20', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (9, 'Roberto', 'Fernandez', 'roberto@email.com', '999000111', TO_DATE('1978-11-18', 'YYYY-MM-DD'));
INSERT INTO Cliente VALUES (10, 'Marta', 'Sanchez', 'marta@email.com', '222333444', TO_DATE('1998-02-08', 'YYYY-MM-DD'));

INSERT INTO Tipo_Habitacion VALUES (1, 'Individual');
INSERT INTO Tipo_Habitacion VALUES (2, 'Doble');
INSERT INTO Tipo_Habitacion VALUES (3, 'Suite');
INSERT INTO Tipo_Habitacion VALUES (4, 'Familiar');
INSERT INTO Tipo_Habitacion VALUES (5, 'Ejecutiva');
INSERT INTO Tipo_Habitacion VALUES (6, 'Presidencial');
INSERT INTO Tipo_Habitacion VALUES (7, 'Matrimonial');
INSERT INTO Tipo_Habitacion VALUES (8, 'Estándar');
INSERT INTO Tipo_Habitacion VALUES (9, 'VIP');
INSERT INTO Tipo_Habitacion VALUES (10, 'Penthouse');


INSERT INTO Habitacion VALUES (1, 1, 100.00, 'Disponible');
INSERT INTO Habitacion VALUES (2, 2, 150.00, 'Ocupada');
INSERT INTO Habitacion VALUES (3, 1, 120.00, 'Disponible');
INSERT INTO Habitacion VALUES (4, 2, 160.00, 'Ocupada');
INSERT INTO Habitacion VALUES (5, 1, 110.00, 'Disponible');
INSERT INTO Habitacion VALUES (6, 2, 140.00, 'Disponible');
INSERT INTO Habitacion VALUES (7, 1, 130.00, 'Ocupada');
INSERT INTO Habitacion VALUES (8, 2, 170.00, 'Disponible');
INSERT INTO Habitacion VALUES (9, 1, 125.00, 'Ocupada');
INSERT INTO Habitacion VALUES (10, 2, 155.00, 'Disponible');


INSERT INTO Actividad VALUES (1, 'Gimnasio', 10.00, 20);
INSERT INTO Actividad VALUES (2, 'Piscina', 15.00, 30);
INSERT INTO Actividad VALUES (3, 'Yoga', 12.50, 15);
INSERT INTO Actividad VALUES (4, 'Excursión', 25.00, 25);
INSERT INTO Actividad VALUES (5, 'Spa', 20.00, 10);
INSERT INTO Actividad VALUES (6, 'Clases de Cocina', 18.00, 20);
INSERT INTO Actividad VALUES (7, 'Senderismo', 14.00, 18);
INSERT INTO Actividad VALUES (8, 'Karaoke', 8.00, 30);
INSERT INTO Actividad VALUES (9, 'Sala de Juegos', 10.00, 25);
INSERT INTO Actividad VALUES (10, 'Cine al Aire Libre', 15.00, 20);


INSERT INTO Empleado VALUES (1, 'Carlos', 'Gomez', 'Recepcionista');
INSERT INTO Empleado VALUES (2, 'Laura', 'Rodriguez', 'Conserje');
INSERT INTO Empleado VALUES (3, 'Ana', 'Martinez', 'Camarera');
INSERT INTO Empleado VALUES (4, 'Javier', 'Lopez', 'Chef');
INSERT INTO Empleado VALUES (5, 'Isabel', 'Garcia', 'Limpieza');
INSERT INTO Empleado VALUES (6, 'Miguel', 'Fernandez', 'Concierge');
INSERT INTO Empleado VALUES (7, 'Sandra', 'Diaz', 'Seguridad');
INSERT INTO Empleado VALUES (8, 'Alberto', 'Vega', 'Gerente');
INSERT INTO Empleado VALUES (9, 'Carmen', 'Perez', 'Mesero');
INSERT INTO Empleado VALUES (10, 'Diego', 'Ruiz', 'Recepcionista');


INSERT INTO Reserva VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Reserva VALUES (2, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 2, 2);
INSERT INTO Reserva VALUES (3, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 1, 2);
INSERT INTO Reserva VALUES (4, TO_DATE('2023-04-10', 'YYYY-MM-DD'), 2, 1);
INSERT INTO Reserva VALUES (5, TO_DATE('2023-05-20', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Reserva VALUES (6, TO_DATE('2023-06-05', 'YYYY-MM-DD'), 2, 2);
INSERT INTO Reserva VALUES (7, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Reserva VALUES (8, TO_DATE('2023-08-22', 'YYYY-MM-DD'), 2, 2);
INSERT INTO Reserva VALUES (9, TO_DATE('2023-09-18', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Reserva VALUES (10, TO_DATE('2023-10-30', 'YYYY-MM-DD'), 2, 2);


INSERT INTO Reserva_Habitacion VALUES (1, 1);
INSERT INTO Reserva_Habitacion VALUES (2, 2);
INSERT INTO Reserva_Habitacion VALUES (1, 2);
INSERT INTO Reserva_Habitacion VALUES (1, 3);
INSERT INTO Reserva_Habitacion VALUES (2, 1);
INSERT INTO Reserva_Habitacion VALUES (2, 3);
INSERT INTO Reserva_Habitacion VALUES (3, 1);
INSERT INTO Reserva_Habitacion VALUES (3, 2);
INSERT INTO Reserva_Habitacion VALUES (4, 1);
INSERT INTO Reserva_Habitacion VALUES (4, 2);


INSERT INTO Reserva_Actividad VALUES (1, 1);
INSERT INTO Reserva_Actividad VALUES (2, 2);
INSERT INTO Reserva_Actividad VALUES (3, 1);
INSERT INTO Reserva_Actividad VALUES (4, 2);
INSERT INTO Reserva_Actividad VALUES (5, 1);
INSERT INTO Reserva_Actividad VALUES (6, 2);
INSERT INTO Reserva_Actividad VALUES (7, 1);
INSERT INTO Reserva_Actividad VALUES (8, 2);
INSERT INTO Reserva_Actividad VALUES (9, 1);
INSERT INTO Reserva_Actividad VALUES (10, 2);



INSERT INTO Servicio_Adicional VALUES (1, 'Late Check-out', 20.00);
INSERT INTO Servicio_Adicional VALUES (2, 'Wi-Fi Premium', 5.00);
INSERT INTO Servicio_Adicional VALUES (3, 'Desayuno Buffet', 15.00);
INSERT INTO Servicio_Adicional VALUES (4, 'Estacionamiento', 10.00);
INSERT INTO Servicio_Adicional VALUES (5, 'Servicio a la Habitación', 25.00);
INSERT INTO Servicio_Adicional VALUES (6, 'Spa Privado', 30.00);
INSERT INTO Servicio_Adicional VALUES (7, 'Traslado Aeropuerto', 40.00);
INSERT INTO Servicio_Adicional VALUES (8, 'Cena Romántica', 50.00);
INSERT INTO Servicio_Adicional VALUES (9, 'Lavandería Express', 12.00);
INSERT INTO Servicio_Adicional VALUES (10, 'Servicio de Concierge', 8.00);


INSERT INTO Reserva_Servicio_Adicional VALUES (1, 1, 2, 40.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (2, 2, 1, 5.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (1, 2, 3, 15.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (1, 1, 1, 20.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (2, 1, 2, 30.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (2, 2, 1, 5.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (3, 1, 3, 45.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (3, 2, 2, 10.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (4, 2, 1, 5.00);
INSERT INTO Reserva_Servicio_Adicional VALUES (4, 1, 2, 30.00);
