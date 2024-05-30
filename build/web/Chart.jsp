<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Chart
    Created on : Mar 13, 2024, 7:12:23 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chart</title>
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
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="dashboard.css" rel="stylesheet">
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
    <body style="background-color: #3a5e71">
        <c:set var="acc" value="${sessionScope.account}"/>
        <c:set var="selectYEAR" value="${requestScope.selectYEAR}"/>
        <c:set var="selectMONTH" value="${requestScope.selectMONTH}"/>
        <jsp:useBean id="d" class="dal.DAO"/>
        <%--<jsp:include page="Header.jsp"/>--%>
        <div id="upper-form">
            <div style="background-color: #f5f5f7;border-radius: 15px;align-self: center;padding: 10px;border: 2px solid">
                <h3 >CRUD BOOK</h3><br/>

                <div>
                    <form id="f" action="chart" method="get" style="display: flex">
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
                        YEARS: <select class="form-select form-control" name="yearIN" onchange="change()" style="width: fit-content">
                            <option value="all" >All</option>
                            <c:forEach items="${requestScope.listYear}" var="y">
                                <option ${(selectYEAR==y)?'selected':''} value="${y}" >${y}</option>
                            </c:forEach>
                        </select>
                        MONTH: <select class="form-select form-control" name="monthIN" onchange="change()" style="width: fit-content">
                            <option value="all" >All</option>
                            <c:forEach items="${requestScope.listMonth}" var="m">
                                <option ${(selectMONTH==m)?'selected':''} value="${m}" >${m}</option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
            </div>
        </div>
        <div>
            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
            <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.2/dist/chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script>
        </div>
    </body>
</html>
<!--
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
<%--<c:forEach items="${d}" var="b">--%>
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
<%--</c:forEach>--%>
</table>
</div>-->

