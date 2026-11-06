# RetailPro — Proyecto de Análisis de Datos

## Descripción del proyecto

RetailPro es un proyecto académico de análisis de datos comerciales desarrollado con SQL Server y Power BI.

Su objetivo es transformar información de ventas, clientes, productos y categorías en indicadores que permitan comprender el desempeño comercial y apoyar la toma de decisiones.

## Objetivos

- Analizar la facturación y la cantidad de pedidos por período.
- Identificar los productos con mayor facturación y volumen de ventas.
- Explorar el desempeño comercial por ciudad y categoría.
- Preparar y limpiar los datos para su análisis.
- Construir un modelo relacional en Power BI.
- Crear medidas DAX para analizar ventas y comparaciones temporales.

## Herramientas utilizadas

- **SQL Server:** almacenamiento y consulta de datos.
- **SQL Server Management Studio (SSMS):** ejecución de scripts SQL.
- **Power BI Desktop:** modelado y análisis de información.
- **Power Query:** extracción, transformación y limpieza de datos.
- **DAX:** creación de indicadores y cálculos.
- **GitHub:** control de versiones y documentación.

## Estructura del proyecto

```text
data-analytics/
└── RetailPro/
    ├── ventas_tech_db.sql
    ├── m4_consultas_negocio.sql
    ├── m5_consultas_joins.sql
    └── README.md
```

### Archivos SQL

| Archivo | Descripción |
|---|---|
| `ventas_tech_db.sql` | Script de base de datos del proyecto. |
| `m4_consultas_negocio.sql` | Consultas de análisis comercial, incluyendo resumen mensual y ranking de productos. |
| `m5_consultas_joins.sql` | Consultas que combinan información de distintas tablas mediante JOINs. |

## Cómo ejecutar los scripts SQL

1. Abrir SQL Server Management Studio (SSMS).
2. Conectarse a una instancia de SQL Server.
3. Abrir `ventas_tech_db.sql` y ejecutarlo según las instrucciones incluidas en el script, para preparar la base de datos del proyecto.
4. Abrir `m4_consultas_negocio.sql` y ejecutar las consultas comerciales.
5. Abrir `m5_consultas_joins.sql` y ejecutar las consultas con JOINs.
6. Revisar los resultados obtenidos.

**Nota:** antes de ejecutar los scripts, verificar que esté seleccionada la base de datos correcta. La ejecución del script inicial puede crear o modificar objetos de la base de datos.

## Resultados del análisis SQL

En los datos analizados correspondientes al mes 3 (marzo) se obtuvieron los siguientes indicadores:

| Indicador | Resultado |
|---|---:|
| Facturación total | 6.444,00 |
| Cantidad de pedidos | 10 |
| Ticket promedio | 644,40 |

El ranking de productos permitió identificar diferencias entre facturación y unidades vendidas, relevantes para el análisis comercial.

Estos resultados corresponden al conjunto de datos utilizado en la práctica y no representan una tendencia histórica.

## Modelo de datos en Power BI

El modelo analítico utiliza las siguientes tablas:

- `Fact_Ventas`: información de las transacciones.
- `Dim_Clientes`: datos de clientes.
- `Dim_Productos`: información de productos.
- `Dim_Categorias`: clasificación de productos.
- `Dim_Fechas`: calendario para el análisis temporal.

Las tablas se relacionan mediante relaciones activas de uno a muchos (1:N).

### Medidas DAX

Se implementaron cinco medidas principales:

- `Total Ventas`
- `Ventas Online`
- `Ventas YTD`
- `Ventas LY`
- `% Crecimiento Anual`

Estas medidas permiten analizar la facturación general, las ventas del canal online y comparaciones temporales.

## Uso de inteligencia artificial

Se utilizó IA como herramienta de apoyo para revisar consultas SQL, proponer hallazgos comerciales y generar documentación técnica.

Las sugerencias fueron evaluadas críticamente y los resultados numéricos se contrastaron con las consultas SQL originales.

## Estado del proyecto

Proyecto académico desarrollado progresivamente como parte de una formación en análisis de datos.
