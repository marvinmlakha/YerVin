<%-- 
    Document   : login
    Created on : Apr 14, 2022, 6:29:21 PM
    Author     : EricC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/assets/headerFooter/headerPlain.jsp" />

        <h2>${message}</h2>
        <h2>Login</h2>
        <form action="Login" method="post">
            <label>User Name</label>
            <input type="text" name="username"/><br>
            <label>Password</label>
            <input type="password" name="password"/><br>
            
            <input type="hidden" name="action" value="login"/>

            <input type="submit" value="Login"/>
        </form>
        
        <br>
        <p>Create account if you don't have one: <a href="register.jsp" name="action" value="registerPage">Create account</a></p>
<c:import url="/assets/headerFooter/footer.jsp" />
