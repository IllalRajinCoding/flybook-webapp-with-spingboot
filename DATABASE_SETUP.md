# Setup Database Tiket Pesawat - FlyBook

## Langkah-langkah Setup Database PostgreSQL

### 1. Pastikan PostgreSQL sudah terinstall dan berjalan

### 2. Buat Database

```sql
CREATE DATABASE flybook;
```

### 3. Jalankan Script SQL

Jalankan file `tiket_schema.sql` yang ada di folder `src/main/resources/`:

```bash
# Melalui Command Line (Windows)
psql -U postgres -d flybook -f src/main/resources/tiket_schema.sql

# Atau melalui pgAdmin / DBeaver:
# - Buka connection ke database flybook
# - Jalankan query dari file tiket_schema.sql
```

### 4. Verifikasi Tabel Sudah Dibuat

```sql
-- Cek tabel
SELECT * FROM tiket;

-- Cek struktur tabel
\d tiket
```

## Struktur Tabel Tiket

| Kolom             | Tipe Data     | Keterangan                    |
| ----------------- | ------------- | ----------------------------- |
| id                | SERIAL        | Primary Key                   |
| nomor_tiket       | VARCHAR(50)   | Nomor tiket unik              |
| penerbangan       | VARCHAR(100)  | Nama penerbangan              |
| maskapai          | VARCHAR(100)  | Nama maskapai                 |
| bandara_asal      | VARCHAR(100)  | Bandara keberangkatan         |
| bandara_tujuan    | VARCHAR(100)  | Bandara tujuan                |
| tanggal_berangkat | DATE          | Tanggal keberangkatan         |
| jam_berangkat     | VARCHAR(10)   | Jam keberangkatan             |
| jam_tiba          | VARCHAR(10)   | Jam kedatangan                |
| harga             | DECIMAL(10,2) | Harga tiket                   |
| kursi_tersedia    | INT           | Jumlah kursi tersedia         |
| kursi_terjual     | INT           | Jumlah kursi terjual          |
| status            | VARCHAR(20)   | Status (aktif/nonaktif/penuh) |
| user_id           | INT           | ID user yang menambahkan      |
| created_at        | TIMESTAMP     | Waktu pembuatan               |
| updated_at        | TIMESTAMP     | Waktu update terakhir         |

## Struktur Aplikasi

### Model

- `Tiket.java` - Entity class untuk tiket

### Repository

- `TiketRepository.java` - Database operations (CRUD)

### Service

- `TiketService.java` - Business logic layer

### Controller

- `DashboardController.java` - Handler untuk request HTTP

### Views (JSP)

- `dashboard-admin.jsp` - Dashboard admin dengan tabel CRUD tiket
- `dashboard-user.jsp` - Dashboard user dengan daftar tiket tersedia
- `tiket-create.jsp` - Form tambah tiket baru
- `tiket-edit.jsp` - Form edit tiket
- `tiket-detail.jsp` - Detail tiket untuk booking

## Fitur CRUD

### Admin

1. **Create** - Tambah tiket baru via `/dashboard/admin/tiket/create`
2. **Read** - Lihat semua tiket di dashboard admin
3. **Update** - Edit tiket via `/dashboard/admin/tiket/{id}/edit`
4. **Delete** - Hapus tiket via `/dashboard/admin/tiket/{id}/delete`

### User

1. **Read** - Lihat tiket tersedia di dashboard user
2. **Book** - Pesan tiket via `/dashboard/user/tiket/{id}/book`
3. **Detail** - Lihat detail tiket via `/dashboard/tiket/{id}`

## Cara Menjalankan Aplikasi

### 1. Kompilasi dengan Maven

```bash
mvn clean package
```

### 2. Jalankan Aplikasi

```bash
mvn spring-boot:run
```

### 3. Akses Aplikasi

- Dashboard Admin: http://localhost:8080/dashboard/admin
- Dashboard User: http://localhost:8080/dashboard/user

## Konfigurasi Database

File konfigurasi database ada di `DatabaseConfig.java`:

```java
private static final String URL = "jdbc:postgresql://localhost:5432/flybook";
private static final String USERNAME = "postgres";
private static final String PASSWORD = "Root";
```

Sesuaikan kredensial database jika berbeda.

## Sample Data

Script SQL sudah termasuk 3 sample data tiket:

1. Garuda Indonesia: Jakarta → Bali
2. Batik Air: Jakarta → Surabaya
3. Sriwijaya Air: Medan → Jakarta

## Troubleshooting

### Error: Connection refused

- Pastikan PostgreSQL service berjalan
- Cek port PostgreSQL (default: 5432)

### Error: Database does not exist

- Buat database `flybook` terlebih dahulu

### Error: Authentication failed

- Cek username dan password PostgreSQL
- Update credentials di `DatabaseConfig.java`

### Error: Table already exists

- Tabel sudah ada, skip CREATE TABLE atau jalankan DROP TABLE terlebih dahulu

## Notes

- Pastikan PostgreSQL JDBC driver sudah ada di `pom.xml` (sudah include)
- Gunakan endpoint `/dashboard/admin` untuk manajemen tiket (admin)
- Gunakan endpoint `/dashboard/user` untuk melihat dan booking tiket (user)
