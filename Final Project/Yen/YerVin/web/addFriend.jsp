<%-- 
    Document   : addFriend
    Created on : Apr 21, 2022, 8:08:14 PM
    Author     : mlakh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/assets/headerFooter/headerPlain.jsp" />
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
<c:import url="/assets/headerFooter/footer.jsp" />
