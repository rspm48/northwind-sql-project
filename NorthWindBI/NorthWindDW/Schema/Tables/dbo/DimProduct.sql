/*
  Tabla: dbo.DimProduct (dimensión de productos)
  Propósito: describe cada producto con su categoría y su proveedor ya incluidos
             (desnormalizados), para analizar las ventas sin hacer uniones.
  Origen: NorthWindOLTP.dbo.Products, Categories y Suppliers
          (mismas columnas que devuelve GetProductChangesByRowVersion).
  Claves: ProductSK es la clave sustituta (autonumérica) y ProductID es la clave del origen.
  Responsable: Persona 4.
*/
CREATE TABLE [dbo].[DimProduct]
(
	[ProductSK]       [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimProduct PRIMARY KEY,
	[ProductID]       [int] NOT NULL,
	[ProductName]     [nvarchar](40) NOT NULL,
	[SupplierName]    [nvarchar](40) NOT NULL,
	[CategoryName]    [nvarchar](15) NOT NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[ListPrice]       [decimal](10, 2) NULL,
	[UnitsInStock]    [smallint] NULL,
	[UnitsOnOrder]    [smallint] NULL,
	[ReorderLevel]    [smallint] NULL,
	[Discontinued]    [bit] NOT NULL
);
GO
