<%-- 
    Document   : Comfirm_Order
    Created on : Jul 9, 2024, 6:15:43 PM
    Author     : Ngocnl
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Invoice Gen</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="CSSsimple/Comfirm_Order.css"
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <!--Body-->
        <div class="ftco-section" style="padding-top: 100px">
            <div class="container">
                <div class="row slider-text justify-content-center align-items-center">
                    <div class="col-md-7 col-sm-12 text-center" style="background-color: rgba(128, 128, 128, 0.5);border-radius: 8px;">
                        <h1 class="mb-3 mt-5 bread">Cảm ơn quý khách đã đặt hàng!</h1>
                        <p class="breadcrumbs"><span class="mr-2" style="background-color: rgba(114, 22, 224,0.5);border-radius: 3px"><a href="Home" style="padding: 10px">Home</a></span></p>
                    </div>
                </div>
                <div class="row justify-content-center align-items-center" style="padding-top: 10px">
                    <div class="col-xl-8" style="padding: 20px;background-color: rgba(128, 128, 128, 0.6);border-radius: 8px;">
                        <div>
                            <section class="thong-tin-don-hang">
                                <h2>Thông tin đơn hàng</h2>
                                <table>
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
                                </table>
                            </section>
                            <section class="chi-tiet-don-hang">
                                <h2>Chi tiết đơn hàng</h2>
                                <table>
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
                                </table>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Body-->
        <jsp:include page="Footer.jsp"/>
        
        <style>
            h2{
                color: #f89d19;
            }
            th{
                color: #f89d19;
            }
            td{
                color: #f89d19;
            }
        </style>
    </body>
</html>


