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
    <!-- Custom CSS -->
    <link rel="stylesheet" href="CSSsimple/adminDashbroad.css">

    <title>Add Absent</title>
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
                    <h1>Add Absent</h1>
                </div>
            </div>

            <div class="formAddAbsent">
                <form id="addAbsentForm">
                    <div class="form-group">
                        <label for="absentDate">Absent Date:</label>
                        <input type="text" class="form-control" id="absentDate" name="absentDate">
                    </div>
                    <div class="form-group">
                        <label for="daysAbsent">Days Absent:</label>
                        <input type="number" class="form-control" id="daysAbsent" name="daysAbsent" value="1" disabled>
                    </div>
                    <div class="form-group">
                        <label for="phone">Contact (Phone):</label>
                        <input type="text" class="form-control" id="phone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="reason">Reason:</label>
                        <textarea class="form-control" id="reason" name="reason"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Add</button>
                </form>
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

    <script>
        $(document).ready(function() {
            $('#absentDate').datepicker({
                format: 'yyyy-mm-dd'
            });

            $('#addAbsentForm').on('submit', function(e) {
                e.preventDefault();

                var absentDate = $('#absentDate').val();
                var today = new Date();
                var inputDate = new Date(absentDate);

                if (!absentDate) {
                    toastr.error('Absent Date is required!');
                    return;
                }

                if (inputDate <= today) {
                    toastr.error('Absent Date must be greater than today\'s date!');
                    return;
                }

                var formData = $(this).serialize();

                $.ajax({
                    url: 'AddAbsent',
                    method: 'POST',
                    data: formData,
                    success: function(response) {
                        toastr.success('Absent record added successfully!');
//                        $('#addAbsentForm')[0].reset();
                    },
                    error: function(xhr, status, error) {
                        toastr.error('Failed to add absent record!');
                    }
                });
            });
        });
    </script>
</body>
</html>
