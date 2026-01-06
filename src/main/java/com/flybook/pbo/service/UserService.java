package com.flybook.pbo.service;

import com.flybook.pbo.model.User;
import com.flybook.pbo.repository.UserRepository;

public class UserService {

    /**
     * Authenticate user with email and password
     */
    public static User authenticate(String email, String password) {
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            return null;
        }

        return UserRepository.findByEmailAndPassword(email, password);
    }

    /**
     * Check if email already exists
     */
    public static boolean emailExists(String email) {
        return UserRepository.findByEmail(email) != null;
    }

    /**
     * Register new user
     */
    public static boolean register(String name, String email, String password) {
        if (emailExists(email)) {
            return false;
        }

        User user = new User(name, email, password, "user");
        return UserRepository.create(user);
    }

    /**
     * Check if user is admin
     */
    public static boolean isAdmin(User user) {
        return user != null && user.isAdmin();
    }
}
