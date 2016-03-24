<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Employees page</title>

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
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Employee List</h1>

<c:if test="${!empty getAllEmployee}">
    <table class="tg">
        <tr>
            <th width="80">Id</th>
            <th width="120">Name</th>
            <th width="120">Last Name</th>
            <th width="120">Position</th>
            <th width="120">Department</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${getAllEmployee}" var="employee">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.firstName}</td>
                <td>${employee.lastName}</td>
                <td>${employee.position}</td>
                <td>${employee.department}</td>
                <td><a href="<c:url value='/edit/${employee.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${employee.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add a Employee</h1>

<c:url var="addAction" value="/employee/add"/>

<form:form action="${addAction}" commandName="employee">
    <table>
        <c:if test="${!empty employee.firstName}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="Id"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="firstName">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="firstName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName">
                    <spring:message text="Last Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="lastName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="position">
                    <spring:message text="Position"/>
                </form:label>
            </td>
            <td>
                <form:input path="position"/>
            </td>
        </tr>
        <tr>
        <tr>
            <td>
                <form:label path="department">
                    <spring:message text="Department"/>
                </form:label>
            </td>
            <td>
                <form:input path="department"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty employee.firstName}">
                    <input type="submit"
                           value="<spring:message text="Edit Employee"/>"/>
                </c:if>
                <c:if test="${empty employee.firstName}">
                    <input type="submit"
                           value="<spring:message text="Add Employee"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
