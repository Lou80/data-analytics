/*
RetailPro - Pre-entrega 4
Archivo: m4_consultas_negocio.sql
Base de datos: Ventas_Tech_DB
Motor: Microsoft SQL Server

Consultas de negocio utilizando la tabla ventas.
*/

USE Ventas_Tech_DB;

-- =========================================================
-- CONSULTA 1: RESUMEN EJECUTIVO MENSUAL
-- Total facturado, cantidad de pedidos y ticket promedio
-- agrupados por mes.
-- =========================================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- =========================================================
-- CONSULTA 2: RANKING DE PRODUCTOS
-- Top 5 de productos por total facturado.
-- También se muestran las unidades vendidas.
-- =========================================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-- =========================================================
-- CONSULTA 3: CLIENTES RECURRENTES
-- Clientes con más de un pedido, cantidad de pedidos
-- y total gastado.
-- =========================================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;


-- =========================================================
-- CONSULTA 4: PRODUCTOS POR ENCIMA / POR DEBAJO DEL PROMEDIO
-- Se calcula primero el total facturado por producto.
-- Luego se compara cada total con el promedio de esos totales.
-- =========================================================

WITH ventas_por_producto AS (
    SELECT
        id_producto,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY id_producto
)
SELECT
    id_producto,
    total_facturado,
    CASE
        WHEN total_facturado > (
            SELECT AVG(total_facturado)
            FROM ventas_por_producto
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_con_promedio
FROM ventas_por_producto
ORDER BY total_facturado DESC;


-- =========================================================
-- HALLAZGOS
-- Tres observaciones concretas obtenidas de los datos de M3.
-- =========================================================

-- 1. El producto 1 lidera la facturación con $3.600,00,
--    sobre un total general de $6.444,00.

-- 2. El producto 3 ocupa el segundo lugar, con $1.350,00
--    facturados. Los productos 1 y 3 superan el promedio
--    de facturación por producto, que es $1.074,00.

-- 3. Los cinco clientes realizaron más de un pedido:
--    cada uno registra 2 pedidos. El cliente 1 presenta
--    el mayor gasto acumulado, con $2.640,00.
