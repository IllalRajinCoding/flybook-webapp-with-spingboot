<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${empty sessionScope.userName}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Pesanan #${booking.bookingCode} | FlyBook</title>

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
                brand: "#2563eb", // Blue 600
                dark: "#0f172a",  // Slate 900
            }
          },
        },
      };
    </script>
    <style>
        body { background-color: #f8fafc; color: #1e293b; }
        .pro-card { background: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; }
        .counter-btn { transition: all 0.2s; border: 1.5px solid #cbd5e1; }
        .counter-btn:hover { border-color: #2563eb; color: #2563eb; background: #eff6ff; }
        .dashed-divider { border-top: 2px dashed #e2e8f0; }
    </style>
</head>
<body class="antialiased min-h-screen pb-20">

    <nav class="navbar bg-white border-b border-slate-200 sticky top-0 z-50 px-6 md:px-12 h-16">
        <div class="navbar-start">
            <a href="/dashboard/user" class="flex items-center gap-2">
                <div class="w-8 h-8 bg-brand rounded flex items-center justify-center text-white">
                    <i class="fas fa-plane-departure text-xs"></i>
                </div>
                <span class="text-xl font-black italic tracking-tighter text-dark">FlyBook</span>
            </a>
        </div>
        <div class="navbar-end gap-4">
            <div class="w-9 h-9 bg-slate-100 border border-slate-200 rounded-lg flex items-center justify-center font-bold text-slate-700">
                ${sessionScope.userName.substring(0,1).toUpperCase()}
            </div>
            <a href="/dashboard/user" class="text-xs font-bold text-slate-500 hover:text-brand uppercase tracking-widest">
                <i class="fas fa-arrow-left mr-2"></i> Kembali
            </a>
        </div>
    </nav>

    <main class="max-w-2xl mx-auto px-6 py-12">
        <div class="mb-10">
            <p class="text-[10px] font-black text-brand uppercase tracking-[0.2em] mb-2">Penyesuaian Reservasi</p>
            <h1 class="text-3xl font-black text-dark tracking-tight">Perbarui Pesanan</h1>
            <p class="text-slate-500 font-medium text-sm">Kelola jumlah kursi untuk kode booking <span class="text-dark font-bold">#${booking.bookingCode}</span></p>
        </div>

        <div class="pro-card shadow-sm mb-6 overflow-hidden">
            <div class="p-6 bg-slate-50/50 border-b border-slate-100 flex justify-between items-center">
                <div class="flex items-center gap-3">
                    <i class="fas fa-info-circle text-brand text-sm"></i>
                    <span class="text-[10px] font-black text-slate-500 uppercase tracking-widest">Detail Penerbangan</span>
                </div>
                <div class="badge bg-amber-50 border-amber-200 text-amber-700 font-bold text-[10px] uppercase rounded">
                    ${booking.status}
                </div>
            </div>
            <div class="p-8">
                <div class="flex items-center justify-between mb-8">
                    <div class="text-center md:text-left">
                        <p class="text-2xl font-black text-dark tracking-tighter">${tiket.jamBerangkat}</p>
                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest">${tiket.bandara_asal}</p>
                    </div>
                    <div class="flex-1 flex flex-col items-center px-8 opacity-40">
                        <div class="w-full h-[1px] bg-slate-300 relative">
                            <i class="fas fa-plane absolute left-1/2 -top-2 -translate-x-1/2 text-xs bg-white px-2"></i>
                        </div>
                    </div>
                    <div class="text-center md:text-right">
                        <p class="text-2xl font-black text-dark tracking-tighter">${tiket.jamTiba}</p>
                        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest">${tiket.bandara_tujuan}</p>
                    </div>
                </div>
                
                <div class="grid grid-cols-2 gap-4">
                    <div class="p-4 bg-slate-50 rounded-lg">
                        <p class="text-[9px] font-bold text-slate-400 uppercase tracking-widest mb-1">Maskapai</p>
                        <p class="text-xs font-black text-dark uppercase">${tiket.maskapai}</p>
                    </div>
                    <div class="p-4 bg-slate-50 rounded-lg text-right">
                        <p class="text-[9px] font-bold text-slate-400 uppercase tracking-widest mb-1">Tanggal</p>
                        <p class="text-xs font-black text-dark uppercase">${tiket.tanggalBerangkat}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="pro-card shadow-sm">
            <div class="p-8 md:p-10">
                <div class="flex items-center gap-3 mb-8">
                    <div class="w-6 h-6 rounded bg-dark text-white flex items-center justify-center text-[10px] font-bold">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="font-black text-dark uppercase tracking-widest text-xs">Atur Jumlah Penumpang</h3>
                </div>

                <form action="/dashboard/user/booking/${booking.id}/update" method="post" class="space-y-8">
                    <div class="flex flex-col items-center justify-center py-6 bg-slate-50 rounded-xl border border-slate-100">
                        <label class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-4">Pilih Kapasitas Kursi</label>
                        <div class="flex items-center gap-6">
                            <button type="button" onclick="decrementSeats()" class="counter-btn w-12 h-12 rounded-lg flex items-center justify-center text-slate-400">
                                <i class="fas fa-minus"></i>
                            </button>
                            <input type="number" name="jumlahKursi" id="jumlahKursi" value="${booking.jumlahKursi}" 
                                   min="1" max="${availableSeats}" readonly
                                   class="bg-transparent text-4xl font-black text-dark w-20 text-center outline-none" />
                            <button type="button" onclick="incrementSeats()" class="counter-btn w-12 h-12 rounded-lg flex items-center justify-center text-slate-400">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                        <p class="text-[10px] font-bold text-slate-300 mt-4 uppercase tracking-tighter">Maksimal: ${availableSeats} Kursi Tersedia</p>
                    </div>

                    <div class="space-y-4 py-6 border-y border-slate-100">
                        <div class="flex justify-between items-center text-sm font-bold">
                            <span class="text-slate-400">Harga per Penumpang</span>
                            <span class="text-dark">IDR <fmt:formatNumber value="${tiket.harga}" /></span>
                        </div>
                        <div class="flex justify-between items-center text-sm font-bold">
                            <span class="text-slate-400">Kuantitas Terpilih</span>
                            <span class="text-dark" id="displaySeats">${booking.jumlahKursi} Orang</span>
                        </div>
                    </div>

                    <div class="flex flex-col gap-1 items-center mb-8">
                        <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Estimasi Total Biaya Baru</span>
                        <h4 class="text-4xl font-black text-brand tracking-tighter" id="totalPrice">
                            IDR <fmt:formatNumber value="${booking.totalHarga}" />
                        </h4>
                    </div>

                    <div class="flex gap-4">
                        <a href="/dashboard/user" class="btn btn-ghost flex-1 font-bold text-slate-400 rounded-lg">Batal</a>
                        <button type="submit" class="btn bg-dark hover:bg-black text-white flex-2 px-10 border-none font-bold rounded-lg shadow-xl shadow-slate-200">
                            Simpan Perubahan
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <footer class="text-center py-10 opacity-30 mt-10">
        <p class="text-[10px] font-black text-slate-400 uppercase tracking-[0.3em]">FlyBook Indonesia — Secure Booking Portal © 2026</p>
    </footer>

    <script>
        const pricePerSeat = ${tiket.harga};
        const maxSeats = ${availableSeats};

        function decrementSeats() {
            const input = document.getElementById('jumlahKursi');
            if (parseInt(input.value) > 1) {
                input.value = parseInt(input.value) - 1;
                updateTotal();
            }
        }

        function incrementSeats() {
            const input = document.getElementById('jumlahKursi');
            if (parseInt(input.value) < maxSeats) {
                input.value = parseInt(input.value) + 1;
                updateTotal();
            }
        }

        function updateTotal() {
            const seats = parseInt(document.getElementById('jumlahKursi').value) || 1;
            const total = seats * pricePerSeat;
            document.getElementById('displaySeats').textContent = seats + " Orang";
            document.getElementById('totalPrice').textContent = 'IDR ' + total.toLocaleString('id-ID');
        }
    </script>
</body>
</html>