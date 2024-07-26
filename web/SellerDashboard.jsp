<%-- 
    Document   : SellerDashbord
    Author     : Ngocnl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="CSSsimple/sellerDashbord.css">

        <title>Seller Dashbord</title>     
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
                <c:set var="page" value="${requestScope.page}"/>
                <c:set var="selectStatus" value="${requestScope.selectStatus}"/>
                <div class="head-title">
                    <div class="left">
                        <h1>Order Manage</h1>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Order confirmation</h3>
<!--                            <div>
                                <form action="SellerDashboard" method="post">
                                    <input type="search" name="search" placeholder="Search by Phone Number">
                                    <input name="selectStatus" value="${selectStatus}" hidden/>
                                    <input style="background: var(--blue); color: white; border: solid var(--blue); font-size: 17px; border-radius: 15px;padding: 5px"
                                           type="submit">
                                </form>
                            </div>-->
                            <select class="tail" name="select" onchange="test(this)">
                                <option value="0" ${selectStatus == 0 ? 'selected' :''}>All</option> 
                                <c:forEach items="${otlist}" var="ot">
                                    <c:if test="${ot.getId() == 1 || ot.getId() == 2 || ot.getId() == 3}">
                                        <option value="${ot.getId()}" ${selectStatus == ot.getId() ? 'selected' :''}>${ot.getName()}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div> 
                        <table>
                            <thead>
                                <tr>
                                    <th>Name Order</th>
                                    <th>Date Order</th>
                                    <th>Notes</th>
                                    <th>Address Order</th>
                                    <th>Phone Order</th>
                                    <th>Status Order</th>
                                </tr>
                            </thead>
                            <tbody id="order-list">
                                <c:forEach items="${olist}" var="o">
                                    <tr id="order">
                                        <td><p>${o.getOrderName()}</p></td>
                                        <td>${o.formatDate()}</td>
                                        <td><textarea class="note" readonly>${o.getNotes()}</textarea></td>
                                        <td><textarea class="address" readonly>${o.getAddress()}</textarea></td>
                                        <td>${o.getPhone()}</td>
                                        <td hidden id="orderS">${o.getStatus().getName()}</td>
                                        <td>
                                            <c:set var="statusClass" value="" />
                                            <c:choose>
                                                <c:when test="${o.getStatus().getId() == 1}">
                                                    <c:set var="statusClass" value="process" />
                                                </c:when>
                                                <c:when test="${o.getStatus().getId() == 2}">
                                                    <c:set var="statusClass" value="pending" />
                                                </c:when>
                                                <c:when test="${o.getStatus().getId() == 3}">
                                                    <c:set var="statusClass" value="queue" />
                                                </c:when>
                                            </c:choose>
                                            <form action="updateOrderStatus" method="get">
                                                <span class="status ${statusClass}">
                                                    <select name="select" onchange="confirmationBox(this)">
                                                        <option valueư="0">${o.getStatus().getName()}</option> 
                                                        <c:forEach items="${otlist}" var="ot">
                                                            <c:if test="${ot.getId() != o.getStatus().getId()}">
                                                                <option value="${ot.getId()}&${o.getId()}">${ot.getName()}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>   
                                                </span>
                                            </form>
                                        </td>   
                                    </tr>                               
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="pagination">
                            <c:forEach begin="1" end="${requestScope.numpage}" var="nu">
                                <a href="SellerDashboard?page=${nu}&select=${selectStatus}" class="${nu == page ? 'active' : ''}">${nu}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script>
            function confirmationBox(selectElement) {
                const selectedValue = selectElement.options[selectElement.selectedIndex].text;
                if (confirm("Are you sure to change status to " + selectedValue + " ?")) {
                    selectElement.form.submit();
                }
            }
            function test(selectElement) {
//                const filter = selectElement.options[selectElement.selectedIndex].textContent.toLowerCase();
//                console.log(filter);
//                const items = document.querySelectorAll('#order-list #order');
//                if (filter !== null) {
//                    items.forEach(item => {
//                        const text = item.querySelector('#orderS').textContent.toLowerCase();
//                        if (text.includes(filter)) {
//                            item.style.display = '';
//                        } else {
//                            item.style.display = 'none';
//                        }
//                    });
//                } else {
//                    items.forEach(item => {
//                        item.style.display = ''
//                    });
//                }
                // Get the selected option's value
                const selectedValue = selectElement.value;

                // Redirect to the SellerDashboard servlet with the selected value as a parameter
                window.location.href = 'SellerDashboard?select=' + selectedValue;
            }
        </script>
        <script src="js/adminDashbord.js"></script>
    </body>
</html>
