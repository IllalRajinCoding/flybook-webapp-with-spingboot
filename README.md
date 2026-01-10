# 🛫 FlyBook - Sistem Booking Tiket Pesawat

Aplikasi web berbasis Spring Boot untuk pemesanan tiket pesawat dengan fitur manajemen admin dan user dashboard yang modern dan responsif.

##  Daftar Isi

- [Persyaratan Sistem](#-persyaratan-sistem)
- [Fitur Utama](#-fitur-utama)
- [Teknologi yang Digunakan](#-teknologi-yang-digunakan)
- [Struktur Proyek](#-struktur-proyek)
- [Langkah-langkah Instalasi](#-langkah-langkah-instalasi)
- [Menjalankan Aplikasi](#-menjalankan-aplikasi)
- [Login Akun Default](#-login-akun-default)
- [Dokumentasi File](#-dokumentasi-file)
- [Troubleshooting](#-troubleshooting)

---

##  Fitur Utama

### User Features

- ✅ Registrasi & Login User
- ✅ Dashboard User dengan daftar booking
- ✅ Browse tiket pesawat yang tersedia
- ✅ Booking tiket dengan pemilihan jumlah kursi
- ✅ Lihat detail tiket lengkap
- ✅ Notifikasi success saat booking berhasil
- ✅ Search & Filter tiket
- ✅ Responsive design (mobile-friendly)

### Admin Features

- ✅ Dashboard Admin dengan statistik
- ✅ CRUD Tiket (Create, Read, Update, Delete)
- ✅ Manajemen Booking (update status, delete)
- ✅ Lihat semua user dan bookings
- ✅ Search & Filter data
- ✅ Update status booking (pending, success, failed)

### UI/UX Features

- ✅ Modern minimalist design
- ✅ Clean landing page dengan hero section
- ✅ FontAwesome icons
- ✅ Tailwind CSS styling
- ✅ Smooth animations & transitions
- ✅ Success notifications dengan auto-hide
- ✅ Interactive cards & hover effects

---

## 🔧 Persyaratan Sistem

### 1. **Java Development Kit (JDK) 21+**

- Download: [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) atau [OpenJDK](https://adoptium.net/)
- Verifikasi: `java -version`

### 2. **Apache Maven 3.8+**

- Download: [Maven](https://maven.apache.org/download.cgi)
- Atau gunakan Maven wrapper (`mvnw.cmd`)
- Verifikasi: `mvn -version`

### 3. **MySQL 8.0+**

- Download: [MySQL](https://dev.mysql.com/downloads/)
- Default: username `root`, password kosong
- Port: 3306

### 4. **Git** (opsional)

- Download: [Git](https://git-scm.com/downloads)

---

## 🎯 Teknologi yang Digunakan

### Backend

- **Spring Boot 4.0.0** - Framework utama
- **Spring Web MVC** - Web framework
- **Spring Data** - Database access
- **JSP & JSTL** - View templating
- **MySQL Connector** - Database driver

### Frontend

- **Tailwind CSS** - Utility-first CSS framework
- **FontAwesome 6.4.0** - Icon library
- **JavaScript** - Interactive features

### Database

- **MySQL 8.0** - Relational database
- **JDBC** - Database connectivity

### Build Tools

- **Maven** - Dependency management
- **Tomcat Embedded** - Web server

---

## 📁 Struktur Proyek

```
pbo/
├── src/
│   ├── main/
│   │   ├── java/com/flybook/pbo/
│   │   │   ├── controller/           # HTTP Controllers
│   │   │   │   ├── AuthController.java          # Login, Register, Logout
│   │   │   │   ├── DashboardController.java     # User & Admin Dashboard
│   │   │   │   ├── DatabaseTestController.java  # Test Database Connection
│   │   │   │   └── HomeController.java          # Landing Page
│   │   │   │
│   │   │   ├── database/            # Database Configuration
│   │   │   │   └── DatabaseConfig.java          # Connection Pool & Setup
│   │   │   │
│   │   │   ├── model/               # Entity/Model Classes
│   │   │   │   ├── Booking.java                 # Booking entity
│   │   │   │   ├── Tiket.java                   # Tiket entity
│   │   │   │   └── User.java                    # User entity
│   │   │   │
│   │   │   ├── repository/          # Data Access Layer
│   │   │   │   ├── BookingRepository.java       # Booking CRUD operations
│   │   │   │   ├── TiketRepository.java         # Tiket CRUD operations
│   │   │   │   └── UserRepository.java          # User CRUD operations
│   │   │   │
│   │   │   ├── service/             # Business Logic Layer
│   │   │   │   ├── BookingService.java          # Booking logic
│   │   │   │   ├── TiketService.java            # Tiket logic
│   │   │   │   └── UserService.java             # User authentication logic
│   │   │   │
│   │   │   ├── PboApplication.java  # Main Spring Boot Application
│   │   │   └── ServletInitializer.java          # WAR deployment config
│   │   │
│   │   ├── resources/
│   │   │   ├── application.yaml                 # App configuration
│   │   │   ├── users_schema.sql                 # User table schema
│   │   │   ├── tiket_schema.sql                 # Tiket table schema
│   │   │   ├── booking_schema.sql               # Booking table schema
│   │   │   ├── sample_tiket_data.sql            # Sample data
│   │   │   ├── reset-admin.sql                  # Reset admin password
│   │   │   └── static/                          # Static resources
│   │   │
│   │   └── webapp/WEB-INF/views/    # JSP Views
│   │       ├── index.jsp                        # Landing page
│   │       ├── login.jsp                        # Login page
│   │       ├── register.jsp                     # Register page
│   │       ├── dashboard-user.jsp               # User dashboard
│   │       ├── dashboard-admin.jsp              # Admin dashboard
│   │       ├── tiket-detail.jsp                 # Tiket detail page
│   │       ├── tiket-create.jsp                 # Create tiket form
│   │       ├── tiket-edit.jsp                   # Edit tiket form
│   │       └── test-db.jsp                      # Database test page
│   │
│   └── test/                        # Unit tests
│
├── target/                          # Compiled classes (generated)
├── pom.xml                          # Maven dependencies
├── mvnw, mvnw.cmd                   # Maven wrapper
├── setup-database.bat               # Auto setup database
├── insert-sample-data.bat           # Insert sample tiket data
├── reset-admin.bat                  # Reset admin password
├── README.md                        # This file
├── DATABASE_SETUP.md                # Database setup guide
├── FITUR_BOOKING.md                 # Booking feature docs
├── HELP.md                          # Spring Boot help
└── UPDATE_LOG.md                    # Update changelog
```

---

##  Langkah-langkah Instalasi

### **Step 1: Clone/Download Project**

```bash
git clone <repository-url>
cd pbo
```

### **Step 2: Setup Database MySQL**

#### A. Buat Database

```sql
CREATE DATABASE flybook_db;
```

#### B. Jalankan Script Setup (Otomatis)

**Windows:**

```bash
setup-database.bat
```

**Manual:**

```bash
mysql -u root flybook_db < src/main/resources/users_schema.sql
mysql -u root flybook_db < src/main/resources/tiket_schema.sql
mysql -u root flybook_db < src/main/resources/booking_schema.sql
```

#### C. Insert Sample Data (Optional)

```bash
insert-sample-data.bat
```

### **Step 3: Configure Database Connection**

Edit `src/main/resources/application.yaml`:

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/flybook_db
    username: root
    password: your_password # Sesuaikan dengan password MySQL Anda
```

### **Step 4: Build Project**

```bash
./mvnw clean install
```

---

##  Menjalankan Aplikasi

### **Cara 1: Menggunakan Maven**

```bash
./mvnw spring-boot:run
```

### **Cara 2: Menggunakan Java**

```bash
java -jar target/pbo-0.0.1-SNAPSHOT.war
```

### **Akses Aplikasi**

Buka browser dan akses:

```
http://localhost:8080
```

---

##  Login Akun Default

### Admin Account

- **Username:** `admin`
- **Password:** `admin123`
- **Role:** Administrator
- **Akses:** Full access ke semua fitur

### User Account (Testing)

Buat akun baru via halaman register atau gunakan:

- **Username:** `user`
- **Password:** `user123`
- **Role:** Regular user

### Reset Admin Password

Jika lupa password admin:

```bash
reset-admin.bat
```

Password akan direset ke: `admin123`

---

## Dokumentasi File

Berikut adalah penjelasan detail mengenai fungsi setiap file dalam proyek FlyBook:

---

### ** Controller Layer** (`src/main/java/com/flybook/pbo/controller/`)

Controller bertanggung jawab menangani HTTP request dan mengembalikan response (view).

#### **1. AuthController.java**

**Fungsi:** Menangani proses autentikasi (login & register)

**Endpoints:**

- `GET /login` - Menampilkan halaman login
- `POST /login` - Proses login user
- `GET /register` - Menampilkan halaman register
- `POST /register` - Proses pendaftaran user baru
- `GET /logout` - Logout dan hapus session

**Method Penting:**

- `login()` - Validasi username/password, buat session jika berhasil
- `register()` - Validasi data, hash password, simpan user baru
- `logout()` - Invalidate session dan redirect ke home

---

#### **2. DashboardController.java**

**Fungsi:** Menangani semua fitur dashboard (user & admin)

**Endpoints User:**

- `GET /dashboard/user` - Dashboard user (lihat booking & tiket)
- `GET /dashboard/tiket/{id}` - Detail tiket
- `POST /dashboard/user/tiket/{id}/book` - Proses booking tiket

**Endpoints Admin:**

- `GET /dashboard/admin` - Dashboard admin (kelola tiket & booking)
- `GET /dashboard/admin/tiket/create` - Form tambah tiket
- `POST /dashboard/admin/tiket/create` - Simpan tiket baru
- `GET /dashboard/admin/tiket/{id}/edit` - Form edit tiket
- `POST /dashboard/admin/tiket/{id}/edit` - Update tiket
- `POST /dashboard/admin/tiket/{id}/delete` - Hapus tiket
- `POST /dashboard/admin/booking/{id}/status` - Update status booking

**Method Penting:**

- `userDashboard()` - Load data tiket & booking untuk user
- `adminDashboard()` - Load stats & data untuk admin
- `bookTiket()` - Validasi, hitung harga, simpan booking
- `updateBookingStatus()` - Terima/tolak booking (admin)

---

#### **3. HomeController.java**

**Fungsi:** Menangani halaman landing page

**Endpoints:**

- `GET /` atau `GET /index` - Tampilkan homepage dengan daftar tiket

**Method:**

- `home()` - Load semua tiket dari database dan kirim ke view

---

#### **4. DatabaseTestController.java**

**Fungsi:** Testing koneksi database (untuk debugging)

**Endpoints:**

- `GET /test-db` - Test koneksi ke MySQL

**Method:**

- `testDatabase()` - Coba koneksi dan tampilkan hasilnya di JSP

---

### ** Model Layer** (`src/main/java/com/flybook/pbo/model/`)

Model merepresentasikan struktur data (entity) yang disimpan di database.

#### **1. User.java**

**Fungsi:** Model untuk data user (admin & customer)

**Atribut:**

- `id` (Long) - Primary key
- `username` (String) - Username unik
- `password` (String) - Password (hashed)
- `email` (String) - Email user
- `fullName` (String) - Nama lengkap
- `role` (String) - Role: "ADMIN" atau "USER"
- `createdAt` (Date) - Tanggal registrasi

**Method:**

- Getter/Setter untuk semua atribut
- `toString()` - Untuk debugging

---

#### **2. Tiket.java**

**Fungsi:** Model untuk data tiket penerbangan

**Atribut:**

- `id` (Long) - Primary key
- `maskapai` (String) - Nama maskapai
- `kotaAsal` (String) - Kota keberangkatan
- `kotaTujuan` (String) - Kota tujuan
- `tanggalBerangkat` (Date) - Tanggal & jam keberangkatan
- `tanggalSampai` (Date) - Tanggal & jam kedatangan
- `harga` (BigDecimal) - Harga per kursi
- `jumlahKursi` (Integer) - Total kursi tersedia
- `kursiTersedia` (Integer) - Kursi yang belum di-booking
- `fasilitas` (String) - Deskripsi fasilitas
- `createdAt` (Date) - Tanggal dibuat
- `updatedAt` (Date) - Tanggal terakhir diupdate

**Method:**

- Getter/Setter untuk semua atribut
- `toString()` - Untuk debugging

---

#### **3. Booking.java**

**Fungsi:** Model untuk data booking tiket oleh user

**Atribut:**

- `id` (Long) - Primary key
- `bookingCode` (String) - Kode booking unik (auto-generated)
- `tiketId` (Long) - Foreign key ke Tiket
- `userName` (String) - Username yang booking
- `jumlahKursi` (Integer) - Jumlah kursi yang di-booking
- `totalHarga` (BigDecimal) - Total harga (harga × jumlah kursi)
- `status` (String) - Status: "PENDING", "CONFIRMED", "CANCELLED"
- `tanggalBooking` (Date) - Tanggal booking dibuat
- `updatedAt` (Date) - Tanggal terakhir diupdate

**Method:**

- Getter/Setter untuk semua atribut
- `toString()` - Untuk debugging

---

### **🗄️ Repository Layer** (`src/main/java/com/flybook/pbo/repository/`)

Repository menghandle semua operasi database (CRUD).

#### **1. UserRepository.java**

**Fungsi:** Data access layer untuk tabel `users`

**Method:**

- `create(User user)` - Insert user baru
- `findByUsername(String username)` - Cari user by username
- `findByEmail(String email)` - Cari user by email
- `findAll()` - Ambil semua user
- `update(User user)` - Update data user
- `delete(Long id)` - Hapus user
- `mapResultSetToUser(ResultSet rs)` - Mapping ResultSet ke object User

**SQL Query:**

- `INSERT INTO users` - Untuk create
- `SELECT * FROM users WHERE username = ?` - Untuk findByUsername
- `UPDATE users SET ... WHERE id = ?` - Untuk update
- `DELETE FROM users WHERE id = ?` - Untuk delete

---

#### **2. TiketRepository.java**

**Fungsi:** Data access layer untuk tabel `tiket`

**Method:**

- `create(Tiket tiket)` - Insert tiket baru
- `findAll()` - Ambil semua tiket
- `findById(Long id)` - Cari tiket by ID
- `update(Tiket tiket)` - Update data tiket
- `delete(Long id)` - Hapus tiket
- `updateKursiTersedia(Long id, Integer kursiTersedia)` - Update kursi tersedia
- `mapResultSetToTiket(ResultSet rs)` - Mapping ResultSet ke object Tiket

**SQL Query:**

- `INSERT INTO tiket` - Untuk create
- `SELECT * FROM tiket` - Untuk findAll
- `SELECT * FROM tiket WHERE id = ?` - Untuk findById
- `UPDATE tiket SET kursi_tersedia = ? WHERE id = ?` - Untuk updateKursiTersedia

---

#### **3. BookingRepository.java**

**Fungsi:** Data access layer untuk tabel `booking`

**Method:**

- `create(Booking booking)` - Insert booking baru
- `getAll()` - Ambil semua booking
- `getByUserName(String userName)` - Ambil booking by username
- `getById(Long id)` - Ambil booking by ID
- `updateStatus(Long id, String status)` - Update status booking
- `delete(Long id)` - Hapus booking
- `mapResultSetToBooking(ResultSet rs)` - Mapping ResultSet ke object Booking

**SQL Query:**

- `INSERT INTO booking` - Untuk create
- `SELECT * FROM booking` - Untuk getAll
- `SELECT * FROM booking WHERE user_name = ?` - Untuk getByUserName
- `UPDATE booking SET status = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?` - Untuk updateStatus

---

### **⚙️ Service Layer** (`src/main/java/com/flybook/pbo/service/`)

Service berisi business logic dan koordinasi antar repository.

#### **1. UserService.java**

**Fungsi:** Business logic untuk operasi user

**Method:**

- `registerUser(User user)` - Validasi & simpan user baru
- `loginUser(String username, String password)` - Autentikasi user
- `findByUsername(String username)` - Cari user by username
- `findByEmail(String email)` - Cari user by email
- `getAllUsers()` - Ambil semua user

**Business Logic:**

- Validasi username unik saat register
- Validasi password saat login
- Hash password sebelum disimpan (implementasi bisa ditambahkan)

---

#### **2. TiketService.java**

**Fungsi:** Business logic untuk operasi tiket

**Method:**

- `createTiket(Tiket tiket)` - Validasi & simpan tiket baru
- `getAllTiket()` - Ambil semua tiket
- `getTiketById(Long id)` - Ambil tiket by ID
- `updateTiket(Tiket tiket)` - Update data tiket
- `deleteTiket(Long id)` - Hapus tiket
- `updateKursiTersedia(Long id, Integer kursiTersedia)` - Update kursi tersedia

**Business Logic:**

- Validasi harga harus > 0
- Validasi jumlah kursi harus > 0
- Set `updatedAt` saat update

---

#### **3. BookingService.java**

**Fungsi:** Business logic untuk operasi booking

**Method:**

- `createBooking(Booking booking)` - Validasi & simpan booking baru
- `getAllBookings()` - Ambil semua booking
- `getBookingsByUser(String userName)` - Ambil booking by user
- `getBookingById(Long id)` - Ambil booking by ID
- `updateBookingStatus(Long id, String status)` - Update status booking
- `deleteBooking(Long id)` - Hapus booking
- `generateBookingCode()` - Generate kode booking unik
- `countByStatus(String userName, String status)` - Hitung booking by status

**Business Logic:**

- Auto-generate booking code (format: BK-xxxxx)
- Validasi kursi tersedia sebelum booking
- Update kursi tersedia di tiket saat booking dibuat
- Restore kursi tersedia saat booking dibatalkan

---

### **🗃️ Database Configuration** (`src/main/java/com/flybook/pbo/database/`)

#### **DatabaseConfig.java**

**Fungsi:** Konfigurasi koneksi database MySQL

**Method:**

- `getConnection()` - Buat koneksi baru ke database
- `closeConnection(Connection conn)` - Tutup koneksi
- `closeStatement(Statement stmt)` - Tutup statement
- `closeResultSet(ResultSet rs)` - Tutup result set

**Konfigurasi:**

- URL: `jdbc:mysql://localhost:3306/flybook_db`
- Driver: `com.mysql.cj.jdbc.Driver`
- Username/Password: Diambil dari `application.yaml`

**Design Pattern:** Singleton pattern untuk reuse connection

---

### **🎨 View Layer (JSP)** (`src/main/webapp/WEB-INF/views/`)

View menggunakan JSP + JSTL untuk rendering HTML.

#### **1. index.jsp**

**Fungsi:** Landing page aplikasi

**Fitur:**

- Hero section dengan tagline FlyBook
- Form pencarian tiket (Kota Asal, Kota Tujuan, Tanggal)
- Daftar tiket yang tersedia
- Section keunggulan (Harga Terbaik, Mudah & Cepat, Aman & Terpercaya)
- Footer dengan informasi kontak

**Dependencies:**

- Tailwind CSS untuk styling
- FontAwesome untuk icon
- JavaScript untuk search & filter

---

#### **2. login.jsp**

**Fungsi:** Halaman login

**Fitur:**

- Form login (username & password)
- Link ke halaman register
- Pesan error jika login gagal
- Gradient background design

**Form Action:** POST ke `/login`

---

#### **3. register.jsp**

**Fungsi:** Halaman registrasi user baru

**Fitur:**

- Form register (username, email, password, full name)
- Validasi input
- Link ke halaman login
- Pesan error jika registrasi gagal

**Form Action:** POST ke `/register`

---

#### **4. dashboard-user.jsp**

**Fungsi:** Dashboard untuk regular user

**Fitur:**

- Welcome message dengan nama user
- Tab "Pesanan Saya" - Daftar booking user dengan status
- Tab "Cari Tiket" - Daftar tiket tersedia
- Button "Lihat Detail" untuk setiap tiket
- Notifikasi sukses saat booking berhasil
- Logout button

**Data yang Ditampilkan:**

- `${bookings}` - List booking user
- `${tikets}` - List tiket tersedia
- `${user.fullName}` - Nama user
- `${successMessage}` - Pesan sukses booking

---

#### **5. dashboard-admin.jsp**

**Fungsi:** Dashboard untuk admin

**Fitur:**

- **Stats Cards:**
  - Total Tiket
  - Total Booking
  - Booking Pending
  - Booking Confirmed
- **Tab "Kelola Tiket":**
  - Tabel daftar tiket
  - Button Tambah, Edit, Hapus
- **Tab "Kelola Booking":**
  - Tabel daftar semua booking
  - Button Terima/Tolak booking
  - Filter by status

**Data yang Ditampilkan:**

- `${tikets}` - List semua tiket
- `${bookings}` - List semua booking
- `${totalTiket}` - Jumlah total tiket
- `${totalBooking}` - Jumlah total booking
- `${pendingBooking}` - Jumlah booking pending
- `${confirmedBooking}` - Jumlah booking confirmed

---

#### **6. tiket-detail.jsp**

**Fungsi:** Halaman detail tiket & form booking

**Fitur:**

- Detail lengkap tiket (maskapai, rute, jadwal, fasilitas)
- Sidebar booking dengan:
  - Input jumlah kursi
  - Kalkulasi harga otomatis
  - Button "Pesan Sekarang"
- Info kursi tersedia
- Gradient card design

**Data yang Ditampilkan:**

- `${tiket}` - Object tiket
- `${availableSeats}` - Jumlah kursi tersedia
- `${user.username}` - Username (untuk validasi login)

**Form Action:** POST ke `/dashboard/user/tiket/${tiket.id}/book`

---

#### **7. tiket-create.jsp**

**Fungsi:** Form tambah tiket baru (Admin only)

**Fitur:**

- Form input semua data tiket
- Validasi input
- Button simpan & cancel
- Kembali ke dashboard admin

**Form Action:** POST ke `/dashboard/admin/tiket/create`

---

#### **8. tiket-edit.jsp**

**Fungsi:** Form edit tiket (Admin only)

**Fitur:**

- Form edit pre-filled dengan data tiket
- Validasi input
- Button update & cancel
- Kembali ke dashboard admin

**Data:** `${tiket}` - Object tiket yang akan diedit

**Form Action:** POST ke `/dashboard/admin/tiket/${tiket.id}/edit`

---

#### **9. test-db.jsp**

**Fungsi:** Halaman test koneksi database

**Fitur:**

- Menampilkan status koneksi
- Menampilkan pesan error (jika ada)
- Untuk debugging

**Data:** `${message}` - Pesan hasil test koneksi

---

### **📊 SQL Schema Files** (`src/main/resources/`)

#### **1. users_schema.sql**

**Fungsi:** Schema tabel `users`

**Struktur Tabel:**

```sql
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(20) DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Indexes:** UNIQUE pada username & email

**Initial Data:** Admin & user default

---

#### **2. tiket_schema.sql**

**Fungsi:** Schema tabel `tiket`

**Struktur Tabel:**

```sql
CREATE TABLE tiket (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    maskapai VARCHAR(50) NOT NULL,
    kota_asal VARCHAR(50) NOT NULL,
    kota_tujuan VARCHAR(50) NOT NULL,
    tanggal_berangkat DATETIME NOT NULL,
    tanggal_sampai DATETIME NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    jumlah_kursi INT NOT NULL,
    kursi_tersedia INT NOT NULL,
    fasilitas TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

**Indexes:** Index pada kota_asal, kota_tujuan, tanggal_berangkat

---

#### **3. booking_schema.sql**

**Fungsi:** Schema tabel `booking`

**Struktur Tabel:**

```sql
CREATE TABLE booking (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    booking_code VARCHAR(20) UNIQUE NOT NULL,
    tiket_id BIGINT NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    jumlah_kursi INT NOT NULL,
    total_harga DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING',
    tanggal_booking TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tiket_id) REFERENCES tiket(id) ON DELETE CASCADE
);
```

**Foreign Key:** tiket_id → tiket(id) dengan ON DELETE CASCADE

**Indexes:** Index pada user_name, tiket_id, status

---

#### **4. sample_tiket_data.sql**

**Fungsi:** Data sample tiket untuk testing

**Isi:** 10+ tiket sample dengan berbagai rute:

- Jakarta → Bali, Surabaya, Medan, Makassar
- Surabaya → Jakarta
- Bali → Jakarta
- Dll.

**Maskapai:** Garuda Indonesia, Lion Air, Citilink, AirAsia

**Harga Range:** Rp 500.000 - Rp 2.500.000

---

#### **5. reset-admin.sql**

**Fungsi:** SQL untuk reset password admin

**Query:**

```sql
UPDATE users
SET password = 'admin123'
WHERE username = 'admin';
```

**Digunakan oleh:** `reset-admin.bat`

---

### **🛠️ Batch Files (Windows)**

#### **1. setup-database.bat**

**Fungsi:** Setup database secara otomatis

**Proses:**

1. Connect ke MySQL
2. Create database `flybook_db`
3. Execute `users_schema.sql`
4. Execute `tiket_schema.sql`
5. Execute `booking_schema.sql`

**Command:**

```batch
mysql -u root -p < src/main/resources/users_schema.sql
```

**Output:** "Database setup completed successfully!"

---

#### **2. insert-sample-data.bat**

**Fungsi:** Insert data sample tiket

**Proses:**

1. Connect ke MySQL
2. Execute `sample_tiket_data.sql`

**Command:**

```batch
mysql -u root -p flybook_db < src/main/resources/sample_tiket_data.sql
```

---

#### **3. reset-admin.bat**

**Fungsi:** Reset password admin ke default

**Proses:**

1. Connect ke MySQL
2. Execute `reset-admin.sql`

**Password Baru:** `admin123`

---

### **⚙️ Configuration Files**

#### **application.yaml** (`src/main/resources/`)

**Fungsi:** Konfigurasi aplikasi Spring Boot

**Konfigurasi:**

```yaml
spring:
  application:
    name: pbo
  mvc:
    view:
      prefix: /WEB-INF/views/
      suffix: .jsp
  datasource:
    url: jdbc:mysql://localhost:3306/flybook_db
    username: root
    password: your_password
    driver-class-name: com.mysql.cj.jdbc.Driver
```

**Setting Penting:**

- View prefix/suffix untuk JSP
- Database connection string
- MySQL driver

---

#### **pom.xml**

**Fungsi:** Maven project configuration

**Dependencies:**

- Spring Boot Starter Web (4.0.0)
- Spring Boot Starter Tomcat
- Tomcat Embed Jasper (untuk JSP)
- JSTL (untuk taglib)
- MySQL Connector Java (8.0.33)
- Spring Boot Starter Test

**Packaging:** WAR (Web Application Archive)

**Java Version:** 21

---

### **📝 Markdown Documentation Files**

#### **1. README.md**

**Fungsi:** Dokumentasi utama proyek (file ini)

**Isi:** Instalasi, fitur, teknologi, struktur, troubleshooting

---

#### **2. DATABASE_SETUP.md**

**Fungsi:** Panduan setup database detail

**Isi:**

- Cara install MySQL
- Cara membuat database
- Cara run schema files
- Troubleshooting database

---

#### **3. FITUR_BOOKING.md**

**Fungsi:** Dokumentasi fitur booking

**Isi:**

- Alur booking tiket
- Validasi booking
- Status booking
- Business rules

---

#### **4. UPDATE_LOG.md**

**Fungsi:** Log perubahan & update proyek

**Isi:** Changelog versi, bug fixes, new features

---

#### **5. HELP.md**

**Fungsi:** Bantuan quick start & FAQ

**Isi:** Getting started, common issues, links

---

## 🐛 Troubleshooting

### **Problem 1: Port 8080 Sudah Digunakan**

**Error**: `Port 8080 is already in use`

**Solusi:**

```yaml
# Tambahkan di application.yaml
server:
  port: 8081 # Ganti ke port lain
```

Atau matikan aplikasi lain yang menggunakan port 8080:

```bash
# Windows - Cari process di port 8080
netstat -ano | findstr :8080

# Matikan process (ganti PID dengan angka dari command di atas)
taskkill /PID <PID> /F
```

---

### **Problem 2: Database Connection Failed**

**Error**: `Connection refused` atau `Communications link failure`

**Checklist:**

✅ **MySQL service sudah running?**

```bash
# Windows: Cek di Services (Win+R → services.msc)
# Cari "MySQL80"
# Atau via command:
net start MySQL80
```

✅ **Username dan password di application.yaml sudah benar?**

```yaml
# Periksa di src/main/resources/application.yaml
spring:
  datasource:
    username: root # Sesuaikan
    password: yourpass # Sesuaikan
```

✅ **Database `flybook_db` sudah dibuat?**

```bash
# Login MySQL dan cek
mysql -u root -p
SHOW DATABASES;
```

✅ **Firewall tidak memblokir port 3306?**

---

### **Problem 3: Tabel Tidak Ditemukan**

**Error**: `Table 'flybook_db.users' doesn't exist`

**Solusi:**

```bash
# Jalankan ulang setup database
setup-database.bat

# Atau manual:
mysql -u root -p flybook_db < src/main/resources/users_schema.sql
mysql -u root -p flybook_db < src/main/resources/tiket_schema.sql
mysql -u root -p flybook_db < src/main/resources/booking_schema.sql
```

---

### **Problem 4: JSP Tidak Muncul / 404 Error**

**Error**: Halaman blank atau HTTP 404

**Checklist:**

✅ **Pastikan `tomcat-embed-jasper` ada di pom.xml**

```xml
<dependency>
    <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
</dependency>
```

✅ **Cek path view di application.yaml:**

```yaml
spring:
  mvc:
    view:
      prefix: /WEB-INF/views/
      suffix: .jsp
```

✅ **File JSP ada di folder yang benar:**

```
src/main/webapp/WEB-INF/views/
```

✅ **Restart aplikasi** setelah perubahan

---

### **Problem 5: Maven Build Gagal**

**Error**: `Failed to resolve dependencies` atau `Cannot resolve symbol`

**Solusi:**

```bash
# Clear Maven cache dan rebuild
mvnw clean
mvnw dependency:purge-local-repository
mvnw clean install
```

Atau hapus folder `.m2/repository` dan rebuild:

```bash
# Windows
rmdir /s %USERPROFILE%\.m2\repository
mvnw clean install
```

---

### **Problem 6: Login Gagal - Wrong Credentials**

**Penyebab:** Data admin belum ter-insert atau password salah

**Solusi:**

```bash
# Reset password admin
reset-admin.bat
```

Atau manual via MySQL:

```sql
mysql -u root -p
USE flybook_db;
UPDATE users SET password = 'admin123' WHERE username = 'admin';
```

---

### **Problem 7: Booking Gagal - Insufficient Seats**

**Error**: "Kursi tidak mencukupi"

**Penyebab:**

- Kursi tersedia habis
- Data booking tidak sinkron dengan kursi tersedia

**Solusi:**

```sql
# Cek dan reset kursi tersedia
mysql -u root -p flybook_db
SELECT id, maskapai, kursi_tersedia FROM tiket;

# Reset kursi tersedia jika perlu
UPDATE tiket SET kursi_tersedia = jumlah_kursi WHERE id = <id_tiket>;
```

---

### **Problem 8: CSS/Icons Tidak Muncul**

**Penyebab:** CDN Tailwind/FontAwesome terblokir

**Solusi:**

1. Periksa koneksi internet
2. Cek di browser console (F12) apakah ada error loading CSS
3. Pastikan CDN URL di JSP benar:

```html
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- FontAwesome -->
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
/>
```

---

### **Problem 9: "JSTL Core Tag" Error**

**Error**: `The absolute uri: http://java.sun.com/jsp/jstl/core cannot be resolved`

**Solusi:**

Pastikan JSTL dependency ada di pom.xml:

```xml
<dependency>
    <groupId>jakarta.servlet.jsp.jstl</groupId>
    <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
</dependency>
<dependency>
    <groupId>org.glassfish.web</groupId>
    <artifactId>jakarta.servlet.jsp.jstl</artifactId>
</dependency>
```

Rebuild:

```bash
mvnw clean install
```

---

### **Problem 10: Java Version Mismatch**

**Error**: `Unsupported class file major version 65`

**Penyebab:** Project butuh Java 21, tapi sistem pakai Java versi lain

**Solusi:**

```bash
# Cek Java version
java -version

# Seharusnya: openjdk version "21.x.x"
# Jika bukan, install Java 21 dari:
# https://adoptium.net/
```

Set JAVA_HOME:

```bash
# Windows
setx JAVA_HOME "C:\Program Files\Java\jdk-21"
setx PATH "%JAVA_HOME%\bin;%PATH%"
```

---

## 💡 Tips Debugging

### **Enable Debug Logging**

Tambahkan di `application.yaml`:

```yaml
logging:
  level:
    com.flybook.pbo: DEBUG
    org.springframework.web: DEBUG
```

### **Check Console Logs**

Perhatikan log di terminal saat aplikasi berjalan:

```
2024-01-15 10:30:45.123  INFO 12345 --- [main] c.f.pbo.PboApplication
: Starting PboApplication...
```

### **Test Database Connection**

Akses: `http://localhost:8080/test-db`

Akan menampilkan status koneksi database.

---

## 📞 Butuh Bantuan?

Jika masih ada masalah:

1. **Cek Log Error:** Baca error message di console dengan teliti
2. **Dokumentasi Detail:**
   - [DATABASE_SETUP.md](DATABASE_SETUP.md) - Setup database
   - [FITUR_BOOKING.md](FITUR_BOOKING.md) - Dokumentasi fitur
3. **Test Database:** Akses `/test-db` untuk cek koneksi
4. **Verify Setup:** Pastikan semua persyaratan sistem terpenuhi

---

## 🎯 Quick Reference

### **Default Credentials**

| Role  | Username | Password |
| ----- | -------- | -------- |
| Admin | admin    | admin123 |
| User  | user     | user123  |

### **Important URLs**

| Page            | URL                                   |
| --------------- | ------------------------------------- |
| Home            | http://localhost:8080                 |
| Login           | http://localhost:8080/login           |
| Register        | http://localhost:8080/register        |
| User Dashboard  | http://localhost:8080/dashboard/user  |
| Admin Dashboard | http://localhost:8080/dashboard/admin |
| Test Database   | http://localhost:8080/test-db         |

### **Database Commands**

```bash
# Setup database
setup-database.bat

# Insert sample data
insert-sample-data.bat

# Reset admin password
reset-admin.bat
```

### **Maven Commands**

```bash
# Clean build
mvnw clean install

# Run application
mvnw spring-boot:run

# Skip tests
mvnw clean install -DskipTests
```

---

## 📄 License

Project ini dibuat untuk tujuan pembelajaran Pemrograman Berorientasi Objek (PBO).

---

## 👨‍💻 Contributors

- **Developer:** [Your Name]
- **Framework:** Spring Boot 4.0.0
- **Database:** MySQL 8.0

---

**Happy Coding! ✈️**
