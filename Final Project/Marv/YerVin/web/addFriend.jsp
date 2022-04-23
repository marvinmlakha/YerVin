<%-- 
    Document   : addFriend
    Created on : Apr 21, 2022, 8:08:14 PM
    Author     : mlakh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Users</h2>
        <table>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Password Hash</th>
            </tr>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.username}" /></td>
                    <td><c:out value="${user.password}" /></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
