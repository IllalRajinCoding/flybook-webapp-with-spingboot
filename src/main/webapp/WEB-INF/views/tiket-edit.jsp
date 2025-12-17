<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="id" class="scroll-smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Tiket - FlyBook Admin</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
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
            fontFamily: { sans: ["Poppins", "sans-serif"] },
          },
        },
      };
    </script>
</head>
<body class="bg-stone-50 font-sans antialiased">
    <!-- Sidebar -->
    <aside class="fixed left-0 top-0 h-screen w-64 bg-stone-900 text-white p-6 z-40">
      <div class="flex items-center gap-2 mb-10">
        <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-stone-900">
          <i class="fas fa-plane text-sm"></i>
        </div>
        <div>
          <span class="font-bold text-xl block">FlyBook.</span>
          <span class="text-xs text-stone-400">Admin Panel</span>
        </div>
      </div>

      <nav class="space-y-2">
        <a href="/dashboard/admin" class="flex items-center gap-3 px-4 py-3 rounded-xl hover:bg-white/10 text-white font-medium">
          <i class="fas fa-home w-5"></i>
          <span>Dashboard</span>
        </a>
        <a href="/dashboard/admin/tiket/create" class="flex items-center gap-3 px-4 py-3 rounded-xl bg-white/10 text-white font-medium">
          <i class="fas fa-plane w-5"></i>
          <span>Tiket</span>
        </a>
      </nav>

      <button onclick="logout()" class="w-full mt-10 bg-red-600 hover:bg-red-700 px-4 py-3 rounded-xl font-medium flex items-center justify-center gap-2">
        <i class="fas fa-sign-out-alt"></i>
        Logout
      </button>
    </aside>

    <!-- Main Content -->
    <main class="ml-64 p-8">
      <div class="max-w-2xl">
        <!-- Header -->
        <div class="mb-8">
          <div class="flex items-center gap-3 mb-2">
            <a href="/dashboard/admin" class="text-stone-500 hover:text-stone-700">
              <i class="fas fa-arrow-left"></i>
            </a>
            <h1 class="text-3xl font-bold text-stone-900">Edit Tiket</h1>
          </div>
          <p class="text-stone-600">Ubah informasi tiket penerbangan</p>
        </div>

        <!-- Form Card -->
        <div class="bg-white rounded-2xl shadow-sm p-8">
          <form action="/dashboard/admin/tiket/${tiket.id}/update" method="post" class="space-y-6">
            <!-- Nomor Tiket -->
            <div>
              <label for="nomorTiket" class="block text-sm font-medium text-stone-900 mb-2">
                Nomor Tiket <span class="text-red-500">*</span>
              </label>
              <input type="text" id="nomorTiket" name="nomorTiket" required value="${tiket.nomorTiket}"
                class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <!-- Penerbangan -->
            <div>
              <label for="penerbangan" class="block text-sm font-medium text-stone-900 mb-2">
                Penerbangan <span class="text-red-500">*</span>
              </label>
              <input type="text" id="penerbangan" name="penerbangan" required value="${tiket.penerbangan}"
                class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <!-- Maskapai -->
            <div>
              <label for="maskapai" class="block text-sm font-medium text-stone-900 mb-2">
                Maskapai <span class="text-red-500">*</span>
              </label>
              <input type="text" id="maskapai" name="maskapai" required value="${tiket.maskapai}"
                class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <!-- Row 1: Bandara Asal & Tujuan -->
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label for="bandaraAsal" class="block text-sm font-medium text-stone-900 mb-2">
                  Bandara Asal <span class="text-red-500">*</span>
                </label>
                <input type="text" id="bandaraAsal" name="bandara_asal" required value="${tiket.bandara_asal}"
                  class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label for="bandaraTujuan" class="block text-sm font-medium text-stone-900 mb-2">
                  Bandara Tujuan <span class="text-red-500">*</span>
                </label>
                <input type="text" id="bandaraTujuan" name="bandara_tujuan" required value="${tiket.bandara_tujuan}"
                  class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
              </div>
            </div>

            <!-- Row 2: Tanggal & Jam -->
            <div class="grid grid-cols-3 gap-4">
              <div>
                <label for="tanggalBerangkat" class="block text-sm font-medium text-stone-900 mb-2">
                  Tanggal Berangkat <span class="text-red-500">*</span>
                </label>
                <input type="date" id="tanggalBerangkat" name="tanggalBerangkat" required value="${tiket.tanggalBerangkat}"
                  class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label for="jamBerangkat" class="block text-sm font-medium text-stone-900 mb-2">
                  Jam Berangkat <span class="text-red-500">*</span>
                </label>
                <input type="time" id="jamBerangkat" name="jamBerangkat" required value="${tiket.jamBerangkat}"
                  class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label for="jamTiba" class="block text-sm font-medium text-stone-900 mb-2">
                  Jam Tiba <span class="text-red-500">*</span>
                </label>
                <input type="time" id="jamTiba" name="jamTiba" required value="${tiket.jamTiba}"
                  class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
              </div>
            </div>

            <!-- Row 3: Harga & Kursi -->
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label for="harga" class="block text-sm font-medium text-stone-900 mb-2">
                  Harga (Rp) <span class="text-red-500">*</span>
                </label>
                <input type="number" id="harga" name="harga" step="10000" required value="${tiket.harga}"
                  class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
              </div>
              <div>
                <label for="kursiTersedia" class="block text-sm font-medium text-stone-900 mb-2">
                  Jumlah Kursi <span class="text-red-500">*</span>
                </label>
                <input type="number" id="kursiTersedia" name="kursiTersedia" required min="1" value="${tiket.kursiTersedia}"
                  class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
              </div>
            </div>

            <!-- Kursi Terjual -->
            <div>
              <label for="kursiTerjual" class="block text-sm font-medium text-stone-900 mb-2">
                Kursi Terjual
              </label>
              <input type="number" id="kursiTerjual" name="kursiTerjual" value="${tiket.kursiTerjual}"
                class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <!-- Status -->
            <div>
              <label for="status" class="block text-sm font-medium text-stone-900 mb-2">
                Status <span class="text-red-500">*</span>
              </label>
              <select id="status" name="status" required
                class="w-full px-4 py-3 border border-stone-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
                <option value="aktif" ${tiket.status == 'aktif' ? 'selected' : ''}>Aktif</option>
                <option value="nonaktif" ${tiket.status == 'nonaktif' ? 'selected' : ''}>Non-aktif</option>
                <option value="penuh" ${tiket.status == 'penuh' ? 'selected' : ''}>Penuh</option>
              </select>
            </div>

            <!-- Buttons -->
            <div class="flex gap-4 pt-6">
              <button type="submit" class="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-medium py-3 rounded-xl transition">
                <i class="fas fa-check mr-2"></i>Simpan Perubahan
              </button>
              <a href="/dashboard/admin" class="flex-1 bg-stone-300 hover:bg-stone-400 text-stone-900 font-medium py-3 rounded-xl transition text-center">
                <i class="fas fa-times mr-2"></i>Batal
              </a>
            </div>
          </form>
        </div>
      </div>
    </main>

    <script>
      function logout() {
        if (confirm('Apakah Anda yakin ingin logout?')) {
          window.location.href = '/logout';
        }
      }
    </script>
</body>
</html>
