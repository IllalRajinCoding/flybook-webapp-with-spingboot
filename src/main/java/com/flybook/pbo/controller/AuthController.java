package com.flybook.pbo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flybook.pbo.model.User;
import com.flybook.pbo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam(required = false) String remember,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        // Authenticate user
        User user = UserService.authenticate(email, password);

        if (user != null) {
            // Store user in session
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("userName", user.getName());
            session.setAttribute("userRole", user.getRole());

            // Redirect based on role
            if (user.isAdmin()) {
                return "redirect:/dashboard/admin";
            } else {
                return "redirect:/dashboard/user";
            }
        } else {
            // Login failed
            redirectAttributes.addFlashAttribute("error", "Email atau password salah!");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("message", "Anda telah logout");
        return "redirect:/login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            RedirectAttributes redirectAttributes) {

        // Validate inputs
        if (name == null || name.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Nama tidak boleh kosong!");
            return "redirect:/register";
        }

        if (email == null || email.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Email tidak boleh kosong!");
            return "redirect:/register";
        }

        if (password == null || password.length() < 6) {
            redirectAttributes.addFlashAttribute("error", "Password minimal 6 karakter!");
            return "redirect:/register";
        }

        if (!password.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "Password tidak cocok!");
            return "redirect:/register";
        }

        // Check if email already exists
        if (UserService.emailExists(email)) {
            redirectAttributes.addFlashAttribute("error", "Email sudah terdaftar!");
            return "redirect:/register";
        }

        // Register user
        boolean success = UserService.register(name, email, password);

        if (success) {
            redirectAttributes.addFlashAttribute("message", "Registrasi berhasil! Silakan login");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("error", "Registrasi gagal! Coba lagi");
            return "redirect:/register";
        }
    }
}
