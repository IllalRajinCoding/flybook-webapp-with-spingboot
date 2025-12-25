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

    <section
      class="bg-brand h-[450px] relative flex items-center px-6 overflow-hidden"
    >
      <div class="absolute inset-0 opacity-10 pointer-events-none">
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
        class="max-w-7xl mx-auto grid lg:grid-cols-2 items-center relative z-10 w-full"
      >
        <div class="text-white space-y-4">
          <h1 class="text-5xl font-bold leading-tight">
            Terbang Lebih Tinggi, <br />Bayar Lebih Pintar.
          </h1>
          <p class="text-blue-100 text-lg max-w-md">
            Layanan penerbangan premium dengan harga yang masuk akal. Mulai
            perjalanan Anda hari ini.
          </p>
        </div>
        <div class="hidden lg:flex justify-end">
          <div
            class="ticket-3d bg-white w-[380px] rounded-2xl p-6 relative overflow-hidden text-slate-800"
          >
            <div class="flex justify-between items-start mb-8">
              <div>
                <p
                  class="text-[10px] font-bold text-gray-400 uppercase tracking-tighter"
                >
                  Business Class
                </p>
                <h3 class="text-xl font-bold">Boarding Pass</h3>
              </div>
              <i class="fas fa-barcode text-3xl opacity-20"></i>
            </div>
            <div class="flex justify-between items-center mb-6">
              <div>
                <p class="text-3xl font-black">JKT</p>
                <p class="text-[10px] text-gray-500">Jakarta</p>
              </div>
              <div class="flex-1 px-4 flex flex-col items-center">
                <i class="fas fa-plane text-brand text-sm mb-1"></i>
                <div class="w-full h-px bg-gray-200"></div>
              </div>
              <div class="text-right">
                <p class="text-3xl font-black">LND</p>
                <p class="text-[10px] text-gray-500">London</p>
              </div>
            </div>
            <div class="grid grid-cols-2 gap-4 text-xs">
              <div>
                <p class="text-gray-400">Penumpang</p>
                <p class="font-bold">Eka Putra</p>
              </div>
              <div class="text-right">
                <p class="text-gray-400">Kursi</p>
                <p class="font-bold">12A</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="max-w-7xl mx-auto px-6 relative z-20">
      <div
        class="search-container bg-white rounded-xl shadow-2xl p-1 border border-gray-100"
      >
        <div
          class="flex gap-8 px-6 py-4 border-b border-gray-100 text-xs font-bold text-gray-500"
        >
          <button class="text-brand border-b-2 border-brand pb-4 -mb-4.5">
            <i class="fas fa-plane mr-2"></i>TIKET PESAWAT
          </button>
          <button class="hover:text-brand transition">
            <i class="fas fa-hotel mr-2"></i>HOTEL
          </button>
          <button class="hover:text-brand transition">
            <i class="fas fa-suitcase mr-2"></i>PAKET WISATA
          </button>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-4 items-center p-6 gap-4">
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-gray-400 uppercase"
              >Dari</label
            >
            <div class="relative">
              <i
                class="fas fa-map-marker-alt absolute left-3 top-1/2 -translate-y-1/2 text-gray-300 pointer-events-none z-10"
              ></i>
              <select
                id="origin"
                class="w-full pl-9 pr-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-lg text-sm font-semibold text-gray-700 transition cursor-pointer hover:border-gray-300"
              >
                <option value="">Pilih Kota Asal</option>
                <option value="Jakarta">Jakarta (CGK)</option>
                <option value="Surabaya">Surabaya (SUB)</option>
                <option value="Bali">Bali / Denpasar (DPS)</option>
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
          </div>
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-gray-400 uppercase"
              >Ke</label
            >
            <div class="relative">
              <i
                class="fas fa-paper-plane absolute left-3 top-1/2 -translate-y-1/2 text-gray-300 pointer-events-none z-10"
              ></i>
              <select
                id="dest"
                class="w-full pl-9 pr-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-lg text-sm font-semibold text-gray-700 transition cursor-pointer hover:border-gray-300"
              >
                <option value="">Pilih Kota Tujuan</option>
                <option value="Jakarta">Jakarta (CGK)</option>
                <option value="Surabaya">Surabaya (SUB)</option>
                <option value="Bali">Bali / Denpasar (DPS)</option>
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
          </div>
          <div class="space-y-1">
            <label class="text-[10px] font-bold text-gray-400 uppercase"
              >Tanggal</label
            >
            <input
              type="date"
              id="date"
              class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded text-sm focus:outline-none focus:border-brand transition"
            />
          </div>
          <div class="pt-5">
            <button
              onclick="searchFlights()"
              id="searchBtn"
              class="w-full bg-brand text-white py-3.5 rounded font-bold text-sm shadow-lg hover:bg-blue-900 transition flex items-center justify-center gap-3"
            >
              <span id="btnText">CARI PENERBANGAN</span>
              <div id="loader" class="loader"></div>
            </button>
          </div>
        </div>
      </div>
    </section>

    <main id="results" class="max-w-7xl mx-auto px-6 py-16 hidden">
      <div class="flex justify-between items-center mb-8">
        <h2 class="text-xl font-bold">Hasil Pencarian</h2>
        <p id="count" class="text-sm text-gray-500 font-medium"></p>
      </div>
      <div id="flightGrid" class="space-y-4"></div>
    </main>

    <footer class="mt-auto py-12 border-t border-gray-200 text-center">
      <p class="text-xs text-gray-400 font-medium uppercase tracking-widest">
        &copy; 2024 FlyBook - Official Ticketing Platform
      </p>
    </footer>

    <script>
      function searchFlights() {
        const btnText = document.getElementById("btnText");
        const loader = document.getElementById("loader");
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
                            <div class="bg-white rounded-lg shadow-sm border border-gray-200 flex flex-col md:flex-row overflow-hidden hover:shadow-md transition">
                                <div class="p-6 flex-1 relative">
                                    <div class="ticket-notch-top"></div>
                                    <div class="ticket-notch-bottom"></div>
                                    <div class="flex justify-between items-start mb-6">
                                        <div class="flex items-center gap-4">
                                            <div class="w-12 h-12 bg-gray-50 rounded border flex items-center justify-center text-brand">
                                                <i class="fas fa-plane text-lg"></i>
                                            </div>
                                            <div>
                                                <h4 class="font-bold">\${f.maskapai}</h4>
                                                <p class="text-[10px] font-bold text-gray-400 uppercase tracking-widest">\${f.kode}</p>
                                            </div>
                                        </div>
                                        <span class="text-[10px] font-bold px-2 py-1 bg-green-100 text-green-700 rounded uppercase">Tersedia</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <div class="text-center"><p class="text-2xl font-black">\${f.jamBerangkat}</p><p class="text-[10px] font-bold text-gray-500 uppercase">\${f.asal}</p></div>
                                        <div class="flex-1 px-8 flex flex-col items-center opacity-30">
                                            <p class="text-[9px] font-bold mb-1 uppercase tracking-widest">Langsung</p>
                                            <div class="w-full h-px bg-slate-900 relative"><i class="fas fa-circle absolute left-0 -top-0.5 text-[4px]"></i><i class="fas fa-circle absolute right-0 -top-0.5 text-[4px]"></i></div>
                                        </div>
                                        <div class="text-center"><p class="text-2xl font-black">\${f.jamTiba}</p><p class="text-[10px] font-bold text-gray-500 uppercase">\${f.tujuan}</p></div>
                                    </div>
                                </div>
                                <div class="bg-slate-50 border-l border-dashed border-gray-200 p-8 md:w-64 flex flex-col justify-center items-center text-center">
                                    <p class="text-[10px] font-bold text-gray-400 uppercase mb-1">Mulai Dari</p>
                                    <h3 class="text-xl font-black text-brand mb-4">Rp \${f.harga.toLocaleString()}</h3>
                                    <a href="/dashboard/user/tiket/\${f.id}/book" class="w-full bg-brand text-white py-2 rounded text-xs font-bold hover:bg-blue-900 transition shadow-lg shadow-blue-200">PILIH</a>
                                    <p class="text-[9px] font-bold text-gray-400 mt-4 uppercase tracking-tighter italic">Sisa \${f.kursiSisa} Kursi</p>
                                </div>
                            </div>
                        `;
            });
            countText.innerText = filtered.length + " Penerbangan ditemukan";
          } else {
            flightGrid.innerHTML =
              '<p class="text-center py-12 text-gray-400 font-medium">Penerbangan tidak ditemukan.</p>';
            countText.innerText = "0 Penerbangan";
          }

          results.classList.remove("hidden");
          btnText.style.display = "block";
          loader.style.display = "none";
          results.scrollIntoView({ behavior: "smooth" });
        }, 1000);
      }
    </script>
  </body>
</html>
