<%-- 
    Document   : weeklyTimetable2
    Created on : 29-06-2022, 18:28:05
    Author     : Tong Nhat
--%>
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weekly timetable</title>
        <style>
            table, th, td {
                border: 1px solid;
            }
        </style>
    </head>
    <body>
        <form action="timetable" method="POST">
            <%-- display array of campus. --%> 
            <%-- choose campus. --%> 
            <%-- type name lecture. --%> 
            Campus: <select name="campus">
                <dava:forEach items="${requestScope.campusList}" var="aCampus">
                    <option value="${aCampus}"
                            <%-- set initial value --%>
                            <dava:if test = "${aCampus eq param.campus}">
                                selected
                            </dava:if>

                            >${aCampus}</option>
                </dava:forEach>
            </select><br/>
            <%-- choose week. (like choose campus)--%> 
            Week: <select name="numberOfWeek">
                <dava:forEach items="${requestScope.weekList}" var="aWeek">
                    <option value="${aWeek.no}"
                            <%-- set initial value --%>
                            <dava:if test = "${aWeek.getNo() == param.numberOfWeek}">
                                selected
                            </dava:if>

                            >${aWeek.toString()}</option>
                </dava:forEach>
            </select><br/>
            Lecturer: <input type="text" name ="lecture" value="${param.lecture}"/>
            <input type="submit" name ="howToView" value="viewInThisPage"/>
            <input type="submit" name ="howToView" value="viewInAnotherPage"/>
        </form>
        <%--print date--%>  

        <%--print 8 slot--%> 
        <%--print slot number--%>
        <%/**
                <br/><p>Slot 1: </p>
                <dava:forEach items="${requestScope.slot1}" var="aLesson">
                    <p>   ${aLesson}</p>
                </dava:forEach>

                <br/><p>Slot 2: </p>
                <dava:forEach items="${requestScope.slot2}" var="aLesson">
                    <p>   ${aLesson}</p>
                </dava:forEach>

                <br/><p>Slot 3: </p>
                <dava:forEach items="${requestScope.slot3}" var="aLesson">
                    CHANGE LESSON TO A LINK TO SERVLET that is responsible for do attendance
                    <p><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                          &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></p>
                    </dava:forEach>

                <br/><p>Slot 7: </p>
                <dava:forEach items="${requestScope.slot7}" var="aLesson">
                    <p>   ${aLesson}</p>
                </dava:forEach>
        **/%>
        <%--print a table test--%>
        <dava:if test="${param.numberOfWeek ne null}">
            <table>
                <tr>
                    <th></th>
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                    <th>Sunday</th>
                </tr>
                <tr>
                    <td></td>
                    <dava:forEach items="${requestScope.dayOfWeeks}" var="aDay">
                        <td>${LocalDate.parse(aDay.toString()).getDayOfMonth()}/${LocalDate.parse(aDay.toString()).getMonthValue()}</td>
                    </dava:forEach>
                </tr>
                <% 
                    String[] slots = {"Slot 1","Slot 2","Slot 3","Slot 4","Slot 5","Slot 6","Slot 7","Slot 8"};
                    for(String a: slots){
                    pageContext.setAttribute("thisSlot", a);
                %>
                <tr>
                    <td>${thisSlot}</td>
                    <dava:forEach items="${requestScope.dayOfWeeks}" var="aDay">
                        <td>
                        <dava:forEach items="${requestScope.lessons}" var="aLesson">
                            <dava:if test="${aLesson.date eq aDay and thisSlot.contains(Integer.toString(aLesson.slot))}">
                                <a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson.toString1()}</a>
                            </dava:if>
                        </dava:forEach>
                        </td>
                    </dava:forEach>
                </tr>
                <%
                    };
                %>

            </table>
        </dava:if>
    </body>
</html>

