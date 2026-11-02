# TP_BD2_GRUPO07
Base de datos SQL Server para la gestión de un Pet Shop. TP Integrador de Base de Datos II – UTN FRGP, Equipo 07.

# Pet Shop – Base de Datos

Trabajo Práctico Integrador de **Base de Datos II**
Tecnicatura Universitaria en Programación – UTN Facultad Regional General Pacheco

## Equipo 07

| Integrante | Legajo |
|---|---|
| Maffey, Lucía Aylen | 31862 |
| Parra, Guido Emanuel | 32278 |
| Rivero, Camila Milagros | 32508 |
| Uzzeni, Dante | 33274 |

## Descripción del sistema

Base de datos relacional en **SQL Server** para la gestión de un Pet Shop. Permite administrar productos, categorías, proveedores, clientes, ventas y compras a proveedores, y mantiene el stock actualizado de forma automática a partir de las operaciones registradas.

Funcionalidades principales:

- Registro de clientes, proveedores y productos organizados por categoría.
- Registro de ventas con detalle de productos, cantidades y precio al momento de la venta.
- Registro de compras a proveedores para la reposición de mercadería.
- Anulación de ventas sin pérdida del historial, con devolución automática del stock.
- Consultas de productos con bajo stock, productos más vendidos, ventas por período y resumen por cliente.

## Estructura del repositorio

```
├── README.md
├── PetShop_Script.sql          → Script final unificado (se arma al cierre del proyecto)
└── sql/
    ├── 00_crear_base.sql       → Crea la base PetShop desde cero
    ├── 01_tablas/              → Un archivo por integrante
    ├── 02_datos/               → Un archivo por integrante
    ├── 03_funciones/
    ├── 04_vistas/
    ├── 05_triggers/
    ├── 06_procedimientos/
    └── 07_pruebas/             → Casos de prueba usados en el video demo
```

 Nombre de los archivos de tablas y datos:

| Orden | Archivo | Responsable |
|---|---|---|
| 01 | `01_cliente_proveedor.sql` | Dante |
| 02 | `02_categoria_producto.sql` | Lucía |
| 03 | `03_venta_detalleventa.sql` | Guido |
| 04 | `04_compra_detallecompra.sql` | Camila |

Funciones, vistas, triggers y procedimientos: un archivo por objeto, con el nombre del objeto (ej: `vw_VentasDetalladas.sql`).

## Orden de ejecución

1. `sql/00_crear_base.sql`
2. `sql/01_tablas/` en orden numérico (01 → 04)
3. `sql/02_datos/` en orden numérico (01 → 04)
4. `sql/03_funciones/`
5. `sql/04_vistas/`
6. `sql/05_triggers/`
7. `sql/06_procedimientos/`


## Objetos de la base de datos

**Tablas:** Cliente, Proveedor, Categoria, Producto, Venta, DetalleVenta, Compra, DetalleCompra

| Tipo | Nombre | Descripción | Responsable |
|---|---|---|---|
| Función | `fn_TotalVenta` | Devuelve el total de una venta | Dante |
| Vista | `vw_VentasDetalladas` | Líneas de venta con cliente, producto, subtotal y estado | Guido |
| Vista | `vw_ProductosBajoStock` | Productos que necesitan reposición | Camila |
| Vista | `vw_ProductosMasVendidos` | Ranking de productos vendidos | Lucía |
| Vista | `vw_ResumenPorCliente` | Cantidad de compras y total gastado por cliente (usa `fn_TotalVenta`) | Dante |
| Procedimiento (acción) | `sp_AgregarProductoAVenta` | Agrega un producto a una venta con el precio vigente | Guido |
| Procedimiento (acción) | `sp_AgregarProductoACompra` | Agrega un producto a una compra a proveedor | Camila |
| Procedimiento (reporte) | `sp_VentasPorPeriodo` | Ventas y total recaudado entre dos fechas | Lucía |
| Procedimiento (acción) | `sp_AnularVenta` | Anula una venta sin borrarla | Dante |
| Trigger INSERT | `trg_DescontarStockVenta` | Valida y descuenta stock al vender | Guido |
| Trigger INSERT | `trg_SumarStockCompra` | Suma stock al registrar una compra | Camila |
| Trigger DELETE | `trg_DevolverStockDetalleVenta` | Devuelve el stock al eliminar una línea de venta | Lucía |
| Trigger UPDATE | `trg_DevolverStockAnulacion` | Devuelve el stock al anular una venta | Dante |


- Documento PDF: *(link)*
- Video demo: *(link)*
