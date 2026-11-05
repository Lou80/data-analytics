-- RetailPro - Pre-entrega 5: Consultas con JOINs
-- Base de datos: Ventas_Tech_DB
-- Motor: Microsoft SQL Server
-- Ejecutar sobre la base de datos creada en el Modulo 3.

USE Ventas_Tech_DB;

-- Consulta 1: Vista base del proyecto (INNER JOIN)
-- Proposito: reunir los datos de ventas, clientes, productos y categorias
-- en una sola consulta para el futuro dashboard de Power BI.
SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad AS ciudad_cliente,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta, v.id_venta;
-- Hallazgo: la vista permite analizar la facturacion por ciudad y categoria,
-- ademas de identificar que clientes y productos participan en cada venta.

-- Consulta 2: Clientes sin ventas (LEFT JOIN)
-- Proposito: identificar clientes registrados que todavia no compraron,
-- para que el area de CRM pueda planificar acciones de contacto.
SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.nombre;
-- Hallazgo: con los datos cargados en M3, no aparecen clientes sin compras (0).
-- CRM no tiene clientes inactivos por primera compra en esta muestra.

-- Consulta 3: Productos sin ventas (LEFT JOIN)
-- Proposito: detectar articulos del catalogo que aun no registraron ventas.
SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL
ORDER BY p.nombre_producto;
-- Hallazgo: con los datos cargados en M3, no aparecen productos sin ventas (0).
-- El area de producto no detecta articulos sin movimiento en esta muestra.

-- Consulta 4: Consolidado por periodo (UNION ALL)
-- Proposito: comparar la facturacion de dos periodos con ventas
-- de marzo de 2024. La columna canal se crea como texto fijo en cada SELECT.
SELECT
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Del 1 al 10 de marzo' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-03-01'
      AND fecha_venta < '2024-03-11'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Del 11 al 15 de marzo' AS canal
    FROM ventas
    WHERE fecha_venta >= '2024-03-11'
      AND fecha_venta < '2024-03-16'
) AS consolidado
GROUP BY canal
ORDER BY canal;
-- Hallazgo: del 1 al 10 de marzo se facturaron $3.620 (56,2% del total),
-- frente a $2.824 (43,8%) del 11 al 15 de marzo.
