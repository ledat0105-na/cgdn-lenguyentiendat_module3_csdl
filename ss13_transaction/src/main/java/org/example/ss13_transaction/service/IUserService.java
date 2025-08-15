package org.example.ss13_transaction.service;

import org.example.ss13_transaction.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    User getUserById(int id);
    void insertUser(User user) throws SQLException;
    List<User> getAllUsers();
}
