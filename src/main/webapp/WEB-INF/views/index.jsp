<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
  const FLIGHT_DATABASE = [
      <c:if test="${not empty tiketList}">
          <c:forEach var="t" items="${tiketList}" varStatus="loop">
          {
              id: "${t.id}",
              maskapai: "${t.maskapai}",
              kode: "${t.nomorTiket}",
              asal: "${t.bandara_asal}",
              tujuan: "${t.bandara_tujuan}",
              jamBerangkat: "${t.jamBerangkat}",
              jamTiba: "${t.jamTiba}",
              tanggal: "${t.tanggalBerangkat}",
              harga: ${t.harga},
              kursiSisa: ${t.kursiTersedia - t.kursiTerjual}
          }${!loop.last ? ',' : ''}
          </c:forEach>
      </c:if>
  ];
</script>

<!DOCTYPE html>
<html lang="id" data-theme="light" class="scroll-smooth">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FlyBook | Global Aviation Portal</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.4.19/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <script>
      tailwind.config = {
        theme: {
          extend: {
            fontFamily: { sans: ["Plus Jakarta Sans", "sans-serif"] },
            colors: { brand: "#1e40af", dark: "#0f172a", accent: "#2563eb" },
          },
        },
      };
    </script>
    <style>
        body { background-color: #ffffff; color: #1e293b; }
        .glass-nav { background: rgba(255, 255, 255, 0.85); backdrop-filter: blur(12px); border-bottom: 1px solid #f1f5f9; }
        .hero-gradient { background: radial-gradient(circle at 70% 30%, #f0f7ff 0%, #ffffff 100%); }
        .pro-card { background: white; border: 1px solid #e2e8f0; border-radius: 0.5rem; }
        .pro-input {
            border: 1.5px solid #cbd5e1 !important;
            border-radius: 0.5rem !important;
            font-weight: 600;
            color: #0f172a !important;
            background-color: #ffffff !important;
        }
        .pro-input:focus { border-color: #1e40af !important; box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.1); outline: none; }
        .flight-row { border: 1px solid #f1f5f9; transition: all 0.3s ease; border-radius: 0.5rem; background: white; }
        .flight-row:hover { border-color: #1e40af; background-color: #f8fafc; transform: translateY(-2px); }
        .section-tag { color: #1e40af; font-size: 10px; font-weight: 800; text-transform: uppercase; letter-spacing: 0.2em; display: block; margin-bottom: 1rem; }
    </style>
</head>
<body class="antialiased">

    <nav class="navbar fixed top-0 z-[100] glass-nav px-4 md:px-16 h-16">
        <div class="navbar-start">
            <div class="dropdown">
                <label tabindex="0" class="btn btn-ghost lg:hidden text-dark">
                    <i class="fas fa-bars-staggered"></i>
                </label>
                <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-4 shadow-2xl bg-white rounded-xl border border-slate-100 w-64 font-bold space-y-2">
                    <li><a href="/">Beranda</a></li>
                    <li><a href="#about">Tentang Kami</a></li>
                    <li><a href="#services">Layanan</a></li>
                    <li><a href="#search">Cari Tiket</a></li>
                    <li><a href="/gallery">Gallery</a></li>

                </ul>
            </div>
            <a href="/" class="flex items-center gap-2">
                <div class="w-8 h-8 bg-brand rounded flex items-center justify-center text-white shadow-lg">
                    <i class="fas fa-paper-plane text-xs"></i>
                </div>
                <span class="text-xl font-black tracking-tighter text-dark uppercase hidden sm:block">FlyBook</span>
            </a>
        </div>

        <div class="navbar-center hidden lg:flex">
            <ul class="flex gap-10 font-black text-[10px] uppercase tracking-[0.2em] text-slate-400">
                <li><a href="/" class="hover:text-brand transition-colors text-dark">Home</a></li>
                <li><a href="#about" class="hover:text-brand transition-colors">About</a></li>
                <li><a href="#services" class="hover:text-brand transition-colors">Services</a></li>
                <li><a href="#search" class="hover:text-brand transition-colors">Reservasi</a></li>
                <li><a href="/gallery" class="hover:text-brand transition-colors">Gallery</a></li>
            </ul>
        </div>

        <div class="navbar-end gap-4">
            <c:choose>
                <c:when test="${not empty sessionScope.userName}">
                    <div class="dropdown dropdown-end">
                        <label tabindex="0" class="btn btn-ghost flex items-center gap-3 px-2 border border-slate-100 rounded h-10 hover:bg-slate-50">
                            <div class="w-7 h-7 bg-dark text-white rounded flex items-center justify-center font-black text-[10px]">
                                ${sessionScope.userName.substring(0,1).toUpperCase()}
                            </div>
                            <span class="text-[10px] font-black text-dark uppercase hidden md:block tracking-widest">${sessionScope.userName}</span>
                        </label>
                        <ul tabindex="0" class="menu dropdown-content mt-4 z-[1] p-2 shadow-2xl bg-white rounded-lg border border-slate-100 w-52 font-bold">
                            <li><a href="/profile"><i class="fas fa-user-circle text-brand"></i> Profile</a></li>
                            <li><a href="/dashboard/user"><i class="fas fa-grid-2 text-brand"></i> Dashboard</a></li>
                            <div class="divider my-0 opacity-50"></div>
                            <li><a href="/logout" class="text-red-600"><i class="fas fa-power-off"></i> Keluar</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="/login" class="text-[10px] font-black text-slate-500 hover:text-brand uppercase tracking-widest px-4">Login</a>
                    <a href="/register" class="btn bg-brand hover:bg-dark border-none text-white px-8 h-10 min-h-0 rounded font-black text-[9px] uppercase tracking-widest">Register</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>

    <section class="relative min-h-[90vh] flex items-center pt-24 hero-gradient px-6 border-b border-slate-50">
        <div class="container mx-auto">
            <div class="max-w-4xl space-y-10">
                <span class="section-tag">Aviation Integrated System — 2026</span>
                <h1 class="text-6xl md:text-9xl font-black tracking-tighter text-dark leading-[0.85] uppercase">
                    Redefine <br><span class="text-brand italic underline decoration-brand/10 underline-offset-[16px]">Distance.</span>
                </h1>
                <p class="text-slate-500 text-lg md:text-xl font-medium max-w-xl leading-relaxed border-l-4 border-brand/20 pl-8">
                    Solusi navigasi udara kelas dunia yang mengintegrasikan kecerdasan data dengan pengalaman perjalanan tanpa hambatan.
                </p>
                <div class="pt-6 flex flex-wrap gap-8 items-center">
                    <a href="#search" class="btn bg-dark hover:bg-brand text-white px-12 h-14 rounded-lg border-none font-black uppercase tracking-widest text-[11px] shadow-2xl shadow-blue-100 transition-all">Start Exploration</a>
                </div>
            </div>
        </div>
    </section>

    <section id="search" class="container mx-auto px-6 relative z-50">
        <div class="pro-card p-8 md:p-12 shadow-2xl border-slate-100 -mt-20 bg-white">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8 items-end">
                <div class="form-control">
                    <label class="label pt-0"><span class="label-text font-black text-slate-400 text-[10px] uppercase tracking-widest">Origin</span></label>
                    <select id="origin" class="select select-bordered pro-input w-full"></select>
                </div>
                <div class="form-control">
                    <label class="label pt-0"><span class="label-text font-black text-slate-400 text-[10px] uppercase tracking-widest">Destination</span></label>
                    <select id="dest" class="select select-bordered pro-input w-full"></select>
                </div>
                <div class="form-control">
                    <label class="label pt-0"><span class="label-text font-black text-slate-400 text-[10px] uppercase tracking-widest">Departure Date</span></label>
                    <input type="date" id="date" class="input input-bordered pro-input w-full" />
                </div>
                <button onclick="searchFlights()" class="btn bg-brand hover:bg-dark text-white h-12 rounded-lg font-black uppercase tracking-widest text-[10px] border-none px-8 shadow-xl shadow-blue-100 transition-all">
                    <span id="btnText">Verify Flights</span>
                    <span id="loader" class="loading loading-spinner loading-xs hidden"></span>
                </button>
            </div>
        </div>
    </section>

     <!-- dzikra hapus -->

    <main id="results" class="container mx-auto px-6 py-32 hidden">
        <div class="flex flex-col md:flex-row md:items-center justify-between mb-16 gap-6 border-b border-slate-100 pb-10">
            <div>
                <h2 class="text-4xl font-black text-dark tracking-tighter uppercase italic">Inventory Units</h2>
                <p class="text-[10px] font-black text-slate-400 uppercase tracking-[0.3em] mt-3">FOUND <span id="count" class="text-brand">0</span> ACTIVE UNITS DISCOVERED</p>
            </div>
        </div>
        <div id="flightGrid" class="space-y-4 max-w-6xl mx-auto"></div>
    </main>

    <section id="about" class="container mx-auto px-6 py-32">
        <div class="grid lg:grid-cols-2 gap-24 items-center">
            <div class="space-y-10">
                <span class="section-tag">About FlyBook</span>
                <h2 class="text-5xl font-black text-dark leading-tight tracking-tighter uppercase">Infrastruktur <br>Masa Depan.</h2>
                <p class="text-slate-500 leading-relaxed font-medium text-lg italic border-l-4 border-slate-100 pl-8">
                    "Kami bukan sekadar platform booking. Kami adalah integrator sistem aviasi yang memastikan setiap koordinat perjalanan Anda tercatat dengan presisi tinggi."
                </p>
                <div class="grid grid-cols-2 gap-10">
                    <div class="bg-slate-50 p-6 rounded-lg">
                        <p class="text-4xl font-black text-brand leading-none mb-3">99%</p>
                        <p class="text-[9px] font-black text-slate-400 uppercase tracking-[0.2em]">Data Accuracy</p>
                    </div>
                    <div class="bg-slate-50 p-6 rounded-lg">
                        <p class="text-4xl font-black text-brand leading-none mb-3">24h</p>
                        <p class="text-[9px] font-black text-slate-400 uppercase tracking-[0.2em]">Real-time Sync</p>
                    </div>
                </div>
            </div>
            <div class="relative hidden lg:block">
                <img src="https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=800"
                     class="rounded shadow-2xl relative z-10 grayscale hover:grayscale-0 transition duration-1000" alt="About">
            </div>
        </div>
    </section>

    <section id="services" class="bg-slate-50 py-32 border-y border-slate-100">
        <div class="container mx-auto px-6">
            <div class="text-center max-w-2xl mx-auto mb-20">
                <span class="section-tag">Services</span>
                <h2 class="text-5xl font-black text-dark tracking-tighter uppercase mb-6">World Class Ecosystem</h2>
                <p class="text-slate-400 text-sm font-bold uppercase tracking-widest">Eksklusivitas dalam setiap proses reservasi.</p>
            </div>

            <div class="grid md:grid-cols-3 gap-8">
                <div class="pro-card p-12 bg-white hover:border-brand transition-all">
                    <div class="w-12 h-12 bg-blue-50 text-brand rounded flex items-center justify-center text-xl mb-8"><i class="fas fa-shield-halved"></i></div>
                    <h4 class="text-lg font-black text-dark mb-4 uppercase tracking-tighter">Cyber Security</h4>
                    <p class="text-slate-500 text-sm leading-relaxed">Proteksi data reservasi dengan enkripsi standar militer untuk keamanan mutlak.</p>
                </div>
                <div class="pro-card p-12 bg-white hover:border-brand transition-all">
                    <div class="w-12 h-12 bg-blue-50 text-brand rounded flex items-center justify-center text-xl mb-8"><i class="fas fa-bolt"></i></div>
                    <h4 class="text-lg font-black text-dark mb-4 uppercase tracking-tighter">Instant Booking</h4>
                    <p class="text-slate-500 text-sm leading-relaxed">Konfirmasi instan tanpa menunggu proses manual. Tiket Anda terbit dalam hitungan detik.</p>
                </div>
                <div class="pro-card p-12 bg-white hover:border-brand transition-all">
                    <div class="w-12 h-12 bg-blue-50 text-brand rounded flex items-center justify-center text-xl mb-8"><i class="fas fa-globe"></i></div>
                    <h4 class="text-lg font-black text-dark mb-4 uppercase tracking-tighter">Global Access</h4>
                    <p class="text-slate-500 text-sm leading-relaxed">Terhubung dengan ribuan rute domestik dan internasional melalui satu portal cerdas.</p>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-dark py-20 text-white">
        <div class="container mx-auto px-6">
            <div class="flex flex-col md:flex-row justify-between items-center gap-12 mb-20">
                <div class="text-center md:text-left">
                    <div class="flex items-center gap-2 justify-center md:justify-start mb-6">
                        <div class="w-8 h-8 bg-brand rounded flex items-center justify-center"><i class="fas fa-paper-plane text-xs"></i></div>
                        <span class="text-2xl font-black italic tracking-tighter uppercase">FlyBook</span>
                    </div>
                    <p class="text-slate-500 text-[10px] font-black uppercase tracking-[0.4em]">Integrated Aviation Network</p>
                </div>
                <div class="flex gap-16 text-[10px] font-black uppercase tracking-widest text-slate-400">
                    <a href="#" class="hover:text-white transition-colors">Support</a>
                    <a href="#" class="hover:text-white transition-colors">Privacy Policy</a>
                    <a href="#" class="hover:text-white transition-colors">Terms of Service</a>
                </div>
            </div>
            <p class="text-slate-700 text-center text-[9px] font-black uppercase tracking-[0.8em]">FlyBook Global — 2026. Official Enterprise Portal.</p>
        </div>
    </footer>

    <script>
        // 1. DYNAMIC DROPDOWN
        document.addEventListener("DOMContentLoaded", () => {
            const originSelect = document.getElementById("origin");
            const destSelect = document.getElementById("dest");

            const uniqueOrigins = [...new Set(FLIGHT_DATABASE.map(item => item.asal))];
            const uniqueDests = [...new Set(FLIGHT_DATABASE.map(item => item.tujuan))];

            const addOption = (select, text, val) => {
                const opt = document.createElement("option");
                opt.value = val;
                opt.textContent = text.toUpperCase();
                select.appendChild(opt);
            };

            addOption(originSelect, "Search Origin", "");
            uniqueOrigins.sort().forEach(city => addOption(originSelect, city, city));

            addOption(destSelect, "Search Destination", "");
            uniqueDests.sort().forEach(city => addOption(destSelect, city, city));
        });

        // 2. SEARCH ENGINE
        function searchFlights() {
            const btnText = document.getElementById("btnText");
            const loader = document.getElementById("loader");
            const flightGrid = document.getElementById("flightGrid");
            const results = document.getElementById("results");

            btnText.classList.add("hidden");
            loader.classList.remove("hidden");

            setTimeout(() => {
                const origin = document.getElementById("origin").value;
                const dest = document.getElementById("dest").value;
                const date = document.getElementById("date").value;

                const filtered = FLIGHT_DATABASE.filter(f =>
                    (!origin || f.asal === origin) &&
                    (!dest || f.tujuan === dest) &&
                    (!date || f.tanggal === date)
                );

                flightGrid.innerHTML = "";
                if (filtered.length > 0) {
                    filtered.forEach(f => {
                        flightGrid.innerHTML += `
                            <div class="flight-row p-8 flex flex-col md:flex-row items-center justify-between gap-10">
                                <div class="flex items-center gap-6 md:w-1/4">
                                    <div class="w-12 h-12 bg-dark text-white rounded-md flex items-center justify-center font-black italic text-xs border border-slate-800">FB</div>
                                    <div>
                                        <p class="font-black text-dark text-lg leading-none uppercase mb-1">\${f.maskapai}</p>
                                        <div class="flex items-center gap-2">
                                            <p class="text-[9px] font-black text-slate-400 uppercase tracking-widest">\${f.kode}</p>
                                            <span class="w-1 h-1 bg-slate-200 rounded-full"></span>
                                            <p class="text-[9px] font-black text-brand uppercase tracking-widest">\${f.tanggal}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex-1 flex justify-center items-center gap-12 border-x border-slate-50 px-10">
                                    <div class="text-center">
                                        <p class="text-3xl font-black text-dark tracking-tighter leading-none">\${f.jamBerangkat}</p>
                                        <p class="text-[10px] font-black text-slate-400 uppercase mt-2 tracking-widest">\${f.asal}</p>
                                    </div>
                                    <i class="fas fa-plane text-slate-200 text-xs"></i>
                                    <div class="text-center">
                                        <p class="text-3xl font-black text-dark tracking-tighter leading-none">\${f.jamTiba}</p>
                                        <p class="text-[10px] font-black text-slate-400 uppercase mt-2 tracking-widest">\${f.tujuan}</p>
                                    </div>
                                </div>
                                <div class="md:w-1/4 text-right">
                                    <p class="text-2xl font-black text-brand tracking-tighter mb-4 italic">IDR \${f.harga.toLocaleString()}</p>
                                    <a href="/dashboard/user/tiket/\${f.id}/book" class="btn bg-dark text-white border-none rounded-md px-12 font-black text-[9px] uppercase tracking-[0.2em] h-10 hover:bg-brand transition-all">Select</a>
                                </div>
                            </div>
                        `;
                    });
                    document.getElementById("count").innerText = filtered.length;
                } else {
                    flightGrid.innerHTML = `<div class="p-24 text-center border-2 border-dashed border-slate-200 rounded-xl font-black text-slate-300 uppercase text-[10px] tracking-widest bg-slate-50/50">Database Log: 0 Matches for current criteria.</div>`;
                    document.getElementById("count").innerText = "0";
                }

                results.classList.remove("hidden");
                btnText.classList.remove("hidden");
                loader.classList.add("hidden");
                results.scrollIntoView({ behavior: "smooth" });
            }, 600);
        }
    </script>
</body>
</html>
