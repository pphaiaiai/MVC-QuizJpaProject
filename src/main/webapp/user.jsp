<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/31/2022
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<div class="card">
    <c:choose>
        <c:when test='${id == "new"}'>
            <h3 class="label">New User</h3>
            <p>
            <form action="manage-users" method="post">
                <span class="label">Username : </span>
                <input type="text" name="userName"/><br>
                <span class="label">Password : </span>
                <input type="password" name="password"/><br>
                <span class="label">Firstname : </span>
                <input type="text" name="firstName"/><br>
                <span class="label">Lastname : </span>
                <input type="text" name="lastName"/><br>
                <span class="label">Email : </span>
                <input type="email" name="email"/><br>
                <input type="hidden" name="id" value="new"/>
                <input type="hidden" name="action" value="add-user"/>
                <input type="submit" value="Save">
            </form>
            </p>
            <a href="manage-users">Back</a>
        </c:when>
        <c:otherwise>
            <h3 class="label">Edit User</h3>
            <p>
            <form action="manage-users" method="post">
                <span class="label">Username : ${user.userName}</span> <br>
<%--                <input type="text" name="userName" value="${user.userName}"/><br>--%>
                <span class="label">Password : </span>
                <input type="text" name="password" value="${user.password}"/><br>
                <span class="label">Firstname : </span>
                <input type="text" name="firstName" value="${user.firstName}"/><br>
                <span class="label">Lastname : </span>
                <input type="text" name="lastName" value="${user.lastName}"/><br>
                <span class="label">Email : </span>
                <input type="email" name="email" value="${user.email}"/><br>
                <input type="hidden" name="id" value="${user.userName}"/>
                <input type="hidden" name="action" value="update-user"/>
                <input type="submit" value="Save">
            </form>
            </p>
            <a href="manage-users">Back</a>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
