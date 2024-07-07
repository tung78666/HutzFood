package Controller;

import DAO.AdminDAO;
import Model.Absent;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ManagerAbsentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();

        // Lấy giá trị trang hiện tại từ tham số yêu cầu, nếu không có mặc định là 1
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // Tính tổng số bản ghi và tổng số trang
        int totalRecords = dao.getTotalAbsentRecords(null, null, null);
       

        // Lấy dữ liệu absent
        List<Absent> absents = dao.getAbsentData(null, null, null, page); // Get the first page with no filters
         int totalPages = (int) Math.ceil((double) totalRecords / 6);
        // Thiết lập các thuộc tính để chuyển đến trang JSP
        request.setAttribute("absents", absents);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Chuyển hướng đến trang JSP
        request.getRequestDispatcher("/ManagerAbsent.jsp").forward(request, response);
    }
}
