<%--
  Created by IntelliJ IDEA.
  User: Natalya
  Date: 11/13/2015
  Time: 10:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir='/WEB-INF/tags' prefix='sc'%>

<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>My Room</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<header>

    <link rel="stylesheet" type="text/css" href="<c:url value="../themes/style.css"/>">
    <h3>My Room</h3></header>
<body>
<img src="../photos/photo.jpg" alt="profile image" />
<div class = "result">
<h1>Result</h1>
<h1>Firstname: ${user.firstname}</h1>
<h1>Lastname: ${user.lastname}</h1>
<h1>Login: ${user.login}</h1>
<h1>password: ${user.password}</h1>
<h1>Email: ${user.email}</h1>
<h1>Birth date: ${user.birthdate}</h1>
<h1>Phone: ${user.phone}</h1>

<a href="/main">Submit another user</a>
    <a href="/login">Log in</a>
    </div>

<h3><spring:message code="label.user" /></h3>
<c:if test="${!empty listUser}">
    <table class="data">
        <tr>
            <th><spring:message code="label.lastname" /></th>
            <th><spring:message code="label.password" /></th>
            <th><spring:message code="label.login" /></th>
            <th><spring:message code="label.firstname" /></th>
            <th><spring:message code="label.email" /></th>
            <th><spring:message code="label.phone" /></th>
            <th><spring:message code = "label.birthdate" /></th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach items="${listUser}" var="user">
            <tr>
                <td>${user.lastname}, ${user.firstname}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.login}</td>
                <td>${user.password}</td>
                <td>${user.birthdate}</td>
                <td><a href="delete/${user.id}"><spring:message code="label.delete" /></a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
<footer>&copy Copyright by Natalia K</footer>
</html>