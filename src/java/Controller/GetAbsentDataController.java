package Controller;

import DAO.AdminDAO;
import Model.Absent;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GetAbsentDataController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String status = request.getParameter("status");
        int page = Integer.parseInt(request.getParameter("page"));

        AdminDAO dao = new AdminDAO();
        List<Absent> absents = dao.getAbsentData(fromDate, toDate, status, page);
        int totalRecords = dao.getTotalAbsentRecords(fromDate, toDate, status);
        int totalPages = (int) Math.ceil((double) totalRecords / 6);

        Map<String, Object> result = new HashMap<>();
        result.put("absents", absents);
        result.put("totalPages", totalPages);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(result));
        out.flush();
    }
}
