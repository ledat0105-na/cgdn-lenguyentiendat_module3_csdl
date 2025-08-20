package com.example.casestudy_product.repository;

import com.example.casestudy_product.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    private static final String SELECT_ALL = "SELECT * FROM category";
    private static final String SELECT_BY_ID = "SELECT * FROM category WHERE id = ?";


    @Override
    public List<Category> findAll() {
        List<Category> list = new ArrayList<>();
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                list.add(new Category(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public Category findById(int id) {
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(id, rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}