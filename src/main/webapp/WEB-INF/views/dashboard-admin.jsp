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
    <title>Admin Portal - FlyBook</title>
    
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
                brand: "#1e40af", // Indigo 800
                dark: "#0f172a",  // Slate 900
            }
          },
        },
      };
    </script>
    <style>
        body { background-color: #f1f5f9; color: #0f172a; }
        .pro-card { background: white; border: 1px solid #e2e8f0; border-radius: 0.5rem; }
        .sidebar-active { background-color: #f1f5f9 !important; border-left: 4px solid #1e40af; color: #1e40af !important; font-weight: 700; }
        .tab-active { background-color: #1e40af !important; color: white !important; }
        .table thead th { background-color: #f8fafc; color: #475569; font-weight: 800; text-transform: uppercase; font-size: 10px; letter-spacing: 0.05em; }
    </style>
</head>
<body class="antialiased">

    <div class="drawer lg:drawer-open">
        <input id="admin-drawer" type="checkbox" class="drawer-toggle" />
        
        <div class="drawer-content flex flex-col min-h-screen">
            <header class="navbar bg-white border-b border-slate-200 px-8 py-4 sticky top-0 z-30">
                <div class="flex-1">
                    <label for="admin-drawer" class="btn btn-ghost lg:hidden"><i class="fas fa-bars"></i></label>
                    <div class="ml-4">
                        <h2 class="text-xl font-black text-dark tracking-tight">Halo, ${sessionScope.userName}</h2>
                        <p class="text-[10px] text-slate-400 font-bold uppercase tracking-widest leading-none mt-1 text-emerald-600">Sistem Online</p>
                    </div>
                </div>
                
                <div class="flex-none gap-4">
                    <div class="dropdown dropdown-end">
                        <div tabindex="0" role="button" class="flex items-center gap-3 hover:bg-slate-50 p-2 rounded-lg transition-all">
                            <div class="text-right hidden sm:block">
                                <p class="text-xs font-black text-dark">${sessionScope.userName}</p>
                                <p class="text-[9px] text-slate-400 font-bold uppercase tracking-tighter">Administrator</p>
                            </div>
                            <div class="w-10 h-10 bg-brand text-white rounded flex items-center justify-center font-bold text-lg shadow-lg shadow-blue-200">
                                ${sessionScope.userName.substring(0,1).toUpperCase()}
                            </div>
                        </div>
                        <ul tabindex="0" class="dropdown-content menu bg-white rounded-lg z-[1] w-52 p-2 shadow-xl border border-slate-100 mt-4">
                            <li><a href="/profile" class="py-3 font-bold text-slate-700"><i class="fas fa-user-circle"></i> Profil</a></li>
                            <div class="divider my-0 opacity-50"></div>
                            <li><a href="/logout" class="py-3 font-bold text-red-600"><i class="fas fa-power-off"></i> Keluar</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <main class="p-8 space-y-8">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    <div class="pro-card p-6 flex items-center gap-4">
                        <div class="w-12 h-12 bg-blue-50 text-blue-600 rounded flex items-center justify-center text-xl"><i class="fas fa-ticket"></i></div>
                        <div>
                            <p class="text-[10px] font-bold text-slate-400 uppercase">Total Tiket</p>
                            <p class="text-2xl font-black text-dark">${not empty tikets ? tikets.size() : '0'}</p>
                        </div>
                    </div>

                    <div class="pro-card p-6 flex items-center gap-4">
                        <div class="w-12 h-12 bg-indigo-50 text-indigo-600 rounded flex items-center justify-center text-xl"><i class="fas fa-receipt"></i></div>
                        <div>
                            <p class="text-[10px] font-bold text-slate-400 uppercase">Pesanan</p>
                            <p class="text-2xl font-black text-dark">${not empty bookings ? bookings.size() : '0'}</p>
                        </div>
                    </div>

                    <div class="pro-card p-6 flex items-center gap-4 border-l-4 border-amber-500">
                        <div class="w-12 h-12 bg-amber-50 text-amber-600 rounded flex items-center justify-center text-xl"><i class="fas fa-hourglass-half"></i></div>
                        <div>
                            <p class="text-[10px] font-bold text-slate-400 uppercase">Menunggu</p>
                            <c:set var="pendingCount" value="0" />
                            <c:forEach var="b" items="${bookings}"><c:if test="${b.status == 'pending'}"><c:set var="pendingCount" value="${pendingCount + 1}" /></c:if></c:forEach>
                            <p class="text-2xl font-black text-dark">${pendingCount}</p>
                        </div>
                    </div>

                    <div class="pro-card p-6 flex items-center gap-4">
                        <div class="w-12 h-12 bg-emerald-50 text-emerald-600 rounded flex items-center justify-center text-xl"><i class="fas fa-chair"></i></div>
                        <div>
                            <p class="text-[10px] font-bold text-slate-400 uppercase">Sisa Kursi</p>
                            <c:set var="totalKursi" value="0" />
                            <c:forEach var="tiket" items="${tikets}"><c:set var="totalKursi" value="${totalKursi + tiket.kursiTersedia - tiket.kursiTerjual}" /></c:forEach>
                            <p class="text-2xl font-black text-dark">${totalKursi}</p>
                        </div>
                    </div>
                </div>

                <div class="pro-card overflow-hidden">
                    <div class="bg-slate-50/50 p-2 border-b border-slate-100 flex gap-2">
                        <button onclick="switchTab('bookings')" id="btn-bookings" class="btn btn-sm tab-active px-6 font-bold uppercase text-[10px] border-none">Daftar Pesanan</button>
                        <button onclick="switchTab('tickets')" id="btn-tickets" class="btn btn-sm btn-ghost px-6 font-bold uppercase text-[10px]">Manajemen Tiket</button>
                    </div>

                    <div class="p-6">
                        <div id="tab-bookings" class="fade-in">
                            <div class="flex flex-col md:flex-row justify-between gap-4 mb-6">
                                <h3 class="text-lg font-black text-dark">Daftar Penumpang Aktif</h3>
                                <div class="relative">
                                    <i class="fas fa-search absolute left-3 top-3 text-slate-300 text-sm"></i>
                                    <input type="text" id="searchBooking" onkeyup="filterBookings()" placeholder="Cari Kode/Nama..." class="input input-bordered input-sm pl-10 w-full md:w-64 font-medium" />
                                </div>
                            </div>
                            <div class="overflow-x-auto">
                                <table class="table w-full">
                                    <thead>
                                        <tr>
                                            <th>Kode</th>
                                            <th>Penumpang</th>
                                            <th>Penerbangan</th>
                                            <th>Status</th>
                                            <th class="text-center">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="b" items="${bookings}">
                                            <tr class="booking-row hover:bg-slate-50">
                                                <td class="font-black text-brand">#${b.bookingCode}</td>
                                                <td class="font-bold text-slate-900">${b.userName}</td>
                                                <td>
                                                    <div class="text-[11px] font-bold uppercase text-slate-500 leading-tight">${b.maskapai}</div>
                                                    <div class="text-[10px] font-medium text-slate-400 italic">${b.penerbangan}</div>
                                                </td>
                                                <td>
                                                    <form action="/dashboard/admin/booking/${b.id}/status" method="post">
                                                        <select name="status" onchange="this.form.submit()" class="select select-bordered select-xs font-bold rounded
                                                            ${b.status == 'success' ? 'bg-emerald-50 text-emerald-700 border-emerald-200' : 
                                                              b.status == 'pending' ? 'bg-amber-50 text-amber-700 border-amber-200' : 
                                                              'bg-red-50 text-red-700 border-red-200'}">
                                                            <option value="pending" ${b.status == 'pending' ? 'selected' : ''}>Pending</option>
                                                            <option value="success" ${b.status == 'success' ? 'selected' : ''}>Berhasil</option>
                                                            <option value="failed" ${b.status == 'failed' ? 'selected' : ''}>Gagal</option>
                                                        </select>
                                                    </form>
                                                </td>
                                                <td class="text-center">
                                                    <form action="/dashboard/admin/booking/${b.id}/delete" method="post" onsubmit="return confirm('Hapus pesanan ini?')">
                                                        <button class="btn btn-ghost btn-xs text-slate-300 hover:text-red-600"><i class="fas fa-trash"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="tab-tickets" class="hidden fade-in">
                            <div class="flex flex-col md:flex-row justify-between gap-4 mb-6">
                                <h3 class="text-lg font-black text-dark">Katalog Unit Penerbangan</h3>
                                <div class="flex gap-2">
                                    <input type="text" id="searchInput" onkeyup="filterTikets()" placeholder="Cari Rute/Maskapai..." class="input input-bordered input-sm w-full md:w-64 font-medium" />
                                    <a href="/dashboard/admin/tiket/create" class="btn btn-primary btn-sm px-5 font-bold">TAMBAH</a>
                                </div>
                            </div>
                            <div class="overflow-x-auto">
                                <table class="table w-full">
                                    <thead>
                                        <tr>
                                            <th>Maskapai</th>
                                            <th>Rute Perjalanan</th>
                                            <th>Jadwal</th>
                                            <th class="text-center">Sisa Stok</th> <th class="text-center">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="t" items="${tikets}">
                                            <tr class="tiket-row hover:bg-slate-50">
                                                <td class="font-black italic text-dark uppercase tracking-tighter">${t.maskapai}</td>
                                                <td class="font-bold text-dark text-xs">${t.bandara_asal} <i class="fas fa-arrow-right mx-1 text-slate-300"></i> ${t.bandara_tujuan}</td>
                                                <td class="text-[10px] font-bold text-slate-500">
                                                    <div>${t.tanggalBerangkat}</div>
                                                    <div class="text-slate-400">${t.jamBerangkat} - ${t.jamTiba}</div>
                                                </td>
                                                <td class="text-center">
                                                    <div class="badge badge-outline border-slate-200 font-black text-[10px]
                                                        ${(t.kursiTersedia - t.kursiTerjual) <= 5 ? 'text-red-600 bg-red-50' : 'text-dark'}">
                                                        ${t.kursiTersedia - t.kursiTerjual} KURSI
                                                    </div>
                                                </td>
                                                <td class="text-center flex justify-center gap-1">
                                                    <a href="/dashboard/admin/tiket/${t.id}/edit" class="btn btn-ghost btn-xs text-blue-600"><i class="fas fa-pen"></i></a>
                                                    <a href="/dashboard/admin/tiket/${t.id}/delete" onclick="return confirm('Hapus unit ini?')" class="btn btn-ghost btn-xs text-slate-300 hover:text-red-600"><i class="fas fa-trash"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <aside class="drawer-side z-40">
            <label for="admin-drawer" class="drawer-overlay"></label>
            <div class="w-64 min-h-screen bg-white border-r border-slate-200 flex flex-col p-6">
                <div class="flex items-center gap-3 mb-10 px-2">
                    <div class="w-10 h-10 bg-brand rounded flex items-center justify-center text-white shadow-lg shadow-blue-200"><i class="fas fa-plane-up"></i></div>
                    <span class="text-2xl font-black italic tracking-tighter text-dark">FlyBook</span>
                </div>

                <nav class="flex-1 space-y-1">
                    <p class="px-4 text-[10px] font-black text-slate-400 uppercase mb-3 tracking-widest">Main Management</p>
                    <a href="/dashboard/admin" class="flex items-center gap-3 px-4 py-3 rounded sidebar-active"><i class="fas fa-grid-2"></i> Dashboard</a>
                    <a href="/dashboard/admin/tiket/create" class="flex items-center gap-3 px-4 py-3 rounded font-bold text-slate-500 hover:bg-slate-50"><i class="fas fa-circle-plus"></i> Tambah Unit</a>
                    <div class="pt-6">
                        <p class="px-4 text-[10px] font-black text-slate-400 uppercase mb-3 tracking-widest">System</p>
                        <a href="/" class="flex items-center gap-3 px-4 py-3 rounded font-bold text-slate-500 hover:bg-slate-50"><i class="fas fa-globe"></i> Lihat Situs</a>
                    </div>
                </nav>

                <div class="mt-auto border-t border-slate-100 pt-6">
                    <div class="flex items-center gap-3 px-2">
                        <div class="w-8 h-8 rounded bg-slate-200 flex items-center justify-center text-slate-600 font-bold text-xs">${sessionScope.userName.substring(0,1)}</div>
                        <div class="overflow-hidden">
                            <p class="text-xs font-black text-dark truncate">${sessionScope.userName}</p>
                            <p class="text-[9px] font-bold text-slate-400 uppercase leading-none">Admin Authority</p>
                        </div>
                    </div>
                </div>
            </div>
        </aside>
    </div>

    <script>
        function switchTab(tab) {
            const bookings = document.getElementById('tab-bookings');
            const tickets = document.getElementById('tab-tickets');
            const btnB = document.getElementById('btn-bookings');
            const btnT = document.getElementById('btn-tickets');

            if(tab === 'bookings') {
                bookings.classList.remove('hidden');
                tickets.classList.add('hidden');
                btnB.classList.add('tab-active');
                btnB.classList.remove('btn-ghost');
                btnT.classList.remove('tab-active');
                btnT.classList.add('btn-ghost');
            } else {
                tickets.classList.remove('hidden');
                bookings.classList.add('hidden');
                btnT.classList.add('tab-active');
                btnT.classList.remove('btn-ghost');
                btnB.classList.remove('tab-active');
                btnB.classList.add('btn-ghost');
            }
        }

        function filterBookings() {
            const input = document.getElementById("searchBooking").value.toLowerCase();
            const rows = document.querySelectorAll(".booking-row");
            rows.forEach(row => { row.style.display = row.textContent.toLowerCase().includes(input) ? "" : "none"; });
        }

        function filterTikets() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll(".tiket-row");
            rows.forEach(row => { row.style.display = row.textContent.toLowerCase().includes(input) ? "" : "none"; });
        }
    </script>
</body>
</html>