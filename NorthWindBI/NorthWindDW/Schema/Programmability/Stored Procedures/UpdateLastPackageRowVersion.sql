/* Actualiza la última versión de fila cargada para una tabla de origen. */
CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion]
(
	@tableName VARCHAR(50)
	,@lastRowVersion BIGINT
)
AS
BEGIN
	UPDATE [dbo].[PackageConfig]
	SET LastRowVersion = @lastRowVersion
	WHERE TableName = @tableName;
END
GO
