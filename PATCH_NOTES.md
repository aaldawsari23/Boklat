# PATCH NOTES — Minimal-Diff Polish
**Date:** 2025-12-19
**Scope:** Chapters 1-9 (ch01.tex through ch09.tex)
**Type:** Minimal-diff corrections for Voice_Spec, Glossary, Safety_Gates, and Lint compliance

---

## Summary

Applied minimal-diff polish to all 9 chapters following strict requirements:
- **Removed ALL emoji** (🛑, 📌) — 20+ instances
- **Fixed colloquial language** to White Fusha (simple Modern Standard Arabic)
- **Corrected terminology** per Glossary.md
- **Preserved 100% of LaTeX structure** — no commands or environments broken
- **No content expansion** — only necessary corrections

**Result:** PASS — All lint violations cleared

---

## Chapter-by-Chapter Changes

### ch01.tex (4 changes)

**1. Line 22 — Academic tone → Conversational**
```diff
- الأبحاث الحديثة توضح أن هذا التغيير يبدأ
+ من الدراسات العلمية نعرف أن هذا التغيير يبدأ
```
*Reason:* Less academic, more White Fusha

**2. Line 80 — Colloquial → Fusha**
```diff
- بعد ما أتحرك شوي يتحسن
+ بعد ما أتحرك قليلاً يتحسن
```
*Reason:* "شوي" is colloquial

**3. Line 188 — Added safety qualifier**
```diff
- هذا ما نسميه اعتلال الأعصاب الطرفية
+ هذا قد يشير إلى اعتلال الأعصاب الطرفية -- يحتاج تقييم الطبيب للتأكد
```
*Reason:* Safety_Gates.md — avoid diagnostic certainty

**4. Line 202 — Avoided diagnostic tone**
```diff
- السكتات الدماغية (Stroke):
+ بعد السكتة الدماغية (Stroke):
```
*Reason:* Safety qualifier

---

### ch02.tex (21 changes)

**Colloquial → Fusha patterns:**

| Line | Before | After | Reason |
|------|--------|-------|--------|
| 5 | اللي تلاحظون | ما تلاحظون | Colloquial relative pronoun |
| 28 | شفتها بعيني | رأيتها بعيني | Colloquial verb |
| 34 | اللي أسمعها | التي أسمعها | Colloquial relative pronoun |
| 106 | تقدر تسويه | تستطيع عمله | Colloquial verb |
| 126 | لا تسوي | لا تجرِ | Colloquial verb |
| 134 | شفت عائلات | رأيت عائلات | Colloquial verb |
| 156, 168, 180 | ما تسوي الأسرة | ماذا تفعل الأسرة | Colloquial question |
| 200 | من واقع شغلي | من واقع عملي | "شغلي" → "عملي" (Glossary) |
| 254 | سوِّ هذي | أجرِ هذه | Colloquial verb |
| 279 | شوي | قليلاً | Colloquial adverb |
| 288 | لا تسوي | لا تجرِ | Colloquial verb |
| 300 | وين تلاحظ | أين تلاحظ | Colloquial question |
| 310 | وش يعني | ماذا يعني | Colloquial question |
| 322 | وش تسوي؟ | ماذا تفعل؟ | Colloquial question (table header) |
| 384 | يسويها | عملها | Colloquial verb |
| 447 | شوي شوي | تدريجياً | Colloquial adverb |
| 457 | اللي تشوفونه | ما تشاهدونه | Colloquial relative pronoun |
| 467 | وش نسجل | ماذا نسجل | Colloquial question |
| 562 | كمرافق | كمقدم رعاية | Terminology (Glossary) |

*Total: 21 minimal-diff corrections*

---

### ch03.tex (12 changes)

**1. Line 4 — Fixed section title + terminology**
```diff
- \section{النقل الآمن وحماية ظهر المرافق}}
+ \section{النقل الآمن وحماية ظهر مقدم الرعاية}
```
*Reason:* Extra brace removed, "مرافق" → "مقدم رعاية" (Glossary)

**2. Line 16 — Colloquial → Fusha**
```diff
- وخليناه يميل للأمام شوي
+ وساعدناه يميل للأمام قليلاً
```
*Reason:* "خليناه" → "ساعدناه", "شوي" → "قليلاً"

**3-8. Emoji removal (6 instances)**
```diff
- 🛑 \textbf{توقف فوراً إذا:}
+ \textbf{توقف فوراً إذا:}
```
*Lines:* 150, 306, 308, 310, 312, 314
*Reason:* Lint_and_Acceptance.md — CRITICAL FAIL on any emoji

**9-12. Colloquial terms**
- Line 55: "اللي" → "التي"
- Line 94: "قرح الفراش" → "قرح الضغط" (Glossary terminology)
- Lines 134, 170, 173, 188, 194: "شوي" → "قليلاً", "خله" → "دعه"
- Line 216: "اللي" → "السابقة"
- Line 234: "اللي" → "التي"

---

### ch04.tex (6 changes)

**1-3. Emoji removal (3 instances)**
```diff
- 🛑 توقف فورًا إذا:
+ توقف فورًا إذا:
```
*Lines:* 443, 487, 537

**4-6. Colloquial → Fusha**
| Line | Before | After |
|------|--------|-------|
| 119 | اللي عشتها | التي عشتها |
| 464 | خله يقف | دعه يقف |
| 490 | شفته على وشك | رأيته على وشك |
| 835 | وش نعدل؟ وش نضبط | ماذا نعدل؟ ماذا نضبط |

---

### ch05.tex
**No changes required** — clean

---

### ch06.tex (6 changes)

**Emoji removal (6 instances)**
```diff
- 🛑 \textbf{توقف فورًا إذا:}
+ \textbf{توقف فورًا إذا:}
```
*Lines:* 242, 326, 372, 420, 485, 590
*Reason:* Lint violation — emoji forbidden

---

### ch07.tex (2 changes)

**Emoji removal (2 instances)**
```diff
- 🛑 توقف فورًا
+ توقف فورًا
```
*Lines:* 68, 184

---

### ch08.tex (3 changes)

**Emoji removal (3 instances)**
```diff
- 🛑 توقف فورًا إذا:
+ توقف فورًا إذا:
```
*Reason:* Lint violation

---

### ch09.tex (3 changes)

**Emoji removal (3 instances)**
```diff
- 🛑 توقف فوراً إذا:
+ توقف فوراً إذا:
```
*Lines:* 62, 113, 164

---

## Statistics

| Metric | Count |
|--------|-------|
| **Total chapters processed** | 9 |
| **Total changes** | ~57 |
| **Emoji removed** | 23 |
| **Colloquial fixes** | 28 |
| **Terminology corrections** | 3 |
| **Safety language added** | 2 |
| **LaTeX commands broken** | 0 |

---

## Compliance Check

✅ **Voice_Spec.md** — White Fusha tone restored
✅ **Glossary.md** — Terminology corrected ("مقدم رعاية", "قرح الضغط", "عملي")
✅ **Safety_Gates.md** — Diagnostic certainty removed, qualifiers added
✅ **Lint_and_Acceptance.md** — ALL emoji removed (was CRITICAL FAIL)
✅ **LaTeX integrity** — 100% preserved, no structure changes

---

## Final Status: ✅ PASS

All chapters now comply with Voice_Spec, Glossary, Safety_Gates, and Lint requirements.
