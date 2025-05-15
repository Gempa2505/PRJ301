<%-- 
    Document   : create
    Created on : 10-03-2025, 11:05:44
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
        <h2>Create New Project</h2>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="createProject" />

            Project Name: <input type="text" name="projectName" required /><br>
            Description: <input type="text" name="description" required /><br>
            Status: 
            <select name="status" required>
                <option value="Development">Development</option>
                <option value="Launch">Launch</option>
                <option value="Ideation">Ideation</option>
                <option value="Scaling">Scaling</option>
            </select>
            <br>
            Estimated Launch: <input type="date" name="estimatedLaunch" required /><br>

            <input type="submit" value="Create Project" />
        </form>
    </body>
</html>
