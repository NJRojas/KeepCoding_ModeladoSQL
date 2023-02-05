drop schema CAR_FLEET_KC cascade;

-- reset business group

drop table CAR_FLEET_KC.businessgroup 

-- reset brands
alter table CAR_FLEET_KC.brands
drop constraint brands_group_FK;

truncate table CAR_FLEET_KC.brands;

-- reset models

alter table CAR_FLEET_KC.models 
drop constraint models_brands_FK;

truncate table CAR_FLEET_KC.models;

drop table CAR_FLEET_KC.models;

-- reseting cars

alter table CAR_FLEET_KC.cars 
drop constraint cars_models_FK;

alter table CAR_FLEET_KC.cars 
drop constraint cars_colors_FK;

alter table CAR_FLEET_KC.cars 
drop constraint cars_currencies_FK;

truncate table CAR_FLEET_KC.cars;

drop table CAR_FLEET_KC.cars 

--- reseting carReviews

alter table CAR_FLEET_KC.historycarreviews  
drop constraint historycarreviews_cars_FK;

alter table CAR_FLEET_KC.historycarreviews  
drop constraint historycarreviews_currencies_FK;

truncate table CAR_FLEET_KC.historycarreviews 

drop table CAR_FLEET_KC.historycarreviews;

-- reseting Histtory Insurance

alter table CAR_FLEET_KC.historyInsurance
drop constraint historyInsurance_company_FK;

alter table CAR_FLEET_KC.historyInsurance
drop constraint historyInsurance_cars_FK;

alter table CAR_FLEET_KC.historyInsurance  
drop constraint historyInsurance_currencies_FK;

drop table CAR_FLEET_KC.historyInsurance;

truncate table CAR_FLEET_KC.historyInsurance;


----- Query test

select *
from CAR_FLEET_KC.cars;
