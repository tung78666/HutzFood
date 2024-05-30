<%-- 
    Document   : Recommend
    Created on : Mar 8, 2024, 3:44:58 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!D%OCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recommend</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <style>
            #upper-form{
                background: lightgrey;
                border: 2px solid;
                border-radius: 20px;

                width: 80%;
                padding: 10px;
                z-index: 1;
                position: absolute;
                top: 80px;
                left: 140px;
                text-align: center;

            }
            #headline{
                background-color: #f5f5f7;
                border-radius: 15px;
                align-self: center;
                padding: 10px;
                border: 2px solid;
                width: fit-content;
                position: relative;
            }
            #f1{
                background-color: #faeddd;
                border: 2px solid;
                width: fit-content;
                align-self: center;
                padding: 50px;
                position: relative;
                left: 10%
            }
        </style>
    </head>
    <body>
        <c:set var="acc" value="${sessionScope.account}"/>
        <jsp:include page="Header.jsp"/>
        <img src="images/recommend-background.jpg" alt="alt" style="width: 100%;z-index: 0;"/>
        <div id="upper-form">
            <h3 id="headline" style="">${requestScope.Books.getTitle()} by ${requestScope.Books.getAuthorName()}</h3><br/>
            <iframe id="myIframe" src="${requestScope.Books.geteBookPath()}" width="100%" onload="resizeIframe(this)"></iframe>

            <script>
                function resizeIframe(iframe) {
                    iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
                }
            </script>
        </div>
    </body>
</html>
