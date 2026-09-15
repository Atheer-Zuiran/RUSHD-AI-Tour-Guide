// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';

// تعريف مكون loadingDialog كـ StatelessWidget لعرض رسالة تحميل
class loadingDialog extends StatelessWidget {
  // متغير لتخزين رسالة التحميل التي سيتم عرضها
  final String? message;

  // التهيئة الأولية مع مفتاح الاختيار وتحديد رسالة التحميل
  const loadingDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    // بناء مربع الحوار باستخدام AlertDialog
    return AlertDialog(
      // عنوان مربع الحوار
      title: Padding(
        // إضافة حشوة حول النص
        padding: const EdgeInsets.all(8.0),
        // عرض رسالة التحميل كنص داخل مربع الحوار
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
        // محتوى الزر، هنا يتم عرض مؤشر تحميل
        child: CircularProgressIndicator(
          // تحديد لون مؤشر التحميل باستخدام اللون الأساسي للمشروع
          color: Rushd.primaryColor,
        ),
      ),
    );
  }
}
