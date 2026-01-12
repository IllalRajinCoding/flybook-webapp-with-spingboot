<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id" data-theme="cupcake">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Galeri Visual | FlyBook Experience</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: { sans: ["Plus Jakarta Sans", "sans-serif"] },
                    colors: { 
                        brand: "#65c3c8", // Teal lembut khas tema cupcake
                        softBase: "#FAF7F5" 
                    },
                },
            },
        };
    </script>
    
    <style>
        body { background-color: #FAF7F5; }
        .masonry-item { break-inside: avoid; margin-bottom: 2rem; opacity: 0; animation: fadeInUp 0.8s ease-out forwards; }
        .outline-text { -webkit-text-stroke: 1px #e2e8f0; color: transparent; }
        
        /* Animasi Gambar Ramah & Halus */
        .img-container img { 
            filter: sepia(20%) brightness(95%); /* Memberikan kesan hangat */
            transition: all 1s cubic-bezier(0.4, 0, 0.2, 1); 
            transform: scale(1);
        }
        
        .group:hover .img-container img { 
            filter: sepia(0%) brightness(100%); 
            transform: scale(1.05); 
        }

        /* Overlay Content yang lebih soft */
        .overlay-content {
            transition: all 0.5s ease;
            opacity: 0;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(4px);
        }
        .group:hover .overlay-content {
            opacity: 1;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="text-slate-600 antialiased overflow-x-hidden">

    <nav class="h-24 flex items-center justify-between px-8 md:px-12 max-w-7xl mx-auto">
        <a href="/" class="flex items-center gap-3 group">
            <span class="text-xl font-bold tracking-tight text-slate-800 italic">FlyBook</span>
        </a>
        <a href="/" class="btn btn-ghost btn-sm rounded-xl font-bold text-xs capitalize">
            <i class="fas fa-arrow-left mr-2"></i> Kembali ke Beranda
        </a>
    </nav>

    <header class="max-w-7xl mx-auto px-8 md:px-12 pt-20 pb-16 relative">
        <div class="absolute -top-10 left-10 outline-text text-[10rem] md:text-[15rem] font-black opacity-30 pointer-events-none select-none">
            ALBUM
        </div>
        <div class="relative z-10">
            <span class="inline-block py-1 px-4 bg-primary/10 text-primary text-[10px] font-bold uppercase tracking-widest rounded-full mb-6">Koleksi Visual 2026</span>
            <h1 class="text-6xl md:text-8xl font-extrabold tracking-tight text-slate-800 leading-none mb-6">
                Momen <br> <span class="text-primary italic">Terbaik Kita.</span>
            </h1>
            <p class="max-w-md text-slate-400 font-medium leading-relaxed">Melihat kembali perjalanan udara yang penuh kenyamanan dan layanan sepenuh hati.</p>
        </div>
    </header>

    <section class="max-w-7xl mx-auto px-8 md:px-12 pb-40">
        <div class="columns-1 md:columns-2 lg:columns-3 gap-8">
            
            <div class="masonry-item group cursor-pointer" style="animation-delay: 0.1s">
                <div class="img-container relative overflow-hidden rounded-[2.5rem] bg-white aspect-[4/5] shadow-sm border border-white">
                    <img src="https://raw.githubusercontent.com/IllalRajinCoding/content/main/5ee9c774-a5ed-47af-a83c-66bbbfaf6b71_jakarta-airport-lounge-large.webp" 
                         class="w-full h-full object-cover" alt="Lounge">
                    <div class="absolute inset-0 p-8 flex items-center justify-center">
                        <div class="overlay-content p-6 rounded-3xl text-center w-full max-w-[200px]">
                            <span class="text-primary font-bold text-[10px] uppercase tracking-widest mb-1 block">Interior</span>
                            <h4 class="text-slate-800 text-lg font-bold">Kabin Eksekutif</h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="masonry-item p-10 bg-primary rounded-[2.5rem] text-zinc-800 flex flex-col justify-between aspect-square shadow-lg shadow-primary/20" style="animation-delay: 0.2s">
                <div class="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center">
                    <i class="fas fa-crown text-xl"></i>
                </div>
                <div>
                    <h3 class="text-2xl font-bold leading-tight mb-4">Layanan Kabin Terbaik Dunia 2024</h3>
                    <p class="text-[10px] font-bold uppercase tracking-[0.2em] opacity-80">Skytrax Global Recognition</p>
                </div>
            </div>

            <div class="masonry-item group cursor-pointer pt-12" style="animation-delay: 0.3s">
                <div class="img-container relative overflow-hidden rounded-[2.5rem] bg-white aspect-square shadow-sm border border-white text-center">
                    <img src="https://images.unsplash.com/photo-1569154941061-e231b4725ef1?q=80&w=1000" 
                         class="w-full h-full object-cover" alt="Cockpit">
                    <div class="absolute inset-0 p-8 flex items-center justify-center">
                        <div class="overlay-content p-6 rounded-3xl text-center w-full max-w-[200px]">
                            <span class="text-primary font-bold text-[10px] uppercase tracking-widest mb-1 block">Teknologi</span>
                            <h4 class="text-slate-800 text-lg font-bold">Sistem Navigasi</h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="masonry-item group cursor-pointer" style="animation-delay: 0.4s">
                <div class="img-container relative overflow-hidden rounded-[2.5rem] bg-white aspect-[3/4] shadow-sm border border-white">
                    <img src="https://raw.githubusercontent.com/IllalRajinCoding/content/main/courses-5.webp" 
                         class="w-full h-full object-cover" alt="Service">
                    <div class="absolute inset-0 p-8 flex items-center justify-center">
                        <div class="overlay-content p-6 rounded-3xl text-center w-full max-w-[200px]">
                            <span class="text-primary font-bold text-[10px] uppercase tracking-widest mb-1 block">Hospitality</span>
                            <h4 class="text-slate-800 text-lg font-bold">Layanan Personal</h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="masonry-item p-10 bg-[#ffb3c1] rounded-[2.5rem] text-white flex flex-col justify-between aspect-square shadow-lg shadow-pink-200" style="animation-delay: 0.5s">
                <div class="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center">
                    <i class="fas fa-heart text-xl"></i>
                </div>
                <div>
                    <h3 class="text-2xl font-bold leading-tight mb-4 text-white">Dipercaya oleh 15 Juta Penumpang</h3>
                    <p class="text-[10px] font-bold uppercase tracking-[0.2em] opacity-80">FlyBook Community Hub</p>
                </div>
            </div>

            <div class="masonry-item group cursor-pointer pt-6" style="animation-delay: 0.6s">
                <div class="img-container relative overflow-hidden rounded-[2.5rem] bg-white aspect-video shadow-sm border border-white">
                    <img src="https://raw.githubusercontent.com/IllalRajinCoding/content/main/GalenBurrows-9056-1440x960.jpg" 
                         class="w-full h-full object-cover" alt="Aerial">
                    <div class="absolute inset-0 p-8 flex items-center justify-center">
                        <div class="overlay-content p-6 rounded-3xl text-center w-full max-w-[200px]">
                            <span class="text-primary font-bold text-[10px] uppercase tracking-widest mb-1 block">Armada</span>
                            <h4 class="text-slate-800 text-lg font-bold">Unit Modern</h4>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <footer class="py-20 bg-white border-t border-base-200">
        <div class="max-w-7xl mx-auto px-12 flex flex-col md:flex-row justify-between items-center gap-6">
            <div class="flex items-center gap-3 opacity-60">
                <div class="w-8 h-8 bg-primary rounded-xl flex items-center justify-center text-white">
                    <i class="fas fa-wind text-xs"></i>
                </div>
                <span class="font-bold text-sm">FlyBook Visual Archive</span>
            </div>
            <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[0.4em]">© 2026 FlyBook Global. Melayani dengan hati.</p>
        </div>
    </footer>

</body>
</html>