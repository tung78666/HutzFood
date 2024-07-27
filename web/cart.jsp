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
            <div class="heading_container">
                <h2>
                    Cart
                </h2>
            </div>
            <div class="row">
                <div class="col-md-9">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">Product</th>
                                <th scope="col">Size</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.map}" var="i" varStatus="idx">
                            <tr>
                                <td style="vertical-align: middle;">
                                    <img src="${i.product.image}" class="rounded float-left" style="width: 75px;">
                                </td>
                                <td style="vertical-align: middle;">
                                    ${i.product.name}
                                </td>
                                <td style="vertical-align: middle;">
                                    ${i.productSize != null ? i.productSize.name : ''}
                                </td>
                                <td style="vertical-align: middle;">
                                    ${i.productSize != null ? i.productSize.price + i.product.price : i.product.price}00đ
                                </td>
                                <td style="vertical-align: middle;">
                                    <input type="number" class="form-control form-control-sm" name="quantity" id="${idx.index}" onchange="updateCart(${idx.index})"
                                                           class="quantity form-control input-number" value="${i.quantity}" min="1" max="100" />
                                </td>
                                <td style="vertical-align: middle;">
                                    ${i.productSize != null ? ((i.productSize.price + i.product.price) * i.quantity) : (i.product.price * i.quantity)}00đ
                                </td>
                                <td style="vertical-align: middle;">
                                    <a href="./deleteProduct?idx=${idx.index}">
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-header">
                            Totals Amount
                        </div>
                        <div class="card-body">
                            <form id="myForm" action="order" method="get">
                                <table style="width: 100%;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 70%;">Total</td>
                                            <td style="width: 30%;">${requestScope.total}00đ</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 70%;">Use Points</td>
                                            <td style="width: 30%;">
                                                <c:if test="${sessionScope['account'].getPoint() == 0}">
                                                    <input type="number" disabled name="discount" value="0" style="width: 100%; cursor: pointer;" /> 
                                                </c:if>
                                                <c:if test="${sessionScope['account'].getPoint() != 0}">
                                                    <input type="number" min="0" max="${sessionScope.account.getPoint()}" value="0" name="discount" style="width: 100%; cursor: pointer;" /> 
                                                </c:if>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="card-footer">
                            <input type="submit" form="myForm" value="Checkout" class="btn btn-block" style="background-color: #e69c00; color: white;">
                        </div>
                    </div>
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
    <script type="text/javascript">
        function updateCart(i) {
            var value = $('#' + i).val();
            window.location.href = "${pageContext.request.contextPath}/updateCart?idx=" + i + "&quantity=" + value;
        }
    </script>

</body>

</html>