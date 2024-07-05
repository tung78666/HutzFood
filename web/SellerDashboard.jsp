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
                <div class="head-title">
                    <div class="left">
                        <h1>Order Manage</h1>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Order confirmation</h3>                   
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
                            <tbody>
                                <c:forEach items="${olist}" var="o">
                                    <tr>
                                        <td><p>${o.getOrderName()}</p></td>
                                        <td>${o.formatDate()}</td>
                                        <td><textarea class="note" readonly>${o.getNotes()}</textarea></td>
                                        <td><textarea class="address" readonly>${o.getAddress()}</textarea></td>
                                        <td>${o.getPhone()}</td>
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
                                                        <option value="0">${o.getStatus().getName()}</option> 
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
        </script>
        <script src="js/adminDashbord.js"></script>
    </body>
</html>
