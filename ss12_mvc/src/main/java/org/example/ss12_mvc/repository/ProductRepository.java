package org.example.ss12_mvc.repository;

import org.example.ss12_mvc.model.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class ProductRepository implements IProductRepository {
    private static final List<Product> productList = new ArrayList<>();
    private static final AtomicInteger ID_GEN = new AtomicInteger(0);

    static {
        productList.add(new Product(ID_GEN.incrementAndGet(), "Laptop A", 1500.0, "Laptop cấu hình tốt", "Dell"));
        productList.add(new Product(ID_GEN.incrementAndGet(), "Điện thoại B", 700.0, "Smartphone màn hình lớn", "Samsung"));
        productList.add(new Product(ID_GEN.incrementAndGet(), "Tai nghe C", 50.0, "Tai nghe bluetooth", "Sony"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList);
    }

    @Override
    public Product findById(int id) {
        return productList.stream().filter(p -> p.getId() == id).findFirst().orElse(null);
    }

    @Override
    public void save(Product product) {
        product.setId(ID_GEN.incrementAndGet());
        productList.add(product);
    }

    @Override
    public void update(int id, Product product) {
        Product existing = findById(id);
        if (existing != null) {
            existing.setName(product.getName());
            existing.setPrice(product.getPrice());
            existing.setDescription(product.getDescription());
            existing.setManufacturer(product.getManufacturer());
        }
    }

    @Override
    public void delete(int id) {
        productList.removeIf(p -> p.getId() == id);
    }

    @Override
    public List<Product> searchByName(String name) {
        if (name == null || name.trim().isEmpty()) return findAll();
        String q = name.trim().toLowerCase();
        return productList.stream()
                .filter(p -> p.getName().toLowerCase().contains(q))
                .collect(Collectors.toList());
    }

}
