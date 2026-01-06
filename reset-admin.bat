@echo off
echo ========================================
echo Reset Admin User - FlyBook
echo ========================================
echo.

set PGPASSWORD=Intan

echo Resetting admin user...
"C:\Program Files\PostgreSQL\18\bin\psql.exe" -U postgres -d flybook -f src/main/resources/reset-admin.sql

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo Admin user reset successfully!
    echo ========================================
    echo.
    echo You can now login with:
    echo Email: admin@flybook.com
    echo Password: admin123
    echo.
) else (
    echo.
    echo [ERROR] Failed to reset admin user
    echo Please check PostgreSQL connection
)

pause
