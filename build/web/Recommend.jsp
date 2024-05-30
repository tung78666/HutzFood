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

                width: 80%;
                padding: 10px;
                z-index: 1;
                position: absolute;
                top: 80px;
                left: 140px;

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
        </style>
    </head>
    <body>
        <c:set var="acc" value="${sessionScope.account}"/>
        <jsp:include page="Header.jsp"/>
        <img src="images/recommend-background.jpg" alt="alt" style="width: 100%;z-index: 0;"/>
        <div id="upper-form">
            <h3 id="headline" style="">Recommend</h3><br/>
            <form id="f1" action="RecommendServlet" method="post">
                1.Student email / Staff email *<br/><input type="email" name="userEmail" required/><br/>
                2.ISBN-13 (Required to foreign language)<br/><input type="number" name="ISBN"/><br/>
                3.Tên tài liệu/Title *<br/><input type="text" name="title" required><br/>
                4.Tên tác giả/ Author *<br/><input type="text" name="author" required/><br/>
                5.Nhà xuất bản/ Publisher<br/><input type="text" name="publisher"/><br/>
                6.Thời gian cần? Request time *
                <div required>
                    <input type="radio" name="Request_time" value="3"/>Gấp (yêu cầu nêu rõ lý do Gấp ở mục 7)<br/>
                    <input type="radio" name="Request_time" value="2"/>25-30 ngày đối với sách Tiếng Việt, 8-12 tuần đổi với sách Ngoại văn<br/>
                    <input type="radio" name="Request_time" value="1"/>Không vội<br/>
                </div>
                7.Lý do yêu cầu bổ sung? (Tham khảo cho mã môn học nào?...) / Reason for Request (Reference for subject code?...) *
                <br/><textarea style="display: flex ;width: 100%" name="Reason" required></textarea><br/>
                8.Link thông tin sách
                <br/><textarea style="display: flex ;width: 100%" name="Link" ></textarea><br/>
                9.Giảng viên thẩm định đề xuất?/ Proposal appraiser?
                <br/><textarea style="display: flex ;width: 100%" name="Proposal" ></textarea><br/>
                10.Góp ý về dịch vụ/Feedback
                <br/><textarea style="display: flex ;width: 100%" name="Feedback" ></textarea><br/>
                <button type="submit" class="btn badge-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
