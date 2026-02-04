-------



CREATE DATABASE Formula1DB;
GO
USE Formula1DB;
GO

-- CREATE TABLE Drivers
-- (
-- DriverID INT PRIMARY KEY,
-- DriverName VARCHAR(50),
-- Team VARCHAR(50),
-- Nationality VARCHAR(30)
-- );
-- GO

-- CREATE TABLE Races
-- (
-- RaceID INT PRIMARY KEY,
-- RaceName VARCHAR(50),
-- WinnerDriverID INT,
-- RaceDate DATE,
-- FOREIGN KEY (WinnerDriverID) REFERENCES Drivers(DriverID)
-- );
-- GO

INSERT INTO Drivers VALUES
(1, 'Max Verstappen', 'Red Bull Racing', 'Netherlands'),
(2, 'Lewis Hamilton', 'Mercedes', 'United Kingdom'),
(3, 'Fernando Alonso', 'Aston Martin', 'Spain'),
(4, 'Charles Leclerc', 'Ferrari', 'Monaco');
GO

INSERT INTO Races VALUES
(101, 'Bahrain Grand Prix', 1, '2024-03-02'),
(102, 'Saudi Arabian Grand Prix', 1, '2024-03-09'),
(103, 'Australian Grand Prix', 2, '2024-03-24'),
(104, 'Monaco Grand Prix', 4, '2024-05-26');


--INNER JOIN!!!

SELECT R.RaceName,
       D.DriverName,
       D.Team
FROM Races R
INNER JOIN Drivers D
ON R.WinnerDriverID = D.DriverID;
GO


--Left Join!!

SELECT D.DriverName,
       R.RaceName
FROM Drivers D
LEFT JOIN Races R
ON D.DriverID = R.WinnerDriverID;
GO

-- Right Join

SELECT R.RaceName,
       D.DriverName
FROM Drivers D
RIGHT JOIN Races R
ON D.DriverID = R.WinnerDriverID;
GO

SELECT D.DriverName,
       R.RaceName
FROM Drivers D
FULL OUTER JOIN Races R
ON D.DriverID=R.WinnerDriverID;
GO

