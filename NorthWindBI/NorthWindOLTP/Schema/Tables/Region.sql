/*******************************************************************************
  Tabla       : dbo.Region
  Base datos  : NorthWind
  Descripción : Catálogo de regiones geográficas de ventas (ej. Eastern,
                Western, Northern, Southern). Es el nivel más alto de la
                jerarquía geográfica: cada región agrupa varios territorios
                (Territories), que a su vez se asignan a los empleados
                mediante EmployeeTerritories.

  ------------------------------------------------------------------------------
  RESTRICCIONES
  ------------------------------------------------------------------------------
  - PK_Region           : Clave primaria NO agrupada sobre RegionID.
  - Campos obligatorios : RegionID y RegionDescription (NOT NULL).
  * RegionID NO es IDENTITY: el valor debe indicarse manualmente al insertar.
  * La tabla no tiene llaves foráneas propias (no depende de otra tabla).

  ------------------------------------------------------------------------------
  ÍNDICES
  ------------------------------------------------------------------------------
  - PK_Region (NONCLUSTERED) : RegionID
  * La tabla NO tiene índice agrupado (CLUSTERED), por lo que es un HEAP.

  ------------------------------------------------------------------------------
  RELACIONES
  ------------------------------------------------------------------------------
  - Territories.RegionID -> Region.RegionID  (FK_Territories_Region)
      Una región tiene muchos territorios (relación uno a muchos).
      Esta FK está definida en el archivo Territories.sql.

      Employees ----< EmployeeTerritories >---- Territories >---- Region

  * No se puede eliminar una región que tenga territorios asociados.

  ------------------------------------------------------------------------------
  DIFERENCIAS CON EL SCRIPT GENERADO DESDE SSMS (BD NorthWind)
  ------------------------------------------------------------------------------
  1. Columnas: idénticas en nombre, tipo, longitud y nulabilidad.
  2. rowversion: el proyecto usa ROWVERSION y SSMS muestra TIMESTAMP.
     Son sinónimos (TIMESTAMP es el nombre antiguo/obsoleto).
  3. Opciones WITH del PK (PAD_INDEX, ALLOW_ROW_LOCKS, etc.) y ON [PRIMARY]:
     SSMS las escribe explícitas, pero son los valores por defecto.
  4. USE, SET ANSI_NULLS y SET QUOTED_IDENTIFIER: no se incluyen en el
     proyecto; se configuran en las propiedades del proyecto/publicación.
  => Conclusión: proyecto y base de datos están SINCRONIZADOS.

  ------------------------------------------------------------------------------
  OBSERVACIONES
  ------------------------------------------------------------------------------
  - Al ser un HEAP, se recomienda que el PK sea CLUSTERED.
  - RegionDescription es NCHAR(50) (longitud fija): rellena con espacios
    hasta 50 caracteres. Al mostrar o comparar puede requerir RTRIM().
    NVARCHAR(50) sería más eficiente en espacio.

*******************************************************************************/
CREATE TABLE [dbo].[Region] (
    [RegionID]          INT        NOT NULL,
    [RegionDescription] NCHAR (50) NOT NULL,
    [rowversion]        ROWVERSION NULL,
    CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED ([RegionID] ASC)
);

