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
    </head>
    <body>
        <p>Attendance for ${param.course} with lecturer ${param.instructor} at slot ${param.slot} on ${param.date} in room ${param.room}</p>
        <dava:forEach items="${requestScope.studentList}" var="aStudent">
            <p>${aStudent}</p>
        </dava:forEach>
    </body>
</html>
