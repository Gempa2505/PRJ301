<%-- 
    Document   : login
    Created on : 17-03-2025, 12:08:21
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /* định dạng toàn trang */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #d3d3d3; /* Màu xám nhạt */
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }


            /* Container c?a form */
            .login-container {
                background: #fff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 350px;
            }

            /* Tiêu đề */
            h2 {
                color: #333;
                margin-bottom: 20px;
                font-size: 24px;
            }

            /* Ô input */
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                background: #f8f9fa;
                transition: 0.3s;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                outline: none;
                border: 1px solid #28a745;
                background: #e9f5ee;
            }

            /* Nút Login */
            input[type="submit"] {
                width: 100%;
                background: #28a745;
                color: white;
                padding: 12px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
                font-weight: bold;
                transition: 0.3s;
            }

            input[type="submit"]:hover {
                background: #218838;
            }

            /* Thông báo l?i */
            .message {
                color: red;
                font-weight: bold;
                margin-top: 10px;
            }

        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login"/>
                <input type="text" name="txtUserName" placeholder="Username" required/>
                <input type="password" name="txtPassword" placeholder="Password" required/>          
                <input type="submit" value="Login"/>
            </form>
            <%
                String message = (String) request.getAttribute("message") + "";
            %>
            <p class="message"><%= message.equals("null") ? "" : message%></p>
        </div>
    </body>
</html>
