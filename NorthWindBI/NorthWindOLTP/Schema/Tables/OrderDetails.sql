/*
  Tabla: OrderDetails
  Propósito: líneas de cada pedido. Una fila por producto vendido, con su precio,
             cantidad y descuento. La clave primaria es compuesta (OrderID, ProductID),
             así un producto no se repite dentro del mismo pedido.
  Relaciones:
    - Orders   (OrderID)   -> pedido al que pertenece la línea.
    - Products (ProductID) -> producto vendido.
  Restricciones: Discount entre 0 y 1, Quantity mayor a 0, UnitPrice no negativo.
  Nota: los índices duplicados (OrderID/OrdersOrder_Details y ProductID/ProductsOrder_Details)
        vienen del NorthWind original y se mantienen para respetar su diseño.
Nombre: la tabla se llama OrderDetails (sin espacio), igual que en la base de datos restaurada.
*/
CREATE TABLE [dbo].[OrderDetails] (
    [OrderID]    INT        NOT NULL,
    [ProductID]  INT        NOT NULL,
    [UnitPrice]  MONEY      CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT ((0)) NOT NULL,
    [Quantity]   SMALLINT   CONSTRAINT [DF_Order_Details_Quantity] DEFAULT ((1)) NOT NULL,
    [Discount]   REAL       CONSTRAINT [DF_Order_Details_Discount] DEFAULT ((0)) NOT NULL,
    [rowversion] ROWVERSION NULL,
    CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [CK_Discount] CHECK ([Discount]>=(0) AND [Discount]<=(1)),
    CONSTRAINT [CK_Quantity] CHECK ([Quantity]>(0)),
    CONSTRAINT [CK_UnitPrice] CHECK ([UnitPrice]>=(0)),
    CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]),
    CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
);


GO
CREATE NONCLUSTERED INDEX [OrderID]
    ON [dbo].[OrderDetails]([OrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [OrdersOrder_Details]
    ON [dbo].[OrderDetails]([OrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductID]
    ON [dbo].[OrderDetails]([ProductID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductsOrder_Details]
    ON [dbo].[OrderDetails]([ProductID] ASC);

