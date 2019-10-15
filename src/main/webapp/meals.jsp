<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Meal List</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>

<table style="text-align: center">
    <tr>
        <th><c:out value="Date" /></th>
        <th><c:out value="Time" /></th>
        <th><c:out value="Meal Description" /></th>
        <th><c:out value="Meal Calories" /></th>
        <th><c:out value="Exceeded" /></th>
    </tr>

    <c:forEach items="${mealList}" var="meal">
        <tr style="${meal.excess ? 'background-color: red':'background-color: green'}">
            <td><c:out value="${meal.dateTime.toLocalDate()}" /></td>
            <td><c:out value="${meal.dateTime.toLocalTime()}" /></td>
            <td><c:out value="${meal.description}" /></td>
            <td><c:out value="${meal.calories}" /></td>
            <td><c:out value="${meal.excess}" /></td>
        </tr>
    </c:forEach>
</table>


<form action="meals" method="POST">
    Add new meal:
    <br>
    <input type="text" name="description" id="description">
    <br>
    <input type="text" name="calories" id="calories">
    <br>
    <input type="submit" value="Submit">
</form>


</body>
</html>
