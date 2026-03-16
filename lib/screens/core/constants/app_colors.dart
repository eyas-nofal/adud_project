import 'package:flutter/material.dart';

class AppColors {
  // -----------------------------
  // Primary Colors (الأزرق)
  // الغرض: اللون الأساسي للتطبيق، يستخدم للعناصر المهمة مثل الأزرار الرئيسية، العناوين، الروابط
  // -----------------------------
  static const primary50  = Color(0xFFF0F9FF); // خلفيات فاتحة جداً
  static const primary100 = Color(0xFFE0F2FE);
  static const primary200 = Color(0xFFBAE6FD);
  static const primary300 = Color(0xFF7DD3FC);
  static const primary400 = Color(0xFF38BDF8);
  static const primary500 = Color(0xFF0EA5E9); // اللون الأساسي للـ Theme
  static const primary600 = Color(0xFF0284C7);
  static const primary700 = Color(0xFF0369A1); // عناوين قوية، نص مهم

  // -----------------------------
  // Secondary Colors (البنفسجي)
  // الغرض: دعم Primary، لتباين العناصر الثانوية أو الجمالية
  // -----------------------------
  static const secondary50  = Color(0xFFFAF5FF); // خلفيات فاتحة
  static const secondary100 = Color(0xFFF3E8FF);
  static const secondary200 = Color(0xFFE9D5FF);
  static const secondary300 = Color(0xFFD8B4FE);
  static const secondary400 = Color(0xFFC084FC);
  static const secondary500 = Color(0xFFA855F7); // أزرار ثانوية
  static const secondary600 = Color(0xFF9333EA);
  static const secondary700 = Color(0xFF7E22CE); // عناصر داعمة/مميزة

  // -----------------------------
  // Success Colors (الأخضر)
  // الغرض: حالات إيجابية مثل نجاح العملية أو تأكيد
  // -----------------------------
  static const success50  = Color(0xFFF0FDF4); // خلفية فاتحة
  static const success100 = Color(0xFFDCFCE7);
  static const success200 = Color(0xFFBBF7D0);
  static const success300 = Color(0xFF86EFAC);
  static const success400 = Color(0xFF4ADE80);
  static const success500 = Color(0xFF22C55E); // لون أيقونة نجاح أو رسالة نجاح
  static const success600 = Color(0xFF16A34A);
  static const success700 = Color(0xFF15803D); // نصوص أو عناصر مهمة بالنجاح

  // -----------------------------
  // Warning Colors (الأصفر/البرتقالي)
  // الغرض: تحذير أو تنبيه المستخدم
  // -----------------------------
  static const warning50  = Color(0xFFFFFBEB); // خلفية فاتحة
  static const warning100 = Color(0xFFFEF3C7);
  static const warning200 = Color(0xFFFDE68A);
  static const warning300 = Color(0xFFFCD34D);
  static const warning400 = Color(0xFFFBBF24);
  static const warning500 = Color(0xFFF59E0B); // تحذير أو أيقونة تنبيه
  static const warning600 = Color(0xFFD97706); // نصوص تحذيرية أو أزرار

  // -----------------------------
  // Danger Colors (الأحمر)
  // الغرض: خطأ أو حالة تحتاج انتباه فوري
  // -----------------------------
  static const danger50  = Color(0xFFFEF2F2); // خلفية فاتحة
  static const danger100 = Color(0xFFFee2e2);
  static const danger200 = Color(0xFFFEcaca);
  static const danger300 = Color(0xFFFca5a5);
  static const danger400 = Color(0xFFf87171);
  static const danger500 = Color(0xFFef4444); // رسالة خطأ أو زر حذف
  static const danger600 = Color(0xFFdc2626); // نص مهم أو أيقونة خطر

  // -----------------------------
  // Neutral Colors (الرمادي/أسود/أبيض)
  // الغرض: خلفيات، نصوص، حدود وفواصل
  // -----------------------------
  static const neutral50  = Color(0xFFFFFFFF); // خلفية بيضاء
  static const neutral100 = Color(0xFFF8FAFC);
  static const neutral200 = Color(0xFFF1F5F9);
  static const neutral300 = Color(0xFFE2E8F0); // حدود خفيفة
  static const neutral400 = Color(0xFFCBD5E1);
  static const neutral500 = Color(0xFF94A3B8); // نص متوسط
  static const neutral600 = Color(0xFF64748B);
  static const neutral700 = Color(0xFF475569); // نصوص رئيسية
  static const neutral800 = Color(0xFF334155);
  static const neutral900 = Color(0xFF1E293B); // نصوص قوية أو عناوين
}