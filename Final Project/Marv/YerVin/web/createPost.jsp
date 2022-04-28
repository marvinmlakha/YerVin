
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerNav.jsp" />

    <h3>Share you post with the world</h3>
    <br>
    <form action="UploadPost" method="post" enctype="multipart/form-data">
            <label>Share an image (optional)</label><br>
            <label>&nbsp;</label>
            <input type="file" accept="image/*" name="postFile"><br><br>
            
            <label>What would you like to say?</label><br>
            <input type="text" maxlength="250" size ="50" name="text"><br>
            <input type="hidden" name="action" value="createPost"/>
            <input type="submit" value="Post"><br>
    </form>

<c:import url="/views/footer.jsp" /> 


