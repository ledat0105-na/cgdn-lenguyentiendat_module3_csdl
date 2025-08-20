package com.example.casestudy_product.model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private String manufacturer;
    private Category category; // Đối tượng Category (không phải category_id)

    public Product() {
    }

    // Constructor dùng cho tạo mới (create)
    public Product(String name, double price, String description, String manufacturer, Category category) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.manufacturer = manufacturer;
        this.category = category;
    }

    // Constructor đầy đủ dùng cho cập nhật hoặc lấy từ DB
    public Product(int id, String name, double price, String description, String manufacturer, Category category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.manufacturer = manufacturer;
        this.category = category;
    }

    // Getter & Setter đầy đủ...
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
