
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerNav.jsp" />

    <h2>Welcome ${username}!</h2>
    <c:if test="${(filename != null)}">
        <img src="GetImage?username=${username}" width="240" height="300"/>
    </c:if>
    <h3>upload a profile picture!</h3>
    <form action="Upload" method="post" enctype="multipart/form-data">
        <div id="data">
            <input type="file" accept="image/*" name="file">
        </div>
        <div id="buttons">
            <label>&nbsp;</label>
            <input type="submit" value="Upload"><br>
        </div>
    </form>

    <table>
        <tr>
            <th>Img<th>
            <th>Id</th>
            <th>text</th>
            <th>timestamp</th>
            <th>likes</th>
        </tr>
        <c:forEach var="post" items="${posts}">
            <tr>
                <td><c:if test="${(post.filename != null)}">
                <img src="GetPostImage?id=${post.id}" width="240" height="300"/>
                 </c:if></<td>
                <td><c:out value="${post.id}" /></td>
                <td><c:out value="${post.text}" /></td>
                <td><c:out value="${post.timestamp}" /></td>
                <td><c:out value="${post.likes}" /></td>
            </tr>
        </c:forEach>
    </table>
    
<c:import url="/views/footer.jsp" /> 