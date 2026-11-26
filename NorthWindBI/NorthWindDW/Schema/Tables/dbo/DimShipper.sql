/*
  Tabla: dbo.DimShipper (dimensión de transportistas)
  Propósito: describe cada empresa de transporte, para analizar los pedidos por transportista.
  Origen: NorthWindOLTP.dbo.Shippers (mismos tipos y tamaños).
  Claves: ShipperSK es la clave sustituta (autonumérica) y ShipperID es la clave del origen.
  Responsable: Persona 1.
*/
CREATE TABLE [dbo].[DimShipper]
(
	[ShipperSK]   [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimShipper PRIMARY KEY,
	[ShipperID]   [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone]       [nvarchar](24) NULL
);
GO