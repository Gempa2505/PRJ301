<%-- 
    Document   : search
    Created on : 23-03-2025, 14:51:41
    Author     : FPTSHOP
--%>

<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
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
            if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        Welcome <b> <%=user.getFullName()%> </b>
        <br/>
        <form action="MainController">
            <input type="hidden" name="action" value="logout"/>
            <input type="submit" value="Logout"/>
        </form>
        <hr/>
        <form action="MainController">
            <input type="hidden" name="action" value="search"/>
            Search Value <input type="text" name="searchTerm" />
            <input type="submit" value="Search"/>
        </form>
        <br/>
        <br/>
        <%
            if (request.getAttribute("books") != null) {
                List<BookDTO> books = (List<BookDTO>) request.getAttribute("books");
        %>
        <table border="1">
            <tr>
                <td>BookID</td>
                <td>Title</td>
                <td>Author</td>
                <td>PublishYear</td>
                <td>Price</td>
                <td>Quantity</td>
            </tr>
            <%
                for (BookDTO b : books) {
            %>
            <tr>
                <td><%=b.getBookID()%></td>
                <td><%=b.getTitle()%></td>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getPublishYear()%></td>
                <td><%=b.getPrice()%></td>
                <td><%=b.getQuantity()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
        <% } else { %>
            You do not have permission to access this content.
        <% }%>
    </body>
</html>
