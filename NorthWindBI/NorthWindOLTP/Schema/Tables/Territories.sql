/*******************************************************************************
  Tabla       : dbo.Territories
  Base datos  : NorthWind
  Descripción : Catálogo de territorios de venta (zonas geográficas, normalmente
                ciudades) en los que opera la empresa. Cada territorio pertenece
                a una región (Region) y puede ser asignado a uno o varios
                empleados a través de la tabla EmployeeTerritories.

  ------------------------------------------------------------------------------
  RESTRICCIONES
  ------------------------------------------------------------------------------
  - PK_Territories        : Clave primaria NO agrupada sobre TerritoryID
                            (código del territorio, ej. '01581').
  - FK_Territories_Region : RegionID debe existir en Region.RegionID.
  - Campos obligatorios   : TerritoryID, TerritoryDescription y RegionID
                            (NOT NULL).

  ------------------------------------------------------------------------------
  ÍNDICES
  ------------------------------------------------------------------------------
  - PK_Territories (NONCLUSTERED) : TerritoryID
  * La tabla NO tiene índice agrupado (CLUSTERED), por lo que es un HEAP.

  ------------------------------------------------------------------------------
  RELACIONES
  ------------------------------------------------------------------------------
  - Territories.RegionID              -> Region.RegionID          (FK_Territories_Region)
      Región a la que pertenece el territorio (relación muchos a uno).
  - EmployeeTerritories.TerritoryID   -> Territories.TerritoryID  (FK_EmployeeTerritories_Territories)
      Empleados que atienden el territorio (relación muchos a muchos con
      Employees). Esta FK está definida en el archivo EmployeeTerritories.sql.

      Employees ----< EmployeeTerritories >---- Territories >---- Region

  ------------------------------------------------------------------------------
  DIFERENCIAS CON EL SCRIPT GENERADO DESDE SSMS (BD NorthWind)
  ------------------------------------------------------------------------------
  1. Columnas: idénticas en nombre, tipo, longitud y nulabilidad.
  2. rowversion: el proyecto usa ROWVERSION y SSMS muestra TIMESTAMP.
     Son sinónimos (TIMESTAMP es el nombre antiguo/obsoleto).
  3. FK_Territories_Region: en SSMS se agrega con ALTER TABLE ... WITH CHECK,
     es decir, validada y confiable (is_not_trusted = 0). Equivalente al
     proyecto.
  4. Opciones WITH del PK (PAD_INDEX, ALLOW_ROW_LOCKS, etc.) y ON [PRIMARY]:
     SSMS las escribe explícitas, pero son los valores por defecto.
  5. USE, SET ANSI_NULLS y SET QUOTED_IDENTIFIER: no se incluyen en el
     proyecto; se configuran en las propiedades del proyecto/publicación.
  => Conclusión: proyecto y base de datos están SINCRONIZADOS.

  ------------------------------------------------------------------------------
  OBSERVACIONES
  ------------------------------------------------------------------------------
  - Al ser un HEAP, se recomienda que el PK sea CLUSTERED.
  - TerritoryDescription es NCHAR(50) (longitud fija): rellena con espacios
    hasta 50 caracteres. Al mostrar o comparar puede requerir RTRIM().
    NVARCHAR(50) sería más eficiente en espacio.
  - RegionID no tiene índice; se recomienda crearlo para consultas de
    territorios por región y para la validación de la FK al borrar en Region.
*******************************************************************************/

CREATE TABLE [dbo].[Territories] (
    [TerritoryID]          NVARCHAR (20) NOT NULL,
    [TerritoryDescription] NCHAR (50)    NOT NULL,
    [RegionID]             INT           NOT NULL,
    [rowversion]           ROWVERSION    NULL,
    CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED ([TerritoryID] ASC),
    CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Region] ([RegionID])
);

