
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerNav.jsp" />

        <c:forEach var="post" items="${friendPosts}">
            <c:if test="${(filename != null)}">
                <img src="GetImage?username=${post.username}" width="50" height="75"/>
                <p>${post.username}</p>
            </c:if>
            <c:if test="${(post.filename != null)}">
                <img src="GetPostImage?id=${post.id}" width="240" height="300"/>
            </c:if>
                <li><c:out value="${post.text}" />
                <br>
                <c:out value="${post.timestamp}" />
                <br>
                <c:out value="${post.likes}" /></li>
                <form action="LikeHome" method="post">
                    <br>
                    <input type="hidden" name="action" value="${post.id}">
                    <input type="submit" value="Like"/>
                </form>
        </c:forEach>

<c:import url="/views/footer.jsp" /> 