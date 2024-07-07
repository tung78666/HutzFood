/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import DAO.ProductDAO;
import Model.Category;
import Model.Product;
import Model.ProductDTO;
import Model.ProductSize;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Ngocnl
 */
public class InStoreOrder extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InStoreOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InStoreOrder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);
        ProductDAO pDao = new ProductDAO();
        ArrayList<Product> p = pDao.getAll();
        ArrayList<Category> c = pDao.getCategory();
        ArrayList<ProductSize> slist = pDao.getProductSize();
        HttpSession session = request.getSession();
        if (session.getAttribute("map") != null) {
            List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
            double total = 0;
            for (ProductDTO i : map) {
                double price = i.getProduct().getPrice() + (i.getProductSize() == null ? 0 : i.getProductSize().getPrice());
                total += price * i.getQuantity();
            }
            request.setAttribute("total", total);
        } else {
            String message = "Your Login Session has ended please login.";
            request.setAttribute("message", message);
        }
        request.setAttribute("pList", p);
        request.setAttribute("cList", c);
        request.setAttribute("slist", slist);
        request.getRequestDispatcher("InStore_Order.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        String name = user.getName();
        String phone = user.getPhone();
        String address = user.getLocation1();
        String note = request.getParameter("note");
        String pm = request.getParameter("pm");
        List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
        session.removeAttribute("map");
        Cookie[] cookies = request.getCookies();
        for (Cookie i : cookies) {
            if (i.getName().equals("map")) {
                i.setMaxAge(0);
                response.addCookie(i);
                break;
            }
        }
        double total = 0;
        for (ProductDTO i : map) {
            double price = i.getProduct().getPrice() + (i.getProductSize() == null ? 0 : i.getProductSize().getPrice());
            total += price * i.getQuantity();
        }
        OrderDAO od = new OrderDAO();
        int discount = 0;
        discount = (int) (user.getPoint());
        if (total >= 500) {
            int point = 0;
            point = (int) total * 1 / 100;
            od.updateUser(point, user.getId());
        } else if (total < 500) {
            od.updateUser(0, user.getId());
        }
        if (Integer.parseInt(pm) == 1) {
            od.insertOrder(name, phone, address, note, discount, new Date(), user, map);
        } else if(Integer.parseInt(pm) == 2){
            od.insertOrderInStore(name, phone, address, note, discount, new Date(), user, map);
        }
        request.getRequestDispatcher("InStore_Order.jsp").forward(request, response);
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
