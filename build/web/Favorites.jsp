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
        <title>Favorites</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            table{
                margin: 20px;
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
        <c:set var="cFave" value="${pageContext.request.cookies}"/>
        <jsp:useBean id="d" class="dal.DAO"/>
        <jsp:include page="Header.jsp"/>
        <div class="container-fluid" style="padding: 10px;z-index: 1;position: absolute;top: 80px;background: lightgrey;box-sizing: border-box;border: 2px solid;border-radius: 20px;">
            <h3 class="container-fluid col-md-3 text-center align-self-center" style="background-color: #f5f5f7;border-radius: 15px;align-self: center;padding: 10px;border: 2px solid">RENEW ORDER</h3><br/>
            <h6 style="align-self: center;text-align: center">List of Books that can be RENEW:</h6>

            <div class="">
                <table class="container-fluid" style="width: 100%" id="table" >
                    <tr class="">
                        <th id="col-md-4">Cover</th>
                        <th id="col">BookID</th>
                        <th id="border">Book Title</th>
                        <th id="border">AuthorName</th>
                        <th id="border">PID</th>
                        <th id="border">GID</th>
                        <th class="col-md-1">NumREPub</th>
                        <th id="border">Quantity</th>
                        <th id="border">NumOfEbook</th>
                        <th class="col-md-1">NumOfPhysicalBook</th>
                        <th class="col-md-2">Briefly</th>
                        <th id="border">Delete</th>
                    </tr>
                    <c:forEach items="${d.getFaveBook(cookie.cFaveList.value)}" var="b">
                        <tr>
                            <td style="align-content: center">
                                <img src="${b.getCoverPath()}" alt="alt" style="" class="img-fluid"/>
                            </td>
                            <td>${b.getBookID()}</td>
                            <td>${b.getTitle()}</td>
                            <td>${b.getAuthorName()}</td>
                            <td>${b.getPublisher().getPName()}</td>
                            <td>${b.getGenres().getGName()}</td>
                            <td>${b.getNumREPub()}</td>
                            <td>${b.getQuantity()}</td>
                            <td>${b.getNumOfEbook()}</td>
                            <td>${b.getNumOfPhysicalBook()}</td>
                            <td>${b.getBriefly()}</td>
                            <td>
                                <form action="favorites" method="post">
                                    <input type="hidden" name="BID" value="${b.getBookID()}">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>    
        </div>
    </body>
</html>

