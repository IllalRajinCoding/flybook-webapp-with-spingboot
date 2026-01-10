<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<html lang="id" data-theme="light">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FlyBook - Premium Flight Booking</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/daisyui@4.4.19/dist/full.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            fontFamily: { sans: ["Inter", "sans-serif"] },
          },
        },
      };
    </script>
  </head>
  <body class="bg-base-100 font-sans">
    <!-- Navbar -->
    <div class="navbar bg-base-100 shadow-sm fixed top-0 z-50 px-4 lg:px-8">
      <div class="navbar-start">
        <a href="/" class="flex items-center gap-2">
          <div
            class="w-10 h-10 rounded-xl bg-primary flex items-center justify-center"
          >
            <i class="fas fa-plane text-white"></i>
          </div>
          <span class="text-xl font-black tracking-tight">FlyBook</span>
        </a>
      </div>
      <div class="navbar-center hidden lg:flex">
        <ul class="menu menu-horizontal px-1 gap-2">
          <li><a href="#" class="font-medium">Home</a></li>
          <li><a href="#search" class="font-medium">Search</a></li>
          <li><a href="#features" class="font-medium">Features</a></li>
          <li><a href="#about" class="font-medium">About</a></li>
        </ul>
      </div>
      <div class="navbar-end gap-2">
        <c:choose>
          <c:when test="${not empty sessionScope.userName}">
            <div class="dropdown dropdown-end">
              <div
                tabindex="0"
                role="button"
                class="btn btn-ghost btn-circle avatar placeholder"
              >
                <div class="bg-neutral text-neutral-content w-10 rounded-full">
                  <span class="text-sm"
                    >${sessionScope.userName.substring(0,1).toUpperCase()}</span
                  >
                </div>
              </div>
              <ul
                tabindex="0"
                class="dropdown-content menu bg-base-100 rounded-box z-[1] w-52 p-2 shadow-lg border"
              >
                <li class="menu-title px-4 py-2">
                  <span
                    class="text-xs font-semibold uppercase tracking-wider text-base-content/60"
                    >Signed in as</span
                  >
                  <span class="font-bold text-base-content"
                    >${sessionScope.userName}</span
                  >
                </li>
                <div class="divider my-0"></div>
                <li>
                  <a
                    href="/dashboard/${sessionScope.userRole == 'admin' ? 'admin' : 'user'}"
                    ><i class="fas fa-gauge-high mr-2"></i>Dashboard</a
                  >
                </li>
                <li>
                  <a href="/profile"><i class="fas fa-user mr-2"></i>Profile</a>
                </li>
                <div class="divider my-0"></div>
                <li>
                  <a href="/logout" class="text-error"
                    ><i class="fas fa-sign-out-alt mr-2"></i>Logout</a
                  >
                </li>
              </ul>
            </div>
          </c:when>
          <c:otherwise>
            <a href="/login" class="btn btn-ghost btn-sm">Sign In</a>
            <a href="/register" class="btn btn-primary btn-sm">Get Started</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>

    <!-- Hero Section -->
    <section
      class="min-h-screen pt-20 bg-gradient-to-br from-base-100 via-base-200 to-base-100 relative overflow-hidden"
    >
      <div class="absolute inset-0 opacity-5">
        <div
          class="absolute top-20 left-10 text-[20rem] font-black text-base-content select-none"
        >
          FLY
        </div>
      </div>

      <div class="container mx-auto px-4 lg:px-8 pt-20 lg:pt-32 relative z-10">
        <div class="grid lg:grid-cols-2 gap-12 items-center">
          <div class="space-y-8">
            <div class="badge badge-primary badge-outline gap-2 p-4">
              <i class="fas fa-shield-halved"></i>
              <span class="font-semibold">Trusted by 1M+ Travelers</span>
            </div>
            <h1 class="text-5xl lg:text-7xl font-black leading-tight">
              Book Your Next
              <span class="text-primary">Adventure</span>
            </h1>
            <p class="text-lg text-base-content/70 max-w-lg">
              Experience seamless flight booking with competitive prices, 24/7
              support, and instant confirmation.
            </p>
            <div class="flex flex-wrap gap-4">
              <a href="#search" class="btn btn-primary btn-lg gap-2">
                <i class="fas fa-search"></i>
                Search Flights
              </a>
              <a href="#features" class="btn btn-outline btn-lg gap-2">
                <i class="fas fa-play-circle"></i>
                Learn More
              </a>
            </div>

            <div class="flex gap-8 pt-8">
              <div>
                <div class="text-3xl font-black text-primary">500+</div>
                <div class="text-sm text-base-content/60">Destinations</div>
              </div>
              <div>
                <div class="text-3xl font-black text-primary">50+</div>
                <div class="text-sm text-base-content/60">Airlines</div>
              </div>
              <div>
                <div class="text-3xl font-black text-primary">1M+</div>
                <div class="text-sm text-base-content/60">Happy Customers</div>
              </div>
            </div>
          </div>

          <div class="hidden lg:block">
            <div class="relative">
              <div
                class="w-full aspect-square bg-gradient-to-br from-primary/20 to-secondary/20 rounded-full blur-3xl absolute -top-10 -right-10"
              ></div>
              <img
                src="https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=800&q=80"
                alt="Airplane"
                class="relative z-10 rounded-3xl shadow-2xl w-full object-cover aspect-[4/3]"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Search Section -->
    <section id="search" class="py-20 bg-base-200">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="text-center mb-12">
          <h2 class="text-3xl lg:text-4xl font-bold mb-4">
            Find Your Perfect Flight
          </h2>
          <p class="text-base-content/60 max-w-2xl mx-auto">
            Search from thousands of routes and get the best deals
          </p>
        </div>

        <div class="card bg-base-100 shadow-xl max-w-5xl mx-auto">
          <div class="card-body">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
              <div class="form-control">
                <label class="label">
                  <span class="label-text font-semibold"
                    ><i class="fas fa-plane-departure mr-2 text-primary"></i
                    >From</span
                  >
                </label>
                <select id="origin" class="select select-bordered w-full">
                  <option value="">Select Origin</option>
                  <option value="Jakarta">Jakarta (CGK)</option>
                  <option value="Surabaya">Surabaya (SUB)</option>
                  <option value="Bali">Bali (DPS)</option>
                  <option value="Medan">Medan (KNO)</option>
                  <option value="Makassar">Makassar (UPG)</option>
                </select>
              </div>
              <div class="form-control">
                <label class="label">
                  <span class="label-text font-semibold"
                    ><i class="fas fa-plane-arrival mr-2 text-primary"></i
                    >To</span
                  >
                </label>
                <select id="dest" class="select select-bordered w-full">
                  <option value="">Select Destination</option>
                  <option value="Jakarta">Jakarta (CGK)</option>
                  <option value="Surabaya">Surabaya (SUB)</option>
                  <option value="Bali">Bali (DPS)</option>
                  <option value="Medan">Medan (KNO)</option>
                  <option value="Makassar">Makassar (UPG)</option>
                </select>
              </div>
              <div class="form-control">
                <label class="label">
                  <span class="label-text font-semibold"
                    ><i class="fas fa-calendar mr-2 text-primary"></i>Date</span
                  >
                </label>
                <input
                  type="date"
                  id="date"
                  class="input input-bordered w-full"
                />
              </div>
              <div class="form-control justify-end">
                <button
                  onclick="searchFlights()"
                  class="btn btn-primary h-12 gap-2"
                >
                  <span id="btnText">Search</span>
                  <span
                    id="loader"
                    class="loading loading-spinner loading-sm hidden"
                  ></span>
                  <i class="fas fa-arrow-right" id="searchIcon"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Results Section -->
    <section id="results" class="py-20 bg-base-100 hidden">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="flex justify-between items-center mb-8">
          <div>
            <h2 class="text-2xl font-bold">Search Results</h2>
            <p id="count" class="text-base-content/60"></p>
          </div>
        </div>
        <div id="flightGrid" class="space-y-4"></div>
      </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-20 bg-base-100">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl lg:text-4xl font-bold mb-4">
            Why Choose FlyBook?
          </h2>
          <p class="text-base-content/60 max-w-2xl mx-auto">
            We provide the best experience for booking your flights
          </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
          <div
            class="card bg-base-200 hover:shadow-xl transition-all duration-300"
          >
            <div class="card-body items-center text-center">
              <div
                class="w-16 h-16 rounded-2xl bg-primary/10 flex items-center justify-center mb-4"
              >
                <i class="fas fa-tag text-2xl text-primary"></i>
              </div>
              <h3 class="card-title">Best Prices</h3>
              <p class="text-base-content/60">
                Get competitive prices with our price match guarantee
              </p>
            </div>
          </div>
          <div
            class="card bg-base-200 hover:shadow-xl transition-all duration-300"
          >
            <div class="card-body items-center text-center">
              <div
                class="w-16 h-16 rounded-2xl bg-secondary/10 flex items-center justify-center mb-4"
              >
                <i class="fas fa-bolt text-2xl text-secondary"></i>
              </div>
              <h3 class="card-title">Instant Booking</h3>
              <p class="text-base-content/60">
                Book your flight in seconds with instant confirmation
              </p>
            </div>
          </div>
          <div
            class="card bg-base-200 hover:shadow-xl transition-all duration-300"
          >
            <div class="card-body items-center text-center">
              <div
                class="w-16 h-16 rounded-2xl bg-accent/10 flex items-center justify-center mb-4"
              >
                <i class="fas fa-headset text-2xl text-accent"></i>
              </div>
              <h3 class="card-title">24/7 Support</h3>
              <p class="text-base-content/60">
                Our team is always ready to help you anytime
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- About Section -->
    <section id="about" class="py-20 bg-base-200">
      <div class="container mx-auto px-4 lg:px-8">
        <div class="grid lg:grid-cols-2 gap-16 items-center">
          <div class="relative">
            <img
              src="https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?auto=format&fit=crop&w=800&q=80"
              alt="About"
              class="rounded-3xl shadow-2xl w-full"
            />
            <div
              class="absolute -bottom-6 -right-6 bg-primary text-primary-content p-6 rounded-2xl shadow-xl hidden md:block"
            >
              <div class="text-4xl font-black">25+</div>
              <div class="text-sm opacity-80">Years of Excellence</div>
            </div>
          </div>
          <div class="space-y-6">
            <div class="badge badge-primary badge-outline">About Us</div>
            <h2 class="text-3xl lg:text-4xl font-bold">
              Your Trusted Partner in Air Travel
            </h2>
            <p class="text-base-content/70 leading-relaxed">
              FlyBook has been connecting travelers to their destinations for
              over 25 years. We partner with major airlines worldwide to bring
              you the best flight options at competitive prices.
            </p>
            <div class="grid grid-cols-2 gap-6 pt-4">
              <div class="flex gap-4">
                <div
                  class="w-12 h-12 rounded-xl bg-primary/10 flex items-center justify-center flex-shrink-0"
                >
                  <i class="fas fa-award text-primary"></i>
                </div>
                <div>
                  <h4 class="font-bold">Award Winning</h4>
                  <p class="text-sm text-base-content/60">
                    Best travel platform 2024
                  </p>
                </div>
              </div>
              <div class="flex gap-4">
                <div
                  class="w-12 h-12 rounded-xl bg-secondary/10 flex items-center justify-center flex-shrink-0"
                >
                  <i class="fas fa-globe text-secondary"></i>
                </div>
                <div>
                  <h4 class="font-bold">Global Reach</h4>
                  <p class="text-sm text-base-content/60">500+ destinations</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-primary text-primary-content">
      <div class="container mx-auto px-4 lg:px-8 text-center">
        <h2 class="text-3xl lg:text-4xl font-bold mb-4">
          Ready to Start Your Journey?
        </h2>
        <p class="text-primary-content/80 mb-8 max-w-2xl mx-auto">
          Join millions of travelers who trust FlyBook for their flight bookings
        </p>
        <div class="flex flex-wrap justify-center gap-4">
          <a href="/register" class="btn btn-secondary btn-lg gap-2">
            <i class="fas fa-user-plus"></i>
            Create Account
          </a>
          <a
            href="#search"
            class="btn btn-outline btn-lg text-primary-content border-primary-content hover:bg-primary-content hover:text-primary gap-2"
          >
            <i class="fas fa-search"></i>
            Search Flights
          </a>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="footer footer-center bg-base-300 text-base-content p-10">
      <aside>
        <div class="flex items-center gap-2 mb-4">
          <div
            class="w-10 h-10 rounded-xl bg-primary flex items-center justify-center"
          >
            <i class="fas fa-plane text-white"></i>
          </div>
          <span class="text-xl font-black">FlyBook</span>
        </div>
        <p class="font-semibold">Premium Flight Booking Service</p>
        <p class="text-base-content/60">Connecting travelers since 2000</p>
      </aside>
      <nav>
        <div class="grid grid-flow-col gap-4">
          <a class="btn btn-ghost btn-circle"
            ><i class="fab fa-twitter text-lg"></i
          ></a>
          <a class="btn btn-ghost btn-circle"
            ><i class="fab fa-facebook text-lg"></i
          ></a>
          <a class="btn btn-ghost btn-circle"
            ><i class="fab fa-instagram text-lg"></i
          ></a>
          <a class="btn btn-ghost btn-circle"
            ><i class="fab fa-linkedin text-lg"></i
          ></a>
        </div>
      </nav>
      <aside>
        <p>Copyright 2026 FlyBook. All rights reserved.</p>
      </aside>
    </footer>

    <script>
      function searchFlights() {
        const btnText = document.getElementById("btnText");
        const loader = document.getElementById("loader");
        const searchIcon = document.getElementById("searchIcon");
        const results = document.getElementById("results");
        const flightGrid = document.getElementById("flightGrid");
        const countText = document.getElementById("count");

        const origin = document
          .getElementById("origin")
          .value.toLowerCase()
          .trim();
        const dest = document.getElementById("dest").value.toLowerCase().trim();

        btnText.classList.add("hidden");
        searchIcon.classList.add("hidden");
        loader.classList.remove("hidden");

        setTimeout(() => {
          const filtered = FLIGHT_DATABASE.filter(
            (f) =>
              (!origin || f.asal.toLowerCase().includes(origin)) &&
              (!dest || f.tujuan.toLowerCase().includes(dest))
          );

          flightGrid.innerHTML = "";
          if (filtered.length > 0) {
            filtered.forEach((f) => {
              flightGrid.innerHTML += `
                <div class="card bg-base-100 shadow-md hover:shadow-xl transition-all duration-300 border border-base-200">
                  <div class="card-body">
                    <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-6">
                      <div class="flex items-center gap-4">
                        <div class="w-14 h-14 rounded-xl bg-primary/10 flex items-center justify-center">
                          <i class="fas fa-plane text-xl text-primary"></i>
                        </div>
                        <div>
                          <h3 class="font-bold text-lg">\${f.maskapai}</h3>
                          <p class="text-sm text-base-content/60">\${f.kode}</p>
                        </div>
                      </div>
                      
                      <div class="flex-1 flex items-center justify-between gap-4">
                        <div class="text-center">
                          <div class="text-2xl font-bold">\${f.jamBerangkat}</div>
                          <div class="text-sm text-base-content/60">\${f.asal}</div>
                        </div>
                        <div class="flex-1 flex items-center justify-center px-4">
                          <div class="w-full h-px bg-base-300 relative">
                            <i class="fas fa-plane absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 text-base-content/30"></i>
                          </div>
                        </div>
                        <div class="text-center">
                          <div class="text-2xl font-bold">\${f.jamTiba}</div>
                          <div class="text-sm text-base-content/60">\${f.tujuan}</div>
                        </div>
                      </div>
                      
                      <div class="flex items-center gap-6">
                        <div class="text-right">
                          <div class="text-sm text-base-content/60">Starting from</div>
                          <div class="text-2xl font-bold text-primary">IDR \${f.harga.toLocaleString()}</div>
                          <div class="text-xs text-base-content/60">\${f.kursiSisa} seats left</div>
                        </div>
                        <a href="/dashboard/user/tiket/\${f.id}/book" class="btn btn-primary">Book Now</a>
                      </div>
                    </div>
                  </div>
                </div>
              `;
            });
            countText.innerText = filtered.length + " flights found";
          } else {
            flightGrid.innerHTML = `
                <div class="card bg-base-200 border-dashed border-2 border-base-300">
                    <div class="card-body items-center text-center py-16">
                        <i class="fas fa-plane-slash text-4xl text-base-content/30 mb-4"></i>
                        <h3 class="font-bold text-lg">No Flights Found</h3>
                        <p class="text-base-content/60">Try adjusting your search criteria</p>
                    </div>
                </div>
            `;
            countText.innerText = "No results";
          }

          results.classList.remove("hidden");
          btnText.classList.remove("hidden");
          searchIcon.classList.remove("hidden");
          loader.classList.add("hidden");
          results.scrollIntoView({ behavior: "smooth" });
        }, 1000);
      }
    </script>
  </body>
</html>