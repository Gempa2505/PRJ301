<%-- 
    Document   : search
    Created on : 23-03-2025, 14:51:41
    Author     : FPTSHOP
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO)request.getAttribute("user");
        %>
        Welcome <b> <%=user.getFullName() %> </b>
        <a href="MainController?action=logout">Logout</a>
        <hr/>
        <form action="#">
            Search Value <input type="text" name="txtSearchValue" />
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
