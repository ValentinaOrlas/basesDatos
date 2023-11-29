#borra la base de datos si existe
drop database if exists db_tienda;

#base de datos tienda 
create database db_tienda character set utf8mb4;

use db_tienda;

create table fabricante(
código int(10) primary key,
nombre varchar(100) not null
);

#insertar registros en la tabla fabricante
insert into fabricante values (1, 'Asus');
insert into fabricante(nombre,código) values('lenovo', 2);
insert into fabricante values (3, 'Hewlett-Packard');
insert into fabricante values(4,'Samsung'),(5,'Seagate'),(6,'Crucial'),(7,'Gigabyte'),(8,'Huawei'),(9,'Xiaomi');
insert into fabricante values(10,'Honor');

# mostrar registro de tablas
select * from fabricante;

#Crear tabla producto
create table producto(
código int(10) primary key,
nombre varchar(100) not null,
precio double not null,
código_fabricante int(10) not null,
foreign key(código_fabricante) references fabricante(código)
);

insert into producto values(1,'Disco duro SATA3 1TB',86.99,5),(2,'Memoria RAM DDR4 8GB',120,6),(3,'Disco SSD 1 TB',150.99,4),
(4,'GeForce GTX 1050Ti',185,7),(5,'GeForce GTX 1080 Xtreme',755,6),(6,'Monitor 24 LED Full HD',202,1),(7,'Monitor 27 LED Full HD',245.99,1),
(8,'Portátil Yoga 520',559,2),(9,'Portátil Ideapd 320',444,2),(10,'Impresora HP Deskjet 3720',59.99,3),(11,'Impresora HP Laserjet Pro M26nw',180,3);

select * from producto;

#Actualizar registro
update fabricante set nombre = 'Compaq' where código = 10;

#Eliminar registro
delete from fabricante where código=10;








