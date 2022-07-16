<%-- 
    Document   : Login
    Created on : 16-07-2022, 21:39:51
    Author     : Tong Nhat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="loginForInstructor" method="post">
            Username: <input type="text" name="userName"/><br>
            Password: <input type="text" name="password"/><br>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
