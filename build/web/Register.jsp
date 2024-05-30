<%-- 
    Document   : login
    Created on : Feb 20, 2024, 4:11:07 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
    </head>
    <body style="background-image: url('images/Begin-background.jpg')">
        <jsp:include page="Header.jsp"/>
        <div style="padding-top: 100px ;">
            <div style="padding: 12px;margin: 0 auto;width: 40%;margin-top: 50px;border: #000;border: 2px solid;border-radius: 20px; background-color: #9fcdff">
                <h4>Login Form</h4>
                <h6 style="color: red">${requestScope.error}</h6>
                <form action="Register" method="post">
                    <div class="form-group">
                        <label>ID</label>
                        <input class="form-control" type="text" name="ID"/>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input class="form-control" type="text" name="Email"/>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input class="form-control" type="text" name="Name"/>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input class="form-control" type="password" name="Pass"/>
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input class="form-control" type="password" name="cPass"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Create Account</button>
                    <button type="reset" class="btn btn-danger">Reset</button>
                </form>
            </div>
        </div>
    </body>
</html>
