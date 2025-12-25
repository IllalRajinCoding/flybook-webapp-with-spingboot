@echo off
echo ========================================
echo  FlyBook - Insert Sample Flight Data
echo ========================================
echo.

:: Set PostgreSQL password (ganti sesuai dengan password Anda)
set PGPASSWORD=Root

echo Inserting sample flight data into database...
echo.

psql -U postgres -d flybook -f src/main/resources/sample_tiket_data.sql

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo  Sample data inserted successfully!
    echo ========================================
    echo.
    echo Check your database with:
    echo psql -U postgres -d flybook
    echo SELECT * FROM tiket;
) else (
    echo.
    echo ========================================
    echo  Error inserting sample data!
    echo ========================================
    echo.
    echo Please check:
    echo 1. PostgreSQL is running
    echo 2. Database 'flybook' exists
    echo 3. Password is correct (set PGPASSWORD=YourPassword)
)

pause
