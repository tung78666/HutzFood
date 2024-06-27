<%-- 
    Document   : Register
    Created on : May 15, 2023, 9:04:59 PM
    Author     : ducnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Register</title>
        <meta name="viewport" content="width=device-width,
              initial-scale=1.0"/>
        <link rel="stylesheet" href="./CSSsimple/register.css">
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
            <form action="Register" method="Post" id="form-login">
                <h1 class="form-heading">REGISTER</h1>

                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" name="name" placeholder="Name" value="${name}" required>
                </div>

                <div class="field moveindate" id="DOBdiv">
                    <label id="DOBLable">Date of birth: </label>
                    <input autocomplete="off" 
                           class="text" 
                           id="MoveInDate" 
                           name="DOB" 
                           placeholder="MM-dd-yyyy" 
                           type="date" 
                           min="1970-01-01" 
                           max="2008-06-11" 
                           spellcheck="false" 
                           value="${DOB != null ? DOB : '2000-01-01'}"/>
                </div>

                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" name="phone" placeholder="PhoneNumber" value="${phone}" required>
                </div>

                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" name="email" placeholder="Email" value="${email}" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input  class="form-input" type="password"
                            name="pass"
                            pattern=".{8,20}"
                            title="Password must be at least 8 to 20 characters!!!"
                            placeholder="Password" value="${pass}" required/>
                </div>

                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="password" class="form-input" name="confirmpass" value="${confirmpass}" placeholder="Confirm Password" required>
                </div>

                <div class="reg-capcha">
                    <div class="g-recaptcha" data-sitekey="6LetIfUpAAAAAIhRNGY5zuehzHggZdvouZ2_wWZi" ></div>
                </div>

                <p style="color: red;" id="error-mess"> ${messregis}</p>

                <input type="submit" value="Register" class="form-submit">
                
                <div class="regGG-button">
                    <div>
                        <a class="button" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/FoodOrder/RegGoogle&response_type=code&client_id=278095835882-p45gk2r34laln8itkv6csj2rm7oa0ssc.apps.googleusercontent.com&approval_prompt=force">
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
            .reg-capcha{
                display: flex;
                justify-content: center; /* Center horizontally */
                align-items: center; /* Center vertically */
            }
            #MoveInDate{
                font-family: 'Roboto', sans-serif;
                -webkit-appearance: none;
                background-color: rgba(128, 128, 128, 0.5);
                opacity: 1;
                flex-grow: 1;
                color: #f5f5f5;
                cursor: pointer;
            }
            #MoveInDate:hover{
                background-color: rgba(128, 128, 128, 1)
            }
            #DOBLable{
                color: #f5f5f5;
                padding-right: 10px;
                padding-top: 5px;
                padding-left: 10px
            }
            #DOBdiv{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            input[type="date"]#MoveInDate::-webkit-calendar-picker-indicator {
                background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 24 24"><path fill="%23bbbbbb" d="M20 3h-1V1h-2v2H7V1H5v2H4c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 18H4V8h16v13z"/></svg>');
            }
            .regGG-button{
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
