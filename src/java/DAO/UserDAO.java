/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Role;
import Model.User;
import Model.UserStatus;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author asus
 */
public class UserDAO extends DBContext {

    private MD5 md5 = new MD5();

    public UserStatus getUserStatusById(int userStatusId) {
        UserStatus userStatus = null;
        String sql = "SELECT UserStatus_id, UserStatus_name FROM UserStatus WHERE UserStatus_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userStatusId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                userStatus = new UserStatus(rs.getInt("UserStatus_id"), rs.getString("UserStatus_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userStatus;
    }

    public User getUserByEmail(String email) {
        String sql = "select * from [Users] where [email]= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new RoleDAO().getRoleById(rs.getInt(5));
                UserStatus st = getUserStatusById(rs.getInt(6));
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), r, st, rs.getDouble(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11));
                return u;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT user_id, user_name, email, password, role_id, UserStatus_id, user_point, date_of_birth, phonenumber, Location1, Location2, Token FROM Users WHERE user_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                user = new User(
                        rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        new RoleDAO().getRoleById(rs.getInt("role_id")),
                        getUserStatusById(rs.getInt("UserStatus_id")),
                        rs.getFloat("user_point"),
                        rs.getDate("date_of_birth"),
                        rs.getString("phonenumber"),
                        rs.getString("Location1"),
                        rs.getString("Location2")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public ArrayList<User> getByName(String Name) {
        ArrayList<User> list = new ArrayList<>();
        if (Name != null) {
            Name = "%" + Name + "%";
            String sql = "SELECT user_id, user_name, email, password, role_id, UserStatus_id, user_point, date_of_birth, phonenumber, Location1, Location2, Token FROM Users WHERE [user_name] like ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, Name);
                ResultSet rs = st.executeQuery();

                while (rs.next()) {
                    User user = new User(
                            rs.getInt("user_id"),
                            rs.getString("user_name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            new RoleDAO().getRoleById(rs.getInt("role_id")),
                            getUserStatusById(rs.getInt("UserStatus_id")),
                            rs.getFloat("user_point"),
                            rs.getDate("date_of_birth"),
                            rs.getString("phonenumber"),
                            rs.getString("Location1"),
                            rs.getString("Location2")
                    );
                    list.add(user);
                }
                return list;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return null;
    }


    public ArrayList<User> getByPhone(String Phone) {
        ArrayList<User> list = new ArrayList<>();
        if (Phone != null) {
            Phone = "%" + Phone + "%";
            String sql = "SELECT user_id, user_name, email, password, role_id, UserStatus_id, user_point, date_of_birth, phonenumber, Location1, Location2, Token FROM Users WHERE [phonenumber] like ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, Phone);
                ResultSet rs = st.executeQuery();

                while (rs.next()) {
                    User user = new User(
                            rs.getInt("user_id"),
                            rs.getString("user_name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            new RoleDAO().getRoleById(rs.getInt("role_id")),
                            getUserStatusById(rs.getInt("UserStatus_id")),
                            rs.getFloat("user_point"),
                            rs.getDate("date_of_birth"),
                            rs.getString("phonenumber"),
                            rs.getString("Location1"),
                            rs.getString("Location2")
                    );
                    list.add(user);
                }
                return list;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return null;
    }

    public ArrayList<User> getUsersByDateOfBirthRange(Date dob1, Date dob2) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT user_id, user_name, email, password, role_id, UserStatus_id, user_point, date_of_birth, phonenumber, Location1, Location2, Token FROM Users WHERE date_of_birth BETWEEN ? AND ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, (java.sql.Date) dob1);
            st.setDate(2, (java.sql.Date) dob2);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("user_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        new RoleDAO().getRoleById(rs.getInt("role_id")),
                        getUserStatusById(rs.getInt("UserStatus_id")),
                        rs.getFloat("user_point"),
                        rs.getDate("date_of_birth"),
                        rs.getString("phonenumber"),
                        rs.getString("Location1"),
                        rs.getString("Location2")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

//    public void inserUser(String name, String email, String pass, Date dateOfBirth, String phoneNumber) {
//        String sql = "  insert into [Users] ([user_name],[email],[password],[role_id],[UserStatus_id], [date_of_birth], [phonenumber])  "
//                + "  values (?,?,?,3,2,?,?)";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, name);
//            ps.setString(2, email);
//            ps.setString(3, md5.getMd5(pass));
//            // Format the dateOfBirth to the desired format (yyyy-MM-dd)
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            String formattedDateOfBirth = sdf.format(dateOfBirth);
//            ps.setString(4, formattedDateOfBirth);
//            ps.setString(5, phoneNumber);
//            ps.executeUpdate();
//        } catch (SQLException e) {
//        }
//    }
    public void regUser(String name, String email, String pass, Date dateOfBirth, String phoneNumber) {
        String sql = "  insert into [Users] ([user_name],[email],[password],[role_id],[UserStatus_id], [date_of_birth], [phonenumber])  "
                + "  values (?,?,?,3,2,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, md5.getMd5(pass));
            // Format the dateOfBirth to the desired format (yyyy-MM-dd)
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDateOfBirth = sdf.format(dateOfBirth);
            ps.setString(4, formattedDateOfBirth);
            ps.setString(5, phoneNumber);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> listUser = new ArrayList<>();
        String sql = "select * from [Users]";
        try {
            ResultSet rs;
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                rs = ps.executeQuery();
                while (rs.next()) {
                    Role r = new RoleDAO().getRoleById(rs.getInt(5));
                    UserStatus st = getUserStatusById(rs.getInt(6));
                    User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), r, st, rs.getDouble(7), rs.getDate(8), rs.getString(9), rs.getString(10), rs.getString(11));
                    listUser.add(user);
                }
            }
            return listUser;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateUserbyStatus(String email, int stId) {
        String sql = "update [Users] set [UserStatus_id] = ? where [email] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stId);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE [Users] SET [user_name]=?, [email]=?, [password]=?, [role_id]=?, [UserStatus_id]=?, "
                + "[user_point]=?, [date_of_birth]=?, [phonenumber]=?, [Location1]=?, [Location2]=? WHERE [user_id]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setInt(4, user.getRole().getId()); // Assuming Role has getId() method
            ps.setInt(5, user.getUserStatus().getId()); // Assuming UserStatus has getId() method
            ps.setDouble(6, user.getPoint());
            ps.setDate(7, new java.sql.Date(user.getDOB().getTime()));
            ps.setString(8, user.getPhone());
            ps.setString(9, user.getLocation1());
            ps.setString(10, user.getLocation2());
            ps.setInt(11, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void UpdateStatusUser(int sid, int uid) {
        String sql = " update [Users] set [UserStatus_id]=? where [user_id] =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.setInt(2, uid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<User> SearchUser(String name, String srole) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "SELECT "
                    + "    u.user_id,"
                    + "    u.user_name, "
                    + "    u.email, "
                    + "    u.password, "
                    + "    u.UserStatus_id, "
                    + "    u.user_point, "
                    + "    u.date_of_birth, "
                    + "    u.phonenumber, "
                    + "    u.Location1, "
                    + "    u.Location2, "
                    + "    u.Token, "
                    + "    r.role_id, "
                    + "    r.role_name "
                    + "FROM  "
                    + "    Users u "
                    + "INNER JOIN  "
                    + "    Roles r  "
                    + "ON  "
                    + "    u.role_id = r.role_id "
                    + "WHERE  "
                    + "    u.user_name LIKE ?  "
                    + "    OR r.role_name LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, "%" + name + "%");

            ps.setString(2, "%" + srole + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt(12), rs.getString(13));
                UserStatus st = getUserStatusById(rs.getInt(5));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), r, st, rs.getDouble(6), rs.getDate(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void changePassword(String id, String password) {
        String sql = "update [Users] set [password]=? where [user_id] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, md5.getMd5(password));
            stm.setString(2, id);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changePasswordByEmail(String email, String pass) {
        String sql = " update [Users] set [password]=? where [email] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, md5.getMd5(pass));
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public ArrayList<User> getAllUsersToSetting() {
        ArrayList<User> userList = new ArrayList<>();

        try (
                PreparedStatement preparedStatement = connection.prepareStatement(
                        "SELECT u.user_id, u.user_name, u.email,r.role_name "
                        + "FROM Users u "
                        + "JOIN Roles r ON u.role_id = r.role_id "
                        + "WHERE u.role_id = 2 OR u.role_id = 3"
                ); ResultSet resultSet = preparedStatement.executeQuery()) {

                    while (resultSet.next()) {
                        User user = new User();
                        user.setId(resultSet.getInt("user_id"));
                        user.setName(resultSet.getString("user_name"));
                        user.setEmail(resultSet.getString("email"));
                        user.setRole(new Role(resultSet.getString("role_name")));
                        userList.add(user);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return userList;
    }

    public void updateUserRole(int userId, int roleId) {
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(
                        "UPDATE Users SET role_id = ? WHERE user_id = ?"
                )) {

                    preparedStatement.setInt(1, roleId);
                    preparedStatement.setInt(2, userId);
                    preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        ArrayList<User> list = dao.SearchUser("", "seller");
        for (User l : list) {
            System.out.println(l.getId() + " " + l.getRole().getName());
        }
    }

}
