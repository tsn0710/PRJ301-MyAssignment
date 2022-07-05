<%-- 
    Document   : attendanceForALesson
    Created on : 15-06-2022, 16:28:02
    Author     : Tong Nhat
--%>
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td {
                border: 1px solid;
            }
        </style>
    </head>
    <body>

        <p>Attendance for ${param.CourseID} with lecturer ${param.InstructorName} at slot ${param.slot} on ${param.date} in room ${param.room}</p>
        <%/**    <dava:forEach items="${requestScope.studentList}" var="aStudent">
                    <p>${aStudent}</p>
                </dava:forEach>
        **/%>
        <form action="attendanceForALesson" method="POST">
            <table>
                <tr>
                    <th>StudentID</th>
                    <th>Group</th>
                    <th>StudentName</th>
                    <th>Status</th>
                    <th>Reason</th>
                </tr>

                <dava:forEach items="${requestScope.studentList}" var="aStudent">
                    <tr>
                        <td>
                            ${aStudent.getId()}
                        </td>
                        <td>
                            ${param.GroupID}
                        </td>
                        <td>
                            ${aStudent.getName()}
                        </td>
                        <td><input type="checkbox"  name="status_${aStudent.getId()}" value="${aStudent.getId()}" 
                                   <dava:forEach items="${requestScope.studentLessonList}" var = "aStudentLesson">
                                       <dava:if test="${aStudentLesson.getStudent().getId().equals(aStudent.getId()) and aStudentLesson.isStatus()==true}">
                                           Checked
                                       </dava:if>
                                   </dava:forEach>
                                   >Attended
                        </td>
                        <td><input type="text" name ="note_${aStudent.getId()}" 
                                   <dava:forEach items="${requestScope.studentLessonList}" var = "aStudentLesson">
                                       <dava:if test="${aStudentLesson.getStudent().getId().equals(aStudent.getId())}">
                                           value="${aStudentLesson.getNote()}"
                                       </dava:if>
                                   </dava:forEach>
                                   />
                        </td>
                    </tr>
                </dava:forEach>
                     <input type="hidden" name="lessonID" value="${param.LessonID}">
            </table>
            <input type="submit" value="Done">
        </form>
    </body>
</html>
