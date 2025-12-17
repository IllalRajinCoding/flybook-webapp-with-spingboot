<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- Check if user is logged in and is admin --%>
<c:if test="${empty sessionScope.userName || sessionScope.userRole != 'admin'}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard - FlyBook</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
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
          <div class="flex items-center">
            <h1 class="text-xl font-bold text-gray-900">FlyBook Admin</h1>
          </div>
          <div class="flex items-center gap-4">
            <span class="text-sm text-gray-700">${sessionScope.userName}</span>
            <a href="/logout" class="text-sm text-gray-600 hover:text-gray-900">Logout</a>
          </div>
        </div>
      </div>
    </nav>

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Header -->
      <div class="mb-8">
        <h2 class="text-2xl font-bold text-gray-900">Dashboard</h2>
        <p class="text-gray-600 mt-1">Kelola tiket dan booking</p>
      </div>

      <!-- Stats -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
        <div class="bg-white rounded-lg p-6">
          <div class="text-sm text-gray-600 mb-1">Total Tiket</div>
          <div class="text-2xl font-bold text-gray-900">
            <c:choose>
              <c:when test="${not empty tikets}">${tikets.size()}</c:when>
              <c:otherwise>0</c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="bg-white rounded-lg p-6">
          <div class="text-sm text-gray-600 mb-1">Total Booking</div>
          <div class="text-2xl font-bold text-gray-900">
            <c:choose>
              <c:when test="${not empty bookings}">${bookings.size()}</c:when>
              <c:otherwise>0</c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="bg-white rounded-lg p-6">
          <div class="text-sm text-gray-600 mb-1">Kursi Tersedia</div>
          <div class="text-2xl font-bold text-gray-900">
            <c:set var="totalKursi" value="0" />
            <c:forEach var="tiket" items="${tikets}">
              <c:set var="totalKursi" value="${totalKursi + tiket.kursiTersedia - tiket.kursiTerjual}" />
            </c:forEach>
            ${totalKursi}
          </div>
        </div>
      </div>

      <!-- Booking Management -->
      <c:if test="${not empty bookings}">
      <div class="bg-white rounded-lg p-6 mb-8">
        <h3 class="text-lg font-semibold text-gray-900 mb-4">Manajemen Booking</h3>
        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b">
                <th class="px-4 py-3 text-left font-medium text-gray-700">Kode</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">User</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Tiket</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Penerbangan</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Kursi</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Total</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Status</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Aksi</th>
              </tr>
            </thead>
            <tbody class="divide-y">
              <c:forEach var="booking" items="${bookings}">
              <tr class="hover:bg-gray-50">
                <td class="px-4 py-3">
                  <div class="font-medium text-gray-900">${booking.bookingCode}</div>
                  <div class="text-xs text-gray-500">${booking.tanggalBooking}</div>
                </td>
                <td class="px-4 py-3 text-gray-900">${booking.userName}</td>
                <td class="px-4 py-3">
                  <div class="text-gray-900">${booking.nomorTiket}</div>
                  <div class="text-xs text-gray-500">${booking.maskapai}</div>
                </td>
                <td class="px-4 py-3">
                  <div class="text-gray-900">${booking.penerbangan}</div>
                  <div class="text-xs text-gray-500">${booking.tanggalBerangkat}</div>
                </td>
                <td class="px-4 py-3 text-gray-900">${booking.jumlahKursi}</td>
                <td class="px-4 py-3 font-medium text-gray-900">
                  Rp <fmt:formatNumber value="${booking.totalHarga}" type="number" groupingUsed="true"/>
                </td>
                <td class="px-4 py-3">
                  <form action="/dashboard/admin/booking/${booking.id}/status" method="post">
                    <select name="status" onchange="this.form.submit()" 
                            class="text-xs px-2 py-1 rounded font-medium cursor-pointer
                            ${booking.status == 'success' ? 'bg-green-50 text-green-700' : 
                              booking.status == 'pending' ? 'bg-yellow-50 text-yellow-700' : 
                              'bg-red-50 text-red-700'}">
                      <option value="pending" ${booking.status == 'pending' ? 'selected' : ''}>Pending</option>
                      <option value="success" ${booking.status == 'success' ? 'selected' : ''}>Berhasil</option>
                      <option value="failed" ${booking.status == 'failed' ? 'selected' : ''}>Gagal</option>
                    </select>
                  </form>
                </td>
                <td class="px-4 py-3">
                  <form action="/dashboard/admin/booking/${booking.id}/delete" method="post" 
                        onsubmit="return confirm('Hapus booking?')">
                    <button type="submit" class="text-red-600 hover:text-red-800 text-sm">
                      Hapus
                    </button>
                  </form>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
      </c:if>

      <!-- Tiket Management -->
      <div class="bg-white rounded-lg p-6">
        <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-4">
          <h3 class="text-lg font-semibold text-gray-900">Manajemen Tiket</h3>
          <div class="flex gap-2 w-full sm:w-auto">
            <input
              type="text"
              id="searchInput"
              placeholder="Cari..."
              class="flex-1 sm:flex-none px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
              onkeyup="filterTikets()"
            />
            <a href="/dashboard/admin/tiket/create"
               class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 whitespace-nowrap">
              Tambah
            </a>
          </div>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b">
                <th class="px-4 py-3 text-left font-medium text-gray-700">Nomor Tiket</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Maskapai</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Rute</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Jadwal</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Harga</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Kursi</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Status</th>
                <th class="px-4 py-3 text-left font-medium text-gray-700">Aksi</th>
              </tr>
            </thead>
            <tbody class="divide-y">
              <c:choose>
                <c:when test="${empty tikets}">
                  <tr>
                    <td colspan="8" class="py-12 text-center text-gray-500">
                      Belum ada tiket
                    </td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach var="tiket" items="${tikets}">
                    <tr class="hover:bg-gray-50 tiket-row" data-status="${tiket.status}">
                      <td class="px-4 py-3 nomor-tiket">
                        <div class="font-medium text-gray-900">${tiket.nomorTiket}</div>
                      </td>
                      <td class="px-4 py-3 maskapai">
                        <div class="text-gray-900">${tiket.maskapai}</div>
                        <div class="text-xs text-gray-500">${tiket.penerbangan}</div>
                      </td>
                      <td class="px-4 py-3 rute">
                        <div class="text-gray-900">${tiket.bandara_asal} → ${tiket.bandara_tujuan}</div>
                      </td>
                      <td class="px-4 py-3">
                        <div class="text-gray-900">${tiket.tanggalBerangkat}</div>
                        <div class="text-xs text-gray-500">${tiket.jamBerangkat} - ${tiket.jamTiba}</div>
                      </td>
                      <td class="px-4 py-3 font-medium text-gray-900">
                        Rp <fmt:formatNumber value="${tiket.harga}" groupingUsed="true" />
                      </td>
                      <td class="px-4 py-3 text-gray-900">
                        ${tiket.kursiTerjual}/${tiket.kursiTersedia}
                      </td>
                      <td class="px-4 py-3">
                        <c:choose>
                          <c:when test="${tiket.status == 'aktif'}">
                            <span class="text-xs px-2 py-1 bg-green-50 text-green-700 rounded font-medium">
                              Aktif
                            </span>
                          </c:when>
                          <c:when test="${tiket.status == 'nonaktif'}">
                            <span class="text-xs px-2 py-1 bg-red-50 text-red-700 rounded font-medium">
                              Non-aktif
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="text-xs px-2 py-1 bg-orange-50 text-orange-700 rounded font-medium">
                              Penuh
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td class="px-4 py-3">
                        <div class="flex gap-2">
                          <a href="/dashboard/admin/tiket/${tiket.id}/edit"
                             class="text-blue-600 hover:text-blue-800 text-sm">
                            Edit
                          </a>
                          <a href="/dashboard/admin/tiket/${tiket.id}/delete"
                             onclick="return confirm('Hapus tiket?')"
                             class="text-red-600 hover:text-red-800 text-sm">
                            Hapus
                          </a>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
      </div>
    </main>

    <script>
      function filterTikets() {
        const searchInput = document.getElementById("searchInput").value.toLowerCase();
        const rows = document.querySelectorAll(".tiket-row");

        rows.forEach((row) => {
          const nomorTiket = row.querySelector(".nomor-tiket").textContent.toLowerCase();
          const maskapai = row.querySelector(".maskapai").textContent.toLowerCase();
          const rute = row.querySelector(".rute").textContent.toLowerCase();

          if (nomorTiket.includes(searchInput) || maskapai.includes(searchInput) || rute.includes(searchInput)) {
            row.style.display = "";
          } else {
            row.style.display = "none";
          }
        });
      }
    </script>
  </body>
</html>
