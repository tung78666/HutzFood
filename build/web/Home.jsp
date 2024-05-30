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
        <title>Home_Lib</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/f-icon.png" type="image/gif" />
        <style>
            #banner{
                position: relative;
                overflow: hidden;
                z-index: 0;
            }
            #upper-con {
                display: flex;
                width: 80%;
                padding: 10px;
                background: lightgrey;
                box-sizing: border-box;
                border-collapse: collapse;
                border: 2px solid;
                border-radius: 20px;
                z-index: 1;
                position: absolute;
                top: 300px;
                left: 140px;
            }

            upper-Statement{
                font-size: 2.6rem;
                line-height: 1.1;
                font-weight: 300;
                margin: 0px 0px 2rem;
            }
            #container{
                display: flex;
                max-width: 100%;
                height: auto;
                margin: 0 auto;
            }
            #main-image{
                display: flex;
                width: 100%;
                height: 100%;
            }
            #booklist{
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;

            }
            #tag-1{
                display: flex;
                width: fit-content;
                padding: 10px;
                background: lightgrey;
                box-sizing: border-box;
                border-collapse: collapse;
                border: 2px solid;
                border-radius: 20px;
                z-index: 1;
                position: relative;
                left: 45%;
            }
        </style>
    </head>
    <body style="background-color: #3a5e71">
        <jsp:include page="Header.jsp" />
        <div id="banner">
            <img src="images/Home-backgroud.png" style="width: 100% "/>
            <table id="upper-con">
                <tr >
                    <td rowspan="2" id="container" style="">
                        <img id="main-image" alt="Library Logo" src="images/main-icon.png" style="background-color: #f5f5f7;border-radius: 25px">
                    </td>
                    <td style="border-collapse: collapse;border-right: 2px solid;border-left: 2px solid">
                        <h1 id="upper-Statement" style="display: flex;">
                            <p><strong>The ASE</strong>(All Seeing EYES) is a non-profit
                                library of your needs for all kind of purpose no restricted(As long as the Interpol doesn't care).
                            </p>
                        </h1>
                        <form class="" role="search" style="display: flex;flex-direction: row" action="Home" method="post">
                            
                            <input class="form-control" style="" type="search" placeholder="Search" aria-label="Search" name="SearchBar">
                            <button class="btn btn-outline-success bg-info" style="color: background ;"  type="submit">Search</button>
                            <div>
                                <input type="radio" name="searchBY" value="Name" checked/>Search Name<br/>
                                <input type="radio" name="searchBY" value="ID" />Search ID
                            </div>
                        </form>
                    </td>
                    <td rowspan="2" id="container" style="">
                        <img id="main-image" alt="Library Logo" src="images/main-icon.png" style="background-color: #f5f5f7;border-radius: 25px">
                    </td>
                </tr>
            </table>
            <div id="tag-1">
                <h1 style=";text-align: center;">Feature</h1>
            </div>
            <div id="booklist">

                <c:forEach items="${requestScope.FeatureBooks}" var="b">
                    <div style="padding-bottom: 25px;">
                        <div class="card" style="width: 18rem;word-wrap: break-word;overflow-wrap: break-word;">
                            <img src="${b.getCoverPath()}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${b.getTitle()}</h5>
                                <p class="card-text">
                                    <c:if test="${b.getBriefly()==null}">
                                        Null
                                    </c:if>
                                    <c:if test="${b.getBriefly()!=null}">
                                        ${b.getBriefly()}
                                    </c:if>    
                                </p>
                                <form action="DetailServlet" method="post">
                                    <button  class="btn btn-primary" type="submit" name="BID" value="${b.getBookID()}" >Details</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div id="tag-1">
                <h1 style=";text-align: center;">New Books</h1>
            </div>
            <div id="booklist">

                <c:forEach items="${requestScope.NewBooks}" var="b">
                    <div style="padding-bottom: 25px;">
                        <div class="card" style="width: 18rem;word-wrap: break-word;overflow-wrap: break-word;">
                            <img src="${b.getCoverPath()}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${b.getTitle()}</h5>
                                <p class="card-text">
                                    <c:if test="${b.getBriefly()==null}">
                                        Null
                                    </c:if>
                                    <c:if test="${b.getBriefly()!=null}">
                                        ${b.getBriefly()}
                                    </c:if>    
                                </p>
                                <form action="DetailServlet" method="post">
                                    <button  class="btn btn-primary" type="submit" name="BID" value="${b.getBookID()}" >Details</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
    </body>
</html>
