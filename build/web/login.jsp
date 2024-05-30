<%-- 
    Document   : login
    Created on : Feb 20, 2024, 4:11:07 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/f-icon.png" type="image/gif" />
    </head>
    <body style="background-image: url('images/Begin-background.jpg')">
        <jsp:include page="Header.jsp"/>
        <div style="padding-top: 100px ;">
            <div style="padding: 10px;margin: 0 auto;width: 40%;border: #000;border: 2px solid;border-radius: 20px; background-color: #9fcdff">
                <h4>Login Form</h4>
                <h6 style="color: red">${requestScope.error}</h6>
                <form action="login" method="post">
                    <div class="form-group">
                        <label>Username / Email</label>
                        <input class="form-control" type="text" name="user" value="${cookie.cuser.value}"/>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input class="form-control" type="password" name="pass" value="${cookie.cpass.value}"/>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" ${cookie.crem.value eq'on'?'checked':''} name="rem" value="on"
                               style="margin-right: 10px"/>Remember me
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                    <button type="reset" class="btn btn-danger">Reset</button>
                </form>
            </div>
        </div>
    </body>
</html>
