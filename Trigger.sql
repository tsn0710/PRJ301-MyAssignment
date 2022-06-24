use assignment
--Drop TRIGGER addNumberOfWeekBasedOnDate
CREATE TRIGGER addNumberOfWeekBasedOnDate
ON Lesson
FOR 
INSERT
AS 
Begin
	UPDATE Lesson
	SET numberOfWeek = (
		select w.no
		from (select l.date as st from Lesson l where l.id = (select i.id from inserted i)) 
		as a, Week w
		where a.st between w.dfrom and w.dto)
	WHERE id = (select i.id from inserted i)
End
