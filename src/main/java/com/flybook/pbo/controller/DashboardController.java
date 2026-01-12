package com.flybook.pbo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.flybook.pbo.model.Booking;
import com.flybook.pbo.model.Tiket;
import com.flybook.pbo.service.BookingService;
import com.flybook.pbo.service.TiketService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    @GetMapping("/user")
    public String userDashboard(Model model, HttpSession session) {
        // Get user data from session
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        model.addAttribute("userName", userName);
        List<Tiket> tikets = TiketService.semuaTiket();
        model.addAttribute("tikets", tikets);

        // Get user's bookings
        List<Booking> bookings = BookingService.getBookingsByUser(userName);
        model.addAttribute("bookings", bookings);

        return "dashboard-user";
    }

    @GetMapping("/admin")
    public String adminDashboard(Model model, HttpSession session) {
        // Get admin data from session and check role
        String userRole = (String) session.getAttribute("userRole");
        String userName = (String) session.getAttribute("userName");

        if (userName == null || !"admin".equals(userRole)) {
            return "redirect:/login";
        }

        model.addAttribute("adminName", userName);
        List<Tiket> tikets = TiketService.semuaTiket();
        model.addAttribute("tikets", tikets);
        model.addAttribute("totalTiket", tikets.size());

        // Get all bookings for admin
        List<Booking> bookings = BookingService.getAllBookings();
        model.addAttribute("bookings", bookings);

        return "dashboard-admin";
    }

    // ==================== TIKET CRUD ====================
    @GetMapping("/admin/tiket/create")
    public String showCreateTiketForm(Model model) {
        model.addAttribute("tiket", new Tiket());
        return "tiket-create";
    }

    @PostMapping("/admin/tiket/store")
    public String storeTiket(@ModelAttribute Tiket tiket) {
        tiket.setUserId(1); // TODO: Get actual user ID from session
        if (TiketService.tambahTiket(tiket)) {
            return "redirect:/dashboard/admin";
        }
        return "tiket-create";
    }

    @GetMapping("/admin/tiket/{id}/edit")
    public String showEditTiketForm(@PathVariable int id, Model model) {
        Tiket tiket = TiketService.getTiketById(id);
        if (tiket != null) {
            model.addAttribute("tiket", tiket);
            return "tiket-edit";
        }
        return "redirect:/dashboard/admin";
    }

    @PostMapping("/admin/tiket/{id}/update")
    public String updateTiket(@PathVariable int id, @ModelAttribute Tiket tiket, Model model) {
        tiket.setId(id);
        if (TiketService.updateTiket(tiket)) {
            return "redirect:/dashboard/admin";
        }
        model.addAttribute("tiket", tiket);
        return "tiket-edit";
    }

    @GetMapping("/admin/tiket/{id}/delete")
    public String deleteTiket(@PathVariable int id) {
        TiketService.hapusTiket(id);
        return "redirect:/dashboard/admin";
    }

    @GetMapping("/user/tiket/{id}/book")
    public String bookTiket(@PathVariable int id, @RequestParam(defaultValue = "1") int seats, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        if (BookingService.createBooking(id, userName, seats)) {
            return "redirect:/dashboard/user?message=booking_success";
        }
        return "redirect:/dashboard/user?message=booking_failed";
    }

    // ==================== BOOKING MANAGEMENT ====================
    @PostMapping("/admin/booking/{id}/status")
    public String updateBookingStatus(@PathVariable int id, @RequestParam String status) {
        BookingService.updateBookingStatus(id, status);
        return "redirect:/dashboard/admin";
    }

    @PostMapping("/admin/booking/{id}/delete")
    public String deleteBooking(@PathVariable int id) {
        BookingService.deleteBooking(id);
        return "redirect:/dashboard/admin";
    }

    @GetMapping("/tiket/{id}")
    public String viewTiket(@PathVariable int id, Model model) {
        Tiket tiket = TiketService.getTiketById(id);
        if (tiket != null) {
            model.addAttribute("tiket", tiket);
            int availableSeats = TiketService.getAvailableSeats(id);
            model.addAttribute("availableSeats", availableSeats);
            return "tiket-detail";
        }
        return "redirect:/dashboard/user";
    }

    // ==================== USER BOOKING MANAGEMENT ====================
    @GetMapping("/user/booking/{id}/edit")
    public String showEditBookingForm(@PathVariable int id, Model model, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        Booking booking = BookingService.getBookingById(id);
        if (booking != null && booking.getUserName().equals(userName) && "pending".equals(booking.getStatus())) {
            model.addAttribute("booking", booking);
            Tiket tiket = TiketService.getTiketById(booking.getTiketId());
            model.addAttribute("tiket", tiket);
            int availableSeats = TiketService.getAvailableSeats(booking.getTiketId()) + booking.getJumlahKursi();
            model.addAttribute("availableSeats", availableSeats);
            return "booking-edit";
        }
        return "redirect:/dashboard/user";
    }

    @PostMapping("/user/booking/{id}/update")
    public String updateUserBooking(@PathVariable int id, @RequestParam int jumlahKursi, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        if (BookingService.updateUserBooking(id, userName, jumlahKursi)) {
            session.setAttribute("successMsg", "Pesanan berhasil diupdate!");
        } else {
            session.setAttribute("errorMsg", "Gagal mengupdate pesanan.");
        }
        return "redirect:/dashboard/user";
    }

    @PostMapping("/user/booking/{id}/delete")
    public String deleteUserBooking(@PathVariable int id, HttpSession session) {
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        if (BookingService.deleteUserBooking(id, userName)) {
            session.setAttribute("successMsg", "Pesanan berhasil dibatalkan!");
        } else {
            session.setAttribute("errorMsg", "Gagal membatalkan pesanan.");
        }
        return "redirect:/dashboard/user";
    }
}
