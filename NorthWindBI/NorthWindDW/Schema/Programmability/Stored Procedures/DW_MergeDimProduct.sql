/* Aplica a DimProduct los cambios de los productos que ya existían, tomados de staging.product. */
CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN

	UPDATE dc
	SET [ProductName]     = sc.[ProductName]
	   ,[SupplierName]    = sc.[SupplierName]
	   ,[CategoryName]    = sc.[CategoryName]
	   ,[QuantityPerUnit] = sc.[QuantityPerUnit]
	   ,[ListPrice]       = sc.[ListPrice]
	   ,[UnitsInStock]    = sc.[UnitsInStock]
	   ,[UnitsOnOrder]    = sc.[UnitsOnOrder]
	   ,[ReorderLevel]    = sc.[ReorderLevel]
	   ,[Discontinued]    = sc.[Discontinued]
	FROM [dbo].[DimProduct]         dc
	INNER JOIN [staging].[product] sc ON (dc.[ProductSK] = sc.[ProductSK])
END
GO
