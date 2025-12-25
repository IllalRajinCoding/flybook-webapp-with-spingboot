-- Sample Flight Data for FlyBook
-- Hapus data lama jika ada
TRUNCATE TABLE tiket CASCADE;

-- Reset sequence ID
ALTER SEQUENCE tiket_id_seq RESTART WITH 1;

-- Insert sample flight data
-- Format: (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, kursi_terjual, status, user_id)

-- Penerbangan Domestik
INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, kursi_terjual, status, user_id) VALUES
('GA-101', 'CGK-DPS', 'Garuda Indonesia', 'Jakarta (CGK)', 'Bali (DPS)', '2025-12-24', '06:00', '09:00', 850000, 180, 45, 'aktif', NULL),
('QZ-202', 'CGK-SUB', 'AirAsia', 'Jakarta (CGK)', 'Surabaya (SUB)', '2025-12-24', '07:30', '09:15', 450000, 160, 89, 'aktif', NULL),
('ID-303', 'CGK-UPG', 'Batik Air', 'Jakarta (CGK)', 'Makassar (UPG)', '2025-12-24', '08:00', '11:45', 980000, 150, 32, 'aktif', NULL),
('JT-404', 'CGK-KNO', 'Lion Air', 'Jakarta (CGK)', 'Medan (KNO)', '2025-12-25', '09:15', '11:30', 720000, 200, 156, 'aktif', NULL),
('SJ-505', 'CGK-PDG', 'Sriwijaya Air', 'Jakarta (CGK)', 'Padang (PDG)', '2025-12-25', '10:00', '12:15', 650000, 140, 78, 'aktif', NULL),
('GA-606', 'CGK-BPN', 'Garuda Indonesia', 'Jakarta (CGK)', 'Balikpapan (BPN)', '2025-12-25', '11:30', '14:00', 1200000, 180, 23, 'aktif', NULL),
('QZ-707', 'CGK-LOP', 'AirAsia', 'Jakarta (CGK)', 'Lombok (LOP)', '2025-12-26', '06:45', '09:30', 780000, 160, 67, 'aktif', NULL),
('ID-808', 'SUB-DPS', 'Batik Air', 'Surabaya (SUB)', 'Bali (DPS)', '2025-12-26', '07:00', '08:15', 420000, 150, 98, 'aktif', NULL),
('JT-909', 'DPS-CGK', 'Lion Air', 'Bali (DPS)', 'Jakarta (CGK)', '2025-12-26', '14:00', '17:00', 890000, 200, 134, 'aktif', NULL),
('GA-110', 'CGK-YIA', 'Garuda Indonesia', 'Jakarta (CGK)', 'Yogyakarta (YIA)', '2025-12-27', '08:30', '09:45', 550000, 180, 45, 'aktif', NULL);

-- Penerbangan Domestik Premium
INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, kursi_terjual, status, user_id) VALUES
('GA-201', 'CGK-LBJ', 'Garuda Indonesia', 'Jakarta (CGK)', 'Labuan Bajo (LBJ)', '2025-12-27', '09:00', '11:30', 1400000, 120, 67, 'aktif', NULL),
('QZ-301', 'CGK-BTJ', 'AirAsia', 'Jakarta (CGK)', 'Banda Aceh (BTJ)', '2025-12-27', '10:30', '13:15', 1100000, 160, 34, 'aktif', NULL),
('ID-401', 'CGK-AMQ', 'Batik Air', 'Jakarta (CGK)', 'Ambon (AMQ)', '2025-12-28', '11:00', '16:45', 2100000, 140, 56, 'aktif', NULL),
('GA-501', 'CGK-TIM', 'Garuda Indonesia', 'Jakarta (CGK)', 'Timika (TIM)', '2025-12-28', '07:00', '13:30', 3200000, 120, 45, 'aktif', NULL),
('JT-601', 'CGK-SOC', 'Lion Air', 'Jakarta (CGK)', 'Solo (SOC)', '2025-12-28', '08:45', '10:00', 480000, 180, 123, 'aktif', NULL);

-- Penerbangan Internasional Asia Tenggara
INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, kursi_terjual, status, user_id) VALUES
('SQ-701', 'CGK-SIN', 'Singapore Airlines', 'Jakarta (CGK)', 'Singapore (SIN)', '2025-12-29', '06:30', '09:15', 900000, 220, 178, 'aktif', NULL),
('QZ-801', 'CGK-KUL', 'AirAsia', 'Jakarta (CGK)', 'Kuala Lumpur (KUL)', '2025-12-29', '07:45', '10:30', 750000, 180, 89, 'aktif', NULL),
('TG-901', 'CGK-BKK', 'Thai Airways', 'Jakarta (CGK)', 'Bangkok (BKK)', '2025-12-29', '09:00', '13:15', 1800000, 200, 145, 'aktif', NULL),
('VN-1001', 'CGK-HAN', 'Vietnam Airlines', 'Jakarta (CGK)', 'Hanoi (HAN)', '2025-12-30', '10:30', '15:00', 2200000, 160, 67, 'aktif', NULL),
('PR-1101', 'CGK-MNL', 'Philippine Airlines', 'Jakarta (CGK)', 'Manila (MNL)', '2025-12-30', '11:00', '15:45', 1950000, 180, 92, 'aktif', NULL);

-- Penerbangan Internasional Premium
INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, kursi_terjual, status, user_id) VALUES
('QR-1201', 'CGK-DOH', 'Qatar Airways', 'Jakarta (CGK)', 'Doha (DOH)', '2025-12-30', '23:00', '04:30', 6500000, 240, 189, 'aktif', NULL),
('EK-1301', 'CGK-DXB', 'Emirates', 'Jakarta (CGK)', 'Dubai (DXB)', '2025-12-31', '22:30', '03:45', 7200000, 280, 234, 'aktif', NULL),
('NH-1401', 'CGK-NRT', 'ANA', 'Jakarta (CGK)', 'Tokyo (NRT)', '2025-12-31', '08:00', '17:00', 5200000, 200, 145, 'aktif', NULL),
('KE-1501', 'CGK-ICN', 'Korean Air', 'Jakarta (CGK)', 'Seoul (ICN)', '2026-01-01', '09:30', '18:00', 4800000, 220, 167, 'aktif', NULL),
('CX-1601', 'CGK-HKG', 'Cathay Pacific', 'Jakarta (CGK)', 'Hong Kong (HKG)', '2026-01-01', '10:00', '15:30', 3900000, 190, 123, 'aktif', NULL);

-- Penerbangan Malam (Red-eye flights)
INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, kursi_terjual, status, user_id) VALUES
('JT-1701', 'CGK-DPS', 'Lion Air', 'Jakarta (CGK)', 'Bali (DPS)', '2026-01-02', '22:00', '01:00', 650000, 200, 178, 'aktif', NULL),
('QZ-1801', 'CGK-SUB', 'AirAsia', 'Jakarta (CGK)', 'Surabaya (SUB)', '2026-01-02', '23:30', '01:15', 380000, 160, 145, 'aktif', NULL),
('GA-1901', 'CGK-SIN', 'Garuda Indonesia', 'Jakarta (CGK)', 'Singapore (SIN)', '2026-01-02', '21:00', '23:45', 1200000, 180, 89, 'aktif', NULL),
('ID-2001', 'DPS-CGK', 'Batik Air', 'Bali (DPS)', 'Jakarta (CGK)', '2026-01-03', '20:30', '23:30', 780000, 150, 67, 'aktif', NULL);

-- Penerbangan dengan kursi terbatas (untuk urgency)
INSERT INTO tiket (nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan, tanggal_berangkat, jam_berangkat, jam_tiba, harga, kursi_tersedia, kursi_terjual, status, user_id) VALUES
('GA-2101', 'CGK-DPS', 'Garuda Indonesia', 'Jakarta (CGK)', 'Bali (DPS)', '2026-01-03', '15:00', '18:00', 920000, 100, 95, 'aktif', NULL),
('QZ-2201', 'CGK-SIN', 'AirAsia', 'Jakarta (CGK)', 'Singapore (SIN)', '2026-01-03', '16:30', '19:15', 950000, 120, 117, 'aktif', NULL),
('JT-2301', 'CGK-BKK', 'Lion Air', 'Jakarta (CGK)', 'Bangkok (BKK)', '2026-01-04', '08:00', '12:15', 1650000, 80, 78, 'aktif', NULL);

-- Update timestamp
UPDATE tiket SET created_at = CURRENT_TIMESTAMP, updated_at = CURRENT_TIMESTAMP;

-- Verifikasi data
SELECT COUNT(*) as total_flights FROM tiket;
SELECT maskapai, COUNT(*) as jumlah FROM tiket GROUP BY maskapai ORDER BY jumlah DESC;
