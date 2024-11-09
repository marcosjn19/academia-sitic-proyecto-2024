use dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Product_Configurations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Define las configuraciones especificas para los productos, como diferentes colores y tama�os
	CREATE TABLE [dbo].[Product_Configurations]
	(
		[Id]						INT NOT NULL PRIMARY KEY IDENTITY(1,1),		-- Identificador �nico de la tabla
		[Product_Id]				INT NOT NULL,								-- Identificador de la llave foranea de products
		[Configuration_Name]		VARCHAR(255) NOT NULL,						-- Nombre de la configuraci�n como puede ser: Color, tamano, etc.
		[Value]						VARCHAR(255) NOT NULL,						-- El valor asignado dependiendo de la configuraci�n
		[Created_At]				DATETIME DEFAULT GETDATE(),					-- Fecha de creaci�n de la configuraci�n
		[Updated_At]				DATETIME DEFAULT GETDATE(),					-- Fecha de actualizaci�n de la configuraci�n
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id])				-- Fecha de actualizaci�n de la configuraci�n
	)
END
use dbSiticCommerce;


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 
    'MS_Description', 
    'Tabla que define las configuraciones espec�ficas para los productos, como diferentes colores y tama�os.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations';
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 
    'MS_Description', 
    'Tabla que define las configuraciones espec�ficas para los productos, como diferentes colores y tama�os.', 
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
    'Identificador �nico de la tabla.', 
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
    'Identificador de la llave for�nea de products.', 
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
    'Nombre de la configuraci�n como puede ser: Color, tama�o, etc.', 
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
    'El valor asignado dependiendo de la configuraci�n.', 
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
    'Fecha de creaci�n de la configuraci�n.', 
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
    'Fecha de actualizaci�n de la configuraci�n.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Product_Configurations', 
    'column', 
    'Updated_At';
END;
GO
