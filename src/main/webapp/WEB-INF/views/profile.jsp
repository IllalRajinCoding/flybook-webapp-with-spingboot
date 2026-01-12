<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty sessionScope.userName}">
  <c:redirect url="/login" />
</c:if>

<!DOCTYPE html>
<html lang="id" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Account Settings | FlyBook</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.4.19/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        body { 
            font-family: "Plus Jakarta Sans", sans-serif;
            background-color: #f8fafc; /* Slate-50 */
            color: #0f172a; /* Slate-900 */
        }
        
        .pro-card {
            background: #ffffff;
            border: 1px solid #e2e8f0; /* Slate-200 */
            border-radius: 0.75rem;
            box-shadow: 0 1px 3px 0 rgb(0 0 0 / 0.1);
        }

        .input-professional {
            border: 1.5px solid #cbd5e1 !important; /* Slate-300 */
            color: #0f172a !important;
            font-weight: 500;
        }

        .input-professional:focus {
            border-color: #2563eb !important; /* Blue-600 */
            outline: none;
            box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.1);
        }

        .sidebar-link-active {
            background-color: #eff6ff !important; /* Blue-50 */
            color: #1e40af !important; /* Blue-800 */
            border-left: 4px solid #2563eb;
            font-weight: 700;
        }

        .label-text-pro {
            color: #334155; /* Slate-700 */
            font-weight: 700;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.025em;
            margin-bottom: 0.5rem;
            display: block;
        }
    </style>
</head>
<body class="antialiased min-h-screen">

    <nav class="bg-white border-b border-slate-200 sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16 items-center">
                <div class="flex items-center gap-2">
                    <i class="fa-solid fa-plane-departure text-blue-600 text-2xl"></i>
                    <span class="text-xl font-black text-slate-900 tracking-tight">FlyBook <span class="text-blue-600">Portal</span></span>
                </div>
                <div class="flex items-center gap-4">
                    <a href="${sessionScope.userRole == 'admin' ? '/dashboard/admin' : '/dashboard/user'}" 
                       class="text-sm font-bold text-slate-500 hover:text-blue-600 transition-colors">
                        <i class="fas fa-arrow-left mr-1"></i> Dashboard
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            
            <aside class="lg:col-span-3 space-y-4">
                <div class="pro-card overflow-hidden">
                    <div class="p-6 border-b border-slate-100 flex items-center gap-4 bg-slate-50/50">
                        <div class="w-12 h-12 rounded-lg bg-blue-600 flex items-center justify-center text-white font-black text-xl shadow-lg shadow-blue-100">
                            ${sessionScope.userName.substring(0,1).toUpperCase()}
                        </div>
                        <div class="overflow-hidden">
                            <p class="text-sm font-black text-slate-950 truncate w-32 leading-none mb-1">${sessionScope.userName}</p>
                            <p class="text-[10px] text-slate-400 font-bold uppercase tracking-widest">Verified Account</p>
                        </div>
                    </div>
                    <nav class="flex flex-col py-2">
                        <a href="#general" class="sidebar-link-active px-6 py-3 text-sm flex items-center gap-3 transition-all">
                            <i class="fas fa-id-card w-5"></i> Ringkasan Profil
                        </a>
                        <a href="#password" class="px-6 py-3 text-sm text-slate-600 hover:bg-slate-50 flex items-center gap-3 transition-colors">
                            <i class="fas fa-shield-halved w-5"></i> Keamanan & Sandi
                        </a>
                        <a href="#danger" class="px-6 py-3 text-sm text-red-600 hover:bg-red-50 flex items-center gap-3 transition-colors">
                            <i class="fas fa-user-xmark w-5"></i> Hapus Akun
                        </a>
                    </nav>
                </div>

                <div class="pro-card p-6 bg-dark text-white shadow-xl shadow-slate-200" style="background-color: #0f172a;">
                    <p class="text-[10px] font-black uppercase tracking-[0.2em] opacity-50 mb-1">Loyalty Stats</p>
                    <div class="flex items-end gap-2">
                        <span class="text-3xl font-black">${not empty totalBookings ? totalBookings : '0'}</span>
                        <span class="text-xs opacity-70 pb-1 font-bold italic uppercase tracking-tighter">Flights</span>
                    </div>
                </div>
            </aside>

            <div class="lg:col-span-9 space-y-6">
                
                <section id="general" class="pro-card p-8 md:p-10">
                    <div class="mb-8 border-b border-slate-100 pb-4">
                        <h2 class="text-2xl font-black text-slate-900 tracking-tight">Informasi Pribadi</h2>
                        <p class="text-slate-400 text-sm font-medium mt-1">Perbarui data diri Anda secara berkala.</p>
                    </div>

                    <form action="/profile/update" method="post" class="space-y-6">
                        <div class="form-control w-full">
                            <label class="label-text-pro">Nama Lengkap Sesuai Identitas</label>
                            <input type="text" name="name" value="${sessionScope.userName}" 
                                   class="input input-professional w-full rounded-lg h-12" required />
                        </div>

                        <div class="form-control w-full">
                            <label class="label-text-pro">Alamat Email Terdaftar</label>
                            <input type="email" name="email" value="${sessionScope.userEmail}" 
                                   class="input input-professional w-full rounded-lg h-12" required />
                        </div>

                        <div class="pt-4 flex justify-end">
                            <button type="submit" class="btn bg-blue-600 hover:bg-blue-700 text-white border-none rounded-lg px-10 font-black text-xs uppercase tracking-widest h-12 shadow-lg shadow-blue-100">
                                Simpan Perubahan
                            </button>
                        </div>
                    </form>
                </section>

                <section id="password" class="pro-card p-8 md:p-10">
                    <div class="mb-8 border-b border-slate-100 pb-4">
                        <h2 class="text-2xl font-black text-slate-900 tracking-tight">Otentikasi Keamanan</h2>
                        <p class="text-slate-400 text-sm font-medium mt-1">Gunakan kombinasi sandi yang kuat dan unik.</p>
                    </div>

                    <form action="/profile/password" method="post" class="space-y-6" onsubmit="return validatePassword()">
                        <div class="form-control">
                            <label class="label-text-pro">Kata Sandi Saat Ini</label>
                            <input type="password" name="currentPassword" id="currentPassword" 
                                   class="input input-professional w-full rounded-lg h-12" placeholder="••••••••••••" required />
                        </div>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="form-control">
                                <label class="label-text-pro">Kata Sandi Baru</label>
                                <input type="password" name="newPassword" id="newPassword" 
                                       class="input input-professional w-full rounded-lg h-12" placeholder="Min. 6 Karakter" required />
                            </div>
                            <div class="form-control">
                                <label class="label-text-pro">Verifikasi Sandi Baru</label>
                                <input type="password" id="confirmPassword" 
                                       class="input input-professional w-full rounded-lg h-12" placeholder="Ketik Ulang" required />
                            </div>
                        </div>

                        <div id="passwordError" class="hidden flex items-center p-4 bg-red-50 text-red-700 rounded-lg text-xs font-black uppercase tracking-tight border border-red-100">
                            <i class="fas fa-triangle-exclamation mr-2 text-sm"></i>
                            <span id="passwordErrorText"></span>
                        </div>

                        <button type="submit" class="btn btn-outline border-blue-600 text-blue-600 hover:bg-blue-600 hover:text-white w-full rounded-lg font-black text-xs uppercase tracking-widest h-12 transition-all">
                            Perbarui Kata Sandi
                        </button>
                    </form>
                </section>

                <section id="danger" class="p-8 border-2 border-dashed border-red-200 rounded-xl bg-red-50/20 flex flex-col md:flex-row justify-between items-center gap-6">
                    <div class="text-center md:text-left">
                        <h3 class="text-xs font-black text-red-700 uppercase tracking-[0.2em] mb-1">Termination Zone</h3>
                        <p class="text-slate-500 text-xs font-medium">Penghapusan akun akan melenyapkan seluruh riwayat penerbangan selamanya.</p>
                    </div>
                    <button onclick="document.getElementById('delete_modal').showModal()" 
                            class="btn bg-red-600 hover:bg-red-700 border-none text-white font-black text-[10px] uppercase tracking-widest px-8 h-10 rounded-md">
                        Hapus Akun
                    </button>
                </section>

            </div>
        </div>
    </main>

    <dialog id="delete_modal" class="modal">
        <div class="modal-box rounded-xl p-0 overflow-hidden max-w-sm bg-white">
            <div class="bg-red-600 p-8 text-white text-center">
                <i class="fas fa-user-slash text-5xl mb-4"></i>
                <h3 class="text-xl font-black uppercase tracking-tight">Hapus Permanen?</h3>
            </div>
            <div class="p-8">
                <p class="text-slate-600 text-sm text-center leading-relaxed font-medium">
                    Apakah Anda yakin ingin menghapus akun <strong>${sessionScope.userName}</strong>? Data yang dihapus tidak dapat dipulihkan melalui admin sistem.
                </p>
                <div class="flex flex-col gap-3 mt-8">
                    <form action="/profile/delete" method="post" class="w-full">
                        <button type="submit" class="btn btn-error w-full text-white font-black text-xs uppercase tracking-widest h-12 rounded-lg">Konfirmasi Hapus</button>
                    </form>
                    <form method="dialog" class="w-full">
                        <button class="btn btn-ghost w-full font-bold text-slate-400 text-xs uppercase">Batalkan</button>
                    </form>
                </div>
            </div>
        </div>
        <form method="dialog" class="modal-backdrop bg-slate-900/70 backdrop-blur-sm">
            <button>close</button>
        </form>
    </dialog>

    <script>
        function validatePassword() {
            const newPass = document.getElementById("newPassword").value;
            const confirmPass = document.getElementById("confirmPassword").value;
            const errDiv = document.getElementById("passwordError");
            const errText = document.getElementById("passwordErrorText");

            if (newPass.length < 6) {
                errText.textContent = "KESALAHAN: SANDI MINIMAL 6 KARAKTER.";
                errDiv.classList.remove("hidden");
                return false;
            }
            if (newPass !== confirmPass) {
                errText.textContent = "KESALAHAN: KONFIRMASI SANDI TIDAK SESUAI.";
                errDiv.classList.remove("hidden");
                return false;
            }
            errDiv.classList.add("hidden");
            return true;
        }
    </script>
</body>
</html>