package com.flybook.pbo.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConfig {

    // Database credentials
    private static final String URL = "jdbc:postgresql://localhost:5432/flybook";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "Intan";

    // JDBC driver class
    private static final String DRIVER = "org.postgresql.Driver";

    /**
     * Get database connection
     *
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Load PostgreSQL JDBC driver
            Class.forName(DRIVER);

            // Establish and return connection
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);

        } catch (ClassNotFoundException e) {
            throw new SQLException("PostgreSQL JDBC Driver not found", e);
        }
    }

    /**
     * Close database connection safely
     *
     * @param conn Connection to close
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }

    /**
     * Close ResultSet safely
     *
     * @param rs ResultSet to close
     */
    public static void closeResultSet(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.err.println("Error closing ResultSet: " + e.getMessage());
            }
        }
    }

    /**
     * Close Statement safely
     *
     * @param stmt Statement to close
     */
    public static void closeStatement(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                System.err.println("Error closing Statement: " + e.getMessage());
            }
        }
    }

    /**
     * Close PreparedStatement safely
     *
     * @param pstmt PreparedStatement to close
     */
    public static void closePreparedStatement(PreparedStatement pstmt) {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                System.err.println("Error closing PreparedStatement: " + e.getMessage());
            }
        }
    }

    /**
     * Test database connection
     *
     * @return true if connection successful, false otherwise
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            System.err.println("Connection test failed: " + e.getMessage());
            return false;
        }
    }
}
