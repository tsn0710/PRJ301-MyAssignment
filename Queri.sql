
--tim cac Week co trong DB
select * from Week
--tim cac Instructor co trong DB
select * from Instructor
--tim tat ca Lesson trong slot 1 cua tuan so 2
select * from Lesson where numberOfWeek =2 and slot =1
--tim tat ca cac Lesson cua Instructor do va co dien ra trong Week nay va la slot 4
DECLARE @slot INT = 4;
DECLARE @noOfWeek INT = 2;
DECLARE @instructorID nvarchar(50) = 'i1';
select *
from Lesson join [Group] on [Group].[group] = Lesson.[group]
where [Group].InstructorID = @instructorID and Lesson.numberOfWeek = @noOfWeek and Lesson.slot =@slot
--tim tat ca Student trong mot Lesson 
DECLARE @lessonID  INT = 2;
	select Student.*
	from Student join GroupStudent on Student.id=GroupStudent.StudentID
	where GroupStudent.[group] in (
			select [Group].[group] 
			from [Group] join Lesson on [Group].[group]= Lesson.[group]
			where Lesson.id = @lessonID
			)



