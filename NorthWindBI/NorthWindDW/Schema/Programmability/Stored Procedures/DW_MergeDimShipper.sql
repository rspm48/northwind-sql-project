/* Aplica a DimShipper los cambios de los transportistas que ya existían, tomados de staging.shipper. */
CREATE PROCEDURE [dbo].[DW_MergeDimShipper]
AS
BEGIN

	UPDATE dimShipper
	SET [CompanyName] = stagingShipper.[CompanyName]
	   ,[Phone]       = stagingShipper.[Phone]
	FROM [dbo].[DimShipper]         dimShipper
	INNER JOIN [staging].[shipper] stagingShipper ON (dimShipper.[ShipperSK] = stagingShipper.[ShipperSK])
END
GO