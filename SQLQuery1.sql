create database [It_Company]
go
use [It_Company]

create table Department(
	Department_Id int primary key not null,
	Department_Name varchar(20) not null,
	Adress varchar(20) not null
)

create table Client(
	Client_Id int primary key not null,
	Age smallint,
	First_Name varchar(20),
	Last_Name varchar(20)
)

create table Programmer(
	Programmer_Id int primary key not null,
	Salary money not null,
	Age smallint,
	First_Name varchar(20),
	Last_Name varchar(20),
	Department_Id int foreign key references Department(Department_Id)
)

create table Project(
	Project_Id int primary key not null,
	Specification varchar(100) not null,
	Customer_Id int foreign key references Client(Client_Id)
)
create table ProgrammerProject(
	Project_Id int foreign key references Project(Project_Id),
	Programmer_Id int foreign key references Programmer(Programmer_Id),
	Date_Start date default getdate(),
	Date_End date,
	constraint prog_proj_pk primary key (Project_Id, Programmer_Id)
)


INSERT INTO Department VALUES(1, 'First', 'New York')
INSERT INTO Department VALUES(2, 'Second', 'Tokyo')
INSERT INTO Department VALUES(3, 'Third', 'Kyiv')
INSERT INTO Department VALUES(4, 'Fourth', 'Kharkiv')
INSERT INTO Department VALUES(5, 'Fifth', 'Paris')

INSERT INTO Client VALUES(1, 30, 'John', 'Jones')
INSERT INTO Client VALUES(2, 42, 'Jack', 'Jackson')
INSERT INTO Client VALUES(3, 20, 'Paul', 'Scholes')
INSERT INTO Client VALUES(4, 60, 'Andrew', 'Robertson')
INSERT INTO Client VALUES(5, 35, 'Alex', 'Pupkin')
INSERT INTO Client VALUES(6, 31, 'Phil', 'Foden')

INSERT INTO PROGRAMMER VALUES (1, 1000, 18, 'John', 'Jones', 1)
INSERT INTO PROGRAMMER VALUES (2, 2000, 23, 'Jack', 'Jackson', 1)
INSERT INTO PROGRAMMER VALUES (3, 1160, 19, 'Paul', 'Scholes', 2)
INSERT INTO PROGRAMMER VALUES (4, 3200, 29, 'Andrew', 'Robertson', 2)
INSERT INTO PROGRAMMER VALUES (5, 1300, 20, 'Alex', 'Pupkin', 2)
INSERT INTO PROGRAMMER VALUES (6, 1700, 21, 'Phil', 'Foden', 3)

INSERT INTO PROJECT VALUES (1, 'Snake game', 1)
INSERT INTO PROJECT VALUES (2, 'Web store', 1)
INSERT INTO PROJECT VALUES (3, 'Desktop app', 2)
INSERT INTO PROJECT VALUES (4, 'Gym app', 2)
INSERT INTO PROJECT VALUES (5, 'Web store', 2)
INSERT INTO PROJECT VALUES (6, 'Mobile app', 2)

declare @datefirst Date = '12-21-20'
declare @datefirst2 Date = '06-28-21'

use It_Company
INSERT INTO Programmer_Project (Project_Id, Programmer_Id, Date_Start, Date_End) VALUES (1,1,@datefirst, @datefirst2)
INSERT INTO Programmer_Project (Project_Id, Programmer_Id) VALUES (1,2)
INSERT INTO Programmer_Project (Project_Id, Programmer_Id, Date_Start) VALUES (2,3,'05-28-22')
INSERT INTO Programmer_Project (Project_Id, Programmer_Id) VALUES (4,3)
INSERT INTO Programmer_Project (Project_Id, Programmer_Id) VALUES (2,5)
