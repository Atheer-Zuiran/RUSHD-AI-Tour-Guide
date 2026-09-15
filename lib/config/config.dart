// استيراد مكتبة dart:ui للحصول على الأدوات الرسومية مثل الألوان
import 'dart:ui';
// استيراد مكتبة shared_preferences للتعامل مع تفضيلات المستخدم المخزنة محلياً
import 'package:shared_preferences/shared_preferences.dart';

// تعريف فئة Rushd لتخزين الألوان الثابتة وبعض التفضيلات العامة
class Rushd {
  // تعريف لون أساسي ثابت للاستخدام في المشروع
  static Color primaryColor = const Color(0xffb37b41);
  // تعريف لون رمادي ثابت للاستخدام في المشروع
  static Color greyColor = const Color(0xffa8b2b8);

  // متغير لتخزين تفضيلات المستخدم المشتركة
  static SharedPreferences? sharedPreferences;
  // متغير لتخزين اسم المستخدم
  static String name = "";
}
