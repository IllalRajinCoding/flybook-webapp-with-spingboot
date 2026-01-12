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
        // Mengambil data dari service
        List<Tiket> tiketList = TiketService.semuaTiket();

        model.addAttribute("title", "AirLand | Premium Aviation");
        model.addAttribute("tiketList", tiketList);

        // Note: Pastikan di application.properties prefix=/WEB-INF/jsp/ dan suffix=.jsp
        return "index";
    }

    @GetMapping("/gallery")
    public String gallery(Model model) {
        model.addAttribute("title", "AirLand Gallery");
        return "gallery"; // Akan mencari /WEB-INF/jsp/gallery.jsp
    }

    
}