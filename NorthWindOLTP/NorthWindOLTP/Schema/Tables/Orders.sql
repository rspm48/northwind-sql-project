/*
  Tabla: Orders
  Propósito: cabecera de cada pedido. Guarda quién lo pidió, quién lo atendió,
             las fechas (pedido, requerido, envío) y los datos de entrega.
  Relaciones:
    - Customers  (CustomerID)            -> cliente que hizo el pedido.
    - Employees  (EmployeeID)            -> empleado que registró el pedido.
    - Shippers   (ShipVia -> ShipperID)  -> empresa que transporta el pedido.
    - OrderDetails (OrderID)             -> productos incluidos en el pedido.
  Nota: los índices duplicados (CustomerID/CustomersOrders y EmployeeID/EmployeesOrders)
        vienen del NorthWind original y se mantienen para respetar el diseño.
*/
CREATE TABLE [dbo].[Orders] (
    [OrderID]        INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]     NCHAR (5)     NULL,
    [EmployeeID]     INT           NULL,
    [OrderDate]      DATETIME      NULL,
    [RequiredDate]   DATETIME      NULL,
    [ShippedDate]    DATETIME      NULL,
    [ShipVia]        INT           NULL,
    [Freight]        MONEY         CONSTRAINT [DF_Orders_Freight] DEFAULT ((0)) NULL,
    [ShipName]       NVARCHAR (40) NULL,
    [ShipAddress]    NVARCHAR (60) NULL,
    [ShipCity]       NVARCHAR (15) NULL,
    [ShipRegion]     NVARCHAR (15) NULL,
    [ShipPostalCode] NVARCHAR (10) NULL,
    [ShipCountry]    NVARCHAR (15) NULL,
    [rowversion]     ROWVERSION    NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeID]),
    CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY ([ShipVia]) REFERENCES [dbo].[Shippers] ([ShipperID])
);


GO
CREATE NONCLUSTERED INDEX [CustomerID]
    ON [dbo].[Orders]([CustomerID] ASC);


GO
CREATE NONCLUSTERED INDEX [CustomersOrders]
    ON [dbo].[Orders]([CustomerID] ASC);


GO
CREATE NONCLUSTERED INDEX [EmployeeID]
    ON [dbo].[Orders]([EmployeeID] ASC);


GO
CREATE NONCLUSTERED INDEX [EmployeesOrders]
    ON [dbo].[Orders]([EmployeeID] ASC);


GO
CREATE NONCLUSTERED INDEX [OrderDate]
    ON [dbo].[Orders]([OrderDate] ASC);


GO
CREATE NONCLUSTERED INDEX [ShippedDate]
    ON [dbo].[Orders]([ShippedDate] ASC);


GO
CREATE NONCLUSTERED INDEX [ShippersOrders]
    ON [dbo].[Orders]([ShipVia] ASC);


GO
CREATE NONCLUSTERED INDEX [ShipPostalCode]
    ON [dbo].[Orders]([ShipPostalCode] ASC);

