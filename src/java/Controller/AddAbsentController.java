package Controller;

import DAO.AdminDAO;
import Model.Absent;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AddAbsentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Chuyển hướng đến trang addAbsent.jsp
        req.getRequestDispatcher("/addAbsent.jsp").forward(req, resp);
    }
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account"); // assuming user id is stored in session attribute "id"
        int userId = user.getId();
        String absentDate = request.getParameter("absentDate");
        String phone = request.getParameter("phone");
        String reason = request.getParameter("reason");

        Absent absent = new Absent();
        absent.setUserId(userId);
        absent.setDateAbsent(java.sql.Date.valueOf(absentDate));
        absent.setPhone(phone);
        absent.setReason(reason);
        absent.setStatus("Pending");

        AdminDAO dao = new AdminDAO();
        boolean success = dao.addAbsent(absent);

        response.setContentType("application/json");
        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\":\"Absent record added successfully!\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\":\"Failed to add absent record!\"}");
        }
    }
}
