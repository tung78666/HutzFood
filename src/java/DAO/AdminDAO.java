package DAO;

import Model.Absent;
import Model.Store;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class AdminDAO extends DBContext {

    public Store getStoreInfor() {
        Store store = null;
        String sql = "SELECT TOP 1 store_id, store_name, phone, email, address, introduction, image\n"
                + "FROM store\n"
                + "ORDER BY store_id DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                store = new Store(rs.getInt("store_id"), rs.getString("store_name"), rs.getString("phone"),
                        rs.getString("email"), rs.getString("address"), rs.getString("introduction"),
                        rs.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return store;
    }

    public void updateStore(Store store) throws SQLException {
        String sql = "UPDATE store SET store_name = ?, phone = ?, email = ?, address = ?, introduction = ?, image = ? WHERE store_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, store.getStoreName());
            ps.setString(2, store.getPhone());
            ps.setString(3, store.getEmail());
            ps.setString(4, store.getAddress());
            ps.setString(5, store.getIntroduction());
            ps.setString(6, store.getImage());
            ps.setInt(7, store.getStoreId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<Absent> getAbsentData(String fromDate, String toDate, String status, int page) {
        List<Absent> absents = new ArrayList<>();
        String sql = "SELECT a.*, u.user_name as userName FROM Absent a JOIN Users u ON a.UserId = u.user_id WHERE 1=1";

        if (fromDate != null && !fromDate.isEmpty()) {
            sql += " AND a.DateAbsent >= CONVERT(date, ?, 120)";
        }
        if (toDate != null && !toDate.isEmpty()) {
            sql += " AND a.DateAbsent <= CONVERT(date, ?, 120)";
        }
        if (status != null && !status.isEmpty()) {
            sql += " AND a.Status = ?";
        }

        sql += " ORDER BY a.DateAbsent OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (fromDate != null && !fromDate.isEmpty()) {
                ps.setString(parameterIndex++, fromDate);
            }
            if (toDate != null && !toDate.isEmpty()) {
                ps.setString(parameterIndex++, toDate);
            }
            if (status != null && !status.isEmpty()) {
                ps.setString(parameterIndex++, status);
            }
            ps.setInt(parameterIndex, (page - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Absent absent = new Absent();
                absent.setId(rs.getInt("Id"));
                absent.setUserId(rs.getInt("UserId"));
                absent.setUserName(rs.getString("userName"));
                absent.setPhone(rs.getString("Phone"));
                absent.setDateAbsent(rs.getDate("DateAbsent"));
                absent.setReason(rs.getString("Reason"));
                absent.setStatus(rs.getString("Status"));
                absents.add(absent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return absents;
    }

    public boolean updateAbsentStatus(int id, String status) {
        String sql = "UPDATE Absent SET Status = ? WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức mới để tính tổng số bản ghi
    public int getTotalAbsentRecords(String fromDate, String toDate, String status) {
        String sql = "SELECT COUNT(*) FROM Absent a WHERE 1=1";

        if (fromDate != null && !fromDate.isEmpty()) {
            sql += " AND a.DateAbsent >= CONVERT(date, ?, 120)";
        }
        if (toDate != null && !toDate.isEmpty()) {
            sql += " AND a.DateAbsent <= CONVERT(date, ?, 120)";
        }
        if (status != null && !status.isEmpty()) {
            sql += " AND a.Status = ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (fromDate != null && !fromDate.isEmpty()) {
                ps.setString(parameterIndex++, fromDate);
            }
            if (toDate != null && !toDate.isEmpty()) {
                ps.setString(parameterIndex++, toDate);
            }
            if (status != null && !status.isEmpty()) {
                ps.setString(parameterIndex++, status);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Phương thức mới để thêm mới record vào bảng Absent
    public boolean addAbsent(Absent absent) {
        String sql = "INSERT INTO Absent (UserId, Phone, DateAbsent, Reason, Status) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, absent.getUserId());
            ps.setString(2, absent.getPhone());
            ps.setDate(3, absent.getDateAbsent());
            ps.setString(4, absent.getReason());
            ps.setString(5, absent.getStatus());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
        // Test case 1: Lấy dữ liệu từ ngày từ 2024-01-01 đến ngày 2024-12-31 với status "Approved" và trang 1
        List<Absent> absents1 = dao.getAbsentData("2023-01-01", "2023-12-31", "", 1);
        System.out.println("Test case 1 - Số lượng kết quả: " + absents1.size());
        for (Absent absent : absents1) {
            System.out.println(absent);
        }
    }
}
