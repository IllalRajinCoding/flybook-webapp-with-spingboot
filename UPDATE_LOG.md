# 🎨 Update UI & Sample Data - FlyBook

## ✨ Fitur Baru yang Ditambahkan

### 1. **UI Enhancement**

- ✅ **Hero Section yang lebih Modern**
  - Gradient text dengan animasi
  - Badge dengan pulse animation
  - Trust indicators (Harga Transparan & Aman & Terpercaya)
- ✅ **Statistics Dashboard**
  - Menampilkan jumlah penerbangan aktif
  - Total maskapai partner
  - Jumlah destinasi
  - Rating aplikasi
- ✅ **Filter Bar yang Lebih Canggih**
  - Border interaktif saat focus
  - Tombol reset filter
  - Enter key untuk search
  - Auto scroll ke hasil
- ✅ **Flight Cards Premium Design**
  - Gradient header dengan maskapai
  - Status badge (Tersedia/Penuh) dengan pulse animation
  - Progress bar untuk kursi tersedia
  - **Urgency indicator**: Alert merah jika kursi tersisa ≤ 10
  - Hover effects dengan lift animation
  - Bottom accent bar gradient

### 2. **Sample Flight Data**

**32 penerbangan telah ditambahkan** ke database dengan kategori:

#### Domestik (15 penerbangan)

- Jakarta → Bali, Surabaya, Makassar, Medan, dll
- Harga: Rp 420.000 - Rp 1.400.000

#### Domestik Premium (5 penerbangan)

- Jakarta → Labuan Bajo, Banda Aceh, Ambon, Timika
- Harga: Rp 1.100.000 - Rp 3.200.000

#### Internasional Asia Tenggara (5 penerbangan)

- Jakarta → Singapore, Kuala Lumpur, Bangkok, Hanoi, Manila
- Harga: Rp 750.000 - Rp 2.200.000

#### Internasional Premium (5 penerbangan)

- Jakarta → Doha, Dubai, Tokyo, Seoul, Hong Kong
- Harga: Rp 3.900.000 - Rp 7.200.000

#### Red-eye Flights (4 penerbangan)

- Penerbangan malam Jakarta ↔ Bali, Surabaya, Singapore
- Harga: Rp 380.000 - Rp 1.200.000

#### Limited Seats (3 penerbangan)

- Penerbangan dengan kursi hampir penuh (urgency)
- Harga: Rp 920.000 - Rp 1.650.000

### 3. **Maskapai yang Tersedia**

- Garuda Indonesia (7 penerbangan)
- AirAsia (6 penerbangan)
- Lion Air (5 penerbangan)
- Batik Air (4 penerbangan)
- Singapore Airlines, Thai Airways, Korean Air, Emirates, dll

## 🚀 Cara Menggunakan

### 1. Insert Sample Data

```bash
# Windows
.\insert-sample-data.bat

# Manual (jika batch file tidak jalan)
psql -U postgres -d flybook -f src/main/resources/sample_tiket_data.sql
```

### 2. Jalankan Aplikasi

```bash
./mvnw spring-boot:run
```

### 3. Akses Browser

```
http://localhost:8080
```

## 🎯 Fitur Interaktif

### Filter Penerbangan

1. **Asal**: Ketik nama kota/bandara (contoh: "Jakarta" atau "CGK")
2. **Tujuan**: Ketik tujuan (contoh: "Bali" atau "DPS")
3. **Tanggal**: Pilih dari date picker
4. **Klik "Cari Sekarang"** atau tekan **Enter**

### Features yang Aktif:

- ✅ **Real-time search** dengan stagger animation
- ✅ **Auto scroll** ke hasil pencarian
- ✅ **Notification** jumlah penerbangan ditemukan
- ✅ **Reset filter** untuk kembali ke semua penerbangan
- ✅ **Progress bar** menampilkan % kursi terisi
- ✅ **Urgency alert** untuk kursi hampir habis

## 📊 Data Statistics

```sql
-- Total penerbangan
SELECT COUNT(*) FROM tiket;  -- 32 flights

-- Per maskapai
SELECT maskapai, COUNT(*) as jumlah
FROM tiket
GROUP BY maskapai
ORDER BY jumlah DESC;

-- Penerbangan aktif
SELECT COUNT(*) FROM tiket WHERE status = 'aktif';  -- 32

-- Total kursi tersedia
SELECT SUM(kursi_tersedia - kursi_terjual) FROM tiket;  -- 2,257 kursi
```

## 🎨 Animasi & Effects

1. **Plane Animation** - Logo pesawat fly in/out saat scroll
2. **Pulse Animation** - Status badge & live indicator
3. **Shimmer Effect** - Loading states
4. **Float Animation** - Decorative elements
5. **Stagger Animation** - Card entrance dengan delay
6. **Gradient Progress** - Seat availability (hijau → kuning → merah)

## 📱 Responsive Design

- **Mobile**: 1 kolom cards
- **Tablet**: 2 kolom cards
- **Desktop**: 3 kolom cards

## 🔧 Konfigurasi

### Menambah Data Sendiri

Edit file: `src/main/resources/sample_tiket_data.sql`

```sql
INSERT INTO tiket
(nomor_tiket, penerbangan, maskapai, bandara_asal, bandara_tujuan,
 tanggal_berangkat, jam_berangkat, jam_tiba, harga,
 kursi_tersedia, kursi_terjual, status, user_id)
VALUES
('XX-001', 'CGK-XXX', 'Airline Name', 'Jakarta (CGK)', 'Destination (XXX)',
 '2025-12-25', '08:00', '10:30', 1000000,
 180, 50, 'aktif', NULL);
```

### Clear Data

```sql
TRUNCATE TABLE tiket CASCADE;
ALTER SEQUENCE tiket_id_seq RESTART WITH 1;
```

## 🎯 Next Steps

Untuk melihat semua fitur booking:

1. Login sebagai user: `user@flybook.com` / `user123`
2. Atau register akun baru
3. Klik tombol "Pesan" pada kartu penerbangan

---

**Happy Flying with FlyBook! ✈️**
