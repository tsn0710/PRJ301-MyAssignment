create view studentWhereGroupIsWhereLessonIdIs as(
	select Student.*
	from Student join GroupStudent on Student.id=GroupStudent.id
	where GroupStudent.[group] in (select [Group].[group] 
	from [Group] join Lesson on [Group].[group]= Lesson.[group]
	where Lesson.id = 7)
)
