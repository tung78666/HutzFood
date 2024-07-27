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
                    Billing Details
                </h2>
            </div>
            <form id="formOrder" action="order" method="post">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form_container">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="form-label">Name</label>
                                    <c:if test="${sessionScope['account'] == null}">
                                        <input type="text" class="form-control" id="ckOut-form-control" name="name"  title="Tên ít hơn 10 kí tự" pattern="[A-Za-Z0-9]{10}" required>
                                    </c:if>
                                    <c:if test="${sessionScope['account'] != null}">
                                        <input type="text"  class="form-control" value="${sessionScope['account'].getName()}" id="ckOut-form-control" name="name"  title="Tên ít hơn 10 kí tự" pattern="[A-Za-Z0-9]{10}" required>
                                    </c:if>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Email</label>
                                    <c:if test="${sessionScope['account'].getPhone()==null}"> 
                                        <input type="tel" class="form-control" id="ckOut-form-control" name="phone" pattern="[0-9]{10}" required>
                                    </c:if>
                                    <c:if test="${sessionScope['account'].getPhone()!=null}">
                                        <input type="tel" class="form-control" id="ckOut-form-control" value="${sessionScope['account'].getPhone()}" name="phone" pattern="[0-9]{10}" value="${sessionScope['account'].getPhone()}" required>
                                    </c:if>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Address</label>
                                    <c:choose>
                                        <c:when test="${sessionScope['account'].location1 == null && sessionScope['account'].location2 == null}">
                                            <input type="text" class="form-control" id="ckOut-form-control" name="address" placeholder="" required>
                                        </c:when>
                                        <c:otherwise>
                                            <select class="form-control" id="ckOut-form-control" name="address">
                                                <c:if test="${sessionScope['account'].location1 != null}">
                                                    <option value="${sessionScope['account'].location1}" style="color: #000" selected>${sessionScope['account'].location1}</option>
                                                </c:if>
                                                <c:if test="${sessionScope['account'].location2 != null}">
                                                    <option value="${sessionScope['account'].location2}"style="color: #000">${sessionScope['account'].location2}</option>
                                                </c:if>
                                            </select>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div>
                                <label class="form-label">Note</label>
                                <textarea class="form-control" name="note" id="ckOut-form-control" rows="10"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                CART TOTAL
                            </div>
                            <div class="card-body">
                                <form id="myForm" action="order" method="get">
                                    <table style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td style="width: 70%;">Subtotal</td>
                                                <td style="width: 30%;">${requestScope.total}00đ</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 70%;">Discount</td>
                                                <td style="width: 30%;">${requestScope.discount}%</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 70%;">
                                                    <b>Total</b>
                                                </td>
                                                <td style="width: 30%;" id="priceSpan"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>
                                        <h5 class="mt-2 mb-0"><p>Payment method:</p></h5>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="pm"
                                                id="pm-cash" value="1" required>
                                            <label class="form-check-label" for="pm-cash">BY Cash</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="pm"
                                                id="pm-viet-qr" value="2" required>
                                            <label class="form-check-label" for="pm-viet-qr">BY VietQR</label>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <div class="card-footer">
                                <input type="submit" value="Confirm" class="btn btn-block"
                                    style="background-color: #e69c00; color: white;">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
    
    <script>
        var priceSpans = document.querySelectorAll("#priceSpan");

        priceSpans.forEach(function (span) {
            var total = parseFloat("${requestScope.total}");
            var discount = parseFloat("${requestScope.discount}");
            var price = total * (100 - discount) / 100;
            var formattedPrice = price.toFixed(3);
            span.textContent = formattedPrice + "đ";
        });
        function showModal() {
            $('#CheckOutPM').modal({
                backdrop: false
            });
        }
    </script>
</body>

</html>