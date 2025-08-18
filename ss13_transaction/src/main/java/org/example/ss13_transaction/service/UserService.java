package org.example.ss13_transaction.service;

import org.example.ss13_transaction.model.User;
import org.example.ss13_transaction.repository.IUserRepository;
import org.example.ss13_transaction.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();

    @Override
    public User getUserById(int id) {
        return iUserRepository.getUserById(id);
    }

    @Override
    public void insertUser(User user) throws SQLException {
        iUserRepository.insertUserStore(user);
    }

    @Override
    public List<User> getAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public void addUserTransaction(User user) {
        UserRepository.addUserTransaction(user);
    }

}
