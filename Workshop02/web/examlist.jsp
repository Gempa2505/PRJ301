<%-- 
    Document   : examlist
    Created on : 17-03-2025, 12:08:08
    Author     : FPTSHOP
--%>

<%@page import="java.util.List"%>
<%@page import="dto.ExamsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Exam List</h2>

        <%
            List<ExamsDTO> examList = (List<ExamsDTO>) request.getAttribute("examList");
            String errorMessage = (String) request.getAttribute("errorMessage");

            if (errorMessage != null) {
        %>
        <p class="error"><%= errorMessage%></p>
        <%
        } else if (examList == null || examList.isEmpty()) {
        %>
        <p>No exams available for this category.</p>
        <%
        } else {
        %>
        <table>
            <tr>
                <th>Exam ID</th>
                <th>Exam Title</th>
                <th>Subject</th>
                <th>Total Marks</th>
                <th>Duration (mins)</th>
            </tr>
            <% for (ExamsDTO exam : examList) {%>
            <tr>
                <td><%= exam.getExam_id()%></td>
                <td><%= exam.getExam_tilte()%></td>
                <td><%= exam.getSubject()%></td>
                <td><%= exam.getToltal_marks()%></td>
                <td><%= exam.getDuration()%></td>
            </tr>
            <% } %>
        </table>
        <%
            }
        %>

        <a href="viewCategories.jsp">
            <button>Back to Categories</button>
        </a>
    </body>
</html>
