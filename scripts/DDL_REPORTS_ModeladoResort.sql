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
-- Ingresos diarios
SELECT 
    TO_CHAR(Fecha, 'YYYY-MM-DD') AS Fecha,
     SUM(Costo_por_noche) AS Ingresos_Habitaciones,
    SUM(Actividad.Costo) AS Ingresos_Actividades,
    SUM(Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Servicios_Adicionales,
    SUM(Costo_por_noche + Actividad.Costo +  Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Totales
FROM Reserva
JOIN Reserva_Habitacion ON Reserva.ID_Reserva = Reserva_Habitacion.ID_Reserva
JOIN Habitacion ON Reserva_Habitacion.ID_Habitacion = Habitacion.ID_Habitacion
JOIN Reserva_Actividad ON Reserva.ID_Reserva = Reserva_Actividad.ID_Reserva
JOIN Actividad ON Reserva_Actividad.ID_Actividad = Actividad.ID_Actividad
JOIN Reserva_Servicio_Adicional ON Reserva.ID_Reserva = Reserva_Servicio_Adicional.ID_Reserva
JOIN Servicio_Adicional ON Reserva_Servicio_Adicional.ID_Servicio = Servicio_Adicional.ID_Servicio
GROUP BY TO_CHAR(Fecha, 'YYYY-MM-DD');

-- Ingresos semanales
SELECT 
    TO_CHAR(Fecha, 'IYYY-IW') AS Semana,
    SUM(Costo_por_noche) AS Ingresos_Habitaciones,
    SUM(Actividad.Costo) AS Ingresos_Actividades,
    SUM(Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Servicios_Adicionales,
    SUM(Costo_por_noche + Actividad.Costo +  Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Totales
FROM Reserva
JOIN Reserva_Habitacion ON Reserva.ID_Reserva = Reserva_Habitacion.ID_Reserva
JOIN Habitacion ON Reserva_Habitacion.ID_Habitacion = Habitacion.ID_Habitacion
JOIN Reserva_Actividad ON Reserva.ID_Reserva = Reserva_Actividad.ID_Reserva
JOIN Actividad ON Reserva_Actividad.ID_Actividad = Actividad.ID_Actividad
JOIN Reserva_Servicio_Adicional ON Reserva.ID_Reserva = Reserva_Servicio_Adicional.ID_Reserva
JOIN Servicio_Adicional ON Reserva_Servicio_Adicional.ID_Servicio = Servicio_Adicional.ID_Servicio
GROUP BY TO_CHAR(Fecha, 'IYYY-IW');

-- Ingresos mensuales
SELECT 
    TO_CHAR(Fecha, 'YYYY-MM') AS Mes,
    SUM(Costo_por_noche) AS Ingresos_Habitaciones,
    SUM(Actividad.Costo) AS Ingresos_Actividades,
    SUM(Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Servicios_Adicionales,
    SUM(Costo_por_noche + Actividad.Costo +  Reserva_Servicio_Adicional.Costo_Total) AS Ingresos_Totales
FROM Reserva
JOIN Reserva_Habitacion ON Reserva.ID_Reserva = Reserva_Habitacion.ID_Reserva
JOIN Habitacion ON Reserva_Habitacion.ID_Habitacion = Habitacion.ID_Habitacion
JOIN Reserva_Actividad ON Reserva.ID_Reserva = Reserva_Actividad.ID_Reserva
JOIN Actividad ON Reserva_Actividad.ID_Actividad = Actividad.ID_Actividad
JOIN Reserva_Servicio_Adicional ON Reserva.ID_Reserva = Reserva_Servicio_Adicional.ID_Reserva
JOIN Servicio_Adicional ON Reserva_Servicio_Adicional.ID_Servicio = Servicio_Adicional.ID_Servicio
GROUP BY TO_CHAR(Fecha, 'YYYY-MM');


/*
Reporte de Satisfacción del Cliente: Basado en las encuestas de satisfacción recopiladas al
momento del check-out.
*/
