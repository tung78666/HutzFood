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
        <!--boosrtrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            #upper-form{
                /*                background: lightgrey;
                                box-sizing: border-box;
                                border-collapse: collapse;
                                border: 2px solid;
                                border-radius: 20px;
                                                display: flex;
                                width: fit-content;
                
                                padding: 10px;
                                z-index: 1;
                                position: relative;
                                top: 80px;
                                left: 140px;*/

            }
            div.text-box {
                width: 80%;
                padding: 10px;
                margin: 0;
            }
            center{
                top: 200px;
            }
        </style>
    </head>

    <body style="background-color: #3a5e71">
        <jsp:include page="Header.jsp"/>
        <c:set value="${requestScope.Book}" var="b"/>
        <div class="position-relative" style="top: 80px;padding-bottom: 80px">
            <div class="container" style="background: lightgrey;box-sizing: border-box;border-collapse: collapse;border: 2px solid;border-radius: 20px;padding: 20px">
                <main>
                    <div class="py-5 text-center">
                        <img class="d-block mx-auto mb-4" src="images/icon.png" alt="" width="72" height="72">
                        <h2>Book INFO Form</h2>
                        <p class="lead">Our brothers and sisters , our contribution in knowledge is as precious as Gold and NONE will go to waste</p>
                        <h6 style="color: red">${requestScope.promote}</h6>
                    </div>

                    <div class="row g-5 mx-auto">
                        <div class="">
                            <form action="addbook" method="post">
                                <div class="row g-3 ">
                                    <div class="col-12">
                                        <label for="BookID" class="form-label">BookID:</label>
                                        <input type="text" class="form-control" name="BID" value="${b.getBookID}" required>
                                    </div>

                                    <div class="col-12">
                                        <label for="title" class="form-label">Title:</label>
                                        <input type="text" class="form-control" name="title" value="${b.getTitle()}" required="">
                                    </div>

                                    <div class="col-12">
                                        <label for="AuthorName" class="form-label">AuthorName:</label>
                                        <input type="text" class="form-control" name="AuthName" value="${b.getAuthorName()}" required>
                                    </div>

                                    <div class="col-md-5">
                                        <label for="Publisher" class="form-label">Publisher:</label>
                                        <select class="form-select form-control" name="publisher" style="width: fit-content">
                                            <c:forEach items="${requestScope.listPub}" var="p">
                                                <option ${(b.getPublisher().getPID()==p.getPID())?'selected':''} value="${p.getPID()}" >${p.getPName()}</option>
                                            </c:forEach>
                                        </select>

                                    </div>

                                    <div class="col-md-4">
                                        <label for="Genres" class="form-label">Genres:</label>
                                        :<select class="form-select form-control" name="genres" style="width: fit-content">
                                            <c:forEach items="${requestScope.listGen}" var="g">
                                                <option ${(b.getGenres().getGID()==g.getGID())?'selected':''} value="${g.getGID()}" >${g.getGName()}</option>
                                            </c:forEach>
                                        </select>

                                    </div>

                                    <div class="col-12">
                                        <label for="NumREPub" class="form-label">Republish num: </label>
                                        <input type="number" class="form-control" name="numRePub" value="${b.getNumREPub()}">
                                    </div>

                                    <div class="col-12">
                                        <label for="address" class="form-label">Quantity:</label>
                                        <input type="number" class="form-control" name="Quantity" value="${b.getQuantity()}" required>
                                    </div>

                                    <div class="col-12">
                                        <label for="address2" class="form-label">CoverPath:</label>
                                        <input type="text" class="form-control" id="address2" name="coverPath" value="${b.getCoverPath()}">
                                    </div>
                                    
                                    <div class="col-12">
                                        <label for="address2" class="form-label">eBookPath:</label>
                                        <input type="text" class="form-control" id="address2" name="eBookPath" value="${b.geteBookPath()}">
                                    </div>
                                    
                                    <div class="col-12">
                                        <label for="address2" class="form-label">Number of Remaining eBook:</label>
                                        <input type="number" class="form-control" id="address2" name="NumEbok" value="${b.getNumOfEbook()}">
                                    </div>
                                    
                                    <div class="col-12">
                                        <label for="address2" class="form-label">Number of Physical Book:</label>
                                        <input type="number" class="form-control" id="address2" name="NumPhybok" value="${b.getNumOfPhysicalBook()}">
                                    </div>
                                
                                </div>
                                <br/>
                                <div class="input-group">
                                    <span class="input-group-text">Briefly:</span>
                                    <textarea class="form-control" aria-label="With textarea" name="briefly" value="${b.getBriefly()}"></textarea>
                                </div>
                                <hr class="my-4">
                                <button class="w-100 btn btn-primary btn-lg" type="submit" >Add to Database</button>
                            </form>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
