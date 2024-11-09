use dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Order_Items]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	-- Almacena la informaci�n de los productos en la orden
	CREATE TABLE [dbo].[Order_Items]
	(
		[Id]			INT NOT NULL PRIMARY KEY IDENTITY(1,1),		-- Identificador �nico del elemento del carrito
		[Order_Id]		INT NOT NULL,								-- Identificador relaci�n a la orden (maestro)
		[Product_Id]	INT NOT NULL,								-- Identificador relaci�n al producto
		[Quantity]		INT NOT NULL,								-- Cantidad del producto en la orden
		[Price]			DECIMAL(18,2) NOT NULL,						-- Precio del producto en el momento de a�adirlo al carrito
		[Created_At]	DATETIME NOT NULL DEFAULT GETDATE(),		-- Fecha de creaci�n del producto a�adido
		[Updated_At]    DATETIME NOT NULL DEFAULT GETDATE(),		-- Fecha de actualizaci�n del producto a�adido
		FOREIGN KEY ([Order_Id]) REFERENCES [dbo].[Orders](Id),
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products](Id),
	)
END


USE dbSiticCommerce;

/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 
    'MS_Description', 
    'Tabla que almacena la informaci�n de los productos en la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items';
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 
    'MS_Description', 
    'Tabla que almacena la informaci�n de los productos en la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items';
END
GO

/* Comentarios para las columnas */

/* Comentario para la columna Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador �nico del elemento en la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items', 
    'column', 
    'Id';
END;
GO

/* Comentario para la columna Order_Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Order_Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador de la orden a la cual pertenece el producto.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items', 
    'column', 
    'Order_Id';
END;
GO

/* Comentario para la columna Product_Id */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Product_Id'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Identificador del producto en la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items', 
    'column', 
    'Product_Id';
END;
GO

/* Comentario para la columna Quantity */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Quantity'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Cantidad del producto en la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items', 
    'column', 
    'Quantity';
END;
GO

/* Comentario para la columna Price */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Price'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Precio del producto en el momento de a�adirlo a la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items', 
    'column', 
    'Price';
END;
GO

/* Comentario para la columna Created_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Created_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de creaci�n del producto a�adido a la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items', 
    'column', 
    'Created_At';
END;
GO

/* Comentario para la columna Updated_At */
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Order_Items', 'column', 'Updated_At'))
BEGIN
  EXEC sp_addextendedproperty 
    'MS_Description', 
    'Fecha de �ltima actualizaci�n del producto en la orden.', 
    'SCHEMA', 
    'dbo', 
    'table', 
    'Order_Items', 
    'column', 
    'Updated_At';
END;
GO
