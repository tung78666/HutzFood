<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Invoice Gen</title>
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
        <section class="ftco-section" style="padding-top: 100px">
            <div class="container">
                <div class="row slider-text justify-content-center align-items-center" >
                    <div class="col-md-7 col-sm-12 text-center ftco-animate" style="background-color: rgba(128, 128, 128, 0.5);border-radius: 8px;" >
                        <h1 class="mb-3 mt-5 bread">Checkout</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="Home">Home</a></span> <span>Checkout</span></p>
                    </div>
                </div>
                <div class="row justify-content-center align-items-center" style="padding-top: 10px">
                    <div class="col-xl-8 ftco-animate" style="padding: 20px;background-color: rgba(128, 128, 128, 0.6);border-radius: 8px;">
                        <form id="formOrder" action="order" class="billing-form p-3 p-md-5" method="post" style='background-color: rgba(3,2,2,0.3);'>
                            <h3 class="mb-4 billing-heading">Billing Details</h3>
                            <div class="row align-items-end">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="phone">Name</label>
                                        <div id='nameContainer'>
                                            <c:if test="${sessionScope['account']==null}">
                                                <input type="text" class='form-control' id="ckOut-form-control" name="name"  title="Tên ít hơn 10 kí tự" pattern="[A-Za-Z0-9]{10}" required>
                                            </c:if>
                                            <c:if test="${sessionScope['account']!=null}">
                                                <input type="text" value="${sessionScope['account'].getName()}"  class='form-control' id="ckOut-form-control" name="name"  title="Tên ít hơn 10 kí tự" pattern="[A-Za-Z0-9]{10}" required>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <c:if test="${sessionScope['account'].getPhone()==null}"> 
                                            <input type="tel" id="ckOut-form-control" name="phone" class='form-control' pattern="[0-9]{10}" required>
                                        </c:if>
                                        <c:if test="${sessionScope['account'].getPhone()!=null}">
                                            <input type="tel" value="${sessionScope['account'].getPhone()}" id="ckOut-form-control" name="phone" class='form-control' pattern="[0-9]{10}" value="${sessionScope['account'].getPhone()}" required>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="emailaddress">Address</label>
                                        <c:choose>
                                            <c:when test="${sessionScope['account'].location1 == null && sessionScope['account'].location2 == null}">
                                                <input required type="text" id="ckOut-form-control" class='form-control' name="address" placeholder="Enter location">
                                            </c:when>
                                            <c:otherwise>
                                                <select name="address" id="ckOut-form-control" class='form-control'>
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

                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="emailaddress">Note</label>
                                        <textarea name="note" id="ckOut-form-control" class="form-control" rows="10" ></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
                                    <h3 class="billing-heading mb-4">Cart Total</h3>
                                    <p class="d-flex">
                                        <span>Subtotal</span>
                                        <span>${requestScope.total}00đ</span>
                                    </p>
                                    <p class="d-flex">
                                        <span>Discount</span>
                                        <span>${requestScope.discount}%</span>
                                    </p>
                                    <hr>
                                    <p class="d-flex total-price">
                                        <span>Total</span>
                                        <span class="priceSpan"></span>
                                    </p>
                                </div>
                            </div>
                            <p><a class="btn btn-primary py-3 px-4" onclick="showModal()">Place an order</a></p>

                            <div class="modal fade CheckOutPM" id="CheckOutPM" tabindex="-1" role="dialog" aria-labelledby="CheckOutLabel" aria-hidden="true" style="position: sticky;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" style="color: #000">Payment method: </h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="select-wrap">
                                            <label>
                                                <span style="color: #000"><input type="radio" name="pm" value="1" required>BY CASH </span>
                                            </label><br>
                                            <label>
                                                <span style="color: #000"><input type="radio" name="pm" value="2" required>BY VietQR</span>
                                            </label><br>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-success" value="submit" >Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form><!-- END -->
                    </div> <!-- .col-md-8 -->
                </div>
            </div>
        </section> <!-- .section -->

        <jsp:include page="Footer.jsp"/>    





        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

        <script>
                                $(document).ready(function () {

                                    var quantitiy = 0;
                                    $('.quantity-right-plus').click(function (e) {

                                        // Stop acting like a button
                                        e.preventDefault();
                                        // Get the field name
                                        var quantity = parseInt($('#quantity').val());

                                        // If is not undefined

                                        $('#quantity').val(quantity + 1);


                                        // Increment

                                    });

                                    $('.quantity-left-minus').click(function (e) {
                                        // Stop acting like a button
                                        e.preventDefault();
                                        // Get the field name
                                        var quantity = parseInt($('#quantity').val());

                                        // If is not undefined

                                        // Increment
                                        if (quantity > 0) {
                                            $('#quantity').val(quantity - 1);
                                        }
                                    });

                                });
        </script>
        <script>
            var priceSpans = document.querySelectorAll(".priceSpan");

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
        <style>
            #ckOut-form-control{
                /*                font-weight: 300;
                                border: transparent !important;*/
                border: 1px solid rgba(255, 255, 255, 0.6) !important;
                /*                height: 58px !important;
                                padding-left: 15px;
                                padding-right: 15px;
                                background: transparent !important;*/
                color: rgba(255, 255, 255, 1) !important;
                /*                font-size: 14px;
                                border-radius: 0px;
                                -webkit-box-shadow: none !important;
                                box-shadow: none !important;*/
            }
        </style>
    </body>
</html>
