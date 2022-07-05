--drop  proc isExistInTableStudentLesson
create proc isExistInTableStudentLesson
@lessonID nvarchar(50),
@studentID nvarchar(50)
AS 
BEGIN
	select count(sl.StudentID) as dem from StudentLesson sl where sl.LessonID=@lessonID and sl.StudentID=@studentID group by sl.StudentID
END

/*
execute isExistInTableStudentLesson '16','he16aa'
execute isExistInTableStudentLesson '17','he1506xx'

execute isExistInTableStudentLesson '17','he150652'

execute isExistInTableStudentLesson '17','he1506xxa'

UPDATE StudentLesson
SET StudentLesson.status = 0, StudentLesson.note = 'ko phep', StudentLesson.recordTime = '99'
WHERE StudentLesson.LessonID= '17' and StudentLesson.StudentID = 'he150652'

INSERT INTO StudentLesson (StudentLesson.LessonID, StudentLesson.StudentID, StudentLesson.status, StudentLesson.note, StudentLesson.recordTime)
VALUES ('16', 'he16aa', 0, 'haha','gio');
*/