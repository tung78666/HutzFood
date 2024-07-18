<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Toastr CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <!-- DateTime Picker CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <!-- My CSS -->
    <link rel="stylesheet" href="CSSsimple/adminDashbroad.css">

    <title>Manager Absent</title>
    <style>
        #phanTrang{
            padding-bottom: 0.4px;
            text-align: center;
        }
/*        #phanTrang button{
            margin-top: 10px;
        }*/
    </style>
</head>
<body>
    <!-- SIDEBAR -->
    <jsp:include page="headerSeller.jsp" />
    <!-- SIDEBAR -->
    <!-- CONTENT -->
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <i class='bx bx-menu'></i>
            <form action="#">
                <div class="form-input">
                    <input type="search" placeholder="Search...">
                    <button type="submit" class="search-btn"><i class='bx bx-search'></i></button>
                </div>
            </form>
        </nav>
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main class="container">
            <div class="head-title">
                <div class="left">
                    <h1>View Absent</h1>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Reason</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="absentTable">
                        <c:forEach var="absent" items="${requestScope.absents}">
                            <tr>
                                <td>${absent.dateAbsent}</td>
                                <td>${absent.reason}</td>
                                <td class="${absent.status.toLowerCase()}">${absent.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

<!--            <div class="bg-light  pt-2" id="phanTrang">
                <ul class="pagination justify-content-center mt-1">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item"><a class="page-link" href="#" id="prevPage">Previous</a></li>
                    </c:if>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item"><a class="page-link" href="#" id="nextPage">Next</a></li>
                    </c:if>
                </ul>
            </div>-->
        </main>
        <!-- MAIN -->
    </section>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Toastr JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <!-- DateTime Picker JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <!-- Custom JS -->
    <script src="js/adminDashbroad.js"></script>

</body>
</html>
