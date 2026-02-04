USE AdventureWorks2025;
GO

SELECT * FROM Person.Person
GO

INSERT INTO Person.BusinessEntity DEFAULT VALUES;
GO

SELECT SCOPE_IDENTITY() AS BusinessEntityID;

INSERT INTO Person.Person
(
    BusinessEntityID,
    PersonType,
    NameStyle,
    FirstName,
    LastName
)
VALUES
(
    20778,
    'EM',
    0,
    'Harsh',
    'Yadav'
);
GO

INSERT INTO Person.EmailAddress
(
    BusinessEntityID,
    EmailAddress
)
VALUES
(
    20778,
    'harsh.27@gmail.com'
);
GO

INSERT INTO Person.PersonPhone
(
    BusinessEntityID,
    PhoneNumber,
    PhoneNumberTypeID
)
VALUES
(
    20778,
    '8318386500',
    1
);
GO

SELECT * FROM Person.Person WHERE BusinessEntityID = 20778;

---- union

SELECT BusinessEntityID,LastName FROM(
SELECT top 20 BusinessEntityID, LastName FROM Person.Person
UNION
SELECT top 20 BusinessEntityID, LastName FROM Person.Person order by BusinessEntityID DESC
) AS T
ORDER BY BusinessEntityID;


SELECT top 20 BusinessEntityID, LastName FROM Person.Person
UNION ALL
SELECT top 20 BusinessEntityID, LastName FROM Person.Person order by BusinessEntityID DESC
