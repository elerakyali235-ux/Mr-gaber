#!/bin/bash

# ============================================
# منصة مستر محمد جابر - سكريبت التثبيت
# ============================================

echo "============================================"
echo "  منصة مستر محمد جابر - سكريبت التثبيت"
echo "============================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js غير مثبت!"
    echo ""
    echo "يرجى تثبيت Node.js أولاً من الموقع الرسمي:"
    echo "👉 https://nodejs.org/"
    echo ""
    echo "اختر نسخة LTS (الإصدار المستقر)"
    echo ""
    exit 1
fi

NODE_VERSION=$(node -v)
echo "✅ Node.js مثبت: $NODE_VERSION"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm غير مثبت!"
    echo "يرجى إعادة تثبيت Node.js من الموقع الرسمي"
    exit 1
fi

NPM_VERSION=$(npm -v)
echo "✅ npm مثبت: $NPM_VERSION"
echo ""

# Step 1: Install dependencies
echo "📦 جارٍ تثبيت المكتبات..."
npm install
if [ $? -ne 0 ]; then
    echo "❌ حدث خطأ أثناء تثبيت المكتبات"
    exit 1
fi
echo "✅ تم تثبيت المكتبات بنجاح"
echo ""

# Step 2: Generate Prisma Client
echo "🗄️ جارٍ إعداد قاعدة البيانات..."
npx prisma generate
if [ $? -ne 0 ]; then
    echo "❌ حدث خطأ أثناء إعداد قاعدة البيانات"
    exit 1
fi
echo "✅ تم إعداد قاعدة البيانات بنجاح"
echo ""

# Step 3: Push database schema
echo "📊 جارٍ إنشاء جداول قاعدة البيانات..."
npx prisma db push
if [ $? -ne 0 ]; then
    echo "❌ حدث خطأ أثناء إنشاء جداول قاعدة البيانات"
    exit 1
fi
echo "✅ تم إنشاء جداول قاعدة البيانات بنجاح"
echo ""

# Step 4: Seed initial data
echo "🌱 جارٍ إضافة البيانات الأولية..."
# This will be done when the app starts for the first time
echo "✅ سيتم إضافة البيانات الأولية عند أول تشغيل"
echo ""

# Done!
echo "============================================"
echo "  ✅ تم التثبيت بنجاح!"
echo "============================================"
echo ""
echo "لتشغيل التطبيق:"
echo "  👉 npm run dev"
echo ""
echo "ثم افتح المتصفح على:"
echo "  👉 http://localhost:3000"
echo ""
echo "بيانات دخول المشرف:"
echo "  👉 اسم المستخدم: admin"
echo "  👉 كلمة المرور: admin123"
echo ""
echo "بيانات دخول الطالب التجريبي:"
echo "  👉 البريد: ahmed@example.com"
echo "  👉 كلمة المرور: 123456"
echo ""
