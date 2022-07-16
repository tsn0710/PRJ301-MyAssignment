
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="utility.Utility" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weekly timetable</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            label, input, select,table,th,td {
                font-size: 1.3vw;
            }
            label.campus{
                margin-left:  14vw;
            }
            label.lecturer{
                margin-left:  10vw;
            }
            table,th,td{
                border-bottom: 1px solid #f2f2f2;
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
                border-left: 1px solid white;
                border-right: 1px solid white;
            }

            th.a{
                vertical-align: middle;
                font-weight: bold;
            }
            tr {
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
            a:hover {
                color: hotpink;
/*                cursor:crosshair*/
            }

            /* selected link 
            a:active {
                color: red;
            }
            */
            p{
                margin: 0;
                padding: 0;
            }
            p.a{
                font-size: 1vw;
                display: inline;
                background-color: green;
                border-radius: 8px;
                padding: 5px
            }

        </style>
    </head>
    <body>
        <form action="timetable2" method="POST">
            <%-- display array of campus. --%> 
            <%-- choose campus. --%> 
            <%-- type name lecture. --%> 
            <label class="campus">Campus: </label><select name="campus">
                <dava:forEach items="${requestScope.campusList}" var="aCampus">
                    <option value="${aCampus}"
                            <%-- set initial value --%>
                            <dava:if test = "${aCampus eq param.campus}">
                                selected
                            </dava:if>

                            >${aCampus}</option>
                </dava:forEach>
            </select><br>
            <label class="lecturer">Lecturer:</label><input type="text" name ="lecture" value="${param.lecture}"/>
            <!--            <input type="submit" name ="howToView" value="viewInThisPage"/>
                        <input type="submit" name ="howToView" value="viewInAnotherPage"/>-->
            <input type="submit" name ="howToView" value="View"/>
        </form>
            
        <%--print a table --%>
        <table>
            <tr>
                <th class="a">YEAR: 2022</th>
                <th>MON</th>
                <th>TUE</th>
                <th>WED</th>
                <th>THU</th>
                <th>FRI</th>
                <th>SAT</th>
                <th>SUN</th>
            </tr>
            <tr>
                <th>
                    <%-- choose week. --%> 
                    WEEK: <select id="mySelectWeek" onchange="addCodeToHREFThenClick('${param.campus}', '${param.lecture}')">
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
                        function addCodeToHREFThenClick(campus, lecture) {
                            var noOfWeek = document.getElementById("mySelectWeek").value;
                            document.getElementById("clickAWeekInSelectWeekTo").innerHTML
                                    = "<a id=\"quayLenNao\" href=\"timetable3?campus=" + campus + "&lecture=" + lecture + "&numberOfWeek=" + noOfWeek + "\">";
                            document.getElementById("quayLenNao").click();
                        }
                    </script>

                    <p id="clickAWeekInSelectWeekTo" hidden></p>

                </th>
                <dava:forEach items="${requestScope.dayOfWeeks}" var="aDay">
                    <th>${LocalDate.parse(aDay.toString()).getDayOfMonth()}/${LocalDate.parse(aDay.toString()).getMonthValue()}</th>
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
                                <a href ="attendanceForALesson?LessonID=${aLesson.id}&CourseID=${aLesson.getGroup().getCourse().getId()}&InstructorName=${aLesson.getGroup().getInstructor().getName()}&slot=${aLesson.slot}&room=${aLesson.room}&date=${aLesson.date}&GroupID=${aLesson.getGroup().getId()}&InstructorID=${aLesson.getGroup().getInstructor().getId()}" target="_blank">   ${aLesson.toString1()}</a>
                                <><!-- ca cai href tren chi co moi LessonID la dung trong servlet thoi a, nhung cai con lai la de hien thi   -->
                                <><!-- neu ng dung co tinh thay doi LessonID thi cung giong nhu la sang page khac, sai mot vai cai khong quan trong  -->
                                <dava:set var = "aStatus" value = "${Utility.getStatus(aLesson,requestScope.statuses)}"/>
                                <dava:if test="${aStatus>0}"><p style="color: green">(Attended)</p></dava:if>
                                <dava:if test="${aStatus<0}"><p style="color: red">(Absent)<br>${Utility.getTimeSlot(thisSlot)}</p></dava:if>
                                <dava:if test="${aStatus==0}"><p style="color: red">(Not yet)<br>${Utility.getTimeSlot(thisSlot)}</p></dava:if>
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

