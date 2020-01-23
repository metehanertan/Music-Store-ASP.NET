CREATE DATABASE MUSICSHOP;

USE MUSICSHOP

CREATE TABLE ADDRESS(
AddressID int,
Country varchar(15),
City varchar(15),
StreetName varchar(15),
BuildingName varchar(15),
FlatNumber int,
PostCode int,

CONSTRAINT Address_PK PRIMARY KEY (AddressID)
);

CREATE TABLE STORE(
StoreID int,
Capacity int,
Rent int,
AddressID int,

CONSTRAINT Store_PK PRIMARY KEY (StoreID),
CONSTRAINT Store_FK FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID)
);

CREATE TABLE OPENHOURS(
StoreID int,
OpeningHour int,
ClosingHour int,

CONSTRAINT OpenHours_PK PRIMARY KEY (StoreID),
CONSTRAINT OpenHours_FK FOREIGN KEY (StoreID) REFERENCES STORE(StoreID)
);

CREATE TABLE EMPLOYEE(
SSN int,
Name varchar(15),
Surname varchar(15),
BirthDay Date,
Salary int,
TotalItemsSold int,
StoreID int,

CONSTRAINT Employee_PK PRIMARY KEY (SSN),
CONSTRAINT Employee_FK FOREIGN KEY (StoreID) REFERENCES STORE(StoreID)
);

ALTER TABLE EMPLOYEE ADD Age AS DATEDIFF(YEAR, BirthDay, GETDATE());

CREATE TABLE CUSTOMER(
CustomerID int IDENTITY
(1, 1),
Name varchar(15),
Surname varchar(15),
EMail varchar(25),
PhoneNumber varchar(11),

CONSTRAINT Customer_PK PRIMARY KEY (CustomerID),
);

CREATE TABLE ONLINECUSTOMER(
CustomerID int IDENTITY
(1001, 1),
Name varchar(15),
Surname varchar(15),
EMail varchar(25),
PhoneNumber varchar(11),
AddressID int,
UserName varchar(15),
Password varchar(15),

CONSTRAINT OnlineCustomer_PK PRIMARY KEY (CustomerID),
CONSTRAINT OnlineCustomer_FK FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID)
);

CREATE TABLE ORDER_T(
OrderID int,
Date Date DEFAULT GETDATE(),
TotalPrice int,
CustomerID int,
AddressID int,

CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Order_FK FOREIGN KEY (CustomerID) REFERENCES ONLINECUSTOMER(CustomerID),
CONSTRAINT Order_FK2 FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID)
);

CREATE TABLE ITEM(
ID int,
Price int,
ProductionDate Date,
Condition varchar(12)
	CHECK(Condition IN('unused','second hand')),
Brand varchar(20),
AddressID int,
OrderID int,
ItemName varchar(15),

CONSTRAINT Item_PK PRIMARY KEY (ID),
CONSTRAINT Item_FK1 FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID),
CONSTRAINT Item_FK2 FOREIGN KEY (OrderID) REFERENCES ORDER_T(OrderID)
);

CREATE TABLE INSTRUMENT(
ID int,	
Type varchar(25)
	CHECK(Type IN('bowed stringed instrument', 'wind instrument', 'clavier')),

CONSTRAINT Instrument_PK PRIMARY KEY (ID),
CONSTRAINT Instrument_FK FOREIGN KEY (ID) REFERENCES ITEM(ID)
);

CREATE TABLE GUITAR(
ID int,
Type varchar(12)
	CHECK(Type IN('classic', 'acoustic', 'bass', 'ukulele', 'electro')),
NumberOfStrings int,
TypeOfMaterial varchar(12),

CONSTRAINT Guitar_PK PRIMARY KEY (ID),
CONSTRAINT Guitar_FK FOREIGN KEY (ID) REFERENCES INSTRUMENT(ID)
);

CREATE TABLE VIOLIN(
ID int,
Type varchar(12)
	CHECK(Type IN('classic', 'electro')),
TypeOfMaterial varchar(12),

CONSTRAINT Violin_PK PRIMARY KEY (ID),
CONSTRAINT Violin_FK FOREIGN KEY (ID) REFERENCES INSTRUMENT(ID)
);

CREATE TABLE FLUTE(
ID int,
Type varchar(12)
	CHECK(Type IN('pan', 'side-blow')),
TypeOfMaterial varchar(12),

CONSTRAINT Flute_PK PRIMARY KEY (ID),
CONSTRAINT Flute_FK FOREIGN KEY (ID) REFERENCES INSTRUMENT(ID)
);

CREATE TABLE PIANO(
ID int,
Type varchar(12)
	CHECK(Type IN('electronic', 'upright', 'grand piano')),
NumberOfPedals int,
NumberOfOctave int,
TypeOfMaterial varchar(12),

CONSTRAINT Piano_PK PRIMARY KEY (ID),
CONSTRAINT Piano_FK FOREIGN KEY (ID) REFERENCES INSTRUMENT(ID)
);

CREATE TABLE SOUNDSYSTEM(
ID int,	
Watt int,
DeviceType varchar(20)
	CHECK(DeviceType IN('amplifier', 'mixer', 'speaker')),
Type varchar(12)
	CHECK(Type IN('electro', 'acoustic', 'bas', 'normal', 'power', 'active', 'passive')),

CONSTRAINT SoundSystem_PK PRIMARY KEY (ID),
CONSTRAINT SoundSystem_FK FOREIGN KEY (ID) REFERENCES ITEM(ID)
);

CREATE TABLE PEDAL(
ID int,	
Type varchar(20)
	CHECK(Type IN('distortion', 'reverb', 'volume', 'loop', 'delay', 'overdrive')),

CONSTRAINT Pedal_PK PRIMARY KEY (ID),
CONSTRAINT Pedal_FK FOREIGN KEY (ID) REFERENCES ITEM(ID)
);

CREATE TABLE ACCESSORIES(
ID int,	
Type varchar(20)
	CHECK(Type IN('case', 'metronome', 'tuner', 'stand', 'cable', 'string')),

CONSTRAINT Accessories_PK PRIMARY KEY (ID),
CONSTRAINT Accessories_FK FOREIGN KEY (ID) REFERENCES ITEM(ID)
);

CREATE TABLE INSTRUMENTCASE(
ID int,	
Type varchar(4)
	CHECK(Type IN('hard', 'soft')),
TypeOfInstrument varchar(20)
	CHECK(TypeOfInstrument IN('electro guitar', 'bass guitar', 'acoustic guitar', 'violin', 'flute')),

CONSTRAINT InstrumentCase_PK PRIMARY KEY (ID),
CONSTRAINT InstrumentCase_FK FOREIGN KEY (ID) REFERENCES ACCESSORIES(ID)
);

CREATE TABLE METRONOME(
ID int,	
Type varchar(10)
	CHECK(Type IN('mechanic', 'electronic')),

CONSTRAINT Metronome_PK PRIMARY KEY (ID),
CONSTRAINT Metronome_FK FOREIGN KEY (ID) REFERENCES ACCESSORIES(ID)
);

CREATE TABLE TUNER(
ID int,	
Type varchar(10)
	CHECK(Type IN('chromatic', 'digital')),

CONSTRAINT Tuner_PK PRIMARY KEY (ID),
CONSTRAINT Tuner_FK FOREIGN KEY (ID) REFERENCES ACCESSORIES(ID)
);

CREATE TABLE STAND(
ID int,
Height int,
Type varchar(20)
	CHECK(Type IN('microphone', 'guitar', 'note sheet', 'speaker')),

CONSTRAINT Stand_PK PRIMARY KEY (ID),
CONSTRAINT Stand_FK FOREIGN KEY (ID) REFERENCES ACCESSORIES(ID)
);

CREATE TABLE CABLE(
ID int,
Length int,
Type varchar(20)
	CHECK(Type IN('aluminium', 'gold')),

CONSTRAINT Cable_PK PRIMARY KEY (ID),
CONSTRAINT Cable_FK FOREIGN KEY (ID) REFERENCES ACCESSORIES(ID)
);

CREATE TABLE STRING(
ID int,
Type varchar(20)
	CHECK(Type IN('classic', 'acoustic', 'bass', 'ukulele', 'electro')),

CONSTRAINT String_PK PRIMARY KEY (ID),
CONSTRAINT String_FK FOREIGN KEY (ID) REFERENCES ACCESSORIES(ID)
);

CREATE TABLE MUSICCD(
ID int,
AlbumName varchar(20),
AuthorName varchar(20),
ReleaseDate Date,
NumberOfSongs int,

CONSTRAINT MusicCd_PK PRIMARY KEY (ID),
CONSTRAINT MusicCd_FK FOREIGN KEY (ID) REFERENCES ITEM(ID)
);

CREATE TABLE SUPLIER(
SuplierID int,
SupName varchar(20),
AddressID int,

CONSTRAINT Suplier_PK PRIMARY KEY (SuplierID),
CONSTRAINT Suplier_FK1 FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID),
);

CREATE TABLE SUPLIES(
SuplierID int,
ItemID int,
BasePrice int,
ShipmentDate Date,

CONSTRAINT Suplies_PK PRIMARY KEY (SuplierID,ItemID),
CONSTRAINT Suplies_FK1 FOREIGN KEY (SuplierID) REFERENCES SUPLIER(SuplierID),
CONSTRAINT Suplies_FK2 FOREIGN KEY (ItemID) REFERENCES ITEM(ID)
);


-- These join is for viewing items ordered by customers
SELECT CUSTOMER.CustomerID,CUSTOMER.Name,CUSTOMER.Surname,ORDER_T.OrderID,ORDER_T.Date,ITEM.ID,ITEM.Price,ITEM.Brand,ITEM.ItemName
	FROM CUSTOMER,ORDER_T,ITEM
	WHERE CUSTOMER.CustomerID = ORDER_T.CustomerID
	AND ORDER_T.OrderID = ITEM.OrderID
	GROUP BY CUSTOMER.CustomerID,ORDER_T.OrderID,ITEM.ID

	-- These join is for viewing items ordered by customers
SELECT ONLINECUSTOMER.CustomerID,ONLINECUSTOMER.Name,ONLINECUSTOMER.Surname,ORDER_T.OrderID,ORDER_T.Date,ITEM.ID,ITEM.Price,ITEM.Brand,ITEM.ItemName
	FROM ONLINECUSTOMER,ORDER_T,ITEM
	WHERE ONLINECUSTOMER.CustomerID = ORDER_T.CustomerID
	AND ORDER_T.OrderID = ITEM.OrderID
	GROUP BY ONLINECUSTOMER.CustomerID,ORDER_T.OrderID,ITEM.ID;

	-- These join is for viewing items that is ordered from supliers
SELECT SUPLIER.SuplierID,SUPLIER.SupName,SUPLIES.ShipmentDate,SUPLIES.BasePrice,ITEM.ID
	FROM SUPLIER,SUPLIES,ITEM
	WHERE SUPLIER.SuplierID = SUPLIES.SuplierID
	And SUPLIES.ItemID = ITEM.ID
	GROUP BY SUPLIER.SuplierID,ITEM.ID;


GO
CREATE TRIGGER calculatePrice
ON ITEM
AFTER INSERT
AS
BEGIN
	DECLARE @basePrice int = (SELECT SUPLIES.BasePrice FROM SUPLIES,ITEM WHERE SUPLIES.ItemID=ITEM.ID);
	UPDATE ITEM set ITEM.Price=@basePrice*1.1;
END
GO

CREATE TRIGGER defaultOpenHours
ON Store
AFTER INSERT
AS
BEGIN
	DECLARE @StoreID int = (select StoreID from inserted);
	INSERT INTO OPENHOURS values(@StoreID,9,18);
END

INSERT INTO ADDRESS VALUES (1,'TURKEY','EDIRNE','STREET','MENEKSE',3,22000);
INSERT INTO ADDRESS VALUES (2,'TURKEY','EDIRNE','STREET','GUL',4,22000);
INSERT INTO ADDRESS VALUES (3,'TURKEY','BURSA','STREET','MELISA',17,16000);
INSERT INTO ADDRESS VALUES (4,'TURKEY','SIVAS','STREET','KENT',384,58000);
INSERT INTO ADDRESS VALUES (5,'TURKEY','IZMIR','STREET','TERAS',27,35000);
INSERT INTO ADDRESS VALUES (6,'TURKEY','ISTANBUL','STREET','GUNES',5,3400);
INSERT INTO ADDRESS VALUES (7,'TURKEY','ISTANBUL','STREET','YASEMIN',51,3400);
INSERT INTO ADDRESS VALUES (8,'TURKEY','ANKARA','STREET','PAPATYA',68,6000);
INSERT INTO ADDRESS VALUES (9,'TURKEY','ANTALYA','STREET','NILUFER',6,7000);
INSERT INTO ADDRESS VALUES (10,'TURKEY','BATMAN','STREET','ERTAN',1,72000);
INSERT INTO ADDRESS VALUES (11,'TURKEY','ANKARA','STREET','KUSE IS HANI',14,6000);
INSERT INTO ADDRESS VALUES (12,'TURKEY','ISTANBUL','STREET','OZCAN IS HANI',62,34000);
INSERT INTO ADDRESS VALUES (13,'TURKEY','EDIRNE','STREET','DURMAZ IS HANI',95,22000);


INSERT INTO CUSTOMER VALUES ('Furkan','KUSE','furkankuse@hotmail.com','05340000001');
INSERT INTO CUSTOMER VALUES ('Cansel','OZCAN','canselozcan@hotmail.com','05340000002');
INSERT INTO CUSTOMER VALUES ('Metehan','ERTAN','metehanertan@hotmail.com','05340000003');
INSERT INTO CUSTOMER VALUES ('Melisa','DONMEZ','melisadonmez@hotmail.com','05340000004');
INSERT INTO CUSTOMER VALUES ('Furkan Kemal','DONME','izmirlum@hotmail.com','05340000005');

INSERT INTO ONLINECUSTOMER VALUES ('Emre','YIGIT','emreygt@gmail.com','0534000007',1,'emre','emreyigit');
INSERT INTO ONLINECUSTOMER VALUES ('Ertugrul','SAGDIC','ert@gmail.com','0534000008',2,'ert','ertsag');
INSERT INTO ONLINECUSTOMER VALUES ('Faruk','COLAK','farkclk@gmail.com','0534000009',3,'faruk','farukcolak');
INSERT INTO ONLINECUSTOMER VALUES ('Murat','SENOL','moruque@gmail.com','0534000010',4,'murat','fabulouse');
INSERT INTO ONLINECUSTOMER VALUES ('Berk','KOYLU','koylubrk@gmail.com','0534000011',5,'berk','datadankalan');

INSERT INTO STORE VALUES (1,300,300,6);
INSERT INTO STORE VALUES (2,400,400,7);
INSERT INTO STORE VALUES (3,430,430,8);
INSERT INTO STORE VALUES (4,380,380,9);
INSERT INTO STORE VALUES (5,200,200,10);

INSERT INTO SUPLIER VALUES (1,'Cort',11);
INSERT INTO SUPLIER VALUES (2,'Ephiphone',12);
INSERT INTO SUPLIER VALUES (3,'Kawai',13);

INSERT INTO EMPLOYEE VALUES (1,'KAAN','UCAR','1999-11-11',3200,0,1);
INSERT INTO EMPLOYEE VALUES (2,'GOKHAN','UCAR','1999-1-1',3000,0,3);
INSERT INTO EMPLOYEE VALUES (3,'GULCE','SIRVANCI','1998-2-2',2800,0,2);
INSERT INTO EMPLOYEE VALUES (4,'FURKAN','ARAS','1998-3-3',2000,0,5);
INSERT INTO EMPLOYEE VALUES (5,'EVRIM','SAHIN','1998-4-4',1000,0,4);

INSERT INTO OPENHOURS VALUES (1,9,18);
INSERT INTO OPENHOURS VALUES (2,9,20);
INSERT INTO OPENHOURS VALUES (3,11,21);
INSERT INTO OPENHOURS VALUES (4,13,24);
INSERT INTO OPENHOURS VALUES (5,9,20);

INSERT INTO ORDER_T VALUES (1000000,'2018-8-8',1870,1001,1);
INSERT INTO ORDER_T VALUES (1000001,'2018-9-9',1320,1003,3);
INSERT INTO ORDER_T VALUES (1000002,'2018-10-10',0,1001,1);

INSERT INTO ITEM VALUES(1, 1100, '2017-5-7', 'unused','Cort',12,1000000,'WARBEAST');
INSERT INTO ITEM VALUES(2, 220, '2017-5-7', 'unused','Kawai',11,null,'A5PLUS');
INSERT INTO ITEM VALUES(3, 770, '2016-10-12', 'unused','Cort',11,1000000,'SCFF');
INSERT INTO ITEM VALUES(4, 660, '2016-12-8', 'unused','Ephipone',11,null,'CUSTOM');
INSERT INTO ITEM VALUES(5, 990, '2009-3-3', 'unused','Cort',12,null,'STANDART');
INSERT INTO ITEM VALUES(6, 770, '2016-4-9', 'unused','Kawai',13,null,'TOBY');
INSERT INTO ITEM VALUES(7, 880, '2019-10-10', 'unused','Kawai',13,1000001,'AU01L');
INSERT INTO ITEM VALUES(8, 550, '2019-9-11', 'unused','Ephipone',13,null,'DJ25');
INSERT INTO ITEM VALUES(9, 660, '2017-6-11', 'unused','Ephipone',12,null,'CLP-645PE');
INSERT INTO ITEM VALUES(10, 440, '2015-4-3', 'unused','Kawai',12,1000001,'P115');
INSERT INTO ITEM VALUES(11, 110, '2014-5-1', 'unused','Cort',11,null,'MODEL1');
INSERT INTO ITEM VALUES(12, 550, '2013-2-9', 'unused','Ephipone',11,null,'S100BK');
INSERT INTO ITEM VALUES(13, 770, '2019-02-28', 'unused','Cort',11,null,'SK460');
INSERT INTO ITEM VALUES(14, 110, '1999-02-06', 'unused','Cort',11,null,'DS-1X');
INSERT INTO ITEM VALUES(15, 330, '2013-12-9', 'unused','Cort',11,null,'TS808DX');
INSERT INTO ITEM VALUES(16, 660, '2016-2-10', 'unused','Kawai',11,null,'FV-30H');
INSERT INTO ITEM VALUES(17, 880, '2013-6-20', 'unused','Ephipone',11,null,'CR32PK');
INSERT INTO ITEM VALUES(18, 220, '2015-2-15', 'unused','Cort',11,null,'FL4116S');
INSERT INTO ITEM VALUES(19, 330, '2013-2-11', 'unused','Kawai',11,null,'PLCLP25');
INSERT INTO ITEM VALUES(20, 660, '2013-1-12', 'unused','Cort',11,null,'HT15');
INSERT INTO ITEM VALUES(21, 990, '2015-12-13', 'unused','Ephipone',11,null,'BGS-21A');
INSERT INTO ITEM VALUES(22, 110, '2005-5-16', 'unused','Cort',11,null,'BULL');
INSERT INTO ITEM VALUES(23, 330, '2004-5-16', 'unused','Cort',11,null,'A60');
INSERT INTO ITEM VALUES(24, 330, '2013-2-18', 'unused','Kawai',11,null,'P20N');
INSERT INTO ITEM VALUES(25, 660, '2002-6-23', 'unused','Cort',11,null,'DR30');
INSERT INTO ITEM VALUES(26, 440, '2013-4-17', 'unused','Ephipone',11,null,'DH-20');


INSERT INTO INSTRUMENT VALUES(1, 'bowed stringed instrument');
INSERT INTO INSTRUMENT VALUES(2, 'bowed stringed instrument');
INSERT INTO INSTRUMENT VALUES(3, 'bowed stringed instrument');
INSERT INTO INSTRUMENT VALUES(4, 'bowed stringed instrument');
INSERT INTO INSTRUMENT VALUES(5, 'wind instrument');
INSERT INTO INSTRUMENT VALUES(6, 'wind instrument');
INSERT INTO INSTRUMENT VALUES(7, 'clavier');
INSERT INTO INSTRUMENT VALUES(8, 'clavier');

INSERT INTO GUITAR VALUES (1,'classic',6,'wood');
INSERT INTO GUITAR VALUES (2,'ukulele',4,'metal');
INSERT INTO VIOLIN VALUES (3,'classic','wood');
INSERT INTO VIOLIN VALUES (4,'electro','glass');
INSERT INTO FLUTE VALUES (5,'pan','metal');
INSERT INTO FLUTE VALUES (6,'side-blow','plastic');
INSERT INTO PIANO VALUES (7,'electronic',3,8,'wood');
INSERT INTO PIANO VALUES (8,'grand piano',4,9,'wood');
INSERT INTO SOUNDSYSTEM VALUES (9,15,'amplifier','electro');
INSERT INTO SOUNDSYSTEM VALUES (10,35,'speaker','power');
INSERT INTO PEDAL VALUES (11,'distortion');
INSERT INTO PEDAL VALUES (12,'delay');


INSERT INTO MUSICCD VALUES (13,'FOREVER','METE','2019-02-28',2);
INSERT INTO MUSICCD VALUES (14,'ME','MINE','1999-02-06',20);
INSERT INTO ACCESSORIES VALUES (15,'case');
INSERT INTO ACCESSORIES VALUES (16,'case');
INSERT INTO ACCESSORIES VALUES (17,'metronome');
INSERT INTO ACCESSORIES VALUES (18,'metronome');
INSERT INTO ACCESSORIES VALUES (19,'tuner');
INSERT INTO ACCESSORIES VALUES (20,'tuner');
INSERT INTO ACCESSORIES VALUES (21,'stand');
INSERT INTO ACCESSORIES VALUES (22,'stand');
INSERT INTO ACCESSORIES VALUES (23,'cable');
INSERT INTO ACCESSORIES VALUES (24,'cable');
INSERT INTO ACCESSORIES VALUES (25,'string');
INSERT INTO ACCESSORIES VALUES (26,'string');
INSERT INTO INSTRUMENTCASE VALUES (15,'hard','bass guitar');
INSERT INTO INSTRUMENTCASE VALUES (16,'soft','flute');
INSERT INTO METRONOME VALUES (17,'mechanic');
INSERT INTO METRONOME VALUES (18,'electronic');
INSERT INTO TUNER VALUES (19,'chromatic');
INSERT INTO TUNER VALUES (20,'digital');
INSERT INTO STAND VALUES (21,1,'guitar');
INSERT INTO STAND VALUES (22,2,'microphone');
INSERT INTO CABLE VALUES (23,6,'aluminium');
INSERT INTO CABLE VALUES (24,3,'gold');
INSERT INTO STRING VALUES (25,'bass');
INSERT INTO STRING VALUES (26,'ukulele');


INSERT INTO SUPLIES VALUES (1,1,1000,'2017-5-7');
INSERT INTO SUPLIES VALUES (3,2,200, '2017-5-7');

SELECT STORE.StoreID,STORE.AddressID,ADDRESS.AddressID,ADDRESS.Country,ADDRESS.City,ADDRESS.StreetName,ADDRESS.BuildingName,ADDRESS.FlatNumber,ADDRESS.PostCode
	FROM STORE,ADDRESS
	WHERE STORE.AddressID = ADDRESS.AddressID;

UPDATE ONLINECUSTOMER SET Password = 'kuse' WHERE ONLINECUSTOMER.CustomerID = 1001; 

select ORDER_T.OrderID, ITEM.ID, ITEM.ItemName, ITEM.Brand, ITEM.Price, ITEM.Condition 
from ITEM, ORDER_T
where ORDER_T.CustomerID = 1001 and ORDER_T.OrderID = ITEM.OrderID;