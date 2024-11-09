IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Stock_Status]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Almacena los diferentes estados de existencia de un producto.
	CREATE TABLE [dbo].[Stock_Status]
	(
		[Id]					INT NOT NULL PRIMARY KEY IDENTITY(1,1),			-- Identificador único de la tabla
		[Status_Name]			VARCHAR(50) NOT NULL,							-- Nombre del estado de la tabla
		[Key]					VARCHAR(50) NOT NULL,							-- Llave del estado de la tabla
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Tabla que almacena los diferentes estados de inventario en el sistema.', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Tabla que almacena los diferentes estados de inventario en el sistema.', 'SCHEMA', 'dbo', 'table', 'Stock_Status'
END
GO


/*  Comentarios para las columnas */
/* Comentario para la columna Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador único de la tabla.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Stock_Status', 
    'column', 
    'Id';
END;
GO

/* Comentario para la columna Status_Name */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Status_Name'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Nombre del estado de la tabla.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Stock_Status', 
    'column', 
    'Status_Name';
END;
GO

/* Comentario para la columna Key */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Stock_Status', 'column', 'Key'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Llave del estado de la tabla.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Stock_Status', 
    'column', 
    'Key';
END;
GO