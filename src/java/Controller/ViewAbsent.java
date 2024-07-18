/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AdminDAO;
import Model.Absent;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngocnlhe160359
 */
public class ViewAbsent extends HttpServlet {

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
        AdminDAO dao = new AdminDAO();
        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            User u = (User) session.getAttribute("account");

            // Lấy giá trị trang hiện tại từ tham số yêu cầu, nếu không có mặc định là 1
            int page = 1;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            // Tính tổng số bản ghi và tổng số trang
            int totalRecords = dao.getTotalAbsentRecords(null, null, null);

            // Lấy dữ liệu absent
            List<Absent> absents = dao.getAbsentData(null, null, null, page); // Get the first page with no filters
            List<Absent> absent_new = new ArrayList<>();
            for (Absent absent : absents) {
                System.out.println(absent.getUserId());
                    System.out.println(u.getId());
                if (absent.getUserId() == u.getId()) {
                    
                    absent_new.add(absent);
                }
            }
//            System.out.println(absent_new.get(0).getUserName());
            int totalPages = (int) Math.ceil((double) totalRecords / 6);
            // Thiết lập các thuộc tính để chuyển đến trang JSP
            request.setAttribute("absents", absent_new);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);

            // Chuyển hướng đến trang JSP
            request.getRequestDispatcher("/ViewAbsent.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login.jsp");

        }
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
        processRequest(request, response);
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
