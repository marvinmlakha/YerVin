
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerNav.jsp" />
        
    <form action="YerVin" method="post">
        <label>Name of user to add as a friend:</label>
        <input type="text" name="friendUsername"/><br>

        <input type="hidden" name="action" value="addFriend"/>

        <input type="submit" value="Add User"/>
    </form>

    <form action="YerVin" method="post">
        <label>Name of user you wish to unfriend</label>
        <input type="text" name="friendUsername"/><br>

        <input type="hidden" name="action" value="removeFriend"/>

        <input type="submit" value="Remove User"/>
    </form>

    <ul>
        <c:forEach var="friend" items="${friends}">
            <li>
                <form action="FriendPage" method="post">
                    <c:out value="${friend.username}"/>
                    <br>
                    <input type="hidden" name="action" value="${friend.username}">
                    <input type="submit" value="See User Page"/>
                </form>
            </li>
        </c:forEach>
    </ul>

<c:import url="/views/footer.jsp" /> 

