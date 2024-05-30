<%-- 
    Document   : PassChange
    Created on : Mar 12, 2024, 4:14:27 PM
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
                <form action="passchange" method="post">
                    <div class="form-group">
                        <label>Username</label>
                        <input class="form-control" type="text" name="user" />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input class="form-control" type="text" name="email" />
                    </div>
                    <div class="form-group">
                        <label>Old Password</label>
                        <input class="form-control" type="password" name="opass"/>
                    </div>
                    <div class="form-group">
                        <label>New Password</label>
                        <input class="form-control" type="password" name="npass"/>
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input class="form-control" type="password" name="cnpass"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-danger">Reset</button>
                </form>
            </div>
        </div>
    </body>
</html>
