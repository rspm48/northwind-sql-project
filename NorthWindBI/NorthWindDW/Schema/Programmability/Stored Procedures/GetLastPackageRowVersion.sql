/* Devuelve la última versión de fila cargada para una tabla de origen. */
CREATE PROCEDURE [dbo].[GetLastPackageRowVersion]
(
	@tableName VARCHAR(50)
)
AS
BEGIN
	SELECT LastRowVersion
	FROM [dbo].[PackageConfig]
	WHERE TableName = @tableName;
END
GO
