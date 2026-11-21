/*******************************************************************************
  Tabla       : dbo.Employees
  Base datos  : NorthWind
  Descripción : Catálogo de empleados de la empresa. Almacena datos personales,
                laborales y de contacto, así como la jerarquía organizacional
                (a quién reporta cada empleado). Se utiliza para identificar
                qué empleado registró cada pedido y qué territorios de venta
                tiene asignados.

  ------------------------------------------------------------------------------
  RESTRICCIONES
  ------------------------------------------------------------------------------
  - PK_Employees           : Clave primaria agrupada sobre EmployeeID
                             (autoincremental IDENTITY(1,1)).
  - CK_Birthdate           : La fecha de nacimiento debe ser menor a la fecha
                             actual (BirthDate < GETDATE()).
  - FK_Employees_Employees : Autorrelación. ReportsTo referencia a
                             Employees.EmployeeID (jefe directo). Es NULL
                             cuando el empleado no reporta a nadie.
  - Campos obligatorios    : LastName y FirstName (NOT NULL).

  ------------------------------------------------------------------------------
  ÍNDICES
  ------------------------------------------------------------------------------
  - PK_Employees (CLUSTERED)    : EmployeeID
  - LastName     (NONCLUSTERED) : búsquedas por apellido
  - PostalCode   (NONCLUSTERED) : búsquedas por código postal

  ------------------------------------------------------------------------------
  RELACIONES
  ------------------------------------------------------------------------------
  - Employees.ReportsTo           -> Employees.EmployeeID  (FK_Employees_Employees)
  - Orders.EmployeeID             -> Employees.EmployeeID  (FK_Orders_Employees)
      Empleado que registró el pedido.
  - EmployeeTerritories.EmployeeID-> Employees.EmployeeID  (FK_EmployeeTerritories_Employees)
      Relación muchos a muchos con Territories (territorios asignados).
  * Las FK de Orders y EmployeeTerritories están definidas en sus propios
    archivos del proyecto.

  ------------------------------------------------------------------------------
  DIFERENCIAS CON EL SCRIPT GENERADO DESDE SSMS (BD NorthWind)
  ------------------------------------------------------------------------------
  1. Columnas: idénticas en nombre, tipo, longitud, nulabilidad e IDENTITY.
  2. Índices LastName y PostalCode: no aparecen en el script de SSMS porque
     por defecto SSMS no los incluye al generar "CREATE TO". Verificar con
     EXEC sp_helpindex 'dbo.Employees'.
  3. rowversion: el proyecto usa ROWVERSION y SSMS muestra TIMESTAMP.
     Son sinónimos (TIMESTAMP es el nombre antiguo/obsoleto).
  4. Opciones WITH del PK (PAD_INDEX, ALLOW_ROW_LOCKS, etc.), ON [PRIMARY]
     y TEXTIMAGE_ON [PRIMARY]: SSMS las escribe explícitas, pero son los
     valores por defecto. Sin diferencia real.
  5. USE, SET ANSI_NULLS y SET QUOTED_IDENTIFIER: no se incluyen en el
     proyecto; se configuran en las propiedades del proyecto/publicación.

  ------------------------------------------------------------------------------
  OBSERVACIONES
  ------------------------------------------------------------------------------
  - El tipo IMAGE está obsoleto; Microsoft recomienda VARBINARY(MAX).
  - ReportsTo no tiene índice; se recomienda crearlo si la tabla crece.
*******************************************************************************/
CREATE TABLE [dbo].[Employees] (
    [EmployeeID]      INT            IDENTITY (1, 1) NOT NULL,
    [LastName]        NVARCHAR (20)  NOT NULL,
    [FirstName]       NVARCHAR (10)  NOT NULL,
    [Title]           NVARCHAR (30)  NULL,
    [TitleOfCourtesy] NVARCHAR (25)  NULL,
    [BirthDate]       DATETIME       NULL,
    [HireDate]        DATETIME       NULL,
    [Address]         NVARCHAR (60)  NULL,
    [City]            NVARCHAR (15)  NULL,
    [Region]          NVARCHAR (15)  NULL,
    [PostalCode]      NVARCHAR (10)  NULL,
    [Country]         NVARCHAR (15)  NULL,
    [HomePhone]       NVARCHAR (24)  NULL,
    [Extension]       NVARCHAR (4)   NULL,
    [Photo]           IMAGE          NULL,
    [Notes]           NVARCHAR (MAX) NULL,
    [ReportsTo]       INT            NULL,
    [PhotoPath]       NVARCHAR (255) NULL,
    [rowversion]      ROWVERSION     NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([EmployeeID] ASC),
    CONSTRAINT [CK_Birthdate] CHECK ([BirthDate]<getdate()),
    CONSTRAINT [FK_Employees_Employees] FOREIGN KEY ([ReportsTo]) REFERENCES [dbo].[Employees] ([EmployeeID])
);


GO
CREATE NONCLUSTERED INDEX [LastName]
    ON [dbo].[Employees]([LastName] ASC);


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Employees]([PostalCode] ASC);

