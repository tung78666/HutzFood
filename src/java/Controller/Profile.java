/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.Role;
import Model.User;
import Model.UserStatus;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        String DOB_raw = request.getParameter("DOB");
        String phone = request.getParameter("phone");
        String loc1 = request.getParameter("loc1");
        String loc2 = request.getParameter("loc2");
        UserDAO udao = new UserDAO();
        HttpSession session = request.getSession();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        // Regular expression to check for special characters
        String specialCharPattern = "^[^a-zA-Z0-9]*$";

        // Validation
        if (isNullOrEmpty(name) || isNullOrEmpty(phone) || isNullOrEmpty(loc1) || isNullOrEmpty(loc2)
                || name.matches(specialCharPattern) || phone.matches(specialCharPattern)
                || loc1.matches(specialCharPattern) || loc2.matches(specialCharPattern)) {
            User oldU = udao.getUserById(Integer.valueOf(id));
            session.setAttribute("account", oldU);
            request.setAttribute("error", "Invalid input. Please ensure all fields are filled correctly.");
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
            return;
        }

        try {
            Date date = formatter.parse(DOB_raw);
            User oldU = udao.getUserById(Integer.valueOf(id));
            User newU = new User(Integer.valueOf(id), name, email, oldU.getPassword(), oldU.getRole(),
                    oldU.getUserStatus(), oldU.getPoint(), date, phone, loc1, loc2);
            udao.updateUser(newU);
            session.removeAttribute("account");
            session.setAttribute("account", newU);
            request.setAttribute("mess", "Updated Successfully");
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().println(e);
        }
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
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
