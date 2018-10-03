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

    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/tables.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="js/sorting.js" defer></script>
    <script src="js/dropList.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<a href="<c:url value='/logout'/>" class="btn btn-info">Logout</a>
<br/>
<br/>


<c:if test="${!empty listUsers}">
<div>
    <table id="users" class="table table-striped">
        <thead>
        <tr>
            <th >ID</th>
            <th >First Name</th>
            <th style="cursor: pointer" onclick="sortTable(2)">Last Name &#8597</th>
            <th >Age</th>
            <th >Email</th>
            <th style="cursor: pointer" onclick="sortTable(5)">City &#8597</th>
            <th >Phone</th>
            <th >Role</th>
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

    </table>
    <button id="showMore" class="btn btn-secondary" onclick="showMore()">Show more</button>
    </c:if>
    <a href="<c:url value='/register'/>" class="btn btn-success">Add another user </a><br>

</div>

<br>
<br>


</body>
</html>

