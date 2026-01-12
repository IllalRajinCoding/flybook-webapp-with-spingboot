<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${empty sessionScope.userName}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id" data-theme="light" class="scroll-smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Penumpang | FlyBook</title>

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
                dark: "#0f172a", // Slate 900
            }
          },
        },
      };
    </script>
    <style>
        body { background-color: #f8fafc; color: #1e293b; }
        .pro-card { background: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; }
        .sidebar-active { background-color: #f1f5f9 !important; border-left: 4px solid #2563eb; color: #2563eb !important; font-weight: 700; }
        .tab-active-pro { color: #2563eb !important; border-bottom: 2px solid #2563eb !important; }
        .toast-pro { animation: slideIn 0.3s ease-out; }
        @keyframes slideIn { from { transform: translateX(100%); } to { transform: translateX(0); } }
    </style>
</head>
<body class="antialiased">

    <div class="drawer lg:drawer-open">
        <input id="user-drawer" type="checkbox" class="drawer-toggle" />

        <div class="drawer-content flex flex-col min-h-screen">
            <header class="navbar bg-white border-b border-slate-200 px-6 sticky top-0 z-30 h-16">
                <div class="flex-1">
                    <label for="user-drawer" class="btn btn-ghost lg:hidden mr-2">
                        <i class="fas fa-bars-staggered"></i>
                    </label>
                    <div class="hidden lg:block ml-2">
                        <p class="text-xs font-bold text-slate-400 uppercase tracking-widest">Passenger Portal</p>
                        <h2 class="text-lg font-black text-dark">Halo, ${sessionScope.userName}</h2>
                    </div>
                </div>

                <div class="flex-none gap-2">
                    <div class="dropdown dropdown-end">
                        <button tabindex="0" class="btn btn-ghost btn-circle text-slate-400">
                            <div class="indicator">
                                <i class="far fa-bell text-xl"></i>
                                <c:if test="${not empty bookings}"><span class="badge badge-xs badge-error indicator-item"></span></c:if>
                            </div>
                        </button>
                        <div tabindex="0" class="dropdown-content card card-compact bg-white z-[1] w-72 shadow-2xl border border-slate-100 mt-4">
                            <div class="card-body p-4">
                                <h3 class="font-bold text-dark border-b pb-2 flex justify-between">
                                    Notifikasi <span class="text-[10px] text-blue-600">Terbaru</span>
                                </h3>
                                <p class="text-xs py-3 text-slate-500">
                                    ${not empty bookings ? 'Anda memiliki beberapa jadwal penerbangan aktif.' : 'Tidak ada notifikasi baru.'}
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="dropdown dropdown-end">
                        <div tabindex="0" role="button" class="btn btn-ghost flex items-center gap-3 px-2">
                            <div class="w-9 h-9 bg-dark text-white rounded-lg flex items-center justify-center font-bold text-sm">
                                ${sessionScope.userName.substring(0,1).toUpperCase()}
                            </div>
                        </div>
                        <ul tabindex="0" class="dropdown-content menu bg-white rounded-lg z-[1] w-52 p-2 shadow-xl border border-slate-200 mt-4">
                            <li><a href="/profile" class="py-3 font-semibold"><i class="fas fa-id-badge text-blue-600"></i> Akun Saya</a></li>
                            <div class="divider my-0 opacity-50"></div>
                            <li><a href="/logout" class="py-3 text-red-600 font-bold"><i class="fas fa-power-off"></i> Keluar</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <main class="p-6 lg:p-10 max-w-6xl mx-auto w-full space-y-8">
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="pro-card p-6 flex items-center gap-5 border-l-4 border-l-blue-600">
                        <div class="w-12 h-12 bg-blue-50 text-blue-600 rounded-lg flex items-center justify-center text-xl shadow-sm">
                            <i class="fas fa-ticket-alt"></i>
                        </div>
                        <div>
                            <p class="text-[10px] font-bold text-slate-400 uppercase tracking-tighter">Riwayat Booking</p>
                            <h4 class="text-2xl font-black text-dark">${not empty bookings ? bookings.size() : '0'} Pesanan</h4>
                        </div>
                    </div>
                    
                    <div class="pro-card p-6 flex items-center gap-5">
                        <div class="w-12 h-12 bg-slate-100 text-slate-600 rounded-lg flex items-center justify-center text-xl shadow-sm">
                            <i class="fas fa-star"></i>
                        </div>
                        <div>
                            <p class="text-[10px] font-bold text-slate-400 uppercase tracking-tighter">Status Member</p>
                            <h4 class="text-2xl font-black text-dark">Gold Passenger</h4>
                        </div>
                    </div>

                    <div class="pro-card p-6 flex items-center gap-5">
                        <div class="w-12 h-12 bg-amber-50 text-amber-600 rounded-lg flex items-center justify-center text-xl shadow-sm">
                            <i class="fas fa-coins"></i>
                        </div>
                        <div>
                            <p class="text-[10px] font-bold text-slate-400 uppercase tracking-tighter">FlyPoints</p>
                            <h4 class="text-2xl font-black text-dark">2,450 <span class="text-xs font-medium text-slate-400">Pts</span></h4>
                        </div>
                    </div>
                </div>

                <div class="pro-card overflow-hidden">
                    <div class="bg-slate-50/50 border-b border-slate-100 px-8">
                        <div class="tabs">
                            <button onclick="showTab('bookings')" id="tab-b" class="tab tab-active-pro h-14 font-bold text-sm px-6">
                                Jadwal Saya
                            </button>
                            <button onclick="showTab('flights')" id="tab-f" class="tab h-14 font-bold text-sm px-6 text-slate-400">
                                Cari Penerbangan
                            </button>
                        </div>
                    </div>

                    <div class="p-8">
                        <div id="bookings-tab" class="space-y-4">
                            <c:choose>
                                <c:when test="${not empty bookings}">
                                    <c:forEach var="b" items="${bookings}">
                                        <div class="border border-slate-100 rounded-xl p-5 hover:border-blue-200 hover:bg-blue-50/10 transition-all flex flex-col md:flex-row justify-between items-center gap-6">
                                            <div class="flex items-center gap-5 w-full md:w-auto">
                                                <div class="w-12 h-12 bg-white border border-slate-200 rounded-lg flex items-center justify-center text-blue-600 shadow-sm">
                                                    <i class="fas fa-plane-departure text-lg"></i>
                                                </div>
                                                <div>
                                                    <p class="text-[10px] font-black text-blue-600 uppercase">#${b.bookingCode}</p>
                                                    <h3 class="font-bold text-dark text-lg">${b.maskapai}</h3>
                                                </div>
                                            </div>

                                            <div class="text-center md:text-left flex-1 border-x border-slate-100 px-6">
                                                <p class="text-sm font-bold text-dark">${b.penerbangan}</p>
                                                <p class="text-xs font-medium text-slate-400 mt-1 uppercase">
                                                    <i class="far fa-calendar-alt mr-1"></i> ${b.tanggalBerangkat}
                                                </p>
                                            </div>

                                            <div class="flex items-center gap-6 w-full md:w-auto justify-between md:justify-end">
                                                <span class="px-4 py-1.5 rounded-full text-[10px] font-black uppercase tracking-widest
                                                    ${b.status == 'success' ? 'bg-emerald-100 text-emerald-700' : 
                                                      b.status == 'pending' ? 'bg-amber-100 text-amber-700' : 
                                                      'bg-red-100 text-red-700'}">
                                                    ${b.status}
                                                </span>
                                                
                                                <div class="dropdown dropdown-end">
                                                    <button tabindex="0" class="btn btn-ghost btn-sm btn-circle text-slate-300 hover:text-dark">
                                                        <i class="fas fa-ellipsis-h"></i>
                                                    </button>
                                                    <ul tabindex="0" class="dropdown-content menu bg-white rounded-lg z-[1] w-48 p-2 shadow-2xl border border-slate-200">
                                                        <li><a href="/dashboard/tiket/${b.tiketId}" class="text-xs font-bold py-2"><i class="fas fa-file-invoice"></i> E-Ticket</a></li>
                                                        <c:if test="${b.status == 'pending'}">
                                                            <li><a href="/dashboard/user/booking/${b.id}/edit" class="text-xs font-bold py-2 text-blue-600"><i class="fas fa-edit"></i> Ubah Data</a></li>
                                                        </c:if>
                                                        <div class="divider my-1 opacity-50"></div>
                                                        <li><a onclick="confirmDelete(${b.id}, '${b.bookingCode}')" class="text-xs font-bold py-2 text-red-600"><i class="fas fa-times-circle"></i> Batalkan</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div class="py-20 text-center border-2 border-dashed border-slate-100 rounded-2xl">
                                        <i class="fas fa-ticket-simple text-slate-200 text-5xl mb-4"></i>
                                        <p class="font-bold text-slate-400">Belum ada jadwal penerbangan ditemukan.</p>
                                        <button onclick="showTab('flights')" class="btn btn-link no-underline text-blue-600 font-bold mt-2">Cari Tiket Sekarang</button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <div id="flights-tab" class="hidden space-y-6">
                            <div class="relative max-w-md">
                                <i class="fas fa-search absolute left-4 top-3.5 text-slate-400 text-sm"></i>
                                <input type="text" id="searchTiket" onkeyup="filterTiket()" placeholder="Cari Maskapai atau Tujuan..." 
                                       class="input input-bordered w-full pl-11 rounded-lg bg-slate-50 border-slate-200 font-medium text-sm focus:bg-white" />
                            </div>

                            <div class="grid grid-cols-1 gap-4">
                                <c:forEach var="t" items="${tikets}">
                                    <c:if test="${t.status == 'aktif'}">
                                        <div class="tiket-card pro-card p-6 flex flex-col md:flex-row items-center gap-8 hover:border-blue-300 transition-all group"
                                             data-maskapai="${t.maskapai}" data-rute="${t.bandara_asal} ${t.bandara_tujuan}">
                                            
                                            <div class="flex items-center gap-4 md:w-1/4">
                                                <div class="w-10 h-10 bg-slate-900 text-white rounded flex items-center justify-center font-black italic">FB</div>
                                                <div>
                                                    <p class="font-extrabold text-dark">${t.maskapai}</p>
                                                    <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest">${t.nomorTiket}</p>
                                                </div>
                                            </div>

                                            <div class="flex-1 flex items-center justify-center gap-8">
                                                <div class="text-center">
                                                    <p class="text-lg font-black text-dark">${t.jamBerangkat}</p>
                                                    <p class="text-[10px] font-bold text-slate-400 uppercase">${t.bandara_asal}</p>
                                                </div>
                                                <div class="flex flex-col items-center flex-1 max-w-[100px]">
                                                    <i class="fas fa-plane text-slate-200 group-hover:text-blue-500 transition-colors"></i>
                                                    <div class="h-[1px] w-full bg-slate-100 mt-2"></div>
                                                </div>
                                                <div class="text-center">
                                                    <p class="text-lg font-black text-dark">${t.jamTiba}</p>
                                                    <p class="text-[10px] font-bold text-slate-400 uppercase">${t.bandara_tujuan}</p>
                                                </div>
                                            </div>

                                            <div class="md:w-1/4 flex items-center justify-end gap-6">
                                                <p class="text-lg font-black text-blue-700 italic">
                                                    <span class="text-xs font-medium text-slate-400 not-italic mr-1">IDR</span><fmt:formatNumber value="${t.harga}" />
                                                </p>
                                                <a href="/dashboard/user/tiket/${t.id}/book" class="btn bg-dark hover:bg-blue-700 text-white btn-sm px-6 font-bold border-none">Beli</a>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <aside class="drawer-side z-40">
            <label for="user-drawer" class="drawer-overlay"></label>
            <div class="w-64 min-h-screen bg-white border-r border-slate-200 flex flex-col p-6">
                <div class="flex items-center gap-3 mb-10 px-2">
                    <div class="w-10 h-10 bg-blue-600 rounded flex items-center justify-center text-white shadow-lg shadow-blue-200">
                        <i class="fas fa-paper-plane"></i>
                    </div>
                    <span class="text-2xl font-black italic tracking-tighter text-dark">FlyBook</span>
                </div>

                <ul class="menu p-0 space-y-1">
                    <p class="px-4 text-[10px] font-bold text-slate-400 uppercase mb-3 tracking-widest">Main Navigation</p>
                    <li><a href="/dashboard/user" class="sidebar-active py-3 px-4 rounded-lg font-bold"><i class="fas fa-chart-line w-5"></i> Dashboard</a></li>
                    <li><a href="/" class="py-3 px-4 rounded-lg font-bold text-slate-500 hover:bg-slate-50"><i class="fas fa-magnifying-glass w-5"></i> Pesan Tiket</a></li>
                    <li><a href="/profile" class="py-3 px-4 rounded-lg font-bold text-slate-500 hover:bg-slate-50"><i class="fas fa-user-circle w-5"></i> Pengaturan</a></li>
                </ul>

                <div class="mt-auto pt-6 border-t border-slate-100">
                    <div class="bg-dark p-4 rounded-xl text-white relative overflow-hidden group">
                        <i class="fas fa-crown absolute -right-2 -bottom-2 text-white/10 text-4xl group-hover:scale-110 transition-transform"></i>
                        <p class="text-[10px] font-bold uppercase opacity-60">Membership</p>
                        <p class="text-sm font-black italic">PRO TRAVELER</p>
                    </div>
                </div>
            </div>
        </aside>
    </div>

    <div class="toast toast-end toast-bottom p-8 z-[100]">
        <c:if test="${not empty sessionScope.successMsg}">
            <div class="alert bg-dark text-white shadow-2xl border-none rounded-xl toast-pro min-w-[320px] flex gap-4">
                <i class="fas fa-check-circle text-blue-400 text-xl"></i>
                <div>
                    <p class="text-[10px] font-bold uppercase opacity-60">Status Sukses</p>
                    <p class="text-sm font-bold">${sessionScope.successMsg}</p>
                </div>
            </div>
            <c:remove var="successMsg" scope="session" />
        </c:if>
    </div>

    <dialog id="delete_modal" class="modal">
        <div class="modal-box rounded-xl max-w-sm p-0 overflow-hidden bg-white">
            <div class="p-8 text-center">
                <div class="w-16 h-16 bg-red-50 text-red-600 rounded-full flex items-center justify-center mx-auto mb-4">
                    <i class="fas fa-exclamation-circle text-2xl"></i>
                </div>
                <h3 class="font-black text-xl text-dark">Batalkan Pesanan?</h3>
                <p class="py-3 text-slate-500 text-sm">
                    Tindakan ini akan membatalkan tiket <strong id="delete-code" class="text-dark font-black"></strong> secara permanen.
                </p>
            </div>
            <div class="flex border-t border-slate-100">
                <form method="dialog" class="flex-1">
                    <button class="w-full h-14 font-bold text-slate-400 hover:bg-slate-50 transition-colors">Tutup</button>
                </form>
                <form id="delete-form" method="post" class="flex-1 border-l border-slate-100">
                    <button type="submit" class="w-full h-14 font-black text-red-600 hover:bg-red-50 transition-colors">Ya, Batalkan</button>
                </form>
            </div>
        </div>
        <form method="dialog" class="modal-backdrop bg-dark/40 backdrop-blur-sm"><button>close</button></form>
    </dialog>

    <script>
        function confirmDelete(id, code) {
            document.getElementById("delete-code").textContent = "#" + code;
            document.getElementById("delete-form").action = "/dashboard/user/booking/" + id + "/delete";
            document.getElementById("delete_modal").showModal();
        }

        function showTab(tab) {
            const bookings = document.getElementById("bookings-tab");
            const flights = document.getElementById("flights-tab");
            const btnB = document.getElementById("tab-b");
            const btnF = document.getElementById("tab-f");

            if (tab === "bookings") {
                bookings.classList.remove("hidden");
                flights.classList.add("hidden");
                btnB.classList.add("tab-active-pro");
                btnB.classList.remove("text-slate-400");
                btnF.classList.remove("tab-active-pro");
                btnF.classList.add("text-slate-400");
            } else {
                bookings.classList.add("hidden");
                flights.classList.remove("hidden");
                btnB.classList.remove("tab-active-pro");
                btnB.classList.add("text-slate-400");
                btnF.classList.add("tab-active-pro");
                btnF.classList.remove("text-slate-400");
            }
        }

        function filterTiket() {
            const input = document.getElementById("searchTiket").value.toLowerCase();
            const cards = document.querySelectorAll(".tiket-card");
            cards.forEach((card) => {
                const text = card.getAttribute("data-maskapai").toLowerCase() + card.getAttribute("data-rute").toLowerCase();
                card.style.display = text.includes(input) ? "flex" : "none";
            });
        }

        // Auto-close toast
        window.onload = () => {
            const toast = document.querySelector('.toast-pro');
            if(toast) setTimeout(() => toast.style.display = 'none', 4000);
        };
    </script>
</body>
</html>