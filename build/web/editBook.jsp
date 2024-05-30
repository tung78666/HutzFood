<%-- 
    Document   : editBook
    Created on : Mar 10, 2024, 10:22:12 PM
    Author     : Dan09
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Book</title>
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
        <c:set var="b" value="${requestScope.book}"/>
        <div id="upper-form">
            <div style="padding: 20px">
                <h5 style="color: red">${requestScope.promote}</h5>
                <img src="${b.getCoverPath()}" alt="" style="width: 60%"/>
            </div>
            <div>
                <form action="editBookServlet" method="post">
                    BookID: <input style="align-self: center" name="BID" value="${b.getBookID()}"><br/>
                    Title: <input style="align-self: center" name="title" value="${b.getTitle()}"><br/>
                    AuthorName: <input style="align-self: center" name="AuthName" value="${b.getAuthorName()}"><br/>
                    Publisher:<select class="form-select form-control" name="publisher" style="width: fit-content">
                        <c:forEach items="${requestScope.listPub}" var="p">
                            <option ${(b.getPublisher().getPID()==p.getPID())?'selected':''} value="${p.getPID()}" >${p.getPName()}</option>
                        </c:forEach>
                    </select>
                    Genres:<select class="form-select form-control" name="genres" style="width: fit-content">
                        <c:forEach items="${requestScope.listGen}" var="g">
                            <option ${(b.getGenres().getGID()==g.getGID())?'selected':''} value="${g.getGID()}" >${g.getGName()}</option>
                        </c:forEach>
                    </select>
                    Republish num: <input style="align-self: center"  name="numRePub" value="${b.getNumREPub()}"><br/>
                    Quantity: <input style="align-self: center" name="Quantity" value="${b.getQuantity()}"><br/>
                    CoverPath: <input style="align-self: center" name="coverPath" value="${b.getCoverPath()}"><br/>
                    eBookPath: <input style="align-self: center" name="eBookPath" value="${b.geteBookPath()}"><br/>
                    Number of Remaining eBook: <input style="align-self: center" name="NumEbok" value="${b.getNumOfEbook()}"><br/>
                    Number of Physical Book: <input style="align-self: center" name="NumPhybok" value="${b.getNumOfPhysicalBook()}"><br/>
                    Briefly:<textarea name="briefly" style="width: 300px;height: 300px">${b.getBriefly()}</textarea><br/>
                    <button class="btn btn-success" type=submit >SUBMIT</button>
                </form>
            </div>
        </div>
    </body>
</html>
