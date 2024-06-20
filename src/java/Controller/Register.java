/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.Role;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author asus
 */
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
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
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String dateOfBirth = request.getParameter("DOB");
            String phoneNum = request.getParameter("phone");
            String confirmpass = request.getParameter("confirmpass");
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date date = formatter.parse(dateOfBirth);
            System.out.println(emailFormat(email));
            System.out.println(nameFormat(name));
            System.out.println(nameFormat(name));
            System.out.println(pass.equals(confirmpass));
            if (!nameFormat(name)) {
                request.setAttribute("messregis", "Invalid name.Please Try again!");
                setData(request, name, email, pass, dateOfBirth, phoneNum, confirmpass);
                throw new Exception();
            } else if (!isValidPhoneNumber(phoneNum)) {
                request.setAttribute("messregis", "Invalid Phone Number.Please Try again!");
                setData(request, name, email, pass, dateOfBirth, phoneNum, confirmpass);
                throw new Exception();
            } else if (!emailFormat(email)) {
                request.setAttribute("messregis", "Invalid Email.Please Try again!");
                setData(request, name, email, pass, dateOfBirth, phoneNum, confirmpass);
                throw new Exception();
            }
            UserDAO udao = new UserDAO();
            User checkExist = udao.getUserByEmail(email);
            System.out.println(checkExist);
            if (pass.equals(confirmpass) == false) {
                request.setAttribute("messregis", "Confirm Password is not correct");
                setData(request, name, email, pass, dateOfBirth, phoneNum, confirmpass);
                throw new Exception();
            } else {
                if (checkExist == null) {
                    udao.regUser(name, email, pass,date,phoneNum);
                    User u = new User();
                    u.setName(name);
                    u.setEmail(email);
                    u.setPassword(pass);
                    u.setRole(new Role(3));
                    request.getSession().setAttribute("newuser", u);
                    response.sendRedirect("./SendMail");
                } else {
                    request.setAttribute("messregis", "Email already exist in system!");
                    setData(request, name, email, pass, dateOfBirth, phoneNum, confirmpass);
                    throw new Exception();
                }
            }
        } catch (Exception e) {

            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }

    public boolean emailFormat(String email) {
        String EMAIL_REGEX = "^[a-zA-Z0-9_]+@[a-zA-Z0-9]+\\.(com|fpt\\.edu\\.vn)$";
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean nameFormat(String name) {
        String NAME_REGEX = "^(?=.*\\S)[A-Za-z0-9 ]{7,}$";
        Pattern pattern = Pattern.compile(NAME_REGEX);
        Matcher matcher = pattern.matcher(name);
        return matcher.matches();
    }

    public static boolean isValidPhoneNumber(String phoneNumber) {
        // Regular expression to validate phone numbers
        String regex = "^\\+?[0-9]{1,3}?[ -]?\\(?[0-9]{3}\\)?[ -]?[0-9]{3}[ -]?[0-9]{4}$";

        // Compile the regular expression
        Pattern pattern = Pattern.compile(regex);

        // Match the phone number against the regular expression
        Matcher matcher = pattern.matcher(phoneNumber);

        // Return if the phone number matches the pattern
        return matcher.matches();
    }

    public void setData(HttpServletRequest request,String name,String email,String pass,String dateOfBirth,String phoneNum,String confirmpass) {
        request.setAttribute("name",name);
        request.setAttribute("email",email);
        request.setAttribute("pass",pass);
        request.setAttribute("DOB",dateOfBirth);
        request.setAttribute("phone",phoneNum);
        request.setAttribute("confirmpass",confirmpass);
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
