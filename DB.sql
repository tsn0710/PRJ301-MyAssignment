USE [assignment]
GO

/****** Object:  Table [dbo].[all]    Script Date: 15/06/2022 5:57:26 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE [dbo].[all]
--drop table [dbo].[Group]
--drop table [dbo].[Week]
--drop table [dbo].[Student]
create table [Week](
	[no] [int] not null primary key,
	[dfrom] [date] not null,
	[dto] [date] not null
)
CREATE TABLE [dbo].[all](
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
CREATE TABLE [Group](
	[group] [nvarchar](50) NOT NULL primary key
	
 )
/*INSERT INTO [dbo].[all]
           ([id]
           ,[group]
		   ,[course]
           ,[instructor]
           ,[slot]
           ,[room]
           ,[date])
     VALUES
           (<id, nvarchar(50),>
           ,<group, nvarchar(50),>
           ,<instructor, nvarchar(50),>
           ,<slot, int,>
           ,<room, nvarchar(50),>
           ,<date, date,>)
GO*/

INSERT INTO [dbo].[all]
           ([id]
           ,[group]
		   ,[course]
           ,[instructor]
           ,[slot]
           ,[room]
           ,[date]
		   ,[numberOfWeek])
     VALUES
           (1
           ,'se1634'
		   ,'MAS291'
           ,'TrungDT'
           ,1
           ,'DE-C205'
           ,'2002-06-13',2)
GO
INSERT INTO [dbo].[all]
           ([id]
           ,[group]
		   ,[course]
           ,[instructor]
           ,[slot]
           ,[room]
           ,[date]
		   ,[numberOfWeek])
     VALUES
           (2
           ,'se1634'
		   ,'JPD123'
           ,'AnhNH88'
           ,3
           ,'DE-C206'
           ,'2022-06-13',2),

		   (3
           ,'se1634'
		   ,'JPD123'
           ,'AnhNH88'
           ,3
           ,'DE-C206'
           ,'2022-06-17',2)
GO

INSERT INTO [dbo].[all]
           ([id]
           ,[group]
		   ,[course]
           ,[instructor]
           ,[slot]
           ,[room]
           ,[date]
		   ,[numberOfWeek])
     VALUES
           (4
           ,'se1635'
		   ,'PRJ301'
           ,'SonNT5'
           ,3
           ,'DE-C205'
           ,'2022-06-14',3),

		   (5
           ,'se1634'
		   ,'PRJ301'
           ,'SonNT5'
           ,4
           ,'DE-C205'
           ,'2022-06-14',2)
GO

INSERT INTO [dbo].[Group]
           ([group])
     VALUES
           ('se1634'),('se1635')
GO
CREATE TABLE [dbo].[Student](
	[id] [nvarchar](50) NOT NULL,
	[group] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group] FOREIGN KEY([group])
REFERENCES [dbo].[Group] ([group])

ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Group]
GO


INSERT INTO [dbo].[Student]
           ([id]
           ,[group]
           ,[name])
     VALUES

		   ('he1506xx'
           ,'se1634'
           ,'ban cung lop nhat'),
		   
           ('he150652'
           ,'se1634'
           ,'tong sy nhat'),

		   ('he16aa'
           ,'se1635'
           ,'ban lop ngoai'),

		   ('he16xx'
           ,'se1635'
           ,'lop 1635')
GO


