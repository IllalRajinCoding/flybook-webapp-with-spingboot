<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detail Tiket - FlyBook</title>
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
            <h1 class="text-xl font-bold text-gray-900">FlyBook</h1>
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
        <div class="mb-6">
            <a href="/dashboard/user" class="text-sm text-blue-600 hover:text-blue-800 mb-2 inline-block">
                ← Kembali ke Dashboard
            </a>
            <h2 class="text-2xl font-bold text-gray-900">Detail Tiket</h2>
            <p class="text-gray-600 mt-1">Informasi lengkap penerbangan</p>
        </div>

        <c:if test="${not empty tiket}">
          <!-- Ticket Card -->
          <div class="bg-white rounded-lg p-6">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
              <!-- Left Column -->
              <div class="space-y-6">
                <!-- Header Info -->
                <div class="border-b pb-4">
                  <div class="flex justify-between items-start mb-2">
                    <div>
                      <h3 class="text-xl font-bold text-gray-900">${tiket.maskapai}</h3>
                      <p class="text-sm text-gray-600">${tiket.nomorTiket}</p>
                    </div>
                    <span class="text-xs px-2 py-1 rounded font-medium 
                      <c:if test="${tiket.status == 'aktif'}">bg-green-50 text-green-700</c:if>
                      <c:if test="${tiket.status == 'nonaktif'}">bg-red-50 text-red-700</c:if>
                      <c:if test="${tiket.status == 'penuh'}">bg-orange-50 text-orange-700</c:if>">
                      ${tiket.status}
                    </span>
                  </div>
                </div>

                <!-- Route Info -->
                <div class="grid grid-cols-3 gap-4 items-center">
                  <div>
                    <p class="text-xs text-gray-500 mb-1">Dari</p>
                    <p class="text-lg font-semibold text-gray-900">${tiket.bandara_asal}</p>
                    <p class="text-sm text-gray-600">${tiket.jamBerangkat}</p>
                  </div>
                  <div class="text-center text-gray-400">
                    →
                  </div>
                  <div>
                    <p class="text-xs text-gray-500 mb-1">Ke</p>
                    <p class="text-lg font-semibold text-gray-900">${tiket.bandara_tujuan}</p>
                    <p class="text-sm text-gray-600">${tiket.jamTiba}</p>
                  </div>
                </div>

                <!-- Date Info -->
                <div class="bg-gray-50 rounded-lg p-4">
                  <p class="text-xs text-gray-500 mb-1">Tanggal Penerbangan</p>
                  <p class="text-base font-semibold text-gray-900">${tiket.tanggalBerangkat}</p>
                </div>
              </div>

              <!-- Right Column -->
              <div class="space-y-6">
                <!-- Pricing Info -->
                <div class="bg-blue-600 rounded-lg p-6 text-white">
                  <p class="text-sm text-blue-100 mb-2">Harga Per Tiket</p>
                  <p class="text-3xl font-bold">
                    Rp <fmt:formatNumber value="${tiket.harga}" groupingUsed="true"/>
                  </p>
                </div>

                <!-- Seat Info -->
                <div class="grid grid-cols-2 gap-4">
                  <div class="bg-gray-50 rounded-lg p-4">
                    <p class="text-xs text-gray-500 mb-1">Tersedia</p>
                    <p class="text-2xl font-bold text-gray-900">${tiket.kursiTersedia}</p>
                  </div>
                  <div class="bg-gray-50 rounded-lg p-4">
                    <p class="text-xs text-gray-500 mb-1">Terjual</p>
                    <p class="text-2xl font-bold text-gray-900">${tiket.kursiTerjual}</p>
                  </div>
                </div>

                <!-- Seat Status -->
                <div class="bg-gray-50 rounded-lg p-4">
                  <p class="text-xs text-gray-500 mb-2">Ketersediaan Kursi</p>
                  <div class="w-full bg-gray-200 rounded-full h-2">
                    <div class="bg-blue-600 h-2 rounded-full" style="width: ${(tiket.kursiTerjual / tiket.kursiTersedia) * 100}%"></div>
                  </div>
                  <p class="text-xs text-gray-500 mt-2">${tiket.kursiTerjual} dari ${tiket.kursiTersedia} kursi</p>
                </div>
              </div>
            </div>

            <!-- Booking Section -->
            <div class="mt-6 pt-6 border-t">
              <c:if test="${availableSeats > 0}">
                <div class="bg-gray-50 rounded-lg p-6">
                  <h3 class="text-base font-semibold text-gray-900 mb-4">Pesan Tiket</h3>
                  <form action="/dashboard/user/tiket/${tiket.id}/book" method="get" class="flex flex-col sm:flex-row gap-4">
                    <div class="flex-1">
                      <label for="seats" class="block text-sm text-gray-700 mb-2">
                        Jumlah Kursi
                      </label>
                      <select id="seats" name="seats" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none">
                        <c:forEach var="i" begin="1" end="${availableSeats}">
                          <option value="${i}">${i} Kursi</option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="flex items-end">
                      <button type="submit" class="w-full sm:w-auto px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg">
                        Pesan Sekarang
                      </button>
                    </div>
                  </form>
                </div>
              </c:if>
              <c:if test="${availableSeats <= 0}">
                <div class="bg-red-50 border border-red-200 rounded-lg p-4">
                  <p class="text-red-900 font-medium mb-1">Tiket Habis</p>
                  <p class="text-red-700 text-sm">Maaf, tiket untuk penerbangan ini sudah penuh.</p>
                </div>
              </c:if>
            </div>
          </div>
        </c:if>

        <c:if test="${empty tiket}">
          <div class="bg-white rounded-lg p-12 text-center">
            <p class="text-gray-500 mb-4">Tiket tidak ditemukan</p>
            <a href="/dashboard/user" class="inline-block px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg">
              Kembali ke Dashboard
            </a>
          </div>
        </c:if>
    </main>
</body>
</html>
