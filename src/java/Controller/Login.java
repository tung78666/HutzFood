/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MD5;
import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.ArrayList;

/**
 *
 * @author ducnt
 */
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String rem = request.getParameter("rem");
        UserDAO udao = new UserDAO();
        MD5 md5 = new MD5();
        ArrayList<User> userList = udao.getAllUser();
        String mess = "Email or password wrong!";
        User userI = null;
        //Find the first user that has the same email , status Active , hashed password the same
        userI = userList.stream()
                .filter(user -> user.getEmail().equals(email)
                && user.getUserStatus().getId() == 1
                && user.getPassword().equals(md5.getMd5(pass))
                )
                .findFirst().orElse(null);
        if (userI != null) {
            //Gen a random token fake as password
            String token = generateRandomString(pass.length());

            //IF remember me is checked then save cookies of the user
            rememberAcc(response, email, userI.getPassword(), token, rem);
            session.setAttribute("rememberToken", token);
        } else if (getCookieValue(request, "crem") != null && userI == null) {
            //Check if the token that act as password has been changed or not
            if (pass.equals(getCookieValue(request, "ctoken"))) {
                userI = userList.stream()
                        .filter(user -> user.getEmail().equals(email)
                        && user.getUserStatus().getId() == 1
                        && user.getPassword().equals(getCookieValue(request, "cpass"))
                        )
                        .findFirst().orElse(null);
                if (userI != null) {
                    //Gen a random token fake as password
                    String token = generateRandomString(pass.length());

                    //IF remember me is checked then save cookies of the user
                    rememberAcc(response, email, getCookieValue(request, "cpass"), token, rem);
                    session.setAttribute("rememberToken", token);
                }
            }

        }

        //IF found then go to the page base on user role
        if (userI != null) {
            switch (userI.getRole().getId()) {
                case 1:
                    session.setAttribute("account", userI);
                    response.sendRedirect("ManageProduct");
                    break;
                case 2:
                    session.setAttribute("account", userI);
                    response.sendRedirect("SellerDashboard");
                    break;
                case 3:
                    session.setAttribute("account", userI);
                    response.sendRedirect("Home");
                    break;
            }
        } else {
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    void rememberAcc(HttpServletResponse response, String email, String pass, String token, String rem) {
        //Tao cookie
        Cookie cu = new Cookie("cemail", email);
        Cookie cp = new Cookie("cpass", pass);
        Cookie ct = new Cookie("ctoken", token);
        Cookie cr = new Cookie("crem", rem);

        int maxAge = (rem != null) ? 3600 * 120 : 0;
        // Set max age and other cookie properties
        cu.setMaxAge(maxAge);
        cp.setMaxAge(maxAge);
        ct.setMaxAge(maxAge);
        cr.setMaxAge(maxAge);

        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(ct);
        response.addCookie(cr);
    }

    private String getCookieValue(HttpServletRequest request, String cookieName) {
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals(cookieName)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    public static String generateRandomString(int length) {
        // Define the set of characters that can be included in the random string.
        final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        // Create a secure random number generator.
        SecureRandom random = new SecureRandom();
        //Create a StringBuilder that take in the length user want
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(index));
        }
        return sb.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
