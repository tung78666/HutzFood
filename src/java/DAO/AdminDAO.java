package DAO;

import Model.Store;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
        Store store = dao.getStoreInfor();
        if (store != null) {
            System.out.println("Store ID: " + store.getStoreId());
            System.out.println("Store Name: " + store.getStoreName());
        } else {
            System.out.println("No store found.");
        }
    }
}