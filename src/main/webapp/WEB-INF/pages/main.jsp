<%--
  Created by IntelliJ IDEA.
  User: Natalya
  Date: 11/13/2015
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir='/WEB-INF/tags' prefix='sc'%>

<html>
<head>
    <title>Registration</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><spring:message code="label.title" /></title>
</head>


    <header>
        <link rel="stylesheet" type="text/css" href="<c:url value="../themes/style.css"/>">
        <h3>Registration</h3></header>

<body>


<div id="wrapper">
    <p> <a href="/hello">Main</a></p>
    <p> <a href="/contacts">Contacts</a></p>

</div>

<form:form method="POST" action="add" commandName="user" modelAttribute="user">
    <spring:bind path="firstname">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Name</label>
            <div class="col-sm-10">
                <form:input path="firstname" type="text" class="form-control"
                            id="firstname" placeholder="Name" />
                <spring:message code="label.firstname" />
                <form:errors path="firstname" class = "control-label" />
            </div>
        </div>
    </spring:bind>


    <spring:bind path="lastname">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Last name</label>
            <div class="col-sm-10">
                <form:input path="lastname" class="form-control"
                            id="lastname" placeholder="lastname" />
                <spring:message code="label.lastname" />
                <form:errors path="lastname" class="control-label" />
            </div>
        </div>
    </spring:bind>






    <spring:bind path="login">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Login</label>
            <div class="col-sm-10">
                <form:input path="login" class="form-control"
                            id="login" placeholder="Login" />
                <spring:message code="label.login" />
                <form:errors path="login" class="control-label" />
            </div>
        </div>
    </spring:bind>

    <spring:bind path="password">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <form:password path="password" class="form-control"
                               id="password"  />
                <spring:message code="label.password" />
                <form:errors path="password" class="control-label" />
            </div>
        </div>
    </spring:bind>


    <spring:bind path="email">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <form:input path="email" class="form-control"
                            id="email" placeholder="email" />
                <spring:message code="label.email" />
                <form:errors path="email" class="control-label" />
            </div>
        </div>
    </spring:bind>

    <spring:bind path="birthdate">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Birth date</label>
            <div class="col-sm-10">
                <form:input path="birthdate" class="form-control"
                            id="birthdate" placeholder="Birthdate" />
                <spring:message code="label.birthdate" />
                <form:errors path="birthdate" class="control-label" />
            </div>
        </div>
    </spring:bind>


    <spring:bind path="phone">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <label class="col-sm-2 control-label">Phone</label>
            <div class="col-sm-10">
                <form:input path="phone" class="form-control"
                            id="phone" placeholder="Phone" />
                <spring:message code="label.phone" />
                <form:errors path="phone" class="control-label" />
            </div>
        </div>
    </spring:bind>

<h1 class="form-group">Are you human?</h1> <font color="red">${message}</font>
<br/>
<form action="/HelloController/main" method="post">
    <sc:captcha />
    <tr>
        <td colspan="2"><input type="submit"></td>
    </tr>
    td colspan="2"><input type="submit"
                          value="<spring:message code="label.adduser"/>" /></td>
        </form>


    </form:form>
    <a href="${pageContext.request.contextPath}/" title="Home">Home</a>
</body>
<footer>&copy Copyright by Natalia K</footer>
</html>

