<%-- 
    Document   : eBook
    Created on : Mar 4, 2024, 10:44:02 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/f-icon.png" type="image/gif" />
        <style>
            #booklist{
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;

            }
            #upper-form{
                background: lightgrey;
                box-sizing: border-box;
                border-collapse: collapse;
                border: 2px solid;
                border-radius: 20px;
            }
            #upper-form{
                display: flex;

                width: 80%;
                padding: 10px;
                z-index: 1;
                position: absolute;
                top: 80px;
                left: 140px;

            }
            #upper-con{
                display: flex;
                width: 80%;
                padding: 10px;
                z-index: 1;
                position: absolute;
                top: 300px;
                left: 140px;

            }
        </style>
    </head>
    <body style="background-color: #fbe5a9">
        <jsp:include page="Header.jsp"/>
        <img src="images/background-1.jpg" alt="alt" style="width: 100%;height: auto;z-index: 0"/>
        <div >
            <div id="upper-form">
                <h3 style="background-color: #f5f5f7;border-radius: 15px;align-self: center;padding: 10px;border: 2px solid">Physical Books</h3>
                <form id="" style="" action="PhyBookServlet" method="post">
                    <div>
                        <input type="radio" name="searchBY" value="Name" checked/>Search Name
                        <input type="radio" name="searchBY" value="ID" />Search ID
                    </div>
                    <nav class="" role="search" style="display: flex;flex-direction: row" >
                        <input class="form-control" style="" type="search" placeholder="Search by Name/ID" aria-label="Search" name="searchBar">
                        <button class="btn btn-outline-success bg-info" style="color: background ;"  type="submit">Search</button>
                    </nav>
                    <div>
                        <input type="radio" name="filter" value="byNameAsc"/>Filter by Name ASC
                        <input type="radio" name="filter" value="byNameDes" />Filter by Name DES
                        <input type="radio" name="filter" value="byIDAsc"/>Filter by ID ASC
                        <input type="radio" name="filter" value="byIDDes"/>Filter by ID DES


                    </div>
                </form>
            </div>
            <br/>
            <div id="upper-con">
                <div id="booklist" >
                    <c:forEach items="${requestScope.Books}" var="b">
                        <div style="padding-bottom: 25px;">
                            <div class="card" style="width: 18rem;word-wrap: break-word;overflow-wrap: break-word;">
                                <img src="${b.getCoverPath()}" class="card-img-top" alt="">
                                <div class="card-body">
                                    <h5 class="card-title">${b.getTitle()}</h5>
                                    <h6>ID: ${b.getBookID()}</h6>
                                    <form action="DetailServlet" method="post">
                                        <button  class="btn btn-primary" type="submit" name="BID" value="${b.getBookID()}" >Details</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </body>
</html>
