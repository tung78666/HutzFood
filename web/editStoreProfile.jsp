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
    <!-- My CSS -->
    <link rel="stylesheet" href="CSSsimple/adminDashbroad.css">
    <script src="ckeditor/ckeditor.js"></script> 
    <script src="ckfinder/ckfinder.js"></script>

    <title>Edit Store Profile</title>
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
                    <h1>Edit Store Profile</h1>
                </div>
            </div>

            <div class="formEditStore">
                <form id="editStoreForm" action="EditStoreProfile" method="post" class="row">
                    <div class="col-md-6 order-md-2">
                        <div class="form-group">
                            <label for="storeName">Store Name:</label>
                            <input type="text" class="form-control" id="storeName" name="storeName" value="${store.storeName}"/>
                        </div>
                        <div class="form-group">
                            <label for="phone">Contact:</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${store.phone}"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="text" class="form-control" id="email" name="email" value="${store.email}"/>
                        </div>
                        <div class="form-group">
                            <label for="address">Address:</label>
                            <input type="text" class="form-control" id="address" name="address" value="${store.address}"/>
                        </div>
                        <div class="form-group">
                            <label for="introduction">Introduction:</label>
                            <textarea class="form-control" id="introduction" name="introduction">${store.introduction}</textarea>
                        </div>
                        <div class="form-group mt-3">
                            <br/>
                            <button type="button" class="btn btn-success col-md-4" onclick="saveForm()">Save</button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img src="<c:out value='${store.image}'/>" alt="Store Image" class="img-responsive" id="avatarImage" style="height:300px;width:300px;">
                        <br/>
                        <button type="button" class="btn btn-primary btn-sm" id="uploadButton">
                            
                            <i class="fa fa-upload"></i> Upload Image
                        </button>
                        <!-- Input for file selection, hidden from view -->
                        <input type="file" id="fileInput" style="display: none;" accept="image/*">
                    </div>
                        
                    <input type="hidden" id="thumbnail" name="image" value="<c:out value='${store.image}'/>">
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
    <script src="js/adminDashbroad.js"></script>
    
    <!-- Script for handling image upload -->
    <script>
        document.getElementById('uploadButton').addEventListener('click', function () {
            document.getElementById('fileInput').click();
        });

        document.getElementById('fileInput').addEventListener('change', function () {
            var formData = new FormData();
            formData.append('file', this.files[0]);

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'upload', true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    var fileName = response.fileName;
                    var avatarImage = document.getElementById('avatarImage');
                    avatarImage.src = './image/' + fileName; // Update the src of avatarImage
                    console.log(fileName);

                    // Update the hidden input value to save to database
                    document.getElementById('thumbnail').value = './image/' + fileName;
                }
            };
            xhr.send(formData);
        });
    </script>
    
    <script>
        function saveForm() {
            var form = $('#editStoreForm')[0];
            var formData = new FormData(form);

            $.ajax({
                url: 'EditStoreProfile',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    toastr.success(response.message);
                },
                error: function(xhr) {
                    var errorMessage = xhr.responseJSON ? xhr.responseJSON.message : 'Error saving store profile';
                    toastr.error(errorMessage);
                }
            });
        }
    </script>
</body>
</html>
