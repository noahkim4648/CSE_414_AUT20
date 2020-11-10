/* a. (10 points) Translate the diagram above by writing the SQL CREATE TABLE 
statements to represent this E/R diagram. 
Include all key constraints; you should specify both primary and foreign keys.
 Make sure that your statements are syntactically correct 
 (you might want to check them using SQLite, Azure SQL Server, or another 
 relational database). */

CREATE TABLE InsuranceCo(
name VARCHAR(256) PRIMARY KEY, 
phone INTEGER
);

CREATE TABLE Vehicle(
licensePlate VARCHAR(256) PRIMARY KEY,
year INTEGER,
maxLiability REAL,
insuranceCompany VARCHAR(256) REFERENCES InsuranceCo(name),
ownerSsn INT REFERENCES Person(ssn)
);

CREATE TABLE Person(
name VARCHAR(256),
ssn INT PRIMARY KEY
);

CREATE TABLE Driver(
driverID INT,
ssn INT REFERENCES Person(ssn)
);

CREATE TABLE Car(
licensePlate VARCHAR(256) REFERENCES Vehicle(licensePlate),
make VARCHAR(256)
);

CREATE TABLE Truck(
licensePlate VARCHAR(256) REFERENCES Vehicle(licensePlate),
capacity INT,
driverID INT REFERENCES ProfessionalDriver(driverID)
);

CREATE TABLE CarDriver(
licensePlate VARCHAR(256) REFERENCES Car(licensePlate),
driverID INT REFERENCES NonProfessionalDriver(driverID)
);

CREATE TABLE NonProfessionalDriver(
driverID INT REFERENCES Driver(driverID)
);

CREATE TABLE ProfessionalDriver(
driverID INT REFERENCES Driver(driverID),
medicalHistory VARCHAR(256)
);


/*
b. (5 points) Which relation in your relational schema represents the relationship 
"insures" in the E/R diagram? Why is that your representation?

The insures relationship is represented through the columns maxLiability and
insuranceCompany in the Vehicle relation/table because a vehicle can have
atmost one insurance company (the insure relationship is many to one) so I represented that in the vehicle relation. 
I referenced insuranceCo(name) in order to make that relationship.
For example, if a vehicle does not have insurance the attributes will be null.

c. (5 points) Compare the representation of the relationships "drives" and "operates" in your schema, 
and explain why they are different.

drives is a relationship between the car and the drivers. Since there can be multiple drivers for a single 
car I created a new table called carDriver to represent the relationship. as for operates, a truck can only
have atmost one operator so the relationship expressed in the truck relation itself by adding the operators
driverID.
Drives is a many to many relation so requires an additional table/relation where operates is many to one 
and can be inlined into the truck relation.

*/
