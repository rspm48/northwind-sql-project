/*
  Tabla: dbo.FactOrders (HECHOS)
  Responsable: Persona 4 (Fase 2: se escribe cuando las 5 dimensiones estén unidas a main)
  Origen: NorthWindOLTP.dbo.OrderDetails + Orders
  Contenido propuesto:
    OrderID int NOT NULL, ProductID int NOT NULL  (clave primaria compuesta)
    OrderDateKey, RequiredDateKey, ShippedDateKey int NOT NULL  (FK a DimDate; 0 = fecha desconocida)
    CustomerSK, EmployeeSK, ShipperSK int NULL  (FK a DimCustomer, DimEmployee, DimShipper)
    ProductSK int NOT NULL  (FK a DimProduct)
    Quantity smallint, UnitPrice decimal(10,2), Discount decimal(4,2), GrossAmount, DiscountAmount, NetAmount decimal(12,2)
  Nota: Granularidad: una fila por línea de pedido. Freight no se incluye.

  TODO: reemplazar este comentario por el script real (dejando un comentario corto de propósito).
*/
