package com.flybook.pbo.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.flybook.pbo.database.DatabaseConfig;
import com.flybook.pbo.model.Booking;

public class BookingRepository {

    /**
     * Create new booking
     */
    public static boolean create(Booking booking) {
        String sql = "INSERT INTO booking (booking_code, tiket_id, user_name, jumlah_kursi, total_harga, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, booking.getBookingCode());
            pstmt.setInt(2, booking.getTiketId());
            pstmt.setString(3, booking.getUserName());
            pstmt.setInt(4, booking.getJumlahKursi());
            pstmt.setDouble(5, booking.getTotalHarga());
            pstmt.setString(6, booking.getStatus());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error creating booking: " + e.getMessage());
            return false;
        }
    }

    /**
     * Get all bookings with tiket details (for admin)
     */
    public static List<Booking> getAll() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, t.nomor_tiket, t.maskapai, t.penerbangan, "
                + "t.bandara_asal, t.bandara_tujuan, t.tanggal_berangkat, "
                + "t.jam_berangkat, t.jam_tiba "
                + "FROM booking b "
                + "JOIN tiket t ON b.tiket_id = t.id "
                + "ORDER BY b.tanggal_booking DESC";

        try (Connection conn = DatabaseConfig.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Booking booking = mapResultSetToBooking(rs);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all bookings: " + e.getMessage());
        }
        return bookings;
    }

    /**
     * Get bookings by username
     */
    public static List<Booking> getByUserName(String userName) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, t.nomor_tiket, t.maskapai, t.penerbangan, "
                + "t.bandara_asal, t.bandara_tujuan, t.tanggal_berangkat, "
                + "t.jam_berangkat, t.jam_tiba "
                + "FROM booking b "
                + "JOIN tiket t ON b.tiket_id = t.id "
                + "WHERE b.user_name = ? "
                + "ORDER BY b.tanggal_booking DESC";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userName);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Booking booking = mapResultSetToBooking(rs);
                    bookings.add(booking);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching bookings by user: " + e.getMessage());
        }
        return bookings;
    }

    /**
     * Get booking by ID
     */
    public static Booking getById(int id) {
        String sql = "SELECT b.*, t.nomor_tiket, t.maskapai, t.penerbangan, "
                + "t.bandara_asal, t.bandara_tujuan, t.tanggal_berangkat, "
                + "t.jam_berangkat, t.jam_tiba "
                + "FROM booking b "
                + "JOIN tiket t ON b.tiket_id = t.id "
                + "WHERE b.id = ?";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToBooking(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching booking by ID: " + e.getMessage());
        }
        return null;
    }

    /**
     * Get booking by username and tiket ID
     */
    public static Booking getByUserAndTiket(String userName, int tiketId) {
        String sql = "SELECT b.*, t.nomor_tiket, t.maskapai, t.penerbangan, "
                + "t.bandara_asal, t.bandara_tujuan, t.tanggal_berangkat, "
                + "t.jam_berangkat, t.jam_tiba "
                + "FROM booking b "
                + "JOIN tiket t ON b.tiket_id = t.id "
                + "WHERE b.user_name = ? AND b.tiket_id = ? "
                + "ORDER BY b.tanggal_booking DESC LIMIT 1";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userName);
            pstmt.setInt(2, tiketId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToBooking(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching booking by user and tiket: " + e.getMessage());
        }
        return null;
    }

    /**
     * Update booking status
     */
    public static boolean updateStatus(int id, String status) {
        String sql = "UPDATE booking SET status = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setInt(2, id);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error updating booking status: " + e.getMessage());
            return false;
        }
    }

    /**
     * Delete booking
     */
    public static boolean delete(int id) {
        String sql = "DELETE FROM booking WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting booking: " + e.getMessage());
            return false;
        }
    }

    /**
     * Update booking (jumlah kursi and total harga)
     */
    public static boolean updateBooking(int id, int jumlahKursi, double totalHarga) {
        String sql = "UPDATE booking SET jumlah_kursi = ?, total_harga = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, jumlahKursi);
            pstmt.setDouble(2, totalHarga);
            pstmt.setInt(3, id);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error updating booking: " + e.getMessage());
            return false;
        }
    }

    /**
     * Map ResultSet to Booking object
     */
    private static Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        Booking booking = new Booking();
        booking.setId(rs.getInt("id"));
        booking.setBookingCode(rs.getString("booking_code"));
        booking.setTiketId(rs.getInt("tiket_id"));
        booking.setUserName(rs.getString("user_name"));
        booking.setJumlahKursi(rs.getInt("jumlah_kursi"));
        booking.setTotalHarga(rs.getDouble("total_harga"));
        booking.setStatus(rs.getString("status"));
        booking.setTanggalBooking(rs.getTimestamp("tanggal_booking"));
        booking.setUpdatedAt(rs.getTimestamp("updated_at"));

        // Join fields
        booking.setNomorTiket(rs.getString("nomor_tiket"));
        booking.setMaskapai(rs.getString("maskapai"));
        booking.setPenerbangan(rs.getString("penerbangan"));
        booking.setBandaraAsal(rs.getString("bandara_asal"));
        booking.setBandaraTujuan(rs.getString("bandara_tujuan"));
        booking.setTanggalBerangkat(rs.getString("tanggal_berangkat"));
        booking.setJamBerangkat(rs.getString("jam_berangkat"));
        booking.setJamTiba(rs.getString("jam_tiba"));

        return booking;
    }
}
