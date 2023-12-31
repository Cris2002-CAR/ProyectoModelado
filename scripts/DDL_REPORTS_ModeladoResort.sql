-- Reportes de interes para el resort 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Reporte de Ocupación: Muestra la ocupación diaria, semanal y mensual de las habitaciones
y actividades.
*/
-- Ocupaci�n diaria de habitaciones
SELECT 
    TO_CHAR(R.Fecha, 'YYYY-MM-DD') AS Fecha, 
    COUNT(RH.ID_Habitacion) AS Total_Habitaciones_Ocupadas
FROM Reserva_Habitacion RH
JOIN Reserva R ON RH.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'YYYY-MM-DD')
ORDER BY Fecha;

-- Ocupaci�n semanal de habitaciones
SELECT 
    TO_CHAR(R.Fecha, 'IYYY-IW') AS Semana, 
    COUNT(RH.ID_Habitacion) AS Total_Habitaciones_Ocupadas
FROM Reserva_Habitacion RH
JOIN Reserva R ON RH.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'IYYY-IW')
ORDER BY Semana;

-- Ocupaci�n mensual de habitaciones
SELECT 
    TO_CHAR(R.Fecha, 'YYYY-MM') AS Mes, 
    COUNT(RH.ID_Habitacion) AS Total_Habitaciones_Ocupadas
FROM Reserva_Habitacion RH
JOIN Reserva R ON RH.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'YYYY-MM')
ORDER BY Mes;

---------------------------------------------------------------

-- Ocupaci�n diaria de actividades
SELECT 
    TO_CHAR(R.Fecha, 'YYYY-MM-DD') AS Fecha, 
    COUNT(RA.ID_Actividad) AS Total_Actividades_Reservadas
FROM Reserva_Actividad RA
JOIN Reserva R ON RA.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'YYYY-MM-DD')
ORDER BY Fecha;

-- Ocupaci�n semanal de actividades
SELECT 
    TO_CHAR(R.Fecha, 'IYYY-IW') AS Semana, 
    COUNT(RA.ID_Actividad) AS Total_Actividades_Reservadas
FROM Reserva_Actividad RA
JOIN Reserva R ON RA.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'IYYY-IW')
ORDER BY Semana;

-- Ocupaci�n mensual de actividades
SELECT 
    TO_CHAR(R.Fecha, 'YYYY-MM') AS Mes, 
    COUNT(RA.ID_Actividad) AS Total_Actividades_Reservadas
FROM Reserva_Actividad RA
JOIN Reserva R ON RA.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'YYYY-MM')
ORDER BY Mes;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
Reporte de Ingresos: Genera un informe de ingresos diarios, semanales y mensuales
desglosado por habitaciones, actividades y servicios adicionales.
*/
--ingresos por habitaciones
SELECT 
    TO_CHAR(Fecha, 'YYYY-MM-DD') AS Fecha,
    SUM(Costo_por_noche) AS Ingresos_Habitaciones
FROM Reserva
JOIN Reserva_Habitacion ON Reserva.ID_Reserva = Reserva_Habitacion.ID_Reserva
JOIN Habitacion ON Reserva_Habitacion.ID_Habitacion = Habitacion.ID_Habitacion
GROUP BY TO_CHAR(Fecha, 'YYYY-MM-DD');

SELECT 
    TO_CHAR(Fecha, 'IYYY-IW') AS Semana,
    SUM(Costo_por_noche) AS Ingresos_Habitaciones
FROM Reserva
JOIN Reserva_Habitacion ON Reserva.ID_Reserva = Reserva_Habitacion.ID_Reserva
JOIN Habitacion ON Reserva_Habitacion.ID_Habitacion = Habitacion.ID_Habitacion
GROUP BY TO_CHAR(Fecha, 'IYYY-IW');

SELECT 
    TO_CHAR(Fecha, 'YYYY-MM') AS Mes,
    SUM(Costo_por_noche) AS Ingresos_Habitaciones
FROM Reserva
JOIN Reserva_Habitacion ON Reserva.ID_Reserva = Reserva_Habitacion.ID_Reserva
JOIN Habitacion ON Reserva_Habitacion.ID_Habitacion = Habitacion.ID_Habitacion
GROUP BY TO_CHAR(Fecha, 'YYYY-MM');


--ingresos por actividades
SELECT 
    TO_CHAR(Fecha, 'YYYY-MM-DD') AS Fecha,
    SUM(Actividad.Costo) AS Ingresos_Actividades
FROM Reserva
JOIN Reserva_Actividad ON Reserva.ID_Reserva = Reserva_Actividad.ID_Reserva
JOIN Actividad ON Reserva_Actividad.ID_Actividad = Actividad.ID_Actividad
GROUP BY TO_CHAR(Fecha, 'YYYY-MM-DD');

SELECT 
    TO_CHAR(Fecha, 'IYYY-IW') AS Semana,
    SUM(Actividad.Costo) AS Ingresos_Actividades
FROM Reserva
JOIN Reserva_Actividad ON Reserva.ID_Reserva = Reserva_Actividad.ID_Reserva
JOIN Actividad ON Reserva_Actividad.ID_Actividad = Actividad.ID_Actividad
GROUP BY TO_CHAR(Fecha, 'IYYY-IW');

SELECT 
    TO_CHAR(Fecha, 'YYYY-MM') AS Mes,
    SUM(Actividad.Costo) AS Ingresos_Actividades
FROM Reserva
JOIN Reserva_Actividad ON Reserva.ID_Reserva = Reserva_Actividad.ID_Reserva
JOIN Actividad ON Reserva_Actividad.ID_Actividad = Actividad.ID_Actividad
GROUP BY TO_CHAR(Fecha, 'YYYY-MM');


--ingresos por servicios adicionales

SELECT 
    TO_CHAR(Fecha, 'YYYY-MM-DD') AS Fecha,
    SUM(Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Servicios_Adicionales
FROM Reserva
JOIN Reserva_Servicio_Adicional ON Reserva.ID_Reserva = Reserva_Servicio_Adicional.ID_Reserva
JOIN Servicio_Adicional ON Reserva_Servicio_Adicional.ID_Servicio = Servicio_Adicional.ID_Servicio
GROUP BY TO_CHAR(Fecha, 'YYYY-MM-DD');

SELECT 
    TO_CHAR(Fecha, 'IYYY-IW') AS Semana,
    SUM(Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Servicios_Adicionales
FROM Reserva
JOIN Reserva_Servicio_Adicional ON Reserva.ID_Reserva = Reserva_Servicio_Adicional.ID_Reserva
GROUP BY TO_CHAR(Fecha, 'IYYY-IW');

SELECT 
    TO_CHAR(Fecha, 'YYYY-MM') AS Mes,
    SUM(Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Servicios_Adicionales
FROM Reserva
JOIN Reserva_Servicio_Adicional ON Reserva.ID_Reserva = Reserva_Servicio_Adicional.ID_Reserva
JOIN Servicio_Adicional ON Reserva_Servicio_Adicional.ID_Servicio = Servicio_Adicional.ID_Servicio
GROUP BY TO_CHAR(Fecha, 'YYYY-MM');


/*
Reporte de Satisfacción del Cliente: Basado en las encuestas de satisfacción recopiladas al
momento del check-out.
*/

-- Obtener promedios
SELECT 
    AVG(Calificacion_Servicio) AS Promedio_Servicio,
    AVG(Calificacion_Limpieza) AS Promedio_Limpieza,
    AVG(Calificacion_Comodidades) AS Promedio_Comodidades
FROM Encuesta_Satisfaccion;

-- Obtener los últimos 10 comentarios
SELECT 
    Comentarios
FROM 
    Encuesta_Satisfaccion
ORDER BY 
    Fecha_Encuesta DESC 
FETCH FIRST 10 ROWS ONLY;

