# Fitur Booking System - FlyBook

## Overview

Sistem booking memungkinkan user untuk memesan tiket dan admin untuk mengelola status pembayaran booking tersebut.

## Fitur Utama

### 1. User - Booking Tiket

- User dapat melihat semua tiket yang tersedia
- User dapat melakukan booking tiket dengan memasukkan jumlah kursi
- Setiap booking mendapat kode booking unik (format: BK-YYYYMMDD-XXXXX)
- Status awal booking adalah **PENDING**
- User dapat melihat riwayat booking mereka di dashboard

### 2. Admin - Kelola Status Booking

- Admin dapat melihat semua booking dari semua user
- Admin dapat mengubah status booking:
  - **PENDING**: Menunggu pembayaran
  - **SUCCESS**: Pembayaran berhasil (kursi akan reserved)
  - **FAILED**: Pembayaran gagal (kursi akan di-release)
- Admin dapat menghapus booking yang tidak valid

### 3. Manajemen Kursi Otomatis

- Saat booking dibuat: Kursi dicek ketersediaannya
- Saat status berubah ke SUCCESS: Kursi otomatis di-reserve (kursi_terjual +)
- Saat status berubah ke FAILED/PENDING: Kursi di-release (kursi_terjual -)

## Database Schema

### Tabel: booking

```sql
CREATE TABLE booking (
    id SERIAL PRIMARY KEY,
    booking_code VARCHAR(50) UNIQUE NOT NULL,
    tiket_id INTEGER NOT NULL REFERENCES tiket(id) ON DELETE CASCADE,
    user_name VARCHAR(100) NOT NULL,
    jumlah_kursi INTEGER NOT NULL CHECK (jumlah_kursi > 0),
    total_harga BIGINT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'success', 'failed')),
    tanggal_booking TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Endpoint API

### User Endpoints

- `POST /dashboard/user/tiket/{id}/book` - Booking tiket
  - Parameter: `jumlahKursi` (form data)
  - Validasi: Cek ketersediaan kursi
  - Redirect: Kembali ke dashboard user

### Admin Endpoints

- `POST /dashboard/admin/booking/{id}/status` - Update status booking

  - Parameter: `status` (pending/success/failed)
  - Logic: Update seat count based on status
  - Redirect: Kembali ke dashboard admin

- `POST /dashboard/admin/booking/{id}/delete` - Hapus booking
  - Logic: Delete booking record
  - Redirect: Kembali ke dashboard admin

## Business Logic

### BookingService.java

```java
public class BookingService {
    // 1. createBooking() - Buat booking baru
    //    - Generate booking code
    //    - Validasi kursi tersedia
    //    - Hitung total harga
    //    - Simpan ke database

    // 2. updateBookingStatus() - Update status & seat management
    //    - Get booking & tiket data
    //    - Adjust seat count based on status change
    //    - Update tiket seat availability
    //    - Update booking status

    // 3. deleteBooking() - Hapus booking
    //    - Delete dari database
}
```

## Tampilan UI

### Dashboard User

- **Section "Tiket Pesanan Saya"** (jika ada booking)
  - Card view dengan gradient background
  - Badge status berwarna (hijau/kuning/merah)
  - Info lengkap penerbangan dan harga
  - Responsive grid layout (3 columns di desktop)

### Dashboard Admin

- **Section "Manajemen Booking"**
  - Table view dengan semua booking
  - Dropdown untuk ubah status (auto-submit)
  - Button hapus dengan konfirmasi
  - Menampilkan info user, tiket, dan total harga

## Testing Flow

### 1. Login sebagai User

```
URL: http://localhost:8080/login
Username: user1
Password: password123
```

### 2. Booking Tiket

- Pilih tiket yang tersedia
- Klik "Book Now"
- Masukkan jumlah kursi
- Submit booking
- Lihat booking di section "Tiket Pesanan Saya" dengan status PENDING

### 3. Login sebagai Admin

```
Username: admin
Password: admin123
```

### 4. Kelola Booking

- Lihat semua booking di section "Manajemen Booking"
- Ubah status booking dari dropdown
- Verifikasi perubahan kursi_terjual di tabel tiket
- Test hapus booking jika diperlukan

## Status Badge Colors

- 🟢 **SUCCESS**: Hijau - Pembayaran berhasil
- 🟡 **PENDING**: Kuning - Menunggu pembayaran
- 🔴 **FAILED**: Merah - Pembayaran gagal

## Notes

- Booking code unique untuk setiap pesanan
- Seat management otomatis saat status berubah
- Admin memiliki full control atas semua booking
- User hanya bisa melihat booking mereka sendiri
