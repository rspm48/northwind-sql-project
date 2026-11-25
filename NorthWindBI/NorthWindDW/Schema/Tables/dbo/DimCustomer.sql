/*
  Tabla: dbo.DimCustomer (dimensión de clientes)
  Responsable: Persona 2
  Origen: NorthWindOLTP.dbo.Customers (+ CustomerDesc de CustomerDemographics)
  Contenido propuesto:
    CustomerSK int IDENTITY(1,1) PK (clave sustituta)
    CustomerID nchar(5) NOT NULL (clave del origen)
    CompanyName nvarchar(40) NOT NULL
    ContactName nvarchar(30) NULL
    ContactTitle nvarchar(30) NULL
    Address nvarchar(60) NULL
    City nvarchar(15) NULL
    Region nvarchar(15) NULL
    PostalCode nvarchar(10) NULL
    Country nvarchar(15) NULL
    Phone nvarchar(24) NULL
    Fax nvarchar(24) NULL
    CustomerDesc nvarchar(MAX) NULL
  Nota: Mismas columnas que devuelve GetCustomerChangesByRowVersion (sin rowversion).

  TODO: reemplazar este comentario por el script real (dejando un comentario corto de propósito).
*/
