
--tim cac Week co trong DB
select * from Week
--tim cac Instructor co trong DB
select * from Instructor
--tim tat ca Student trong mot Lesson 
DECLARE @lessonID  INT = 2;
	select Student.*
	from Student join GroupStudent on Student.id=GroupStudent.StudentID
	where GroupStudent.[group] in (
			select [Group].[group] 
			from [Group] join Lesson on [Group].[group]= Lesson.[group]
			where Lesson.id = @lessonID
			)

--tim cac Lesson cua giao vien "Thay A" co trong tuan 2
SELECT group1.*
FROM
(
	select [group], GroupInstructor.InstructorID as instructorID , GroupInstructor.CourseID as courseID, Course.name as courseName, GroupInstructor.name as instructorName  
	from 
	(select * from [Group] join Instructor on Instructor.id = [Group].InstructorID  where Instructor.name like'%Thay A%') GroupInstructor 
	join Course on Course.id= GroupInstructor.CourseID
) group1,
(select * from Lesson where Lesson.numberOfWeek = 2) lesson1
WHERE group1.[group] = lesson1.[group]

--update, insert StudentLesson
UPDATE StudentLesson
SET StudentLesson.status = 0, StudentLesson.note = 'ko phep', StudentLesson.recordTime = '99'
WHERE StudentLesson.LessonID= '17' and StudentLesson.StudentID = 'he150652'

INSERT INTO StudentLesson (StudentLesson.LessonID, StudentLesson.StudentID, StudentLesson.status, StudentLesson.note, StudentLesson.recordTime)
VALUES ('16', 'he16aa', 0, 'haha','gio')

