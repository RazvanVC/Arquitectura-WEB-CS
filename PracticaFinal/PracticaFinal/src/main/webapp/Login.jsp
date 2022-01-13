<%-- 
    Document   : Login
    Created on : 13 ene 2022, 17:54:14
    Author     : razvanvc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <img src="<%=request.getContextPath()%>/resources/images/logo.png" alt="Logo" width="100" height="100">
        <section>
            <form action="<%=request.getContextPath()%>/Login" method="post">
                <fieldset>
                    <legend>Login</legend>
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" required="required" />
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" required="required" />
                    <input type="submit" value="Login" />
                </fieldset>
            </form>
            <a href="<%=request.getContextPath()%>/Register">Register</a>
        </section>
        
    </body>
</html>
