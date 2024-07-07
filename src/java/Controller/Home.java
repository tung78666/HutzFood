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
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ducnt
 */
public class Home extends HttpServlet {

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
//        try ( PrintWriter out = response.getWriter()) {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        ProductDAO pdao = new ProductDAO();
        ProductSizeDao pdsizeDAO = new ProductSizeDao();
        ArrayList<Product> plist = pdao.getProduct("", "", 1, "1");
        ArrayList<Product> plist2 = pdao.getProduct("2", "", 1, "1");
        ArrayList<Product> plist1 = pdao.getTopSelling();
        request.setAttribute("plist", plist);
        request.setAttribute("plist1", plist1);
        request.setAttribute("plist2", plist2);
        Cookie[] cookies = request.getCookies();
        List<ProductDTO> map = new ArrayList<>();
        if (cookies != null) {
            for (Cookie i : cookies) {
                if (i.getName().equals("map")) {
                    String value = i.getValue();
                    String[] list = value.split("/");
                    for (int idx = 0; idx < list.length; idx += 4) {
                        Product p = pdao.getProductById(Integer.parseInt(list[idx]));
                        ProductSize pdsize = null;
                        if (!list[idx + 1].equals("none")) {
                            pdsize = pdsizeDAO.getProductSizeById(Integer.parseInt(list[idx + 1]));
                        }
                        int quantity = Integer.parseInt(list[idx + 2]);
                        User user = new UserDAO().getUserById(Integer.parseInt(list[idx + 3]));
                        //Check if user logouted
                        if (u != null) {
                            //Check if this cart is for the right person cart
                            if (u.getId() == user.getId()) {
                                ProductDTO pdto = new ProductDTO(p, pdsize, quantity, user);
                                map.add(pdto);
                            }
                        }
                    }
                }
            }
        }
        session.setAttribute("map", map);
        request.getRequestDispatcher("Home.jsp").forward(request, response);

//        } catch (Exception e) {
//
//        }
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
