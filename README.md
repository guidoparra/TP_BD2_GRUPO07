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
- Historial de cambios de precio de los productos.
- Consultas de productos con bajo stock, productos más vendidos y ventas por período.

## Estructura del repositorio

```
├── README.md
├── PetShop_Script.sql   → Script completo: base, tablas, restricciones, vistas,
│                          procedimientos, triggers y datos de ejemplo
└── pruebas_demo.sql     → Consultas de prueba usadas en el video demo
```

## Objetos de la base de datos

**Tablas:** Categoria, Proveedor, Producto, HistorialPrecio, Cliente, Venta, DetalleVenta, Compra, DetalleCompra

| Tipo | Nombre | Descripción |
|---|---|---|
| Vista | `vw_VentasDetalladas` | Ventas con cliente, estado y total |
| Vista | `vw_ProductosBajoStock` | Productos que necesitan reposición |
| Vista | `vw_ProductosMasVendidos` | Ranking de productos vendidos |
| Vista | `vw_ResumenPorCliente` | Cantidad de compras y total gastado por cliente |
| Procedimiento | `sp_AgregarProductoAVenta` | Agrega un producto a una venta con el precio vigente |
| Procedimiento | `sp_AgregarProductoACompra` | Agrega un producto a una compra a proveedor |
| Procedimiento | `sp_VentasPorPeriodo` | Ventas y total recaudado entre dos fechas |
| Procedimiento | `sp_AnularVenta` | Anula una venta sin borrarla |
| Trigger | `trg_DescontarStockVenta` | Valida y descuenta stock al vender |
| Trigger | `trg_SumarStockCompra` | Suma stock al registrar una compra |
| Trigger | `trg_HistorialPrecio` | Registra los cambios de precio |
| Trigger | `trg_DevolverStockAnulacion` | Devuelve el stock al anular una venta |


