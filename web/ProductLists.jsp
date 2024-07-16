<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Menu</title>
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
        <section class="home-slider owl-carousel">

            <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center">

                        <div class="col-md-7 col-sm-12 text-center ftco-animate">
                            <h1 class="mb-3 mt-5 bread">Our Menu</h1>
                            <p class="breadcrumbs"><span class="mr-2"><a href="Home">Home</a></span> <span>Menu</span></p>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-menu mb-5 pb-5">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Discover</span>
                        <h2 class="mb-4">Our Products</h2>
                        <p></p>
                    </div>
                </div>

                <div class="row d-md-flex" style="padding-top: 100px">
                    <div class="category-buttons" style="margin-top: -94px;margin-bottom: -41px;">
                        <select style="background-color: black;color: wheat;height: 40px;border-radius: 10px;margin-left: 47px;margin-top: 53px;" class="category-button" name="sortC" onchange="test(this)">
                            <option value="-1" ${param['sortC']==-1 ?"selected":""}>All</option>
                            <c:forEach items="${requestScope.clist}" var="i" varStatus="idx">
                                <option value="${i.getId()}" ${param['sortC']== i.getId() ?"selected":""}>${i.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <form action="ProductLists"  method="get" style="
                          margin-top: -94px;
                          margin-bottom: -41px;">
                        <select style="
                                background-color: black;
                                color: wheat;
                                height: 40px;
                                border-radius: 10px;
                                margin-left: 47px;
                                margin-top: 53px;" name="sort" class="form-select"  onchange="this.form.submit()">
                            <option value="0" ${param['sort']==0?"selected":""}>Sort Default</option>
                            <option value="1" ${param['sort']==1?"selected":""}>Newest</option>
                            <option value="2" ${param['sort']==2?"selected":""}>Price ascending</option>
                            <option value="3" ${param['sort']==3?"selected":""}>Price descending</option>
                        </select>
                    </form>
                    <div class="col-lg-12 ftco-animate p-md-5">
                        <div class="row">

                            <div class="col-md-12 d-flex align-items-center">

                                <div class="tab-content ftco-animate" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
                                        <div class="product-list" id="prod-list">
                                            <c:forEach var="p" items="${plist}">
                                                <div class="product-item" id="prod">
                                                    <div hidden class="prod-cate">${p.getCategory().getId()}</div>
                                                    <div class="menu-wrap">
                                                        <a href="./ProductDetails?pid=${p.getId()}&mode=0">
                                                            <img src="${p.getImage()}" alt="${p.getName()}" class="menu-img mb-4">
                                                        </a>

                                                        <div class="text">
                                                            <h3><a href="./ProductDetails?pid=${p.getId()}&mode=0">${p.getName()}</a></h3>
                                                            <p style="color: #fff" class="price">Price:<span class="priceSpan">${p.getPrice()}</span>đ</p>
                                                            <p><a href="./ProductDetails?pid=${p.getId()}&mode=0" class="btn btn-primary btn-outline-primary">Order</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li><a href="ProductLists?index=1&categoryId=${param['categoryId']}">&lt;</a></li>
                                    <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                    <li class="${param['index']==i?'page-item active':'page-item'}"><a href="ProductLists?index=${i}&categoryId=${param['categoryId']}"><span>${i}</span></a></li>
                                            </c:forEach>
                                <li><a href="ProductLists?index=${numberPage}&categoryId=${param['categoryId']}">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
        <style>
            .product-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around; /* Ensures even spacing */
                gap: 20px; /* Adjusts the space between items */
            }

            .product-item {
                flex: 1 1 calc(33.333% - 20px); /* Adjusts the width of each item */
                box-sizing: border-box;
                text-align: center;
            }

            .menu-wrap {
                margin-bottom: 20px; /* Adds space at the bottom of each product */
            }

            .menu-img {
                display: block;
                width: 100%;
                height: 270px; /* Sets the fixed height */
                background-size: cover; /* Ensures the image covers the entire area */
                background-position: center; /* Centers the image */
                object-fit: cover; /* Ensures the image covers the entire area */
            }
        </style>
        <script>
                                    var priceSpans = document.querySelectorAll(".priceSpan");

                                    priceSpans.forEach(function (span) {
                                        var price = parseFloat(span.textContent);
                                        var formattedPrice = price.toFixed(3); // Định dạng giá trị với 3 số 0 sau dấu chấm
                                        span.textContent = formattedPrice;
                                    });

                                    function test(selectElement) {
                                        const filter = selectElement.value;
                                        const items = document.querySelectorAll('#prod-list #prod');
                                        if (filter !== '-1') {
                                            items.forEach(item => {
                                                const text = item.querySelector('.prod-cate').textContent.toLowerCase();
                                                if (text.includes(filter)) {
                                                    item.hidden = false;
                                                } else {
                                                    item.hidden = true;
                                                }
                                            });
                                        } else {
                                            items.forEach(item => {
                                                item.hidden = false;
                                            });
                                        }
                                    }
        </script>

    </body>
</html>

