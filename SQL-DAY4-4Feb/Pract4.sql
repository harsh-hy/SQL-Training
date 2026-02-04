set statistics io on
set statistics time on

SELECT * into perf_issue FROM Person.Person;

insert into perf_issue
select * from Person.Person


SELECT * FROM perf_issue;
--drop table perf_issue;


--create view perf_issue_w
--as
--Select * from perf_issue

--select * from perf_issue_w;

SELECT
ROW_NUMBER() over (order by BusinessEntityID) as RowNum, *
FROM
perf_issue

select
	so.name,
	ps.*
	from
	sys.dm_db_partition_stats ps
inner join
	sysobjects so
on ps.object_id = so.id

-----

select
	so.name,
	ps.used_page_count
	from
	sys.dm_db_partition_stats ps
inner join
	sysobjects so
on ps.object_id = so.id
where so.type ='u'
order by ps.used_page_count desc

-----


DROP TABLE IF EXISTS dbo.SOH_Practice;
SELECT TOP (300000)
  SalesOrderID, CustomerID, OrderDate, SubTotal, TaxAmt, Freight, TotalDue
INTO dbo.SOH_Practice
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderID;


-- Create a clustered index on SalesOrderID (common pattern)
-- This leaves our search columns (CustomerID, OrderDate) without a supporting index.
CREATE CLUSTERED INDEX CX_SOH_Practice_SalesOrderID
ON dbo.SOH_Practice(SalesOrderID);

select * from SOH_Practice;

DROP INDEX IF EXISTS CX_SOH_Practice_SalesOrderID ON dbo.SOH_Practice;
