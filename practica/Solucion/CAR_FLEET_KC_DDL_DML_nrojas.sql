--- Modelo Normalizado

CREATE SCHEMA CAR_FLEET_KC AUTHORIZATION rnggpgho;


--- 1.  Create tables with & references


-------- Colors

CREATE TABLE CAR_FLEET_KC.colors(
	idColor varchar(20) NOT NULL, --PK
	name varchar(50) NOT NULL
);

ALTER TABLE CAR_FLEET_KC.colors
ADD CONSTRAINT colors_PK PRIMARY KEY (idColor);

-------- Currencies

CREATE TABLE CAR_FLEET_KC.currencies(
	idCurrency varchar(20) NOT NULL, --PK
	name varchar(50) NOT NULL
);

ALTER TABLE CAR_FLEET_KC.currencies
ADD CONSTRAINT currencies_PK PRIMARY KEY (idCurrency);


-------- Insurance company

CREATE TABLE CAR_FLEET_KC.insuranceCompany(
	idCompany varchar(20) NOT NULL, --PK
	name varchar(200) NOT NULL
);

ALTER TABLE CAR_FLEET_KC.insuranceCompany
ADD CONSTRAINT insuranceCompany_PK PRIMARY KEY (idCompany);

-------- Business group

CREATE TABLE CAR_FLEET_KC.businessgroup(
	idGroup varchar(20) NOT NULL, --PK
	name varchar(200) NOT NULL
);

ALTER TABLE CAR_FLEET_KC.businessgroup
ADD CONSTRAINT businessGroup_PK PRIMARY KEY (idGroup);

-------- Brand

CREATE TABLE CAR_FLEET_KC.brands(
	idBrand varchar(20) NOT NULL, --PK
	name varchar(100) NOT NULL,
	businessgroup varchar(20) NOT NULL -- FK
);

ALTER TABLE CAR_FLEET_KC.brands
ADD CONSTRAINT brands_PK PRIMARY KEY (idBrand);

ALTER TABLE CAR_FLEET_KC.brands
ADD CONSTRAINT brands_group_FK FOREIGN KEY (businessGroup) REFERENCES CAR_FLEET_KC.businessgroup(idGroup) ON DELETE CASCADE;

-------- Models

CREATE TABLE CAR_FLEET_KC.models(
	idModel varchar(20) NOT NULL, --PK
	name varchar(50) NOT NULL,
	brand varchar(20) NOT NULL -- FK
);

ALTER TABLE CAR_FLEET_KC.models
ADD CONSTRAINT models_PK PRIMARY KEY (idModel);

alter table	CAR_FLEET_KC.models
ADD CONSTRAINT models_brands_FK FOREIGN KEY (brand) REFERENCES CAR_FLEET_KC.brands(idBrand) ON DELETE CASCADE;

-------- Cars

CREATE TABLE CAR_FLEET_KC.cars(
	idCar varchar(20) NOT NULL, -- PK
	color varchar(20) NOT NULL, -- FK
	model varchar(20) not NULL, -- FK
	carRegistration varchar(50) NOT NULL,
	purchaseDate DATE NOT NULL,
	dischargeDate DATE NOT NULL default '4000-01-01',
	currency varchar(20) NOT NULL DEFAULT 'EUR', -- FK,
	purchaseValue NUMERIC(12,5) NOT NULL DEFAULT 0,
	totalKM numeric(12, 5) DEFAULT 0
);

ALTER TABLE CAR_FLEET_KC.cars
ADD CONSTRAINT car_PK PRIMARY KEY (idCar);

ALTER TABLE CAR_FLEET_KC.cars
ADD CONSTRAINT cars_colors_FK FOREIGN KEY (color) REFERENCES CAR_FLEET_KC.colors(idColor) ON DELETE CASCADE;

ALTER TABLE CAR_FLEET_KC.cars
ADD CONSTRAINT cars_models_FK FOREIGN KEY (model) REFERENCES CAR_FLEET_KC.models(idModel) ON DELETE CASCADE;

ALTER TABLE CAR_FLEET_KC.cars
ADD CONSTRAINT cars_currencies_FK FOREIGN KEY (currency) REFERENCES CAR_FLEET_KC.currencies(idCurrency) ON DELETE CASCADE;


-------- History Insurance

create table CAR_FLEET_KC.historyInsurance(
	idInsurance varchar(50) NOT NULL, -- PK
	car varchar(20) not null, -- FK
	company varchar(20) not null, -- FK
	purchaseDate date not null,
	currency varchar(20) not null, -- FK
	value numeric(12, 5) not null
);

ALTER TABLE CAR_FLEET_KC.historyInsurance
ADD CONSTRAINT historyInsurance_PK PRIMARY KEY (idInsurance);

ALTER TABLE CAR_FLEET_KC.historyInsurance
ADD CONSTRAINT historyInsurance_cars_FK FOREIGN KEY (car) REFERENCES CAR_FLEET_KC.cars(idCar) ON DELETE CASCADE;

ALTER TABLE CAR_FLEET_KC.historyInsurance
ADD CONSTRAINT historyInsurance_company_FK FOREIGN KEY (company) REFERENCES CAR_FLEET_KC.insuranceCompany(idCompany) ON DELETE CASCADE;

ALTER TABLE CAR_FLEET_KC.historyInsurance
ADD CONSTRAINT historyInsurance_currencies_FK FOREIGN KEY (currency) REFERENCES CAR_FLEET_KC.currencies(idCurrency) ON DELETE CASCADE;


-------- History Reviews

create table CAR_FLEET_KC.historyCarReviews(
	idReview varchar(50) not null, -- PK
	car varchar(20) not null, -- FK
	reviewDate date not null,
	currency varchar(20) not null, -- FK
	value numeric (12, 5) not null,
	km numeric(12, 5) not null default 0
);

ALTER TABLE CAR_FLEET_KC.historyCarReviews
ADD CONSTRAINT historyCarReviews_PK PRIMARY KEY (idReview);

ALTER TABLE CAR_FLEET_KC.historyCarReviews
ADD CONSTRAINT historyCarReviews_cars_FK FOREIGN KEY (car) REFERENCES CAR_FLEET_KC.cars(idCar) ON DELETE CASCADE;

ALTER TABLE CAR_FLEET_KC.historyCarReviews
ADD CONSTRAINT historyCarReviews_currencies_FK FOREIGN KEY (currency) REFERENCES CAR_FLEET_KC.currencies(idCurrency) ON DELETE CASCADE;


--- 2. Insert data

--- Add colors
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C00001','Metalic blue');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C00022','White');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C11111','Black');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C22222','Red');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C11220','Violet');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C02020','orange');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C99999','green');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C44444','gray');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C99880','Blue');
INSERT INTO CAR_FLEET_KC.colors (idColor, "name") VALUES('C44669','Yellow');

-- Add currencies
INSERT INTO CAR_FLEET_KC.currencies (idCurrency, "name") VALUES('EUR','Euro');
INSERT INTO CAR_FLEET_KC.currencies (idCurrency, "name") VALUES('USD','US Dollar');
INSERT INTO CAR_FLEET_KC.currencies (idCurrency, "name") VALUES('GBP','GB pound');

-- Add Insurance companies
INSERT INTO CAR_FLEET_KC.insurancecompany (idCompany, "name") VALUES('IC0001','AXA');
INSERT INTO CAR_FLEET_KC.insurancecompany (idCompany, "name") VALUES('IC0002','MAPFRE');
INSERT INTO CAR_FLEET_KC.insurancecompany (idCompany, "name") VALUES('IC0003','MMT');
INSERT INTO CAR_FLEET_KC.insurancecompany (idCompany, "name") VALUES('IC0004','ING');
INSERT INTO CAR_FLEET_KC.insurancecompany (idCompany, "name") VALUES('IC0005','Allianz');

--- Add Business Groups
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G001','Volkswagen Group');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G002','General Motors');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G003','Toyota Motor Corp.');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G004','Ford Motor Co.');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G005','Daimler AG');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G006','BMW Group');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G007','Renault-Nissan-Mitsubishi Alliance');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G008','Honda Motor Co.');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G009','Hyundai Motor Group');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G010','Tata Motors');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G011','Mazda Motor Corp.');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G012','Tesla Inc.');
INSERT INTO CAR_FLEET_KC.businessgroup (idGroup, "name") VALUES('G013','Sellantis');

--- Add Brands
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00001','Audi','G001');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00002','Ford','G004');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00003','Mini','G006');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00004','Jaguar','G010');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00005','Lamborghini','G001');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00006','Chevrolet','G002');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00007','Volkswagen','G001');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00008','Porsche','G001');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00009','Honda', 'G008');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00010','Hyundai','G009');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00011','Mitsubishi','G007');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00012','Mercedes-Benz','G005');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00013','Nissan','G007');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00014','BMW','G006');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00015','Smart','G005');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00016','Tesla','G012');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00017','Rolls-Royce','G006');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00018','Mazda','G011');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00019','Toyota','G003');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00020','Cadillac','G002');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00021','Land Rovers','G010');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00022','Maserati','G013');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00023','Kia','G009');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00025','Jeep','G013');
INSERT INTO CAR_FLEET_KC.brands (idBrand, "name", businessgroup) VALUES('B00026','Alfa Romeo','G013');

--- Add Models
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00001','WRANGLER 4-DOOR FREEDOM 4X4','B00025');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00002','BMW iX1','B00014');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00003','Mini Cooper 3 doors premium','B00014');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00004','Jaguar E-PACE','B00004');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00005','Aventador LP 780-4 ULTIMATE','B00005');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00006','CX-60','B00018');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00007','T-Cross Active','B00007');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00008','Porsche Cayenne','B00008');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00009','Ford Bronco Raptor','B00002');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00010','Eclipse Cross Plug Hybrid','B00007');
INSERT INTO CAR_FLEET_KC.models (idModel, "name", brand) VALUES('M00011','Clase G','B00012');

--- Add Cars
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00001','C22222','M00001','0123 GXP','2022-08-01','EUR',150000,2000);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00002','C99999','M00002','2934 NEY','2022-08-16','EUR',70000,1700);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00003','C99880','M00003','3456 NIC','2022-09-01','EUR',45000,3000);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00004','C00001','M00004','9876 LOV','2022-09-16','EUR',85000,1000);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00005','C44669','M00005','8172 YOG','2022-10-01','EUR',200000,500);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00006','C11220','M00006','0234 GRA','2022-10-16','EUR',35000,3040);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00007','C02020','M00007','0764 SHI','2022-11-01','EUR',40000,3500);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00008','C44444','M00008','7392 PEA','2022-11-16','EUR',90000,500);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00009','C00022','M00009','8127 PAZ','2022-12-01','EUR',60000,1000);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00010','C11111','M00010','4298 ENE','2022-12-16','EUR',35000,1500);
INSERT INTO CAR_FLEET_KC.cars (idCar, color, model, carRegistration, purchaseDate, currency, purchaseValue, totalkm) VALUES('A00011','C22222','M00011','9180 NED','2023-01-02','EUR',120000,500);


--- Add History Insurance
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00001','A00001','IC0001','2022-08-02','EUR',5000);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00002','A00002','IC0002','2022-08-17','EUR',2500);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00003','A00003','IC0003','2022-09-02','EUR',1500);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00004','A00004','IC0004','2022-09-17','EUR',3000);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00005','A00005','IC0005','2022-10-02','EUR',7000);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00006','A00006','IC0001','2022-10-17','EUR',1500);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00007','A00007','IC0002','2022-11-02','EUR',1500);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00008','A00008','IC0003','2022-11-17','EUR',3000);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00009','A00009','IC0004','2023-12-02','EUR',2500);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00010','A00010','IC0005','2023-12-17','EUR',1500);
INSERT INTO CAR_FLEET_KC.historyinsurance (idInsurance, car, company, purchaseDate, currency, value) VALUES('I00011','A00011','IC0001','2023-01-03','EUR',7500);


--- Add History Reviews
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00001','A00001','2022-08-02','EUR',300,25);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00002','A00002','2022-08-17','EUR',150,50);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00003','A00003','2022-09-02','EUR',150,25);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00004','A00004','2022-09-17','EUR',150,50);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00005','A00005','2022-10-02','EUR',150,25);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00006','A00006','2022-10-17','EUR',150,50);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00007','A00007','2022-11-02','EUR',150,25);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00008','A00008','2022-11-17','EUR',150,50);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00009','A00009','2022-12-02','EUR',150,25);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00010','A00010','2022-12-17','EUR',150,50);
INSERT INTO CAR_FLEET_KC.historyCarReviews (idReview, car, reviewDate, currency, value, KM) VALUES('R00011','A00011','2023-01-03','EUR',300,25);

