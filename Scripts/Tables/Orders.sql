USE dbSiticCommerce;
IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Orders]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Almacena informaci�n sobre los pedidos realizados
	CREATE TABLE [dbo].[Orders]
	(
		[Id]			INT NOT NULL PRIMARY KEY IDENTITY(1,1),			-- Identificador unico de la tabla
		[Total_Price]	DECIMAL(20,2) NOT NULL,							-- Precio total del pedido
		[Status]		VARCHAR(30) NOT NULL,							-- Estado del pedido (e.g, pendiente, enviado, completado)
		[Created_At]	DATETIME NOT NULL DEFAULT GETDATE(),			-- Fecha de creaci�n del pedido
		[Updated_At]	DATETIME NOT NULL DEFAULT GETDATE()				-- Fecha de ultima actualizaci�n del pedido
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 
    'MS_Description', 
    'Tabla que almacena informaci�n sobre los pedidos realizados.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Orders';
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 
    'MS_Description', 
    'Tabla que almacena informaci�n sobre los pedidos realizados.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Orders';
END
GO

/* Comentarios para las columnas */

/* Comentario para la columna Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador �nico del pedido.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Orders', 
    'column', 
    'Id';
END;
GO

/* Comentario para la columna Total_Price */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Total_Price'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Precio total del pedido.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Orders', 
    'column', 
    'Total_Price';
END;
GO

/* Comentario para la columna Status */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Status'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Estado del pedido (por ejemplo, pendiente, enviado, completado).', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Orders', 
    'column', 
    'Status';
END;
GO

/* Comentario para la columna Created_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Created_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de creaci�n del pedido.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Orders', 
    'column', 
    'Created_At';
END;
GO

/* Comentario para la columna Updated_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Updated_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de �ltima actualizaci�n del pedido.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Orders', 
    'column', 
    'Updated_At';
END;
GO
