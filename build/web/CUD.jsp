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
                width: fit-content;
                padding: 10px;
                z-index: 1;
                position: absolute;
                top: 80px;
            }
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }

        </style>
        <script type="text/javascript">
            function change() {
                document.getElementById('f').submit();
            }
        </script>
    </head>
    <body>
        <c:set var="acc" value="${sessionScope.account}"/>
        <c:set var="selectPID" value="${requestScope.selectPID}"/>
        <c:set var="selectGID" value="${requestScope.selectGID}"/>
        <c:set var="selectOp" value="${requestScope.selectOp}"/>
        <c:set var="SeBa" value="${requestScope.SeBa}"/>
        <jsp:include page="Header.jsp"/>
        <img src="images/recommend-background.jpg" alt="alt" style="width: 100%;z-index: 0;"/>
        <div id="upper-form">
            <div style="background-color: #f5f5f7;border-radius: 15px;align-self: center;padding: 10px;border: 2px solid">
                <h3 >CRUD BOOK</h3><br/>
                
                <div>
                    <form id="f" action="CUDservlet" method="get" style="display: flex">
                        <div>
                            <input type="radio" name="searchBY" value="Name" checked/>Search Name
                            <input type="radio" name="searchBY" value="ID" />Search ID
                        </div>
                        <nav class="" role="search" style="display: flex;flex-direction: row" >
                            <input class="form-control" style="" type="search" placeholder="Search by Name/ID" aria-label="Search" name="searchBar" value="${requestScope.SeBa}">
                            <button class="btn btn-outline-success bg-info" style="color: background ;"  type="submit" onclick="change()">Search</button>
                        </nav>
                        Order ASC/DES:<select class="form-select form-control" name="filter" onchange="change()" style="width: fit-content">
                            <option ${(selectOp=="null")?'selected':''}value="null" >None</option>
                            <option ${(selectOp=="byNameAsc")?'selected':''}value="byNameAsc" >Filter by Name ASC</option>
                            <option ${(selectOp=="byNameDes")?'selected':''}value="byNameDes" >Filter by Name DES</option>
                            <option ${(selectOp=="byIDAsc")?'selected':''}value="byIDAsc" >Filter by ID ASC</option>
                            <option ${(selectOp=="byIDDes")?'selected':''}value="byIDDes" >Filter by ID DES</option>
                        </select>
                        Publisher:<select class="form-select form-control" name="publisher" onchange="change()" style="width: fit-content">
                            <option value="all" >All Publisher</option>
                            <c:forEach items="${requestScope.listPub}" var="p">
                                <option ${(selectPID==p.getPID())?'selected':''} value="${p.getPID()}" >${p.getPName()}</option>
                            </c:forEach>
                        </select>
                        Genres:<select class="form-select form-control" name="genres" onchange="change()" style="width: fit-content">
                            <option value="all" >All Genres</option>
                            <c:forEach items="${requestScope.listGen}" var="g">
                                <option ${(selectGID==g.getGID())?'selected':''} value="${g.getGID()}" >${g.getGName()}</option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
            </div>

            <table>
                <tr>
                    <th>BookID</th>
                    <th>Title</th>
                    <th>AuthorName</th>
                    <th>Publisher</th>
                    <th>genres</th>
                    <th>NumREPub</th>
                    <th>Quantity</th>
                    <th>coverPath</th>
                    <th>eBookPath</th>
                    <th>NumOfEbook</th>
                    <th>NumOfPhysicalBook</th>
                    <th>Briefly</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${requestScope.book}" var="b">
                    <tr>
                        <td>${b.getBookID()}</td>
                        <td>${b.getTitle()}</td>
                        <td>${b.getAuthorName()}</td>
                        <td>${b.getPublisher().getPName()}</td>
                        <td>${b.getGenres().getGName()}</td>
                        <td>${b.getNumREPub()}</td>
                        <td>${b.getQuantity()}</td>
                        <td style="max-width: 200px; overflow: auto">${b.getCoverPath()}</td>
                        <td>${b.geteBookPath()}</td>
                        <td>${b.getNumOfEbook()}</td>
                        <td>${b.getNumOfPhysicalBook()}</td>
                        <td >${b.getBriefly()}</td>
                        <td>
                            <input class="btn btn-secondary" value="EDIT" type="button" onclick="location.href='editBookServlet?id=${b.getBookID()}'">
                            <button class="btn btn-danger" onclick="location.href='deleteBookServlet?id=${b.getBookID()}'">DELETE</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
