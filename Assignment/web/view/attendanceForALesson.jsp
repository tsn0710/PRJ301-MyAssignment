<%-- 
    Document   : attendanceForALesson
    Created on : 15-06-2022, 16:28:02
    Author     : Tong Nhat
--%>
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="utility.Utility" %>
<%@ page import="java.sql.Date" %>
<%@ page import="model.Account" %>
<%@ taglib uri='/WEB-INF/tlds/myCustomTag' prefix='myCustomTag' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            label, input, select,table,th,td {
                font-size: 1.3vw;
            }
            h1{
                font-weight: lighter;
                font-size: 2.5vw;
                margin: 1vw;
            }
            table,th,td{
                border: 1px solid white;
            }

            table{
                border-collapse: collapse;
            }
            th{
                text-align: left;
                height: 1.6vw;
                vertical-align: top;
                background-color: DodgerBlue;
                font-weight: normal;
            }

            th.a{
                vertical-align: middle;
                font-weight: bold;
            }
            td {
                border-bottom: 1px solid #f2f2f2;
            }
            tr:hover{
                background-color: #f2f2f2;
            }
            a{
                text-decoration: none;
            }
            /*unvisited link*/
            a:link{
                color: blue;
            }
            /*visisted link*/
            a:visited{
                color: blue;
            }
            /* mouse over link */
            a:hover{
                color: hotpink;
                /*                cursor:crosshair*/
            }

            /* selected link */
            a:active {
                color: red;
            }

            p{
                margin: 0;
                padding: 0;
                font-size: 1.3vw;
            }
            p.a{
                font-size: 1vw;
                display: inline;
                background-color: green;
                border-radius: 8px;
                padding: 5px
            }
            em{
                font-weight: bold;
                font-style: normal
            }


        </style>
    </head>
    <body>
        <h1>Single activity Attendance</h1>
        <p>Attendance for <em>${param.CourseID}</em> with lecturer <em>${param.InstructorName}</em> at slot ${param.slot} on ${param.date} in room ${param.room}</p>
        <%/**    <dava:forEach items="${requestScope.studentList}" var="aStudent">
                    <p>${aStudent}</p>
                </dava:forEach>
        **/%>
        <dava:set var = "disableHuh" value = " "/>
        <dava:if test="${Utility.isAllowToTakeAttendance(Date.valueOf(param.date),Integer.parseInt(param.slot))==false}">
            <dava:set var = "disableHuh" value = " disabled"/>
        </dava:if>
        <dava:if test="${sessionScope.acc.getInstructor().getId().equals(requestScope.InstructorID)==false}">
            <dava:set var = "disableHuh" value = " disabled"/>
        </dava:if>
        
        <form action="attendanceForALesson" method="POST">
            <table>
                <tr>
                    <th>NO</th>
                    <th>GROUP</th>
                    <th>CODE</th>
                    <th>NAME</th>
                    <th>STATUS</th>
                    <th>COMMENT</th>
                    <th>RECORD TIME</th>
                </tr>
                <% 
                    int a=1;
                %>
                <dava:forEach items="${requestScope.studentList}" var="aStudent">
                    <tr>
                        <td>
                            <% pageContext.setAttribute("i", a); %>
                            ${i}
                            <%a++;%>
                        </td>
                        <td>
                            ${param.GroupID}
                        </td>
                        <td>
                            ${aStudent.getId()}
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
                                           ${disableHuh}
                                   >Attended
                        </td>
                        <td><input type="text" name ="note_${aStudent.getId()}" 
                                   <dava:forEach items="${requestScope.studentLessonList}" var = "aStudentLesson">
                                       <dava:if test="${aStudentLesson.getStudent().getId().equals(aStudent.getId())}">
                                           value="${aStudentLesson.getNote()}"
                                       </dava:if>
                                   </dava:forEach>
                                           ${disableHuh}
                                   />
                        </td>
                        
                        <td>
                            <dava:forEach items="${requestScope.studentLessonList}" var = "aStudentLesson">
                                <dava:if test="${aStudentLesson.getStudent().getId().equals(aStudent.getId())}">
                                    <myCustomTag:English_LocalDateTime_Format localDateTimeOfRecordTimeOfStudentLesson="${aStudentLesson.getRecordTime()}"/>
                                </dava:if>
                            </dava:forEach>
                        </td>
                    </tr>
                </dava:forEach>
                    <input type="hidden" name="InstructorID" value="${param.InstructorID}">
                <input type="hidden" name="lessonID" value="${param.LessonID}">
                <input type="hidden" name="lessonDate" value="${param.date}">
                <input type="hidden" name="lessonSlot" value="${param.slot}">
            </table>
            <input type="submit" value="Done">
        </form>
    </body>
</html>
