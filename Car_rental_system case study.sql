CREATE DATABASE CAR_RENTAL_SYSTEM;

Use CAR_RENTAL_SYSTEM;

Create table Vehicle(
vehicleID int Primary Key, 
make varchar(50), 
model int,
year int, 
dailyRate int,
status varchar(50),
constraint ch_status check (status in ('available',' notAvailable')),
passengerCapacity  int,
engineCapacity varchar(20) );

Create table Customer (
customerID int Primary Key, 
firstName varchar(40),
lastName varchar(40),
email varchar(40),
phoneNumber int,
);
Alter table customer
alter column phoneNumber Bigint;

-- Creating Lease Table
CREATE TABLE Lease (
    leaseID INT PRIMARY KEY, 
    vehicleID INT,
    customerID INT,
    startDate DATE, 
    endDate DATE,
    type VARCHAR(30),
    CONSTRAINT ch_type CHECK (type IN ('DailyLease', 'MonthlyLease')), 
    CONSTRAINT FK_vehicleId FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID),
    CONSTRAINT FK_customerId FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

Create table Payment ( 
paymentID int Primary Key,
leaseID int, 
paymentDate date, 
amount int,
constraint fk_leaseid FOREIGN KEY(leaseId) references lease (leaseID),
);
alter table vehicle
alter column model varchar(30);

Insert into Vehicle(vehicleID, make, model,year, dailyRate,status,passengerCapacity,engineCapacity ) values
(1,'Maruti','celerio',2017,700,' notAvailable',5,'1000 cc'),
(2,'Tata','Tiago',2017,900,' notAvailable',5,'990 cc'),
(3,'Mahindra','3XO',2024,1200,'available',5,'1100 cc'),
(4,'Hyndai','Grand i10',2023,800,'available',5,'1300 cc'),
(5,'Honda','Amaze',2015,500,' notAvailable',5,'1500 cc'),
(6,'JLR','Defender',2021,7000,'available',6,'4500 cc'),
(7,'AUDI','A3',2023,17000,'available',2,'6000 cc'),
(8,'BENZ','Maybach',2021,25000,'available',5,'5000 cc'),
(9,'KIA','Carnez',2024,2000,' notAvailable',8,'3000 cc'),
(10,'MG','Hector',2019,1200,'available',8,'2000 cc');


insert into Customer (customerID , firstName,lastName ,email ,phoneNumber) values
(11,'Vikash', 'Saravanan','vikash@gmail.com',9940250431),
(12,'Vignesh', 'Ramesh','vignesh@gmail.com',9940250432),
(13,'Venkat', 'Malla','venkat@gmail.com',9940250433),
(14,'Sunil', 'Bhaskar','sunil@gmail.com',9940250434),
(15,'Raj', 'Mohan','Raj@gmail.com',9940250435),
(16,'Sri', 'Vishnu','Sri@gmail.com',9940250436),
(17,'Harshith', 'Jaya','harshith@gmail.com',9940250437),
(18,'Ganesh', 'Vetri','ganesh@gmail.com',9940250438),
(19,'Ashwin', 'Albert','ashwin@gmail.com',9940250439),
(20,'Hemraj', 'Durai','Hemraj@gmail.com',9940250430);


Insert into lease(leaseId,VehicleID,customerId,startDate,endDate,type) values
(21,1,11,'2025-02-13','2025-03-15','MonthlyLease'),
(22,2,12,'2025-02-14','2025-02-17','DailyLease'),
(23,3,13,'2025-01-13','2025-02-11','MonthlyLease'),
(24,4,14,'2025-02-03','2025-02-05','DailyLease'),
(25,5,15,'2025-01-13','2025-03-14','MonthlyLease'),
(26,6,16,'2025-03-01','2025-03-13','DailyLease'),
(27,7,17,'2025-01-01','2025-02-01','MonthlyLease'),
(28,8,18,'2025-02-05','2025-02-15','DailyLease'),
(29,9,19,'2025-02-17','2025-03-17','MonthlyLease'),
(30,10,20,'2025-02-16','2025-03-18','DailyLease');


INSERT INTO Payment (paymentID, leaseID, paymentDate, amount) VALUES
(101, 21, '2025-02-13', 21000),
(102, 22, '2025-02-14', 2700),
(103, 23, '2025-01-13', 36000),
(104, 24, '2025-02-03', 1600),
(105, 25, '2025-01-13', 31000),
(106, 26, '2025-03-01', 9100),
(107, 27, '2025-01-01', 17000),
(108, 28, '2025-02-05', 25000),
(109, 29, '2025-02-17', 60000),
(110, 30, '2025-02-16', 14400);
