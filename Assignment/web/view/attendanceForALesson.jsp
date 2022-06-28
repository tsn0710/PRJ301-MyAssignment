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
        
        <p>Attendance for ${param.course} with lecturer ${param.instructor} at slot ${param.slot} on ${param.date} in room ${param.room}</p>
        <dava:forEach items="${requestScope.studentList}" var="aStudent">
            <p>${aStudent}</p>
        </dava:forEach>
         
        
        <table>
            <tr>
                <th>StudentID</th>
                <th>Group</th>
                <th>StudentName</th>
                <th>Status</th>
                <th>Reason</th>
            </tr>
            <tr>
                <td>HE150652</td>
                <td>se1</td>
                <td>Tong Sy Nhat</td>
                <td><input type="checkbox"  name="status1" value="attended"> Attended</td>
                <td><input type="text" name ="reason" value="empty"/></td>
            </tr>
            <tr>
                <td>HE150652</td>
                <td>se1</td>
                <td>Tong Sy </td>
                <td><input type="radio" name="status2" value="attended" /> Attended</td>
                <td><input type="text" name ="reason" value="empty"/></td>
            </tr>
        </table>
    </body>
</html>
