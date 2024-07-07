package Controller;

import DAO.AdminDAO;
import Model.Store;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class EditStoreProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        Store store = dao.getStoreInfor();
        request.setAttribute("store", store);
        System.out.println(store.getImage());
        request.getRequestDispatcher("/editStoreProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String storeName = request.getParameter("storeName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String introduction = request.getParameter("introduction");
        String image = request.getParameter("image");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JsonObject jsonResponse = new JsonObject();

        // In ra các thuộc tính lấy về từ form
        System.out.println("Store Name: " + storeName);
        System.out.println("Phone: " + phone);
        System.out.println("Email: " + email);
        System.out.println("Address: " + address);
        System.out.println("Introduction: " + introduction);
        System.out.println("Image: " + image);

        // Kiểm tra dữ liệu đầu vào
        if (storeName == null || storeName.isEmpty() || phone == null || phone.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.addProperty("message", "Missing required fields");
            out.print(jsonResponse.toString());
            return;
        }

        // Lưu dữ liệu vào cơ sở dữ liệu
        AdminDAO dao = new AdminDAO();
        Store store = dao.getStoreInfor();
        store.setStoreName(storeName);
        store.setPhone(phone);
        store.setEmail(email);
        store.setAddress(address);
        store.setIntroduction(introduction);
        store.setImage(image);

        try {
            dao.updateStore(store);
            response.setStatus(HttpServletResponse.SC_OK);
            jsonResponse.addProperty("message", "Store profile saved successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse.addProperty("message", "Error saving store profile");
        }

        out.print(jsonResponse.toString());
    }
}
