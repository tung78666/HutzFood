<%-- 
    Document   : Renew
    Created on : Mar 7, 2024, 1:02:49 AM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Renew</title>
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
                box-sizing: border-box;
                border-collapse: collapse;
                border: 2px solid;
                border-radius: 20px;

                display: flex;
                width: 80%;
                padding: 10px;
                z-index: 1;
                position: absolute;
                top: 80px;
                left: 140px;

            }
            table{
                width: auto;
                max-width: 80%;
                border-collapse: collapse;
                margin: 20px; /* Optional margin for better appearance */
            }
            th, td {
                padding: 10px;
                border: 1px solid #000;
                text-align: left;
            }
        </style>

    </head>
    <body style="background-color: #3a5e71">
        <c:set var="acc" value="${sessionScope.account}"/>
        <jsp:include page="Header.jsp"/>
        <div id="upper-form">
            <h3 style="background-color: #f5f5f7;border-radius: 15px;align-self: center;padding: 10px;border: 2px solid">RENEW ORDER</h3><br/>
            <h6 style="align-self: center;text-align: center">List of Books that can be RENEW:</h6>


            <table style="width: 100%" id="border" >
                <tr id="border">
                    <th id="border">BorrowID</th>
                    <th id="border">BookName</th>
                    <th id="border">BookCover</th>
                    <th id="border">Borrow Date</th>
                    <th id="border">Return Date</th>
                    <th id="border">Quantity</th>
                    <th id="border" style="color: red">FINE</th>
                    <th id="border">Return</th>
                </tr>
                <c:forEach items="${requestScope.borrowList}" var="b">
                    <tr>
                        <td>${b.getBorrowID()}</td>
                        <td>${b.getBook().getTitle()}</td>
                        <td style="align-content: center">
                            <img src="${b.getBook().getCoverPath()}" alt="alt" style="width: 40%"/>
                        </td>
                        <td>${b.getBorrowDate()}"</td>
                        <td>${b.getReturnDate()}</td>
                        <td>${b.getQuantity()}</td>
                        <td>
                            <c:forEach items="${requestScope.userComp}" var="c">
                                <c:if test="${c.getBorrows().getBorrowID()==b.getBorrowID()}">
                                    <fmt:formatNumber value="${c.getPenaty_Fine()}" type="currency" />
                                </c:if>
                            </c:forEach>
                        </td>
                         <td>
                            <form action="return" method="get">
                              <input type="hidden" name="returnOrderBorrowID" value="${b.getBorrowID()}">
                              <input type="submit" class="btn btn-danger" value="Return">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
<!--
<div id="demo">

            </div>
            <form id="" style="" action="eBookServlet" method="post">
                <div>
                    <input type="radio" name="searchBY" value="Name" checked/>Search Name
                    <input type="radio" name="searchBY" value="ID" />Search ID
                </div>
                <nav class="" role="search" style="display: flex;flex-direction: row" >
                    <input class="form-control" style="" type="search" placeholder="Search by Name/ID" aria-label="Search" name="search">
                    <button class="btn btn-outline-success bg-info" style="color: background ;"  type="submit">Search</button>
                </nav>
                <div>
                    <input type="radio" name="filter" value="byNameAsc"/>Filter by Name ASC
                    <input type="radio" name="filter" value="byNameDes" />Filter by Name DES
                    <input type="radio" name="filter" value="byIDAsc"/>Filter by ID ASC
                    <input type="radio" name="filter" value="byIDDes"/>Filter by ID DES
                </div>
            </form>-->
