/*******************************************************************************
  Tabla       : dbo.CustomerCustomerDemo
  Base datos  : NorthWind
  Descripción : Tabla intermedia (puente) que resuelve la relación MUCHOS A
                MUCHOS entre clientes (Customers) y tipos demográficos
                (CustomerDemographics). Cada fila indica que un cliente
                pertenece a un tipo. Un cliente puede tener varios tipos y un
                tipo puede aplicarse a varios clientes.

  ------------------------------------------------------------------------------
  RESTRICCIONES
  ------------------------------------------------------------------------------
  - PK_CustomerCustomerDemo           : Clave primaria compuesta NO agrupada
                                        (CustomerID, CustomerTypeID). Impide
                                        asignar dos veces el mismo tipo al
                                        mismo cliente.
  - FK_CustomerCustomerDemo_Customers : CustomerID debe existir en
                                        Customers.CustomerID.
  - FK_CustomerCustomerDemo           : CustomerTypeID debe existir en
                                        CustomerDemographics.CustomerTypeID.
  - Campos obligatorios               : CustomerID y CustomerTypeID (NOT NULL).

  ------------------------------------------------------------------------------
  ÍNDICES
  ------------------------------------------------------------------------------
  - PK_CustomerCustomerDemo (NONCLUSTERED) : CustomerID, CustomerTypeID
  * La tabla NO tiene índice agrupado (CLUSTERED).

  ------------------------------------------------------------------------------
  RELACIONES
  ------------------------------------------------------------------------------
  - CustomerCustomerDemo.CustomerID     -> Customers.CustomerID
                                           (FK_CustomerCustomerDemo_Customers)
  - CustomerCustomerDemo.CustomerTypeID -> CustomerDemographics.CustomerTypeID
                                           (FK_CustomerCustomerDemo)

      Customers ----< CustomerCustomerDemo >---- CustomerDemographics

  * Ninguna otra tabla referencia a CustomerCustomerDemo.

  ------------------------------------------------------------------------------
  DIFERENCIAS CON EL SCRIPT GENERADO DESDE SSMS (BD NorthWind)
  ------------------------------------------------------------------------------
  1. Columnas, PK compuesta NONCLUSTERED y las dos FK (FK_CustomerCustomerDemo
     y FK_CustomerCustomerDemo_Customers): idénticas al script de SSMS. En
     SSMS ambas se agregan con WITH CHECK (validadas y confiables),
     equivalente al proyecto.
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
  - El PK cubre las búsquedas por CustomerID (primera columna), pero NO las
    búsquedas por CustomerTypeID. Se recomienda un índice sobre CustomerTypeID
    para consultas como "qué clientes pertenecen a un tipo" y para acelerar la
    validación de la FK al borrar/actualizar en CustomerDemographics.
  - La FK hacia CustomerDemographics se llama FK_CustomerCustomerDemo y no
    sigue el patrón FK_Tabla_TablaPadre de las demás; se mantiene el nombre
    original de NorthWind.
  - Los tipos de CustomerID (NCHAR(5)) y CustomerTypeID (NCHAR(10)) coinciden
    con los de las tablas padre.
*******************************************************************************/

CREATE TABLE [dbo].[CustomerCustomerDemo] (
    [CustomerID]     NCHAR (5)  NOT NULL,
    [CustomerTypeID] NCHAR (10) NOT NULL,
    [rowversion]     ROWVERSION NULL,
    CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED ([CustomerID] ASC, [CustomerTypeID] ASC),
    CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY ([CustomerTypeID]) REFERENCES [dbo].[CustomerDemographics] ([CustomerTypeID]),
    CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
);

