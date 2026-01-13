<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Galeri Visual | FlyBook Enterprise</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: { sans: ["Plus Jakarta Sans", "sans-serif"] },
                    colors: { 
                        brand: "#1e40af", // Indigo 800
                        dark: "#0f172a",  // Slate 900
                    },
                },
            },
        };
    </script>
    
    <style>
        body { background-color: #ffffff; color: #1e293b; }
        .masonry-item { break-inside: avoid; margin-bottom: 2rem; }
        
        /* Outline Text Style */
        .outline-text { 
            -webkit-text-stroke: 1.5px #f1f5f9; 
            color: transparent; 
            letter-spacing: -0.02em;
        }
        
        /* Modern Image Container */
        .img-box { 
            position: relative;
            overflow: hidden;
            border-radius: 0.5rem;
            border: 1px solid #e2e8f0;
            background: #f8fafc;
        }

        .img-box img { 
            transition: transform 1.2s cubic-bezier(0.2, 1, 0.3, 1); 
        }
        
        .group:hover .img-box img { 
            transform: scale(1.08); 
        }

        /* Information Overlay */
        .info-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 2rem;
            background: linear-gradient(to top, rgba(15, 23, 42, 0.9) 0%, transparent 100%);
            transform: translateY(10px);
            opacity: 0;
            transition: all 0.5s ease;
        }

        .group:hover .info-overlay {
            opacity: 1;
            transform: translateY(0);
        }

        .animate-reveal {
            animation: reveal 1s cubic-bezier(0.2, 1, 0.3, 1) forwards;
        }

        @keyframes reveal {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="antialiased overflow-x-hidden">

    <nav class="fixed top-0 w-full z-50 bg-white/80 backdrop-blur-md border-b border-slate-100 h-16 flex items-center">
        <div class="max-w-7xl mx-auto w-full px-6 flex justify-between items-center">
            <a href="/" class="flex items-center gap-2">
                <div class="w-7 h-7 bg-brand rounded flex items-center justify-center text-white">
                    <i class="fas fa-paper-plane text-[10px]"></i>
                </div>
                <span class="text-lg font-black italic tracking-tighter text-dark uppercase">FlyBook</span>
            </a>
            <a href="/" class="text-[10px] font-black uppercase tracking-widest text-slate-400 hover:text-brand transition-colors">
                <i class="fas fa-arrow-left mr-2"></i> Kembali ke Home
            </a>
        </div>
    </nav>

    <header class="max-w-7xl mx-auto px-6 pt-40 pb-20 relative">
        <div class="absolute top-20 left-0 outline-text text-[12rem] md:text-[18rem] font-black opacity-60 pointer-events-none select-none z-0 uppercase">
            Visual
        </div>
        <div class="relative z-10 animate-reveal">
            <span class="inline-block py-1.5 px-4 bg-blue-50 border border-blue-100 text-brand text-[9px] font-black uppercase tracking-[0.3em] rounded mb-8">
                Corporate Portfolio 2026
            </span>
            <h1 class="text-6xl md:text-8xl font-black tracking-tighter text-dark leading-none mb-8">
                The Gallery of <br> <span class="text-brand italic">Excellence.</span>
            </h1>
            <p class="max-w-md text-slate-500 font-medium leading-relaxed border-l-4 border-slate-100 pl-8">
                Dokumentasi dedikasi kami dalam menghadirkan standar kenyamanan tertinggi di setiap koordinat perjalanan udara.
            </p>
        </div>
    </header>

    <section class="max-w-7xl mx-auto px-6 pb-40">
        <div class="columns-1 md:columns-2 lg:columns-3 gap-8">
            
            <div class="masonry-item group cursor-pointer animate-reveal" style="animation-delay: 0.1s">
                <div class="img-box aspect-[4/5]">
                    <img src="https://raw.githubusercontent.com/IllalRajinCoding/content/main/5ee9c774-a5ed-47af-a83c-66bbbfaf6b71_jakarta-airport-lounge-large.webp" 
                         class="w-full h-full object-cover grayscale group-hover:grayscale-0" alt="Lounge">
                    <div class="info-overlay">
                        <span class="text-blue-400 font-black text-[9px] uppercase tracking-widest mb-1 block">Interior Architecture</span>
                        <h4 class="text-white text-xl font-black uppercase tracking-tight">VVIP Lounge Terminal 3</h4>
                    </div>
                </div>
            </div>

            <div class="masonry-item p-12 bg-dark rounded shadow-2xl flex flex-col justify-between aspect-square animate-reveal" style="animation-delay: 0.2s">
                <div class="w-10 h-10 border border-white/20 rounded flex items-center justify-center text-white">
                    <i class="fas fa-certificate text-sm"></i>
                </div>
                <div>
                    <p class="text-brand font-black text-[9px] uppercase tracking-[0.3em] mb-4">Achievement</p>
                    <h3 class="text-2xl font-black leading-tight text-white uppercase tracking-tighter italic">World's Best Cabin Services — Global 2026</h3>
                </div>
            </div>

            <div class="masonry-item group cursor-pointer animate-reveal" style="animation-delay: 0.3s">
                <div class="img-box aspect-square">
                    <img src="https://images.unsplash.com/photo-1569154941061-e231b4725ef1?q=80&w=1000" 
                         class="w-full h-full object-cover grayscale group-hover:grayscale-0" alt="Cockpit">
                    <div class="info-overlay">
                        <span class="text-blue-400 font-black text-[9px] uppercase tracking-widest mb-1 block">Advanced Tech</span>
                        <h4 class="text-white text-xl font-black uppercase tracking-tight">Glass Cockpit Avionics</h4>
                    </div>
                </div>
            </div>

            <div class="masonry-item group cursor-pointer animate-reveal" style="animation-delay: 0.4s">
                <div class="img-box aspect-[3/5]">
                    <img src="https://raw.githubusercontent.com/IllalRajinCoding/content/main/courses-5.webp" 
                         class="w-full h-full object-cover grayscale group-hover:grayscale-0" alt="Service">
                    <div class="info-overlay">
                        <span class="text-blue-400 font-black text-[9px] uppercase tracking-widest mb-1 block">Human Capital</span>
                        <h4 class="text-white text-xl font-black uppercase tracking-tight">Hospitality Standards</h4>
                    </div>
                </div>
            </div>

            <div class="masonry-item p-12 bg-brand rounded flex flex-col justify-between aspect-square animate-reveal" style="animation-delay: 0.5s">
                <div class="text-white">
                    <i class="fas fa-users text-4xl opacity-20"></i>
                </div>
                <div>
                    <h3 class="text-4xl font-black text-white tracking-tighter mb-2 italic">15.2M+</h3>
                    <p class="text-white/60 text-[10px] font-black uppercase tracking-[0.2em]">Validated Yearly Passenger</p>
                </div>
            </div>

            <div class="masonry-item group cursor-pointer animate-reveal" style="animation-delay: 0.6s">
                <div class="img-box aspect-video">
                    <img src="https://raw.githubusercontent.com/IllalRajinCoding/content/main/GalenBurrows-9056-1440x960.jpg" 
                         class="w-full h-full object-cover grayscale group-hover:grayscale-0" alt="Fleet">
                    <div class="info-overlay">
                        <span class="text-blue-400 font-black text-[9px] uppercase tracking-widest mb-1 block">Fleet Management</span>
                        <h4 class="text-white text-xl font-black uppercase tracking-tight">Wide-Body Aircrafts</h4>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <footer class="py-12 bg-white border-t border-slate-100">
        <div class="max-w-7xl mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-8">
            <div class="flex items-center gap-3 opacity-40">
                <i class="fas fa-paper-plane text-brand"></i>
                <span class="font-black text-xs uppercase tracking-widest">Visual Archive 2026</span>
            </div>
            <p class="text-slate-400 text-[9px] font-black uppercase tracking-[0.6em]">© FlyBook Global Edition. Secure Aviation Network.</p>
        </div>
    </footer>

</body>
</html>