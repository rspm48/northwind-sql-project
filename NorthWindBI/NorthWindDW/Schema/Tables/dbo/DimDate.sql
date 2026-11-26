/*
  Tabla: dbo.DimDate (dimensión de fechas)
  Propósito: una fila por día con sus partes ya calculadas (día, mes, trimestre, año...)
             para analizar los pedidos por fecha sin usar funciones de fecha en cada consulta.
  Origen: se genera con un script (no viene de NorthWind).
  Claves: DateKey con formato AAAAMMDD (ejemplo: 19960704). El valor 0 = fecha desconocida o pedido no enviado.
  Responsable: Persona 1.
*/
CREATE TABLE [dbo].[DimDate]
(
	[DateKey]           [int] NOT NULL CONSTRAINT PK_DimDate PRIMARY KEY,
	[FullDate]          [date] NOT NULL,
	[DayNumberOfWeek]   [tinyint] NOT NULL,
	[DayNameOfWeek]     [nvarchar](10) NOT NULL,
	[DayNumberOfMonth]  [tinyint] NOT NULL,
	[DayNumberOfYear]   [smallint] NOT NULL,
	[WeekNumberOfYear]  [tinyint] NOT NULL,
	[MonthName]         [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter]   [tinyint] NOT NULL,
	[CalendarYear]      [smallint] NOT NULL,
	[CalendarSemester]  [tinyint] NOT NULL
);
GO