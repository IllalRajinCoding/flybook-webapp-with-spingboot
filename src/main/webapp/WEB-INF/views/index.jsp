<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id" class="scroll-smooth">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FlyBook - Discover Elegance</title>

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
            fontFamily: {
              sans: ["Poppins", "sans-serif"],
            },
            colors: {
              stone: {
                50: "#fafaf9",
                100: "#f5f5f4",
                200: "#e7e5e4",
                300: "#d6d3d1",
                400: "#a8a29e",
                500: "#78716c",
                600: "#57534e",
                700: "#44403c",
                800: "#292524",
                900: "#1c1917",
              },
            },
            transitionTimingFunction: {
              "out-expo": "cubic-bezier(0.19, 1, 0.22, 1)",
            },
          },
        },
      };
    </script>

    <style>
      /* Hide Scrollbar but keep functionality */
      .hide-scrollbar::-webkit-scrollbar {
        display: none;
      }
      .hide-scrollbar {
        -ms-overflow-style: none;
        scrollbar-width: none;
      }

      /* Glass Effect */
      .glass-panel {
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.5);
      }

      /* Card Hover Overlay Gradient */
      .card-gradient {
        background: linear-gradient(
          to top,
          rgba(28, 25, 23, 0.9) 0%,
          rgba(28, 25, 23, 0.4) 40%,
          transparent 100%
        );
      }

      /* Plane Animation */
      @keyframes flyIn {
        0% {
          transform: translateX(-20px) translateY(10px) rotate(-10deg);
          opacity: 0;
        }
        100% {
          transform: translateX(0) translateY(0) rotate(0);
          opacity: 1;
        }
      }
      @keyframes flyOut {
        0% {
          transform: translateX(0) translateY(0) rotate(0);
          opacity: 1;
        }
        100% {
          transform: translateX(20px) translateY(-10px) rotate(10deg);
          opacity: 0;
        }
      }
      .animate-fly-in {
        animation: flyIn 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
      }
      .animate-fly-out {
        animation: flyOut 0.5s ease-in forwards;
      }
    </style>
  </head>
  <body
    class="bg-stone-50 text-stone-800 antialiased selection:bg-stone-800 selection:text-white"
  >
    <nav
      id="navbar"
      class="fixed w-full z-50 py-5 px-6 lg:px-12 transition-all duration-300"
    >
      <div class="max-w-7xl mx-auto flex justify-between items-center">
        <div class="flex items-center gap-3">
          <div
            id="logo-icon-container"
            class="w-10 h-10 bg-stone-900 rounded-xl flex items-center justify-center text-white shadow-lg shadow-stone-900/20 overflow-hidden"
          >
            <i
              id="logo-plane"
              class="fas fa-plane text-sm transform transition-transform"
            ></i>
          </div>
          <span class="font-bold text-xl tracking-tight text-stone-900"
            >FlyBook.</span
          >
        </div>

        <div class="hidden md:flex gap-8 text-sm font-medium text-stone-500">
          <a href="#" class="hover:text-stone-900 transition-colors">Beranda</a>
          <a href="#destinations" class="hover:text-stone-900 transition-colors"
            >Destinasi</a
          >
          <a href="#partners" class="hover:text-stone-900 transition-colors"
            >Partner</a
          >
        </div>

        <div class="flex items-center gap-4">
            <a href="/login">
                <button
                  class="hidden md:block text-sm font-semibold text-stone-600 hover:text-stone-900"
                >
                  Masuk
                </button>
            </a>
            <a href="/register">
              <button
                class="bg-stone-900 hover:bg-stone-800 text-white px-6 py-2.5 rounded-full text-sm font-medium transition-all shadow-xl shadow-stone-900/10 hover:shadow-stone-900/20 hover:-translate-y-0.5"
              >
                Daftar
              </button>
            </a>
        </div>
      </div>
    </nav>

    <header
      class="relative pt-32 pb-32 px-6 lg:px-12 overflow-hidden min-h-[90vh] flex items-center"
    >
      <div
        class="absolute top-0 right-0 w-[800px] h-[800px] bg-gradient-to-bl from-stone-200/50 to-transparent rounded-full blur-3xl -translate-y-1/2 translate-x-1/3"
      ></div>
      <div
        class="absolute bottom-0 left-0 w-[600px] h-[600px] bg-stone-200/30 rounded-full blur-3xl translate-y-1/3 -translate-x-1/4"
      ></div>

      <div
        class="container mx-auto relative z-10 grid grid-cols-1 lg:grid-cols-2 gap-12 items-center"
      >
        <div class="max-w-2xl">
          <div
            class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-stone-100 border border-stone-200 text-stone-600 text-xs font-semibold tracking-wide mb-8"
          >
            <span
              class="w-2 h-2 rounded-full bg-green-500 animate-pulse"
            ></span>
            EXPLORE THE UNSEEN
          </div>
          <h1
            class="text-5xl lg:text-7xl font-bold text-stone-900 mb-8 leading-[1.1] tracking-tight"
          >
            Terbang Tanpa <br />
            <span class="text-stone-400 italic font-light">Batas Ruang.</span>
          </h1>
          <p class="text-lg text-stone-500 mb-10 max-w-lg leading-relaxed">
            Kami menyederhanakan cara Anda melihat dunia. Booking tiket pesawat
            dengan pengalaman visual yang menenangkan dan harga transparan.
          </p>

          <div
            class="glass-panel p-2 rounded-2xl inline-flex items-center gap-2 max-w-md w-full shadow-sm"
          >
            <div class="pl-4 text-stone-400"><i class="fas fa-search"></i></div>
            <input
              type="text"
              placeholder="Mau terbang ke mana?"
              class="bg-transparent border-none focus:ring-0 text-stone-800 placeholder-stone-400 flex-1 text-sm py-3 px-2 outline-none"
            />
            <button
              class="bg-stone-900 text-white w-10 h-10 rounded-xl flex items-center justify-center hover:bg-stone-800 transition-colors"
            >
              <i class="fas fa-arrow-right"></i>
            </button>
          </div>
        </div>

        <div class="relative hidden lg:block h-[500px]">
          <div
            class="absolute inset-0 bg-stone-200 rounded-[3rem] rotate-3 overflow-hidden"
          >
            <img
              alt=""
              src="https://images.unsplash.com/photo-1436491865332-7a61a109cc05?q=80&w=2074&auto=format&fit=crop"
              class="w-full h-full object-cover opacity-80 grayscale hover:grayscale-0 transition-all duration-1000"
            />
          </div>
          <div
            class="absolute inset-0 border-2 border-stone-900 rounded-[3rem] -rotate-3 bg-transparent pointer-events-none"
          ></div>
        </div>
      </div>
    </header>

    <section id="destinations" class="py-24 overflow-hidden bg-white">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="flex flex-col md:flex-row justify-between items-end mb-12">
          <div>
            <h2 class="text-3xl font-bold text-stone-900 mb-3">
              Harga Spesial ke <br />Destinasi Favorit
            </h2>
            <p class="text-stone-500">
              Geser untuk menemukan surga tersembunyi.
            </p>
          </div>

          <div class="flex gap-4 mt-6 md:mt-0">
            <button
              onclick="scrollSlider(-1)"
              class="w-12 h-12 rounded-full border border-stone-200 flex items-center justify-center hover:bg-stone-900 hover:text-white transition-all duration-300"
            >
              <i class="fas fa-arrow-left"></i>
            </button>
            <button
              onclick="scrollSlider(1)"
              class="w-12 h-12 rounded-full border border-stone-200 flex items-center justify-center hover:bg-stone-900 hover:text-white transition-all duration-300"
            >
              <i class="fas fa-arrow-right"></i>
            </button>
          </div>
        </div>

        <div
          id="slider-container"
          class="flex gap-6 overflow-x-auto hide-scrollbar pb-12 snap-x snap-mandatory px-2"
        >
          <div
            class="min-w-[300px] md:min-w-[350px] aspect-[4/5] relative group rounded-3xl overflow-hidden cursor-pointer shadow-lg shadow-stone-200 snap-center"
          >
            <img
              src="https://images.unsplash.com/photo-1555400038-63f5ba517a47?q=80&w=2070&auto=format&fit=crop"
              class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
              alt="bali"
            />
            <div
              class="absolute inset-0 card-gradient opacity-60 group-hover:opacity-90 transition-opacity duration-500"
            ></div>

            <div
              class="absolute bottom-0 left-0 w-full p-6 translate-y-8 group-hover:translate-y-0 transition-transform duration-500 ease-out-expo"
            >
              <span
                class="inline-block px-3 py-1 bg-white/20 backdrop-blur-md text-white text-xs font-medium rounded-lg mb-3 border border-white/10"
              >
                Terpopuler
              </span>
              <h3 class="text-2xl font-bold text-white mb-1">
                Bali, Indonesia
              </h3>
              <p class="text-stone-300 text-sm mb-6 flex items-center gap-2">
                <i class="fas fa-plane-departure text-xs"></i> Langsung dari
                Jakarta
              </p>

              <div
                class="flex items-center justify-between opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100"
              >
                <div>
                  <p class="text-xs text-stone-400">Mulai dari</p>
                  <p class="text-xl font-bold text-white">IDR 850rb</p>
                </div>
                <button
                  class="bg-white text-stone-900 px-5 py-2 rounded-full text-sm font-bold hover:bg-stone-200 transition-colors"
                >
                  Pesan
                </button>
              </div>
            </div>
          </div>

          <div
            class="min-w-[300px] md:min-w-[350px] aspect-[4/5] relative group rounded-3xl overflow-hidden cursor-pointer shadow-lg shadow-stone-200 snap-center"
          >
            <img
              alt="#"
              src="https://images.unsplash.com/photo-1503899036084-c55cdd92da26?q=80&w=1974&auto=format&fit=crop"
              class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
            />
            <div
              class="absolute inset-0 card-gradient opacity-60 group-hover:opacity-90 transition-opacity duration-500"
            ></div>

            <div
              class="absolute bottom-0 left-0 w-full p-6 translate-y-8 group-hover:translate-y-0 transition-transform duration-500 ease-out-expo"
            >
              <span
                class="inline-block px-3 py-1 bg-white/20 backdrop-blur-md text-white text-xs font-medium rounded-lg mb-3 border border-white/10"
              >
                Internasional
              </span>
              <h3 class="text-2xl font-bold text-white mb-1">Tokyo, Jepang</h3>
              <p class="text-stone-300 text-sm mb-6 flex items-center gap-2">
                <i class="fas fa-plane-departure text-xs"></i> Transit 1x
              </p>

              <div
                class="flex items-center justify-between opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100"
              >
                <div>
                  <p class="text-xs text-stone-400">Mulai dari</p>
                  <p class="text-xl font-bold text-white">IDR 5.2Jt</p>
                </div>
                <button
                  class="bg-white text-stone-900 px-5 py-2 rounded-full text-sm font-bold hover:bg-stone-200 transition-colors"
                >
                  Pesan
                </button>
              </div>
            </div>
          </div>

          <div
            class="min-w-[300px] md:min-w-[350px] aspect-[4/5] relative group rounded-3xl overflow-hidden cursor-pointer shadow-lg shadow-stone-200 snap-center"
          >
            <img
              alt="#"
              src="https://images.unsplash.com/photo-1596423736783-cd55d8d0981e?q=80&w=1974&auto=format&fit=crop"
              class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
            />
            <div
              class="absolute inset-0 card-gradient opacity-60 group-hover:opacity-90 transition-opacity duration-500"
            ></div>

            <div
              class="absolute bottom-0 left-0 w-full p-6 translate-y-8 group-hover:translate-y-0 transition-transform duration-500 ease-out-expo"
            >
              <span
                class="inline-block px-3 py-1 bg-white/20 backdrop-blur-md text-white text-xs font-medium rounded-lg mb-3 border border-white/10"
              >
                Eksotis
              </span>
              <h3 class="text-2xl font-bold text-white mb-1">Labuan Bajo</h3>
              <p class="text-stone-300 text-sm mb-6 flex items-center gap-2">
                <i class="fas fa-plane-departure text-xs"></i> Langsung
              </p>

              <div
                class="flex items-center justify-between opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100"
              >
                <div>
                  <p class="text-xs text-stone-400">Mulai dari</p>
                  <p class="text-xl font-bold text-white">IDR 1.4Jt</p>
                </div>
                <button
                  class="bg-white text-stone-900 px-5 py-2 rounded-full text-sm font-bold hover:bg-stone-200 transition-colors"
                >
                  Pesan
                </button>
              </div>
            </div>
          </div>

          <div
            class="min-w-[300px] md:min-w-[350px] aspect-[4/5] relative group rounded-3xl overflow-hidden cursor-pointer shadow-lg shadow-stone-200 snap-center"
          >
            <img
              alt="#"
              src="https://images.unsplash.com/photo-1565967511849-76a60a516170?q=80&w=2071&auto=format&fit=crop"
              class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
            />
            <div
              class="absolute inset-0 card-gradient opacity-60 group-hover:opacity-90 transition-opacity duration-500"
            ></div>

            <div
              class="absolute bottom-0 left-0 w-full p-6 translate-y-8 group-hover:translate-y-0 transition-transform duration-500 ease-out-expo"
            >
              <span
                class="inline-block px-3 py-1 bg-white/20 backdrop-blur-md text-white text-xs font-medium rounded-lg mb-3 border border-white/10"
              >
                Kota
              </span>
              <h3 class="text-2xl font-bold text-white mb-1">Singapore</h3>
              <p class="text-stone-300 text-sm mb-6 flex items-center gap-2">
                <i class="fas fa-plane-departure text-xs"></i> Langsung
              </p>

              <div
                class="flex items-center justify-between opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100"
              >
                <div>
                  <p class="text-xs text-stone-400">Mulai dari</p>
                  <p class="text-xl font-bold text-white">IDR 900rb</p>
                </div>
                <button
                  class="bg-white text-stone-900 px-5 py-2 rounded-full text-sm font-bold hover:bg-stone-200 transition-colors"
                >
                  Pesan
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- More Destinations Button -->
        <div class="text-center mt-12">
          <button
            id="moreDestinationsBtn"
            onclick="handleMoreDestinations()"
            class="group relative px-8 py-4 bg-stone-900 hover:bg-stone-800 text-white rounded-full font-semibold shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-300 flex items-center gap-3 mx-auto"
          >
            <span>Lihat Destinasi Lainnya</span>
            <i
              class="fas fa-arrow-right group-hover:translate-x-1 transition-transform"
            ></i>
          </button>
        </div>
      </div>
    </section>

    <section id="partners" class="py-20 bg-stone-100 border-t border-stone-200">
      <div class="container mx-auto px-6 lg:px-12 text-center">
        <p
          class="text-stone-400 text-sm font-medium tracking-widest uppercase mb-12"
        >
          Official Airline Partners
        </p>

        <div
          class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-8 items-center justify-items-center opacity-70"
        >
          <div
            class="group flex items-center gap-2 text-stone-400 hover:text-stone-800 transition-colors duration-300 cursor-pointer"
          >
            <i class="fas fa-feather-alt text-2xl"></i>
            <span class="font-bold text-lg">Garuda</span>
          </div>

          <div
            class="group flex items-center gap-2 text-stone-400 hover:text-red-600 transition-colors duration-300 cursor-pointer"
          >
            <i class="fas fa-plane-up text-2xl"></i>
            <span class="font-bold text-lg">AirAsia</span>
          </div>

          <div
            class="group flex items-center gap-2 text-stone-400 hover:text-orange-600 transition-colors duration-300 cursor-pointer"
          >
            <i class="fas fa-wind text-2xl"></i>
            <span class="font-bold text-lg">Jetstar</span>
          </div>

          <div
            class="group flex items-center gap-2 text-stone-400 hover:text-blue-900 transition-colors duration-300 cursor-pointer"
          >
            <i class="fas fa-globe-asia text-2xl"></i>
            <span class="font-bold text-lg">Singapore</span>
          </div>

          <div
            class="group flex items-center gap-2 text-stone-400 hover:text-green-700 transition-colors duration-300 cursor-pointer"
          >
            <i class="fas fa-leaf text-2xl"></i>
            <span class="font-bold text-lg">Citilink</span>
          </div>

          <div
            class="group flex items-center gap-2 text-stone-400 hover:text-purple-700 transition-colors duration-300 cursor-pointer"
          >
            <i class="fas fa-gem text-2xl"></i>
            <span class="font-bold text-lg">Qatar</span>
          </div>
        </div>

        <div
          class="mt-16 pt-8 border-t border-stone-200/50 w-full max-w-2xl mx-auto"
        >
          <p class="text-stone-400 text-sm">
            Bekerjasama dengan maskapai terbaik dunia untuk memastikan
            kenyamanan perjalanan Anda.
          </p>
        </div>
      </div>
    </section>

    <footer class="bg-stone-900 text-stone-400 py-20 rounded-t-[3rem] mt-12">
      <div class="container mx-auto px-6 lg:px-12">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">
          <div class="col-span-1 md:col-span-2">
            <div class="flex items-center gap-2 mb-6">
              <div
                class="w-8 h-8 bg-stone-100 rounded-lg flex items-center justify-center text-stone-900"
              >
                <i class="fas fa-paper-plane text-xs"></i>
              </div>
              <span class="font-bold text-2xl text-stone-100">FlyBook.</span>
            </div>
            <p class="max-w-md text-stone-500 leading-relaxed">
              Platform pemesanan tiket pesawat modern yang mengutamakan estetika
              dan kemudahan pengguna. Terbang lebih berkelas.
            </p>
          </div>
          <div>
            <h4 class="text-stone-100 font-bold mb-6">Eksplorasi</h4>
            <ul class="space-y-4 text-sm">
              <li>
                <a href="#" class="hover:text-stone-100 transition-colors"
                  >Destinasi Populer</a
                >
              </li>
              <li>
                <a href="#" class="hover:text-stone-100 transition-colors"
                  >Promo Terkini</a
                >
              </li>
              <li>
                <a href="#" class="hover:text-stone-100 transition-colors"
                  >Cari Penerbangan</a
                >
              </li>
            </ul>
          </div>
          <div>
            <h4 class="text-stone-100 font-bold mb-6">Perusahaan</h4>
            <ul class="space-y-4 text-sm">
              <li>
                <a href="#" class="hover:text-stone-100 transition-colors"
                  >Tentang Kami</a
                >
              </li>
              <li>
                <a href="#" class="hover:text-stone-100 transition-colors"
                  >Hubungi Kami</a
                >
              </li>
              <li>
                <a href="#" class="hover:text-stone-100 transition-colors"
                  >Partner Maskapai</a
                >
              </li>
            </ul>
          </div>
        </div>
        <div
          class="border-t border-stone-800 pt-8 flex flex-col md:flex-row justify-between items-center text-xs text-stone-600"
        >
          <p>&copy; 2023 FlyBook Inc. Jakarta, Indonesia.</p>
          <div class="flex gap-6 mt-4 md:mt-0">
            <a href="#" class="hover:text-white transition-colors">Instagram</a>
            <a href="#" class="hover:text-white transition-colors">Twitter</a>
            <a href="#" class="hover:text-white transition-colors">LinkedIn</a>
          </div>
        </div>
      </div>
    </footer>

    <script>
      // --- User Login Status (from backend) ---
      const isLoggedIn = ${isLoggedIn}; // Backend akan inject true/false

      // --- 1. Navbar Scroll Logic (The Plane Animation) ---
      let lastScrollTop = 0;
      const navbar = document.getElementById('navbar');
      const logoPlane = document.getElementById('logo-plane');
      const logoContainer = document.getElementById('logo-icon-container');

      window.addEventListener('scroll', function() {
          let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

          if (scrollTop > 50) {
              // Style when scrolled down
              navbar.classList.add('bg-white/80', 'backdrop-blur-md', 'shadow-sm', 'py-3');
              navbar.classList.remove('py-5');

              if (scrollTop > lastScrollTop) {
                  // SCROLL DOWN: Hide Plane (Fly Away)
                  logoPlane.classList.remove('animate-fly-in');
                  logoPlane.classList.add('animate-fly-out');
                  // Optional: Collapse container slightly
                  // logoContainer.classList.add('w-0', 'opacity-0', 'px-0');
              } else {
                  // SCROLL UP: Show Plane (Fly Back)
                  logoPlane.classList.remove('animate-fly-out');
                  logoPlane.classList.add('animate-fly-in');
                  // logoContainer.classList.remove('w-0', 'opacity-0', 'px-0');
              }
          } else {
              // Reset at top
              navbar.classList.remove('bg-white/80', 'backdrop-blur-md', 'shadow-sm', 'py-3');
              navbar.classList.add('py-5');
              logoPlane.classList.remove('animate-fly-out');
              logoPlane.classList.add('animate-fly-in');
          }
          lastScrollTop = scrollTop <= 0 ? 0 : scrollTop;
      });

      // --- 2. Horizontal Slider Logic ---
      function scrollSlider(direction) {
          const container = document.getElementById('slider-container');
          const scrollAmount = 350; // Width of card + gap

          container.scrollBy({
              left: direction * scrollAmount,
              behavior: 'smooth'
          });
      }

      // --- 3. More Destinations Button Logic ---
      function handleMoreDestinations() {
          if (!isLoggedIn) {
              // User belum login - tampilkan alert dan arahkan ke login
              const confirmLogin = confirm('Anda harus login terlebih dahulu untuk melihat destinasi lainnya. Apakah Anda ingin login sekarang?');
              if (confirmLogin) {
                  // Redirect ke halaman login (sesuaikan dengan route Anda)
                  window.location.href = '/login';
              }
          } else {
              // User sudah login - tampilkan destinasi tambahan
              showMoreDestinations();
          }
      }

      function showMoreDestinations() {
          const sliderContainer = document.getElementById('slider-container');

          // Data destinasi tambahan
          const moreDestinations = [
              {
                  image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?q=80&w=2070&auto=format&fit=crop',
                  badge: 'Romantis',
                  title: 'Paris, Prancis',
                  route: 'Transit 1x',
                  price: 'IDR 8.9Jt'
              },
              {
                  image: 'https://images.unsplash.com/photo-1518684079-3c830dcef090?q=80&w=1974&auto=format&fit=crop',
                  badge: 'Petualangan',
                  title: 'Dubai, UAE',
                  route: 'Langsung',
                  price: 'IDR 4.2Jt'
              },
              {
                  image: 'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?q=80&w=2070&auto=format&fit=crop',
                  badge: 'Modern',
                  title: 'London, UK',
                  route: 'Transit 1x',
                  price: 'IDR 9.5Jt'
              },
              {
                  image: 'https://images.unsplash.com/photo-1529963183134-61a90db47eaf?q=80&w=2070&auto=format&fit=crop',
                  badge: 'Tradisional',
                  title: 'Bangkok, Thailand',
                  route: 'Langsung',
                  price: 'IDR 1.8Jt'
              }
          ];

          // Tambahkan kartu destinasi baru
          moreDestinations.forEach(dest => {
              const card = createDestinationCard(dest);
              sliderContainer.innerHTML += card;
          });

          // Scroll ke destinasi baru dengan smooth animation
          setTimeout(() => {
              const lastCard = sliderContainer.lastElementChild;
              lastCard.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
          }, 100);

          // Sembunyikan tombol setelah klik
          document.getElementById('moreDestinationsBtn').style.display = 'none';

          // Tampilkan notifikasi sukses
          showNotification('✈️ Destinasi baru telah dimuat!');
      }

      function createDestinationCard(dest) {
          return `
              <div class="min-w-[300px] md:min-w-[350px] aspect-[4/5] relative group rounded-3xl overflow-hidden cursor-pointer shadow-lg shadow-stone-200 snap-center animate-fly-in">
                  <img alt="${dest.title}" src="${dest.image}" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">
                  <div class="absolute inset-0 card-gradient opacity-60 group-hover:opacity-90 transition-opacity duration-500"></div>

                  <div class="absolute bottom-0 left-0 w-full p-6 translate-y-8 group-hover:translate-y-0 transition-transform duration-500 ease-out-expo">
                      <span class="inline-block px-3 py-1 bg-white/20 backdrop-blur-md text-white text-xs font-medium rounded-lg mb-3 border border-white/10">
                          ${dest.badge}
                      </span>
                      <h3 class="text-2xl font-bold text-white mb-1">${dest.title}</h3>
                      <p class="text-stone-300 text-sm mb-6 flex items-center gap-2">
                          <i class="fas fa-plane-departure text-xs"></i> ${dest.route}
                      </p>

                      <div class="flex items-center justify-between opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                          <div>
                              <p class="text-xs text-stone-400">Mulai dari</p>
                              <p class="text-xl font-bold text-white">${dest.price}</p>
                          </div>
                          <button class="bg-white text-stone-900 px-5 py-2 rounded-full text-sm font-bold hover:bg-stone-200 transition-colors">
                              Pesan
                          </button>
                      </div>
                  </div>
              </div>
          `;
      }

      function showNotification(message) {
          const notification = document.createElement('div');
          notification.className = 'fixed top-24 right-6 bg-stone-900 text-white px-6 py-4 rounded-2xl shadow-2xl z-50 animate-fly-in';
          notification.innerHTML = `
              <div class="flex items-center gap-3">
                  <i class="fas fa-check-circle text-green-400"></i>
                  <span class="font-medium">${message}</span>
              </div>
          `;
          document.body.appendChild(notification);

          setTimeout(() => {
              notification.classList.add('animate-fly-out');
              setTimeout(() => notification.remove(), 500);
          }, 3000);
      }
    </script>
  </body>
</html>
