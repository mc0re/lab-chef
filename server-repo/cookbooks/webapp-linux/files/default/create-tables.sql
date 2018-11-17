CREATE TABLE Customers
(
    Id CHAR(32) NOT NULL,
    PRIMARY KEY (Id),
    FirstName NVARCHAR(MAX),
    LastName NVARCHAR(MAX),
    Email NVARCHAR(MAX)
);

INSERT INTO Customers (Id, FirstName, Las, Email) VALUES
    (uuid(), 'Tony', 'Stark', 'iron.man@avengers.com'),
    (uuid(), 'Natasha', 'Romanoff', 'black.widow@avengers.com'),
    (uuid(), 'Steve', 'Rogers', 'captain.america@avengers.com');
