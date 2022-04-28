
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerNav.jsp" />
                
    <table>
     <tr>
         <th>User Image</th>
         <th>User Name</th>
         <th>Img<th>
         <th>Id</th>
         <th>text</th>
         <th>timestamp</th>
         <th>likes</th>
     </tr>
        <c:forEach var="post" items="${friendPosts}">
            <tr>
                <td><c:if test="${(filename != null)}">
                    <img src="GetImage?username=${post.username}" width="50" height="75"/>
                    </c:if></td>
                <td>${post.username}</td>
                <td><c:if test="${(post.filename != null)}">
                <img src="GetPostImage?id=${post.id}" width="240" height="300"/>
                 </c:if></<td>
                <td><c:out value="${post.id}" /></td>
                <td><c:out value="${post.text}" /></td>
                <td><c:out value="${post.timestamp}" /></td>
                <td><c:out value="${post.likes}" /></td>
                <td>
                    <form action="LikeHome" method="post">
                        <input type="hidden" name="action" value="${post.id}">
                        <input type="submit" value="Like"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

<c:import url="/views/footer.jsp" /> 