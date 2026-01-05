<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- Check if user is logged in --%>
<c:if test="${empty sessionScope.userName}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard - FlyBook</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <script src="https://cdn.tailwindcss.com">
      </link>
          <script>
            tailwind.config = {
              theme: {
                extend: {
                  fontFamily: { sans: ["Inter", "sans-serif"] },
                },
              },
            };
    </script>
  </head>
  <body class="bg-gray-50 font-sans">
    <!-- Navbar -->
    <nav class="bg-white border-b sticky top-0 z-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
          <div class="flex items-center gap-2">
            <i class="fas fa-plane-departure text-blue-600 text-lg"></i>
            <h1 class="text-xl font-bold text-gray-900">FlyBook</h1>
          </div>
          <div class="flex items-center gap-4">
            <span class="text-sm text-gray-700 flex items-center gap-2">
              <i class="fas fa-user-circle"></i>
              ${sessionScope.userName}
            </span>
            <a
              href="/logout"
              class="text-sm text-gray-600 hover:text-gray-900 flex items-center gap-2"
            >
              <i class="fas fa-sign-out-alt"></i>
              <span>Logout</span>
            </a>
          </div>
        </div>
      </div>
    </nav>

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Header -->
      <div class="mb-8">
        <h2 class="text-2xl font-bold text-gray-900">Dashboard</h2>
        <p class="text-gray-600 mt-1">Kelola pemesanan tiket Anda</p>
      </div>

      <!-- My Bookings Section -->
      <c:if test="${not empty bookings}">
        <div class="mb-8">
          <h3 class="text-lg font-semibold text-gray-900 mb-4">Pesanan Saya</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <c:forEach var="booking" items="${bookings}">
              <div
                class="bg-white rounded-lg p-6 hover:shadow-md transition-shadow"
              >
                <div class="flex justify-between items-start mb-4">
                  <div>
                    <div class="text-xs text-gray-500">Kode Booking</div>
                    <div class="font-semibold text-gray-900">
                      ${booking.bookingCode}
                    </div>
                  </div>
                  <c:choose>
                    <c:when test="${booking.status == 'success'}">
                      <span
                        class="px-2 py-1 bg-green-50 text-green-700 text-xs font-medium rounded"
                      >
                        Berhasil
                      </span>
                    </c:when>
                    <c:when test="${booking.status == 'pending'}">
                      <span
                        class="px-2 py-1 bg-yellow-50 text-yellow-700 text-xs font-medium rounded"
                      >
                        Pending
                      </span>
                    </c:when>
                    <c:otherwise>
                      <span
                        class="px-2 py-1 bg-red-50 text-red-700 text-xs font-medium rounded"
                      >
                        Gagal
                      </span>
                    </c:otherwise>
                  </c:choose>
                </div>

                <div class="space-y-3">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      ${booking.penerbangan}
                    </div>
                    <div class="text-xs text-gray-500">${booking.maskapai}</div>
                  </div>

                  <div class="grid grid-cols-2 gap-2 text-xs">
                    <div>
                      <div class="text-gray-500">Tanggal</div>
                      <div class="text-gray-900">
                        ${booking.tanggalBerangkat}
                      </div>
                    </div>
                    <div>
                      <div class="text-gray-500">Waktu</div>
                      <div class="text-gray-900">${booking.jamBerangkat}</div>
                    </div>
                  </div>

                  <div class="pt-3 border-t flex justify-between items-center">
                    <div>
                      <div class="text-xs text-gray-500">Total</div>
                      <div class="text-sm font-semibold text-gray-900">
                        Rp
                        <fmt:formatNumber
                          value="${booking.totalHarga}"
                          type="number"
                          groupingUsed="true"
                        />
                      </div>
                    </div>
                    <div class="text-xs text-gray-500">
                      ${booking.jumlahKursi} kursi
                    </div>
                  </div>

                  <div class="mt-4 pt-4 border-t">
                    <a
                      href="/dashboard/tiket/${booking.tiketId}"
                      class="w-full inline-flex items-center justify-center gap-2 px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition"
                    >
                      <i class="fas fa-info-circle"></i>
                      <span>Lihat Detail</span>
                    </a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </c:if>

      <!-- Available Flights -->
      <div>
        <div
          class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-4"
        >
          <h3 class="text-lg font-semibold text-gray-900">Tiket Tersedia</h3>
          <div class="flex gap-2 w-full sm:w-auto">
            <input
              type="text"
              id="searchTiket"
              placeholder="Cari..."
              class="flex-1 sm:flex-none px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
              onkeyup="filterTiket()"
            />
          </div>
        </div>

        <div class="space-y-4">
          <c:choose>
            <c:when test="${empty tikets}">
              <div class="bg-white rounded-lg p-12 text-center">
                <p class="text-gray-500">Belum ada tiket tersedia</p>
              </div>
            </c:when>
            <c:otherwise>
              <c:forEach var="tiket" items="${tikets}">
                <c:if test="${tiket.status == 'aktif'}">
                  <div
                    class="bg-white rounded-lg p-6 hover:shadow-md transition-shadow tiket-card"
                    data-maskapai="${tiket.maskapai}"
                    data-rute="${tiket.bandara_asal} ${tiket.bandara_tujuan}"
                  >
                    <div
                      class="flex flex-col lg:flex-row lg:items-center justify-between gap-6"
                    >
                      <!-- Flight Info -->
                      <div class="flex-1">
                        <div class="flex items-center gap-3 mb-4">
                          <div class="font-semibold text-gray-900">
                            ${tiket.maskapai}
                          </div>
                          <span
                            class="text-xs px-2 py-1 bg-green-50 text-green-700 rounded"
                          >
                            ${tiket.kursiTersedia - tiket.kursiTerjual} kursi
                          </span>
                        </div>

                        <div class="grid grid-cols-3 gap-4 items-center">
                          <div>
                            <div class="text-xs text-gray-500 mb-1">Dari</div>
                            <div class="text-lg font-semibold text-gray-900">
                              ${tiket.bandara_asal}
                            </div>
                            <div class="text-sm text-gray-600">
                              ${tiket.jamBerangkat}
                            </div>
                          </div>

                          <div class="text-center">
                            <div class="text-xs text-gray-400">→</div>
                          </div>

                          <div>
                            <div class="text-xs text-gray-500 mb-1">Ke</div>
                            <div class="text-lg font-semibold text-gray-900">
                              ${tiket.bandara_tujuan}
                            </div>
                            <div class="text-sm text-gray-600">
                              ${tiket.jamTiba}
                            </div>
                          </div>
                        </div>

                        <div class="mt-3 text-xs text-gray-500">
                          ${tiket.tanggalBerangkat}
                        </div>
                      </div>

                      <!-- Price & Action -->
                      <div
                        class="flex flex-row lg:flex-col items-center lg:items-end justify-between lg:justify-center gap-4"
                      >
                        <div class="text-right">
                          <div class="text-xs text-gray-500 mb-1">Harga</div>
                          <div class="text-xl font-bold text-gray-900">
                            Rp
                            <fmt:formatNumber
                              value="${tiket.harga}"
                              groupingUsed="true"
                            />
                          </div>
                        </div>
                        <div class="flex gap-2">
                          <a
                            href="/dashboard/tiket/${tiket.id}"
                            class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50"
                          >
                            Detail
                          </a>
                          <a
                            href="/dashboard/user/tiket/${tiket.id}/book"
                            class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700"
                          >
                            Pesan
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:if>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </main>

    <script>
      function filterTiket() {
        const searchValue = document
          .getElementById("searchTiket")
          .value.toLowerCase();
        const cards = document.querySelectorAll(".tiket-card");

        cards.forEach((card) => {
          const maskapai = card.getAttribute("data-maskapai").toLowerCase();
          const rute = card.getAttribute("data-rute").toLowerCase();

          if (rute.includes(searchValue) || maskapai.includes(searchValue)) {
            card.style.display = "";
          } else {
            card.style.display = "none";
          }
        });
      }
    </script>
  </body>
</html>
