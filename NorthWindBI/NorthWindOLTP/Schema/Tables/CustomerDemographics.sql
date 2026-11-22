/*******************************************************************************
  Tabla       : dbo.CustomerDemographics
  Base datos  : NorthWind
  Descripción : Catálogo de tipos o segmentos demográficos de clientes. Cada
                fila define un tipo que puede asignarse
                a uno o varios clientes a través de la tabla
                CustomerCustomerDemo.

  ------------------------------------------------------------------------------
  RESTRICCIONES
  ------------------------------------------------------------------------------
  - PK_CustomerDemographics : Clave primaria NO agrupada sobre CustomerTypeID
                              (NCHAR(10)), código asignado manualmente.
  - Campos obligatorios     : CustomerTypeID (NOT NULL). CustomerDesc admite NULL.
  * No tiene claves foráneas propias (es tabla padre), ni restricciones CHECK,
    ni valores por defecto.

  ------------------------------------------------------------------------------
  ÍNDICES
  ------------------------------------------------------------------------------
  - PK_CustomerDemographics (NONCLUSTERED) : CustomerTypeID
  * La tabla NO tiene índice agrupado (CLUSTERED), por lo que es un HEAP.

  ------------------------------------------------------------------------------
  RELACIONES
  ------------------------------------------------------------------------------
  - CustomerCustomerDemo.CustomerTypeID -> CustomerDemographics.CustomerTypeID                                    
      Un tipo demográfico puede asignarse a muchos clientes (relación muchos
      a muchos con Customers). FK (FK_CustomerCustomerDemo) definida en 
      CustomerCustomerDemo.sql.

      Customers ----< CustomerCustomerDemo >---- CustomerDemographics

  ------------------------------------------------------------------------------
  DIFERENCIAS CON EL SCRIPT GENERADO DESDE SSMS (BD NorthWind)
  ------------------------------------------------------------------------------
  1. Columnas (CustomerTypeID NCHAR(10) NOT NULL, CustomerDesc NVARCHAR(MAX)
     NULL) y PK NONCLUSTERED: idénticas al script de SSMS.
  2. rowversion: el proyecto usa ROWVERSION y SSMS muestra TIMESTAMP.
     Son sinónimos (TIMESTAMP es el nombre antiguo/obsoleto).
  3. Opciones WITH del PK (PAD_INDEX, ALLOW_ROW_LOCKS, etc.), ON [PRIMARY]
     y TEXTIMAGE_ON [PRIMARY]: SSMS las escribe explícitas, pero son los
     valores por defecto.
  4. USE, SET ANSI_NULLS y SET QUOTED_IDENTIFIER: no se incluyen en el
     proyecto; se configuran en las propiedades del proyecto/publicación.
  => Conclusión: proyecto y base de datos están SINCRONIZADOS.

  ------------------------------------------------------------------------------
  OBSERVACIONES
  ------------------------------------------------------------------------------
  - Al ser un HEAP, se recomienda que el PK sea CLUSTERED.
  - CustomerTypeID es NCHAR(10) (longitud fija): rellena con espacios hasta
    10 caracteres. Al mostrar o comparar puede requerir RTRIM().
  - CustomerDesc es NVARCHAR(MAX), el tipo recomendado frente al obsoleto
    NTEXT.
*******************************************************************************/

CREATE TABLE [dbo].[CustomerDemographics] (
    [CustomerTypeID] NCHAR (10)     NOT NULL,
    [CustomerDesc]   NVARCHAR (MAX) NULL,
    [rowversion]     ROWVERSION     NULL,
    CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED ([CustomerTypeID] ASC)
);

