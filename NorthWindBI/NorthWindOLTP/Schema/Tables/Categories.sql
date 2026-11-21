/*
  Tabla: Categories
  Propósito: categorías en las que se clasifican los productos (por ejemplo, bebidas o lácteos).
  Clave primaria: CategoryID (autonumérico).
  Relaciones:
    - Products (CategoryID) -> cada producto pertenece a una categoría.
  Índices: CategoryName, para buscar categorías por nombre.
  Revisado por: Rosario Scarlett Prado Mendoza.
*/
CREATE TABLE [dbo].[Categories] (
    [CategoryID]   INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (15)  NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [Picture]      IMAGE          NULL,
    [rowversion]   ROWVERSION     NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CategoryName]
    ON [dbo].[Categories]([CategoryName] ASC);

