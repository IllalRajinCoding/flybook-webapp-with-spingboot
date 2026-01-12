# FlyBook - Sistem Booking Tiket Pesawat

Aplikasi web berbasis Spring Boot untuk pemesanan tiket pesawat dengan fitur manajemen admin dan user dashboard yang modern dan responsif.

## Fitur Utama

### Fitur User

| Fitur              | Deskripsi                                          |
| ------------------ | -------------------------------------------------- |
| Registrasi         | Daftar akun baru dengan nama, email, dan password  |
| Login              | Masuk ke akun dengan email dan password            |
| Dashboard User     | Melihat semua booking dan status pesanan           |
| Cari Penerbangan   | Filter berdasarkan kota asal, tujuan, dan tanggal  |
| Booking Tiket      | Pesan tiket dengan pilihan jumlah kursi            |
| Lihat Detail Tiket | Informasi lengkap penerbangan sebelum booking      |
| Edit Booking       | Ubah jumlah kursi pada pesanan (status pending)    |
| Batalkan Booking   | Batalkan pesanan yang masih pending                |
| Profil User        | Lihat dan edit informasi akun                      |
| Ubah Password      | Ganti password akun                                |
| Hapus Akun         | Hapus akun secara permanen                         |
| Riwayat Perjalanan | Lihat jumlah total penerbangan yang pernah dipesan |

### Fitur Admin

| Fitur                 | Deskripsi                                                  |
| --------------------- | ---------------------------------------------------------- |
| Dashboard Admin       | Overview statistik: total tiket, booking, user, pendapatan |
| Kelola Tiket          | Lihat daftar semua tiket penerbangan                       |
| Tambah Tiket          | Buat jadwal penerbangan baru                               |
| Edit Tiket            | Ubah informasi tiket (maskapai, jadwal, harga, kursi)      |
| Hapus Tiket           | Hapus tiket dari sistem                                    |
| Kelola Booking        | Lihat semua pesanan dari semua user                        |
| Update Status Booking | Ubah status: pending → confirmed → completed / cancelled   |
| Kelola User           | Lihat daftar semua user terdaftar                          |
| Profil Admin          | Lihat dan edit informasi akun admin                        |

### Fitur Umum

| Fitur              | Deskripsi                                                       |
| ------------------ | --------------------------------------------------------------- |
| Landing Page       | Homepage dengan hero, search, galeri destinasi, about, services |
| Galeri Destinasi   | Tampilan destinasi populer Indonesia                            |
| Responsive Design  | Tampilan optimal di desktop dan mobile                          |
| UI Modern          | DaisyUI + Tailwind CSS dengan tema cupcake                      |
| Notifikasi         | Alert success/error untuk setiap aksi                           |
| Session Management | Login session yang aman                                         |

---

## Persyaratan Sistem

### 1. Java Development Kit (JDK) 21+

- **Download:** [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) atau [OpenJDK Temurin](https://adoptium.net/)
- **Verifikasi instalasi:**
  ```bash
  java -version
  ```
  Output yang diharapkan: `openjdk version "21.x.x"` atau lebih tinggi

### 2. Apache Maven 3.8+ (Opsional)

- **Download:** [Maven](https://maven.apache.org/download.cgi)
- Project ini sudah include Maven Wrapper, jadi tidak wajib install Maven
- **Verifikasi instalasi:**
  ```bash
  mvn -version
  ```

### 3. PostgreSQL 14+

- **Download:** [PostgreSQL](https://www.postgresql.org/download/)
- **Verifikasi instalasi:**
  ```bash
  psql --version
  pg_isready -h localhost -p 5432
  ```

### 4. Git (untuk clone repository)

- **Download:** [Git](https://git-scm.com/downloads)

---

## Instalasi & Menjalankan Aplikasi

### Langkah 1: Clone Repository

```bash
git clone https://github.com/user/flybook.git
cd flybook
```

### Langkah 2: Setup Database PostgreSQL

#### Opsi A: Menggunakan pgAdmin

1. Buka pgAdmin
2. Klik kanan pada "Databases" → Create → Database
3. Masukkan nama: `flybook`
4. Klik Save

#### Opsi B: Menggunakan Command Line

```bash
# Login ke PostgreSQL
psql -U postgres

# Buat database
CREATE DATABASE flybook;

# Keluar
\q
```

#### Opsi C: Menggunakan Script (Windows)

```bash
# Jalankan script setup database
setup-database.bat
```

### Langkah 3: Konfigurasi Database

Edit file `src/main/resources/application.yaml`:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/flybook
    username: postgres # Sesuaikan dengan username PostgreSQL Anda
    password: your_password # Sesuaikan dengan password PostgreSQL Anda
```

### Langkah 4: Build & Jalankan Aplikasi

#### Windows:

```bash
# Build project
.\mvnw.cmd clean install -DskipTests

# Jalankan aplikasi
.\mvnw.cmd spring-boot:run
```

#### Linux/MacOS:

```bash
# Berikan permission
chmod +x mvnw

# Build project
./mvnw clean install -DskipTests

# Jalankan aplikasi
./mvnw spring-boot:run
```

### Langkah 5: Akses Aplikasi

Buka browser dan akses:

```
http://localhost:8080
```

---

## Akun Default

### Admin Account

| Field    | Value               |
| -------- | ------------------- |
| Email    | `admin@flybook.com` |
| Password | `admin123`          |

> **Note:** Jalankan `reset-admin.bat` jika akun admin perlu direset

### Membuat Akun User

1. Buka `http://localhost:8080/register`
2. Isi form registrasi
3. Login dengan akun yang sudah dibuat

---

## Struktur Project

```
flybook/
├── src/
│   ├── main/
│   │   ├── java/com/flybook/pbo/
│   │   │   ├── controller/     # HTTP Request Handlers
│   │   │   ├── model/          # Entity Classes
│   │   │   ├── repository/     # Database Access Layer
│   │   │   ├── service/        # Business Logic
│   │   │   └── database/       # Database Configuration
│   │   ├── resources/
│   │   │   ├── application.yaml    # App Configuration
│   │   │   └── *.sql               # SQL Scripts
│   │   └── webapp/WEB-INF/views/   # JSP Templates
│   └── test/                   # Unit Tests
├── deploy/                     # Deployment Scripts
├── .github/workflows/          # CI/CD Configuration
├── pom.xml                     # Maven Dependencies
└── README.md
```

---

## Tech Stack

| Kategori   | Teknologi                  |
| ---------- | -------------------------- |
| Backend    | Spring Boot 3.x, Java 21   |
| Frontend   | JSP, Tailwind CSS, DaisyUI |
| Database   | PostgreSQL                 |
| Build Tool | Maven                      |
| Icons      | Font Awesome 6             |
| Font       | Plus Jakarta Sans          |

---

## Script Bantuan

| Script                   | Fungsi                        |
| ------------------------ | ----------------------------- |
| `setup-database.bat`     | Membuat database dan tabel    |
| `reset-admin.bat`        | Reset akun admin ke default   |
| `insert-sample-data.bat` | Menambahkan data tiket contoh |

---

## Troubleshooting

### Error: Database connection failed

```
Pastikan PostgreSQL sudah running:
pg_isready -h localhost -p 5432

Cek username dan password di application.yaml
```

### Error: Port 8080 already in use

```bash
# Windows - cari proses yang menggunakan port 8080
netstat -ano | findstr :8080

# Kill proses
taskkill /PID <PID_NUMBER> /F
```

### Error: Java version tidak sesuai

```bash
# Cek versi Java
java -version

# Pastikan JAVA_HOME mengarah ke JDK 21+
echo %JAVA_HOME%
```

### Error: Maven build failed

```bash
# Clean dan rebuild
.\mvnw.cmd clean install -DskipTests -U
```

---

