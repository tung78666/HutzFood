<%-- 
    Document   : cart
    Created on : Jun 8, 2023, 10:34:00 PM
    Author     : kienb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <jsp:include page="header.jsp"/>  

        <section class="ftco-section ftco-cart" id="cartCont">
            <div class="container">
                <div class="row" id="cartTable">
                    <div class="col-md-12 ftco-animate">
                        <div id="cartHeader">
                            <div class="text-center ftco-animate">
                                <tr>
                                <h1 class="bread" style="padding-top: 10px">Cart</h1>
                                </tr>
                                <tr>
                                <p class="breadcrumbs"><span class=""><a href="Home">Home</a></span><span> < Cart</span>
                                </p>
                                </tr>
                            </div>
                        </div>
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Product</th>
                                        <th>Size</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.map}" var="i" varStatus="idx">
                                        <tr class="text-center">
                                            <td class="product-remove"><a href="deleteProduct?idx=${idx.index}"><span class="icon-close"></span></a></td>

                                            <td class="image-prod">
                                                <div class="img" style="background-image:url(${i.product.image});"></div>
                                            </td>

                                            <td class="product-name">
                                                <h3>${i.product.name}</h3>
                                            </td>
                                            <td style="color: white">${i.productSize != null ? i.productSize.name : ''}</td>
                                            <td class="price"><span class="priceSpan">$ ${i.productSize != null ? i.productSize.price + i.product.price : i.product.price}00</span></td>

                                            <td class="quantity">
                                                <div class="input-group mb-3">
                                                    <input type="number" name="quantity" id="${idx.index}" onchange="updateCart(${idx.index})"
                                                           class="quantity form-control input-number" value="${i.quantity}" min="1" max="100">
                                                </div>
                                            </td>
                                            <td class="total"><span class="priceSpan">${i.productSize != null ? ((i.productSize.price + i.product.price) * i.quantity) : (i.product.price * i.quantity)}00</span>đ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <p style="color: red" >${mess}</p>
                <form action="order" method="get">
                    <div class="row justify-content-end" >
                        <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate" id="checkOut4Cart">
                            <div class="cart-total mb-3">
                                <h3 id="headingcO">Totals Amount</h3>
                                <p class="d-flex total-price">
                                    <span>Total</span>
                                    <span class="priceSpan">${requestScope.total}00đ</span>
                                </p>
                                <label class="labelRemem" >
                                    <c:if test="${sessionScope['account'].getPoint() == 0}">
                                        <input type="number" disabled name="discount" value="0" style="cursor: pointer;" /> 
                                    </c:if>
                                    <c:if test="${sessionScope['account'].getPoint() != 0}">
                                        <input type="number" min="0" max="${sessionScope.account.getPoint()}" value="0" name="discount"style="cursor: pointer;" /> 
                                    </c:if>
                                    <a style="cursor: pointer;" ${sessionScope.account.getPoint() eq 0 ?'disabled':''}>Use Points</a>
                                </label>
                            </div>
                            <!--order-->
                            <p class="text-center"><input type="submit" class="btn btn-primary py-3 px-4" value="Proceed to
                                    Checkout"/></p>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <jsp:include page="Footer.jsp"/>    

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript">
                                                        function updateCart(i) {
                                                            var value = $('#' + i).val();
                                                            window.location.href = "${pageContext.request.contextPath}/updateCart?idx=" + i + "&quantity=" + value;
                                                        }

        </script>
        <style>
            #cartCont{
                padding-top: 100px;
            }
            #cartHeader{
                display: flex;
                justify-content: center;
            }
            #checkOut4Cart{
                background-color: rgba(128, 128, 128, 0.5);
                border-radius: 8px;
            }
            #headingcO{
                padding-top: 10px;
            }
            #cartTable{
                background-color: rgba(128, 128, 128, 0.5);
                border-radius: 5px;
            }
        </style>
    </body>

</html>
