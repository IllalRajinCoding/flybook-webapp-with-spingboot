<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>
  const FLIGHT_DATABASE = [
      <c:if test="${not empty tiketList}">
          <c:forEach var="t" items="${tiketList}" varStatus="loop">
          {
              id: "${t.id}",
              maskapai: "${t.maskapai}",
              kode: "${t.nomorTiket}",
              asal: "${t.bandara_asal}",
              tujuan: "${t.bandara_tujuan}",
              jamBerangkat: "${t.jamBerangkat}",
              jamTiba: "${t.jamTiba}",
              tanggal: "${t.tanggalBerangkat}",
              harga: ${t.harga},
              status: "${t.status}",
              kursiSisa: ${t.kursiTersedia - t.kursiTerjual}
          }${!loop.last ? ',' : ''}
          </c:forEach>
      </c:if>
  ];
</script>

<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FlyBook - Premium Flight Services</title>

    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <script src="https://cdn.tailwindcss.com"></script>

    <script>
      tailwind.config = {
        theme: {
          extend: {
            fontFamily: { sans: ["Inter", "sans-serif"] },
            colors: {
              brand: "#003580", // Navy Blue korporat
              gold: "#C5A059", // Aksen emas premium
            },
          },
        },
      };
    </script>

    <style>
      body {
        background-color: #f3f4f6;
      }
      html {
        scroll-behavior: smooth;
      }

      /* 3D Ticket Style (Static) */
      .ticket-3d {
        transform: perspective(1200px) rotateX(3deg) rotateY(-8deg);
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15),
          0 10px 20px rgba(0, 0, 0, 0.1);
      }

      /* Custom Select Styling */
      select {
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23003580' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 0.75rem center;
        padding-right: 2.5rem;
      }

      select:focus {
        outline: none;
        border-color: #003580;
        box-shadow: 0 0 0 3px rgba(0, 53, 128, 0.1);
      }

      select option {
        padding: 10px;
        background: white;
      }

      /* Ticket Notches (Lekukan Tiket) */
      .ticket-notch-top {
        position: absolute;
        width: 24px;
        height: 24px;
        background: #f3f4f6;
        border-radius: 50%;
        top: -12px;
        right: 28%;
      }
      .ticket-notch-bottom {
        position: absolute;
        width: 24px;
        height: 24px;
        background: #f3f4f6;
        border-radius: 50%;
        bottom: -12px;
        right: 28%;
      }

      .glass-nav {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
      }

      .search-container {
        margin-top: -60px;
      }

      /* Loader */
      .loader {
        border: 2px solid #f3f3f3;
        border-top: 2px solid #003580;
        border-radius: 50%;
        width: 18px;
        height: 18px;
        animation: spin 1s linear infinite;
        display: none;
      }
      @keyframes spin {
        0% {
          transform: rotate(0deg);
        }
        100% {
          transform: rotate(360deg);
        }
      }
    </style>
  </head>
  <body class="text-slate-900">
    <nav class="glass-nav sticky top-0 z-50 border-b border-gray-200 px-6 py-4">
      <div class="max-w-7xl mx-auto flex justify-between items-center">
        <div class="flex items-center gap-8">
          <div class="flex items-center gap-2">
            <i class="fas fa-plane-departure text-brand text-2xl"></i>
            <span class="text-2xl font-extrabold tracking-tight text-brand"
              >FlyBook</span
            >
          </div>
          <div
            class="hidden lg:flex gap-6 text-sm font-medium text-gray-600 uppercase tracking-widest"
          >
            <a href="#" class="hover:text-brand transition">Pesan</a>
            <a href="#" class="hover:text-brand transition">Kelola</a>
            <a href="#" class="hover:text-brand transition">Info</a>
          </div>
        </div>
        <div class="flex items-center gap-4">
          <c:choose>
            <c:when test="${not empty sessionScope.userName}">
              <span class="text-sm font-bold border-r pr-4"
                >Halo, ${sessionScope.userName}</span
              >
            </c:when>
            <c:otherwise>
              <a
                href="/login"
                class="text-sm font-bold hover:text-brand transition"
                >MASUK</a
              >
              <a
                href="/register"
                class="bg-brand text-white px-5 py-2 rounded text-xs font-bold hover:bg-blue-900 transition"
                >DAFTAR</a
              >
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </nav>

    <section class="bg-brand min-h-[500px] relative flex items-center px-6">
      <!-- Background Pattern -->
      <div class="absolute inset-0 opacity-5">
        <svg width="100%" height="100%">
          <pattern
            id="grid"
            width="40"
            height="40"
            patternUnits="userSpaceOnUse"
          >
            <path
              d="M 40 0 L 0 0 0 40"
              fill="none"
              stroke="white"
              stroke-width="1"
            />
          </pattern>
          <rect width="100%" height="100%" fill="url(#grid)" />
        </svg>
      </div>

      <div
        class="max-w-7xl mx-auto grid lg:grid-cols-2 items-center gap-12 relative z-10 w-full py-12"
      >
        <!-- Left Content -->
        <div class="text-white space-y-6">
          <h1 class="text-5xl lg:text-6xl font-bold leading-tight">
            Pesan Tiket Pesawat<br />dengan Mudah
          </h1>
          <p class="text-blue-100 text-lg max-w-md leading-relaxed">
            Platform pemesanan tiket pesawat terpercaya dengan harga terbaik.
          </p>

          <!-- CTA Buttons -->
          <div class="flex gap-4 pt-4">
            <a
              href="#search-section"
              class="px-8 py-3 bg-white text-brand font-semibold rounded-lg hover:bg-gray-100 transition"
            >
              Cari Penerbangan
            </a>
            <c:if test="${not empty sessionScope.userName}">
              <a
                href="/dashboard/user"
                class="px-8 py-3 bg-transparent text-white font-semibold rounded-lg hover:bg-white/10 transition border-2 border-white"
              >
                Dashboard
              </a>
            </c:if>
          </div>
        </div>

        <!-- Right Content - Simple Ticket -->
        <div class="hidden lg:flex justify-end">
          <div
            class="bg-white w-[380px] rounded-xl p-6 text-slate-800 shadow-xl"
          >
            <div class="flex justify-between items-start mb-6">
              <div>
                <p class="text-xs text-gray-500 uppercase mb-1">
                  Business Class
                </p>
                <h3 class="text-xl font-bold text-brand">Boarding Pass</h3>
              </div>
              <div class="text-brand">
                <i class="fas fa-qrcode text-2xl"></i>
              </div>
            </div>

            <div class="flex justify-between items-center mb-6">
              <div>
                <p class="text-3xl font-bold text-brand">JKT</p>
                <p class="text-xs text-gray-500 mt-1">Jakarta</p>
              </div>
              <div class="flex-1 px-4 flex flex-col items-center">
                <i class="fas fa-plane text-brand mb-2"></i>
                <div class="w-full h-px bg-gray-200"></div>
              </div>
              <div class="text-right">
                <p class="text-3xl font-bold text-brand">DPS</p>
                <p class="text-xs text-gray-500 mt-1">Bali</p>
              </div>
            </div>

            <div class="grid grid-cols-3 gap-4 text-sm border-t pt-4">
              <div>
                <p class="text-gray-500 text-xs mb-1">Penumpang</p>
                <p class="font-semibold">John Doe</p>
              </div>
              <div>
                <p class="text-gray-500 text-xs mb-1">Tanggal</p>
                <p class="font-semibold">05 Jan</p>
              </div>
              <div class="text-right">
                <p class="text-gray-500 text-xs mb-1">Kursi</p>
                <p class="font-semibold">12A</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="max-w-7xl mx-auto px-6 relative z-20" id="search-section">
      <div class="search-container bg-white rounded-xl shadow-lg p-2">
        <div
          class="flex gap-6 px-6 py-4 border-b text-xs font-semibold text-gray-600"
        >
          <button class="text-brand border-b-2 border-brand pb-1">
            TIKET PESAWAT
          </button>
        </div>

        <div class="p-6">
          <div
            class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 items-end gap-4"
          >
            <div class="space-y-2">
              <label class="text-xs font-semibold text-gray-600 uppercase">
                Dari
              </label>
              <select
                id="origin"
                class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 focus:border-brand focus:ring-1 focus:ring-brand outline-none"
              >
                <option value="">Pilih Kota Asal</option>
                <option value="Jakarta">Jakarta (CGK)</option>
                <option value="Surabaya">Surabaya (SUB)</option>
                <option value="Bali">Bali (DPS)</option>
                <option value="Medan">Medan (KNO)</option>
                <option value="Makassar">Makassar (UPG)</option>
                <option value="Yogyakarta">Yogyakarta (JOG)</option>
                <option value="Bandung">Bandung (BDO)</option>
                <option value="Semarang">Semarang (SRG)</option>
                <option value="Solo">Solo (SOC)</option>
                <option value="Malang">Malang (MLG)</option>
                <option value="Balikpapan">Balikpapan (BPN)</option>
                <option value="Manado">Manado (MDC)</option>
                <option value="Lombok">Lombok (LOP)</option>
                <option value="Palembang">Palembang (PLM)</option>
              </select>
            </div>

            <div class="space-y-2">
              <label class="text-xs font-semibold text-gray-600 uppercase">
                Ke
              </label>
              <select
                id="dest"
                class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 focus:border-brand focus:ring-1 focus:ring-brand outline-none"
              >
                <option value="">Pilih Kota Tujuan</option>
                <option value="Jakarta">Jakarta (CGK)</option>
                <option value="Surabaya">Surabaya (SUB)</option>
                <option value="Bali">Bali (DPS)</option>
                <option value="Medan">Medan (KNO)</option>
                <option value="Makassar">Makassar (UPG)</option>
                <option value="Yogyakarta">Yogyakarta (JOG)</option>
                <option value="Bandung">Bandung (BDO)</option>
                <option value="Semarang">Semarang (SRG)</option>
                <option value="Solo">Solo (SOC)</option>
                <option value="Malang">Malang (MLG)</option>
                <option value="Balikpapan">Balikpapan (BPN)</option>
                <option value="Manado">Manado (MDC)</option>
                <option value="Lombok">Lombok (LOP)</option>
                <option value="Palembang">Palembang (PLM)</option>
                <option value="Singapore">Singapore (SIN)</option>
                <option value="Bangkok">Bangkok (BKK)</option>
                <option value="Kuala Lumpur">Kuala Lumpur (KUL)</option>
              </select>
            </div>

            <div class="space-y-2">
              <label class="text-xs font-semibold text-gray-600 uppercase">
                Tanggal
              </label>
              <input
                type="date"
                id="date"
                class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 focus:border-brand focus:ring-1 focus:ring-brand outline-none"
              />
            </div>

            <button
              onclick="searchFlights()"
              id="searchBtn"
              class="w-full bg-brand text-white py-3 rounded-lg font-semibold text-sm hover:bg-blue-900 transition flex items-center justify-center gap-2"
            >
              <span id="btnText">Cari Penerbangan</span>
              <div id="loader" class="loader"></div>
              <i class="fas fa-search" id="searchIcon"></i>
            </button>
          </div>
        </div>
      </div>
    </section>

    <main id="results" class="max-w-7xl mx-auto px-6 py-16 hidden">
      <div class="flex justify-between items-center mb-8">
        <h2 class="text-2xl font-bold text-gray-900 flex items-center gap-3">
          <i class="fas fa-plane-departure text-brand"></i>
          <span>Hasil Pencarian</span>
        </h2>
        <p
          id="count"
          class="text-sm text-gray-500 font-medium bg-gray-100 px-4 py-2 rounded-full"
        ></p>
      </div>
      <div id="flightGrid" class="space-y-4"></div>
    </main>

    <!-- Features Section -->
    <section class="max-w-7xl mx-auto px-6 py-16">
      <div class="grid md:grid-cols-3 gap-8">
        <div class="text-center">
          <div
            class="w-12 h-12 bg-blue-50 rounded-lg flex items-center justify-center mx-auto mb-3"
          >
            <i class="fas fa-shield-alt text-brand text-xl"></i>
          </div>
          <h3 class="font-semibold text-gray-900 mb-2">Aman & Terpercaya</h3>
          <p class="text-sm text-gray-600">
            Transaksi aman dengan sistem keamanan berlapis
          </p>
        </div>

        <div class="text-center">
          <div
            class="w-12 h-12 bg-blue-50 rounded-lg flex items-center justify-center mx-auto mb-3"
          >
            <i class="fas fa-tags text-brand text-xl"></i>
          </div>
          <h3 class="font-semibold text-gray-900 mb-2">Harga Terbaik</h3>
          <p class="text-sm text-gray-600">
            Dapatkan harga tiket terbaik untuk semua rute
          </p>
        </div>

        <div class="text-center">
          <div
            class="w-12 h-12 bg-blue-50 rounded-lg flex items-center justify-center mx-auto mb-3"
          >
            <i class="fas fa-headset text-brand text-xl"></i>
          </div>
          <h3 class="font-semibold text-gray-900 mb-2">Layanan 24/7</h3>
          <p class="text-sm text-gray-600">
            Customer service siap membantu Anda kapan saja
          </p>
        </div>
      </div>
    </section>

    <footer class="bg-gray-900 text-white py-12 mt-20">
      <div class="max-w-7xl mx-auto px-6">
        <div class="grid md:grid-cols-3 gap-8 mb-8">
          <div>
            <div class="flex items-center gap-2 mb-3">
              <i class="fas fa-plane-departure text-xl"></i>
              <span class="text-xl font-bold">FlyBook</span>
            </div>
            <p class="text-gray-400 text-sm">
              Platform pemesanan tiket pesawat terpercaya di Indonesia
            </p>
          </div>

          <div>
            <h4 class="font-semibold mb-3">Perusahaan</h4>
            <ul class="space-y-2 text-sm text-gray-400">
              <li>
                <a href="#" class="hover:text-white transition">Tentang Kami</a>
              </li>
              <li>
                <a href="#" class="hover:text-white transition">Hubungi Kami</a>
              </li>
            </ul>
          </div>

          <div>
            <h4 class="font-semibold mb-3">Bantuan</h4>
            <ul class="space-y-2 text-sm text-gray-400">
              <li>
                <a href="#" class="hover:text-white transition"
                  >Pusat Bantuan</a
                >
              </li>
              <li>
                <a href="#" class="hover:text-white transition"
                  >Syarat & Ketentuan</a
                >
              </li>
            </ul>
          </div>
        </div>

        <div class="border-t border-gray-800 pt-6 text-center">
          <p class="text-sm text-gray-400">
            &copy; 2024 FlyBook. All rights reserved.
          </p>
        </div>
      </div>
    </footer>

    <script>
      function searchFlights() {
        const btnText = document.getElementById("btnText");
        const loader = document.getElementById("loader");
        const searchIcon = document.getElementById("searchIcon");
        const results = document.getElementById("results");
        const flightGrid = document.getElementById("flightGrid");
        const countText = document.getElementById("count");

        const origin = document
          .getElementById("origin")
          .value.toLowerCase()
          .trim();
        const dest = document.getElementById("dest").value.toLowerCase().trim();

        // UI Loading
        btnText.style.display = "none";
        searchIcon.style.display = "none";
        loader.style.display = "block";

        setTimeout(() => {
          const filtered = FLIGHT_DATABASE.filter(
            (f) =>
              (!origin || f.asal.toLowerCase().includes(origin)) &&
              (!dest || f.tujuan.toLowerCase().includes(dest))
          );

          flightGrid.innerHTML = "";
          if (filtered.length > 0) {
            filtered.forEach((f) => {
              flightGrid.innerHTML += `
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 flex flex-col md:flex-row overflow-hidden hover:shadow-lg transition-all duration-300 hover:scale-[1.01]">
                  <div class="p-6 flex-1 relative">
                    <div class="flex justify-between items-start mb-6">
                      <div class="flex items-center gap-4">
                        <div class="w-14 h-14 bg-gradient-to-br from-brand to-blue-700 rounded-xl flex items-center justify-center text-white shadow-lg">
                          <i class="fas fa-plane text-xl"></i>
                        </div>
                        <div>
                          <h4 class="font-bold text-lg text-gray-900">\${f.maskapai}</h4>
                          <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider">\${f.kode}</p>
                        </div>
                      </div>
                      <span class="text-xs font-bold px-3 py-1.5 bg-gradient-to-r from-green-50 to-emerald-50 text-green-700 rounded-full border border-green-200">
                        <i class="fas fa-check-circle mr-1"></i>Tersedia
                      </span>
                    </div>
                    <div class="flex items-center justify-between">
                      <div class="text-center">
                        <p class="text-3xl font-black text-brand">\${f.jamBerangkat}</p>
                        <p class="text-xs font-bold text-gray-500 uppercase mt-1">\${f.asal}</p>
                      </div>
                      <div class="flex-1 px-8 flex flex-col items-center">
                        <p class="text-[10px] font-bold mb-2 uppercase tracking-widest text-gray-400">Langsung</p>
                        <div class="w-full h-0.5 bg-gradient-to-r from-transparent via-gray-300 to-transparent relative">
                          <i class="fas fa-circle absolute left-0 -top-1 text-[6px] text-brand"></i>
                          <i class="fas fa-plane absolute left-1/2 -translate-x-1/2 -top-2 text-brand text-xs"></i>
                          <i class="fas fa-circle absolute right-0 -top-1 text-[6px] text-brand"></i>
                        </div>
                      </div>
                      <div class="text-center">
                        <p class="text-3xl font-black text-brand">\${f.jamTiba}</p>
                        <p class="text-xs font-bold text-gray-500 uppercase mt-1">\${f.tujuan}</p>
                      </div>
                    </div>
                  </div>
                  <div class="bg-gradient-to-br from-slate-50 to-blue-50 border-l border-gray-200 p-8 md:w-72 flex flex-col justify-center items-center text-center">
                    <p class="text-xs font-bold text-gray-500 uppercase mb-2 tracking-wider">Mulai Dari</p>
                    <h3 class="text-2xl font-black text-brand mb-5">Rp \${f.harga.toLocaleString()}</h3>
                    <a href="/dashboard/user/tiket/\${f.id}/book" 
                      class="w-full bg-gradient-to-r from-brand to-blue-700 text-white py-3 rounded-xl text-sm font-bold hover:shadow-xl transition-all duration-300 hover:scale-105 mb-3">
                      <i class="fas fa-ticket-alt mr-2"></i>PILIH
                    </a>
                    <p class="text-xs font-bold text-gray-500 uppercase tracking-tighter flex items-center gap-2">
                      <i class="fas fa-chair text-brand"></i>
                      <span>Sisa \${f.kursiSisa} Kursi</span>
                    </p>
                  </div>
                </div>
              `;
            });
            countText.innerText = filtered.length + " Penerbangan ditemukan";
          } else {
            flightGrid.innerHTML =
              '<div class="bg-white rounded-xl p-16 text-center shadow-sm"><div class="w-20 h-20 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4"><i class="fas fa-plane-slash text-gray-400 text-3xl"></i></div><p class="text-gray-600 font-semibold mb-2">Penerbangan tidak ditemukan</p><p class="text-gray-400 text-sm">Coba ubah kriteria pencarian Anda</p></div>';
            countText.innerText = "0 Penerbangan";
          }

          results.classList.remove("hidden");
          btnText.style.display = "block";
          searchIcon.style.display = "block";
          loader.style.display = "none";
          results.scrollIntoView({ behavior: "smooth" });
        }, 1200);
      }
    </script>
  </body>
</html>
