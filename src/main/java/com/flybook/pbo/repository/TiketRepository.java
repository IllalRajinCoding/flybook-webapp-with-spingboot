package com.flybook.pbo.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.flybook.pbo.database.DatabaseConfig;
import com.flybook.pbo.model.Tiket;

public class TiketRepository {

    /**
     * Create new tiket
     */
    public static boolean create(Tiket tiket) {
        String sql = "INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, "
                + "bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, "
                + "kursi_tersedia, kursi_terjual, status, user_id) "
                + "VALUES (?, ?, ?, ?, ?, ?::date, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, tiket.getNomorTiket());
            pstmt.setString(2, tiket.getPenerbangan());
            pstmt.setString(3, tiket.getMaskapai());
            pstmt.setString(4, tiket.getBandara_asal());
            pstmt.setString(5, tiket.getBandara_tujuan());
            pstmt.setString(6, tiket.getTanggalBerangkat());
            pstmt.setString(7, tiket.getJamBerangkat());
            pstmt.setString(8, tiket.getJamTiba());
            pstmt.setDouble(9, tiket.getHarga());
            pstmt.setInt(10, tiket.getKursiTersedia());
            pstmt.setInt(11, tiket.getKursiTerjual());
            pstmt.setString(12, tiket.getStatus());
            pstmt.setInt(13, tiket.getUserId());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error creating tiket: " + e.getMessage());
            return false;
        }
    }

    /**
     * Get all tiket
     */
    public static List<Tiket> getAll() {
        List<Tiket> tikets = new ArrayList<>();
        String sql = "SELECT * FROM tiket ORDER BY created_at DESC";

        try (Connection conn = DatabaseConfig.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Tiket tiket = mapResultSetToTiket(rs);
                tikets.add(tiket);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching all tiket: " + e.getMessage());
        }
        return tikets;
    }

    /**
     * Get tiket by ID
     */
    public static Tiket getById(int id) {
        String sql = "SELECT * FROM tiket WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToTiket(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching tiket by ID: " + e.getMessage());
        }
        return null;
    }

    /**
     * Update tiket
     */
    public static boolean update(Tiket tiket) {
        String sql = "UPDATE tiket SET nomor_tiket = ?, penerbangan = ?, maskapai = ?, "
                + "bandara_asal = ?, bandara_tujuan = ?, tanggal_berangkat = ?::date, "
                + "jam_berangkat = ?, jam_tiba = ?, harga = ?, kursi_tersedia = ?, "
                + "kursi_terjual = ?, status = ?, updated_at = CURRENT_TIMESTAMP "
                + "WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, tiket.getNomorTiket());
            pstmt.setString(2, tiket.getPenerbangan());
            pstmt.setString(3, tiket.getMaskapai());
            pstmt.setString(4, tiket.getBandara_asal());
            pstmt.setString(5, tiket.getBandara_tujuan());
            pstmt.setString(6, tiket.getTanggalBerangkat());
            pstmt.setString(7, tiket.getJamBerangkat());
            pstmt.setString(8, tiket.getJamTiba());
            pstmt.setDouble(9, tiket.getHarga());
            pstmt.setInt(10, tiket.getKursiTersedia());
            pstmt.setInt(11, tiket.getKursiTerjual());
            pstmt.setString(12, tiket.getStatus());
            pstmt.setInt(13, tiket.getId());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error updating tiket: " + e.getMessage());
            return false;
        }
    }

    /**
     * Delete tiket
     */
    public static boolean delete(int id) {
        String sql = "DELETE FROM tiket WHERE id = ?";

        try (Connection conn = DatabaseConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting tiket: " + e.getMessage());
            return false;
        }
    }

    /**
     * Map ResultSet to Tiket object
     */
    private static Tiket mapResultSetToTiket(ResultSet rs) throws SQLException {
        Tiket tiket = new Tiket();
        tiket.setId(rs.getInt("id"));
        tiket.setNomorTiket(rs.getString("nomor_tiket"));
        tiket.setPenerbangan(rs.getString("penerbangan"));
        tiket.setMaskapai(rs.getString("maskapai"));
        tiket.setBandara_asal(rs.getString("bandara_asal"));
        tiket.setBandara_tujuan(rs.getString("bandara_tujuan"));
        tiket.setTanggalBerangkat(rs.getString("tanggal_berangkat"));
        tiket.setJamBerangkat(rs.getString("jam_berangkat"));
        tiket.setJamTiba(rs.getString("jam_tiba"));
        tiket.setHarga(rs.getDouble("harga"));
        tiket.setKursiTersedia(rs.getInt("kursi_tersedia"));
        tiket.setKursiTerjual(rs.getInt("kursi_terjual"));
        tiket.setStatus(rs.getString("status"));
        tiket.setUserId(rs.getInt("user_id"));
        tiket.setCreatedAt(rs.getTimestamp("created_at"));
        tiket.setUpdatedAt(rs.getTimestamp("updated_at"));
        return tiket;
    }
}
