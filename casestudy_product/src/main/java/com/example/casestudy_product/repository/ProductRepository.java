package com.example.casestudy_product.repository;

import com.example.casestudy_product.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT_ALL = "SELECT * FROM product";
    private static final String SELECT_BY_ID = "SELECT * FROM product WHERE id = ?";
    private static final String INSERT = "INSERT INTO product(name, price, description, manufacturer, category_id) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE product SET name=?, price=?, description=?, manufacturer=?, category_id=? WHERE id=?";
    private static final String DELETE = "DELETE FROM product WHERE id = ?";
    private static final String SEARCH_BY_NAME = "SELECT * FROM product WHERE name LIKE ?";

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = mapResultSetToProduct(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void save(Product product) {
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(INSERT)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getManufacturer());
            ps.setInt(5, product.getCategoryId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int id, Product product) {
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(UPDATE)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getManufacturer());
            ps.setInt(5, product.getCategoryId());
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(DELETE)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> products = new ArrayList<>();
        try (Connection conn = BaseRepository.getConnectDB();
             PreparedStatement ps = conn.prepareStatement(SEARCH_BY_NAME)) {
            ps.setString(1, "%" + name + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        double price = rs.getDouble("price");
        String description = rs.getString("description");
        String manufacturer = rs.getString("manufacturer");
        int categoryId = rs.getInt("category_id");
        return new Product(id, name, price, description, manufacturer, categoryId);
    }
}