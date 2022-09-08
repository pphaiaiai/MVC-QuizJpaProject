<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/26/2022
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz JPA Project</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1>List Questions:</h1>
<a href="index.jsp">Home</a> > <a href="manage-users?id=new">New User</a><br><br>
<table>
    <tr>
        <th style="width: 10% ">Id</th>
        <th>User</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${users}" var="user" varStatus="us">
        <tr>
            <td>${us.index +1}</td>
            <td>${user.userName}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>
                  <span class="action">
                      [ <a href="manage-users?id=${user.userName}&action=update-user">Edit</a> |
                      <a href="manage-users?id=${user.userName}&action=remove-user">Delete</a> ]
                  </span>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
