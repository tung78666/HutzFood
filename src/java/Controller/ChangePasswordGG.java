/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MD5;
import DAO.UserDAO;
import Model.User;
import Model.UserGoogleDto;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Hoàng Vũ
 */
public class ChangePasswordGG extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        MD5 md5 = new MD5();
        String uid =request.getParameter("accGGId");
        if (!newpass.equals(renewpass)) {
            request.setAttribute("mess", "Confirm password not match with new password");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            dao.changePassword(uid, newpass);
            
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
        }
    }
    private User verifyUser(UserGoogleDto userGG) {
        UserDAO udao = new UserDAO();
        MD5 md5 = new MD5();
        ArrayList<User> userList = udao.getAllUser();
        User userI = userList.stream()
                .filter(user -> user.getEmail().equals(userGG.getEmail())
                && user.getUserStatus().getId() == 1
                )
                .findFirst().orElse(null);
        return userI;
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
