<%-- 
    Document   : weeklyTimetable
    Created on : 13-06-2022, 21:44:16
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
            <input type="submit" value="View"/>
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
                    <dava:set var = "dfrom" value = "${requestScope.weekList.get(param.numberOfWeek-1).getDfrom()}"/>
                    <td>${LocalDate.parse(dfrom.toString()).plusDays(0).getDayOfMonth()}/${LocalDate.parse(dfrom.toString()).plusDays(0).getMonthValue()}</td>
                    <td>${LocalDate.parse(dfrom.toString()).plusDays(1).getDayOfMonth()}/${LocalDate.parse(dfrom.toString()).plusDays(1).getMonthValue()}</td>
                    <td>${LocalDate.parse(dfrom.toString()).plusDays(2).getDayOfMonth()}/${LocalDate.parse(dfrom.toString()).plusDays(2).getMonthValue()}</td>
                    <td>${LocalDate.parse(dfrom.toString()).plusDays(3).getDayOfMonth()}/${LocalDate.parse(dfrom.toString()).plusDays(3).getMonthValue()}</td>
                    <td>${LocalDate.parse(dfrom.toString()).plusDays(4).getDayOfMonth()}/${LocalDate.parse(dfrom.toString()).plusDays(4).getMonthValue()}</td>
                    <td>${LocalDate.parse(dfrom.toString()).plusDays(5).getDayOfMonth()}/${LocalDate.parse(dfrom.toString()).plusDays(5).getMonthValue()}</td>
                    <td>${LocalDate.parse(dfrom.toString()).plusDays(6).getDayOfMonth()}/${LocalDate.parse(dfrom.toString()).plusDays(6).getMonthValue()}</td>
                </tr>

                <tr>
                    <td>Slot 1</td>
                    <dava:forEach items="${requestScope.slot1}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>
                <tr>
                    <td>Slot 2</td>
                    <dava:forEach items="${requestScope.slot2}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>
                <tr>
                    <td>Slot 3</td>
                    <dava:forEach items="${requestScope.slot3}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>
                <tr>
                    <td>Slot 4</td>
                    <dava:forEach items="${requestScope.slot4}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>
                <tr>
                    <td>Slot 5</td>
                    <dava:forEach items="${requestScope.slot5}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>
                <tr>
                    <td>Slot 6</td>
                    <dava:forEach items="${requestScope.slot6}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>
                <tr>
                    <td>Slot 7</td>
                    <dava:forEach items="${requestScope.slot7}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>
                <tr>
                    <td>Slot 8</td>
                    <dava:forEach items="${requestScope.slot8}" var="aLesson">
                        <td><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&name=${aLesson.name}
                               &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></td>
                        </dava:forEach>
                </tr>

            </table>
        </dava:if>
    </body>
</html>
