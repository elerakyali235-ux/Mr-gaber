@echo off
chcp 65001 >nul
REM ============================================
REM منصة مستر محمد جابر - سكريبت التثبيت (ويندوز)
REM ============================================

echo ============================================
echo   منصة مستر محمد جابر - سكريبت التثبيت
echo ============================================
echo.

REM Check if Node.js is installed
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js غير مثبت!
    echo.
    echo يرجى تثبيت Node.js أولاً من الموقع الرسمي:
    echo 👉 https://nodejs.org/
    echo.
    echo اختر نسخة LTS الإصدار المستقر
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo ✅ Node.js مثبت: %NODE_VERSION%

REM Check if npm is installed
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm غير مثبت!
    echo يرجى إعادة تثبيت Node.js من الموقع الرسمي
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo ✅ npm مثبت: %NPM_VERSION%
echo.

REM Step 1: Install dependencies
echo 📦 جارٍ تثبيت المكتبات...
call npm install
if %errorlevel% neq 0 (
    echo ❌ حدث خطأ أثناء تثبيت المكتبات
    pause
    exit /b 1
)
echo ✅ تم تثبيت المكتبات بنجاح
echo.

REM Step 2: Generate Prisma Client
echo 🗄️ جارٍ إعداد قاعدة البيانات...
call npx prisma generate
if %errorlevel% neq 0 (
    echo ❌ حدث خطأ أثناء إعداد قاعدة البيانات
    pause
    exit /b 1
)
echo ✅ تم إعداد قاعدة البيانات بنجاح
echo.

REM Step 3: Push database schema
echo 📊 جارٍ إنشاء جداول قاعدة البيانات...
call npx prisma db push
if %errorlevel% neq 0 (
    echo ❌ حدث خطأ أثناء إنشاء جداول قاعدة البيانات
    pause
    exit /b 1
)
echo ✅ تم إنشاء جداول قاعدة البيانات بنجاح
echo.

REM Done!
echo ============================================
echo   ✅ تم التثبيت بنجاح!
echo ============================================
echo.
echo لتشغيل التطبيق:
echo   👉 npm run dev
echo.
echo ثم افتح المتصفح على:
echo   👉 http://localhost:3000
echo.
echo بيانات دخول المشرف:
echo   👉 اسم المستخدم: admin
echo   👉 كلمة المرور: admin123
echo.
echo بيانات دخول الطالب التجريبي:
echo   👉 البريد: ahmed@example.com
echo   👉 كلمة المرور: 123456
echo.
pause
