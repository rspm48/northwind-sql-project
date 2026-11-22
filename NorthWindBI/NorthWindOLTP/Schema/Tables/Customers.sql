/*******************************************************************************
  Tabla       : dbo.Customers
  Base datos  : NorthWind
  Descripción : Catálogo de clientes. Almacena los datos de las empresas clientes
                (nombre, contacto, dirección, teléfonos, otros). Es la tabla de
                origen de los pedidos: cada pedido pertenece a un cliente, y cada 
                cliente puede clasificarse en uno o varios tipos demograficos

  ------------------------------------------------------------------------------
  RESTRICCIONES
  ------------------------------------------------------------------------------
  - PK_Customers : Clave primaria agrupada sobre CustomerID (NCHAR(5)).
                   Es un código de cliente asignado manualmente, no
                   autoincremental.
  - Campos obligatorios : CustomerID y CompanyName (NOT NULL).
  - No tiene claves foráneas propias: es una tabla padre.
  - No define restricciones CHECK ni valores por defecto.

  ------------------------------------------------------------------------------
  ÍNDICES
  ------------------------------------------------------------------------------
  - PK_Customers (CLUSTERED)    : CustomerID
  - City         (NONCLUSTERED) : búsquedas por ciudad
  - CompanyName  (NONCLUSTERED) : búsquedas por nombre de empresa
  - PostalCode   (NONCLUSTERED) : búsquedas por código postal
  - Region       (NONCLUSTERED) : búsquedas por región

  ------------------------------------------------------------------------------
  RELACIONES
  ------------------------------------------------------------------------------
  - Orders.CustomerID -> Customers.CustomerID
      Un cliente realiza muchos pedidos (1 a N). FK (FK_Orders_Customers) 
      definida en Orders.sql 
  - CustomerCustomerDemo.CustomerID -> Customers.CustomerID
      Relación muchos a muchos con CustomerDemographics (tipos de cliente).
      FK (FK_CustomerCustomerDemo_Customers) definida en CustomerCustomerDemo.sql
  * Las FK están definidas en los archivos de Orders y CustomerCustomerDemo.

  ------------------------------------------------------------------------------
  DIFERENCIAS CON EL SCRIPT GENERADO DESDE SSMS (BD NorthWind)
  ------------------------------------------------------------------------------
  1. Columnas, PK (CLUSTERED sobre CustomerID) e índices (City, CompanyName,
     PostalCode, Region): idénticos al script de SSMS.
  2. rowversion: el proyecto usa ROWVERSION y SSMS muestra TIMESTAMP.
     Son sinónimos (TIMESTAMP es el nombre antiguo/obsoleto).
  3. Opciones WITH del PK (PAD_INDEX, ALLOW_ROW_LOCKS, etc.) y ON [PRIMARY]:
     SSMS las escribe explícitas, pero son los valores por defecto.
  4. FK_Orders_Customers (definida en Orders.sql): en SSMS se agregó con
     WITH NOCHECK; en el proyecto se declara sin esa opción. No cambia la
     estructura.
  5. USE, SET ANSI_NULLS y SET QUOTED_IDENTIFIER: no se incluyen en el
     proyecto; se configuran en las propiedades del proyecto/publicación.
  => Conclusión: proyecto y base de datos están SINCRONIZADOS.

  ------------------------------------------------------------------------------
  OBSERVACIONES
  ------------------------------------------------------------------------------
  - CustomerID es NCHAR(5) (longitud fija) y debe tener el mismo tipo en
    Orders y CustomerCustomerDemo para que las claves foráneas funcionen.
  - La columna Region es solo texto, no tiene relaciòn con ninguna tabla.
*******************************************************************************/


CREATE TABLE [dbo].[Customers] (
    [CustomerID]   NCHAR (5)     NOT NULL,
    [CompanyName]  NVARCHAR (40) NOT NULL,
    [ContactName]  NVARCHAR (30) NULL,
    [ContactTitle] NVARCHAR (30) NULL,
    [Address]      NVARCHAR (60) NULL,
    [City]         NVARCHAR (15) NULL,
    [Region]       NVARCHAR (15) NULL,
    [PostalCode]   NVARCHAR (10) NULL,
    [Country]      NVARCHAR (15) NULL,
    [Phone]        NVARCHAR (24) NULL,
    [Fax]          NVARCHAR (24) NULL,
    [rowversion]   ROWVERSION    NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [City]
    ON [dbo].[Customers]([City] ASC);


GO
CREATE NONCLUSTERED INDEX [CompanyName]
    ON [dbo].[Customers]([CompanyName] ASC);


GO
CREATE NONCLUSTERED INDEX [PostalCode]
    ON [dbo].[Customers]([PostalCode] ASC);


GO
CREATE NONCLUSTERED INDEX [Region]
    ON [dbo].[Customers]([Region] ASC);

