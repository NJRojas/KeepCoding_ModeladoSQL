create schema PRUEBA_DLL authorization rnggpgho;

drop table PUBLIC.PRUEBA_DLLseries

create table PRUEBA_DLL.series(
	idserie varchar(10) not null, --PK
	nombre varchar(200) not null,
	anio_creacion integer not null,
	constraint series_PK primary key(idserie) -- for foreign key multiple set column names separated by ',' (idserie, name)
);


-- add comment column

alter table prueba_dll.series
add column comentario text null;

create table prueba_dll.temporadas(
	idserie varchar(10) not null,  --PK, FK series
	num_temporada integer not null, --PK
	anio integer not null,
	titulo varchar(200) not null
);

-- set primary key
alter table prueba_dll.temporadas
add constraint temporadas_PK primary key(idSerie, num_Temporada);


-- set a foreign key to series
-- to activate 'on delete cascade' add in the 'on delete cascade'
alter table prueba_dll.temporadas 
add constraint temporadas_series_FK foreign key (idserie)
references prueba_dll.series(idserie);


-- add data

-- serie
insert into prueba_dll.series
(idserie, nombre, anio_creacion)
values('001', 'the good witch', 2000);

insert into prueba_dll.temporadas 
(idserie, num_temporada, anio, titulo)
values ('001', 1, 2000, 'pilot')


insert into prueba_dll.series 
values('002', 'the handmaids tales', 2020);

select * from prueba_dll.series
