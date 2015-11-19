
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <link rel="stylesheet" type="text/css" href="<c:url value="../themes/style.css"/>">
    <title>Contacts</title>
</head>
<header><h3>Contacts</h3></header>
<body>

<div id="wrapper">
    <p> <a href="/">Main</a></p>
    <p> <a href="/contacts">Contacts</a></p>
    <p><a href="/in">In</a></p>

</div>
<div id="contacts">
    <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
            src="https://maps.google.ru/?ie=UTF8&amp;t=m&amp;ll=47.81961,35.231781&amp;spn=0.080685,0.145912&amp;z=12&amp;output=embed">
    </iframe><br />
    <p>Country: <strong>Ukraine</strong></p>
    <p>Region: <strong>Zaporozhye</strong></p>
    <p>City: <strong>Zaporozhye</strong></p>
    <p>Phone: <strong>12345678</strong></p>
</div>
</body>
<footer>&copy; Published by Natalia K.</footer>
</html>
