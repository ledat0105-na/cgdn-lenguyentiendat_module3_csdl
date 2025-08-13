package org.example.ss10_jsp_va_jstl.model;

public class Customer {
    private int id;
    private String name;
    private String email;
    private String address;
    private String image;

    public Customer(int id, String name, String email, String address, String image) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.image = image;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getAddress() { return address; }
    public String getImage() { return image; }
}
