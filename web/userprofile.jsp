<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.User" %>
<%@ page import="Model.Role" %>
<%@ page import="Model.UserStatus" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    // Assuming 'account' is a User object stored in the session scope
    User account = (User) session.getAttribute("account");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDOB = "";
    if (account != null && account.getDOB() != null) {
        formattedDOB =dateFormat.format(account.getDOB());
    }

    // Get the user from the session
    User user = (User) session.getAttribute("account");

    // Initialize roleName and userStatusName
    String roleName = "";
    String userStatusName = "";

    // Check if user is not null
    if (user != null) {

        Role role = user.getRole();
        UserStatus userStatus = user.getUserStatus();

        // Get the names
        if (role != null) {
            roleName = role.getName();
        }
        if (userStatus != null) {
            userStatusName = userStatus.getName();
        }
    }
%>
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
                    My Profile
                </h2>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="form_container">
                        <p style="color: greenyellow">${mess}</p>
                        <p style="color: red">${error}</p>
                        <form method="post" action="Profile">
                            <input value="${sessionScope['account'].getId()}" name="id" type="hidden">
                            <div>
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" name="name" value="${sessionScope['account'].getName()}" />
                            </div>
                            <div>
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" value="${sessionScope['account'].getEmail()}" readonly />
                            </div>
                            <div>
                                <label class="form-label">Role</label>
                                <input type="text" class="form-control" value="<%= roleName %>" readonly />
                            </div>
                            <div>
                                <label class="form-label">UserStatus</label>
                                <input type="text" class="form-control" value="<%= userStatusName %>" readonly />
                            </div>
                            <div>
                                <label class="form-label">Point</label>
                                <input type="text" class="form-control"value="${sessionScope['account'].getPoint()}" readonly />
                            </div>
                            <div>
                                <label class="form-label">Date of Birth</label>
                                <input type="date" class="form-control" name="DOB" placeholder="MM-DD-yyyy" min="1970-01-01" max="2008-06-11" value="<%=formattedDOB%>" />
                            </div>
                            <div>
                                <label class="form-label">Phone Number</label>
                                <input type="text" class="form-control" name="phone" value="${sessionScope['account'].getPhone()}" />
                            </div>
                            <div>
                                <label class="form-label">Location 1</label>
                                <input type="text" class="form-control" name="loc1" value="${sessionScope['account'].getLocation1()}" />
                            </div>
                            <div>
                                <label class="form-label">Location 2</label>
                                <input type="text" class="form-control" name="loc2" value="${sessionScope['account'].getLocation2()}" />
                            </div>
                            <div type="submit" class="btn_box">
                                <button>
                                    Edit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <a href="ChangePassword.jsp" class="change-container">
                    <span class="change">Change password</span>
                </a>
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
    <!-- Google Map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
    </script>
    <!-- End Google Map -->

</body>

</html>