/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Feedback;
import Model.Product;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class FeedbackDAO extends DBContext {

    public int getAllFeecbackTotal() {
         String sql = "  SELECT COUNT(*) \n"
                + "               FROM feedback f\n"
                + "                JOIN Users u ON f.user_id = u.user_id\n"
                + "                JOIN product p ON f.product_id = p.product_id\n"
                + "                \n";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public List<Feedback> getAllFeedback(int index) {
        ArrayList<Feedback> feedback = new ArrayList<>();
        String sql = "SELECT f.content, u.user_name, p.product_name, u.user_id, p.img, f.post_date\n"
                + "               FROM feedback f\n"
                + "                JOIN Users u ON f.user_id = u.user_id\n"
                + "                JOIN product p ON f.product_id = p.product_id\n"
                + "                \n"
                + "               ORDER BY f.post_date desc OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                  Product p = new Product();
                p.setName(rs.getString("product_name"));
                p.setImage(rs.getString("img"));
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setName(rs.getString("user_name"));

                Feedback feedback1 = new Feedback();
                feedback1.setContent(rs.getString("content"));
                feedback1.setDate(rs.getTimestamp("post_date"));
                feedback1.setProduct(p);
                feedback1.setUser(user);
                
                feedback.add(feedback1);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedback;
    }
    
    public List<Feedback> getFeedbackById(int product_id) {
        ArrayList<Feedback> feedback = new ArrayList<>();
        String sql = "  SELECT f.content, u.user_name, p.product_name,f.post_date\n"
                + "               FROM feedback f\n"
                + "                JOIN Users u ON f.user_id = u.user_id\n"
                + "                JOIN product p ON f.product_id = p.product_id\n"
                + "              where f.product_id = ?\n"
                + "               ORDER BY f.post_date desc ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback1 = new Feedback(new User(rs.getString(2)), rs.getString(1), new Product(rs.getString(3)), rs.getTimestamp(4));
                feedback.add(feedback1);

            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedback;
    }

    public void addFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback(product_id, user_id, content, post_date) VALUES (?,?,?, GETDATE())";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, feedback.getProduct().getId());
            ps.setInt(2, feedback.getUser().getId());
            ps.setString(3, feedback.getContent());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countComment(int id) {
        int count = 0;
        try {
            String sql = "select COUNT(*) from Feedback group by product_id having product_id = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
                return count;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public List<Feedback> getFeedbackByUser(int userId) {
        ArrayList<Feedback> feedback = new ArrayList<>();
        String sql = "SELECT f.content, u.user_name, p.product_name, p.img, u.user_id, f.post_date " + "FROM Feedback f "
                + "JOIN Users u ON f.user_id = u.user_id "
                + "JOIN Product p ON f.product_id = p.product_id "
                + "WHERE f.user_id = ? " + "ORDER BY f.post_date DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("product_name"));
                p.setImage(rs.getString("img"));
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setName(rs.getString("user_name"));

                Feedback feedback1 = new Feedback();
                feedback1.setContent(rs.getString("content"));
                feedback1.setDate(rs.getTimestamp("post_date"));
                feedback1.setProduct(p);
                feedback1.setUser(user);

                feedback.add(feedback1);

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedback;
    }

    public void deleteFeedback(int feedbackId) {
        String sql = "DELETE FROM Feedback WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, feedbackId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        FeedbackDAO bld = new FeedbackDAO();
         bld.getAllFeedback(1);
    }
}
