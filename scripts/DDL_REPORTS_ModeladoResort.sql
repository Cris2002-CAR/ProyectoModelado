-- Reportes de interes para el resort 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Reporte de Ocupaci贸n: Muestra la ocupaci贸n diaria, semanal y mensual de las habitaciones
y actividades.
*/
-- Ocupaci髇 diaria de habitaciones
SELECT 
    TO_CHAR(R.Fecha, 'YYYY-MM-DD') AS Fecha, 
    COUNT(RH.ID_Habitacion) AS Total_Habitaciones_Ocupadas
FROM Reserva_Habitacion RH
JOIN Reserva R ON RH.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'YYYY-MM-DD')
ORDER BY Fecha;

-- Ocupaci髇 semanal de habitaciones
SELECT 
    TO_CHAR(R.Fecha, 'IYYY-IW') AS Semana, 
    COUNT(RH.ID_Habitacion) AS Total_Habitaciones_Ocupadas
FROM Reserva_Habitacion RH
JOIN Reserva R ON RH.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'IYYY-IW')
ORDER BY Semana;

-- Ocupaci髇 mensual de habitaciones
SELECT 
    TO_CHAR(R.Fecha, 'YYYY-MM') AS Mes, 
    COUNT(RH.ID_Habitacion) AS Total_Habitaciones_Ocupadas
FROM Reserva_Habitacion RH
JOIN Reserva R ON RH.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'YYYY-MM')
ORDER BY Mes;

---------------------------------------------------------------

-- Ocupaci髇 diaria de actividades
SELECT 
    TO_CHAR(R.Fecha, 'YYYY-MM-DD') AS Fecha, 
    COUNT(RA.ID_Actividad) AS Total_Actividades_Reservadas
FROM Reserva_Actividad RA
JOIN Reserva R ON RA.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'YYYY-MM-DD')
ORDER BY Fecha;

-- Ocupaci髇 semanal de actividades
SELECT 
    TO_CHAR(R.Fecha, 'IYYY-IW') AS Semana, 
    COUNT(RA.ID_Actividad) AS Total_Actividades_Reservadas
FROM Reserva_Actividad RA
JOIN Reserva R ON RA.ID_Reserva = R.ID_Reserva
GROUP BY TO_CHAR(R.Fecha, 'IYYY-IW')
ORDER BY Semana;

-- Ocupaci髇 mensual de actividades
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

/*
Reporte de Satisfacci贸n del Cliente: Basado en las encuestas de satisfacci贸n recopiladas al
momento del check-out.
*/
