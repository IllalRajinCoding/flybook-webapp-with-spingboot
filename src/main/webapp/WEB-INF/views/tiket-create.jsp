<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Check if user is logged in and is admin --%>
<c:if test="${empty sessionScope.userName || sessionScope.userRole != 'admin'}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tambah Tiket - FlyBook Admin</title>
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

    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      
      <div class="mb-6">
        <a href="/dashboard/admin" class="text-sm text-blue-600 hover:text-blue-800 mb-2 inline-flex items-center gap-1">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>
            Kembali ke Dashboard
        </a>
        <h2 class="text-2xl font-bold text-gray-900">Tambah Tiket Baru</h2>
        <p class="text-gray-600 mt-1">Masukkan detail penerbangan di bawah ini</p>
      </div>

      <div class="bg-white rounded-lg p-6 max-w-4xl">
        <form action="/dashboard/admin/tiket/store" method="post">
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div class="space-y-4">
                    <h3 class="font-semibold text-gray-900 border-b pb-2">Informasi Penerbangan</h3>
                    
                    <div>
                        <label for="nomorTiket" class="block text-sm font-medium text-gray-700 mb-1">Nomor Tiket</label>
                        <input type="text" id="nomorTiket" name="nomorTiket" required placeholder="Contoh: GA-101"
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                    </div>

                    <div>
                        <label for="maskapai" class="block text-sm font-medium text-gray-700 mb-1">Maskapai</label>
                        <input type="text" id="maskapai" name="maskapai" required placeholder="Garuda Indonesia"
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                    </div>

                    <div>
                        <label for="penerbangan" class="block text-sm font-medium text-gray-700 mb-1">Kode Penerbangan</label>
                        <input type="text" id="penerbangan" name="penerbangan" required placeholder="GA-101"
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="bandaraAsal" class="block text-sm font-medium text-gray-700 mb-1">Bandara Asal</label>
                            <input type="text" id="bandaraAsal" name="bandara_asal" required placeholder="Jakarta (CGK)"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                        </div>
                        <div>
                            <label for="bandaraTujuan" class="block text-sm font-medium text-gray-700 mb-1">Bandara Tujuan</label>
                            <input type="text" id="bandaraTujuan" name="bandara_tujuan" required placeholder="Bali (DPS)"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                        </div>
                    </div>
                </div>

                <div class="space-y-4">
                    <h3 class="font-semibold text-gray-900 border-b pb-2">Jadwal & Harga</h3>

                    <div>
                        <label for="tanggalBerangkat" class="block text-sm font-medium text-gray-700 mb-1">Tanggal Berangkat</label>
                        <input type="date" id="tanggalBerangkat" name="tanggalBerangkat" required
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition text-gray-600" />
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="jamBerangkat" class="block text-sm font-medium text-gray-700 mb-1">Jam Berangkat</label>
                            <input type="time" id="jamBerangkat" name="jamBerangkat" required
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition text-gray-600" />
                        </div>
                        <div>
                            <label for="jamTiba" class="block text-sm font-medium text-gray-700 mb-1">Jam Tiba</label>
                            <input type="time" id="jamTiba" name="jamTiba" required
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition text-gray-600" />
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="harga" class="block text-sm font-medium text-gray-700 mb-1">Harga (Rp)</label>
                            <input type="number" id="harga" name="harga" required placeholder="1000000"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                        </div>
                        <div>
                            <label for="kursiTersedia" class="block text-sm font-medium text-gray-700 mb-1">Jumlah Kursi</label>
                            <input type="number" id="kursiTersedia" name="kursiTersedia" required placeholder="100"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                        </div>
                    </div>

                    <div>
                        <label for="status" class="block text-sm font-medium text-gray-700 mb-1">Status</label>
                        <select id="status" name="status" required
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition bg-white">
                            <option value="aktif">Aktif</option>
                            <option value="nonaktif">Non-aktif</option>
                            <option value="penuh">Penuh</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="flex items-center justify-end gap-3 pt-4 border-t mt-4">
                <a href="/dashboard/admin" class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                    Batal
                </a>
                <button type="submit" class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                    Simpan Tiket
                </button>
            </div>

        </form>
      </div>
    </main>
  </body>
</html>