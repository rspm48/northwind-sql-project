/* Tabla de paso del ETL para productos modificados (misma forma que DimProduct, con la clave sustituta ya resuelta). */
CREATE TABLE [staging].[product]
(
	[ProductSK]       [int] NOT NULL,
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
