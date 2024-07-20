/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.FeedbackDAO;
import DAO.ProductDAO;
import DAO.ProductSizeDao;
import DAO.UserDAO;
import Model.Product;
import Model.ProductDTO;
import Model.ProductSize;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get new product information
            HttpSession session = request.getSession();
            String pid = request.getParameter("pid");
            String psize = request.getParameter("psize");
            String quantity = request.getParameter("quantity");
            User u = new User();
            if (session.getAttribute("account") != null) {
                u = new UserDAO().getUserById(((User) session.getAttribute("account")).getId());
            } else {
                request.setAttribute("feedback", new FeedbackDAO().getFeedbackById(Integer.valueOf(pid)));
                request.setAttribute("count", new FeedbackDAO().countComment(Integer.valueOf(pid)));
                request.setAttribute("slist", new ProductDAO().getProductSize());
                request.setAttribute("p", new ProductDAO().getProductById(Integer.valueOf(pid)));
                request.setAttribute("message", "Please Login");
                session.setAttribute("message", "Please Login");
                // Redirect to the referring page
                String url = request.getHeader("referer");
                response.sendRedirect(url);
            }
            int num = 1;
            if (quantity != null) {
                num = Integer.parseInt(quantity);
            }
            //Get Old list Global

            // Initialize the product list
            List<ProductDTO> map = new ArrayList<>();
            ProductDAO pdo = new ProductDAO();
            ProductSizeDao pds = new ProductSizeDao();

            // Get existing cookies
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie i : cookies) {
                    if (i.getName().equals("map")) {
                        String value = i.getValue();
                        String[] list = value.split("/");
                        for (int idx = 0; idx < list.length; idx += 4) {
                            Product p = pdo.getProductById(Integer.parseInt(list[idx]));
                            ProductSize pdsize = null;
                            if (!list[idx + 1].equals("none")) {
                                pdsize = pds.getProductSizeById(Integer.parseInt(list[idx + 1]));
                            }
                            int quantityInCookie = Integer.parseInt(list[idx + 2]);
                            User user = new UserDAO().getUserById(Integer.parseInt(list[idx + 3]));
                            // Check if user is logged in and the cart is for the right person
                            ProductDTO pdto = new ProductDTO(p, pdsize, quantityInCookie, user);
                            map.add(pdto);
                        }
                        // Clear old cookie
                        i.setMaxAge(0);
                        response.addCookie(i);
                        break;
                    }
                }
            }

            // Get Product and ProductSize
            Product p = pdo.getProductById(Integer.parseInt(pid));
            ProductSize pdsize = null;
            if (psize != null && !psize.isEmpty()) {
                pdsize = pds.getProductSizeById(Integer.parseInt(psize));
            }

            // Create new ProductDTO
            ProductDTO newProductDTO = new ProductDTO(p, pdsize, num, u);

            // If product already exists in the list, increase the quantity
            for (ProductDTO test : map) {
                System.out.println(test.equals(newProductDTO));
            }
            System.out.println(map.contains(newProductDTO));
            if (map.contains(newProductDTO)) {
                int index = map.indexOf(newProductDTO);
                map.get(index).setQuantity(map.get(index).getQuantity() + num);
            } else {
                map.add(newProductDTO);
            }
            // Build the cookie value
            StringBuilder value = new StringBuilder();
            for (ProductDTO productDTO : map) {
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
            Cookie c = new Cookie("map", value.toString());
            c.setMaxAge(7 * 3600);
            response.addCookie(c);

            List<ProductDTO> mapU = new ArrayList<>();

            String valueU = c.getValue();
            String[] list = valueU.split("/");
            for (int idx = 0; idx < list.length; idx += 4) {
                Product pU = pdo.getProductById(Integer.parseInt(list[idx]));
                ProductSize pdsizeU = null;
                if (!list[idx + 1].equals("none")) {
                    pdsizeU = pds.getProductSizeById(Integer.parseInt(list[idx + 1]));
                }
                int quantityInCookie = Integer.parseInt(list[idx + 2]);
                User user = new UserDAO().getUserById(Integer.parseInt(list[idx + 3]));
                // Check if user is logged in and the cart is for the right person
                if (u != null && u.getId() == user.getId()) {
                    ProductDTO pdto = new ProductDTO(pU, pdsizeU, quantityInCookie, user);
                    mapU.add(pdto);
                }
            }

            // Set updated list in session
            session.setAttribute("map", mapU);
            // Redirect to the referring page
            String url = request.getHeader("referer");
            response.sendRedirect(url);
        } catch (Exception e) {
//            String url = request.getHeader("referer");
//            response.sendRedirect(url);
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
