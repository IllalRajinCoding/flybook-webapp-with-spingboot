# 🛫 FlyBook - Sistem Booking Tiket Pesawat

Aplikasi web berbasis Spring Boot untuk pemesanan tiket pesawat dengan fitur manajemen admin dan user.

## 📋 Daftar Isi

- [Persyaratan Sistem](#-persyaratan-sistem)
- [Langkah-langkah Instalasi](#-langkah-langkah-instalasi)
- [Menjalankan Aplikasi](#-menjalankan-aplikasi)
- [Login Akun Default](#-login-akun-default)
- [Troubleshooting](#-troubleshooting)

---

## 🔧 Persyaratan Sistem

Sebelum memulai, pastikan komputer Anda sudah memiliki:

### 1. **Java Development Kit (JDK) 21**

- Download: [Oracle JDK 21](https://www.oracle.com/java/technologies/downloads/#java21) atau [OpenJDK 21](https://adoptium.net/)
- Verifikasi instalasi:
  ```bash
  java -version
  ```
- Harus muncul: `java version "21.x.x"`

### 2. **Apache Maven 3.8+**

- Download: [Maven](https://maven.apache.org/download.cgi)
- Atau gunakan Maven wrapper yang sudah disediakan (`mvnw.cmd`)
- Verifikasi instalasi:
  ```bash
  mvn -version
  ```

### 3. **PostgreSQL 14+**

- Download: [PostgreSQL](https://www.postgresql.org/download/)
- **Catat username dan password** yang Anda buat saat instalasi
- Default: username `postgres`, password `Root` (atau sesuai yang Anda setting)

### 4. **Git** (opsional)

- Untuk clone repository
- Download: [Git](https://git-scm.com/downloads)

---

## 📥 Langkah-langkah Instalasi

### **Step 1: Download/Clone Project**

```bash
# Jika menggunakan Git
git clone <repository-url>
cd pbo

# Atau extract file ZIP jika sudah didownload
```

### **Step 2: Setup Database PostgreSQL**

#### A. Buat Database Baru

1. Buka **pgAdmin** atau **Command Prompt**
2. Login ke PostgreSQL:
   ```bash
   psql -U postgres
   ```
3. Buat database `flybook`:
   ```sql
   CREATE DATABASE flybook;
   \q
   ```

#### B. Jalankan Script Setup (MUDAH!)

**Untuk Windows:**

```bash
# Jalankan batch file yang sudah disediakan
setup-database.bat
```

**Untuk Manual/Linux:**

```bash
# Set password PostgreSQL (sesuaikan dengan password Anda)
export PGPASSWORD=Root

# Jalankan schema
psql -U postgres -d flybook -f src/main/resources/users_schema.sql
psql -U postgres -d flybook -f src/main/resources/tiket_schema.sql
psql -U postgres -d flybook -f src/main/resources/booking_schema.sql
```

✅ **Jika berhasil**, Anda akan melihat pesan:

```
Database setup completed successfully!
```

### **Step 3: Konfigurasi Database Connection**

Buka file `src/main/resources/application.yaml` dan sesuaikan dengan konfigurasi PostgreSQL Anda:

```yaml
spring:
  application:
    name: pbo
  mvc:
    view:
      prefix: /WEB-INF/views/
      suffix: .jsp
  datasource:
    url: jdbc:postgresql://localhost:5432/flybook
    username: postgres # <-- Sesuaikan dengan username PostgreSQL Anda
    password: Root # <-- Sesuaikan dengan password PostgreSQL Anda
    driver-class-name: org.postgresql.Driver
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQLDialect
```

> ⚠️ **PENTING**: Ganti `username` dan `password` sesuai dengan PostgreSQL Anda!

### **Step 4: Build Aplikasi**

```bash
# Menggunakan Maven (jika sudah terinstall)
mvn clean install

# ATAU menggunakan Maven Wrapper (tidak perlu install Maven)
# Windows:
mvnw.cmd clean install

# Linux/Mac:
./mvnw clean install
```

Proses ini akan:

- Download semua dependencies yang dibutuhkan
- Compile source code
- Membuat file WAR di folder `target/`

⏱️ **Waktu**: ~2-5 menit (tergantung koneksi internet untuk pertama kali)

---

## 🚀 Menjalankan Aplikasi

### **Opsi 1: Menggunakan Maven Spring Boot Plugin (REKOMENDASI)**

```bash
# Windows:
mvnw.cmd spring-boot:run

# Linux/Mac:
./mvnw spring-boot:run
```

### **Opsi 2: Menjalankan File WAR**

```bash
java -jar target/pbo-0.0.1-SNAPSHOT.war
```

### **Opsi 3: Dari IDE (IntelliJ IDEA / Eclipse)**

1. Buka project sebagai Maven project
2. Cari file `PboApplication.java`
3. Klik kanan → Run `PboApplication.main()`

---

## 🌐 Akses Aplikasi

Setelah aplikasi berjalan, buka browser dan akses:

```
http://localhost:8080
```

✅ **Jika berhasil**, Anda akan melihat halaman home FlyBook!

---

## 🔐 Login Akun Default

Aplikasi sudah dilengkapi dengan 2 akun default:

### **Admin Account**

```
Email    : admin@flybook.com
Password : admin123
```

**Akses**: Dashboard admin, kelola tiket, lihat semua booking

### **User Account**

```
Email    : user@flybook.com
Password : user123
```

**Akses**: Cari tiket, booking tiket, lihat booking saya

> 💡 **Tips**: Anda juga bisa membuat akun baru melalui halaman Register

---

## 🐛 Troubleshooting

### **Problem 1: Port 8080 Sudah Digunakan**

**Error**: `Port 8080 is already in use`

**Solusi**:

```yaml
# Tambahkan di application.yaml
server:
  port: 8081 # Ganti ke port lain
```

### **Problem 2: Database Connection Failed**

**Error**: `Connection refused` atau `Authentication failed`

**Checklist**:

- ✅ PostgreSQL service sudah running?
  ```bash
  # Windows: Cek di Services (Win+R → services.msc)
  # Cari "postgresql-x64-xx"
  ```
- ✅ Username dan password di `application.yaml` sudah benar?
- ✅ Database `flybook` sudah dibuat?
  ```sql
  # Login psql dan cek
  \l
  ```
- ✅ Firewall tidak memblokir port 5432?

### **Problem 3: Tabel Tidak Ditemukan**

**Error**: `ERROR: relation "users" does not exist`

**Solusi**:

```bash
# Jalankan ulang setup database
setup-database.bat

# Atau manual
psql -U postgres -d flybook -f src/main/resources/users_schema.sql
```

### **Problem 4: JSP Tidak Muncul / 404 Error**

**Checklist**:

- ✅ Pastikan `tomcat-embed-jasper` ada di pom.xml
- ✅ Cek path view di application.yaml: `/WEB-INF/views/`
- ✅ File JSP ada di `src/main/webapp/WEB-INF/views/`
- ✅ Restart aplikasi setelah perubahan

### **Problem 5: Maven Build Gagal**

**Error**: `Failed to resolve dependencies`

**Solusi**:

```bash
# Clear Maven cache dan rebuild
mvn clean
mvn dependency:purge-local-repository
mvn clean install
```

### **Problem 6: Reset Password Admin**

Jika lupa password admin, jalankan:

```bash
# Windows
reset-admin.bat

# Manual
psql -U postgres -d flybook -f src/main/resources/reset-admin.sql
```

---

## 📁 Struktur Project

```
pbo/
├── src/
│   ├── main/
│   │   ├── java/com/flybook/pbo/
│   │   │   ├── controller/      # Controller layer
│   │   │   ├── service/         # Business logic
│   │   │   ├── repository/      # Database access
│   │   │   ├── model/           # Entity classes
│   │   │   └── database/        # Database config
│   │   ├── resources/
│   │   │   ├── application.yaml     # Konfigurasi utama
│   │   │   ├── users_schema.sql     # Schema tabel users
│   │   │   ├── tiket_schema.sql     # Schema tabel tiket
│   │   │   └── booking_schema.sql   # Schema tabel booking
│   │   └── webapp/WEB-INF/views/    # JSP files
│   └── test/                        # Unit tests
├── pom.xml                          # Maven dependencies
├── setup-database.bat               # Setup database otomatis
├── reset-admin.bat                  # Reset admin password
└── README.md                        # Dokumentasi ini
```

---

## 🎯 Fitur Aplikasi

### **Untuk Admin:**

- ✅ Kelola tiket pesawat (CRUD)
- ✅ Lihat semua booking pengguna
- ✅ Dashboard statistik

### **Untuk User:**

- ✅ Registrasi dan login
- ✅ Cari tiket berdasarkan rute dan tanggal
- ✅ Booking tiket
- ✅ Lihat riwayat booking
- ✅ Detail tiket

---

## Catatan Penting

1. **Password PostgreSQL**: Default script menggunakan password `Root`. Sesuaikan di `setup-database.bat` dan `application.yaml` jika berbeda.

2. **Java Version**: Aplikasi ini membutuhkan **Java 21**. Tidak kompatibel dengan Java 8 atau 11.

3. **Development Mode**: Setting `spring.jpa.hibernate.ddl-auto: update` akan otomatis update schema. Untuk production, ganti ke `validate`.

4. **Port Default**: Aplikasi berjalan di port `8080`. Bisa diubah di `application.yaml`.

---

## Butuh Bantuan?

Jika masih ada masalah:

1. Cek file `DATABASE_SETUP.md` untuk detail setup database
2. Cek file `FITUR_BOOKING.md` untuk dokumentasi fitur
3. Lihat log error di console untuk detail masalah
4. Pastikan semua persyaratan sistem terpenuhi

---

##  Quick Start (TL;DR)

```bash
# 1. Buat database
psql -U postgres -c "CREATE DATABASE flybook;"

# 2. Setup tables
setup-database.bat

# 3. Sesuaikan application.yaml dengan kredensial PostgreSQL Anda

# 4. Run aplikasi
mvnw.cmd spring-boot:run

# 5. Buka browser
http://localhost:8080

# 6. Login dengan:
# Admin: admin@flybook.com / admin123
# User: user@flybook.com / user123
```

---
