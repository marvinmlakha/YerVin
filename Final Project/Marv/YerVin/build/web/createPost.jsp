<%-- 
    Document   : createPost
    Created on : Apr 22, 2022, 7:19:57 PM
    Author     : mlakh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post</title>
    </head>
    <body>
        <h3>Share you post with the world</h3>
        <br>
        <form action="createPost" method="post">
            <div id="data">
                <label>Share an image (optional)</label><br>
                <label>&nbsp;</label>
                <input type="file" accept="image/*" name="file"><br><br>
                <label>What would you like to say?</label><br>
                <input type="text" maxlength="250" size ="50" name="text"><br>
            </div>
            <div id="buttons">
                <label>&nbsp;</label>
                <input type="submit" value="Post"><br>
            </div>
        </form>
    </body>
</html>
