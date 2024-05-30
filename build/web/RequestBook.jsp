<%-- 
    Document   : Recommend
    Created on : Mar 8, 2024, 3:44:58 PM
    Author     : Dan09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!D%OCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recommend</title>
        <!-- bootstrap css -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css"/>
        <!-- style css -->
        <link rel="stylesheet" href="assets/css/bootstrap-grid.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="assets/css/bootstrap-reboot.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <style>
            #upper-form{
                background: lightgrey;
                border: 2px solid;
                border-radius: 20px;

                width: fit-content;
                padding: 10px;
                z-index: 1;
                position: absolute;
                top: 80px;

            }
            #headline{
                background-color: #f5f5f7;
                border-radius: 15px;
                align-self: center;
                padding: 10px;
                border: 2px solid;
                width: fit-content;
                position: relative;
                left: 45%;
            }
            #f1{
                background-color: #faeddd;
                border: 2px solid;
                width: fit-content;
                align-self: center;
                padding: 50px;
                position: relative;
                left: 10%
            }
            table{
                width: auto;
                max-width: 80%;
                border-collapse: collapse;
                margin: 20px; /* Optional margin for better appearance */

            }
            th, td {
                padding: 10px;
                border: 1px solid #000;
                text-align: left;
            }
        </style>

    </head>
    <body>
        <c:set var="acc" value="${sessionScope.account}"/>
        <jsp:include page="Header.jsp"/>
        <img src="images/recommend-background.jpg" alt="alt" style="width: 100%;z-index: 0;"/>
        <div id="upper-form">
            <h3 style="background-color: #f5f5f7;border-radius: 15px;align-self: center;padding: 10px;border: 2px solid">REQUEST BORROW</h3><br/>
            <h6 style="align-self: center;text-align: center">List of Books that can be RENEW:</h6>


            <table style="width: 100%" id="border" >
                <tr id="border">
                    <th id="border">RecommendID</th>
                    <th id="border">UserEmail</th>
                    <th id="border">ISBN</th>
                    <th id="border">Title</th>
                    <th id="border">Author</th>
                    <th id="border">PName</th>
                    <th id="border">RequestTime</th>
                    <th id="border">RequestPurpose</th>
                    <th id="border">BookLink</th>
                    <th id="border">MentorProposal</th>
                    <th id="border">Feedback</th>
                    <th id="border">Action</th>
                </tr>
                <c:forEach items="${requestScope.r}" var="b">
                    <tr>
                        <td>${b.getRecommendID()}</td>
                        <td>${b.getUserEmail()}</td>
                        <td>${b.getISBN()}</td>
                        <td>${b.getTitle()}</td>
                        <td>${b.getAuthor()}</td>
                        <td>${b.getPName()}</td>
                        <td>
                            <c:if test="${b.getRequestTime()==3}"><h5 style="color: red">At most IMPORTANT</h5></c:if>
                            <c:if test="${b.getRequestTime()==2}"><h5 style="color: yellow">Needed</h5>></c:if>
                            <c:if test="${b.getRequestTime()==1}"><h5 style="color: greenyellow">Not In a Hurry</h5></c:if>
                            </td>
                            <td>${b.getRequestPurpose()}</td>
                        <td>${b.getBookLink()}</td>
                        <td>${b.getMentorProposal()}</td>
                        <td>${b.getFeedback()}</td>

                        <td>
                            <form action="RequestBookServlet" method="get" style="display: flex">
                                <button type="submit" class="btn btn-success" value="${b.getRecommendID()}" name="Fullfill">Fullfill</button>
                                <button type="submit" class="btn btn-danger" value="${b.getRecommendID()}" name="Delete">Delete</button>
                                <input type="text" value="Delete reason">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
