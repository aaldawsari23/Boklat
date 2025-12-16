# Publisher Quality LaTeX Preamble Guide
## Professional B5 RTL Book Design

---

## Overview

Your LaTeX preamble has been upgraded to **Publisher Quality** standards with advanced typesetting features that ensure professional layout, optimal readability, and strict page-breaking control.

---

## ✨ Key Features Implemented

### 1. **Paper Size & Margins**
- **B5 Paper Format** (176 × 250 mm)
- **Golden Ratio-Inspired Margins**:
  - Top/Bottom: 25mm
  - Inner (binding): 25mm
  - Outer: 20mm (asymmetric for elegant appearance)

### 2. **Advanced Page Breaking (CRITICAL)**
- **Maximum Widow/Orphan Prevention**:
  - `\widowpenalty=10000` - No single lines at top of page
  - `\clubpenalty=10000` - No single lines at bottom of page
  - `\brokenpenalty=10000` - Avoid broken words across pages

- **Display Penalties**:
  - Keeps equations and lists together with their context
  - Prevents awkward breaks around math environments

- **Flexible Spacing**:
  - Emergency stretch: 3em (allows paragraphs to adjust)
  - High tolerance (9999) for optimal line breaking
  - Paragraph spacing: `7pt plus 3pt minus 2pt` (flexible)

### 3. **Microtype — Professional Typography**
- **Font Expansion**: ±2% stretch/shrink for better justification
- **Spacing Adjustments**: Reduces hyphenation needs
- **Optimized for Arabic RTL**: Carefully tuned for right-to-left text
- Result: Smoother gray text appearance, fewer hyphenations

### 4. **Typography & Fonts**
- **Main Font**: Amiri (scale 1.05) - Professional Arabic typeface
- **English Font**: TeX Gyre Termes - Elegant serif for Latin text
- **Line Spacing**: 1.18 (optimal for B5 readability)
- **Font Scale**: Increased to 1.05 for better legibility

### 5. **Elegant Chapter & Section Design**
- **Chapter Format**:
  - Large chapter number (52pt) in deep blue
  - Elegant title (22pt) with decorative rule
  - Centered layout for visual impact

- **Section Format**:
  - Clean 16pt headings with subtle underline
  - Professional blue color scheme

- **Heading Protection** (CRITICAL):
  - Headings automatically "stick" to following text
  - Never appear orphaned at bottom of page
  - Uses `\needspace` to ensure 3-8 lines of context

---

## 🛠️ Special Commands for Manual Control

### Squeeze Commands (Use When Needed)

If you need to fit content better on a page:

#### **1. Light Squeeze**
```latex
\squeezepage
% Your content here
```
- Adds 2 extra lines to the page
- Slightly tighter paragraph spacing
- Use for minor adjustments

#### **2. Maximum Squeeze** (Emergency Only)
```latex
\maxsqueeze
% Your content here
\normalsqueeze  % Restore normal spacing after
```
- Adds 3 extra lines to the page
- Much tighter spacing
- Use only when absolutely necessary
- **Always restore with `\normalsqueeze` after**

#### **3. Restore Normal Spacing**
```latex
\normalsqueeze
```
- Returns to default spacing
- Use after `\maxsqueeze` blocks

### Visual Breaks

#### **Section Break**
```latex
\sectionbreak
```
Produces: `───────`
Decorative horizontal rule for visual separation

#### **Ornament Break**
```latex
\ornamentbreak
```
Produces: `* * *`
Elegant typographic separator

---

## 📦 Special Content Boxes

Four pre-styled box environments for different content types:

### **1. Story Box**
```latex
\begin{storybox}
قصة حقيقية من الممارسة السريرية...
\end{storybox}
```
Blue border - for clinical stories and case examples

### **2. Tip Box**
```latex
\begin{tipbox}
نصيحة مهمة للممارسين...
\end{tipbox}
```
Green border - for practical tips and advice

### **3. Warning Box**
```latex
\begin{warnbox}
تحذير: يجب توخي الحذر عند...
\end{warnbox}
```
Orange border - for warnings and cautions

### **4. Scenario Box**
```latex
\begin{scenariobox}
سيناريو تطبيقي: مريض بعمر 75 عام...
\end{scenariobox}
```
Blue-gray border - for practical scenarios

### **5. Note Box**
```latex
\begin{notebox}
ملاحظة مهمة للقارئ...
\end{notebox}
```
Accent color left border - for important notes

---

## 🎨 Color Scheme

Professional blue palette throughout:

| Color | RGB | Usage |
|-------|-----|-------|
| **Chapter Color** | (25, 55, 85) | Chapter titles & numbers |
| **Section Color** | (35, 70, 105) | Section headings |
| **Accent Color** | (60, 90, 120) | Rules, bullets, decorations |
| **Rule Color** | (100, 120, 140) | Decorative lines |

---

## 📐 Spacing Reference

| Element | Spacing |
|---------|---------|
| **Line spacing** | 1.18 (optimal for B5) |
| **Paragraph skip** | 7pt ±3pt (flexible) |
| **Paragraph indent** | 0pt (no indent) |
| **Chapter spacing** | 30pt after (±15pt flex) |
| **Section spacing** | 22pt before, 14pt after (flexible) |
| **Subsection spacing** | 18pt before, 10pt after |

---

## 🔧 Compilation

### Required Engine
**XeLaTeX** (required for Arabic/RTL support)

### Command
```bash
xelatex main.tex
xelatex main.tex  # Run twice for TOC and references
```

### Required Packages
All packages are standard in TeX Live 2020+:
- `geometry` - Page layout
- `microtype` - Microtypography
- `fontspec` - Font selection
- `polyglossia` - Multilingual support
- `titlesec` - Heading formatting
- `fancyhdr` - Headers/footers
- `hyperref` - PDF metadata
- `mdframed` - Content boxes
- `enumitem` - List formatting
- `needspace` - Heading protection
- `graphicx`, `booktabs`, `longtable` - Graphics & tables

---

## 📊 Quality Checklist

After compilation, verify:

- [ ] No widows (single lines at top of page)
- [ ] No orphans (single lines at bottom of page)
- [ ] No headings orphaned at page bottom
- [ ] Consistent line spacing throughout
- [ ] Proper RTL text flow
- [ ] Chapter numbers and titles properly formatted
- [ ] Page headers show chapter/section names
- [ ] Table of contents generated correctly
- [ ] PDF bookmarks working
- [ ] No overfull/underfull box warnings (check log)

---

## 🎯 Best Practices

### 1. **Let LaTeX Work**
The preamble is designed to handle page breaking automatically. Avoid manual `\newpage` unless absolutely necessary.

### 2. **Use Squeeze Commands Sparingly**
Only use `\squeezepage` or `\maxsqueeze` when:
- A paragraph is just one line too long for a page
- You want to avoid a widow/orphan in specific case
- **Never use for entire chapters** - let automatic breaking work

### 3. **Heading Hierarchy**
Maintain proper hierarchy:
- `\chapter{}` - Main chapters
- `\section{}` - Major sections within chapters
- `\subsection{}` - Subsections (use sparingly)

### 4. **Content Boxes**
Use boxes to highlight important content, but don't overuse:
- Maximum 2-3 boxes per chapter
- Keep content concise
- Choose appropriate box type for content

### 5. **Review After Changes**
After major content edits, review page breaks:
```bash
xelatex main.tex && xelatex main.tex
```
Compile twice to ensure references are updated.

---

## 🐛 Troubleshooting

### Overfull \hbox Warnings
If you see many overfull warnings:
1. Check for long URLs or non-breaking text
2. Consider increasing `\emergencystretch` (currently 3em)
3. Use `\squeezepage` for specific pages

### Headings at Bottom of Page
If headings still appear at page bottom:
- Increase `\needspace` values in preamble (lines 204-206)
- Current: 8 lines (chapter), 4 lines (section), 3 lines (subsection)

### Arabic Font Issues
If Amiri font not found:
- Install from: https://fonts.google.com/specimen/Amiri
- Or replace with another Arabic font: `Scheherazade New`, `Noto Naskh Arabic`

### Compilation Errors
1. Ensure XeLaTeX (not pdfLaTeX) is used
2. Check all .tex files are UTF-8 encoded
3. Verify all required packages are installed
4. Run twice for cross-references

---

## 📚 Professional Enhancements Included

This preamble implements professional publishing techniques:

1. **Microtype adjustments** - Industry-standard typography
2. **Flexible spacing** - Prevents overfull/underfull boxes
3. **Maximum widow/orphan control** - Publisher-quality breaks
4. **Heading protection** - No orphaned headings
5. **Golden ratio margins** - Classical book design
6. **Professional color palette** - Consistent visual identity
7. **RTL optimization** - Proper Arabic typesetting
8. **PDF optimization** - Compressed, smaller file size
9. **Metadata embedding** - Proper PDF properties
10. **Accessibility features** - Bookmarks and structure

---

## 🎓 References

This preamble follows best practices from:
- **The LaTeX Companion** (Typography standards)
- **Bringhurst's Typography** (Classical proportions)
- **Professional Arabic Typography** (RTL best practices)
- **Academic Publishing Guidelines** (Publisher quality standards)

---

## ✅ Summary

Your book now has:
- ✅ B5 paper with golden ratio margins
- ✅ Maximum widow/orphan prevention
- ✅ Microtype for professional appearance
- ✅ Font expansion (±2% squeeze capability)
- ✅ Elegant chapter/section design
- ✅ Sticky headings (never orphaned)
- ✅ Professional Arabic RTL support
- ✅ Flexible spacing for optimal breaks
- ✅ Special commands for manual control
- ✅ Content boxes for highlighted information

**Your book is now ready for professional publication!** 📘✨

---

*Generated for: رفيق الرعاية - العلاج الطبيعي لكبار السن في المنزل*
*Author: عبدالكريم بن محمد الدوسري*
