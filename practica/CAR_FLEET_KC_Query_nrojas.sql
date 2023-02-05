SELECT m."name" AS "MODELO", b."name" AS "MARCA", g."name" as "GRUPO EMPRESARIAL", car.purchasedate AS "FECHA DE COMPRA", car.carregistration AS "MATRICULA", c."name"  as "COLOR", hi.idInsurance as "No DE POLIZA", ic.name as "SEGURO", car.totalkm as "TOTAL KM" 
from ((((((car_fleet_kc.cars car inner join car_fleet_kc.models m on car.model = m.idmodel)
inner join car_fleet_kc.brands b on m.brand = b.idbrand)
inner join car_fleet_kc.businessgroup g on b.businessgroup = g.idgroup)
inner join car_fleet_kc.colors c on car.color = c.idcolor)
inner join car_fleet_kc.historyinsurance hi on hi.car = car.idcar)
inner join car_fleet_kc.insurancecompany ic on ic.idCompany = hi.company);

