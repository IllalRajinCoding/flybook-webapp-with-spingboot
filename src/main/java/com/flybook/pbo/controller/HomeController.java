package com.flybook.pbo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.flybook.pbo.model.Tiket;
import com.flybook.pbo.service.TiketService;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        // Fetch all available flights
        List<Tiket> tiketList = TiketService.semuaTiket();

        model.addAttribute("title", "Welcome to FlyBook");
        model.addAttribute("message", "Your Spring Boot Application is running!");
        model.addAttribute("isLoggedIn", false); // Default user belum login
        model.addAttribute("tiketList", tiketList);

        return "index";
    }
}
