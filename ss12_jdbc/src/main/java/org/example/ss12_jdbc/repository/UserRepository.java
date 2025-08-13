package org.example.ss12_jdbc.repository;

import org.example.ss12_jdbc.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private static final String SELECT_ALL = "SELECT * FROM users";
    private static final String INSERT_USER = "INSERT INTO users(name,email,country) VALUES (?,?,?)";
    private static final String SEARCH_COUNTRY = "SELECT * FROM users WHERE country LIKE ?";

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return users;
    }

    @Override
    public void add(User user) {
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(INSERT_USER)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCountry());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> users = new ArrayList<>();
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(SEARCH_COUNTRY)) {
            ps.setString(1, "%" + country + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("country")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return users;
    }
}
