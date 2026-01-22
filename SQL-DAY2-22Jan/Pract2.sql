
use PracticeDatabase;
go
 -- =============================================
-- Author:		Harsh Yadav
-- Create date: 22nd Jan
-- Description:	!st Procedure to implementation
-- =============================================

CREATE OR ALTER PROCEDURE MyPractice
     @City VARCHAR(50)
 AS
 BEGIN
     SELECT * 
     FROM dbo.Customers
     WHERE City = @City;
 END;
 GO
 EXEC MyPractice 'Liverpool'
 GO

 -- =============================================
-- Author:		Harsh Yadav
-- Create date: 22nd Jan
-- Description:	Created a Procedure to GetCustomerByNameAndCity
-- =============================================
 CREATE OR ALTER PROCEDURE [dbo].[SP_GetCustomerByNameAndCity]
 	@Name varchar(100),
 	@City varchar(50)
AS
 BEGIN
 	SELECT * from Customers WHERE FullName = @Name and City = @City;
 END
 GO
 EXEC SP_GetCustomerByNameAndCity 'John Lennon', 'Liverpool';
 GO




 -- =============================================
-- Author:		Harsh Yadav
-- Create date: 22nd Jan
-- Description:	Created a Procedure to CReating the table department
-- =============================================
CREATE OR ALTER PROCEDURE dbo.SP_CreateDepartmentTable
AS
BEGIN
    DROP TABLE IF EXISTS dbo.Department;

    CREATE TABLE dbo.Department
    (
        Name VARCHAR(100),
        City VARCHAR(50)
    );

    PRINT 'Department table recreated successfully!';
END
GO



 -- =============================================
-- Author:		Harsh Yadav
-- Create date: 22nd Jan
-- Description:	Created a Procedure to Insert Into Department Via GUI!
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[SP_InsertIntoDepartmentViaGUI]
@Id VARCHAR(50), 
@Name VARCHAR(100)
as BEGIN
INSERT INTO dbo.Department
                  (Id, Name)
VALUES (@Id, @Name)
END 
GO
EXEC SP_InsertIntoDepartmentViaGUI '24','washing';
GO
SELECT * FROM Department




