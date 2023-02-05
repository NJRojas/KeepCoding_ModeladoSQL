create schema PRUEBA_DLL authorization oodhuafv;


---drop table PRUEBA_DLL.series;

create table PRUEBA_DLL.series(
	idserie varchar(10) not null,  --PK
	nombre varchar(200) not null,
	anio_creacion integer not null,
	constraint series_PK primary key(idserie)
);



---modificar tabla añadiendo un comentario

alter table prueba_dll.series 
add column comentario text null;

alter table prueba_dll.series 
drop column comentario;


-- Creamos tabla de temporadas

create table prueba_dll.temporadas(
	idserie varchar(10) not null,   --PK, FK a series
	num_temporada integer not null, --PK
	anio integer not null,
	titulo varchar(200) not null
);

--añadimos la PK
alter table prueba_dll.temporadas
add constraint temporadas_PK primary key (idserie, num_temporada);


--- Añadimos la FK
alter table prueba_dll.temporadas 
add constraint temporadas_series_FK 
foreign key (idserie) references prueba_dll.series(idserie);



-- Añadimos datos
insert into prueba_dll.series 
values('001','Breaking Bad', 2008); ---no hacer asi nunca.
 
insert into prueba_dll.series 
values('002','Juego de tronos', 2011); ---no hacer asi nunca.

insert into prueba_dll.series 
values('003','Hermanos de sangre', 2001); ---no hacer asi nunca.


-- ver los datos de la tabla series
select * from prueba_dll.series 



insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('001',1,2008,'Primera temporada');

insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('001',2,2009,'Segunda temporada');


insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('001',3,2010,'Tercera temporada');

insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('001',4,2011,'Cuarta temporada');

--serie 2
insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('002',1,2011,'primera temporada');

insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('002',2,2012,'segunda temporada');

insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('002',3,2013,'tercera temporada');



insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('003',1,2001,'Temporada única');



--- Sentencia SQL select 

-- Esto es un FULL SCAN 
--- select * from prueba_dll.temporadas 

select *
from prueba_dll.temporadas ; 

select idserie , num_temporada , anio , titulo
from prueba_dll.temporadas ;

--where

select idserie , num_temporada , anio , titulo
from prueba_dll.temporadas 
where idserie = '002'


select idserie , num_temporada , anio , titulo
from prueba_dll.temporadas 
where idserie = '002' and num_temporada  = 2

select idserie , num_temporada , anio , titulo
from prueba_dll.temporadas 
where idserie = '002' and (num_temporada = 1 or num_temporada = 2)

select idserie , num_temporada , anio , titulo
from prueba_dll.temporadas 
where idserie = '002' and num_temporada in (1,2)


select idserie , num_temporada , anio , titulo
from prueba_dll.temporadas 
where idserie = '002' and num_temporada  < 3


select idserie , num_temporada , anio , titulo
from prueba_dll.temporadas 
where anio  > 2010
order by anio desc, num_temporada desc 



select distinct  idserie 
from prueba_dll.temporadas 
where anio  > 2011




--- SetencIA delete 


delete from prueba_dll.temporadas 
where idserie = '003';

delete from prueba_dll.series 
where idserie = '003';

select * from  prueba_dll.series 


delete from prueba_dll.temporadas 
where idserie  = '001' and num_temporada  = 3




--UPDATE 

select *
from prueba_dll.temporadas
where idserie = '001' and num_temporada  = 3

update prueba_dll.temporadas 
set titulo  = 'Temporada 3' , anio  = 2010
where idserie = '001' and num_temporada  = 3




--SELECT - AGRUPACIONES

select Count(*), min(anio), max(num_temporada), sum(num_temporada)
, avg(num_temporada)
from prueba_dll.temporadas 
where idserie  = '001'


select *
from prueba_dll.temporadas 
where idserie  = '001'


select idserie , count(*)
from prueba_dll.temporadas
where 1 = 1 and idserie <> '003'
group by idserie
having count(*) > 2 -- filtra group
order by idserie desc



select idserie,num_temporada, count(*)
from prueba_dll.temporadas
where idserie <> '003'
group by idserie, num_temporada
having count(*) > 3 -- filtra group
order by idserie desc


--- Union All. carias select en una tabla

select idserie , titulo 
from prueba_dll.temporadas
where idserie  = '001'

union all

select idserie , 'sin dato'  
from prueba_dll.temporadas
where idserie  = '002'

union all

select idserie , titulo 
from prueba_dll.temporadas
where idserie  = '003'



--- crear tabla a partir de una select. Ojo te salva el culo.

create table prueba_dll.temporadas_copia_24_01_2023
as
select * from prueba_dll.temporadas

select * from prueba_dll.temporadas_copia_24_01_2023


insert into prueba_dll.temporadas
select * from prueba_dll.temporadas_copia_24_01_2023




---funciones
select *, date_part('month',dt_birth)
from public.person
where date_part('year', dt_birth) = 1976 
      and date_part('month',dt_birth) = 2
      and date_part('day',dt_birth) = 14

      
 SELECT a.num_temporada, a.anio_creacion
 FROM prueba_dll.temporadas a, prueba_dll.series b