package com.flybook.pbo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("title", "Welcome to FlyBook");
        model.addAttribute("message", "Your Spring Boot Application is running!");
        model.addAttribute("isLoggedIn", false); // Default user belum login
        return "index";
    }
}
