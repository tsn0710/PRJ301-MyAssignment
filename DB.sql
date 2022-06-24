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
create table [Week](
	[no] [int] not null primary key,
	[dfrom] [date] not null,
	[dto] [date] not null
)
CREATE TABLE [Group](
	[group] [nvarchar](50) NOT NULL primary key
	
 )
 --TABLE Lesson----------------------------------------------------------------------
CREATE TABLE [dbo].[Lesson](
	[id] [nvarchar](50) NOT NULL,
	[group] [nvarchar](50) NOT NULL,
	[course] [nvarchar](50) NOT NULL,
	[instructor] [nvarchar](50) NOT NULL,
	[slot] [int] NOT NULL,
	[room] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[numberOfWeek] [int] not null,
	FOREIGN KEY ([group]) REFERENCES [Group] ([Group]),
	FOREIGN KEY ([numberOfWeek]) REFERENCES [Week] ([no]),
 CONSTRAINT [PK_all] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--TABLE Student----------------------------------------------------------------------
CREATE TABLE [dbo].[Student](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

----Table GroupStudent-----------------------------------------------------------------------
CREATE TABLE [dbo].[GroupStudent](
	[group] [nvarchar](50) NOT NULL,
	[id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GroupStudent] PRIMARY KEY CLUSTERED 
(
	[group] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_GroupStudent_Group] FOREIGN KEY([group])
REFERENCES [dbo].[Group] ([group])
GO

ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_GroupStudent_Group]
GO

ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_GroupStudent_Student] FOREIGN KEY([id])
REFERENCES [dbo].[Student] ([id])
GO

ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_GroupStudent_Student]
GO
------Table StudentLesson------------------------------------------------------------------------------
CREATE TABLE [dbo].[StudentLesson](
	[StudentID] [nvarchar](50) NOT NULL,
	[LessonID] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[recordTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentLesson] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[StudentLesson]  WITH CHECK ADD  CONSTRAINT [FK_StudentLesson_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([id])
GO

ALTER TABLE [dbo].[StudentLesson] CHECK CONSTRAINT [FK_StudentLesson_Lesson]
GO

ALTER TABLE [dbo].[StudentLesson]  WITH CHECK ADD  CONSTRAINT [FK_StudentLesson_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([id])
GO

ALTER TABLE [dbo].[StudentLesson] CHECK CONSTRAINT [FK_StudentLesson_Student]
GO
----------------------------------------------------------------------------------------
--you  must execute  file Trigger.sql before insert into table Lesson 
--you can only insert one rows at a INSERT into the table
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (1 ,'se1634' ,'MAS291' ,'TrungDT' ,1 ,'DE-C205' ,'2022-10-07',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (2 ,'se1634' ,'JPD123' ,'AnhNH88' ,3 ,'DE-C206' ,'2022-10-07',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (3 ,'se1634' ,'JPD123' ,'AnhNH88' ,3 ,'DE-C206' ,'2022-10-08',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (4 ,'se1635' ,'PRJ301' ,'SonNT5' ,3 ,'DE-C205' ,'2022-01-10',3)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (5 ,'se1634' ,'PRJ301' ,'SonNT5' ,4 ,'DE-C205' ,'2022-01-10',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (6 ,'se1634' ,'PRJ301' ,'SonNT5' ,1 ,'DE-C205' ,'2022-01-11',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (7 ,'se1634' ,'JPD123' ,'AnhNH88' ,3 ,'DE-C206' ,'2022-01-06',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (8,'se1634' ,'JPD123' ,'AnhNH88' ,3 ,'DE-C206' ,'2022-01-12',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (9 ,'se1634' ,'MAS291' ,'TrungDT' ,1 ,'DE-C205' ,'2022-01-12',2)
INSERT INTO [dbo].[Lesson] ([id] ,[group] ,[course] ,[instructor] ,[slot] ,[room] ,[date] ,[numberOfWeek]) VALUES (10 ,'se1635' ,'IOT102' ,'DuongNV44' ,5 ,'DE-C298' ,'2022-01-11',3)

INSERT INTO [dbo].[Group] ([group])
     VALUES ('se1634'),
	        ('se1635')
GO

INSERT INTO [dbo].[Student] ([id] ,[name])
     VALUES ('he1506xx' ,'ban cung lop nhat'),
		    ('he150652' ,'tong sy nhat'),
			('he16aa'  ,'ban lop ngoai'),
			('he16xx'  ,'lop 1635')
GO

INSERT INTO [dbo].[GroupStudent] ([id] ,[group])
     VALUES ('he150652' ,'se1634' ),
	('he150652' ,'se1635' ),
('he1506xx' ,'se1634' ),
('he16aa' ,'se1635' ),
('he16xx' ,'se1634' ),
GO




