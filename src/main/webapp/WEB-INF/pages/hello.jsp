<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<head>
    <link rel="stylesheet" type="text/css" href="<c:url value="../themes/style.css"/>">
</head>
<header>

    <link rel="stylesheet" type="text/css" href="<c:url value="../themes/style.css"/>">
    <h3>Main</h3></header>
<body>
<h1>${message}</h1>
<img src="../photos/photo.jpg" alt="profile image" />

<div id="wrapper">
            <p> <a href="/contacts">Contacts</a></p>
            <p><a href="/in">In</a></p>

</div>
    <table>
<h1 class = "par">Education:</h1>
<div class = "paragraph">
        <p>Zaporozhye Musical College'09</p>
        <p>Donetsk State Music Academy'14</p>
        <p>National Technical University'18</p>

</div>

<h1 class="par">Languages: </h1>
    <div class="paragraph">
<p>C</p>
    <p>C++</p>
    <p>Java</p>
    <p>JavaScript</p>
</div>

<div>
    <a href="https://github.com/WhiteKNS">GitHub</a>

</div>
        </table>
</body>
<footer>&copy; Published by Natalia K.</footer>
</html>