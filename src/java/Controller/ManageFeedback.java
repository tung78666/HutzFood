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

public class ManageFeedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        User user = (User) session.getAttribute("account");
        switch (action) {
            case "list": {
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                List<Feedback> feedbackList = feedbackDAO.getFeedbackByUser(user.getId());
                request.setAttribute("feedbackList", feedbackList);
                request.getRequestDispatcher("ViewFeedback.jsp").forward(request, response);
                break;
            }
            case "delete": {
                int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                feedbackDAO.deleteFeedback(feedbackId);
                List<Feedback> feedbackList = feedbackDAO.getFeedbackByUser(user.getId());
                request.setAttribute("feedbackList", feedbackList);
                request.getRequestDispatcher("ViewFeedback.jsp").forward(request, response);
                break;
            }
        }
        response.sendRedirect("Login.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
