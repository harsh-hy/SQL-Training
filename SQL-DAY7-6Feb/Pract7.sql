------Temp Table!! -------
--We create temp records
--it does not create any physical table
--it starts with #


-- =======================================================
-- Author:        Harsh Yadav
-- Create date:   7th Feb
-- Description:   Created a procedure to demonstrate 
--                the use of temporary tables in SQL Server
-- =======================================================
CREATE OR ALTER PROCEDURE SP_TEMP_TABLE_EXAMPLE_1
AS
BEGIN
SELECT top 5 * into #temp1 FROM  [Person].[Address]
SELECT * FROM #temp1
DROP table #temp1
-- TRUNCATE table #temp1
-- DELETE #temp1
-- SELECT * FROM [Person].[Person] this will not work because of xml data!
END
GO
EXEC SP_TEMP_TABLE_EXAMPLE_1

SELECT * FROM [Person].[Person]
SELECT uu.AddressLine1 from [Person].[Address]uu for json auto

