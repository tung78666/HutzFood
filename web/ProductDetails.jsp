<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <img src="${p.getImage()}" class="img-thumbnail">
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="heading_container">
                        <h2>
                            ${p.getName()}
                        </h2>
                    </div>
                    <h5 class="my-4" style="color: #e69c00;">
                        <span id="product-price">${p.getPrice()}</span>,000đ
                    </h5>
                    <span id="selected-size-price" style="display: none;"></span>
                    <span class="my-2">
                        ${p.getDecription()}
                    </span>
                    <h4 class="mt-3">
                        Select Size:
                    </h4>
                    <form action="AddToCart" method="post"> 
                        <input type="hidden" value="${p.getId()}" name="pid">
                        <c:forEach items="${slist}" var="s">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="psize" value="${s.getId()}" id="size-${s.getId()}" required>
                                <label class="form-check-label" for="size-${s.getId()}">
                                    ${s.getName()}: <span style="color: #e69c00;">+${s.getPrice()}00đ</span>
                                </label>
                            </div>
                        </c:forEach>
                        <div class="input-group mt-4" style="width: 150px;">
                            <button type="button" class="btn btn-dark" id="quantity-left-minus" data-type="minus" data-field=""
                                style="border-top-right-radius: 0; border-bottom-right-radius: 0; color: #e69c00;">
                                <i class="fa fa-minus" aria-hidden="true"></i>
                            </button>
                            <input type="text" id="quantity" name="quantity" value="1" class="form-control" readonly>
                            <button type="button" class="btn btn-dark" id="quantity-right-plus" data-type="plus" data-field=""
                                style="border-top-left-radius: 0; border-bottom-left-radius: 0; color: #e69c00;">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                        </div>
                        <div class="mt-5">
                            <input type="submit" value="Add to Cart" class="btn btn-lg"
                                style="background-color: #e69c00; color: white;">
                        </div>
                        <p style="color: red;background-color: ${empty requestScope.mess ? 'transparent' : '#FFF'};border-radius: 3px;display: inline-block; padding: 5px; font-weight: bold;">${requestScope.mess}</p>
                    </form>
                </div>
            </div>
            <div class="heading_container mt-5">
                <h2>
                    ${count} Comments
                </h2>
            </div>
            <table class="table">
                <tbody>
                    <c:forEach items="${feedback}" var ="i"> 
                        <tr>
                            <td>
                                <p class="mb-1 ml-2">
                                    <b>${i.getUser().getName()}</b>
                                </p>
                                <p class="mb-0 ml-2" style="color: #e69c00;">
                                    ${i.getContent()}
                                </p>
                                <p class="mb-1 ml-2" style="color: #ccc;">
                                    ${i.formatDate()}
                                </p>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <c:if test="${sessionScope['account']!=null && index == 1}">
                <form action="FeedbackController" method="post">
                    <input value="${p.getId()}" name="pid" type="hidden">
                    <input value="${sessionScope['account'].getId()}" name="userid" hidden>
                    <div class="form-group">
                        <label for="comment-box">Comments</label>
                        <textarea class="form-control" name="content" id="message" id="comment-box" rows="3"></textarea>
                    </div>
                    <input type="submit" value="Post Comment" class="btn btn-lg"
                        style="background-color: #e69c00; color: white;">
                </form>
            </c:if>
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
        $(document).ready(function () {
            var basePrice = ${p.getPrice()}; // Get the base price from the server
            var quantity = parseInt($('#quantity').val()); // Get the initial quantity value

            function formatPrice(price) {
                return price.toLocaleString('en-US');
            }

            // Function to update the price based on the size and quantity
            function updatePrice() {
                var selectedSizePrice = parseInt($('#selected-size-price').text()); // Get the price of the selected size
                var totalPrice = (basePrice + selectedSizePrice) * quantity; // Calculate the total price
                $('#product-price').text(formatPrice(totalPrice)); // Update the displayed price
            }

            // Increase quantity event
            $('#quantity-right-plus').click(function (e) {
                e.preventDefault();
                var selectedSize = $('input[name="psize"]:checked').val(); // Get the selected size value

                if (selectedSize === undefined || selectedSize === "") {
                    alert("Please select a size before changing the quantity.");
                    return;
                }

                if (quantity < 50) {
                    quantity++; // Increase the quantity value
                    $('#quantity').val(quantity); // Update the quantity input value
                    updatePrice(); // Update the price based on the new quantity and selected size
                }
            });


            // Decrease quantity event
            $('#quantity-left-minus').click(function (e) {
                e.preventDefault();
                var selectedSize = $('input[name="psize"]:checked').val(); // Get the selected size value

                if (selectedSize === undefined || selectedSize === "") {
                    alert("Please select a size before changing the quantity.");
                    return;
                }

                if (quantity > 1) {
                    quantity--; // Decrease the quantity value
                    $('#quantity').val(quantity); // Update the quantity input value
                    updatePrice(); // Update the price based on the new quantity and selected size
                }
            });


            // Size selection event
            $('input[name="psize"]').change(function () {
                var selectedSizePrice = parseInt($('#selected-size-price').text()); // Get the price of the selected size
                updatePrice(); // Update the price based on the selected size and current quantity
            });

            // Initial price update
            updatePrice();
        });
    </script>
    <script>
        $(document).ready(function () {
            // Lấy giá ban đầu từ server
            var basePrice = ${p.getPrice()};
            // Hiển thị giá ban đầu
            $('#product-price').text(basePrice);

            // Xử lý sự kiện khi chọn size
            $('input[name="psize"]').change(function () {
                // Lấy giá trị của size được chọn
                var selectedSizeId = $(this).val();
                // Gửi yêu cầu AJAX để lấy giá của size từ server
                $.ajax({
                    url: 'GetPriceBySize', // Đường dẫn tới servlet hoặc controller để xử lý yêu cầu
                    type: 'POST',
                    data: {sizeId: selectedSizeId, productId: ${p.getId()}}, // Gửi tham số kích thước và ID sản phẩm
                    success: function (response) {
                        // Cập nhật giá mới
                        $('#selected-size-price').text(response);
                        // Hiển thị giá mới
                        $('#product-price').text(basePrice + parseInt(response));
                    },
                    error: function (xhr, status, error) {
                        console.log(error); // Xử lý lỗi nếu có
                    }
                });
            });
        });
    </script>
</body>

</html>