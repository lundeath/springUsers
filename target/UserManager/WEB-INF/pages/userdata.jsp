<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page pageEncoding="UTF-8" %>

<html>
<head>
  <title><spring:message code="userdata"/></title>

  <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/tables.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<div>
  <table class="table table-bordered">
  <tr>
    <th width="80">ID</th>
    <th width="120"><spring:message code="first_name"/></th>
    <th width="120"><spring:message code="last_name"/></th>
    <th width="120"><spring:message code="age"/></th>
    <th width="120"><spring:message code="email"/></th>
    <th width="120"><spring:message code="city"/></th>
    <th width="120"><spring:message code="phone"/></th>
  </tr>
  <tr>
    <td>${user.id}</td>
    <td>${user.firstName}</td>
    <td>${user.lastName}</td>
    <td>${user.age}</td>
    <td>${user.email}</td>
    <td>${user.city}</td>
    <td>${user.phone}</td>
  </tr>
</table>
</div>
</body>
</html>