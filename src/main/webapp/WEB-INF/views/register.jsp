<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="id" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pendaftaran Akun | FlyBook Portal</title>
    
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
                accent: "#2563eb", // Blue 600
                dark: "#0f172a"    // Slate 900
            }
          },
        },
      };
    </script>

    <style>
        body { background-color: #f8fafc; color: #1e293b; }
        .register-card { 
            background: #ffffff; 
            border: 1px solid #e2e8f0; 
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
        }
        .pro-input { 
            border: 1.5px solid #cbd5e1 !important; 
            border-radius: 0.5rem !important;
            transition: all 0.2s;
            font-weight: 600;
            color: #0f172a !important;
        }
        .pro-input:focus { 
            border-color: #2563eb !important; 
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1); 
            outline: none;
        }
        .form-label { color: #0f172a; font-weight: 700; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 0.5rem; display: block; }
    </style>
</head>
<body class="antialiased">

    <div class="min-h-screen flex flex-col items-center justify-center px-6 py-12">
        
        <div class="text-center mb-8">
            <a href="/" class="inline-flex items-center gap-3 group">
                <div class="w-10 h-10 bg-brand rounded flex items-center justify-center text-white shadow-lg shadow-blue-200">
                    <i class="fas fa-paper-plane text-sm"></i>
                </div>
                <span class="text-3xl font-black italic tracking-tighter text-dark">FlyBook</span>
            </a>
            <h2 class="text-2xl font-black text-dark mt-6 tracking-tight">Pendaftaran Akun Baru</h2>
            <p class="text-slate-500 font-medium mt-1 text-sm">Lengkapi data di bawah ini untuk menjadi anggota resmi.</p>
        </div>

        <div class="w-full max-w-md">
            
            <c:if test="${not empty error}">
                <div class="flex items-center gap-3 p-4 bg-red-50 border border-red-100 rounded-lg text-red-700 text-xs font-bold mb-6 animate-pulse">
                    <i class="fas fa-circle-exclamation text-base"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <div class="register-card p-8 md:p-10">
                <form action="/register" method="POST" class="space-y-5">
                    
                    <div class="form-control">
                        <label class="form-label">Nama Lengkap Sesuai Identitas</label>
                        <div class="relative group">
                            <i class="fas fa-user absolute left-4 top-3.5 text-slate-300 group-focus-within:text-accent transition-colors"></i>
                            <input 
                                type="text" 
                                name="name" 
                                placeholder="Contoh: Budi Santoso" 
                                required 
                                class="input input-bordered pro-input w-full pl-11 shadow-sm" 
                            />
                        </div>
                    </div>

                    <div class="form-control">
                        <label class="form-label">Alamat Email Aktif</label>
                        <div class="relative group">
                            <i class="fas fa-envelope absolute left-4 top-3.5 text-slate-300 group-focus-within:text-accent transition-colors"></i>
                            <input 
                                type="email" 
                                name="email" 
                                placeholder="nama@email.com" 
                                required 
                                class="input input-bordered pro-input w-full pl-11 shadow-sm" 
                            />
                        </div>
                    </div>

                    <div class="form-control">
                        <label class="form-label">Kata Sandi Akun</label>
                        <div class="relative group">
                            <i class="fas fa-shield-halved absolute left-4 top-3.5 text-slate-300 group-focus-within:text-accent transition-colors"></i>
                            <input 
                                type="password" 
                                name="password" 
                                placeholder="Minimal 6 karakter" 
                                required 
                                minlength="6"
                                class="input input-bordered pro-input w-full pl-11 shadow-sm" 
                            />
                        </div>
                    </div>

                    <div class="form-control">
                        <label class="form-label">Konfirmasi Kata Sandi</label>
                        <div class="relative group">
                            <i class="fas fa-check-double absolute left-4 top-3.5 text-slate-300 group-focus-within:text-accent transition-colors"></i>
                            <input 
                                type="password" 
                                name="confirmPassword" 
                                placeholder="Ulangi kata sandi Anda" 
                                required 
                                class="input input-bordered pro-input w-full pl-11 shadow-sm" 
                            />
                        </div>
                    </div>

                    <div class="pt-4">
                        <button type="submit" class="btn bg-dark hover:bg-black text-white w-full h-12 rounded-lg font-black uppercase tracking-[0.1em] border-none shadow-xl shadow-slate-200 transition-all active:scale-95">
                            Daftarkan Akun
                        </button>
                    </div>
                </form>

                <div class="mt-8 pt-6 border-t border-slate-100 flex items-center justify-center gap-2 text-slate-400">
                    <i class="fas fa-lock text-[10px]"></i>
                    <p class="text-[10px] font-bold uppercase tracking-wider">Secure Registration Protocol</p>
                </div>
            </div>

            <div class="mt-8 text-center">
                <p class="text-sm font-bold text-slate-500">
                    Sudah memiliki akun terdaftar? 
                    <a href="/login" class="text-accent hover:underline ml-1">Masuk Ke Sistem</a>
                </p>
            </div>
        </div>

        <footer class="mt-16 opacity-20">
            <p class="text-[10px] font-black uppercase tracking-[0.4em] text-dark text-center">FlyBook Enterprise Integrated System — 2026</p>
        </footer>
    </div>

</body>
</html>