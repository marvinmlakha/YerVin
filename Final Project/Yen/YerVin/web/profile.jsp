<%-- 
    Document   : profile
    Created on : Apr 14, 2022, 6:43:11 PM
    Author     : EricC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/assets/headerFooter/headerNav.jsp" />
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
<c:import url="/assets/headerFooter/footer.jsp" />
