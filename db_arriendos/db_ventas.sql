create database ventas;

use ventas;
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

create table productos_pedidos (
id_productos varchar (20) not null,
codigo varchar (20) not null,
primary key (id_productos, codigo)
);

alter table productos_pedidos add foreign key (id_productos) references productos (id_productos);
alter table productos_pedidos add foreign key(codigo) references pedidos (codigo);