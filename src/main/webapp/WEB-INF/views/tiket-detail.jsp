<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detail Tiket - FlyBook</title>
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
              brand: "#003580",
              gold: "#C5A059",
            },
          },
        },
      };
    </script>
    <style>
      body {
        background-color: #f3f4f6;
      }

      .ticket-detail-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      }

      .info-card {
        transition: all 0.3s ease;
      }

      .info-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      }

      .booking-section {
        background: linear-gradient(to bottom right, #f8fafc, #e2e8f0);
      }
    </style>
  </head>
  <body class="text-slate-900">
    <!-- Navbar -->
    <nav class="bg-white border-b sticky top-0 z-50 shadow-sm">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
          <div class="flex items-center gap-2">
            <i class="fas fa-plane-departure text-brand text-xl"></i>
            <h1 class="text-xl font-bold text-brand">FlyBook</h1>
          </div>
          <div class="flex items-center gap-4">
            <a
              href="/dashboard/user"
              class="text-sm text-gray-600 hover:text-brand transition flex items-center gap-2"
            >
              <i class="fas fa-arrow-left"></i>
              <span>Kembali ke Dashboard</span>
            </a>
          </div>
        </div>
      </div>
    </nav>

    <!-- Main Content -->
    <main class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Breadcrumb -->
      <div class="mb-6">
        <nav class="flex text-sm text-gray-500 mb-4">
          <a href="/" class="hover:text-brand">Home</a>
          <span class="mx-2">/</span>
          <a href="/dashboard/user" class="hover:text-brand">Dashboard</a>
          <span class="mx-2">/</span>
          <span class="text-gray-900 font-medium">Detail Tiket</span>
        </nav>
        <h2 class="text-3xl font-bold text-gray-900">Detail Penerbangan</h2>
        <p class="text-gray-600 mt-1">Nomor Tiket: ${tiket.nomorTiket}</p>
      </div>

      <c:choose>
        <c:when test="${not empty tiket}">
          <div class="grid lg:grid-cols-3 gap-6">
            <!-- Left Column - Flight Details -->
            <div class="lg:col-span-2 space-y-6">
              <!-- Main Flight Card -->
              <div class="bg-white rounded-xl shadow-sm overflow-hidden">
                <div class="ticket-detail-card p-6 text-white">
                  <div class="flex justify-between items-start mb-6">
                    <div>
                      <div
                        class="text-sm opacity-80 uppercase tracking-wider mb-1"
                      >
                        Maskapai
                      </div>
                      <h3 class="text-2xl font-bold">${tiket.maskapai}</h3>
                    </div>
                    <div
                      class="px-4 py-2 bg-white/20 backdrop-blur-sm rounded-lg"
                    >
                      <div class="text-xs opacity-80 mb-1">Status</div>
                      <c:choose>
                        <c:when test="${tiket.status == 'aktif'}">
                          <div class="font-semibold">✓ Tersedia</div>
                        </c:when>
                        <c:otherwise>
                          <div class="font-semibold">✕ Tidak Tersedia</div>
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>

                  <!-- Route Display -->
                  <div class="grid grid-cols-3 gap-4 items-center">
                    <div class="text-center">
                      <div class="text-4xl font-black mb-2">
                        ${tiket.jamBerangkat}
                      </div>
                      <div class="text-sm opacity-90">
                        ${tiket.bandara_asal}
                      </div>
                    </div>

                    <div class="flex flex-col items-center">
                      <div class="text-xs opacity-80 mb-2">
                        Penerbangan Langsung
                      </div>
                      <div class="w-full flex items-center">
                        <div class="flex-1 h-px bg-white/40"></div>
                        <i class="fas fa-plane mx-2"></i>
                        <div class="flex-1 h-px bg-white/40"></div>
                      </div>
                    </div>

                    <div class="text-center">
                      <div class="text-4xl font-black mb-2">
                        ${tiket.jamTiba}
                      </div>
                      <div class="text-sm opacity-90">
                        ${tiket.bandara_tujuan}
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Additional Info -->
                <div class="p-6 bg-gray-50">
                  <div class="grid md:grid-cols-3 gap-4">
                    <div class="info-card bg-white p-4 rounded-lg">
                      <div
                        class="flex items-center gap-3 text-gray-600 text-sm mb-1"
                      >
                        <i class="fas fa-calendar-alt text-brand"></i>
                        <span>Tanggal Keberangkatan</span>
                      </div>
                      <div class="font-semibold text-gray-900">
                        ${tiket.tanggalBerangkat}
                      </div>
                    </div>

                    <div class="info-card bg-white p-4 rounded-lg">
                      <div
                        class="flex items-center gap-3 text-gray-600 text-sm mb-1"
                      >
                        <i class="fas fa-chair text-brand"></i>
                        <span>Kursi Tersedia</span>
                      </div>
                      <div class="font-semibold text-gray-900">
                        ${availableSeats} / ${tiket.kursiTersedia} kursi
                      </div>
                    </div>

                    <div class="info-card bg-white p-4 rounded-lg">
                      <div
                        class="flex items-center gap-3 text-gray-600 text-sm mb-1"
                      >
                        <i class="fas fa-tag text-brand"></i>
                        <span>Harga per Kursi</span>
                      </div>
                      <div class="font-semibold text-brand text-lg">
                        Rp
                        <fmt:formatNumber
                          value="${tiket.harga}"
                          groupingUsed="true"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Facilities & Terms -->
              <div class="bg-white rounded-xl shadow-sm p-6">
                <h4
                  class="font-semibold text-gray-900 mb-4 flex items-center gap-2"
                >
                  <i class="fas fa-star text-gold"></i>
                  <span>Fasilitas & Ketentuan</span>
                </h4>

                <div class="grid md:grid-cols-2 gap-6">
                  <div>
                    <h5 class="text-sm font-semibold text-gray-700 mb-3">
                      Fasilitas:
                    </h5>
                    <ul class="space-y-2 text-sm text-gray-600">
                      <li class="flex items-center gap-2">
                        <i class="fas fa-check text-green-500"></i>
                        Bagasi kabin 7 kg
                      </li>
                      <li class="flex items-center gap-2">
                        <i class="fas fa-check text-green-500"></i>
                        Bagasi tercatat 20 kg
                      </li>
                      <li class="flex items-center gap-2">
                        <i class="fas fa-check text-green-500"></i>
                        Makanan & minuman
                      </li>
                      <li class="flex items-center gap-2">
                        <i class="fas fa-check text-green-500"></i>
                        Hiburan dalam penerbangan
                      </li>
                    </ul>
                  </div>

                  <div>
                    <h5 class="text-sm font-semibold text-gray-700 mb-3">
                      Ketentuan:
                    </h5>
                    <ul class="space-y-2 text-sm text-gray-600">
                      <li class="flex items-center gap-2">
                        <i class="fas fa-info-circle text-blue-500"></i>
                        Check-in 2 jam sebelum keberangkatan
                      </li>
                      <li class="flex items-center gap-2">
                        <i class="fas fa-info-circle text-blue-500"></i>
                        Bawa identitas asli (KTP/Passport)
                      </li>
                      <li class="flex items-center gap-2">
                        <i class="fas fa-info-circle text-blue-500"></i>
                        Pembatalan max 24 jam sebelumnya
                      </li>
                      <li class="flex items-center gap-2">
                        <i class="fas fa-info-circle text-blue-500"></i>
                        Harga dapat berubah sewaktu-waktu
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

            <!-- Right Column - Booking Section -->
            <div class="lg:col-span-1">
              <div
                class="bg-white rounded-xl shadow-lg overflow-hidden sticky top-20"
              >
                <div class="booking-section p-6">
                  <h4 class="font-bold text-gray-900 mb-4 text-lg">
                    Booking Sekarang
                  </h4>

                  <c:choose>
                    <c:when
                      test="${tiket.status == 'aktif' && availableSeats > 0}"
                    >
                      <form
                        action="/dashboard/user/tiket/${tiket.id}/book"
                        method="get"
                      >
                        <!-- Seat Selection -->
                        <div class="mb-6">
                          <label
                            for="seats"
                            class="block text-sm font-semibold text-gray-700 mb-2"
                          >
                            Jumlah Kursi
                          </label>
                          <select
                            id="seats"
                            name="seats"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand focus:border-transparent outline-none"
                            onchange="updateTotal()"
                          >
                            <c:forEach
                              begin="1"
                              end="${availableSeats > 10 ? 10 : availableSeats}"
                              var="i"
                            >
                              <option value="${i}">${i} Kursi</option>
                            </c:forEach>
                          </select>
                        </div>

                        <!-- Price Summary -->
                        <div
                          class="bg-white rounded-lg p-4 mb-6 border border-gray-200"
                        >
                          <div class="flex justify-between text-sm mb-2">
                            <span class="text-gray-600">Harga per kursi</span>
                            <span class="font-semibold text-gray-900">
                              Rp
                              <fmt:formatNumber
                                value="${tiket.harga}"
                                groupingUsed="true"
                              />
                            </span>
                          </div>
                          <div
                            class="flex justify-between text-sm mb-3 pb-3 border-b"
                          >
                            <span class="text-gray-600">Jumlah kursi</span>
                            <span
                              id="seatCount"
                              class="font-semibold text-gray-900"
                              >1</span
                            >
                          </div>
                          <div class="flex justify-between items-center">
                            <span class="font-semibold text-gray-900"
                              >Total</span
                            >
                            <span
                              id="totalPrice"
                              class="text-xl font-bold text-brand"
                              data-price="${tiket.harga}"
                            >
                              Rp
                              <fmt:formatNumber
                                value="${tiket.harga}"
                                groupingUsed="true"
                              />
                            </span>
                          </div>
                        </div>

                        <!-- Action Buttons -->
                        <c:choose>
                          <c:when test="${not empty sessionScope.userName}">
                            <button
                              type="submit"
                              class="w-full bg-brand text-white py-3.5 rounded-lg font-bold hover:bg-blue-900 transition shadow-lg mb-3 flex items-center justify-center gap-2"
                            >
                              <i class="fas fa-ticket-alt"></i>
                              <span>Pesan Sekarang</span>
                            </button>
                          </c:when>
                          <c:otherwise>
                            <a
                              href="/login"
                              class="block w-full bg-brand text-white py-3.5 rounded-lg font-bold hover:bg-blue-900 transition shadow-lg mb-3 text-center"
                            >
                              Login untuk Memesan
                            </a>
                          </c:otherwise>
                        </c:choose>

                        <a
                          href="/dashboard/user"
                          class="block w-full text-center py-3 border border-gray-300 rounded-lg font-medium text-gray-700 hover:bg-gray-50 transition"
                        >
                          Lihat Tiket Lain
                        </a>
                      </form>
                    </c:when>
                    <c:otherwise>
                      <div class="text-center py-8">
                        <div
                          class="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4"
                        >
                          <i class="fas fa-times text-red-600 text-2xl"></i>
                        </div>
                        <p class="text-gray-600 font-medium mb-4">
                          Tiket tidak tersedia
                        </p>
                        <a
                          href="/dashboard/user"
                          class="text-brand hover:underline text-sm font-semibold"
                        >
                          Cari penerbangan lain
                        </a>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </div>

                <!-- Trust Badges -->
                <div class="bg-gray-50 px-6 py-4 border-t">
                  <div class="flex items-center gap-3 text-xs text-gray-600">
                    <i class="fas fa-shield-alt text-green-600"></i>
                    <span>Pembayaran aman & terpercaya</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:when>

        <c:otherwise>
          <!-- Tiket Not Found -->
          <div class="bg-white rounded-xl shadow-sm p-12 text-center">
            <div
              class="w-20 h-20 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4"
            >
              <i class="fas fa-plane-slash text-gray-400 text-3xl"></i>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-2">
              Tiket Tidak Ditemukan
            </h3>
            <p class="text-gray-600 mb-6">
              Maaf, tiket yang Anda cari tidak tersedia.
            </p>
            <a
              href="/dashboard/user"
              class="inline-block px-6 py-3 bg-brand text-white rounded-lg font-semibold hover:bg-blue-900 transition"
            >
              Kembali ke Dashboard
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </main>

    <!-- Footer -->
    <footer class="mt-16 py-8 border-t border-gray-200 text-center">
      <p class="text-xs text-gray-400 font-medium uppercase tracking-widest">
        &copy; 2024 FlyBook - Official Ticketing Platform
      </p>
    </footer>

    <script>
      function updateTotal() {
        const seats = parseInt(document.getElementById("seats").value);
        const pricePerSeat = parseInt(
          document.getElementById("totalPrice").getAttribute("data-price")
        );
        const total = seats * pricePerSeat;

        document.getElementById("seatCount").textContent = seats;
        document.getElementById("totalPrice").innerHTML =
          "Rp " + total.toLocaleString("id-ID");
      }
    </script>
  </body>
</html>
