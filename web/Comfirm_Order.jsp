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
                    Cảm ơn quý khách đã đặt hàng!
                </h2>
            </div>
            <div class="card">
                <div class="card-body">
                    <h3>Thông tin đơn hàng</h3>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <td>${requestScope.order.getId()}</td>
                            </tr>
                            <tr>
                                <th>Tên khách hàng</th>
                                <td>${requestScope.order.getUser().getName()}</td>
                            </tr>
                            <tr>
                                <th>Số điện thoại</th>
                                <td>${requestScope.order.getPhone()}</td>
                            </tr>
                            <tr>
                                <th>Địa chỉ</th>
                                <td>${requestScope.order.getAddress()}</td>
                            </tr>
                            <tr>
                                <th>Thời gian đặt hàng</th>
                                <td>${requestScope.order.getDate()}</td>
                            </tr>
                            <tr>
                                <th>Ghi chú</th>
                                <td>${requestScope.order.getNotes()}</td>
                            </tr>
                            <tr>
                                <th>Discount</th>
                                <td>${requestScope.order.getDiscount()}</td>
                            </tr>
                            <tr>
                                <th>Tổng giá trị đơn hàng</th>
                                <td>${requestScope.total}00&nbsp;đ</td>
                            </tr>
                        </tbody>
                    </table>
                    <h3>Chi tiết đơn hàng</h3>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Kích cỡ</th>
                                <th>Giá tiền</th>
                            </tr>
                            <c:forEach items="${requestScope.list}" var="l">
                                <tr>
                                    <td>${l.getProduct().getName()}</td>
                                    <td>${l.getQuantity()}</td>
                                    <td>${l.productSize != null ? l.productSize.name : ''}</td>
                                    <td>${l.productSize != null ? l.productSize.price + l.product.price : l.product.price}00&nbsp;đ</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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