<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Feedback</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .feedback-card {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-3">
            <h2 class="mb-4">My feedback</h2>
            <c:choose>
                <c:when test="${not empty feedbackList}">
                    <div class="list-group">
                        <c:forEach var="feedback" items="${feedbackList}">
                            <div class="list-group-item list-group-item-action flex-column align-items-start">
                                <img src="${feedback.product.image}" class="img-fluid" alt="Colorlib Template" style="width: 50px; height: 50px">

                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">${feedback.product.name}</h5>
                                    <small>Date: ${feedback.date}</small>
                                </div>
                                <div class="d-flex w-100 justify-content-between">
                                    <p class="mb-1">${feedback.content}</p>
                                    <a href="ManageFeedback?action=delete&feedbackId=${feedback.user.id}" class="btn btn-delete">X</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>No feedback has been provided yet.</p>
                </c:otherwise>
            </c:choose>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


