package org.example.ss12_jdbc.repository;

import org.example.ss12_jdbc.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getAll();
    void add(User user);
    List<User> searchByCountry(String country);
}
