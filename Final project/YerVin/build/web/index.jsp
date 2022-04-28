
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:import url="/views/headerPlain.jsp" />

    <div id="links">
        <form action="Login" method="post">       
            <label>Have an existing account?</label>
            <br>
            <input type="hidden" name="action" value="loginPage"/>
            <input type="submit" value="Login Account"/>
        </form>
        <br>
        <form action="Login" method="post">   
            <label>Create a new account:</label>
            <br>
            <input type="hidden" name="action" value="registerPage"/>
            <input type="submit" value="Register Account"/>
        </form>          
    </div>

<c:import url="/views/footer.jsp" />  