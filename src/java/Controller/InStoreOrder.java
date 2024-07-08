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
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lib.payos.PayOS;
import com.lib.payos.type.ItemData;
import com.lib.payos.type.PaymentData;
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
 * @author Nogcnl
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
        if (session.getAttribute("map") == null || ((List<ProductDTO>) session.getAttribute("map")).isEmpty() || ((List<ProductDTO>) session.getAttribute("map")).size() == 0) {
            String mess = (String) session.getAttribute("message");
            System.out.println(mess);
            if (session.getAttribute("message") == null) {
                String message="";
                if (((User) session.getAttribute("account")) == null) {
                    message = "Your Login Session has ended please login.";
                }
                request.setAttribute("message", message);
            } else {
                String message = (String) session.getAttribute("message");
                System.out.println(message);
                request.setAttribute("message", message);
            }
        } else {
            List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
            double total = 0;
            for (ProductDTO i : map) {
                double price = i.getProduct().getPrice() + (i.getProductSize() == null ? 0 : i.getProductSize().getPrice());
                total += price * i.getQuantity();
            }
            request.setAttribute("total", total);
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
        String note = request.getParameter("note");
        String pm = request.getParameter("pm");
        List<ProductDTO> map = (List<ProductDTO>) session.getAttribute("map");
        if (map == null || map.isEmpty() || map.size() == 0) {
            String mess = "Không có sản phẩm nào !!!";
            session.setAttribute("message", mess);
            // Redirect to the referring page
            response.sendRedirect("InStoreOrder");
        } else if (user == null) {
            String mess = "Your Login Session has ended please login.";
            session.setAttribute("message", mess);
            // Redirect to the referring page
            response.sendRedirect("InStoreOrder");
        } else {
            String name = user.getName();
            String phone = user.getPhone();
            String address = user.getLocation1();

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
                od.updateUser((int) user.getPoint(), user.getId());
            }
            if (Integer.parseInt(pm) == 1) {
                session.removeAttribute("map");
                Cookie[] cookies = request.getCookies();
                for (Cookie i : cookies) {
                    if (i.getName().equals("map")) {
                        i.setMaxAge(0);
                        response.addCookie(i);
                        break;
                    }
                }
                od.insertOrderInStore(name, phone, address, note, discount, new Date(), user, map);
                response.sendRedirect("InStoreOrder");
            } else if (Integer.parseInt(pm) == 2) {
                od.insertOrderInStore(name, phone, address, note, discount, new Date(), user, map);
                OnlineBankingPayOS(request, response, map);
            }
//            
        }

    }

    protected void OnlineBankingPayOS(HttpServletRequest request, HttpServletResponse response, List<ProductDTO> map)
            throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            final PayOS payOS = ConstantsPayOS.getPayOS();
//                final String productName = "Mì tôm hảo hảo ly";
            final String description = "Thanh toan don hang";
            final String returnUrl = "http://localhost:8080/HutzFood/OnlineCheckOut-GET";
            final String cancelUrl = "http://localhost:8080/HutzFood/OnlineCheckOut-POST";
//                final int price = 10000;

            // Gen order code
            String currentTimeString = String.valueOf(new Date().getTime());
            int orderCode = Integer.parseInt(currentTimeString.substring(currentTimeString.length() - 6));
            List<ItemData> itemList = new ArrayList<>();
            double total = 0;
            for (ProductDTO i : map) {
                double price = i.getProduct().getPrice() + (i.getProductSize() == null ? 0 : i.getProductSize().getPrice());
                ItemData item = new ItemData(i.getProduct().getName(), i.getQuantity(), (int) (price * 1000));
                itemList.add(item);
                total += price * i.getQuantity();
            }
            PaymentData paymentData = new PaymentData(orderCode, (int) total * 1000, description, itemList, cancelUrl, returnUrl);
            JsonNode data = payOS.createPaymentLink(paymentData);
            String checkoutUrl = data.get("checkoutUrl").asText();
            response.setHeader("Location", checkoutUrl);
            response.setStatus(HttpServletResponse.SC_FOUND);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while creating the payment link.");
        }
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
