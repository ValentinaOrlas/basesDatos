#crear base de datos de arreindos 
create database db_arriendos;

#llamar la base de datos 
use db_arriendos;

#crear tabla departamento
create table departamento(
id_departamento smallint primary key,
nom_departamento varchar(50) not null
);

#-----------------------------------------------------------------------------------------------------------------------

#crear la tabla ciudad

create table ciudad(
id_ciudad smallint primary key,
nom_ciudad varchar(30) not null,
id_departamento smallint,
foreign key(id_departamento) references departamento(id_departamento)
);
#modificar
alter table ciudad modify column id_departamento smallint not null;

#visualizar estructura tabla
describe ciudad;

#-----------------------------------------------------------------------------------------------------------------------------

#crear la tabla propietario

create table propietario(
id_propietario smallint primary key,
primer_nombre varchar(10) not null,
segundo_nombre varchar(10),
primer_apellido varchar(10) not null,
segundo_apellido varchar(10),
email varchar(50)	
);

alter table propietario modify column email varchar(50) unique;
#-----------------------------------------------------------------------------------------------------------------------------

#crear la tabla vivienda

create table vivienda(
id_vivienda smallint primary key,
direccion varchar(50) not null,
direccion_calle varchar(20),
cantidad_habitantes int(10) not null,
descripcion varchar(200) not null,
id_propietario smallint,
foreign key(id_propietario) references propietario(id_propietario)
);
#modificar el id_propietario a not null

alter table vivienda modify column id_propietario smallint not null;

#agregar la columna id_ciudad en la tabla vivienda

alter table vivienda add column id_ciudad smallint not null;

#agregar el id_ciudad de la tabla vivienda como una fk

alter table vivienda add foreign key(id_ciudad) references ciudad(id_ciudad);

describe vivienda; 


#--------------------------------------------------------------------------------------------------------------------------------------

#crear la tabla arriendos

create table arriendos(
id_arriendo smallint primary key,
fecha_inicio date not null,
fecha_final date not null,
valor_mensual decimal not null,
id_vivienda smallint not null,
foreign key(id_vivienda) references vivienda(id_vivienda)
);

describe arriendos;

#-----------------------------------------------------------------------------------------------------------------------------

#crear tabla inquilinos

create table inquilino(
id_inquilino smallint primary key,
primer_nombre varchar(10) not null,
segundo_nombre varchar(10),
primer_apellido varchar(10) not null,
segundo_apellido varchar(10),
email varchar(50) unique
);
describe inquilino;


#------------------------------------------------------------------------------------------------------------------

#crear tabla de inquilo_arriendo

create table inquilino_arriendo(
id_inquilino_arriendo smallint primary key
);

alter table inquilino_arriendo add column id_arriendo smallint not null;
alter table inquilino_arriendo add foreign key(id_arriendo) references arriendos(id_arriendo);
alter table inquilino_arriendo add column id_inquilino smallint not null;
alter table inquilino_arriendo add foreign key(id_inquilino) references inquilino(id_inquilino);
describe inquilino_arriendo;


#-------------------------------------------------------------------------------------------------------------------------------------

#crear tabla telefonos

create table telefonos(
id_telefono varchar(11) primary key,
operador varchar(20) not null
);

alter table telefonos add column id_inquilino smallint not null;
alter table telefonos add foreign key(id_inquilino) references inquilino(id_inquilino);
alter table telefonos add column id_propietario smallint not null;
alter table telefonos add foreign key(id_propietario) references propietario(id_propietario);

alter table telefonos modify column id_inquilino smallint null;
alter table telefonos modify column id_propietario smallint null;
describe telefonos;