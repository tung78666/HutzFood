
<%-- 
    Document   : Home
    Created on : Mar 1, 2024, 5:13:44 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <title>Home_Lib</title>-->
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <style>
            #header{
                padding-top: 5px;
                padding: 2px;
                float: right;
                z-index: 2;
                position: fixed;
                width: 100%

            }
            /*            li{
                            display: flex;
                            flex-direction: row;
                            padding: auto ;
                            align-items: center;
                        }*/

            #bs {
                z-index: 3;
                background-color: lightblue;
            }
            #rs {

                right: 0px;
                width: 200px;
                padding: 10px;
                display: flex;
                align-self: center;
            }
            #ulHeader{
                padding: 3px ;border-radius: 20px;width: 100% ; background-color: #ffb729
            }
            #ls{
                position: relative;
                left: 0px;

                display: flex;
                align-self: center;
                border: 2px solid ;
                border-color: #f5f5f7;
                border-radius: 5px;
                background-color: #db0007
            }
            #hContainer{
                display: flex; flex-direction: row;
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 5px;
                padding-right: 5px;
            }
        </style>
        <!--style="padding: 3px ; background-color: #f5f5f7; border-radius: 10px;margin-left: 5px"-->
    </head>
    <body id="bs">
        <c:set var="acc" value="${sessionScope.account}"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <div id="header">
            <ul class="navbar-nav" id="ulHeader" style="">
                <div id="hContainer">
                    <img src="images/hutzfood_icon.png" class="" style="padding: 3px ; background-color: #f5f5f7; border-radius: 10px;margin-left: 5px;display: flex;align-self: center;border-color: #191919"/>
                    <li class="nav-item " id="ls"style="">
                        <a href="Home" class="nav-link p-2" style="color: #fff;">Home</a>
                    </li>
                    <li class="dropdown "  id="ls" style="padding: auto">
                        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #f5f5f7">
                            Books
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="eBookServlet">eBooks</a></li>
                            <li><a class="dropdown-item" href="PhyBookServlet">Physical Books</a></li>
                        </ul>
                    </li>
                    <li class="nav-item "  id="ls" style="">
                        <a href="RenewServlet" class="nav-link p-2" style="color: #fff;">Renew</a>
                    </li>
                    <li class="nav-item "  id="ls" style="">
                        <a href="return" class="nav-link p-2" style="color: #fff;">Return</a>
                    </li>
                    <li class="nav-item "  id="ls" style="">
                        <a href="favorites" class="nav-link p-2" style="color: #fff;">Favorites</a>
                    </li>
                    <li class="nav-item " id="ls" style="padding: auto">
                        <a href="RecommendServlet" class="nav-link p-2" style="color: #fff;">Recommend</a>
                    </li>
                    <li class="dropdown" id="ls" style="padding: auto">
                        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #f5f5f7">
                            More
                        </button>
                        <c:if test="${acc.isRole()==true}">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="requestBorrow">Request Borrow</a></li>
                                <li><a class="dropdown-item" href="RequestBookServlet">Request Books</a></li>
                                <li><a class="dropdown-item" href="addbook">Add Books</a></li>
                                <li><a class="dropdown-item" href="CUDservlet">Edit/Delete Books</a></li>
                            </ul>
                        </c:if>
                        <c:if test="${acc.isRole()!=true}">
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">WIP</a></li>
                            </ul>
                        </c:if>
                    </li>


                    <c:if test="${acc!=null}">
                        <li class="nav-item " id="rs" style="float :right;position: absolute;">
                            <strong class="" style="">
                                --
                                <div class="dropdown " style="position: relative;">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <strong>Hello ${acc.getName()}</strong>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="passchange">Change Password</a></li>
                                        <li><a class="dropdown-item" href="#">WIP</a></li>
                                    </ul>
                                </div>
                                <!--                        <a style="color: #f5f5f7">| </a>-->
                                <a class="" style="color: #b5303e;position: relative;" href="Logout" class="active ">Logout</a>
                            </strong>
                        </li>
                    </c:if>
                    <c:if test="${acc==null}">
                        <li class="nav-item " id="rs" style="float :right;position: absolute;">
                            <strong class="" style="">
                                <a style="color: #f5f5f7;position: relative" href="login" class="active">Login</a>
                                <a style="color: #f5f5f7;position: relative" class="">| </a>
                                <a style="color: #f5f5f7;position: relative" href="Register" class="active">Register</a>
                            </strong>
                        </li>
                    </c:if>

                </div>
            </ul>
        </div>
    </body>
</html>
