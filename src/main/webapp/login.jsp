<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/27/2022
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            text-align: center;
            width: 50%;
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<h3>Login</h3>
<form action="authen" method="post">
    <label for="username">User Name:</label>
    <input type="text" name="userName"><br/>
    <label for="password">Password:</label>&nbsp;&nbsp;&nbsp;
    <input type="password" name="password"><br/>
    <input type="submit" value="Login"/>
    <input type="reset" value="Cancel"/>
</form>
</body>
</html>
