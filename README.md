Analisis End-to-End de E-commerce: Ventas, Logística y Segmentación RFM
[Dashboard_EcommerceDB.pdf](https://github.com/user-attachments/files/26970064/Dashboard_EcommerceDB.pdf)
# Análisis End-to-End de E-commerce: Ventas, Logística y Segmentación RFM 📊


## Descripción del Proyecto
Este proyecto contiene un analisis integral de datos de un E-commerce (basado en el dataset público de Olist). El objetivo principal fue construir un pipeline de datos de extremo a extremo para transformar registros transaccionales crudos en *insights* de negocio accionables, evaluando el rendimiento geográfico, la eficiencia logística y el valor de vida del cliente (LTV).

## Arquitectura y Tecnologías Utilizadas
El flujo de trabajo sigue una arquitectura ELT/ETL moderna, dividida en tres fases:

1. **Extracción y Carga (Python / Pandas / SQLAlchemy):** - Conexión a base de datos mediante ODBC.
   - Limpieza inicial, estandarización de metadatos y carga masiva a SQL Server.
2. **Transformación y Análisis (SQL Server / T-SQL):** - Limpieza de datos en destino (ELT) utilizando funciones seguras como `TRY_CAST`.
   - Uso de *Common Table Expressions (CTEs)*, `JOINs` complejos y funciones de agregación y tiempo (`DATEDIFF`) para resolver preguntas de negocio.
3. **Modelado Estadístico y Visualización (Python + Power BI):** - **Python:** Desarrollo de un modelo de segmentación de clientes **RFM** (Recency, Frequency, Monetary) utilizando percentiles (`pd.qcut`) y visualización con matplotlib.
   - **Power BI:** Modelado de datos relacional, creación de medidas **DAX** (incluyendo funciones de filtro como `CALCULATE` y `ALL`), y diseño de un dashboard interactivo.

## 📈 Preguntas de Negocio Resueltas
El análisis responde a las siguientes métricas clave a través de consultas SQL optimizadas:
* **Rendimiento Geográfico:** Identificación del Top 10 de estados por ingresos, análisis del ticket promedio y la incidencia porcentual del costo de envío sobre las ventas.
* **Tendencia Temporal:** Evolución histórica de la facturación mes a mes para la detección de estacionalidades.
* **Eficiencia Logística:** Cálculo de los tiempos de entrega promedio, máximos y mínimos por estado para detectar cuellos de botella operativos.
* **Segmentación de Clientes:** Identificación de usuarios VIPs basada en frecuencia de compra y valor monetario total.

## 💡 Insights Clave Descubiertos
* **Concentración de Ingresos:** El estado de São Paulo (SP) lidera ampliamente el volumen de facturación con más de $5M, manteniendo un ticket promedio competitivo.
* **Oportunidad de Retención:** Según el modelo RFM, el segmento de clientes "Prometedores" representa una porción significativa de la base, indicando una gran oportunidad para campañas de fidelización y remarketing.
* **Brecha Logística:** Se detectaron variaciones significativas en los tiempos de entrega promedio según la zona geográfica, lo que impacta directamente en la experiencia del usuario de las zonas más alejadas.

## 📂 Estructura del Repositorio
* `notebook.ipynb`: Script de extracción y carga (ETL) hacia SQL Server.
* `2_Analisis_Exploratorio.sql`: Consultas T-SQL con la resolución lógica de los KPIs.
* `3_Modelo_RFM.ipynb`: Script de modelado de datos en Python para la segmentación RFM.
* `Dashboard_Ecommerce.pbix`: Archivo fuente interactivo del dashboard en Power BI.
* `Dashboard_Ecommerce.pdf`: Exportación visual del dashboard para referencia rápida.

---
Contacto: www.linkedin.com/in/bautista-gonzalez-alonzo-64819926a
