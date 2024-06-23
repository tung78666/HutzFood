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
                <p style="color: red;" id="error-mess">${mess}</p>
                <label class="labelRemem">
                    <input type="checkbox" ${cookie.crem.value eq'on'?'checked':''} name="rem" value="on" style="cursor: pointer;" /> 
                    <a style="cursor: pointer;">Remember me</a>
                </label>   
                <div class="forget">
                    <label for=""><a href="ForgotPassword.jsp">Forgot Password</a></label>
                </div>
                <div class="login-capcha">
                    <div class="g-recaptcha" data-sitekey="6LetIfUpAAAAAIhRNGY5zuehzHggZdvouZ2_wWZi" ></div>
                </div>
                <!--Login button-->    
                <input type="submit" value="Login" class="form-submit">

                <div class="loginGG-button">
                    <div>
                        <a class="button" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/FoodOrder/LoginGoogle&response_type=code&client_id=278095835882-p45gk2r34laln8itkv6csj2rm7oa0ssc.apps.googleusercontent.com&approval_prompt=force">
                            <svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid" viewBox="0 0 256 262">
                            <path fill="#4285F4" d="M255.878 133.451c0-10.734-.871-18.567-2.756-26.69H130.55v48.448h71.947c-1.45 12.04-9.283 30.172-26.69 42.356l-.244 1.622 38.755 30.023 2.685.268c24.659-22.774 38.875-56.282 38.875-96.027"></path>
                            <path fill="#34A853" d="M130.55 261.1c35.248 0 64.839-11.605 86.453-31.622l-41.196-31.913c-11.024 7.688-25.82 13.055-45.257 13.055-34.523 0-63.824-22.773-74.269-54.25l-1.531.13-40.298 31.187-.527 1.465C35.393 231.798 79.49 261.1 130.55 261.1"></path>
                            <path fill="#FBBC05" d="M56.281 156.37c-2.756-8.123-4.351-16.827-4.351-25.82 0-8.994 1.595-17.697 4.206-25.82l-.073-1.73L15.26 71.312l-1.335.635C5.077 89.644 0 109.517 0 130.55s5.077 40.905 13.925 58.602l42.356-32.782"></path>
                            <path fill="#EB4335" d="M130.55 50.479c24.514 0 41.05 10.589 50.479 19.438l36.844-35.974C195.245 12.91 165.798 0 130.55 0 79.49 0 35.393 29.301 13.925 71.947l42.211 32.783c10.59-31.477 39.891-54.251 74.414-54.251"></path>
                            </svg>
                            Continue with Google
                        </a>
                    </div>
                </div>

                <div class="register">
                    <p>Don't have a account? <a href="Register.jsp">Register</a></p>
                </div>
            </form>
        </div>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                let isVaild = false;
                const form = document.getElementById("form-login");
                const error = document.getElementById("error-mess");

                form.addEventListener("submit", function () {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please complete captcha";
                    }
                });
            };
        </script>
        <style>
            .login-capcha{
                display: inline-block;
                justify-items: center;
                padding-top: 30px;
                padding-left: 80px
            }
            .loginGG-button{
                display: flex;
                justify-content:  center;
                padding-top: 10px;
            }
            .button {
                max-width: 320px;
                display: flex;
                padding: 0.5rem 1.4rem;
                font-size: 0.875rem;
                line-height: 1.25rem;
                font-weight: 700;
                text-align: center;
                text-transform: uppercase;
                vertical-align: middle;
                align-items: center;
                border-radius: 0.5rem;
                border: 1px solid rgba(0, 0, 0, 0.25);
                gap: 0.75rem;
                color: rgb(65, 63, 63);
                background-color: #fff;
                cursor: pointer;
                transition: all .6s ease;
            }

            .button svg {
                height: 24px;
            }
        </style>
    </body>
</html>
