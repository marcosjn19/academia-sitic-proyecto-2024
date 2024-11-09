use dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Product_Configurations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Define las configuraciones especificas para los productos, como diferentes colores y tamaños
	CREATE TABLE [dbo].[Product_Configurations]
	(
		[Id]						INT NOT NULL PRIMARY KEY IDENTITY(1,1),		-- Identificador único de la tabla
		[Product_Id]				INT NOT NULL,								-- Identificador de la llave foranea de products
		[Configuration_Name]		VARCHAR(255) NOT NULL,						-- Nombre de la configuración como puede ser: Color, tamano, etc.
		[Value]						VARCHAR(255) NOT NULL,						-- El valor asignado dependiendo de la configuración
		[Created_At]				DATETIME DEFAULT GETDATE(),					-- Fecha de creación de la configuración
		[Updated_At]				DATETIME DEFAULT GETDATE(),					-- Fecha de actualización de la configuración
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id])				-- Fecha de actualización de la configuración
	)
END
use dbSiticCommerce;


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 
    'MS_Description', 
    'Tabla que define las configuraciones específicas para los productos, como diferentes colores y tamaños.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations';
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 
    'MS_Description', 
    'Tabla que define las configuraciones específicas para los productos, como diferentes colores y tamaños.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations';
END
GO

/* Comentarios para las columnas */

/* Comentario para la columna Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador único de la tabla.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations', 
    'column', 
    'Id';
END;
GO

/* Comentario para la columna Product_Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Product_Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador de la llave foránea de products.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations', 
    'column', 
    'Product_Id';
END;
GO

/* Comentario para la columna Configuration_Name */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Configuration_Name'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Nombre de la configuración como puede ser: Color, tamaño, etc.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations', 
    'column', 
    'Configuration_Name';
END;
GO

/* Comentario para la columna Value */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Value'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'El valor asignado dependiendo de la configuración.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations', 
    'column', 
    'Value';
END;
GO

/* Comentario para la columna Created_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Created_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de creación de la configuración.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations', 
    'column', 
    'Created_At';
END;
GO

/* Comentario para la columna Updated_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Updated_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de actualización de la configuración.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations', 
    'column', 
    'Updated_At';
END;
GO
