<%--
  Created by IntelliJ IDEA.
  User: yurii.ukrainets
  Date: 9/24/2018
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<h1>User Details</h1>

<table class="tg">
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

<c:url var="editAction" value='/submitChanges/${user.id}'/>

<form:form action="${editAction}" commandName="user">
    <table class="zui-table">
        <tr>
            <td>
                <form:label path="id">
                    <spring:message text="ID"/>
                </form:label>
            </td>
            <td>
                    <%--<form:input path="id" readonly="true" size="8" disabled="true"/>--%>
                <input type="text" name="id" value="<c:out value='${user.id}'/>" disabled/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="firstName">
                    <spring:message text="First Name"/>
                </form:label>
            </td>
            <td>
                <input type="text" name="firstName" value="<c:out value='${user.firstName}'/>"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName">
                    <spring:message text="Last Name"/>
                </form:label>
            </td>
            <td>
                <input type="text" name="lastName" value="<c:out value='${user.lastName}'/>"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <input type="text" name="age" value="<c:out value='${user.age}'/>"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="email">
                    <spring:message text="Email"/>
                </form:label>
            </td>
            <td>
                <input type="text" name="email" value="<c:out value='${user.email}'/>"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="city">
                    <spring:message text="City"/>
                </form:label>
            </td>
            <td>
                <input type="text" name="city" value="<c:out value='${user.city}'/>"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="phone">
                    <spring:message text="Phone"/>
                </form:label>
            </td>
            <td>
                <input type="text" name="phone" value="<c:out value='${user.phone}'/>"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Submit Changes"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
