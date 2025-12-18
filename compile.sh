#!/bin/bash

# =============================================================================
# سكريبت تجميع كتاب "رفيق الرعاية"
# Compile script for "Rafiq Al-Ri'aya" book
# =============================================================================

set -e  # Exit on error

echo "========================================="
echo "تجميع كتاب رفيق الرعاية"
echo "Compiling Rafiq Al-Ri'aya Book"
echo "========================================="
echo ""

# Check if XeLaTeX is installed
if ! command -v xelatex &> /dev/null; then
    echo "❌ خطأ: XeLaTeX غير مثبت"
    echo "❌ Error: XeLaTeX is not installed"
    echo ""
    echo "للتثبيت على Ubuntu/Debian:"
    echo "  sudo apt-get install texlive-xetex texlive-lang-arabic texlive-fonts-extra fonts-amiri"
    echo ""
    echo "To install on Ubuntu/Debian:"
    echo "  sudo apt-get install texlive-xetex texlive-lang-arabic texlive-fonts-extra fonts-amiri"
    echo ""
    exit 1
fi

echo "✅ XeLaTeX موجود"
echo "✅ XeLaTeX found"
echo ""

# Clean previous build files
echo "🧹 تنظيف ملفات التجميع السابقة..."
echo "🧹 Cleaning previous build files..."
rm -f main.aux main.log main.toc main.out main.bbl main.blg main.pdf
echo ""

# First compilation
echo "📝 التجميع الأول (First compilation)..."
xelatex -interaction=nonstopmode main.tex | grep -E "Error|Warning:|Output written" || true
echo ""

# Second compilation (for TOC and references)
echo "📝 التجميع الثاني (Second compilation for TOC)..."
xelatex -interaction=nonstopmode main.tex | grep -E "Error|Warning:|Output written" || true
echo ""

# Check if PDF was created
if [ -f "main.pdf" ]; then
    PDF_SIZE=$(du -h main.pdf | cut -f1)
    echo "========================================="
    echo "✅ نجح التجميع!"
    echo "✅ Compilation successful!"
    echo "========================================="
    echo ""
    echo "📄 الملف: main.pdf"
    echo "📄 File: main.pdf"
    echo "📊 الحجم: $PDF_SIZE"
    echo "📊 Size: $PDF_SIZE"
    echo ""
    echo "للعرض: xdg-open main.pdf (Linux) أو open main.pdf (macOS)"
    echo "To view: xdg-open main.pdf (Linux) or open main.pdf (macOS)"
    echo ""

    # Check for common warnings
    if grep -q "Overfull" main.log; then
        echo "⚠️  ملاحظة: هناك بعض التحذيرات عن امتلاء السطور (طبيعي في النصوص العربية)"
        echo "⚠️  Note: Some overfull hbox warnings (normal for Arabic text)"
    fi
else
    echo "========================================="
    echo "❌ فشل التجميع!"
    echo "❌ Compilation failed!"
    echo "========================================="
    echo ""
    echo "راجع ملف main.log لمعرفة السبب:"
    echo "Check main.log for details:"
    echo ""
    tail -30 main.log
    exit 1
fi

echo ""
echo "========================================="
echo "✨ تمت العملية بنجاح!"
echo "✨ Done!"
echo "========================================="
