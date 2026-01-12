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

    /**
     * Get user by ID
     */
    public static User getUserById(int userId) {
        return UserRepository.findById(userId);
    }

    /**
     * Update user profile
     */
    public static boolean updateProfile(int userId, String name, String email) {
        if (name == null || name.isEmpty() || email == null || email.isEmpty()) {
            return false;
        }

        // Check if email is already taken by another user
        if (UserRepository.emailExistsForOther(email, userId)) {
            return false;
        }

        return UserRepository.updateProfile(userId, name, email);
    }

    /**
     * Change user password
     */
    public static boolean changePassword(int userId, String currentPassword, String newPassword) {
        if (currentPassword == null || currentPassword.isEmpty()
                || newPassword == null || newPassword.isEmpty()) {
            return false;
        }

        // Verify current password
        if (!UserRepository.verifyPassword(userId, currentPassword)) {
            return false;
        }

        // Update to new password
        return UserRepository.updatePassword(userId, newPassword);
    }

    /**
     * Delete user account
     */
    public static boolean deleteUser(int userId) {
        return UserRepository.deleteById(userId);
    }
}
