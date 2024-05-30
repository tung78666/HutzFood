/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Account;
import model.Books;
import model.Borrow;
import model.Compensation;
import model.Genres;
import model.Publisher;
import model.Recommend;

/**
 *
 * @author Dan09
 */
public class DAO extends DBContext {

    public Genres getGenresbyID(String GID) {
        String sql = "select * from Genres where GID=?";
        Genres g = new Genres();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, GID);
            ResultSet rs = st.executeQuery();
            rs.next();
            g = new Genres(rs.getString("GID"), rs.getString("GName"));
        } catch (SQLException e) {
        }
        return g;
    }

    public List<Genres> getGenres() {
        String sql = "select * from Genres";
        List<Genres> list = new ArrayList<>();
        Genres g = new Genres();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                g = new Genres(rs.getString("GID"), rs.getString("GName"));
                list.add(g);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Publisher getPublisherbyID(String PID) {
        String sql = "select * from Publisher where PID=?";
        Publisher p = new Publisher();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, PID);
            ResultSet rs = st.executeQuery();
            rs.next();
            p = new Publisher(rs.getString("PID"),
                    rs.getString("PName"),
                    rs.getString("PAddress"),
                    rs.getString("PEmail"),
                    rs.getString("PAgent"));
        } catch (SQLException e) {
        }
        return p;
    }

    public List<Publisher> getPublisher() {
        String sql = "select * from Publisher";
        List<Publisher> list = new ArrayList<>();
        Publisher p = new Publisher();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Publisher(rs.getString("PID"),
                        rs.getString("PName"),
                        rs.getString("PAddress"),
                        rs.getString("PEmail"),
                        rs.getString("PAgent"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Account getAccountbyID(String ID) {
        if (ID.startsWith("FU")) {
            String sql = "select * from Admin where AdID =?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ID);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    return new Account(ID, rs.getString("AdName"), rs.getString("AdEmail"), rs.getDate("Shift"), rs.getString("AdPassword"), true);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return null;
        } else if (ID.startsWith("HE")) {
            String sql = "select * from ServiceUser where UserID =?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ID);
                ResultSet rs = st.executeQuery();
                Date date = new Date(0, 0, 0);
                if (rs.next()) {
                    return new Account(ID, rs.getString("UserName"), rs.getString("UserEmail"), date, rs.getString("UserPassword"), false);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return null;
        } else {
            return null;
        }
    }

    public List<Books> getFeatureBookList() {
        List<Books> list = new ArrayList<>();
        String sql = "select * from Books where Quantity>=50";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(rs.getString("BookID"),
                        rs.getString("Title"),
                        rs.getString("AuthorName"),
                        getPublisherbyID(rs.getString("PID")),
                        getGenresbyID(rs.getString("GID")),
                        rs.getInt("NumREPub"),
                        rs.getInt("Quantity"),
                        rs.getString("coverPath"),
                        rs.getString("eBookPath"),
                        rs.getInt("NumOfEbook"),
                        rs.getInt("NumOfPhysicalBook"),
                        rs.getString("Briefly"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Books> getNewBookList() {
        List<Books> list = new ArrayList<>();
        String sql = "select * from Books where NumREPub>=10";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(rs.getString("BookID"),
                        rs.getString("Title"),
                        rs.getString("AuthorName"),
                        getPublisherbyID(rs.getString("PID")),
                        getGenresbyID(rs.getString("GID")),
                        rs.getInt("NumREPub"),
                        rs.getInt("Quantity"),
                        rs.getString("coverPath"),
                        rs.getString("eBookPath"),
                        rs.getInt("NumOfEbook"),
                        rs.getInt("NumOfPhysicalBook"),
                        rs.getString("Briefly"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Books> getBookList() {
        List<Books> list = new ArrayList<>();
        String sql = "select * from Books";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(rs.getString("BookID"),
                        rs.getString("Title"),
                        rs.getString("AuthorName"),
                        getPublisherbyID(rs.getString("PID")),
                        getGenresbyID(rs.getString("GID")),
                        rs.getInt("NumREPub"),
                        rs.getInt("Quantity"),
                        rs.getString("coverPath"),
                        rs.getString("eBookPath"),
                        rs.getInt("NumOfEbook"),
                        rs.getInt("NumOfPhysicalBook"),
                        rs.getString("Briefly"));
                list.add(b);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Books> geteBook() {
        List<Books> list = new ArrayList<>();
        String sql = "select * from Books where NumOfEbook!=0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(rs.getString("BookID"),
                        rs.getString("Title"),
                        rs.getString("AuthorName"),
                        getPublisherbyID(rs.getString("PID")),
                        getGenresbyID(rs.getString("GID")),
                        rs.getInt("NumREPub"),
                        rs.getInt("Quantity"),
                        rs.getString("coverPath"),
                        rs.getString("eBookPath"),
                        rs.getInt("NumOfEbook"),
                        rs.getInt("NumOfPhysicalBook"),
                        rs.getString("Briefly"));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Books> getPhyBook() {
        List<Books> list = new ArrayList<>();
        String sql = "select * from Books where NumOfPhysicalBook!=0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Books b = new Books(rs.getString("BookID"),
                        rs.getString("Title"),
                        rs.getString("AuthorName"),
                        getPublisherbyID(rs.getString("PID")),
                        getGenresbyID(rs.getString("GID")),
                        rs.getInt("NumREPub"),
                        rs.getInt("Quantity"),
                        rs.getString("coverPath"),
                        rs.getString("eBookPath"),
                        rs.getInt("NumOfEbook"),
                        rs.getInt("NumOfPhysicalBook"),
                        rs.getString("Briefly"));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Books getBookbyID(String BID) {
        String sql = "select * from Books where BookID = ?";
        Books b = new Books();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, BID);
            ResultSet rs = st.executeQuery();
            rs.next();
            b = new Books(rs.getString("BookID"),
                    rs.getString("Title"),
                    rs.getString("AuthorName"),
                    getPublisherbyID(rs.getString("PID")),
                    getGenresbyID(rs.getString("GID")),
                    rs.getInt("NumREPub"),
                    rs.getInt("Quantity"),
                    rs.getString("coverPath"),
                    rs.getString("eBookPath"),
                    rs.getInt("NumOfEbook"),
                    rs.getInt("NumOfPhysicalBook"),
                    rs.getString("Briefly"));
        } catch (SQLException e) {

        }
        return b;
    }

    public List<Books> getByName(String Name) {
        List<Books> list = new ArrayList<>();
        if (Name != null) {
            Name = "%" + Name + "%";
            String sql = "select * from Books where Title like ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, Name);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Books b = new Books(rs.getString("BookID"),
                            rs.getString("Title"),
                            rs.getString("AuthorName"),
                            getPublisherbyID(rs.getString("PID")),
                            getGenresbyID(rs.getString("GID")),
                            rs.getInt("NumREPub"),
                            rs.getInt("Quantity"),
                            rs.getString("coverPath"),
                            rs.getString("eBookPath"),
                            rs.getInt("NumOfEbook"),
                            rs.getInt("NumOfPhysicalBook"),
                            rs.getString("Briefly"));
                    list.add(b);
                }
            } catch (Exception e) {
            }
        } else {
            list = getBookList();
        }

        return list;
    }

    public List<Books> getByID(String ID) {
        List<Books> list = new ArrayList<>();
        if (ID != null) {
            String sql = "select * from Books where BookID like ?";
            ID = "%" + ID + "%";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ID);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Books b = new Books(rs.getString("BookID"),
                            rs.getString("Title"),
                            rs.getString("AuthorName"),
                            getPublisherbyID(rs.getString("PID")),
                            getGenresbyID(rs.getString("GID")),
                            rs.getInt("NumREPub"),
                            rs.getInt("Quantity"),
                            rs.getString("coverPath"),
                            rs.getString("eBookPath"),
                            rs.getInt("NumOfEbook"),
                            rs.getInt("NumOfPhysicalBook"),
                            rs.getString("Briefly"));
                    list.add(b);
                }
            } catch (Exception e) {
            }
        } else {
            list = getBookList();
        }
        return list;
    }

    public Account checkUserName(String UserID, String password) {
        String sql = "select * from ServiceUser where UserID =? and UserPassword=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, UserID);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            Date date = new Date(0, 0, 0);
            if (rs.next()) {
                return new Account(UserID, rs.getString("UserName"), rs.getString("UserEmail"), date, password, false);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkUserEmail(String UserEmail, String password) {
        String sql = "select * from ServiceUser where UserEmail =? and UserPassword=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, UserEmail);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            Date date = new Date(0, 0, 0);
            if (rs.next()) {
                return new Account(rs.getString("UserID"), rs.getString("UserName"), UserEmail, date, password, false);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkAdminName(String AdID, String password) {
        String sql = "select * from Admin where AdID =? and AdPassword=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, AdID);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(AdID, rs.getString("AdName"), rs.getString("AdEmail"), rs.getDate("Shift"), password, true);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkAdminEmail(String AdEmail, String password) {
        String sql = "select * from Admin where AdEmail =? and AdPassword=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, AdEmail);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("AdID"), rs.getString("AdName"), AdEmail, rs.getDate("Shift"), password, true);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkExistID(String AdID) {
        try {
            //CHeck in ADMIN database
            String sql = "select * from Admin where AdID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, AdID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                if (checkExistUserID(AdID)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkExistUserID(String Userid) {
        try {
            //CHeck in USER database
            String sql = "select * from ServiceUser where UserID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Userid);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkExistEmail(String Email) {
        try {
            //CHeck in ADMIN database
            String sql = "select * from Admin where AdEmail =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                if (checkExistUserID(Email)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkExistUserEmail(String Email) {
        try {
            //CHeck in USER database
            String sql = "select * from ServiceUser where UserEmail =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Email);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean emailFormat(String email) {
        String EMAIL_REGEX = "^[a-zA-Z0-9_]+@[a-zA-Z0-9]+\\.(com|fpt\\.edu\\.vn)$";;
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean ADIDFormat(String ID) {
        String ID_REGEX = "^(FU)\\d{6}$";
        Pattern pattern = Pattern.compile(ID_REGEX);
        Matcher matcher = pattern.matcher(ID);
        return matcher.matches();
    }

    public boolean UsIDFormat(String ID) {
        String ID_REGEX = "^(HE)\\d{6}$";
        Pattern pattern = Pattern.compile(ID_REGEX);
        Matcher matcher = pattern.matcher(ID);
        return matcher.matches();
    }

    public void addAdmin(Account a) {
        String sql = "Insert into Admin values (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getID());
            st.setString(2, a.getName());
            st.setString(3, a.getEmail());
            st.setDate(4, new java.sql.Date(a.getDateStart().getTime()));
            st.setString(5, a.getPassword());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addUser(Account a) {
        String sql = "Insert into ServiceUser values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getID());
            st.setString(2, a.getName());
            st.setString(3, a.getEmail());
            st.setString(4, a.getPassword());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean checkExistAccount(String ID, String Email, String Pass, boolean checkType) {
        if (checkType) {
            //Admin
            String sql = "select * from Admin where AdID =? and AdEmail = ? and AdPassword =?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ID);
                st.setString(2, Email);
                st.setString(3, Pass);
                ResultSet rs = st.executeQuery();
                return rs.next();
            } catch (Exception e) {
                System.out.println(e);
            }
            return false;
        } else {
            //User
            String sql = "select * from ServiceUser where UserID =? and UserEmail = ? and UserPassword =?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ID);
                st.setString(2, Email);
                st.setString(3, Pass);
                ResultSet rs = st.executeQuery();
                return rs.next();
            } catch (Exception e) {
                System.out.println(e);
            }
            return false;
        }

    }

    public void changePassword(String newPass, String ID, boolean checkType) {
        if (checkType) {
            String sql = "UPDATE Admin SET AdPassword = ? WHERE AdID = ?;";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, newPass);
                st.setString(2, ID);
                st.executeUpdate();
            } catch (Exception e) {
            }
        } else {
            String sql = "UPDATE ServiceUser SET UserPassword = ? WHERE UserID = ?;";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, newPass);
                st.setString(2, ID);
                st.executeUpdate();
            } catch (Exception e) {
            }
        }
    }

    public boolean checkIfReturned(String BorrowID) {
        String sql = "select * from Books_return where BorrowID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, BorrowID);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {

        }
        return true;
    }

    public List<Borrow> getBorrowOrderbyUserID(String ID) {
        List<Borrow> list = new ArrayList<>();
        String sql = "select * from Borrow bo right join BorrowBooks_details bod on bo.BorrowID=bod.BorrowID where UserID= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (checkIfReturned(rs.getString("BorrowID"))) {

                } else {
                    Borrow b = new Borrow(rs.getString("BorrowID"),
                            getAccountbyID(rs.getString("AdID")),
                            getAccountbyID(rs.getString("UserID")),
                            rs.getDate("BorrowDate"),
                            rs.getDate("ReturnDate"),
                            rs.getInt("Quantity"),
                            getBookbyID(rs.getString("BookID")));
                    list.add(b);
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Borrow> getBorrowOrderFORAdmin() {
        List<Borrow> list = new ArrayList<>();
        String sql = "select * from Borrow bo right join BorrowBooks_details bod on bo.BorrowID=bod.BorrowID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (checkIfReturned(rs.getString("BorrowID"))) {

                } else {
                    Borrow b = new Borrow(rs.getString("BorrowID"),
                            getAccountbyID(rs.getString("AdID")),
                            getAccountbyID(rs.getString("UserID")),
                            rs.getDate("BorrowDate"),
                            rs.getDate("ReturnDate"),
                            rs.getInt("Quantity"),
                            getBookbyID(rs.getString("BookID")));
                    list.add(b);
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getBorrowID(String UserID, Date borrowDate) {
        String sql = "select BorrowID from Borrow where UserID= ? and BorrowDate =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, UserID);
            st.setDate(2, new java.sql.Date(borrowDate.getTime()));
            ResultSet rs = st.executeQuery();
            rs.next();
            return rs.getString("BorrowID");
        } catch (Exception e) {
        }
        return null;
    }

    public boolean renewAble(String UserID, Borrow b) {
        String sql = "SELECT Quantity FROM Borrow b JOIN BorrowBooks_details bd ON b.BorrowID = bd.BorrowID WHERE b.UserID = ? AND bd.BookID = ? AND b.BorrowDate = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, UserID);
            st.setString(2, b.getBook().getBookID());
            st.setDate(3, new java.sql.Date(b.getBorrowDate().getTime()));
            ResultSet rs = st.executeQuery();
            rs.next();
            if (rs.getInt("Quantity") == 0) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void Renew(String UserID, Borrow b) {
        String sql = "UPDATE BorrowBooks_details SET Quantity = CASE WHEN Quantity > 0 THEN Quantity - 1 ELSE Quantity END, ReturnDate = DATEADD(DAY, 7, ReturnDate) WHERE BookID = ? AND BorrowID = ?";
        if (renewAble(UserID, b)) {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, b.getBook().getBookID());
                st.setString(2, b.getBorrowID());
                ResultSet rs = st.executeQuery();
            } catch (Exception e) {
            }
        }

    }

    public void RenewUnderAdmin(Borrow b) {
        String sql = "UPDATE Borrow SET BorrowDate = ? Where BorrowID= ?";
        String sql_1 = "UPDATE BorrowBooks_details SET Quantity = 4, ReturnDate = ? WHERE BookID = ? AND BorrowID = ?";
        Date currentDate = new Date();
        // Get the date one month prior
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.MONTH, 1);
        Date oneMonthPriorDate = calendar.getTime();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(currentDate.getTime()));
            st.setString(2, b.getBorrowID());
            st.executeUpdate();
            PreparedStatement st_1 = connection.prepareStatement(sql_1);
            st_1.setDate(1, new java.sql.Date(oneMonthPriorDate.getTime()));
            st_1.setString(2, b.getBook().getBookID());
            st_1.setString(3, b.getBorrowID());
            st_1.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteBorrowBook(Borrow b) {
        String sql = "DELETE FROM BorrowBooks_details WHERE BookID = ? AND BorrowID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBook().getBookID());
            st.setString(2, b.getBorrowID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Recommend> getAllRecommend() {
        String sql = "Select * from Recommend_Order";
        List<Recommend> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Recommend r = new Recommend(rs.getString("RecommendID"),
                        rs.getString("UserEmail"),
                        rs.getString("ISBN"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("PName"),
                        rs.getInt("RequestTime"),
                        rs.getString("RequestPurpose"),
                        rs.getString("BookLink"),
                        rs.getString("MentorProposal"),
                        rs.getString("Feedback"));
                list.add(r);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteRecommend_Order(String rID) {
        String sql = "DELETE FROM Recommend_Order WHERE RecommendID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, rID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addRecommend(Recommend r) {
        System.out.println(r.getAuthor());
        String sql = "insert into Recommend_Order values (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, r.getRecommendID());
            st.setString(2, r.getUserEmail());
            st.setString(3, r.getISBN());
            st.setString(4, r.getTitle());
            st.setString(5, r.getAuthor());
            st.setString(6, r.getPName());
            st.setInt(7, r.getRequestTime());
            st.setString(8, r.getRequestPurpose());
            st.setString(9, r.getBookLink());
            st.setString(10, r.getMentorProposal());
            st.setString(11, r.getFeedback());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getNewBorrowID() {
        String sql = "SELECT TOP 1 BorrowID FROM Borrow ORDER BY CONVERT(INT, BorrowID) DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            rs.next();
            String BorrowID_raw = rs.getString("BorrowID");
            BorrowID_raw = BorrowID_raw.replaceAll("\\s", "");
            try {
                int BorrowID = Integer.parseInt(BorrowID_raw);
                BorrowID++;
                return String.valueOf(BorrowID);
            } catch (NumberFormatException e) {

            }
        } catch (Exception e) {
        }
        return null;
    }

    public void createNEWBorrowReq(String UID, String BID, boolean isEbook) {
        String sql = "insert into Borrow (BorrowID, AdID, UserID, BorrowDate, isAccepted) values (?,'FU000000',?,?,?)";
        String sql_1 = "insert into BorrowBooks_details (BorrowID, BookID, Quantity, ReturnDate) values (?,?,'4',?)";
        // Get the current date
        Date currentDate = new Date();
        // Get the date one month prior
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.MONTH, 1);
        Date oneMonthPriorDate = calendar.getTime();
        String newBorrowID = getNewBorrowID();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newBorrowID);
            st.setString(2, UID);
            st.setDate(3, new java.sql.Date(currentDate.getTime()));
            st.setInt(4, isEbook ? 1 : 0);
            st.executeUpdate();
            PreparedStatement st_1 = connection.prepareStatement(sql_1);
            st_1.setString(1, newBorrowID);
            st_1.setString(2, BID);
            st_1.setDate(3, new java.sql.Date(oneMonthPriorDate.getTime()));
            st_1.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean isaNewBorrowRequest(String UID, Date currentDate) {
        String sql = "select * from Borrow where UserID = ? and BorrowDate = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, UID);
            st.setDate(2, new java.sql.Date(currentDate.getTime()));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void createBorrowDetail(String UID, String BID, boolean isEbook) {
        String sql = "insert into BorrowBooks_details (BorrowID, BookID, Quantity, ReturnDate) values (?,?,'4',?)";
        // Get the current date
        Date currentDate = new Date();
        // Get the date one month prior
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);
        calendar.add(Calendar.MONTH, 1);
        Date oneMonthPriorDate = calendar.getTime();
        String newBorrowID = getBorrowID(UID, currentDate);
        try {
            PreparedStatement st_1 = connection.prepareStatement(sql);
            st_1.setString(1, newBorrowID);
            st_1.setString(2, BID);
            st_1.setDate(3, new java.sql.Date(oneMonthPriorDate.getTime()));
            st_1.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean isBookBorrowed(String UID, String BID) {
        String sql = "SELECT * FROM Borrow b JOIN BorrowBooks_details bd ON b.BorrowID = bd.BorrowID WHERE b.UserID = ? AND bd.BookID = ? AND b.BorrowDate = ?";
        // Get the current date
        Date currentDate = new Date();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, UID);
            st.setString(2, BID);
            st.setDate(3, new java.sql.Date(currentDate.getTime()));
            ResultSet rs = st.executeQuery();
            System.out.println(rs.next());
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public void createBorrowRequest(String UID, String BID, boolean isEbook) {
        // Get the current date
        Date currentDate = new Date();
        if (isaNewBorrowRequest(UID, currentDate)) {
            createNEWBorrowReq(UID, BID, isEbook);
        } else {
            if (isBookBorrowed(UID, BID)) {
            } else {
                createBorrowDetail(UID, BID, isEbook);
            }
        }

    }

    public void returnBorrow(String returnBorrowID) {
        String sql = "insert into Book_return values(?,?)";
        Date today = new Date();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, returnBorrowID);
            st.setDate(2, new java.sql.Date(today.getTime()));
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkExistBookID(String BID) {
        try {
            //CHeck in USER database
            String sql = "select * from Books where BookID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, BID);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void addBook(Books b) {
        String sql = "INSERT INTO Books("
                + "BookID"
                + ", Title"
                + ", AuthorName"
                + ", PID"
                + ", GID"
                + ", NumREPub"
                + ", Quantity"
                + ", coverPath"
                + ", eBookPath"
                + ", NumOfEbook"
                + ", NumOfPhysicalBook"
                + ", Briefly) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getBookID());
            st.setString(2, b.getTitle());
            st.setString(3, b.getAuthorName());
            st.setString(4, b.getPublisher().getPID());
            st.setString(5, b.getGenres().getGID());
            st.setInt(6, b.getNumREPub());
            st.setInt(7, b.getQuantity());
            st.setString(8, b.getCoverPath());
            st.setString(9, b.geteBookPath());
            st.setInt(10, b.getNumOfEbook());
            st.setInt(11, b.getNumOfPhysicalBook());
            st.setString(12, b.getBriefly());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateBook(Books b) {
        String sql = "UPDATE Books SET Title = ?"
                + ", AuthorName = ?"
                + ", PID = ?"
                + ", GID = ?"
                + ", NumREPub = ?"
                + ", Quantity = ?"
                + ", coverPath = ?"
                + ", eBookPath = ?"
                + ", NumOfEbook = ?"
                + ", NumOfPhysicalBook = ?"
                + ", Briefly = ? WHERE BookID = ? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, b.getTitle());
            st.setString(2, b.getAuthorName());
            st.setString(3, b.getPublisher().getPID());
            st.setString(4, b.getGenres().getGID());
            st.setInt(5, b.getNumREPub());
            st.setInt(6, b.getQuantity());
            st.setString(7, b.getCoverPath());
            st.setString(8, b.geteBookPath());
            st.setInt(9, b.getNumOfEbook());
            st.setInt(10, b.getNumOfPhysicalBook());
            st.setString(11, b.getBriefly());
            st.setString(12, b.getBookID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteBook(String BID) {
        String sql = "DELETE FROM Books WHERE BookID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, BID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Compensation> calCompensation() {
        List<Compensation> listComp = new ArrayList<>();
        Date currentDate = new Date();
        for (int i = 0; i < getBorrowOrderFORAdmin().size(); i++) {
            if (getBorrowOrderFORAdmin().get(i).getReturnDate().after(currentDate)) {
                // Calculate the difference in milliseconds
                long differenceInMilliseconds = getBorrowOrderFORAdmin().get(i).getReturnDate().getTime() - currentDate.getTime();

                // Convert milliseconds to days
                long differenceInDays = differenceInMilliseconds / (1000 * 60 * 60 * 24);

                Compensation c = new Compensation(getBorrowOrderFORAdmin().get(i), "Late for return", (int) differenceInDays * 5);

                listComp.add(c);
            }
        }
        return listComp;
    }

    public List<Books> getFaveBook(String txt) {
        List<Books> list = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("_");
                for (String i : s) {
                    list.add(getBookbyID(i));
                }
            }
        } catch (NumberFormatException e) {
        }
        return list;
    }

    public String deleteFaveBook(String BID, String txt) {
        BID = BID.replaceAll("\\s", "");
        String ntxt = "";
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("_");
                for (String i : s) {
                    if (i.equals(BID)) {

                    } else {

                        if (ntxt.isEmpty()) {
                            ntxt += i;
                        } else {
                            ntxt += ("_" + i);
                        }
                    }
                }
            }
        } catch (NumberFormatException e) {
        }
        return ntxt;
    }

    public String chartData() {
        String sql = "select bd.BookID ,count(bd.BookID)as TimeOFBorrow from Borrow b join BorrowBooks_details bd on b.BorrowID=bd.BorrowID Group by bd.BookID";
        String data = "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String bookID = rs.getString("BookID");
                int numOfBorrow = rs.getInt("TimeOFBorrow");
                if (data.isEmpty()) {
                    data += bookID + ":" + String.valueOf(numOfBorrow);
                } else {
                    data += "_" + bookID + ":" + String.valueOf(numOfBorrow);
                }
            }
        } catch (SQLException e) {

        }
        return data;
    }

    public static void main(String[] args) {
    }
}
