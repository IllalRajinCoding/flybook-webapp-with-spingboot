package com.flybook.pbo.database;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Test class untuk verifikasi koneksi database
 */
public class DatabaseTest {

    public static void main(String[] args) {
        System.out.println("=== Testing PostgreSQL Connection ===");
        System.out.println("Database: flybook");
        System.out.println("Host: localhost:5432");
        System.out.println("Username: postgres");
        System.out.println();

        // Test connection
        if (DatabaseConfig.testConnection()) {
            System.out.println("✓ Connection successful!");

            // Get connection details
            try (Connection conn = DatabaseConfig.getConnection()) {
                System.out.println("✓ Database: " + conn.getCatalog());
                System.out.println("✓ Driver: " + conn.getMetaData().getDriverName());
                System.out.println("✓ Driver Version: " + conn.getMetaData().getDriverVersion());
                System.out.println("✓ Database Product: " + conn.getMetaData().getDatabaseProductName());
                System.out.println("✓ Database Version: " + conn.getMetaData().getDatabaseProductVersion());
            } catch (SQLException e) {
                System.err.println("✗ Error getting connection details: " + e.getMessage());
            }
        } else {
            System.err.println("✗ Connection failed!");
            System.err.println("\nTroubleshooting:");
            System.err.println("1. Make sure PostgreSQL is running");
            System.err.println("2. Check database 'flybook' exists");
            System.err.println("3. Verify username 'postgres' and password 'Root'");
            System.err.println("4. Ensure PostgreSQL is listening on port 5432");
        }
    }
}
