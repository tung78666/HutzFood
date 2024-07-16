/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.FeedbackDAO;
import Model.Feedback;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AdminManageFeedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        User user = (User) session.getAttribute("account");
        switch (action) {
            case "list": {
                String indexS = request.getParameter("index");
                if (indexS == null) {
                    indexS = "1";
                }
                int index = Integer.parseInt(indexS);
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                int total = feedbackDAO.getAllFeecbackTotal();
                List<Feedback> feedbackList = feedbackDAO.getAllFeedback(index);
                
                 int lastPage = total / 5;
                if (total % 5 != 0) {
                    lastPage++;
                }
                 request.setAttribute("endP", lastPage);
                request.setAttribute("selectedPage", index);
                request.setAttribute("feedbackList", feedbackList);
                request.getRequestDispatcher("AdminManageFeedback.jsp").forward(request, response);
                break;
            }
            case "delete": {
                int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                feedbackDAO.deleteFeedback(feedbackId);
                List<Feedback> feedbackList = feedbackDAO.getFeedbackByUser(user.getId());
                request.setAttribute("feedbackList", feedbackList);
                request.getRequestDispatcher("AdminManageFeedback.jsp").forward(request, response);
                break;
            }
        }
        response.sendRedirect("Login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
