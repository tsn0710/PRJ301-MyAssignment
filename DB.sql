USE [assignment]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE [dbo].[Lesson]
--drop table [dbo].[Group]
--drop table [dbo].[GroupStudent]
--drop table [dbo].[Week]
--drop table [dbo].[Student]
--drop table [dbo].[StudentLesson]
--drop table [dbo].[Instructor]
--drop table [dbo].[Course]
create table [Week](
	[no] [int] not null primary key,
	[dfrom] [date] not null,
	[dto] [date] not null
)

create table [Instructor](
	[id] [nvarchar](50) NOT NULL primary key,
	[name] [nvarchar](50) NOT NULL,
)

create table [Course](
	[id] [nvarchar](50) NOT NULL primary key,
	[name] [nvarchar](50) NOT NULL,
)

CREATE TABLE [Group](
	[group] [nvarchar](50) NOT NULL primary key,
	[CourseID] [nvarchar](50) NOT NULL,
	[InstructorID] [nvarchar](50) NOT NULL,
	FOREIGN KEY ([CourseID]) REFERENCES [Course] ([id]),
	FOREIGN KEY ([InstructorID]) REFERENCES [Instructor] ([id])
 )
 --TABLE Lesson----------------------------------------------------------------------
CREATE TABLE [dbo].[Lesson](
	[id] [nvarchar](50) NOT NULL primary key,
	[group] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[slot] [int] NOT NULL,
	[room] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[numberOfWeek] [int] not null,
	FOREIGN KEY ([group]) REFERENCES [Group] ([Group]),
	FOREIGN KEY ([numberOfWeek]) REFERENCES [Week] ([no])
)
GO
--TABLE Student----------------------------------------------------------------------
CREATE TABLE [dbo].[Student](
	[id] [nvarchar](50) NOT NULL primary key,
	[name] [nvarchar](50) NOT NULL
)
GO

----Table GroupStudent-----------------------------------------------------------------------
CREATE TABLE [dbo].[GroupStudent](
	[group] [nvarchar](50) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	primary key ([group],[StudentID]),
	FOREIGN KEY ([group]) REFERENCES [Group] ([Group]),
	FOREIGN KEY ([StudentID]) REFERENCES [Student] ([id])
)
GO
------Table StudentLesson------------------------------------------------------------------------------
CREATE TABLE [dbo].[StudentLesson](
	[StudentID] [nvarchar](50) NOT NULL,
	[LessonID] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[recordTime] [nvarchar](50) NULL,
	PRIMARY KEY ([StudentID],[LessonID]),
	FOREIGN KEY ([LessonID]) REFERENCES [Lesson] ([id]),
	FOREIGN KEY ([StudentID]) REFERENCES [Student] ([id])
)
GO
----------------------------------------------------------------------------------------
--you  must execute  file Trigger.sql before insert into table Lesson 
--you can only insert one rows at a INSERT into the table
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (1 ,'se1' ,'se1tiet1',1 ,'DE-C205' ,'2022-01-06',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (2 ,'se2' ,'se2tiet1',2 ,'DE-C206' ,'2022-01-07',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (3 ,'se3' ,'se3tiet1',3 ,'DE-C206' ,'2022-01-08',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (4 ,'se4' ,'se4tiet1',3 ,'DE-C205' ,'2022-01-10',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (5 ,'se1' ,'se1tiet2',4 ,'DE-C205' ,'2022-01-10',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (6 ,'se2' ,'se2tiet2',1 ,'DE-C205' ,'2022-01-11',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (7 ,'se3' ,'se3tiet2',3 ,'DE-C206' ,'2022-01-09',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (8 ,'se1' ,'se1tiet3',2 ,'DE-C206' ,'2022-01-12',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (9 ,'se2' ,'se2tiet3',1 ,'DE-C205' ,'2022-01-12',9)
INSERT INTO [dbo].[Lesson] ([id] ,[group],[name] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (10 ,'se1','se1tiet4',5 ,'DE-C298' ,'2022-01-13',9)

INSERT INTO [dbo].[Group] ([group], [CourseID],[InstructorID])
     VALUES ('se1', 'PRJ', 'i1'),
	        ('se2', 'PRJ', 'i2'),
			('se3', 'MAS', 'i2'),
			('se4', 'MAD', 'i3')
GO

INSERT INTO [dbo].[Course] ([id] ,[name])
     VALUES ('PRJ' ,'Java Web Application Development'),
		    ('MAS' ,'Statistics and Probability'),
			('MAD'  ,'Discrete mathematics')
GO

INSERT INTO [dbo].[Instructor] ([id] ,[name])
     VALUES ('i1' ,'Thay A'),
		    ('i2' ,'Co B'),
			('i3'  ,'Thay C')
GO

INSERT INTO [dbo].[Student] ([id] ,[name])
     VALUES ('he1506xx' ,'ban cung lop nhat'),
		    ('he150652' ,'tong sy nhat'),
			('he16aa'  ,'ban lop ngoai'),
			('he16xx'  ,'lop 1635')
GO

INSERT INTO [dbo].[GroupStudent] ([StudentID] ,[group])
     VALUES ('he150652' ,'se1' ),
	('he150652' ,'se2' ),
	('he1506xx' ,'se2' ),
('he1506xx' ,'se1' ),
('he16aa' ,'se1' ),
('he16aa' ,'se2' ),
('he16aa' ,'se3' ),
('he16aa' ,'se4' ),
('he16xx' ,'se1' )
GO






