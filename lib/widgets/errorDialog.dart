// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';

// تعريف مكون ErrorDialog كـ StatelessWidget لعرض رسالة خطأ
class ErrorDialog extends StatelessWidget {
  // متغير لتخزين رسالة الخطأ التي سيتم عرضها
  final String? message;

  // التهيئة الأولية مع مفتاح الاختيار وتحديد رسالة الخطأ
  ErrorDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    // بناء مربع الحوار باستخدام AlertDialog
    return AlertDialog(
      // عنوان مربع الحوار
      title: Padding(
        // إضافة حشوة حول النص
        padding: const EdgeInsets.all(8.0),
        // عرض رسالة الخطأ كنص داخل مربع الحوار
        child: Text(
          message!,
          // تحديد نمط النص
          style: const TextStyle(fontSize: 15),
        ),
      ),
      // محتوى مربع الحوار
      content: ElevatedButton(
        // تنفيذ دالة عند الضغط على الزر لإغلاق مربع الحوار
        onPressed: () {
          Navigator.pop(context);
        },
        // النص داخل الزر
        child: Text(
          "OK",
          // تحديد لون النص داخل الزر باستخدام اللون الأساسي للمشروع
          style: TextStyle(color: Rushd.primaryColor),
        ),
      ),
    );
  }
}
