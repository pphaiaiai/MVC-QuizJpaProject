<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz JPA Project</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1><%= "Quiz JPA Project" %>
</h1>
<c:if test="${user.userName == 'admin'}">
    <h2 style="color: coral">Hi Admin!!</h2>
</c:if>
<br/>
<a href="list-questions">List Questions</a><br>
<c:if test='${user.userName == "admin"}'>
    <a href="manage-users">List Users</a><br>
</c:if>
<c:if test="${cookie.lastquestion != null}">
    <a href='${cookie.lastquestion.value}'>Last Question</a>
</c:if>
<br><br>
<a href="authen?action=logout">Logout</a>
</body>
</html>


