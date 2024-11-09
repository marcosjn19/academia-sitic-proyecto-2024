use dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Carts]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Almacena los datos del carrito del sistema
	CREATE TABLE [dbo].[Carts]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),			-- Identificador único del carrito
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(),		-- Fecha de creación del carrito
		[Updated_At] DATETIME NOT NULL DEFAULT GETDATE()		-- Fecha de última actualización del carrito
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 
    'MS_Description', 
    'Tabla que almacena los datos del carrito del sistema.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Carts';
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 
    'MS_Description', 
    'Tabla que almacena los datos del carrito del sistema.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Carts';
END
GO

/* Comentarios para las columnas */

/* Comentario para la columna Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador único del carrito.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Carts', 
    'column', 
    'Id';
END;
GO

/* Comentario para la columna Created_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Created_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de creación del carrito.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Carts', 
    'column', 
    'Created_At';
END;
GO

/* Comentario para la columna Updated_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Updated_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de última actualización del carrito.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Carts', 
    'column', 
    'Updated_At';
END;
GO
