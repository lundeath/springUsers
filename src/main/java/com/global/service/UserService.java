package com.global.service;

import com.global.model.Role;
import com.global.model.User;

import java.util.List;

public interface UserService {
    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> listUsers();

    User findByFirstName(String firstName);
}
