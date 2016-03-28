<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Employees page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>
<br/>

<div class="form-group searchText" style="width: 600px; margin: auto">
    <h4>Employees search:</h4>
    <c:url var="queryAction" value='/query'/>
    <form:form action="${queryAction}" commandName="query">
        <input id="searchControl" class="form-control" placeholder="Type search text">
        <input type="submit" value="<spring:message text="Search"/>"/>
    </form:form>
</div>

<div class="form-group searchText" style="margin-left: 20px">
    <h4>Add an Employee</h4>
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
</div>

<div>
    <h4>Employee List</h4>
    <c:if test="${!empty getAllEmployee}">
        <table class="table">
            <tr class="danger">
                <th width="60">Id</th>
                <th width="120">Name</th>
                <th width="120">Last Name</th>
                <th width="120">Position</th>
                <th width="120">Department</th>
                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${getAllEmployee}" var="employee">
                <tr class="info">
                    <td>${employee.id}</td>
                    <td>${employee.firstName}</td>
                    <td>${employee.lastName}</td>
                    <td>${employee.position}</td>
                    <td>${employee.department}</td>
                    <td><a href="<c:url value='/edit/${employee.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/delete/${employee.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

</body>
</html>
