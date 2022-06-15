<%-- 
    Document   : weeklyTimetable
    Created on : 13-06-2022, 21:44:16
    Author     : Tong Nhat
--%>
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weekly timetable</title>
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
            Lecturer: <input type="text" name ="lecture" value="${param.lecture}"/>
            <input type="submit" value="View"/>
        </form>
<%--print date--%>  
        
<%--print 8 slot--%> 
        <%--print slot number--%>
        <br/><p>Slot 1: </p>
        <dava:forEach items="${requestScope.slot1}" var="aLesson">
            <%--print a lesson--%>
            <p>   ${aLesson}</p>
        </dava:forEach>
            
        <br/><p>Slot 2: </p>
        <dava:forEach items="${requestScope.slot2}" var="aLesson">
            <%--print a lesson--%>
            <p>   ${aLesson}</p>
        </dava:forEach>
        
        <br/><p>Slot 3: </p>
        <dava:forEach items="${requestScope.slot3}" var="aLesson">
            <%--print a lesson--%>
            <%--CHANGE LESSON TO A LINK TO SERVLET that is responsible for do attendance--%>
            <p><a href ="attendanceForALesson?id=${aLesson.id}&group=${aLesson.group}&course=${aLesson.course}&instructor=${aLesson.instructor}
                  &slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}" target="_blank">   ${aLesson}</a></p>
        </dava:forEach>
            
        <br/><p>Slot 7: </p>
        <dava:forEach items="${requestScope.slot7}" var="aLesson">
            <%--print a lesson--%>
            <p>   ${aLesson}</p>
        </dava:forEach>
    </body>
</html>
