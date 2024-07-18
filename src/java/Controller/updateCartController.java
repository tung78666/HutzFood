/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import DAO.ProductSizeDao;
import DAO.UserDAO;
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
import java.util.List;

/**
 *
 * @author kienb
 */
public class updateCartController extends HttpServlet {

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
            HttpSession session = request.getSession();
            if (session.getAttribute("account") != null) {
                session.removeAttribute("mess");
                // Get the index of the product to remove
                String index = request.getParameter("idx");
                String quantity = request.getParameter("quantity");
                if (Integer.parseInt(quantity) < 1) {
                    session.setAttribute("mess", "Quantity must be over or equal to 1");
                    response.sendRedirect("cart");
                } else {
                    // Get cookies and session
                    Cookie[] cookies = request.getCookies();
                    User u = new UserDAO().getUserById(((User) session.getAttribute("account")).getId());
                    // Retrieve the current product map from the session
                    List<ProductDTO> sessionMap = (List<ProductDTO>) session.getAttribute("map");

                    // Initialize the product list from cookies
                    List<ProductDTO> cookieMap = new ArrayList<>();

                    // Find and remove the old map cookie
                    Cookie mapCookie = null;
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("map")) {
                            mapCookie = cookie;
                            break;
                        }
                    }

                    // Convert the cookie value into a list of ProductDTO
                    if (mapCookie != null) {
                        String value = mapCookie.getValue();
                        String[] list = value.split("/");
                        for (int idx = 0; idx < list.length; idx += 4) {
                            Product p = new ProductDAO().getProductById(Integer.parseInt(list[idx]));
                            ProductSize pdsize = null;
                            if (!list[idx + 1].equals("none")) {
                                pdsize = new ProductSizeDao().getProductSizeById(Integer.parseInt(list[idx + 1]));
                            }
                            int quantityInCookie = Integer.parseInt(list[idx + 2]);
                            User user = new UserDAO().getUserById(Integer.parseInt(list[idx + 3]));
                            ProductDTO pdto = new ProductDTO(p, pdsize, quantityInCookie, user);
                            cookieMap.add(pdto);
                        }
                    }

                    // Get the product to remove from the session map
                    ProductDTO productToUpdate = sessionMap.get(Integer.parseInt(index));
                    //  the product from the cookies' list
                    // Update the product in the cookies' list
                    for (ProductDTO productDTO : cookieMap) {
                        if (productDTO.equals(productToUpdate)) {
                            productDTO.setQuantity(Integer.parseInt(quantity));
                            break;
                        }
                    }

                    // Clear old map cookie
                    if (mapCookie != null) {
                        mapCookie.setMaxAge(0);
                        response.addCookie(mapCookie);
                    }

                    // Rebuild the cookie value from the updated cookies' list
                    StringBuilder value = new StringBuilder();
                    for (ProductDTO productDTO : cookieMap) {
                        value.append(productDTO.getProduct().getId()).append("/");
                        value.append(productDTO.getProductSize() != null ? productDTO.getProductSize().getId() : "none").append("/");
                        value.append(productDTO.getQuantity()).append("/");
                        value.append(productDTO.getUser() != null ? productDTO.getUser().getId() : "no_user").append("/");
                    }

                    // Remove the trailing slash
                    if (value.length() > 0) {
                        value.setLength(value.length() - 1);
                    }

                    // Add the new cookie
                    if (!value.toString().isEmpty()) {
                        Cookie newCookie = new Cookie("map", value.toString());
                        newCookie.setMaxAge(7 * 3600); // Set the max age for the cookie
                        response.addCookie(newCookie);
                    }

                    List<ProductDTO> map = new ArrayList<>();
                    if (cookies != null) {
                        for (Cookie i : cookies) {
                            if (i.getName().equals("map")) {
                                String valueU = i.getValue();
                                String[] list = valueU.split("/");
                                for (int idx = 0; idx < list.length; idx += 4) {
                                    Product p = new ProductDAO().getProductById(Integer.parseInt(list[idx]));
                                    ProductSize pdsize = null;
                                    if (!list[idx + 1].equals("none")) {
                                        pdsize = new ProductSizeDao().getProductSizeById(Integer.parseInt(list[idx + 1]));
                                    }
                                    int quantityU = Integer.parseInt(list[idx + 2]);
                                    User user = new UserDAO().getUserById(Integer.parseInt(list[idx + 3]));
                                    //Check if user logouted
                                    if (u != null) {
                                        //Check if this cart is for the right person cart
                                        if (u.getId() == user.getId()) {
                                            ProductDTO pdto = new ProductDTO(p, pdsize, quantityU, user);
                                            map.add(pdto);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    session.setAttribute("map", map);
                    response.sendRedirect("cart");
                }

            } else {
                response.sendRedirect("Login.jsp");
            }
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
