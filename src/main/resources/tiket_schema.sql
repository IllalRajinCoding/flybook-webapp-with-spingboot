-- Create tiket table for airline ticket management
CREATE TABLE IF NOT EXISTS tiket (
    id SERIAL PRIMARY KEY,
    nomor_tiket VARCHAR(50) NOT NULL UNIQUE,
    penerbangan VARCHAR(100) NOT NULL,
    maskapai VARCHAR(100) NOT NULL,
    bandara_asal VARCHAR(100) NOT NULL,
    bandara_tujuan VARCHAR(100) NOT NULL,
    tanggal_berangkat DATE NOT NULL,
    jam_berangkat VARCHAR(10) NOT NULL,
    jam_tiba VARCHAR(10) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    kursi_tersedia INT NOT NULL,
    kursi_terjual INT NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL DEFAULT 'aktif',
    user_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_kursi CHECK (kursi_terjual <= kursi_tersedia),
    CONSTRAINT check_harga CHECK (harga > 0)
);

-- Create index for better query performance
CREATE INDEX IF NOT EXISTS idx_tiket_status ON tiket(status);
CREATE INDEX IF NOT EXISTS idx_tiket_tanggal ON tiket(tanggal_berangkat);
CREATE INDEX IF NOT EXISTS idx_tiket_maskapai ON tiket(maskapai);

-- Sample data for testing (optional)
INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, user_id)
VALUES 
('GA-001', 'Garuda Indonesia 001', 'Garuda Indonesia', 'Jakarta (CGK)', 'Bali (DPS)', '2024-12-20', '08:00', '10:30', 1500000, 180, 1),
('BA-002', 'Batik Air 002', 'Batik Air', 'Jakarta (CGK)', 'Surabaya (JIR)', '2024-12-20', '09:30', '11:00', 800000, 200, 1),
('SJ-003', 'Sriwijaya Air 003', 'Sriwijaya Air', 'Medan (KNO)', 'Jakarta (CGK)', '2024-12-21', '14:00', '16:30', 950000, 150, 1);
