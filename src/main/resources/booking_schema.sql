-- Drop table if exists
DROP TABLE IF EXISTS booking CASCADE;

-- Create booking table
CREATE TABLE booking (
    id SERIAL PRIMARY KEY,
    booking_code VARCHAR(50) UNIQUE NOT NULL,
    tiket_id INT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    jumlah_kursi INT NOT NULL DEFAULT 1,
    total_harga DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    tanggal_booking TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_tiket FOREIGN KEY (tiket_id) REFERENCES tiket(id) ON DELETE CASCADE
);

-- Create index for faster queries
CREATE INDEX idx_booking_user ON booking(user_name);
CREATE INDEX idx_booking_status ON booking(status);
CREATE INDEX idx_booking_tiket ON booking(tiket_id);

-- Insert sample bookings
INSERT INTO booking (booking_code, tiket_id, user_name, jumlah_kursi, total_harga, status) 
VALUES 
('BK-001-20251217', 1, 'user', 2, 1600000, 'success'),
('BK-002-20251217', 2, 'user', 1, 750000, 'pending'),
('BK-003-20251217', 1, 'budi', 1, 800000, 'failed');
