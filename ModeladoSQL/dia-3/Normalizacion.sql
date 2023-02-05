-- Modelo normalizado nuevo.


create schema personamaster authorization oodhuafv;

--- 1. Persona y sus tablas de referencia

--tipo documentos
create table personamaster.type_docs(
	type_doc varchar(20)  not null, --PK
	name varchar(200) not null,
	description varchar(512) null
);

alter table personamaster.type_docs
add constraint  type_docs_PK primary key (type_doc);


-- Tabla de geneders
create table personamaster.type_gender(
	gender varchar(20)  not null, --PK
	name varchar(200) not null,
	description varchar(512) null
);

alter table personamaster.type_gender
add constraint  type_gender_PK primary key (gender);


-- tabla person
create table personamaster.person(
	id_person varchar(10) not null,  --PK
	name varchar(50) not null,
	apell1 varchar(50) not null,
	apell2 varchar(50) null,
	dt_birth date not null,
	type_doc varchar(20) not null, --FK
	legal_id varchar(20) not null,
	email varchar(255) null,
	phone varchar(20) null,
	gender varchar(20) not null, --FK
	description varchar(512) null
	
);

--PK
alter table personamaster.person
add constraint person_PK primary key (id_person);

--FK
alter table personamaster.person
add constraint persona_type_docs_FK foreign key (type_doc)
references personamaster.type_docs(type_doc);

alter table personamaster.person
add constraint persona_type_gender_FK foreign key (gender)
references personamaster.type_gender(gender);


--cargar los datos.


insert into personamaster.type_docs 
(type_doc, "name", description)
values('NIF', 'Dni / Nif', 'Documento oficial de España');

insert into personamaster.type_docs 
(type_doc, "name", description)
values('PASS', 'Pasaporte', '');

insert into personamaster.type_gender 
(gender, name, description)
values ('FLUIDO','Genero Fluido','');


insert into personamaster.type_gender 
(gender, name, description)
values ('MUJER','Genero Femenino / Mujer','');

insert into personamaster.type_gender 
(gender, name, description)
values ('NO DEFINIDO','Genero No definido','');

insert into personamaster.type_gender 
(gender, name, description)
values ('HOMBRE','Genero Masculino','');


insert into personamaster.person 
(id_person, name, apell1, apell2, dt_birth, type_doc , legal_id , email, phone, gender, description)
select id_person , "name" ,apell1 , apelli2 , getdate , type_doc , legal_id , email , phone , gender , 'Carga inicial' 
from public.person 




--- Empleado -----


create table personamaster.motivos(
	id_reason varchar(100) not null,
	name varchar(256) not null,
	description varchar(512) null
);

--pk 

alter table personamaster.motivos
add constraint motivos_PK primary key(id_reason);

---select distinct reason_termination   from public.employees


insert into personamaster.motivos
(id_reason, name)
values ('01','Nueva alta');

insert into personamaster.motivos
(id_reason, name)
values ('02','Sin motivo');


-- crear tabla temporal del empleados, poirque no podemos tocar la del cliente

create table personamaster.employees_aux_borrar
as
select * from public.employees;

-- recodificamos empleados

update personamaster.employees_aux_borrar
set reason_hire  = '01';

update personamaster.employees_aux_borrar
set reason_termination  = '02';


---select * from personamaster.employees_aux_borrar

-- tipo de contratacion

create table personamaster.tpcontratacion(
	idtipocontratacion varchar (100) not null,
	name varchar(256) not null,
	description varchar(512) null
);

--PK
alter table personamaster.tpcontratacion
add constraint tpcontratacion_PK primary key (idtipocontratacion);


insert into personamaster.tpcontratacion
values ('01','Empleado');

insert into personamaster.tpcontratacion
values ('02','Profesional /freelance');

--select * from personamaster.employees_aux_borrar



update personamaster.employees_aux_borrar
set employee_type  = '01'
where employee_type  = 'EMPLEADO';

update personamaster.employees_aux_borrar
set employee_type  = '02'
where employee_type  = 'PROFESIONAL';


--puestod

--select distinct job  from personamaster.employees_aux_borrar

create table personamaster.jobs(
	idjob varchar(100) not null,
	name varchar(256) not null,
	description varchar(512) null
);

alter table personamaster.jobs
add constraint jobs_PK primary key(idjob);

insert into personamaster.jobs values('01','MAQUETADOR');
insert into personamaster.jobs values('02','DISEÑADOR');
insert into personamaster.jobs values('03','PROGRAMADOR');
insert into personamaster.jobs values('04','IOS JUNIOR');
insert into personamaster.jobs values('05','EXPERTO EN REDES NEURONALES');
insert into personamaster.jobs values('06','PROG. WEB ANGULAR');
insert into personamaster.jobs values('07','IOS SENIOR');
insert into personamaster.jobs values('08','ANALISTA');
insert into personamaster.jobs values('09','DISEÑADOR JUNIOR');
insert into personamaster.jobs values('10','PROG. WEB REACT');
insert into personamaster.jobs values('11','EXPERTO NLP');
insert into personamaster.jobs values('12','ANDROID SENIOR');
insert into personamaster.jobs values('13','DISEÑADOR SENIOR');
insert into personamaster.jobs values('14','CIENTIFICO DE DATOS');
insert into personamaster.jobs values('15','EXPERTO ML');
insert into personamaster.jobs values('16','PROFESIONAL');



update personamaster.employees_aux_borrar set job ='01' where job = 'MAQUETADOR';
update personamaster.employees_aux_borrar set job ='02' where job = 'DISEÑADOR';
update personamaster.employees_aux_borrar set job ='03' where job = 'PROGRAMADOR';
update personamaster.employees_aux_borrar set job ='04' where job = 'IOS JUNIOR';
update personamaster.employees_aux_borrar set job ='05' where job = 'EXPERTO EN REDES NEURONALES';
update personamaster.employees_aux_borrar set job ='06' where job = 'PROG. WEB ANGULAR';
update personamaster.employees_aux_borrar set job ='07' where job = 'IOS SENIOR';
update personamaster.employees_aux_borrar set job ='08' where job = 'ANALISTA';
update personamaster.employees_aux_borrar set job ='09' where job = 'DISEÑADOR JUNIOR';
update personamaster.employees_aux_borrar set job ='10' where job = 'PROG. WEB REACT';
update personamaster.employees_aux_borrar set job ='11' where job = 'EXPERTO NLP';
update personamaster.employees_aux_borrar set job ='12' where job = 'ANDROID SENIOR';
update personamaster.employees_aux_borrar set job ='13' where job = 'DISEÑADOR SENIOR';
update personamaster.employees_aux_borrar set job ='14' where job = 'CIENTIFICO DE DATOS';
update personamaster.employees_aux_borrar set job ='15' where job = 'EXPERTO ML';
update personamaster.employees_aux_borrar set job ='16' where job = 'PROFESIONAL';



---siis creamos employees


create table personamaster.employees(
	id_person varchar(10) not null,  --FK
	dt_hire date not null,
	dt_termination date not null default '4000-01-01',
	dt_seniority date not null default '4000-01-01',
	id_reason_hire varchar(100) not null, --FK
	id_reason_termination varchar(100) not null, --FK
	id_tipocontratacion varchar(100) not null -- FK
);

--PK
alter table personamaster.employees
add constraint employees_PK primary key (id_person, dt_hire);

-- FK

alter table personamaster.employees
add constraint employees_person_FK foreign key (id_person) references
personamaster.person(id_person);

alter table personamaster.employees
add constraint employees_motivo_alta_FK foreign key (id_reason_hire) references
personamaster.motivos(id_reason);

alter table personamaster.employees
add constraint employees_motivo_baja_FK foreign key (id_reason_termination) references
personamaster.motivos(id_reason);


alter table personamaster.employees
add constraint employees_contratacion_FK foreign key (id_tipocontratacion) references
personamaster.tpcontratacion(idtipocontratacion);



--cargamos la tabla temporal.

insert into personamaster.employees 
(id_person, dt_hire, dt_termination, dt_seniority, id_reason_hire, id_reason_termination, id_tipocontratacion)
select id_person, dt_hire , dt_termination , dt_seniority , reason_hire , reason_termination , employee_type
from personamaster.employees_aux_borrar ;

select * from personamaster.employees 



