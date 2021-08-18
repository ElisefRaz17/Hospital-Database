DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;

CREATE table room(
number INT(20),
PRIMARY KEY(number),
capacity INT(50),
fee DECIMAL(9,2),
id INT(20),
FOREIGN KEY(id) references patient(id)
);
INSERT INTO room VALUES(25,4,50.4,400);
INSERT INTO room VALUES(50,8,100.5,411);
INSERT INTO room VALUES(10,2,35.00,043);
INSERT INTO room VALUES(30,4,45.00,464);
INSERT INTO room VALUES(40,4,50.4,092);

CREATE table physician(
ID INT(20),
PRIMARY KEY(id),
certification_number INT(50),
field_of_expertise varchar(50),
address varchar(50),
phone_number char(15)
);
INSERT INTO physician VALUES(1022,2097180,'peditrician','17728 Cherry Grove Dr.','704-901-3901');
INSERT INTO physician VALUES(2093,3801029,'urgent-care','108292 Blossom Tree Rd.','704-306-5003');
INSERT INTO physician VALUES(1437,1992835,'doctor','128935 Palm Ave.','704-685-9005');
INSERT INTO physician VALUES(1345,2378458,'peditrician','137745 Ridge Rd.','704-503-2060');
INSERT INTO physician VALUES(1134,2107821,'doctor','821929 Sharpe Rd.','704-605-8291');

CREATE table nurse(
id INT(20),
PRIMARY KEY(id),
name varchar(50),
certification_number INT(50),
address varchar(50),
phone_number char(15)
);
INSERT INTO nurse VALUES(2005,'Jarvis Jones',66334902,'843325 April Dr.','704-689-5833');
INSERT INTO nurse VALUES(3155,'John Harper',77320219,'62817 Glen Rd.','704-710-2833');
INSERT INTO nurse VALUES(2845,'Kelly Hope',63426190,'235 Rose Ct.','704-250-3410');
INSERT INTO nurse VALUES(1006,'John Gomez',56832901,'895 Tree Ln.','704-779-4521');
INSERT INTO nurse VALUES(9820,'Patrice Garner',09378237,'10002 Club Dr.','704-807-1389');
CREATE TABLE patient(
id INT(20),
PRIMARY KEY(id),
name varchar(50),
address varchar(50),
tdate date,
disease varchar(50),
description varchar(50),
status varchar(50)
);
INSERT INTO patient VALUES(400,'April Jewels','10002 Up St.','2017-03-10','cancer','Submitted in for first treatment','stable');
INSERT INTO patient VALUES(411,'Josslyn Hernandez','2443 Upton St.','2017-01-20','flu','Checked in for follow-up','clear');
INSERT INTO patient VALUES(043,'John Hunter','43320 New York Ct.','2018-08-05','flu','Checked in for follow up and picked up meds','clear');
INSERT INTO patient VALUES(464,'Auberey Jones','50002 Rose Garden Dr.','2020-01-10','stomach virus','Submitted for surgery','in progress');
INSERT INTO patient VALUES(092,'Connor Johnson','03246 Harper Ln.','2019-04-20','back surgery','Checked in for second back surgery','in progress');

CREATE table payment(
tdate date,
amount DECIMAL(9,2),
id INT(20),
FOREIGN KEY(id) references patient(id));
INSERT INTO payment VALUES('2020-03-10', 500.00,400);
INSERT INTO payment VALUES('2017-01-20', 50.00,411);
INSERT INTO payment VALUES('2018-08-05', 50.00,043);
INSERT INTO payment VALUES('2020-01-10', 123.96,464);
INSERT INTO payment VALUES('2019-04-20', 384.10,092);

Create table medication(
name varchar(50),
amount INT(50),
id INT(20),
FOREIGN KEY(id) references patient(id)
);
INSERT INTO medication VALUES('Tylenol',14.00,464);
INSERT INTO medication VALUES('Lisinopril', 30.00,092);
INSERT INTO medication VALUES('zanamivir', 25.00,411);
INSERT INTO medication VALUES('zanamivir', 25.00,043);
INSERT INTO medication VALUES('Neulasta', 20.00,400);

CREATE table record(
room_number INT(50),
instructions varchar(100),
patient_name varchar(50),
id INT(20),
FOREIGN KEY(id) references patient(id)
);
INSERT INTO record VALUES(25,'bring her meds to her twice a day','April Jewels',400);
INSERT INTO record VALUES(50,'make sure meds are received by patient before their departure','Josslyn Hernandez',411);
INSERT INTO record VALUES(10,'make sure meds are received by patient before their departure','John Hunter',043);
INSERT INTO record VALUES(30,'deliver meds to patient room after surgery','Auberey Jones',464);
INSERT INTO record VALUES(40,'deliver meds to patient room after surgery','Connor Johnson',092);