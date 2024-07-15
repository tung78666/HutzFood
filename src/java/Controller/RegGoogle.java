/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.MD5;
import DAO.UserDAO;
import Model.Role;
import Model.User;
import Model.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

//import com.google.gson.JsonElement;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//import org.apache.http.HttpResponse;
//import org.apache.http.util.EntityUtils;
//import org.apache.http.client.HttpResponseException;
/**
 *
 * @author Dan09
 */
public class RegGoogle extends HttpServlet {

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
        if (request.getParameter("error") != null) {
            if (request.getParameter("error").equals("access_denied")) {
                request.setAttribute("messregis", "Failed to register with Google");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }
        }
        UserDAO udao = new UserDAO();
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto userG = getUserInfo(accessToken);
        User userI = verifyUser(userG);
        MD5 md5 = new MD5();
        if (userI != null) {
            request.setAttribute("messregis", "User existed!!!");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            try{
                udao.regUser(userG.getName(), userG.getEmail(), md5.getMd5(generateRandomString(8)), new SimpleDateFormat("dd-MM-yyyy").parse("01-01-2000"), null);
            }catch(Exception e){
                
            }
            udao.updateUserbyStatus(userG.getEmail(), 1);
//                    User u = new User();
//                    u.setName(name);
//                    u.setEmail(email);
//                    u.setPassword(pass);
//                    u.setRole(new Role(3));
//                    request.getSession().setAttribute("newuser", u);
            ArrayList<User> userList = udao.getAllUser();
            User userII = userList.stream()
                    .filter(user -> user.getEmail().equals(userG.getEmail())
                    && user.getUserStatus().getId() == 1
                    )
                    .findFirst().orElse(null);
//            session.setAttribute("account", userII);
//            response.sendRedirect("Home");
            session.setAttribute("AccGG", userII);
            response.sendRedirect("ChangePasswordGG.jsp");
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI2).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
        return googlePojo;
    }

    private User verifyUser(UserGoogleDto userGG) {
        System.out.println(userGG);
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
