<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="id" data-theme="light" class="scroll-smooth">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detail Penerbangan | FlyBook</title>

    <link
      href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"
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
            fontFamily: { sans: ["Plus Jakarta Sans", "sans-serif"] },
            colors: {
              brand: "#1e40af",
              dark: "#0f172a",
            },
          },
        },
      };
    </script>

    <style>
      body {
        background-color: #f8fafc;
        color: #1e293b;
      }
      .pro-card {
        background: white;
        border: 1px solid #e2e8f0;
        border-radius: 0.75rem;
      }
      .boarding-header {
        background: #0f172a;
        color: white;
        border-radius: 1rem 1rem 0 0;
      }
    </style>
  </head>
  <body class="antialiased min-h-screen">
    <nav
      class="navbar bg-white border-b border-slate-200 sticky top-0 z-[100] px-6 md:px-12 h-16"
    >
      <div class="navbar-start">
        <a href="/" class="flex items-center gap-2 group">
          <div
            class="w-8 h-8 bg-brand rounded flex items-center justify-center text-white shadow-lg shadow-blue-100"
          >
            <i class="fas fa-paper-plane text-xs"></i>
          </div>
          <span class="text-xl font-black italic tracking-tighter text-dark"
            >FlyBook</span
          >
        </a>
      </div>
      <div class="navbar-end">
        <a
          href="/dashboard/user"
          class="text-sm font-bold text-slate-500 hover:text-brand transition-colors uppercase tracking-widest"
        >
          <i class="fas fa-arrow-left mr-2"></i> Kembali
        </a>
      </div>
    </nav>

    <main class="max-w-6xl mx-auto px-6 py-12">
      <c:choose>
        <c:when test="${not empty tiket}">
          <div class="mb-10 text-left">
            <h2 class="text-3xl font-black text-dark tracking-tight">
              Detail Penerbangan
            </h2>
            <p class="text-slate-500 font-medium">
              Informasi lengkap rute dan status reservasi Anda.
            </p>
          </div>

          <div class="grid lg:grid-cols-12 gap-8">
            <div class="lg:col-span-8 space-y-6">
              <div class="pro-card shadow-sm overflow-hidden">
                <div class="boarding-header p-8 md:p-10 relative">
                  <div
                    class="flex justify-between items-center mb-8 border-b border-white/10 pb-4"
                  >
                    <div class="flex items-center gap-3">
                      <i class="fas fa-plane-up text-blue-400"></i>
                      <span class="font-black uppercase tracking-widest text-sm"
                        >${tiket.maskapai}</span
                      >
                    </div>
                    <div
                      class="text-[10px] font-black uppercase tracking-[0.2em] bg-blue-600 px-3 py-1 rounded"
                    >
                      ${tiket.nomorTiket}
                    </div>
                  </div>

                  <div
                    class="flex flex-col md:flex-row justify-between items-center gap-8"
                  >
                    <div class="text-center md:text-left">
                      <p
                        class="text-[10px] font-bold text-blue-300 uppercase tracking-widest mb-1"
                      >
                        Keberangkatan
                      </p>
                      <h4 class="text-5xl font-black tracking-tighter">
                        ${tiket.jamBerangkat}
                      </h4>
                      <p class="text-lg font-bold mt-1 text-white uppercase">
                        ${tiket.bandara_asal}
                      </p>
                    </div>
                    <div class="flex-1 flex flex-col items-center group">
                      <div class="w-full flex items-center gap-4 px-4">
                        <div class="h-[1px] flex-1 bg-white/20"></div>
                        <i
                          class="fas fa-plane text-white transition-transform"
                        ></i>
                        <div class="h-[1px] flex-1 bg-white/20"></div>
                      </div>
                    </div>
                    <div class="text-center md:text-right">
                      <p
                        class="text-[10px] font-bold text-blue-300 uppercase tracking-widest mb-1"
                      >
                        Kedatangan
                      </p>
                      <h4 class="text-5xl font-black tracking-tighter">
                        ${tiket.jamTiba}
                      </h4>
                      <p class="text-lg font-bold mt-1 text-white uppercase">
                        ${tiket.bandara_tujuan}
                      </p>
                    </div>
                  </div>
                </div>

                <div class="p-8 grid grid-cols-2 md:grid-cols-3 gap-8">
                  <div>
                    <p
                      class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1"
                    >
                      Tanggal
                    </p>
                    <p class="text-sm font-black text-dark">
                      ${tiket.tanggalBerangkat}
                    </p>
                  </div>
                  <div>
                    <p
                      class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1"
                    >
                      Status Unit
                    </p>
                    <p
                      class="text-sm font-black text-emerald-600 uppercase italic"
                    >
                      ${tiket.status}
                    </p>
                  </div>
                  <div class="col-span-2 md:col-span-1">
                    <p
                      class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-1"
                    >
                      Armada
                    </p>
                    <p class="text-sm font-black text-dark">
                      ${tiket.penerbangan}
                    </p>
                  </div>
                </div>
              </div>

              <div class="pro-card p-8 bg-white">
                <h4
                  class="text-xs font-black text-dark mb-6 uppercase tracking-widest border-l-4 border-brand pl-4"
                >
                  Fasilitas Termasuk
                </h4>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                  <div
                    class="flex items-center gap-3 p-4 border border-slate-100 rounded-lg bg-slate-50/50"
                  >
                    <i class="fas fa-suitcase-rolling text-brand"></i>
                    <span class="text-xs font-bold text-slate-700"
                      >20KG Baggage</span
                    >
                  </div>
                  <div
                    class="flex items-center gap-3 p-4 border border-slate-100 rounded-lg bg-slate-50/50"
                  >
                    <i class="fas fa-wifi text-brand"></i>
                    <span class="text-xs font-bold text-slate-700"
                      >Free WiFi</span
                    >
                  </div>
                  <div
                    class="flex items-center gap-3 p-4 border border-slate-100 rounded-lg bg-slate-50/50"
                  >
                    <i class="fas fa-utensils text-brand"></i>
                    <span class="text-xs font-bold text-slate-700"
                      >Snack Bar</span
                    >
                  </div>
                  <div
                    class="flex items-center gap-3 p-4 border border-slate-100 rounded-lg bg-slate-50/50"
                  >
                    <i class="fas fa-plug text-brand"></i>
                    <span class="text-xs font-bold text-slate-700"
                      >Power Outlet</span
                    >
                  </div>
                </div>
              </div>
            </div>

            <div class="lg:col-span-4">
              <div class="pro-card p-8 sticky top-24">
                <h4 class="text-xl font-black text-dark mb-6 tracking-tight">
                  Informasi Reservasi
                </h4>

                <c:choose>
                  <%-- JIKA PESANAN SUDAH SUKSES --%>
                  <c:when
                    test="${not empty booking && booking.status == 'success'}"
                  >
                    <div class="space-y-6">
                      <div
                        class="p-6 bg-emerald-50 border border-emerald-100 rounded-xl text-center"
                      >
                        <div
                          class="w-12 h-12 bg-emerald-500 text-white rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg shadow-emerald-100"
                        >
                          <i class="fas fa-check text-xl"></i>
                        </div>
                        <h5
                          class="font-black text-emerald-800 uppercase text-xs tracking-widest"
                        >
                          Pembayaran Berhasil
                        </h5>
                        <p class="text-[11px] text-emerald-600 font-bold mt-1">
                          E-Ticket Anda telah diterbitkan secara otomatis.
                        </p>
                      </div>

                      <div class="space-y-3 py-6 border-y border-slate-100">
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Kode Booking</span
                          >
                          <span class="text-brand font-black"
                            >#${booking.bookingCode}</span
                          >
                        </div>
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Jumlah Penumpang</span
                          >
                          <span class="text-dark"
                            >${booking.jumlahKursi} Orang</span
                          >
                        </div>
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Total Terbayar</span
                          >
                          <span class="text-dark font-black"
                            >IDR
                            <fmt:formatNumber value="${booking.totalHarga}"
                          /></span>
                        </div>
                      </div>

                      <div class="flex flex-col gap-3">
                        <a
                          href="/dashboard/user"
                          class="btn bg-dark text-white w-full h-14 rounded-xl font-black border-none transition-all uppercase text-xs tracking-widest"
                        >
                          Buka E-Ticket Saya
                        </a>
                        <p
                          class="text-[10px] text-center text-slate-400 font-bold uppercase tracking-widest"
                        >
                          Terima kasih telah memilih FlyBook
                        </p>
                      </div>
                    </div>
                  </c:when>

                  <%-- JIKA PESANAN MASIH PENDING (MENUNGGU KONFIRMASI ADMIN)
                  --%>
                  <c:when
                    test="${not empty booking && booking.status == 'pending'}"
                  >
                    <div class="space-y-6">
                      <div
                        class="p-6 bg-amber-50 border border-amber-100 rounded-xl text-center"
                      >
                        <div
                          class="w-12 h-12 bg-amber-500 text-white rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg shadow-amber-100"
                        >
                          <i class="fas fa-hourglass-half text-xl"></i>
                        </div>
                        <h5
                          class="font-black text-amber-800 uppercase text-xs tracking-widest"
                        >
                          Menunggu Konfirmasi
                        </h5>
                        <p class="text-[11px] text-amber-600 font-bold mt-1">
                          Pesanan Anda sedang diproses oleh admin.
                        </p>
                      </div>

                      <div class="space-y-3 py-6 border-y border-slate-100">
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Kode Booking</span
                          >
                          <span class="text-brand font-black"
                            >#${booking.bookingCode}</span
                          >
                        </div>
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Jumlah Penumpang</span
                          >
                          <span class="text-dark"
                            >${booking.jumlahKursi} Orang</span
                          >
                        </div>
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Total Harga</span
                          >
                          <span class="text-dark font-black"
                            >IDR
                            <fmt:formatNumber value="${booking.totalHarga}"
                          /></span>
                        </div>
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase">Status</span>
                          <span class="text-amber-600 font-black uppercase"
                            >Pending</span
                          >
                        </div>
                      </div>

                      <div class="flex flex-col gap-3">
                        <a
                          href="/dashboard/user"
                          class="btn bg-amber-500 hover:bg-amber-600 text-white w-full h-14 rounded-xl font-black border-none transition-all uppercase text-xs tracking-widest"
                        >
                          Lihat Status Pesanan
                        </a>
                        <p
                          class="text-[10px] text-center text-slate-400 font-bold uppercase tracking-widest"
                        >
                          Mohon tunggu konfirmasi dari admin
                        </p>
                      </div>
                    </div>
                  </c:when>

                  <%-- JIKA PESANAN GAGAL --%>
                  <c:when
                    test="${not empty booking && booking.status == 'failed'}"
                  >
                    <div class="space-y-6">
                      <div
                        class="p-6 bg-red-50 border border-red-100 rounded-xl text-center"
                      >
                        <div
                          class="w-12 h-12 bg-red-500 text-white rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg shadow-red-100"
                        >
                          <i class="fas fa-times text-xl"></i>
                        </div>
                        <h5
                          class="font-black text-red-800 uppercase text-xs tracking-widest"
                        >
                          Pesanan Ditolak
                        </h5>
                        <p class="text-[11px] text-red-600 font-bold mt-1">
                          Maaf, pesanan Anda tidak dapat diproses.
                        </p>
                      </div>

                      <div class="flex flex-col gap-3">
                        <a
                          href="/dashboard/user"
                          class="btn bg-dark text-white w-full h-14 rounded-xl font-black border-none transition-all uppercase text-xs tracking-widest"
                        >
                          Kembali ke Dashboard
                        </a>
                      </div>
                    </div>
                  </c:when>

                  <%-- JIKA BELUM ADA PESANAN DAN TIKET TERSEDIA --%>
                  <c:when
                    test="${tiket.status == 'aktif' && availableSeats > 0}"
                  >
                    <form
                      action="/dashboard/user/tiket/${tiket.id}/book"
                      method="get"
                      class="space-y-6"
                    >
                      <div class="form-control">
                        <label class="label pt-0">
                          <span
                            class="label-text font-black text-slate-500 text-[10px] uppercase tracking-widest"
                            >Jumlah Penumpang</span
                          >
                        </label>
                        <select
                          id="seats"
                          name="seats"
                          class="select select-bordered w-full rounded-lg font-bold border-slate-200 focus:border-brand"
                          onchange="updateTotal()"
                        >
                          <c:forEach
                            begin="1"
                            end="${availableSeats > 5 ? 5 : availableSeats}"
                            var="i"
                          >
                            <option value="${i}">${i} Penumpang</option>
                          </c:forEach>
                        </select>
                      </div>

                      <div class="space-y-3 py-6 border-y border-slate-100">
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Harga Satuan</span
                          >
                          <span class="text-dark font-black"
                            >IDR <fmt:formatNumber value="${tiket.harga}"
                          /></span>
                        </div>
                        <div class="flex justify-between text-xs font-bold">
                          <span class="text-slate-400 uppercase"
                            >Service Tax</span
                          >
                          <span class="text-emerald-600 font-black"
                            >TERMASUK</span
                          >
                        </div>
                      </div>

                      <div class="flex flex-col gap-1 text-center">
                        <span
                          class="text-[10px] font-black text-slate-400 uppercase tracking-widest"
                          >Estimasi Total</span
                        >
                        <span
                          id="totalPrice"
                          class="text-3xl font-black text-brand tracking-tighter"
                          data-price="${tiket.harga}"
                        >
                          IDR <fmt:formatNumber value="${tiket.harga}" />
                        </span>
                      </div>

                      <button
                        type="submit"
                        class="btn bg-brand hover:bg-dark text-white w-full h-14 rounded-xl font-black text-xs shadow-xl shadow-blue-100 border-none uppercase tracking-[0.2em] transition-all active:scale-95"
                      >
                        Lanjutkan Ke Pembayaran
                      </button>
                    </form>
                  </c:when>

                  <%-- JIKA KURSI PENUH --%>
                  <c:otherwise>
                    <div
                      class="alert alert-error bg-red-50 text-red-700 border-red-100 rounded-xl flex gap-3 p-5"
                    >
                      <i class="fas fa-exclamation-circle text-lg"></i>
                      <span
                        class="text-[10px] font-black uppercase tracking-widest"
                        >Maaf, Kuota Penerbangan Sudah Terpenuhi</span
                      >
                    </div>
                    <a
                      href="/dashboard/user"
                      class="btn btn-ghost w-full mt-4 font-bold text-xs uppercase tracking-widest"
                      >Kembali ke Pencarian</a
                    >
                  </c:otherwise>
                </c:choose>

                <div
                  class="mt-8 flex items-center justify-center gap-2 text-slate-300"
                >
                  <i class="fas fa-shield-halved text-xs"></i>
                  <span class="text-[9px] font-bold uppercase tracking-[0.2em]"
                    >Verified Secure Transaction</span
                  >
                </div>
              </div>
            </div>
          </div>
        </c:when>

        <c:otherwise>
          <div class="py-24 text-center pro-card p-12">
            <i class="fas fa-search text-slate-200 text-5xl mb-6"></i>
            <h3 class="text-xl font-black text-dark uppercase tracking-widest">
              Data Tidak Ditemukan
            </h3>
            <a
              href="/dashboard/user"
              class="btn bg-brand text-white font-bold px-10 rounded-xl mt-6 border-none text-xs uppercase tracking-widest"
              >Cari Jadwal Lain</a
            >
          </div>
        </c:otherwise>
      </c:choose>
    </main>

    <footer class="py-12 text-center border-t border-slate-200 mt-20">
      <p
        class="text-[10px] font-black text-slate-300 uppercase tracking-[0.5em]"
      >
        FlyBook Indonesia — Official Enterprise Edition 2026
      </p>
    </footer>

    <script>
      function updateTotal() {
        const seats = parseInt(document.getElementById("seats").value);
        const pricePerSeat = parseInt(
          document.getElementById("totalPrice").getAttribute("data-price")
        );
        const total = seats * pricePerSeat;
        document.getElementById("totalPrice").innerHTML =
          "IDR " + total.toLocaleString("id-ID");
      }
    </script>
  </body>
</html>
