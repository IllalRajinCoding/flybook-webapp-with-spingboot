<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="id" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Masuk ke Akun | FlyBook Portal</title>
    
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
        .login-card { 
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
            background-color: white !important;
        }
        .form-label { color: #0f172a; font-weight: 700; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 0.5rem; display: block; }
    </style>
</head>
<body class="antialiased">

    <div class="min-h-screen flex flex-col items-center justify-center px-6 py-12">
        
        <div class="text-center mb-10">
            <a href="/" class="inline-flex items-center gap-3 group">
                <div class="w-10 h-10 bg-brand rounded flex items-center justify-center text-white shadow-lg shadow-blue-200">
                    <i class="fas fa-paper-plane text-sm"></i>
                </div>
                <span class="text-3xl font-black italic tracking-tighter text-dark">FlyBook</span>
            </a>
            <h2 class="text-2xl font-black text-dark mt-6 tracking-tight">Otentikasi Pengguna</h2>
            <p class="text-slate-500 font-medium mt-1 text-sm text-center">Silakan masukkan kredensial Anda untuk mengakses sistem.</p>
        </div>

        <div class="w-full max-w-md">
            <div class="space-y-4 mb-6">
                <c:if test="${not empty error}">
                    <div class="flex items-center gap-3 p-4 bg-red-50 border border-red-100 rounded-lg text-red-700 text-xs font-bold animate-pulse">
                        <i class="fas fa-circle-exclamation text-base"></i>
                        <span>${error}</span>
                    </div>
                </c:if>

                <c:if test="${not empty message}">
                    <div class="flex items-center gap-3 p-4 bg-emerald-50 border border-emerald-100 rounded-lg text-emerald-700 text-xs font-bold">
                        <i class="fas fa-check-circle text-base"></i>
                        <span>${message}</span>
                    </div>
                </c:if>
            </div>

            <div class="login-card p-8 md:p-10">
                <form action="/login" method="POST" class="space-y-6">
                    
                    <div class="form-control">
                        <label class="form-label">Alamat Email Resmi</label>
                        <div class="relative group">
                            <i class="fas fa-envelope absolute left-4 top-3.5 text-slate-300 group-focus-within:text-accent transition-colors"></i>
                            <input 
                                type="email" 
                                name="email" 
                                placeholder="name@company.com" 
                                required 
                                class="input input-bordered pro-input w-full pl-11" 
                            />
                        </div>
                    </div>

                    <div class="form-control">
                        <div class="flex justify-between items-center mb-2">
                            <label class="form-label !mb-0">Kata Sandi Akun</label>
                            <a href="#" class="text-[10px] font-bold text-accent hover:underline uppercase tracking-tighter">Lupa Sandi?</a>
                        </div>
                        <div class="relative group">
                            <i class="fas fa-shield-halved absolute left-4 top-3.5 text-slate-300 group-focus-within:text-accent transition-colors"></i>
                            <input 
                                type="password" 
                                name="password" 
                                placeholder="••••••••••••" 
                                required 
                                class="input input-bordered pro-input w-full pl-11" 
                            />
                        </div>
                    </div>

                    <div class="pt-4">
                        <button type="submit" class="btn bg-dark hover:bg-black text-white w-full h-12 rounded-lg font-black uppercase tracking-[0.1em] border-none shadow-xl shadow-slate-200 transition-all active:scale-95">
                            Masuk Ke Sistem
                        </button>
                    </div>
                </form>

                <div class="mt-8 pt-6 border-t border-slate-100">
                    <p class="text-center text-xs font-bold text-slate-400">
                        Sistem dilindungi oleh enkripsi end-to-end.
                    </p>
                </div>
            </div>

            <div class="mt-8 text-center">
                <p class="text-sm font-bold text-slate-500">
                    Belum memiliki kredensial? 
                    <a href="/register" class="text-accent hover:underline ml-1">Daftar Akun Baru</a>
                </p>
            </div>
        </div>

        <footer class="mt-20 opacity-20">
            <p class="text-[10px] font-black uppercase tracking-[0.4em] text-dark text-center">FlyBook Security Protocol — 2026</p>
        </footer>
    </div>

</body>
</html>