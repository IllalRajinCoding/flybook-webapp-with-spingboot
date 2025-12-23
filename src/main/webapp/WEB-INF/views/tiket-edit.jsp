<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Check Session --%>
<c:if test="${empty sessionScope.userName || sessionScope.userRole != 'admin'}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Tiket - FlyBook Admin</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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
  <body class="bg-gray-50 font-sans antialiased">
    
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
            <i class="fas fa-arrow-left"></i> Kembali ke Dashboard
        </a>
        <div class="flex items-center gap-3">
            <h2 class="text-2xl font-bold text-gray-900">Edit Tiket</h2>
            <span class="px-2 py-1 text-xs font-mono bg-gray-200 text-gray-600 rounded">${tiket.nomorTiket}</span>
        </div>
        <p class="text-gray-600 mt-1">Perbarui informasi penerbangan</p>
      </div>

      <div class="bg-white rounded-lg shadow-sm border border-gray-100 p-6 md:p-8 max-w-4xl">
        <form action="/dashboard/admin/tiket/${tiket.id}/update" method="post">
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-6">
                
                <div class="space-y-5">
                    <h3 class="text-sm font-bold text-gray-900 uppercase tracking-wide border-b pb-2">Detail Penerbangan</h3>
                    
                    <div>
                        <label for="nomorTiket" class="block text-sm font-medium text-gray-700 mb-1">Nomor Tiket <span class="text-red-500">*</span></label>
                        <input type="text" id="nomorTiket" name="nomorTiket" required value="${tiket.nomorTiket}"
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                    </div>

                    <div>
                        <label for="penerbangan" class="block text-sm font-medium text-gray-700 mb-1">Kode Penerbangan <span class="text-red-500">*</span></label>
                        <input type="text" id="penerbangan" name="penerbangan" required value="${tiket.penerbangan}"
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                    </div>

                    <div>
                        <label for="maskapai" class="block text-sm font-medium text-gray-700 mb-1">Maskapai <span class="text-red-500">*</span></label>
                        <input type="text" id="maskapai" name="maskapai" required value="${tiket.maskapai}"
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="bandaraAsal" class="block text-sm font-medium text-gray-700 mb-1">Bandara Asal</label>
                            <input type="text" id="bandaraAsal" name="bandara_asal" required value="${tiket.bandara_asal}"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                        </div>
                        <div>
                            <label for="bandaraTujuan" class="block text-sm font-medium text-gray-700 mb-1">Bandara Tujuan</label>
                            <input type="text" id="bandaraTujuan" name="bandara_tujuan" required value="${tiket.bandara_tujuan}"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                        </div>
                    </div>
                </div>

                <div class="space-y-5">
                    <h3 class="text-sm font-bold text-gray-900 uppercase tracking-wide border-b pb-2">Jadwal & Status</h3>

                    <div>
                        <label for="tanggalBerangkat" class="block text-sm font-medium text-gray-700 mb-1">Tanggal Berangkat</label>
                        <input type="date" id="tanggalBerangkat" name="tanggalBerangkat" required value="${tiket.tanggalBerangkat}"
                            class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition text-gray-700" />
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="jamBerangkat" class="block text-sm font-medium text-gray-700 mb-1">Jam Berangkat</label>
                            <input type="time" id="jamBerangkat" name="jamBerangkat" required value="${tiket.jamBerangkat}"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition text-gray-700" />
                        </div>
                        <div>
                            <label for="jamTiba" class="block text-sm font-medium text-gray-700 mb-1">Jam Tiba</label>
                            <input type="time" id="jamTiba" name="jamTiba" required value="${tiket.jamTiba}"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition text-gray-700" />
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="harga" class="block text-sm font-medium text-gray-700 mb-1">Harga (Rp)</label>
                            <input type="number" id="harga" name="harga" required step="10000" value="${tiket.harga}"
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition" />
                        </div>
                        <div>
                            <label for="status" class="block text-sm font-medium text-gray-700 mb-1">Status</label>
                            <select id="status" name="status" required
                                class="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition bg-white">
                                <option value="aktif" ${tiket.status == 'aktif' ? 'selected' : ''}>Aktif</option>
                                <option value="nonaktif" ${tiket.status == 'nonaktif' ? 'selected' : ''}>Non-aktif</option>
                                <option value="penuh" ${tiket.status == 'penuh' ? 'selected' : ''}>Penuh</option>
                            </select>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4 bg-gray-50 p-4 rounded-lg border border-gray-200">
                        <div>
                            <label for="kursiTersedia" class="block text-xs font-semibold text-gray-500 uppercase mb-1">Total Kursi</label>
                            <input type="number" id="kursiTersedia" name="kursiTersedia" required min="1" value="${tiket.kursiTersedia}"
                                class="w-full px-3 py-1.5 text-sm border border-gray-300 rounded focus:ring-1 focus:ring-blue-500 outline-none" />
                        </div>
                        <div>
                            <label for="kursiTerjual" class="block text-xs font-semibold text-gray-500 uppercase mb-1">Terjual (Manual)</label>
                            <input type="number" id="kursiTerjual" name="kursiTerjual" value="${tiket.kursiTerjual}"
                                class="w-full px-3 py-1.5 text-sm border border-gray-300 rounded focus:ring-1 focus:ring-blue-500 outline-none" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="flex items-center justify-end gap-3 pt-6 border-t border-gray-100">
                <a href="/dashboard/admin" class="px-5 py-2.5 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-200 transition">
                    Batal
                </a>
                <button type="submit" class="px-5 py-2.5 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 shadow-sm transition flex items-center gap-2">
                    <i class="fas fa-save"></i> Simpan Perubahan
                </button>
            </div>

        </form>
      </div>
    </main>
  </body>
</html>