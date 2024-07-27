<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="themes/images/favicon.png" type="">

    <title> HUTZ FOOD </title>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="themes/css/bootstrap.css" />

    <!--owl slider stylesheet -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <!-- nice select  -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
        integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
        crossorigin="anonymous" />
    <!-- font awesome style -->
    <link href="themes/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="themes/css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="themes/css/responsive.css" rel="stylesheet" />

</head>

<body class="sub_page">

    <div class="hero_area">
        <div class="bg-box">
            <img src="themes/images/hero-bg.jpg" alt="">
        </div>
        <!-- start header section -->
        <jsp:include page="header.jsp"/>  
        <!-- end header section -->
    </div>

    <!-- book section -->
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>
                    My Order
                </h2>
            </div>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all" aria-selected="true">All</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="process-tab" data-toggle="tab" href="#process" role="tab" aria-controls="process" aria-selected="false">Processing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="approve-tab" data-toggle="tab" href="#approve" role="tab" aria-controls="approve" aria-selected="false">Approve</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="inqueue-tab" data-toggle="tab" href="#inqueue" role="tab" aria-controls="inqueue" aria-selected="false">In-Queue</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="complete-tab" data-toggle="tab" href="#complete" role="tab" aria-controls="complete" aria-selected="false">Complete</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="reject-tab" data-toggle="tab" href="#reject" role="tab" aria-controls="reject" aria-selected="false">Reject</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div role="tabpanel" class="tab-pane active" id="all">
                    <section class="ftco-section ftco-cart">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 ftco-animate">
                                    <div class="cart-list">
                                        <table class="table">
                                            <thead class="thead-primary">
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Order Date</th>
                                                    <th>Order Name</th>
                                                    <th>Status</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                    <tr class="text-center">
                                                        <td>${idx.index}</td>
                                                        <td>${i.formatDate()}</td>
                                                        <td>${i.orderName}</td>
                                                        <td>${i.status.name}</td>
                                                        <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                        <c:if test="${i.status.id == 3}">
                                                            <td><a href="orderRecieveUpdate?id=${i.id}">Order Recieved</a></td>
                                                        </c:if>
                                                        <c:if test="${i.status.id == 1}">
                                                            <td><a href="changeStatus?id=${i.id}">Cancel</a></td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div role="tabpanel" class="tab-pane" id="process">
                    <section class="ftco-section ftco-cart">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 ftco-animate">
                                    <div class="cart-list">
                                        <table class="table">
                                            <thead class="thead-primary">
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Order Date</th>
                                                    <th>Order Name</th>
                                                    <th>Status</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                    <c:if test="${i.status.id == 1}">
                                                        <tr class="text-center">
                                                            <td>${idx.index}</td>
                                                            <td>${i.formatDate()}</td>
                                                            <td>${i.orderName}</td>
                                                            <td>${i.status.name}</td>
                                                            <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                            <td><a href="changeStatus?id=${i.id}">Cancel</a></td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div role="tabpanel" class="tab-pane" id="approve">
                    <section class="ftco-section ftco-cart">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 ftco-animate">
                                    <div class="cart-list">
                                        <table class="table">
                                            <thead class="thead-primary">
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Order Date</th>
                                                    <th>Order Name</th>
                                                    <th>Status</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                    <c:if test="${i.status.id == 2}">
                                                        <tr class="text-center">
                                                            <td>${idx.index}</td>
                                                            <td>${i.formatDate()}</td>
                                                            <td>${i.orderName}</td>
                                                            <td>${i.status.name}</td>
                                                            <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div role="tabpanel" class="tab-pane" id="inqueue">
                    <section class="ftco-section ftco-cart">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 ftco-animate">
                                    <div class="cart-list">
                                        <table class="table">
                                            <thead class="thead-primary">
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Order Date</th>
                                                    <th>Order Name</th>
                                                    <th>Status</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                    <c:if test="${i.status.id == 3}">
                                                        <tr class="text-center">
                                                            <td>${idx.index}</td>
                                                            <td>${i.formatDate()}</td>
                                                            <td>${i.orderName}</td>
                                                            <td>${i.status.name}</td>
                                                            <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                            <td><a href="orderRecieveUpdate?id=${i.id}">Order Recieved</a></td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div role="tabpanel" class="tab-pane" id="complete">
                    <section class="ftco-section ftco-cart">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 ftco-animate">
                                    <div class="cart-list">
                                        <table class="table">
                                            <thead class="thead-primary">
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Order Date</th>
                                                    <th>Order Name</th>
                                                    <th>Status</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                    <c:if test="${i.status.id == 4}">
                                                        <tr class="text-center">
                                                            <td>${idx.index}</td>
                                                            <td>${i.formatDate()}</td>
                                                            <td>${i.orderName}</td>
                                                            <td>${i.status.name}</td>
                                                            <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div role="tabpanel" class="tab-pane" id="reject">
                    <section class="ftco-section ftco-cart">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 ftco-animate">
                                    <div class="cart-list">
                                        <table class="table">
                                            <thead class="thead-primary">
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Order Date</th>
                                                    <th>Order Name</th>
                                                    <th>Status</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.list}" var="i" varStatus="idx">
                                                    <c:if test="${i.status.id == 5}">
                                                        <tr class="text-center">
                                                            <td>${idx.index}</td>
                                                            <td>${i.formatDate()}</td>
                                                            <td>${i.orderName}</td>
                                                            <td>${i.status.name}</td>
                                                            <td><a href="orderDetail?id=${i.id}">Detail</a></td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <!-- end book section -->

    <!-- footer section -->
    <jsp:include page="Footer.jsp"/>   
    <!-- footer section -->

    <!-- jQery -->
    <script src="themes/js/jquery-3.4.1.min.js"></script>
    <!-- popper js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
    <!-- bootstrap js -->
    <script src="themes/js/bootstrap.js"></script>
    <!-- owl slider -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
    </script>
    <!-- isotope js -->
    <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
    <!-- nice select -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
    <!-- custom js -->
    <script src="themes/js/custom.js"></script>
</body>

</html>