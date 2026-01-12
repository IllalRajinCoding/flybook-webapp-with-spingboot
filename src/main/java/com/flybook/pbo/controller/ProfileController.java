package com.flybook.pbo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flybook.pbo.model.Booking;
import com.flybook.pbo.model.User;
import com.flybook.pbo.repository.BookingRepository;
import com.flybook.pbo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

    /**
     * Show profile page
     */
    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        // Check if user is logged in
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        // Get user data
        User user = UserService.getUserById(userId);
        if (user == null) {
            session.invalidate();
            return "redirect:/login";
        }

        // Get user's booking count using userName
        String userName = (String) session.getAttribute("userName");
        List<Booking> bookings = BookingRepository.getByUserName(userName);
        int totalBookings = bookings != null ? bookings.size() : 0;

        model.addAttribute("user", user);
        model.addAttribute("totalBookings", totalBookings);

        return "profile";
    }

    /**
     * Update user profile
     */
    @PostMapping("/profile/update")
    public String updateProfile(
            @RequestParam String name,
            @RequestParam String email,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        // Validate input
        if (name == null || name.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Name is required");
            return "redirect:/profile";
        }

        if (email == null || email.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Email is required");
            return "redirect:/profile";
        }

        // Update profile
        boolean success = UserService.updateProfile(userId, name.trim(), email.trim());

        if (success) {
            // Update session data
            session.setAttribute("userName", name.trim());
            session.setAttribute("userEmail", email.trim());
            redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Email is already taken by another user");
        }

        return "redirect:/profile";
    }

    /**
     * Change user password
     */
    @PostMapping("/profile/password")
    public String changePassword(
            @RequestParam String currentPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        // Validate input
        if (currentPassword == null || currentPassword.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Current password is required");
            return "redirect:/profile#password";
        }

        if (newPassword == null || newPassword.length() < 6) {
            redirectAttributes.addFlashAttribute("errorMessage", "New password must be at least 6 characters");
            return "redirect:/profile#password";
        }

        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Passwords do not match");
            return "redirect:/profile#password";
        }

        // Change password
        boolean success = UserService.changePassword(userId, currentPassword, newPassword);

        if (success) {
            redirectAttributes.addFlashAttribute("successMessage", "Password changed successfully");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Current password is incorrect");
        }

        return "redirect:/profile#password";
    }

    /**
     * Delete user account
     */
    @PostMapping("/profile/delete")
    public String deleteAccount(HttpSession session, RedirectAttributes redirectAttributes) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        // Delete user
        boolean success = UserService.deleteUser(userId);

        if (success) {
            // Invalidate session
            session.invalidate();
            redirectAttributes.addFlashAttribute("message", "Account deleted successfully");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to delete account");
            return "redirect:/profile";
        }
    }
}
