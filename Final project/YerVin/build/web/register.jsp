
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerPlain.jsp" />

    <h2>Register New Account</h2>
    <form action="Login" method="post">

        <h3>${relay}</h3>

        <label>User Name</label>
        <input type="text" name="username"/><br>
        <label>Password</label>
        <input type="password" name="password"/><br>

        <input type="hidden" name="action" value="register"/>

        <input type="submit" value="Register"/>
    </form>

    <br>
    <p>Log in if you already have an account: <a href="login.jsp"name="action" value="loginPage">Login</a></p>
    
<c:import url="/views/footer.jsp" /> 