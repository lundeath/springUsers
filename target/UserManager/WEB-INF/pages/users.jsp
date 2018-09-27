<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="/WEB-INF/TLDs/custom-tag.tld" prefix="m" %>
<%@ page session="false" %>
<html>
<head>
    <title>User Manager</title>
    <m:today/>
    <a href="<c:url value='/logout'/>" class="button">Logout</a>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/tables.css">
</head>
<body>

<br/>
<br/>



<c:if test="${!empty listUsers}">
<div class="container">
    <table class="responsive-table">
        <caption>User Manager</caption>
        <thead>
        <tr>
            <th width="80">ID</th>
            <th width="120">First Name</th>
            <th width="120">Last Name</th>
            <th width="120">Age</th>
            <th width="120">Email</th>
            <th width="120">City</th>
            <th width="120">Phone</th>
            <th width="120">Role</th>
        </tr>
        </thead>

        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td scope="col">${user.id}</td>
                <td scope="col"><a href="/userdata/${user.id}" target="_blank">${user.firstName}</a></td>
                <td scope="col">${user.lastName}</td>
                <td scope="col">${user.age}</td>
                <td scope="col">${user.email}</td>
                <td scope="col">${user.city}</td>
                <td scope="col">${user.phone}</td>
                <td scope="col">${user.role.name}</td>
                <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
        <a href="<c:url value='/register'/>" class="button">Add another user  </a><br>

    </table>
</c:if>
</div>
<br>
<br>



</body>
</html>


