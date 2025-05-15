<%-- 
    Document   : search
    Created on : 06-03-2025, 01:18:59
    Author     : FPTSHOP
--%>

<%@page import="dto.StartupProjectsDTO"%>
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
        <%@ include file="header.jsp" %>
        <div style="min-height: 300px; padding: 15px">
            <%
                UserDTO user = (UserDTO) session.getAttribute("user");
            %>
            <br/>
            Welcome <b> <%=user.getFullName()%> </b>
            <a href="MainController?action=logout">Logout</a>
            <hr/>
            <%
                String searchTerm = (String) request.getAttribute("searchTerm") + "";
                searchTerm = searchTerm.equals("null") ? "" : searchTerm;
            %>
            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Project <input type="text" name="txtSearchProject" />
                <input type="submit" value="Search"/>
            </form>
            <br/>
            <%
                if (request.getAttribute("project") != null) {
                    List<StartupProjectsDTO> project = (List<StartupProjectsDTO>) request.getAttribute("project");
            %>
            <form action="create.jsp" method="GET">
                <input type="submit" value="Create New Project" />
            </form>
            <br/>
            <%
                String successMessage = (String) session.getAttribute("successMessage");
                if (successMessage != null) {
            %>
            <div style="color: green; font-weight: bold;"><%= successMessage%></div>
            <% session.removeAttribute("successMessage"); %>
            <% } %>
            
            <table border="1">
                <tr>
                    <td>project_id</td>
                    <td>project_name</td>
                    <td>Description</td>
                    <td>Status</td>
                    <td>estimated_launch</td>
                </tr>
                <%
                    for (StartupProjectsDTO p : project) {
                %>
                <tr>
                    <td><%=p.getProjectId()%></td>
                    <td><%=p.getProjectName()%></td>
                    <td><%=p.getDescription()%></td>
                    <td><%=p.getStatus()%></td>
                    <td><%=p.getEstimatedLaunch()%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                }

            %>
        </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
