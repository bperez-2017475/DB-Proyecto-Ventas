Drop database if exists dbEmpresadeportes;
create database dbEmpresadeportes;

use dbEmpresadeportes;

Create Table Categoria(
    primary key PK_codigoCategoria (codigoCategoria),
	codigoCategoria int not null auto_increment,
    nombreCategoria varchar (150) not null,
    descripcionCategoria varchar(150) not null
);


Create Table Talla(
    primary key PK_codigoTalla (codigoTalla),
	codigoTalla int not null auto_increment,
    nombreTalla varchar(150) not null,
    descripcionTalla varchar(150) not null
);


Create Table Marca(
    primary key PK_codigoMarca (codigoMarca),
	codigoMarca int not null auto_increment,
    nombreMarca varchar(150) not null,
    descripcionMarca varchar(150) not null
);

Create table Producto(
    primary key PK_codigoProducto (codigoProducto),
	codigoProducto int auto_increment not null,
    nombreProducto varchar(60) not null,
    precioProducto double(10,2) not null,
    stock int not null,
    codigoCategoria int not null,
    Constraint FK_Producto_Categoria foreign key (codigoCategoria) references Categoria(codigoCategoria)
);

-- Procedimientos de Almacenado ---------------------------------------------------------------------------


-- ---------------------------------------CATEGORIA-------------------------------------------------------

-- LISTAR-----------------------
Delimiter $$
	Create procedure sp_ListarCategorias()
		Begin
			Select 
				C.codigoCategoria, 
                C.nombreCategoria, 
                C.descripcionCategoria                
                from Categoria C;
        End$$
Delimiter ;

-- AGREGAR-----------------------

Delimiter $$
	Create procedure sp_AgregarCategoria(in nombreCategoria varchar(45), in descripcionCategoria varchar(150))
        Begin
			Insert into Categoria (nombreCategoria, descripcionCategoria) 
				values (nombreCategoria, descripcionCategoria);
        End$$
Delimiter ;

-- ELIMINAR-----------------------

Delimiter $$
	Create procedure sp_EliminarCategoria(in codCategoria int)
		Begin
			Delete from Categoria
				where codigoCategoria = codCategoria;
        End$$
Delimiter ;

-- BUSCAR-----------------------

Delimiter $$
	Create procedure sp_BuscarCategoria(in codCategoria int)
		Begin
			Select 
				C.codigoCategoria, 
                C.nombreCategoria, 
                C.descripcionCategoria
                from Categoria C where codigoCategoria = codCategoria;
        End$$
Delimiter ;

-- EDITAR-----------------------

Delimiter $$
	Create procedure sp_EditarCategoria(in codCategoria int,in nomCategoria varchar(45), 
		in descCategoria varchar(150))
        Begin
			Update Categoria
				set
					nombreCategoria = nomCategoria, 
                    descripcionCategoria = descCategoria
                    where codigoCategoria = codCategoira;
        End$$
Delimiter ;

-- --------------------------------------------TALLA-------------------------------------------


-- LISTAR------------------------------------------
Delimiter $$
	Create procedure sp_ListarTalla()
		Begin
			Select 
				C.codigoTalla, 
                C.nombreTalla, 
                C.descripcionTalla                
                from Talla C;
        End$$
Delimiter ;

-- AGREGAR-----------------------

Delimiter $$
	Create procedure sp_AgregarTalla(in nombreTalla varchar(45), in descripcionTalla varchar(500))
        Begin
			Insert into Talla (nombreTalla, descripcionTalla) 
				values (nombreTalla, descripcionTalla);
        End$$
Delimiter ;

-- ELIMINAR-----------------------

Delimiter $$
	Create procedure sp_EliminarTalla(in codTalla int)
		Begin
			Delete from Talla
				where codigoTalla = codTalla;
        End$$
Delimiter ;

-- BUSCAR-----------------------

Delimiter $$
	Create procedure sp_BuscarTalla(in codTalla int)
		Begin
			Select 
				C.codigoTalla, 
                C.nombreTalla, 
                C.descripcionTalla
                from Talla C where codigoTalla = codTalla;
        End$$
Delimiter ;

-- EDITAR-----------------------

Delimiter $$
	Create procedure sp_EditarTalla(in codTalla int,in nomTalla varchar(45), 
		in descTalla varchar(150))
        Begin
			Update Talla
				set
					nombreTalla = nomTalla, 
                    descripcionTalla = descTalla
                    where codigoTalla = codTalla;
        End$$
Delimiter ;

-- ---------------------------------------------------MARCA-----------------------------------------------------------------


-- LISTAR-----------------------
Delimiter $$
	Create procedure sp_ListarMarca()
		Begin
			Select 
				C.codigoMarca, 
                C.nombreMarca, 
                C.descripcionMarca                
                from Marca C;
        End$$
Delimiter ;

-- AGREGAR-----------------------

Delimiter $$
	Create procedure sp_AgregarMarca(in nombreMarca varchar(45), in descripcionMarca varchar(500))
        Begin
			Insert into Marca (nombreMarca, descripcionMarca) 
				values (nombreMarca, descripcionMarca);
        End$$
Delimiter ;

-- ELIMINAR-----------------------

Delimiter $$
	Create procedure sp_EliminarMarca(in codMarca int)
		Begin
			Delete from Marca
				where codigoMarca = codMarca;
        End$$
Delimiter ;

-- BUSCAR-----------------------

Delimiter $$
	Create procedure sp_BuscarMarca(in codMarca int)
		Begin
			Select 
				C.codigoMarca, 
                C.nombreMarca, 
                C.descripcionMarca
                from Marca C where codigoMarca = codMarca;
        End$$
Delimiter ;

-- EDITAR-----------------------

Delimiter $$
	Create procedure sp_EditarMarca(in codMarca int,in nomMarca varchar(45), 
		in descMarca varchar(150))
        Begin
			Update Marca
				set
					nombreMarca = nomMarca, 
                    descripcionMarca = descMarca
                    where codigoMarca = codMarca;
        End$$
Delimiter ;


-- --------------------------------------------------------------PRODUCTO-----------------------------------------------------------------

-- LISTAR-----------------------
Delimiter $$
	Create procedure sp_ListarProductos()
		Begin
			Select 
				P.codigoProducto, 
                P.nombreProducto, 
                P.precioProducto,
                P.stock,
                P.codigoCategoria
			from Producto P;
        End$$
Delimiter ;

-- AGREGAR-----------------------

Delimiter $$
	Create procedure sp_AgregarProducto(in nombreProducto varchar(60), in precioProducto decimal(10,2), in stock int,
		in codigoCategoria int)
        Begin
			Insert into Producto (nombreProducto, precioProducto, stock, codigoCategoria) 
				values (nombreProducto, precioProducto, stock, codigoCategoria);
        End$$
Delimiter ;

-- ELIMINAR-----------------------

Delimiter $$
	Create procedure sp_EliminarProducto(in codProducto int)
		Begin
			Delete from Producto
				where codigoProducto = codProducto;
        End$$
Delimiter ;

-- BUSCAR-----------------------

Delimiter $$
	Create procedure sp_BuscarProducto(in codProducto int)
		Begin
			Select 
				P.codigoProducto, 
                P.nombreProducto, 
                P.precioProducto,
                P.stock,
                P.codigoCategoria                
			from Producto P where codigoProducto = codProducto;
        End$$
Delimiter ;

-- EDITAR-----------------------

Delimiter $$
	Create procedure sp_EditarProducto(in codProducto int,in nomProducto varchar(60), 
		in pProducto decimal(10,2), in sto int)
        Begin
			Update Producto
				set
					nombreProducto = nomProducto,
                    precioProducto = pProducto,
                    stock = sto
				where codigoProducto = codProducto;
        End$$
Delimiter ;

call sp_AgregarCategoria('Camisas', 'Prenda de vestir ligera de tela que cubre el torso');
call sp_AgregarCategoria('Pantalones', 'Prenda de vestir que se ajusta a la cintura y llega a una altura variable de la pierna o los tobillos');
call sp_AgregarCategoria('Sudaderas', 'Prenda gruesa de algodón que se utiliza para hacer deporte.');
call sp_AgregarCategoria('Pantalonetas', 'Es un pantalón corto utilizado para hacer deporte. La prenda suele cubrir hasta las rodillas.');

call sp_AgregarTalla('S','Para cuerpo delgado o Talla Petite');
call sp_AgregarTalla('M','Cuerpo adulto o Talla estandar');
call sp_AgregarTalla('X','Talla grande para cuerpos gruesos');
call sp_AgregarTalla('XL','Talla extra grande para gente con sobrepeso');

call sp_AgregarMarca('Nike','Marca de Ropa Deportiva');
call sp_AgregarMarca('Puma','Marca de Ropa Deportiva');
call sp_AgregarMarca('Adidas','Marca de Ropa Deportiva');
call sp_AgregarMarca('Reebok','Marca de Ropa Deportiva');

call sp_AgregarProducto('Short deportivo', 20, 30, 4);
call sp_AgregarProducto('Camisa deportiva de natacion', 40, 20, 1);
call sp_AgregarProducto('Pantaloneta puma', 40, 28, 4);
call sp_AgregarProducto('Sudadera adidas', 60, 16, 3);
call sp_AgregarProducto('Pants', 40, 74, 2);