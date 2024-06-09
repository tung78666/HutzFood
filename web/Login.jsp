<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="./CSSsimple/login.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body style="background:url(image/login.jpg);
          background-size: cover; "  >
        <div id="wrapper">
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                    <a class="navbar-brand" href="Home">Hutz<small>Food</small></a>
                </div>
            </nav>  
            <form action="Login" method="Post" id="form-login">
                <h1 class="form-heading">Login</h1>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" name="email" placeholder="Email" value="${cookie.cemail.value}" required>
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" name="pass" placeholder="Password" value="${cookie.ctoken.value}" required>
                </div>
                <p style="color: red;">${mess}</p>
                <label class="labelRemem">
                    <input type="checkbox" ${cookie.crem.value eq'on'?'checked':''} name="rem" value="on" /> 
                    <a>Remember me</a>
                </label>   
                <div class="forget">
                    <label for=""><a href="ForgotPassword.jsp">Forgot Password</a></label>
                </div>
                <input type="submit" value="Login" class="form-submit">
                <div class="register">
                    <p>Don't have a account? <a href="Register.jsp">Register</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
