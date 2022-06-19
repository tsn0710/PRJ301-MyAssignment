
INSERT INTO [dbo].[Group]
           ([group])
     VALUES
           ('se1634'),('se1635')
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