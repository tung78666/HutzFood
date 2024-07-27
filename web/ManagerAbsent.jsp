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
    <jsp:include page="headerDashbord.jsp" />
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
                    <h1>Manager Absent</h1>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="fromDate" class="form-control" placeholder="From Date">
                </div>
                <div class="col-md-3">
                    <input type="text" id="toDate" class="form-control" placeholder="To Date">
                </div>
                <div class="col-md-3">
                    <select id="status" class="form-control">
                        <option value="">All</option>
                        <option value="Pending">Pending</option>
                        <option value="Confirmed">Confirmed</option>
                        <option value="Rejected">Rejected</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-primary" id="searchBtn"><i class='bx bx-search'></i> Search</button>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Employee</th>
                            <th>Phone</th>
                            <th>Date</th>
                            <th>Reason</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="absentTable">
                        <c:forEach var="absent" items="${absents}">
                            <tr>
                                <td>${absent.id}</td>
                                <td>${absent.userName}</td>
                                <td>${absent.phone}</td>
                                <td>${absent.dateAbsent}</td>
                                <td>${absent.reason}</td>
                                <td class="${absent.status.toLowerCase()}">${absent.status}</td>
                                <td>
                                    <c:if test="${absent.status == 'Pending'}">
                                        <button class="btn btn-success confirm-absent" data-id="${absent.id}"><i class='bx bx-check'></i></button>
                                        <button class="btn btn-danger reject-absent" data-id="${absent.id}"><i class='bx bx-x'></i></button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="bg-light  pt-2" id="phanTrang">
                <ul class="pagination justify-content-center mt-1">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item"><a class="page-link" href="#" id="prevPage">Previous</a></li>
                    </c:if>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item"><a class="page-link" href="#" id="nextPage">Next</a></li>
                    </c:if>
                </ul>
            </div>
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

    <script>
        $(document).ready(function() {
            $('#fromDate').datepicker({
                format: 'yyyy-mm-dd'
            });
            $('#toDate').datepicker({
                format: 'yyyy-mm-dd'
            });

            function loadAbsentData(page = 1) {
                var fromDate = $('#fromDate').val();
                var toDate = $('#toDate').val();
                var status = $('#status').val();

                $.ajax({
                    url: 'GetAbsentData',
                    method: 'GET',
                    data: {
                        page: page,
                        fromDate: fromDate,
                        toDate: toDate,
                        status: status
                    },
                    success: function(response) {
                        var absentTable = $('#absentTable');
                        absentTable.html('');
                        response.absents.forEach(function(absent) {
                            var row = $('<tr>');
                            row.append('<td>' + absent.id + '</td>');
                            row.append('<td>' + absent.userName + '</td>');
                            row.append('<td>' + absent.phone + '</td>');
                            row.append('<td>' + absent.dateAbsent + '</td>');
                            row.append('<td>' + absent.reason + '</td>');
                            row.append('<td class="' + absent.status.toLowerCase() + '">' + absent.status + '</td>');
                            var actionTd = $('<td>');
                            if (absent.status === 'Pending') {
                                actionTd.append('<button class="btn btn-success confirm-absent" data-id="' + absent.id + '"><i class="bx bx-check"></i></button>');
                                actionTd.append('<button class="btn btn-danger reject-absent" data-id="' + absent.id + '"><i class="bx bx-x"></i></button>');
                            }
                            row.append(actionTd);
                            absentTable.append(row);
                        });
                        updatePagination(page, response.totalPages); // Cập nhật phân trang
                    }
                });
            }

            function updatePagination(currentPage, totalPages) {
                var pagination = $('.pagination');
                pagination.html('');
                if (currentPage > 1) {
                    pagination.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (currentPage - 1) + '">Previous</a></li>');
                }
                if (currentPage < totalPages) {
                    pagination.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (currentPage + 1) + '">Next</a></li>');
                }
            }

            $('#searchBtn').click(function() {
                loadAbsentData();
            });

            $('#status').change(function() {
                loadAbsentData();
            });

            $(document).on('click', '.confirm-absent', function() {
                var id = $(this).data('id');
                $.ajax({
                    url: 'UpdateAbsentStatus',
                    method: 'POST',
                    data: {
                        id: id,
                        status: 'Confirmed'
                    },
                    success: function(response) {
                        toastr.success('Status updated to Confirmed');
                        loadAbsentData();
                    }
                });
            });

            $(document).on('click', '.reject-absent', function() {
                var id = $(this).data('id');
                $.ajax({
                    url: 'UpdateAbsentStatus',
                    method: 'POST',
                    data: {
                        id: id,
                        status: 'Rejected'
                    },
                    success: function(response) {
                        toastr.success('Status updated to Rejected');
                        loadAbsentData();
                    }
                });
            });

            $(document).on('click', '.page-link', function(e) {
                e.preventDefault();
                var page = $(this).data('page');
                loadAbsentData(page);
            });

            loadAbsentData(); // Load initial data
        });
    </script>
</body>
</html>
