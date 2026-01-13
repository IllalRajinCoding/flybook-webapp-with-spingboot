<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Check Session --%>
<c:if test="${empty sessionScope.userName || sessionScope.userRole != 'admin'}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sistem Editor Jadwal | FlyBook Admin</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            fontFamily: { sans: ["Plus Jakarta Sans", "sans-serif"] },
            colors: {
                brand: "#1e40af", // Indigo 800
                accent: "#2563eb", // Blue 600
                dark: "#0f172a"    // Slate 900
            }
          },
        },
      };
    </script>
    <style>
        body { background-color: #f8fafc; color: #1e293b; }
        .pro-card { background: white; border: 1px solid #e2e8f0; border-radius: 0.5rem; }
        .form-label { color: #0f172a; font-weight: 700; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 0.5rem; display: block; }
        .pro-input { 
            border: 1.5px solid #cbd5e1 !important; 
            border-radius: 0.375rem !important;
            transition: all 0.2s;
            font-weight: 600;
            color: #0f172a !important;
            background-color: #ffffff !important;
        }
        .pro-input:focus { 
            border-color: #2563eb !important; 
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1); 
            outline: none;
        }
        .section-header { border-left: 4px solid #1e40af; padding-left: 1rem; }
    </style>
</head>
<body class="antialiased min-h-screen pb-20">
    
    <nav class="bg-white border-b border-slate-200 sticky top-0 z-50 h-16 flex items-center">
        <div class="max-w-7xl mx-auto px-8 w-full flex justify-between items-center">
            <div class="flex items-center gap-3">
                <div class="bg-dark p-1.5 rounded text-white shadow-sm">
                    <i class="fas fa-edit text-xs"></i>
                </div>
                <span class="text-lg font-black tracking-tighter text-dark uppercase">FlyBook <span class="text-accent italic font-bold">Portal</span></span>
            </div>
            
            <div class="flex items-center gap-4">
                <div class="text-right hidden sm:block">
                    <p class="text-xs font-black text-dark leading-none">${sessionScope.userName}</p>
                    <p class="text-[9px] text-slate-400 font-bold uppercase tracking-widest mt-1">Administrator</p>
                </div>
                <div class="w-10 h-10 bg-brand text-white rounded flex items-center justify-center font-bold text-lg shadow-lg shadow-blue-100">
                    ${sessionScope.userName.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>
    </nav>

    <main class="max-w-5xl mx-auto px-6 py-12">
      
      <div class="mb-10 flex flex-col md:flex-row md:items-end justify-between gap-4">
        <div>
            <a href="/dashboard/admin" class="text-accent font-black text-[10px] uppercase tracking-widest flex items-center gap-2 hover:opacity-70 transition-all mb-4">
                <i class="fas fa-arrow-left"></i> Kembali ke Panel Kontrol
            </a>
            <h2 class="text-3xl font-black text-dark tracking-tight leading-none">Penyuntingan Jadwal</h2>
            <p class="text-slate-500 font-medium text-sm mt-2">Memodifikasi data operasional tiket <span class="text-brand font-black">#${tiket.nomorTiket}</span></p>
        </div>
        <div class="flex items-center gap-2 px-4 py-2 bg-emerald-50 border border-emerald-100 rounded text-emerald-700 text-[10px] font-black uppercase tracking-widest">
            <span class="relative flex h-2 w-2">
                <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                <span class="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
            </span>
            Sinkronisasi Database Aktif
        </div>
      </div>

      <div class="pro-card shadow-sm overflow-hidden border-slate-200">
        <form action="/dashboard/admin/tiket/${tiket.id}/update" method="post" class="divide-y divide-slate-100">
            
            <div class="p-8 md:p-12">
                <div class="section-header mb-10">
                    <h3 class="font-black text-dark uppercase text-xs tracking-[0.2em]">01. Spesifikasi Armada & Rute</h3>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-8">
                    <div class="form-control">
                        <label class="form-label">Nomor Registrasi Penerbangan</label>
                        <input type="text" name="nomorTiket" required value="${tiket.nomorTiket}"
                            class="input input-bordered pro-input w-full" />
                    </div>

                    <div class="form-control">
                        <label class="form-label">Nama Operator (Maskapai)</label>
                        <input type="text" name="maskapai" required value="${tiket.maskapai}"
                            class="input input-bordered pro-input w-full" />
                    </div>

                    <div class="form-control md:col-span-2">
                        <label class="form-label">Model Pesawat / Kode Seri</label>
                        <input type="text" name="penerbangan" required value="${tiket.penerbangan}"
                            class="input input-bordered pro-input w-full" />
                    </div>

                    <div class="form-control">
                        <label class="form-label">Titik Keberangkatan (Asal)</label>
                        <div class="relative">
                            <i class="fas fa-plane-departure absolute left-3 top-3.5 text-slate-300 text-sm"></i>
                            <input type="text" name="bandara_asal" required value="${tiket.bandara_asal}"
                                class="input input-bordered pro-input w-full pl-10" />
                        </div>
                    </div>

                    <div class="form-control">
                        <label class="form-label">Titik Kedatangan (Tujuan)</label>
                        <div class="relative">
                            <i class="fas fa-plane-arrival absolute left-3 top-3.5 text-slate-300 text-sm"></i>
                            <input type="text" name="bandara_tujuan" required value="${tiket.bandara_tujuan}"
                                class="input input-bordered pro-input w-full pl-10" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="p-8 md:p-12 bg-slate-50/30">
                <div class="section-header mb-10 border-brand">
                    <h3 class="font-black text-dark uppercase text-xs tracking-[0.2em]">02. Penjadwalan & Komersial</h3>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-8">
                    <div class="form-control md:col-span-2">
                        <label class="form-label">Tanggal Operasional</label>
                        <input type="date" name="tanggalBerangkat" required value="${tiket.tanggalBerangkat}"
                            class="input input-bordered pro-input w-full" />
                    </div>

                    <div class="form-control">
                        <label class="form-label">Waktu Keberangkatan (ETD)</label>
                        <input type="time" name="jamBerangkat" required value="${tiket.jamBerangkat}"
                            class="input input-bordered pro-input w-full" />
                    </div>

                    <div class="form-control">
                        <label class="form-label">Estimasi Kedatangan (ETA)</label>
                        <input type="time" name="jamTiba" required value="${tiket.jamTiba}"
                            class="input input-bordered pro-input w-full" />
                    </div>

                    <div class="form-control">
                        <label class="form-label">Tarif Satuan (IDR)</label>
                        <input type="number" name="harga" required value="${tiket.harga}"
                            class="input input-bordered pro-input w-full text-brand font-black text-lg" />
                    </div>

                    <div class="form-control">
                        <label class="form-label">Status Visibilitas</label>
                        <select name="status" class="select select-bordered pro-input w-full">
                            <option value="aktif" ${tiket.status == 'aktif' ? 'selected' : ''}>🟢 PUBLISHED (Aktif)</option>
                            <option value="nonaktif" ${tiket.status == 'nonaktif' ? 'selected' : ''}>🔴 ARCHIVED (Non-Aktif)</option>
                            <option value="penuh" ${tiket.status == 'penuh' ? 'selected' : ''}>🟡 SOLD OUT (Penuh)</option>
                        </select>
                    </div>

                    <div class="md:col-span-2 p-8 bg-white border border-slate-200 rounded flex flex-col md:flex-row items-center justify-between gap-8 shadow-sm">
                        <div class="flex-1 text-center md:text-left">
                            <label class="form-label !mb-2">Total Kapasitas Kursi</label>
                            <input type="number" name="kursiTersedia" value="${tiket.kursiTersedia}" 
                                class="bg-transparent border-none text-3xl font-black text-dark w-full focus:outline-none p-0 md:text-left text-center tracking-tighter" />
                        </div>
                        <div class="h-12 w-px bg-slate-200 hidden md:block"></div>
                        <div class="flex-1 text-center md:text-right">
                            <label class="form-label !mb-2">Kuantitas Terjual</label>
                            <input type="number" name="kursiTerjual" value="${tiket.kursiTerjual}" 
                                class="bg-transparent border-none text-3xl font-black text-accent w-full focus:outline-none p-0 md:text-right text-center tracking-tighter" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="p-8 md:p-12 bg-white flex flex-col md:flex-row items-center justify-between gap-6">
                <div class="flex items-start gap-3 opacity-60">
                    <i class="fas fa-shield-check text-dark mt-1"></i>
                    <p class="text-[10px] font-bold uppercase leading-relaxed tracking-tight">
                        Otoritas Admin Terverifikasi.<br>Perubahan data akan dicatat dalam log sistem.
                    </p>
                </div>
                <div class="flex items-center gap-4 w-full md:w-auto">
                    <a href="/dashboard/admin" class="btn btn-ghost flex-1 md:flex-none font-bold text-slate-400 hover:text-dark uppercase text-xs tracking-widest">Batal</a>
                    <button type="submit" class="btn bg-brand hover:bg-dark border-none text-white flex-2 md:flex-none rounded px-12 font-black shadow-xl shadow-blue-100 h-12 text-xs uppercase tracking-widest transition-all active:scale-95">
                        Simpan Perubahan
                    </button>
                </div>
            </div>

        </form>
      </div>
    </main>

    <footer class="py-12 text-center border-t border-slate-100 mt-20">
        <p class="text-[10px] font-black uppercase tracking-[0.5em] text-slate-300">FlyBook Management — Enterprise Edition 2026</p>
    </footer>

    <!-- Toast Container -->
    <div id="toast" class="toast toast-top toast-end z-50 hidden">
        <div id="toast-alert" class="alert bg-red-50 border border-red-200 text-red-800 shadow-lg">
            <i id="toast-icon" class="fas fa-exclamation-circle text-red-500"></i>
            <span id="toast-message" class="font-bold">Message</span>
        </div>
    </div>

    <script>
        function showToast(message, type) {
            const toast = document.getElementById('toast');
            const toastMessage = document.getElementById('toast-message');
            const toastIcon = document.getElementById('toast-icon');
            
            toastMessage.textContent = message;
            
            if (type === 'success') {
                toastIcon.className = 'fas fa-check-circle text-emerald-500';
                document.getElementById('toast-alert').className = 'alert bg-emerald-50 border border-emerald-200 text-emerald-800 shadow-lg';
            } else {
                toastIcon.className = 'fas fa-exclamation-circle text-red-500';
                document.getElementById('toast-alert').className = 'alert bg-red-50 border border-red-200 text-red-800 shadow-lg';
            }
            
            toast.classList.remove('hidden');
            
            setTimeout(() => {
                toast.classList.add('hidden');
            }, 4000);
        }

        // Show toast if flash message exists
        <c:if test="${not empty error}">
            document.addEventListener('DOMContentLoaded', function() {
                showToast('${error}', 'error');
            });
        </c:if>
        <c:if test="${not empty success}">
            document.addEventListener('DOMContentLoaded', function() {
                showToast('${success}', 'success');
            });
        </c:if>
    </script>

</body>
</html>