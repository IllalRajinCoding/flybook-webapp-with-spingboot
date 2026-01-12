package com.flybook.pbo.controller;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.flybook.pbo.database.DatabaseConfig;

@Controller
public class DatabaseTestController {

    @GetMapping("/test-db")
    public String testDatabase(Model model) {
        boolean isConnected = false;
        String message = "";
        String details = "";

        try (Connection conn = DatabaseConfig.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                isConnected = true;
                message = "✓ Koneksi ke database berhasil!";

                // Get database details
                StringBuilder sb = new StringBuilder();
                sb.append("Database: ").append(conn.getCatalog()).append("\n");
                sb.append("Driver: ").append(conn.getMetaData().getDriverName()).append("\n");
                sb.append("Driver Version: ").append(conn.getMetaData().getDriverVersion()).append("\n");
                sb.append("Database Product: ").append(conn.getMetaData().getDatabaseProductName()).append("\n");
                sb.append("Database Version: ").append(conn.getMetaData().getDatabaseProductVersion());

                details = sb.toString();
            } else {
                message = "✗ Koneksi gagal!";
            }
        } catch (SQLException e) {
            message = "✗ Error: " + e.getMessage();
            details = "Troubleshooting:\n"
                    + "1. Pastikan PostgreSQL sedang berjalan\n"
                    + "2. Cek database 'flybook' sudah dibuat\n"
                    + "3. Verifikasi username 'postgres' dan password 'Root'\n"
                    + "4. Pastikan PostgreSQL listening di port 5432";
        }

        model.addAttribute("isConnected", isConnected);
        model.addAttribute("message", message);
        model.addAttribute("details", details);

        return "test-db";
    }
}
