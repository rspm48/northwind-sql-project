/*
  Tabla: dbo.DimShipper (dimensión de transportistas)
  Responsable: Persona 1
  Origen: NorthWindOLTP.dbo.Shippers
  Contenido propuesto:
    ShipperSK int IDENTITY(1,1) PK (clave sustituta)
    ShipperID int NOT NULL (clave del origen)
    CompanyName nvarchar(40) NOT NULL
    Phone nvarchar(24) NULL

  TODO: reemplazar este comentario por el script real (dejando un comentario corto de propósito).
*/
