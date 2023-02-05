--- Joins

select  a.num_temporada , a.anio , b.nombre 
from prueba_dll.temporadas a , prueba_dll.series b 
where a.idserie  = b.idserie  
and 1 = 1

select  a.num_temporada , a.anio , b.nombre 
from prueba_dll.temporadas a inner join prueba_dll.series b on a.idserie  = b.idserie
where 1 = 1


---Right join 
insert into prueba_dll.series 
(idserie, nombre , anio_creacion)
values ('0005','Los simpson', 1991)

select * from prueba_dll.series 

select a.num_temporada , a.anio , b.nombre 
from prueba_dll.temporadas a right join prueba_dll.series b on a.idserie  = b.idserie 




--- Left Join

select *
from  prueba_dll.series

select b.num_temporada , b.anio , a.nombre 
from  prueba_dll.series a inner join prueba_dll.temporadas b on a.idserie  = b.idserie 



select * from prueba_dll.temporadas




--- Ejercicio 1. Listado Empleados y su nombre del departamento MOBILE

select a.id_person as ID , b.name || ' ' || b.apell1 || ' ' || b.apelli2 as nombre  ,a.dt_hire , a.job 
from PUBLIC.employees a inner join public.person b on a.id_person  = b.id_person 
where a.department = 'MOBILE'












