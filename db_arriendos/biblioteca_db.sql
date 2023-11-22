#Crear base de datos
create database biblioteca;
# https://drive.google.com/file/d/1HXVpb0-YRUd-h8t2L72anT9f0VAYHP9T/view?usp=sharing

#Llamar base de datos
use biblioteca;

drop table usuario;
#Crear tabla de usuario
create table usuario (
id_usuario varchar(11) primary key,
primer_nombre varchar(20) not null,
segundo_nombre varchar(20), 
primer_apellido varchar(20) not null,
segundo_apellido varchar(20),
email varchar(20) unique not null
);

#Muestra la tabla 
describe usuario;

drop table telefono;
#Crear tabla de telefono
create table telefono (
id integer (11) primary key,
operador varchar (20) not null,
id_usuario varchar (11) not null,
foreign key (id_usuario) references usuario (id_usuario)
);

describe telefono;
#------------------------------------------------------------

#Crear tabla libro
create table libro (
id_libro varchar (20) not null,	
titulo varchar (20)	not null,
autor varchar (20) not null,
categoria varchar (20),
estado varchar (11) not null															
);

#Modificar id_libro
alter table libro modify column id_libro varchar(20) primary key;

#Craer tabla usuario_libro
create table usuario_libro(
id_usuario varchar(11) not null,
id_libro varchar(20) not null,
primary key(id_usuario, id_libro)
);

describe usuario_libro;

alter table usuario_libro add foreign key (id_usuario) references usuario(id_usuario);
alter table usuario_libro add foreign key (id_libro) references libro(id_libro);

describe usuario_libro;

#Crear tabla préstamo 
create table prestamo (
id_prestamo varchar (20) primary key,
fecha_inicio date not null,
fecha_fin date not null
);

#crear tabla libro_prestamo
create table libro_prestamo (
id_libro varchar (20) not null,
id_prestamo varchar (20) not null,
primary key (id_libro, id_prestamo)
);

alter table libro_prestamo add foreign key (id_prestamo) references prestamo(id_prestamo);
alter table libro_prestamo add foreign key (id_libro) references libro(id_libro);

#Crear tabla empleado
create table empleado(
id_empleado varchar(20) primary key,
primer_nombre varchar(20) not null,
segundo_nombre varchar(20),
primer_apellido varchar(20) not null,
segundo_apellido varchar(20),
rol varchar(15) not null
);

#Crear tabla empleado_prestamo
create table empleado_prestamo (
id_prestamo varchar (20) not null,
id_empleado varchar (20) not null,
primary key (id_prestamo, id_empleado)
);

alter table empleado_prestamo add foreign key (id_prestamo) references prestamo (id_prestamo);
alter table empleado_prestamo add foreign key(id_empleado) references empleado (id_empleado);

#crear tabla informe
create table informe (
radicado varchar (20) primary key,
tipo varchar (15) not null,
descripcion varchar (200) not null,
id_empleado varchar (20) not null,
foreign key(id_empleado) references empleado (id_empleado)
);	