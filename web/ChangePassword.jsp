<%-- 
    Document   : ChangePassword
    Created on : Jul 2, 2023, 9:27:34 AM
    Author     : Hoàng Vũ
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSSsample/userProfile.css">
        <title>Coffee</title>
        <style>
            

            h2 {
                color: #333;
               
            }

            form {
                width: 300px;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);

            }
            label {
                display: block;
                margin-bottom: 10px;
                color: white;
            }

            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #1886b7;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div style="margin-top: 200px; margin-left: 539px" class="ipform">
            
            <form action="ChangePassword" method="POST">
                <h2>Change your password</h2>
                <label for="current-password">Old password</label>
                <input type="password" id="current-password" name="oldpass" required><br><br>
                <label for="new-password">New password:</label>
                <input type="password" id="new-password" name="newpass" required><br><br>
                <label for="confirm-password">Confirm password:</label>
                <input type="password" id="confirm-password" name="renewpass" required><br><br>
                <input type="submit" value="Change Password">               
                <p id="key" style="color: red" ></p>
                <p style="color: red;">${mess}</p>
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
