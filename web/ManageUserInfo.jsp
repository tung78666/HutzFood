<%-- 
    Document   : ManageUserInfo
    Author     : ducnt
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="CSSsimple/adminDashbroad.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/nice-select.css" rel="stylesheet">
        <title>UserInfoManage</title>     
        <script src="ckeditor/ckeditor.js"></script> 
        <script src="ckfinder/ckfinder.js"></script>
        <style>
            /* Định dạng nút View */
            .viewButton {
                margin-top: 10px;
                background: none;
                border: none;
                padding: 0;
                cursor: pointer;
            }

            /* Định dạng biểu tượng mắt */
            .eye-icon {
                width: 16px;
                height: 16px;
                background-image: url("image/eye.jpg");
                /* Đường dẫn tới ảnh biểu tượng mắt */
                background-repeat: no-repeat;
                background-size: cover;
                display: inline-block;
                transform: scale(2);
                border: 2px solid transparent;
                /* Viền mặc định là trong suốt */
                border-radius: 50%;
                /* Bo tròn viền */
                transition: box-shadow 0.3s ease;
                /* Hiệu ứng chuyển động mượt mà cho box-shadow */
            }
            .viewButton:hover .eye-icon {
                border: 2px solid limegreen;
                /* Viền sáng màu xanh lá cây */
            }
            .filter-option {
                background-color: lightblue;
                opacity: 1;
                padding: 5px;
                margin: 5px;
                border-radius: 5px;
                display: inline-block;
            }
            .filter-option input {
                margin-right: 5px;
            }
            .dropdown {
                margin-left: 5px;
            }
            #submitButton:hover{
                opacity: 0.3;
            }
        </style>

    </head>

    <body>
        <!-- SIDEBAR -->
        <jsp:include page="headerDashbord.jsp"/>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <!--                <form action="ManageUserInfo" method="post">
                                    <div class="form-input">
                                        <input type="search" name="search" placeholder="Search..." style="border-radius: 2px">
                                        <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                                    </div>
                                </form>-->
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Manage User Information</h1>
                        <div>
                            <form id="filterForm" action="ManageUserInfo" method="GET">

                                <label class="filter-option">
                                    Sort by: 
                                    <select name="element2Sort" class="dropdown">
                                        <option value="ID" selected>ID</option>
                                        <option value="Name">Name</option>
                                        <option value="Role">Role</option>
                                        <option value="Status">Status</option>
                                        <option value="DateOfBirth">DateOfBirth</option>
                                    </select>
                                    <select name="sortRule" class="dropdown">
                                        <option value="ASC" selected>ASC</option>
                                        <option value="DES">DES</option>
                                    </select>
                                    <input style="background: var(--blue); color: white; border: solid var(--blue); font-size: 17px; border-radius: 5px;"
                                           type="submit" value="Submit" id="submitButton">
                                </label>

                            </form>
                        </div>
                    </div>
                    <div>
                        <form action="ManageUserInfo" method="post">
                            <div class="form-input">
                                <input type="search" name="search" placeholder="Search...">
                                <input style="background: var(--blue); color: white; border: solid var(--blue); font-size: 17px; border-radius: 15px;"
                                       type="submit" value="Search">
                                <div>
                                    <input type="radio" name="searchBY" value="Name" checked/>Search Name
                                    <input type="radio" name="searchBY" value="ID" />Search ID
                                    <input type="radio" name="searchBY" value="Phone" />Search Phone
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div style="margin-top: 3rem;" class="col-md-12">       
                    <!--                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModalAddNew">Add User</button>
                                         Modal 
                                        <div class="modal fade" id="myModalAddNew" role="dialog">
                                            <div class="modal-dialog">
                    
                                                 Modal content
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Add Blog</h4>
                                                    </div>
                                                    <form action="AddBlog" method="post" enctype="multipart/form-data">
                                                        <div class="modal-body">
                                                            <b>Title: </b><input type="text" class="form-control" value="" required name="title"><br>  
                                                            <b>Content: </b>
                                                            <div class="form-control">
                                                                <textarea id="edit" rows="5" name="content" class="form-control" placeholder="Write some thing..." required=""></textarea>
                                                            </div>
                    
                                                            <b>Image:</b><input type="file" class="form-control" required  value="" name="img"><br>
                                                            <b><input type="hidden" class="form-control" required  value="${sessionScope['account'].getId()}" name="user"></b>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>-->

                    <table class="table" style="margin-top: 20px; margin-bottom: 20px;">


                        <thead >
                            <tr style="font-size: 20px;">
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>                      
                                <th scope="col">Role</th>
                                <th scope="col">Status</th>
                                <th scope="col">Point</th>
                                <th scope="col">Date of Birth</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Location 1</th>
                                <th scope="col">Location 2</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${pl}">
                                <%
                                    User account = (User) pageContext.findAttribute("p");
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    String formattedDOB = "";
                                    if (account != null && account.getDOB() != null) {
                                        formattedDOB =dateFormat.format(account.getDOB());
                                    }
                                %>
                                <tr>
                                    <th scope="row">${p.getId()}</th>
                                    <td>${p.getName()}</td>
                                    <td>${p.getEmail()}</td>                                
                                    <td>${p.getRole().getName()}</td>
                                    <td>${p.getUserStatus().getName()}</td>
                                    <td>${p.getPoint()}</td>
                                    <td><%=formattedDOB%></td>
                                    <td>${p.getPhone()}</td>
                                    <td>${p.getLocation1()}</td>
                                    <td>${p.getLocation2()}</td>
                                    <td> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal${p.getId()}">Edit</button></td>
                                </tr>

                            <div class="modal fade" id="myModal${p.getId()}" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edit User:</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <form action="EditUserInfo" method="get">
                                            <div class="modal-body">
                                                <b>ID: </b><input type="text" class="form-control" name="id" value="${p.getId()}" readonly><br>
                                                <b>Name: </b><input type="text" class="form-control" value="${p.getName()}" name="name"><br>
                                                <b>Email: </b><input type="text" class="form-control" value="${p.getEmail()}" name="email"><br>
                                                <b>Role: </b><input type="text" class="form-control" value="${p.getRole().getName()}" name="role" readonly><br>
                                                <b>Status: </b><input type="text" class="form-control" value="${p.getUserStatus().getName()}" name="status" readonly><br>
                                                <b>Points: </b><input type="text" class="form-control" value="${p.getPoint()}" name="points"><br>
                                                <b>Date of Birth: </b><input class="form-control" placeholder="MM-DD-yyyy" type="date" min="1970-01-01" max="2008-06-11" value="<%=formattedDOB%>" name="DOB"><br>
                                                <b>Phone: </b><input type="text" class="form-control" value="${p.getPhone()}" name="phone"><br>
                                                <b>Location 1: </b><input type="text" class="form-control" value="${p.getLocation1()}" name="location1"><br>
                                                <b>Location 2: </b><input type="text" class="form-control" value="${p.getLocation2()}" name="location2"><br>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-success" value="submit">Submit</button>
                                            </div>
                                        </form>                            
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>


                    </table>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script >
            function submitForm() {
                document.getElementById('filterForm').submit();
            }

            CKEDITOR.replace('edit', {
                filebrowserBrowseUrl: 'ckfinder/ckfinder.html',
                filebrowserUploadUrl: 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'
            });
        </script>
        <script src="js/adminDashbord.js"></script>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>
