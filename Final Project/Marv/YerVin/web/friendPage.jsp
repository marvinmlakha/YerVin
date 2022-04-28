
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerNav.jsp" />
    
    <c:if test="${(filename == null)}">
        <img src="GetImage?username=${friendPage.username}" width="100" height="150"/>
    </c:if>
        <h1>${friendPage.username}</h1>
    
    <c:forEach var="post" items="${friendPosts}">
            <br>
            <c:if test="${(post.filename != null)}">
                <img src="GetPostImage?id=${post.id}" width="240" height="300"/>
            </c:if>
                <li><c:out value="${post.text}" />
                <br>
                <c:out value="${post.timestamp}" />
                <br>
                <c:out value="${post.likes}" /></li>
        </c:forEach>

<c:import url="/views/footer.jsp" /> 