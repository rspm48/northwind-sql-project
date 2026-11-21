/*******************************************************************************
  Tabla       : dbo.EmployeeTerritories
  Base datos  : NorthWind
  Descripción : Tabla intermedia (puente) que resuelve la relación MUCHOS A
                MUCHOS entre empleados (Employees) y territorios de venta
                (Territories). Cada fila indica que un empleado tiene asignado
                un territorio. Un empleado puede atender varios territorios y
                un territorio puede ser atendido por varios empleados.

  ------------------------------------------------------------------------------
  RESTRICCIONES
  ------------------------------------------------------------------------------
  - PK_EmployeeTerritories             : Clave primaria compuesta NO agrupada
                                         (EmployeeID, TerritoryID). Impide
                                         asignar dos veces el mismo territorio
                                         al mismo empleado.
  - FK_EmployeeTerritories_Employees   : EmployeeID debe existir en
                                         Employees.EmployeeID.
  - FK_EmployeeTerritories_Territories : TerritoryID debe existir en
                                         Territories.TerritoryID.
  - Campos obligatorios                : EmployeeID y TerritoryID (NOT NULL).

  ------------------------------------------------------------------------------
  ÍNDICES
  ------------------------------------------------------------------------------
  - PK_EmployeeTerritories (NONCLUSTERED) : EmployeeID, TerritoryID
  * La tabla NO tiene índice agrupado (CLUSTERED), por lo que es un HEAP.

  ------------------------------------------------------------------------------
  RELACIONES
  ------------------------------------------------------------------------------
  - EmployeeTerritories.EmployeeID  -> Employees.EmployeeID    (FK_EmployeeTerritories_Employees)
  - EmployeeTerritories.TerritoryID -> Territories.TerritoryID (FK_EmployeeTerritories_Territories)
      A su vez, Territories se relaciona con Region (RegionID).

      Employees (1) ----< EmployeeTerritories >---- (1) Territories ----> Region

  * Ninguna otra tabla depende (referencia) a EmployeeTerritories.

  ------------------------------------------------------------------------------
  DIFERENCIAS CON EL SCRIPT GENERADO DESDE SSMS (BD NorthWind)
  ------------------------------------------------------------------------------
  1. Columnas: idénticas en nombre, tipo, longitud y nulabilidad.
  2. rowversion: el proyecto usa ROWVERSION y SSMS muestra TIMESTAMP.
     Son sinónimos (TIMESTAMP es el nombre antiguo/obsoleto).
     (A diferencia de Employees, aquí NO se usó WITH NOCHECK.)
  3. Opciones WITH del PK (PAD_INDEX, ALLOW_ROW_LOCKS, etc.) y ON [PRIMARY]:
     SSMS las escribe explícitas, pero son los valores por defecto.
  4. USE, SET ANSI_NULLS y SET QUOTED_IDENTIFIER: no se incluyen en el
     proyecto; se configuran en las propiedades del proyecto/publicación.
  => Conclusión: proyecto y base de datos están SINCRONIZADOS.

  ------------------------------------------------------------------------------
  OBSERVACIONES
  ------------------------------------------------------------------------------
  - Al ser un HEAP, se recomienda que el PK sea CLUSTERED para mejorar el
    rendimiento de lecturas y evitar fragmentación.
  - El PK cubre las búsquedas por EmployeeID (primera columna), pero NO las
    búsquedas por TerritoryID. Se recomienda un índice sobre TerritoryID
    para consultas como "qué empleados atienden un territorio" y para
    acelerar la validación de la FK al borrar/actualizar en Territories.
*******************************************************************************/

CREATE TABLE [dbo].[EmployeeTerritories] (
    [EmployeeID]  INT           NOT NULL,
    [TerritoryID] NVARCHAR (20) NOT NULL,
    [rowversion]  ROWVERSION    NULL,
    CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED ([EmployeeID] ASC, [TerritoryID] ASC),
    CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeID]),
    CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [dbo].[Territories] ([TerritoryID])
);

