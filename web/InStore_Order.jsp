<%-- 
    Document   : In-store_Order
    Created on : Jul 4, 2024, 12:50:12 PM
    Author     : Ngocnl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="CSSsimple/sellerDashbord.css">
        <link rel="stylesheet" href="CSSsimple/InStore.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <title>In-store Order</title>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <!-- SIDEBAR -->
        <jsp:include page="headerSeller.jsp"/>

        <!-- CONTENT -->
        <section id="content">
            <!-- MAIN -->
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>

            </nav>
            <!-- NAVBAR -->

            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>In-store Ordering</h1><br/>
                        <h4 style="font-weight: bold;color: red;" ${requestScope.message == 'null' ? 'hidden' : ''}>${requestScope.message}</h4>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Placing Order</h3>                   
                        </div>             
                        <div>
                            <div class="PO">
                                <div class="PO-content">
                                    <div class="product-screen">
                                        <!--Left Pane-->
                                        <div class="leftpane">
                                            <div class="order-container">
                                                <c:forEach items="${sessionScope.map}" var="i" varStatus="idx">
                                                    <li class="orderline">
                                                        <div><a href="deleteProduct?idx=${idx.index}"><i class='bx bx-x-circle'></i></a></div>
                                                        <div class="orderline-content">
                                                            <div class="product-name">${i.product.name}</div>
                                                            <div class="product-size">${i.productSize != null ? i.productSize.name : ''}</div>
                                                            <div class="product-price"><span class="priceSpan">${i.product.price}00&nbsp;đ</span></div>
                                                        </div>
                                                        <ul class="info-list">
                                                            <li class="price-per-unit">
                                                                <em class="qty">${i.getQuantity()}</em> x ${i.productSize != null ? i.productSize.price + i.product.price : i.product.price}00&nbsp;đ <span>/ Units</span>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </c:forEach>
                                            </div>
                                            <div class="order-summary">
                                                Total: <span class="total">${requestScope.total}00&nbsp;đ</span>
                                            </div>
                                            <div class="pads" >
                                                <form class="subpads" style="display: flex;flex-direction: row;" action="InStoreOrder" method="post">
                                                    <div class="actionpad">
                                                        <button class="submit-order" type="submit"  name="pm" value="1"><!--data-toggle="modal" data-target="#CheckOut"-->
                                                            <a style="padding-bottom: 30px;padding-top: 30px" >Order</a>
                                                        </button>
                                                    </div>
                                                    <div class="actionpad">
                                                        <textarea style="display: flex ;width: 100%; flex-grow: 1; overflow-y: scroll" name="note" placeholder="Note..." id="note"></textarea>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                            
                                            
<!--                                            <div class="modal fade" id="CheckOut" role="dialog">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h4 class="modal-title">Payment method: </h4>
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        </div>
                                                                        <form action="InStoreOrder" method="post">
                                                                                <div class="select-wrap">
                                                                                        <label>
                                                                                            <span><input type="radio" name="pm" value="1" required>BY CASH </span>
                                                                                        </label><br>
                                                                                        <label>
                                                                                            <span><input type="radio" name="pm" value="2" required>BY VietQR</span>
                                                                                        </label><br>
                                                                                </div>
                                                                            <input name="note" id="notehidden" type="hidden"/>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                <button type="submit" class="btn btn-success" value="submit" onclick="getNoteData()()">Submit</button>
                                                                            </div>
                                                                        </form>                            
                                                                    </div>
                                                                </div>
                                                            </div>-->
                                            
                                            
                                        <!--Right pane-->
                                        <div class="rightpane">
                                            <div class="products-widget">
                                                <div class="products-widget-control">
                                                    <div class="category-buttons">
                                                        <button class="category-button"  onclick="test(this)"><span class="category-name" id="cateFilter" >All</span></button>
                                                        <c:forEach items="${requestScope.cList}" var="i" varStatus="idx">
                                                            <i style="opacity: 0;padding: 2px"></i>
                                                            <button class="category-button"  onclick="test(this)"><span class="category-name" id="cateFilter">${i.getName()}</span></button>
                                                            </c:forEach>
                                                    </div>
                                                    <div class="search-bar">
                                                        <form class="input-group" action="InStoreOrder" method="get">
                                                            <div class="input-container">
                                                                <i class="fa fa-search"></i>
                                                                <input class="search-input" name="search" type="text" placeholder="Search products...">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="product-list-container">
                                                    <div class="product-list" id="prod-list">
                                                        <c:forEach items="${requestScope.pList}" var="i" varStatus="idx">
                                                            <article class="product" data-toggle="modal" data-target="#myModal${i.getId()}">
                                                                <div class="product-img">
                                                                    <img src="${i.getImage()}" alt="${i.getName()}">
                                                                </div>
                                                                <div class="product-content">
                                                                    <div class="product-name">${i.getName()}</div>
                                                                    <span class="price-tag">${i.getPrice()}00&nbsp;đ</span>
                                                                </div>
                                                                <div hidden class="prod-cate">${i.getCategory().getName()}</div>
                                                            </article>

                                                            <div class="modal fade" id="myModal${i.getId()}" role="dialog">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h4 class="modal-title">Addtion infomation: </h4>
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        </div>
                                                                        <form action="AddToCart" method="post">
                                                                            <input type="hidden" value="${i.getId()}" name="pid">
                                                                            <div class="modal-body">
                                                                                <div class="select-wrap">
                                                                                    <span style="font-size: 20px">Select Size:</span><br>
                                                                                    <c:forEach items="${slist}" var="s">
                                                                                        <label>
                                                                                            <span><input type="radio" name="psize" value="${s.getId()}" required>${s.getName()}: <p style="color: #f8b500; display: inline-block"> +${s.getPrice()}</span>00đ</p>
                                                                                        </label><br>
                                                                                    </c:forEach>
                                                                                </div>
                                                                                <div class="select-wrap">
                                                                                    <span style="font-size: 20px">Select Quantity:</span><br>
                                                                                    <input type="number" id="quantity" name="quantity" min="1" max="50" value="1" required/>
                                                                                </div>

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
                                                    </div>
                                                    <div class="portal search-database-button no-results-message"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script>
            window.onload = function () {
                const chooseCate = ${requestScope.chooseCate == null};
                if (chooseCate) {
                    const  cates = document.querySelectorAll('.category-button');
                    cates.forEach(cate => {
                        const text = cate.querySelector('.category-name').textContent;
                        if (text === 'All') {
                            cate.click();
                        }
                    });
                }
            };

            function test(selectElement) {
                const filter = selectElement.querySelector('.category-name').textContent.toLowerCase();
                const items = document.querySelectorAll('#prod-list .product');
                if (filter !== 'all') {
                    items.forEach(item => {
                        const text = item.querySelector('.prod-cate').textContent.toLowerCase();
                        if (text.includes(filter)) {
                            item.style.display = '';
                        } else {
                            item.style.display = 'none';
                        }
                    });
                } else {
                    items.forEach(item => {
                        item.style.display = ''
                    });
                }
            }
            function getNoteData(){
                document.getElementById('notehidden').value=document.getElementById('note').value;
                
            }

        </script>
        <script >
            function submitForm() {
                document.getElementById('filterForm').submit();
            }
        </script>
        <script src="js/adminDashbord.js"></script>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

