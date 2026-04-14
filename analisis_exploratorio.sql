WITH VentasPorEstado AS (
    SELECT 
        c.customer_state AS Estado,
        COUNT(DISTINCT o.order_id) AS Total_Ordenes,
        SUM(i.price) AS Ingresos_Totales,
        SUM(i.freight_value) AS Costo_Envio_Total
    FROM clientes c
    JOIN ordenes o ON c.customer_id = o.customer_id
    JOIN items_orden i ON o.order_id = i.order_id
    WHERE o.order_status = 'delivered' 
    GROUP BY c.customer_state
)

SELECT TOP 10
    Estado,
    Total_Ordenes,
    ROUND(Ingresos_Totales, 2) AS Ingresos_Totales_USD,
    ROUND(Ingresos_Totales / Total_Ordenes, 2) AS Ticket_Promedio_USD, -- Ticket promedio en dolares
    ROUND((Costo_Envio_Total / Ingresos_Totales) * 100, 2) AS Porcentaje_Costo_Envio -- Porcentaje del costo de envio respecto a los ingresos totales
FROM VentasPorEstado
ORDER BY Ingresos_Totales DESC;

-- ==============================================================================

WITH TendenciaMensual AS (
    SELECT 
        FORMAT(TRY_CAST(o.order_purchase_timestamp AS DATETIME2), 'yyyy-MM') AS Mes_Anio, -- Agrupamos por mes y año (formato yyyy - mm) ademas usamos TRY_CAST para evitar errores de conversion
        COUNT(DISTINCT o.order_id) AS Total_Ordenes,
        SUM(i.price) AS Ingresos_Totales
    FROM ordenes o
    JOIN items_orden i ON o.order_id = i.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY FORMAT(TRY_CAST(o.order_purchase_timestamp AS DATETIME2), 'yyyy-MM')
)
SELECT 
    Mes_Anio,
    Total_Ordenes,
    ROUND(Ingresos_Totales, 2) AS Ingresos_Totales_USD,
    ROUND(Ingresos_Totales / Total_Ordenes, 2) AS Ticket_Promedio_USD
FROM TendenciaMensual
WHERE Mes_Anio IS NOT NULL
ORDER BY Mes_Anio ASC;