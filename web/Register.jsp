<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="images/favicon.png" type="">

    <title> HUTZ FOOD </title>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="themes/css/bootstrap.css" />

    <!--owl slider stylesheet -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <!-- nice select  -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
        integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
        crossorigin="anonymous" />
    <!-- font awesome style -->
    <link href="themes/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="themes/css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="themes/css/responsive.css" rel="stylesheet" />

    <style>
        .loginGG-button {
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
</head>

<body class="sub_page">

    <div class="hero_area">
        <div class="bg-box">
            <img src="themes/images/hero-bg.jpg" alt="">
        </div>
        <!-- start header section -->
        <jsp:include page="header.jsp"/>  
        <!-- end header section -->
    </div>

    <!-- book section -->
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>
                    Register
                </h2>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="form_container">
                        <p style="color: red;" id="error-mess">${messregis}</p>
                        <form action="Register" method="Post" id="form-login">
                            <div>
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" name="name" placeholder="" value="${name}" required />
                            </div>
                            <div>
                                <label class="form-label">Date of birth</label>
                                <input autocomplete="off" 
                                    class="form-control" 
                                    id="MoveInDate" 
                                    name="DOB" 
                                    placeholder="MM-dd-yyyy" 
                                    type="date" 
                                    min="1970-01-01" 
                                    max="2008-06-11" 
                                    spellcheck="false" 
                                    value="${DOB != null ? DOB : '2000-01-01'}" />
                            </div>
                            <div>
                                <label class="form-label">Phone</label>
                                <input type="text" class="form-control" name="phone" placeholder="" value="${phone}" required />
                            </div>
                            <div>
                                <label class="form-label">Email</label>
                                <input type="text" class="form-control" name="email" placeholder="" value="${email}" required />
                            </div>
                            <div>
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="pass"
                                    pattern=".{8,20}"
                                    title="Password must be at least 8 to 20 characters!!!"
                                    placeholder="" value="${pass}" required />
                            </div>
                            <div>
                                <label class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" name="confirmpass" value="${confirmpass}" placeholder="" required />
                            </div>
                            <div class="g-recaptcha" data-sitekey="6LetIfUpAAAAAIhRNGY5zuehzHggZdvouZ2_wWZi" ></div>
                            <button type="submit" class="btn_box">
                                Login
                            </button>
                        </form>
                        <div class="loginGG-button">
                            <div>
                                <a class="button" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/HutzFood/LoginGoogle&response_type=code&client_id=278095835882-p45gk2r34laln8itkv6csj2rm7oa0ssc.apps.googleusercontent.com&approval_prompt=force">
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end book section -->

    <!-- footer section -->
    <jsp:include page="Footer.jsp"/>   
    <!-- footer section -->

    <!-- jQery -->
    <script src="themes/js/jquery-3.4.1.min.js"></script>
    <!-- popper js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
    <!-- bootstrap js -->
    <script src="themes/js/bootstrap.js"></script>
    <!-- owl slider -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
    </script>
    <!-- isotope js -->
    <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
    <!-- nice select -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <!-- custom js -->
    <script src="themes/js/custom.js"></script>
    
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

</body>

</html>