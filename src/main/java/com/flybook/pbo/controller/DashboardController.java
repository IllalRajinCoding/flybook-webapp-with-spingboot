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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String storeTiket(@ModelAttribute Tiket tiket, RedirectAttributes redirectAttributes) {
        tiket.setUserId(1);

        // Check if nomor tiket already exists
        if (TiketService.isNomorTiketExists(tiket.getNomorTiket())) {
            redirectAttributes.addFlashAttribute("error", "Nomor penerbangan '" + tiket.getNomorTiket() + "' sudah ada!");
            return "redirect:/dashboard/admin/tiket/create";
        }

        if (TiketService.tambahTiket(tiket)) {
            redirectAttributes.addFlashAttribute("success", "Tiket berhasil ditambahkan!");
            return "redirect:/dashboard/admin?tab=tickets";
        }
        redirectAttributes.addFlashAttribute("error", "Gagal menambahkan tiket.");
        return "redirect:/dashboard/admin/tiket/create";
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
    public String updateTiket(@PathVariable int id, @ModelAttribute Tiket tiket, Model model, RedirectAttributes redirectAttributes) {
        tiket.setId(id);
        if (TiketService.updateTiket(tiket)) {
            redirectAttributes.addFlashAttribute("success", "Tiket berhasil diperbarui!");
            return "redirect:/dashboard/admin?tab=tickets";
        }
        redirectAttributes.addFlashAttribute("error", "Gagal memperbarui tiket.");
        model.addAttribute("tiket", tiket);
        return "tiket-edit";
    }

    @GetMapping("/admin/tiket/{id}/delete")
    public String deleteTiket(@PathVariable int id, RedirectAttributes redirectAttributes) {
        if (TiketService.hapusTiket(id)) {
            redirectAttributes.addFlashAttribute("success", "Tiket berhasil dihapus!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Gagal menghapus tiket.");
        }
        return "redirect:/dashboard/admin?tab=tickets";
    }

    @GetMapping("/user/tiket/{id}/book")
    public String bookTiket(@PathVariable int id, @RequestParam(defaultValue = "1") int seats, HttpSession session, RedirectAttributes redirectAttributes) {
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        if (BookingService.createBooking(id, userName, seats)) {
            redirectAttributes.addFlashAttribute("success", "Pembelian berhasil! Mohon tunggu konfirmasi dari admin.");
            return "redirect:/dashboard/user";
        }
        redirectAttributes.addFlashAttribute("error", "Gagal melakukan pemesanan. Kursi mungkin sudah tidak tersedia.");
        return "redirect:/dashboard/tiket/" + id;
    }

    // ==================== BOOKING MANAGEMENT ====================
    @PostMapping("/admin/booking/{id}/status")
    public String updateBookingStatus(@PathVariable int id, @RequestParam String status, RedirectAttributes redirectAttributes) {
        if (BookingService.updateBookingStatus(id, status)) {
            redirectAttributes.addFlashAttribute("success", "Status pesanan berhasil diubah menjadi '" + status + "'!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Gagal mengubah status pesanan.");
        }
        return "redirect:/dashboard/admin";
    }

    @PostMapping("/admin/booking/{id}/delete")
    public String deleteBooking(@PathVariable int id, RedirectAttributes redirectAttributes) {
        if (BookingService.deleteBooking(id)) {
            redirectAttributes.addFlashAttribute("success", "Pesanan berhasil dihapus!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Gagal menghapus pesanan.");
        }
        return "redirect:/dashboard/admin";
    }

    @GetMapping("/tiket/{id}")
    public String viewTiket(@PathVariable int id, Model model, HttpSession session) {
        Tiket tiket = TiketService.getTiketById(id);
        if (tiket != null) {
            model.addAttribute("tiket", tiket);
            int availableSeats = TiketService.getAvailableSeats(id);
            model.addAttribute("availableSeats", availableSeats);

            // Check if user has booking for this ticket
            String userName = (String) session.getAttribute("userName");
            if (userName != null) {
                Booking userBooking = BookingService.getBookingByUserAndTiket(userName, id);
                if (userBooking != null) {
                    model.addAttribute("booking", userBooking);
                }
            }

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
    public String updateUserBooking(@PathVariable int id, @RequestParam int jumlahKursi, HttpSession session, RedirectAttributes redirectAttributes) {
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        if (BookingService.updateUserBooking(id, userName, jumlahKursi)) {
            redirectAttributes.addFlashAttribute("success", "Pesanan berhasil diupdate!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Gagal mengupdate pesanan.");
        }
        return "redirect:/dashboard/user";
    }

    @PostMapping("/user/booking/{id}/delete")
    public String deleteUserBooking(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }

        if (BookingService.deleteUserBooking(id, userName)) {
            redirectAttributes.addFlashAttribute("success", "Pesanan berhasil dibatalkan!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Gagal membatalkan pesanan.");
        }
        return "redirect:/dashboard/user";
    }
}
