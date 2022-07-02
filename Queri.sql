
--tim cac Week co trong DB
select * from Week

--tim cac Instructor co trong DB
select * from Instructor

--tim cac Lesson trong tuan so 2 cua Instructor co name like '%Co%'
SELECT group1.*
FROM
	(
		select [group], GroupInstructor.InstructorID as instructorID , GroupInstructor.CourseID as courseID, 
			Course.name as courseName, GroupInstructor.name as instructorName  
		from 
		(select * from [Group] join Instructor on Instructor.id = [Group].InstructorID  where Instructor.name like'%Co%') GroupInstructor 
		join Course on Course.id= GroupInstructor.CourseID
	) group1,
	(
		select * from Lesson where Lesson.numberOfWeek = 2
	) lesson1
WHERE group1.[group] = lesson1.[group]

--tim tat ca Student trong mot Lesson 
DECLARE @lessonID  INT = 2;
	select Student.*
	from Student join GroupStudent on Student.id=GroupStudent.StudentID
	where GroupStudent.[group] in (
			select [Group].[group] 
			from [Group] join Lesson on [Group].[group]= Lesson.[group]
			where Lesson.id = @lessonID
			)



