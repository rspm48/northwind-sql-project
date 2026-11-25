/*
  Tabla: dbo.DimEmployee (dimensión de empleados)
  Responsable: Persona 3
  Origen: NorthWindOLTP.dbo.Employees
  Contenido propuesto:
    EmployeeSK int IDENTITY(1,1) PK (clave sustituta)
    EmployeeID int NOT NULL (clave del origen)
    LastName nvarchar(20) NOT NULL
    FirstName nvarchar(10) NOT NULL
    Title nvarchar(30) NULL
    TitleOfCourtesy nvarchar(25) NULL
    BirthDate datetime NULL
    HireDate datetime NULL
    Address nvarchar(60) NULL
    City nvarchar(15) NULL
    Region nvarchar(15) NULL
    PostalCode nvarchar(10) NULL
    Country nvarchar(15) NULL
    HomePhone nvarchar(24) NULL
    Extension nvarchar(4) NULL
    ReportsTo int NULL
  Nota: GetEmployeeChangesByRowVersion también devuelve TerritoryDescription y RegionDescription (une Territories y Region). Como un empleado cubre varios territorios, eso genera una fila por empleado y territorio. Decidir en equipo si se incluyen (entonces la clave de negocio ya no es única) o se dejan fuera. Se omiten Photo, Notes y PhotoPath.

  TODO: reemplazar este comentario por el script real (dejando un comentario corto de propósito).
*/
