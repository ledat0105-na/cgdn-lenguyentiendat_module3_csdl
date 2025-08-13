package org.example.ss12_jdbc.service;

import org.example.ss12_jdbc.model.User;
import java.util.List;

public interface IUserService {
    List<User> getAll();
    void add(User user);
    List<User> searchByCountry(String country);
}
