package com.mycompany.proveedoresfrutas2.service;

import com.mycompany.proveedoresfrutas2.model.User;
import com.mycompany.proveedoresfrutas2.repository.UserRepository;

public class AuthService {
    private final UserRepository userRepository;

    public AuthService() {
        this.userRepository = new UserRepository();
    }

    public User authenticate(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}