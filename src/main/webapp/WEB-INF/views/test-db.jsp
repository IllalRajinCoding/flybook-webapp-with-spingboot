<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Database Test - FlyBook</title>
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
            fontFamily: { sans: ["Poppins", "sans-serif"] },
          },
        },
      };
    </script>
  </head>
  <body class="bg-stone-50 font-sans antialiased">
    <div class="min-h-screen flex items-center justify-center px-6 py-12">
      <div class="w-full max-w-2xl">
        <!-- Header -->
        <div class="text-center mb-8">
          <div class="flex items-center justify-center gap-2 mb-4">
            <div
              class="w-12 h-12 bg-stone-900 rounded-xl flex items-center justify-center text-white"
            >
              <i class="fas fa-database"></i>
            </div>
            <span class="font-bold text-2xl text-stone-900">Database Test</span>
          </div>
          <p class="text-stone-500">PostgreSQL Connection Test</p>
        </div>

        <!-- Result Card -->
        <div class="bg-white rounded-3xl shadow-xl border border-stone-100 p-8">
          <!-- Status -->
          <div
            class="flex items-center gap-4 mb-6 pb-6 border-b border-stone-100"
          >
            <% if ((Boolean) request.getAttribute("isConnected")) { %>
            <div
              class="w-16 h-16 bg-green-100 rounded-2xl flex items-center justify-center"
            >
              <i class="fas fa-check-circle text-3xl text-green-600"></i>
            </div>
            <div>
              <h2 class="text-2xl font-bold text-stone-900">Connected</h2>
              <p class="text-green-600 font-medium">${message}</p>
            </div>
            <% } else { %>
            <div
              class="w-16 h-16 bg-red-100 rounded-2xl flex items-center justify-center"
            >
              <i class="fas fa-times-circle text-3xl text-red-600"></i>
            </div>
            <div>
              <h2 class="text-2xl font-bold text-stone-900">Failed</h2>
              <p class="text-red-600 font-medium">${message}</p>
            </div>
            <% } %>
          </div>

          <!-- Details -->
          <div class="space-y-4">
            <h3 class="font-semibold text-stone-900 text-lg mb-3">
              <i class="fas fa-info-circle mr-2"></i>Details
            </h3>

            <div class="bg-stone-50 rounded-xl p-4 border border-stone-200">
              <pre class="text-sm text-stone-700 whitespace-pre-wrap font-mono">
${details}</pre
              >
            </div>

            <!-- Connection Info -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-6">
              <div class="bg-blue-50 rounded-xl p-4 border border-blue-200">
                <p class="text-xs text-blue-600 font-medium mb-1">DATABASE</p>
                <p class="font-bold text-stone-900">flybook</p>
              </div>
              <div class="bg-purple-50 rounded-xl p-4 border border-purple-200">
                <p class="text-xs text-purple-600 font-medium mb-1">HOST</p>
                <p class="font-bold text-stone-900">localhost:5432</p>
              </div>
              <div class="bg-orange-50 rounded-xl p-4 border border-orange-200">
                <p class="text-xs text-orange-600 font-medium mb-1">USERNAME</p>
                <p class="font-bold text-stone-900">postgres</p>
              </div>
              <div class="bg-green-50 rounded-xl p-4 border border-green-200">
                <p class="text-xs text-green-600 font-medium mb-1">DRIVER</p>
                <p class="font-bold text-stone-900">PostgreSQL JDBC</p>
              </div>
            </div>
          </div>

          <!-- Actions -->
          <div class="flex gap-4 mt-8 pt-6 border-t border-stone-100">
            <a
              href="/"
              class="flex-1 text-center px-6 py-3 border-2 border-stone-200 text-stone-700 rounded-xl font-semibold hover:bg-stone-50 transition-colors"
            >
              <i class="fas fa-home mr-2"></i>Home
            </a>
            <a
              href="/test-db"
              class="flex-1 text-center px-6 py-3 bg-stone-900 hover:bg-stone-800 text-white rounded-xl font-semibold transition-colors"
            >
              <i class="fas fa-sync-alt mr-2"></i>Test Again
            </a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
