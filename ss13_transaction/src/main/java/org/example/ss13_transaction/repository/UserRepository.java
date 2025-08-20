package org.example.ss13_transaction.repository;

import org.example.ss13_transaction.BaseRepository;
import org.example.ss13_transaction.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "{CALL get_user_by_id(?)}";
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement cs = connection.prepareCall(query)) {
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
                user = new User(
                        id,
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{CALL insert_user(?,?,?)}";
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement cs = connection.prepareCall(query)) {
            cs.setString(1, user.getName());
            cs.setString(2, user.getEmail());
            cs.setString(3, user.getCountry());
            cs.executeUpdate();
        }
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public static void addUserTransaction(User user) {
        Connection conn = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2 = null;
        try {
            conn = BaseRepository.getConnectDB();
            conn.setAutoCommit(false);

            String sqlInsert = "INSERT INTO users (name, email, country) VALUES (?, ?, ?)";
            pstmt1 = conn.prepareStatement(sqlInsert);
            pstmt1.setString(1, user.getName());
            pstmt1.setString(2, user.getEmail());
            pstmt1.setString(3, user.getCountry());
            pstmt1.executeUpdate();

            String sqlError = "INSERT INTO users (name, email, country, invalid_column) VALUES (?, ?, ?, ?)";
            pstmt2 = conn.prepareStatement(sqlError);
            pstmt2.setString(1, "Test");
            pstmt2.setString(2, "test@gmail.com");
            pstmt2.setString(3, "VN");
            pstmt2.setString(4, "Lỗi nè");
            pstmt2.executeUpdate();

            conn.commit();

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    System.out.println("Rollback do lỗi: " + e.getMessage());
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            try {
                if (pstmt1 != null) pstmt1.close();
                if (pstmt2 != null) pstmt2.close();
                if (conn != null) conn.setAutoCommit(true);
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
