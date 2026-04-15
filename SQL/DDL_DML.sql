--DDL

CREATE DATABASE CAFÉ ;
USE CAFÉ ;

CREATE TABLE EMPLOYEES (
EMP_ID INT PRIMARY KEY ,
Fname VARCHAR(50) ,
Lname VARCHAR(50) ,
Salary INT ,
Gender VARCHAR(1) ,
Jop_Title VARCHAR(50) ,
Superviser_ID INT ,
Branch_ID INT ,
FOREIGN KEY (Superviser_ID) REFERENCES EMPLOYEES (EMP_ID) ,
FOREIGN KEY (Branch_ID) REFERENCES BRANCHES (Branch_ID)
);

CREATE TABLE BRANCHES (
Branch_ID INT PRIMARY KEY ,
Branch_Name VARCHAR(50) ,
Location VARCHAR(50) ,
Start_Date DATE DEFAULT GETDATE() ,
);

--
ALTER TABLE BRANCHES ADD Manager_ID INT ;
ALTER TABLE BRANCHES ADD FOREIGN KEY (Manager_ID) REFERENCES EMPLOYEES (EMP_ID);
--

CREATE TABLE ORDERS (
Order_ID INT PRIMARY KEY ,
Order_Date DATE DEFAULT GETDATE() ,
Total_Amount INT ,
EMP_ID INT ,
Customer_ID INT ,
FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES (EMP_ID) ,
FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS (Customer_ID)
);

CREATE TABLE CUSTOMERS (
Customer_ID INT PRIMARY KEY ,
Name VARCHAR(50) ,
Phone VARCHAR(11) ,
Email VARCHAR(50)
);

CREATE TABLE ITEMS (
Item_ID INT PRIMARY KEY ,
Item_Name VARCHAR(50) ,
Category VARCHAR(50) ,
Price INT
);

CREATE TABLE ORDER_ITEMS (
Item_ID INT ,
Order_ID INT ,
Quantity INT ,
PRIMARY KEY (Item_ID , Order_ID) ,
FOREIGN KEY (Item_ID) REFERENCES ITEMS (Item_ID) ,
FOREIGN KEY (Order_ID) REFERENCES ORDERS (Order_ID)
);

CREATE TABLE ADDRESSES (
Address_ID INT PRIMARY KEY ,
City VARCHAR(50) ,
Street VARCHAR(50) ,
Customer_ID INT ,
FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS (Customer_ID)
);


--DML

INSERT INTO BRANCHES
VALUES
(1,'Nasr City','Cairo',GETDATE(),NULL),
(2,'Maadi','Cairo',GETDATE(),NULL),
(3,'Heliopolis','Cairo',GETDATE(),NULL),
(4,'Alex Center','Alex',GETDATE(),NULL),
(5,'Smouha','Alex',GETDATE(),NULL);

INSERT INTO EMPLOYEES VALUES
(1,'Ahmed','Ali',5000,'M','Manager',NULL,1),
(2,'Sara','Hany',4000,'F','Cashier',1,1),
(3,'Omar','Khaled',3500,'M','Waiter',1,1),
(4,'Mona','Adel',4800,'F','Manager',NULL,2),
(5,'Youssef','Tamer',3000,'M','Waiter',4,2),
(6,'Nour','Samy',4200,'F','Cashier',4,2),
(7,'Hassan','Mahmoud',4700,'M','Manager',NULL,3),
(8,'Laila','Ibrahim',3500,'F','Waiter',7,3),
(9,'Mostafa','Eid',3600,'M','Cashier',7,3),
(10,'Aya','Said',4900,'F','Manager',NULL,4),
(11,'Karim','Nabil',4100,'M','Waiter',10,4),
(12,'Salma','Reda',3700,'F','Cashier',10,4),
(13,'Ali','Hossam',5100,'M','Manager',NULL,5),
(14,'Dina','Wael',3500,'F','Waiter',13,5),
(15,'Tarek','Fady',3900,'M','Cashier',13,5);

--
UPDATE BRANCHES SET Manager_ID = 1 WHERE Branch_ID = 1;
UPDATE BRANCHES SET Manager_ID = 4 WHERE Branch_ID = 2;
UPDATE BRANCHES SET Manager_ID = 7 WHERE Branch_ID = 3;
UPDATE BRANCHES SET Manager_ID = 10 WHERE Branch_ID = 4;
UPDATE BRANCHES SET Manager_ID = 13 WHERE Branch_ID = 5;
--

INSERT INTO CUSTOMERS VALUES
(1,'Mohamed Nasser','01011111111','c1@mail.com'),
(2,'Ali Hassan','01022222222','c2@mail.com'),
(3,'Sara Ahmed','01033333333','c3@mail.com'),
(4,'Omar Khaled','01044444444','c4@mail.com'),
(5,'Mona Adel','01055555555','c5@mail.com'),
(6,'Hany Samy','01066666666','c6@mail.com'),
(7,'Nour Tarek','01077777777','c7@mail.com'),
(8,'Aya Mostafa','01088888888','c8@mail.com'),
(9,'Khaled Said','01099999999','c9@mail.com'),
(10,'Huda Ali','01010101010','c10@mail.com');

INSERT INTO ITEMS VALUES
(1,'Coffee','Drink',50),
(2,'Tea','Drink',30),
(3,'Latte','Drink',60),
(4,'Cappuccino','Drink',70),
(5,'Espresso','Drink',40),
(6,'Cake','Dessert',80),
(7,'Cheesecake','Dessert',90),
(8,'Brownie','Dessert',75),
(9,'Croissant','Food',55),
(10,'Sandwich','Food',100);

INSERT INTO ORDERS VALUES
(1,GETDATE(),150,1,1),
(2,GETDATE(),200,2,2),
(3,GETDATE(),120,3,3),
(4,GETDATE(),180,4,4),
(5,GETDATE(),220,5,5),
(6,GETDATE(),90,6,6),
(7,GETDATE(),140,7,7),
(8,GETDATE(),160,8,8),
(9,GETDATE(),210,9,9),
(10,GETDATE(),130,10,10);

INSERT INTO ORDER_ITEMS VALUES
(1,1,2),(2,1,1),
(3,2,2),(4,2,1),
(5,3,3),(6,4,1),
(7,5,2),(8,6,1),
(9,7,2),(10,8,1);

INSERT INTO ADDRESSES VALUES
(1,'Cairo','Street 1',1),
(2,'Cairo','Street 2',2),
(3,'Alex','Street 3',3),
(4,'Giza','Street 4',4),
(5,'Cairo','Street 5',5),
(6,'Alex','Street 6',6),
(7,'Giza','Street 7',7),
(8,'Cairo','Street 8',8),
(9,'Alex','Street 9',9),
(10,'Giza','Street 10',10);

