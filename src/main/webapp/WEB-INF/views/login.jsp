<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - FlyBook</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet"
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
  <body class="bg-gray-50 font-sans">
    <div class="min-h-screen flex items-center justify-center px-6 py-12">
      <div class="w-full max-w-md">
        <!-- Logo -->
        <div class="text-center mb-8">
          <a href="/" class="inline-block mb-6">
            <h1 class="text-2xl font-bold text-gray-900">FlyBook</h1>
          </a>
          <h2 class="text-xl font-semibold text-gray-900 mb-2">
            Masuk ke Akun
          </h2>
          <p class="text-gray-600">Kelola tiket penerbangan Anda</p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
          <div class="mb-4 bg-red-50 text-red-700 px-4 py-3 rounded-lg text-sm">
            ${error}
          </div>
        </c:if>

        <!-- Success Message -->
        <c:if test="${not empty message}">
          <div
            class="mb-4 bg-green-50 text-green-700 px-4 py-3 rounded-lg text-sm"
          >
            ${message}
          </div>
        </c:if>

        <!-- Login Form -->
        <div class="bg-white rounded-lg p-8">
          <form action="/login" method="POST" class="space-y-5">
            <!-- Email Field -->
            <div>
              <label
                for="email"
                class="block text-sm font-medium text-gray-700 mb-1.5"
              >
                Email
              </label>
              <input
                type="email"
                id="email"
                name="email"
                placeholder="nama@email.com"
                required
                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
              />
            </div>

            <!-- Password Field -->
            <div>
              <label
                for="password"
                class="block text-sm font-medium text-gray-700 mb-1.5"
              >
                Password
              </label>
              <input
                type="password"
                id="password"
                name="password"
                placeholder="••••••••"
                required
                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none"
              />
            </div>

            <!-- Login Button -->
            <button
              type="submit"
              class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2.5 rounded-lg font-medium transition-colors"
            >
              Masuk
            </button>
          </form>
        </div>

        <!-- Sign Up Link -->
        <p class="text-center text-sm text-gray-600 mt-6">
          Belum punya akun?
          <a href="/register" class="text-blue-600 font-medium hover:underline">
            Daftar sekarang
          </a>
        </p>
      </div>
    </div>
  </body>
</html>
