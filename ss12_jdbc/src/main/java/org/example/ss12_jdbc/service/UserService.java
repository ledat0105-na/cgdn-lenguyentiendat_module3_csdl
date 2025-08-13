package org.example.ss12_jdbc.service;

import org.example.ss12_jdbc.model.User;
import org.example.ss12_jdbc.repository.IUserRepository;
import org.example.ss12_jdbc.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> getAll() {
        return userRepository.getAll();
    }

    @Override
    public void add(User user) {
        userRepository.add(user);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }
}
