<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
  <title>UserData</title>

  <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/tables.css">

</head>
<body>
<div class="container">
  <table class="responsive-table">
    <caption>User Details</caption>
  <tr>
    <th width="80">ID</th>
    <th width="120">First Name</th>
    <th width="120">Last Name</th>
    <th width="120">Age</th>
    <th width="120">Email</th>
    <th width="120">City</th>
    <th width="120">Phone</th>
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