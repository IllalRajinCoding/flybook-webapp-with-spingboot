# Payment Gateway Integration (Sandbox Mode)

## Overview

FlyBook sekarang dilengkapi dengan fitur Payment Gateway dalam mode sandbox/dummy untuk simulasi pembayaran.

## Fitur Payment Gateway

### 1. **Metode Pembayaran**

- **Virtual Account (Bank Transfer)**
  - BCA, BNI, Mandiri, BRI
  - Nomor VA Sandbox: `8808 1234 5678 9012`
- **E-Wallet**
  - GoPay, OVO, Dana, ShopeePay
  - Menggunakan QR Code simulasi
- **Kartu Kredit/Debit**
  - Visa, Mastercard, JCB
  - Test Card: `4111 1111 1111 1111`
  - Expired: `12/25`
  - CVV: `123`

### 2. **User Flow**

1. User melakukan booking tiket
2. Booking dibuat dengan status `pending` dan payment status `unpaid`
3. User diarahkan ke halaman dashboard
4. User klik tombol "Bayar Sekarang" pada booking card
5. User memilih metode pembayaran
6. Sistem menampilkan instruksi pembayaran
7. User klik "Bayar Sekarang"
8. Sistem mensimulasikan proses pembayaran (1 detik delay)
9. Payment status berubah menjadi `paid`
10. Booking status otomatis berubah menjadi `success`
11. Kursi tiket otomatis terkurangi

### 3. **Admin Dashboard**

- Melihat semua booking dengan status pembayaran
- Kolom "Pembayaran" menampilkan:
  - Status: Lunas (hijau) / Belum Bayar (kuning)
  - Metode pembayaran yang digunakan
- Admin dapat mengubah status booking secara manual jika diperlukan

### 4. **Database Schema Update**

Tabel `booking` ditambahkan field baru:

```sql
- payment_status VARCHAR(20) DEFAULT 'unpaid'  -- unpaid, paid, expired
- payment_method VARCHAR(50)                    -- bank_transfer, e_wallet, credit_card
- payment_proof VARCHAR(255)                    -- untuk bukti transfer (opsional)
```

## Setup & Installation

### 1. Update Database Schema

Jalankan script untuk menambahkan field payment:

```bash
update-booking-payment.bat
```

Atau manual via MySQL:

```bash
mysql -u root flybook_db < src/main/resources/alter_booking_payment.sql
```

### 2. Model Updates

- `Booking.java` - Ditambahkan getter/setter untuk payment fields
- `BookingRepository.java` - Ditambahkan method `updatePaymentStatus()`
- `BookingService.java` - Ditambahkan method `processPayment()`

### 3. Controller Updates

- `DashboardController.java` - Ditambahkan endpoints:
  - `GET /dashboard/payment/{id}` - Halaman pembayaran
  - `POST /dashboard/payment/{id}/process` - Proses pembayaran

### 4. View Updates

- `payment.jsp` - Halaman pembayaran dengan UI modern
- `dashboard-user.jsp` - Tombol "Bayar Sekarang" untuk booking unpaid
- `dashboard-admin.jsp` - Kolom payment status di tabel booking

## Payment Flow

### Sandbox Mode

Dalam mode sandbox, **semua pembayaran akan berhasil** untuk tujuan testing:

- Tidak ada validasi kartu kredit real
- Tidak ada koneksi ke payment gateway real
- Proses payment disimulasikan dengan delay 1 detik
- Status langsung berubah menjadi `paid` dan `success`

### Production Ready

Untuk production, ganti method `processPayment()` dengan integrasi real:

- Midtrans
- Xendit
- Doku
- atau Payment Gateway lainnya

## UI/UX Features

### Payment Page

- **Modern Design**: Card-based layout dengan icons
- **Responsive**: Mobile-friendly design
- **Interactive**: Highlight saat metode dipilih
- **Instruksi Jelas**: Step-by-step payment instructions
- **Loading State**: Spinner saat processing
- **Order Summary**: Sticky sidebar dengan detail booking

### Dashboard Updates

- **Payment Badge**: Indikator visual status pembayaran
- **Action Button**:
  - Hijau "Bayar Sekarang" untuk unpaid
  - Hijau dengan checkmark untuk paid
- **Success Notification**: Alert animasi saat payment berhasil

### Admin View

- **Payment Column**: Status & method dalam satu kolom
- **Color Coding**:
  - Hijau (Lunas) untuk paid
  - Kuning (Belum Bayar) untuk unpaid
- **Payment Method**: Tampil di bawah status jika sudah dibayar

## Security Notes

### Sandbox Mode (Current)

- ⚠️ Tidak ada validasi payment real
- ⚠️ Semua transaksi auto-success
- ✅ Aman untuk development & testing
- ✅ Tidak perlu API keys

### Production Considerations

Saat deploy ke production:

1. Integrasikan dengan Payment Gateway real
2. Tambahkan validasi & verification
3. Implementasikan webhook untuk callback
4. Simpan payment proof/receipt
5. Tambahkan payment timeout/expiry
6. Implementasikan refund mechanism

## Testing Scenarios

### Test Case 1: Successful Payment

1. Create booking
2. Click "Bayar Sekarang"
3. Select payment method
4. Click "Bayar Sekarang"
5. Verify: Status = success, Payment = paid

### Test Case 2: Payment dari Dashboard

1. Login sebagai user
2. Lihat booking dengan status pending
3. Tombol "Bayar Sekarang" muncul
4. Klik tombol tersebut
5. Redirect ke payment page

### Test Case 3: Admin View

1. Login sebagai admin
2. Buka dashboard admin
3. Lihat kolom "Pembayaran"
4. Verify: Payment status terlihat jelas

## File Changes Summary

### Created Files

- `src/main/webapp/WEB-INF/views/payment.jsp`
- `src/main/resources/alter_booking_payment.sql`
- `update-booking-payment.bat`
- `FITUR_PAYMENT.md` (this file)

### Modified Files

- `src/main/java/com/flybook/pbo/model/Booking.java`
- `src/main/java/com/flybook/pbo/repository/BookingRepository.java`
- `src/main/java/com/flybook/pbo/service/BookingService.java`
- `src/main/java/com/flybook/pbo/controller/DashboardController.java`
- `src/main/webapp/WEB-INF/views/dashboard-user.jsp`
- `src/main/webapp/WEB-INF/views/dashboard-admin.jsp`

## Next Steps

1. ✅ Update database schema dengan menjalankan `update-booking-payment.bat`
2. ✅ Restart aplikasi Spring Boot
3. ✅ Test payment flow dari user dashboard
4. ✅ Verify admin dapat melihat payment status
5. 🔄 (Future) Integrate dengan Payment Gateway real untuk production

## Support

Untuk production deployment dengan Payment Gateway real, pertimbangkan:

- **Midtrans**: https://midtrans.com/
- **Xendit**: https://www.xendit.co/
- **Doku**: https://www.doku.com/

---

_Payment Gateway Sandbox Mode - For Development & Testing Only_
