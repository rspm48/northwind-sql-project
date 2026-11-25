/*
  Tabla: dbo.DimDate (dimensión de fechas)
  Responsable: Persona 1
  Origen: Se genera con un script (no viene de NorthWind)
  Contenido propuesto:
    DateKey int PK (formato AAAAMMDD; el valor 0 = fecha desconocida / no enviado)
    FullDate date, DayNumberOfWeek tinyint, DayNameOfWeek nvarchar(10), DayNumberOfMonth tinyint,
    DayNumberOfYear smallint, WeekNumberOfYear tinyint, MonthName nvarchar(10), MonthNumberOfYear tinyint,
    CalendarQuarter tinyint, CalendarYear smallint, CalendarSemester tinyint (todas NOT NULL)
  Nota: Referencia: BikeStoresBI/BikeStoresDW/Schema/Tables/dbo/DimDate.sql del repo del profe.

  TODO: reemplazar este comentario por el script real (dejando un comentario corto de propósito).
*/
