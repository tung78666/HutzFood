<%-- 
    Document   : Detail
    Created on : Mar 6, 2024, 3:15:34 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/f-icon.png" type="image/gif" />
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
                position: relative;
                top: 80px;
                left: 140px;
                word-wrap: break-word;
                overflow-wrap: break-word;
            }
            div.text-box {
                width: 80%;
                padding: 10px;
                margin: 0;
            }
        </style>
    </head>

    <body style="background-color: #3a5e71">
        <jsp:include page="Header.jsp"/>
        <c:set var="b" value="${requestScope.Book}"/>

        <div id="upper-form">
            <div style="padding: 20px">
                <h5 style="color: red">${requestScope.promote}</h5>
                <img src="${b.getCoverPath()}" alt="" style="width: 60%"/>

                <c:if test="${b.getNumOfEbook()==0 && b.getNumOfPhysicalBook()==0}">
                    <h5 style="color: red">This book is currently UNAVAILABLE</h5>
                </c:if>
            </div>
            <div>
                BookID: <h5 style="align-self: center">${b.getBookID()}</h5><br/>
                Title: <h4 style="align-self: center">${b.getTitle()}</h4><br/>
                AuthorName: <h5 style="align-self: center">${b.getAuthorName()}</h5><br/>
                Publisher: <h5 style="align-self: center">${b.getPublisher().getPName()}</h5><br/>
                Genres: <h5 style="align-self: center">${b.getGenres().getGName()}</h5><br/>
                Republish num: <h5 style="align-self: center">${b.getNumREPub()}</h5><br/>
                Quantity: <h5 style="align-self: center">${b.getQuantity()}</h5><br/>
                Number of Remaining eBook<h5 style="align-self: center">${b.getNumOfEbook()}</h5><br/>
                Number of Physical Book<h5 style="align-self: center">${b.getNumOfPhysicalBook()}</h5><br/>
                <div class="text-box">    
                    Briefly: <strong style="text-align: center;line-break: strict;">${b.getBriefly()}</strong><br/>
                </div>
            </div>
            <form action="DetailServlet" method="get">  
                <c:if test="${b.getNumOfPhysicalBook()!=0}">
                    <button class="btn btn-primary" type="submit" name="PhyBorrow" value="${b.getBookID()}" style="margin-bottom:  20px">Borrow PhyBook</button><br/>
                </c:if>
                <c:if test="${b.getNumOfEbook()!=0}">
                    <button class="btn btn-primary" type="submit" name="eBorrow" value="${b.getBookID()}">Borrow eBook</button><br/>
                </c:if>

            </form>
            <form action="addfavorites">
                <button class="btn btn-primary" type="submit" name="BID" value="${b.getBookID()}">Favorites</button><br/>
            </form>
        </div>    
    </div>
</body>
</html>
