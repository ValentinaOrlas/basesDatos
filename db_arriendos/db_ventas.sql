#crear base de datos
create database ventas;


#link modelo MR: 
#https://drive.google.com/file/d/1HXVpb0-YRUd-h8t2L72anT9f0VAYHP9T/view?usp=sharing 

#llamar la base de datos cada vez al abrir el archivo
use ventas;

#--------------------------------------crear tablas-----------------------------

create table productos (
id_productos varchar (15) primary key,
referencia varchar (15) not null,
costo decimal (12) not null,
inventario varchar (15) not null,
nombre varchar (20) not null
);

create table pedidos (
codigo varchar (20) primary key,
cantidad integer (12) not null,
fecha date not null,
id_empleados varchar (20) not null,
foreign key(id_empleados) references empleados (id_empleados)
);

create table empleados (
id_empleados varchar(20) primary key,
primer_nombre varchar(20) not null,
segundo_nombre varchar(20), 
primer_apellido varchar(20) not null,
segundo_apellido varchar(20),
email varchar(20) unique not null
);


# ------------------------------crear tabla puente-----------------------------
create table productos_pedidos (
id_productos varchar (20) not null,
codigo varchar (20) not null,
primary key (id_productos, codigo)
);

alter table productos_pedidos add foreign key (id_productos) references productos (id_productos);
alter table productos_pedidos add foreign key(codigo) references pedidos (codigo);


#------------------------------------crear tablas--------------------------------
create table facturas(
codigo_factura varchar (20) primary key,
costo decimal (12) not null,
lista_producto varchar (20) not null,
cod_pedido varchar (20) not null,
foreign key (cod_pedido) references pedidos(codigo)
);

create table clientes (
id_cliente integer(15) primary key,
primer_nombre varchar(20) not null,
segundo_nombre varchar(20), 
primer_apellido varchar(20) not null,
segundo_apellido varchar(20),
email varchar(30) unique not null,
direccion_calle varchar (30) not null,
direccion_numero varchar (30) not null
);


#-----------------------------crear tabla puente--------------------------------
create table clientes_pedidos (
cod_pedido varchar (20) not null,
id_cliente integer (15) not null,
primary key (cod_pedido, id_cliente),
foreign key(cod_pedido) references pedidos(codigo),
foreign key(id_cliente) references clientes(id_cliente)
);

describe clientes_pedidos;

create table telefono (
numero_celular integer (12) primary key,
operador varchar(15) not null,
id_cliente integer (15) not null,
foreign key(id_cliente) references clientes(id_cliente)
);