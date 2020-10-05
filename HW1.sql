/* Question 2.1 Create a table Edges(Source, Destination) where both Source and Destination are integers.*/
CREATE TABLE Edges (Source INTEGER, Destination INTEGER);

/* Question 2.2 Insert the tuples (10,5), (6,25), (1,3), and (4,4) */
INSERT INTO Edges VALUES(10,5);
INSERT INTO Edges VALUES(6,25);
INSERT INTO Edges VALUES(1,3);
INSERT INTO Edges VALUES(4,4);

/*Question 2.3 Write a SQL statement that returns all tuples*/
SELECT * FROM Edges;

/*2.4 Write a SQL that returns only column Source for all tuples. */
SELECT Source  FROM Edges;

/*Question 2.5 Write a SQL statement that returns all tuples where Source > Destination */
SELECT * FROM Edges WHERE Source > Destination;

/*Question 2.6 Now insert the tuple ('-1','2000'). Do you get an error? Why? This is a tricky question, you might want to check the documentation.

No error, the given tuple is converted from text into integer because it is a rigidly-typed database */

/* Create a table called MyRestaurants with the following attributes (you can pick your own names for the attributes, just make sure it is clear which one is for which):

Name of the restaurant: a varchar field
Type of food they make: a varchar field
Distance (in minutes) from your house: an int
Date of your last visit: a varchar field, interpreted as date
Whether you like it or not: an int, interpreted as a Boolean */
CREATE TABLE MyRestaurants (Name VARCHAR(256), Food VARCHAR(256), Distance INT, Date_visted VARCHAR(10), I_Like INT);

/* Question 4 Insert at least five tuples using the SQL INSERT command five (or more) times. You should insert at least one restaurant you liked, 
at least one restaurant you did not like,
 and at least one restaurant where you leave the “I like” field NULL. */
INSERT INTO MyRestaurants VALUES
   ('Burger Place', 'American', 10, '2020-09-23', 1),
   ('Arbys', 'Fast-Food', 30, '2020-10-02', 1),
   ('China First', 'Chinese', 15, '2020-05-02', 0),
   ('Sultans', 'Mediterranean', 10, '2020-09-28', Null),
   ('Korean Tofu House', 'Korean', 15, '2020-04-03', 1);