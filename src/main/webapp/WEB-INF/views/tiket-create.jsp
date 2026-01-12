<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${empty sessionScope.userName || sessionScope.userRole != 'admin'}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tambah Tiket | FlyBook Portal</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.4.19/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <script>
      tailwind.config = {
        theme: {
          extend: {
            fontFamily: { sans: ["Plus Jakarta Sans", "sans-serif"] },
            colors: {
                brand: "#1e40af", // Deep Blue
                accent: "#2563eb",
            }
          },
        },
      };
    </script>
    <style>
        body { background-color: #f8fafc; color: #0f172a; }
        .pro-card { background: white; border: 1px solid #e2e8f0; border-radius: 0.5rem; }
        .form-label { color: #0f172a; font-weight: 700; font-size: 0.875rem; margin-bottom: 0.5rem; display: block; }
        .pro-input { 
            border: 1px solid #cbd5e1 !important; 
            border-radius: 0.375rem !important;
            transition: all 0.2s;
            font-weight: 500;
        }
        .pro-input:focus { 
            border-color: #2563eb !important; 
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1); 
            outline: none;
        }
    </style>
</head>
<body class="antialiased min-h-screen">

    <nav class="bg-white border-b border-slate-200 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 h-16 flex justify-between items-center">
            <div class="flex items-center gap-3">
                <div class="bg-brand p-1.5 rounded text-white">
                    <i class="fas fa-plane-up text-sm"></i>
                </div>
                <span class="text-lg font-black tracking-tighter text-slate-900">FlyBook <span class="text-accent italic">Admin</span></span>
            </div>
            
            <div class="flex items-center gap-4">
                <div class="text-right hidden sm:block">
                    <p class="text-xs font-black text-slate-900 leading-none">${sessionScope.userName}</p>
                    <p class="text-[10px] text-slate-400 font-bold uppercase tracking-tighter">System Administrator</p>
                </div>
                <div class="w-9 h-9 bg-slate-100 border border-slate-200 rounded flex items-center justify-center font-bold text-slate-700">
                    ${sessionScope.userName.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>
    </nav>

    <main class="max-w-4xl mx-auto px-6 py-12">
        <div class="mb-8">
            <a href="/dashboard/admin" class="text-accent text-sm font-bold hover:underline inline-flex items-center gap-2 mb-4">
                <i class="fas fa-arrow-left text-xs"></i> Kembali ke Dashboard
            </a>
            <h2 class="text-3xl font-black text-slate-950 tracking-tight">Buat Unit Penerbangan Baru</h2>
            <p class="text-slate-500 font-medium mt-1 text-sm">Input data penerbangan dengan teliti sebelum dipublikasikan ke sistem.</p>
        </div>

        <div class="pro-card shadow-sm overflow-hidden">
            <form action="/dashboard/admin/tiket/store" method="post" class="divide-y divide-slate-100">
                
                <div class="p-8 md:p-10">
                    <div class="flex items-center gap-3 mb-8">
                        <span class="w-6 h-6 rounded bg-slate-950 text-white flex items-center justify-center text-[10px] font-bold">01</span>
                        <h3 class="font-black text-slate-900 uppercase tracking-wider text-sm">Informasi Armada & Rute</h3>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="form-control w-full">
                            <label class="form-label">Nomor Penerbangan (Flight No.)</label>
                            <input type="text" name="nomorTiket" required placeholder="Contoh: GA-101" class="input input-bordered pro-input w-full" />
                        </div>
                        
                        <div class="form-control w-full">
                            <label class="form-label">Nama Maskapai</label>
                            <input type="text" name="maskapai" required placeholder="Contoh: Garuda Indonesia" class="input input-bordered pro-input w-full" />
                        </div>

                        <div class="form-control md:col-span-2">
                            <label class="form-label">Model Pesawat / Kode Pesawat</label>
                            <input type="text" name="penerbangan" required placeholder="Contoh: Boeing 737-800NG" class="input input-bordered pro-input w-full" />
                        </div>

                        <div class="form-control">
                            <label class="form-label">Kota Asal (Departure)</label>
                            <div class="relative">
                                <i class="fas fa-plane-departure absolute left-3 top-3.5 text-slate-300 text-sm"></i>
                                <input type="text" name="bandara_asal" required placeholder="Jakarta (CGK)" class="input input-bordered pro-input w-full pl-10" />
                            </div>
                        </div>

                        <div class="form-control">
                            <label class="form-label">Kota Tujuan (Arrival)</label>
                            <div class="relative">
                                <i class="fas fa-plane-arrival absolute left-3 top-3.5 text-slate-300 text-sm"></i>
                                <input type="text" name="bandara_tujuan" required placeholder="Bali (DPS)" class="input input-bordered pro-input w-full pl-10" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="p-8 md:p-10 bg-slate-50/30">
                    <div class="flex items-center gap-3 mb-8">
                        <span class="w-6 h-6 rounded bg-slate-950 text-white flex items-center justify-center text-[10px] font-bold">02</span>
                        <h3 class="font-black text-slate-900 uppercase tracking-wider text-sm">Jadwal, Harga & Kapasitas</h3>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="form-control md:col-span-3">
                            <label class="form-label">Tanggal Keberangkatan</label>
                            <input type="date" name="tanggalBerangkat" required class="input input-bordered pro-input w-full" />
                        </div>

                        <div class="form-control">
                            <label class="form-label">Waktu Berangkat</label>
                            <input type="time" name="jamBerangkat" required class="input input-bordered pro-input w-full" />
                        </div>

                        <div class="form-control">
                            <label class="form-label">Estimasi Tiba</label>
                            <input type="time" name="jamTiba" required class="input input-bordered pro-input w-full" />
                        </div>

                        <div class="form-control">
                            <label class="form-label">Harga Tiket (IDR)</label>
                            <input type="number" name="harga" required placeholder="0" class="input input-bordered pro-input w-full font-bold text-accent" />
                        </div>

                        <div class="form-control">
                            <label class="form-label">Kapasitas Kursi</label>
                            <input type="number" name="kursiTersedia" required placeholder="Contoh: 180" class="input input-bordered pro-input w-full" />
                        </div>

                        <div class="form-control md:col-span-2">
                            <label class="form-label">Status Publikasi</label>
                            <select name="status" required class="select select-bordered pro-input w-full">
                                <option value="aktif">PUBLISHED (Tersedia untuk Penumpang)</option>
                                <option value="nonaktif">DRAFT (Sembunyikan dari Sistem)</option>
                                <option value="penuh">SOLD OUT (Tandai sebagai Penuh)</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="p-8 md:p-10 bg-white flex flex-col sm:flex-row justify-between items-center gap-4">
                    <div class="flex items-center gap-3 text-slate-400">
                        <i class="fas fa-circle-info"></i>
                        <p class="text-[11px] font-bold uppercase tracking-tight leading-tight">Data akan langsung disinkronisasi<br>dengan terminal penumpang.</p>
                    </div>
                    <div class="flex gap-3 w-full sm:w-auto">
                        <a href="/dashboard/admin" class="btn btn-ghost flex-1 sm:flex-none font-bold text-slate-500">Batalkan</a>
                        <button type="submit" class="btn bg-slate-950 hover:bg-black text-white flex-1 sm:flex-none px-10 border-none font-bold">
                            Simpan & Publikasikan
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </main>

    <footer class="text-center py-10 border-t border-slate-100 mt-10">
        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-[0.2em]">FlyBook Admin Control Tower — v2.0</p>
    </footer>
</body>
</html>