/* Tabla de paso del ETL para transportistas modificados (misma forma que DimShipper, con la clave sustituta ya resuelta). */
CREATE TABLE [staging].[shipper]
(
	[ShipperSK]   [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone]       [nvarchar](24) NULL
);
GO