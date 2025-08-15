package org.example.ss13_transaction.repository;

import org.example.ss13_transaction.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    User getUserById(int id);
    void insertUserStore(User user) throws SQLException;
    List<User> selectAllUsers();
}
