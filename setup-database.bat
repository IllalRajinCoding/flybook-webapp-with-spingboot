@echo off
echo ========================================
echo Setup Database FlyBook
echo ========================================
echo.

REM Set password environment variable
set PGPASSWORD=Root

echo [1] Creating USERS table...
psql -U postgres -d flybook -f src/main/resources/users_schema.sql
if %ERRORLEVEL% EQU 0 (
    echo     [OK] Users table created successfully!
) else (
    echo     [ERROR] Failed to create users table
    goto :error
)

echo.
echo [2] Creating TIKET table...
psql -U postgres -d flybook -f src/main/resources/tiket_schema.sql
if %ERRORLEVEL% EQU 0 (
    echo     [OK] Tiket table created successfully!
) else (
    echo     [ERROR] Failed to create tiket table
    goto :error
)


echo [3] Creating BOOKING table...
psql -U postgres -d flybook -f src/main/resources/booking_schema.sql
if %ERRORLEVEL% EQU 0 (
    echo     [OK] Booking table created successfully!
) else (
    echo     [ERROR] Failed to create booking table
    goto :error
)

echo.
echo ========================================
echo Database setup completed successfully!
echo ========================================
echo.
echo You can now login with:
echo Admin: admin@flybook.com / admin123
echo User:  user@flybook.com / user123
echo.
pause
exit /b 0

:error
echo.
echo ========================================
echo Database setup failed!
echo ========================================
echo.
echo Please check:
echo 1. PostgreSQL service is running
echo 2. Database 'flybook' exists
echo 3. Password is correct (default: Root)
echo.
pause
exit /b 1
