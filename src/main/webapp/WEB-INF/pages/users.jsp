<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="/WEB-INF/TLDs/custom-tag.tld" prefix="m" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page session="false" %>
<html>
<head>
    <title><spring:message code="title"/> </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.18/b-1.5.4/fh-3.1.4/r-2.2.2/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.js"></script>

</head>
<body>
<a style="margin-bottom: 15px;margin-top:10px" href="<c:url value='/logout'/>" class="btn btn-info"><spring:message code="logout"/></a>
<c:if test="${!empty listUsers}">
<div class="container">
    <table id="users" class="table table-striped">
        <thead>
        <tr>
            <th ># </th>
            <th ><spring:message code="first_name"/></th>
            <th ><spring:message code="last_name"/> </th>
            <th ><spring:message code="age"/></th>
            <th ><spring:message code="email"/></th>
            <th ><spring:message code="city"/> </th>
            <th ><spring:message code="phone"/></th>
            <th ><spring:message code="role"/></th>
            <th ></th>
            <th ></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td >${user.id}</td>
                <td ><a href="/userdata/${user.id}" target="_blank">${user.firstName}</a></td>
                <td >${user.lastName}</td>
                <td >${user.age}</td>
                <td >${user.email}</td>
                <td >${user.city}</td>
                <td >${user.phone}</td>
                <td >${user.role.name}</td>
                <td><a href="<c:url value='/edit/${user.id}'/>"><spring:message code="edit"/></a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>"><spring:message code="delete"/></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    </c:if>
    <a href="<c:url value='/register'/>" class="btn btn-info"><spring:message code="add_user"/> </a><br>
    <div class="dropdown">
        <button style="margin-top: 15px" class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><spring:message code="language"/></button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="?lang=en">
                <img border="0" alt="W3Schools" src="https://cdn0.iconfinder.com/data/icons/flags-of-the-world-2/128/england-3-512.png"
                     width="30" height="25">
            </a>
            <a class="dropdown-item" href="?lang=ua">
                <img border="0" alt="W3Schools" src="https://cdn.countryflags.com/thumbs/ukraine/flag-waving-250.png"
                     width="30" height="25">
            </a>
        </div>
    </div>


<br>
<br>


</body>
</html>
<script>
    $(document).ready( function () {
        $('#users').DataTable();
    } );
    $('#users').DataTable( {
        rowReorder: {
            selector: 'tr'
        },
        "processing": true,
    } );
</script>
