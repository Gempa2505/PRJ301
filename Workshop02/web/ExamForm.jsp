<%-- 
    Document   : ExamForm
    Created on : 17-03-2025, 12:07:03
    Author     : FPTSHOP
--%>

<%@page import="dto.ExamCategoriesDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ExamCategoriesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="form-container">
            <h1>Create Exam</h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="addExam"/>

                <label>Exam Title</label>
                <input type="text" name="exam_title" required/>

                <label>Subject</label>
                <input type="text" name="subject" required/>

                <label>Category</label>
                <select name="category_id">
                    <%
                        ExamCategoriesDAO dao = new ExamCategoriesDAO();
                        List<ExamCategoriesDTO> categories = dao.readAll();
                        if (categories != null) {
                            for (ExamCategoriesDTO category : categories) {
                    %>
                    <option value="<%= category.getCategory_id()%>"><%= category.getCategory_name()%></option>
                    <%
                        }
                    } else {
                    %>
                    <option disabled>No categories available</option>
                    <% } %>
                </select>

                <label>Total Marks</label>
                <input type="text" name="total_marks" required/>

                <label>Duration (minutes)</label>
                <input type="text" name="duration" required/>

                <input type="submit" value="Save"/>

                <%
                    String error_message = (String) request.getAttribute("Error_Message");
                    if (error_message != null && !error_message.equals("null") && !error_message.isEmpty()) {
                %>
                <span class="error-message"><%= error_message%></span>
                <% } %>
            </form>

            <%
                String message = (String) request.getAttribute("message");
                if (message != null && !message.equals("null") && !message.isEmpty()) {
            %>
            <span class="message"><%= message%></span>
            <% }%>

            <a href="viewCategories.jsp">
                <button>Back to Categories</button>
            </a>
        </div>
    </body>
</html>
