select * from sysobjects 
go
--
select distinct xtype from sysobjects
go
--
select * from sysobjects where xtype='P'
go
-- 
print 'yo'
go
--
select xtype,count(type) as CountOfObjects from sysobjects group by xtype 
--
select uid, xtype,count(type) as CountOf2Objects from sysobjects group by xtype, uid
--
select xtype,count(type) as CountOfObjects from sysobjects group by xtype having xtype ='P' order by xtype
--
select * from (select xtype,count(type) as CountOfObjects from sysobjects group by xtype ) pract1 where pract1.xtype='P'
--







