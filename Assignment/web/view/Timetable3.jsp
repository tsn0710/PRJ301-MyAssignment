
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
        <form action="timetable2" method="POST">
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
            </select><br>
            Lecturer: <input type="text" name ="lecture" value="${param.lecture}"/>
<!--            <input type="submit" name ="howToView" value="viewInThisPage"/>
            <input type="submit" name ="howToView" value="viewInAnotherPage"/>-->
            <input type="submit" name ="howToView" value="View"/>
        </form>
            
        <%--print a table --%>
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
                <td>
                    <%-- choose week. --%> 
                    Week: <select id="mySelectWeek" onchange="addCodeToHREFThenClick('${param.campus}','${param.lecture}')">
                        <dava:forEach items="${requestScope.weekList}" var="aWeek">
                            <option value="${aWeek.no}"
                                    <%-- set initial value --%>
                                    <dava:if test = "${aWeek.getNo() == requestScope.numberOfWeek}">
                                        selected
                                    </dava:if>

                                    >${aWeek.toString()}</option>
                        </dava:forEach>
                    </select><br/>
                    
                    <script>
                        function addCodeToHREFThenClick(campus,lecture) {
                            var noOfWeek = document.getElementById("mySelectWeek").value;
                            document.getElementById("clickAWeekInSelectWeekTo").innerHTML 
                                    = "<a id=\"quayLenNao\" href=\"timetable3?campus="+campus+"&lecture="+lecture+"&numberOfWeek="+noOfWeek+"\">" ;
                            document.getElementById("quayLenNao").click();
                        }
                    </script>
                    
                    <p id="clickAWeekInSelectWeekTo"></p>
                    
                </td>
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
                                <a href ="attendanceForALesson?LessonID=${aLesson.id}&CourseID=${aLesson.getGroup().getCourse().getId()}&InstructorName=${aLesson.getGroup().getInstructor().getName()}&slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}&GroupID=${aLesson.getGroup().getId()}" target="_blank">   ${aLesson.toString1()}</a>
                            </dava:if>
                        </dava:forEach>
                    </td>
                </dava:forEach>
            </tr>
            <%
                };
            %>

        </table>
    </body>
</html>

