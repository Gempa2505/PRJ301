<%-- 
    Document   : viewCatogories
    Created on : 17-03-2025, 12:08:37
    Author     : FPTSHOP
--%>

<%@page import="dao.ExamCategoriesDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.ExamCategoriesDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h2>Welcome to Project Dashboard</h2>
            <%
                ExamCategoriesDAO categoryDAO = new ExamCategoriesDAO();
                List<ExamCategoriesDTO> categories = (List<ExamCategoriesDTO>) categoryDAO.readAll();
            %>

            <%
                dto.UserDTO user = (dto.UserDTO) session.getAttribute("user");
                if (user != null) {
            %>
            <p class="welcome-message">Hello, <strong><%= user.getName()%></strong>! You are logged in.</p>
            <%}%>
            <form action="MainController">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" class="logout-btn" value="Logout"/>
            </form>
            <table>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
                <%
                    if (categories != null) {
                        for (ExamCategoriesDTO category : categories) {
                %>
                <tr>
                    <td><%= category.getCategory_id()%></td>
                    <td><%= category.getCategory_name()%></td>
                    <td><%= category.getDescription()%></td>
                    <td> 
                        <form action="MainController" method="GET">
                            <input type="hidden" name="action" value="viewExams">
                            <input type="hidden" name="category_id" value="<%=category.getCategory_id()%>">
                            <input type="submit" value="View Exams">
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>             
            </table>
            <form action="MainController" method="GET">
                <input type="hidden" name="action" value="viewCategories">
                <input type="submit" value="View Categories">
            </form>
            <form action="MainController" method="GET">
                <input type="hidden" name="action" value="showCreateExamForm">
                <button type="submit">Create New Exam</button>
            </form>
        </div>
    </body>
</html>
