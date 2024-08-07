<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.User" %>
<%@ page import="Model.Role" %>
<%@ page import="Model.UserStatus" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSSsample/userProfile.css">
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
        <style>

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            /* Add some styling to the header */
            header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

            /* Add some styling to the form container */
            .ipform {
                margin: 100px auto;
                max-width: 600px;
                padding: 20px;
                border: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            /* Style the form elements */
            form {
                display: flex;
                flex-direction: column;
            }

            h3 {
                text-align: center;
                margin-bottom: 20px;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="email"] {
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }



            .change {
                color: #fff;
                font-size: 18px;
                font-weight: normal; /* Adjust the font weight as needed */
                text-decoration: none;
                margin-left: 350px;
            }

            .change:hover {
                text-decoration: underline;
            }


            .editprofile {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .editprofile:hover {
                background-color: #0056b3;
            }

            p {
                color: #d50000; /* Red color for error messages */
                margin-bottom: 10px;
            }

            /* Add some styling to the footer */
            footer {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div style="margin-top: 200px; margin-left: 462px" class="ipform">

            <form method="post" action="Profile" >
                <h3>My Profile</h3>
                <label class="nameprofile">Name</label><input class="nameprofile1" type="text" value="${sessionScope['account'].getName()}" name="name"><br/>
                <label class="emailprofile">Email</label><input readonly class="emailprofile1" value="${sessionScope['account'].getEmail()}" name="email"><br/>
                <label class="nameprofile">Role</label><input readonly class="nameprofile1" type="text" value="<%= roleName %>" ><br/>
                <label class="nameprofile">UserStatus</label><input readonly class="nameprofile1" type="text" value="<%= userStatusName %>"><br/>
                <label class="nameprofile">Point</label><input readonly class="nameprofile1" type="text" value="${sessionScope['account'].getPoint()}" ><br/>
                <label class="nameprofile">Date of Birth</label><input class="nameprofile1" placeholder="MM-DD-yyyy" type="date" min="1970-01-01" max="2008-06-11" value="<%=formattedDOB%>" name="DOB"><br/>
                <label class="nameprofile">Phone Number</label><input class="nameprofile1" type="number" value="${sessionScope['account'].getPhone()}" name="phone"><br/>
                <label class="nameprofile">Location 1</label><input class="nameprofile1" type="text" value="${sessionScope['account'].getLocation1()}" name="loc1"><br/>
                <label class="nameprofile">Location 2</label><input class="nameprofile1" type="text" value="${sessionScope['account'].getLocation2()}" name="loc2"><br/>
                <a href="ChangePassword.jsp" class="change-container">
                    <span class="change">Change password</span>
                </a>
                <input value="${sessionScope['account'].getId()}" name="id" type="hidden">
                <p style="color: greenyellow">${mess}</p>
                <p style="color: red">${error}</p>
                <input style="background: #c49b63; color: white" class="editprofile" type="submit" value="Edit"> 
            </form>
        </div>
        <div style="margin-bottom: 100px"></div>
        <jsp:include page="Footer.jsp"/>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
