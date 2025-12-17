package com.flybook.pbo.service;

import com.flybook.pbo.model.Booking;
import com.flybook.pbo.model.Tiket;
import com.flybook.pbo.repository.BookingRepository;
import com.flybook.pbo.repository.TiketRepository;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class BookingService {

    /**
     * Create new booking
     */
    public static boolean createBooking(int tiketId, String userName, int jumlahKursi) {
        // Get tiket info
        Tiket tiket = TiketRepository.getById(tiketId);
        if (tiket == null) {
            return false;
        }
        
        // Check seat availability
        int availableSeats = tiket.getKursiTersedia() - tiket.getKursiTerjual();
        if (availableSeats < jumlahKursi) {
            return false;
        }
        
        // Generate booking code
        String bookingCode = generateBookingCode();
        
        // Calculate total price
        double totalHarga = tiket.getHarga() * jumlahKursi;
        
        // Create booking
        Booking booking = new Booking(bookingCode, tiketId, userName, jumlahKursi, totalHarga);
        return BookingRepository.create(booking);
    }

    /**
     * Get all bookings
     */
    public static List<Booking> getAllBookings() {
        return BookingRepository.getAll();
    }

    /**
     * Get bookings by username
     */
    public static List<Booking> getBookingsByUser(String userName) {
        return BookingRepository.getByUserName(userName);
    }

    /**
     * Get booking by ID
     */
    public static Booking getBookingById(int id) {
        return BookingRepository.getById(id);
    }

    /**
     * Update booking status
     */
    public static boolean updateBookingStatus(int id, String status) {
        Booking booking = BookingRepository.getById(id);
        if (booking == null) {
            return false;
        }
        
        // If status changed to success, update tiket seats
        if ("success".equals(status) && !"success".equals(booking.getStatus())) {
            Tiket tiket = TiketRepository.getById(booking.getTiketId());
            if (tiket != null) {
                tiket.setKursiTerjual(tiket.getKursiTerjual() + booking.getJumlahKursi());
                TiketRepository.update(tiket);
            }
        }
        
        // If status changed from success to other, decrease tiket seats
        if (!"success".equals(status) && "success".equals(booking.getStatus())) {
            Tiket tiket = TiketRepository.getById(booking.getTiketId());
            if (tiket != null) {
                tiket.setKursiTerjual(tiket.getKursiTerjual() - booking.getJumlahKursi());
                TiketRepository.update(tiket);
            }
        }
        
        return BookingRepository.updateStatus(id, status);
    }

    /**
     * Delete booking
     */
    public static boolean deleteBooking(int id) {
        return BookingRepository.delete(id);
    }

    /**
     * Generate unique booking code
     */
    private static String generateBookingCode() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date());
        int random = (int) (Math.random() * 1000);
        return "BK-" + timestamp + "-" + random;
    }

    /**
     * Count bookings by status
     */
    public static int countByStatus(String status) {
        List<Booking> all = BookingRepository.getAll();
        return (int) all.stream().filter(b -> status.equals(b.getStatus())).count();
    }
}
