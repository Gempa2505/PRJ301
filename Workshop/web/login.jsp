<%-- 
    Document   : login
    Created on : 06-03-2025, 01:18:42
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h2>Login</h2>
         <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            Username <input type="text" name="txtUsername"/><br/>
            Password <input type="password" name="txtPassword"/><br/>            
            <input type="submit" value="Login"/>
        </form>
        <%@ include file="footer.jsp" %>
    </body>
</html>
