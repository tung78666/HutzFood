/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BlogDao;
import DAO.UserDAO;
import Model.Blog;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author ducnt
 */
public class ManageUserInfo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try {
//            HttpSession session = request.getSession();
//            Object object = session.getAttribute("account");
//            User u = (User) object;
//
//            if (u.getRole().getId() == 2) {
//                String blogId = (request.getParameter("blogId"));
//                BlogDao blog = new BlogDao();
//                List<Model.Blog> bl = blog.getBlogs();
//                request.setAttribute("bl", bl);
//                request.getRequestDispatcher("ManageBlog.jsp").forward(request, response);
//            }
//        } catch (Exception e) {
//
//        }
        HttpSession session = request.getSession();
        UserDAO udao = new UserDAO();

        if (session.getAttribute("pl") == null) {
            ArrayList<User> userlist = udao.getAllUser();
            ArrayList<User> userList = new ArrayList<>();
            for (User u : userlist) {
                if (u.getRole().getId() == 3 || u.getRole().getId() == 2) {
                    userList.add(u);
                }
            }
            session.setAttribute("pl", userList);
            request.getRequestDispatcher("ManageUserInfo.jsp").forward(request, response);
        } else {
            String element2Sort = request.getParameter("element2Sort");
            String sortRule = request.getParameter("sortRule");
            //sort
            ArrayList<User> userlist = new ArrayList<>();
            ArrayList<User> userList = new ArrayList<>();
            if (element2Sort == null && sortRule == null) {
                userlist = udao.getAllUser();
                for (User u : userlist) {
                    if (u.getRole().getId() == 3 || u.getRole().getId() == 2) {
                        userList.add(u);
                    }
                }
            } else {
                userlist = (ArrayList<User>) session.getAttribute("pl");
                userList = sortUser(element2Sort, sortRule, userlist);
            }
            session.setAttribute("pl", userList);
            request.getRequestDispatcher("ManageUserInfo.jsp").forward(request, response);
        }

    }

    private ArrayList<User> sortUser(String element2Sort, String sortRule, ArrayList<User> userlist) {
        if (sortRule.equals("ASC")) {
            switch (element2Sort) {
                case "ID" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getId));
                }
                case "Name" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getName));

                }
                case "Role" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getRoleId));

                }
                case "Status" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getUserStatusId));

                }
                case "DateOfBirth" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getDOB));

                }
            }
            return userlist;
        } else {
            switch (element2Sort) {
                case "ID" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getId).reversed());
                }
                case "Name" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getName).reversed());
                }
                case "Role" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getRoleId).reversed());
                }
                case "Status" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getUserStatusId).reversed());
                }
                case "DateOfBirth" -> {
                    Collections.sort(userlist, Comparator.comparing(User::getDOB).reversed());
                }
            }
            return userlist;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String search = request.getParameter("search");
        String sB = request.getParameter("searchBY");
        UserDAO udao = new UserDAO();
        ArrayList<User> userlist = new ArrayList<>();
        if (search.isBlank()) {
            processRequest(request, response);
        } else {
            if ("Name".equals(sB)) {
                userlist = udao.getByName(search);
            } else if ("ID".equals(sB)) {
                userlist.add(udao.getUserById(Integer.parseInt(search)));
            } else {
                userlist = udao.getByPhone(search);
            }
            session.setAttribute("pl", userlist);
            request.getRequestDispatcher("ManageUserInfo.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
