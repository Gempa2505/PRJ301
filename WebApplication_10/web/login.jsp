<%-- 
    Document   : login
    Created on : 23-03-2025, 14:51:22
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
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            Username <input type="text" name="txtUsername"/><br/>
            Password <input type="password" name="txtPassword"/><br/>            
            <input type="submit" value="Login"/>
        </form>
        <%
            String message = request.getAttribute("message")+"";
        %> 
        <%=message.equals("null")?"":message%>
    </body>
</html>
