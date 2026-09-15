// استيراد مكتبة Firebase Authentication للتعامل مع نظام المصادقة
import 'package:firebase_auth/firebase_auth.dart';
// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';
// استيراد مكون مربع الحوار الخاص بالأخطاء
import 'package:rushd/widgets/errorDialog.dart';
// استيراد مكون مربع الحوار الخاص بتحميل البيانات
import 'package:rushd/widgets/loadingDialog.dart';
// استيراد ملفات اللغات
import 'package:rushd/generated/l10n.dart';

// تعريف واجهة المستخدم ResetPassword كـ StatelessWidget لأنها لا تحتوي على حالة
class ResetPassword extends StatelessWidget {
  // إنشاء متحكم نصي لإدخال البريد الإلكتروني
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  // التهيئة الأولية مع مفتاح الاختيار
  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم باستخدام Scaffold لتوفير البنية الأساسية
    return Scaffold(
      // إنشاء شريط التطبيق (AppBar)
      appBar: AppBar(),
      // محتوى الصفحة سيكون داخل عنصر Stack لتكديس العناصر فوق بعضها البعض
      body: Stack(
        children: [
          // إضافة خلفية باستخدام Container مع زخرفة الصورة
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // تحديد مسار صورة الخلفية
                image: AssetImage('assets/images/background.jpg'),
                // تحديد كيفية تغطية الصورة للمساحة المتاحة
                fit: BoxFit.cover,
              ),
            ),
          ),
          // توسيط المحتوى الرئيسي في الشاشة
          Center(
            // استخدام SingleChildScrollView لتمكين التمرير في حالة زيادة المحتوى
            child: SingleChildScrollView(
              // استخدام SafeArea لضمان عدم تداخل المحتوى مع منطقة الإشعارات
              child: SafeArea(
                // إضافة هامش حول المحتوى الرئيسي
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    // توسيط العناصر في العمود
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        // توسيط العناصر في العمود الداخلي
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // عرض شعار التطبيق
                          SizedBox(
                            child: Image.asset(
                              "assets/images/logo.png",
                              // تحديد عرض الصورة
                              width: 350,
                            ),
                          ),
                          // إضافة بعض الفراغات حول النص
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              // نص عنوان صفحة إعادة تعيين كلمة المرور
                              S.of(context).resetPassword,
                              style: TextStyle(
                                // استخدام اللون الأساسي للتطبيق
                                color: Rushd.primaryColor,
                                // تحديد حجم الخط
                                fontSize: 24,
                                // جعل النص عريضًا
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // حقل إدخال البريد الإلكتروني
                          Container(
                            // تحديد ارتفاع الحقل
                            height: 45,
                            // إضافة هامش حول الحقل
                            margin: const EdgeInsets.all(5),
                            // زخرفة الحقل بإضافة حواف دائرية
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // مكون الإدخال النصي
                            child: TextField(
                              // ربط متحكم النص بالحقل
                              controller: _emailTextEditingController,
                              // تحديد لون مؤشر النص
                              cursorColor: Colors.black,
                              // تهيئة مظهر حقل الإدخال
                              decoration: InputDecoration(
                                // نص التلميح داخل الحقل
                                hintText: S.of(context).email,
                                // تهيئة مظهر الحدود عند التركيز على الحقل
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    // عرض الحدود
                                    width: 1,
                                    // لون الحدود
                                    color: Color(0xFF708090),
                                  ),
                                ),
                                // تهيئة الحقل ليكون غير مضغوط
                                isCollapsed: false,
                                // جعل الحقل كثيفًا
                                isDense: true,
                                // لون التركيز على الحقل
                                focusColor: Colors.blue,
                                // تهيئة مظهر الحدود عند عدم التركيز على الحقل
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    // عرض الحدود
                                    width: 1,
                                    // لون الحدود
                                    color: Color(0xFF708090),
                                  ),
                                ),
                                // أيقونة تظهر في بداية الحقل
                                prefixIcon: const Icon(
                                  Icons.email,
                                  // لون الأيقونة
                                  color: Color(0xFF708090),
                                ),
                                // نمط النص للأيقونة
                                prefixStyle:
                                    const TextStyle(color: Colors.black),
                                // لون أيقونة البداية
                                prefixIconColor: Colors.black,
                              ),
                            ),
                          ),
                          // إضافة مساحة فارغة بين الحقل والزر
                          const SizedBox(
                            height: 20,
                          ),
                          // زر حفظ البريد الإلكتروني
                          ElevatedButton(
                            // تنفيذ دالة عند الضغط على الزر
                            onPressed: () {
                              checkIfEmailIsEmpty(context);
                            },
                            // تهيئة مظهر الزر
                            style: ButtonStyle(
                              // تهيئة شكل الزر ليكون بحواف دائرية
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              // تحديد لون خلفية الزر
                              backgroundColor: MaterialStateProperty.all(
                                Rushd.primaryColor,
                              ),
                            ),
                            // محتوى الزر
                            child: Padding(
                              // تحديد حجم الحشوة داخل الزر
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              // النص داخل الزر
                              child: Text(
                                S.of(context).save,
                                // نمط النص داخل الزر
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة للتحقق من عدم كون حقل البريد الإلكتروني فارغًا
  void checkIfEmailIsEmpty(BuildContext context) {
    // إذا كان حقل البريد الإلكتروني غير فارغ، يتم تنفيذ دالة إعادة تعيين كلمة المرور
    _emailTextEditingController.text.isNotEmpty
        ? resetPasswordFun(context)
        // إذا كان حقل البريد الإلكتروني فارغًا، يتم عرض رسالة خطأ
        : showDialog(
            context: context,
            builder: (_) => ErrorDialog(message: S.of(context).pleasePutEmail),
          );
  }

  // دالة لإعادة تعيين كلمة المرور
  void resetPasswordFun(BuildContext context) {
    // عرض مربع حوار التحميل أثناء إعادة تعيين كلمة المرور
    showDialog(
      context: context,
      builder: (_) => loadingDialog(
        // رسالة التحميل
        message: S.of(context).resettingPassword,
      ),
    );
    // تنفيذ دالة إرسال البريد الإلكتروني لإعادة تعيين كلمة المرور
    resetingPassword(context);
  }

  // دالة لإرسال البريد الإلكتروني لإعادة تعيين كلمة المرور باستخدام Firebase Authentication
  void resetingPassword(BuildContext context) {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailTextEditingController.text.trim())
        // في حالة النجاح يتم عرض رسالة نجاح
        .then(
      (value) {
        // إغلاق مربع حوار التحميل
        Navigator.pop(context);
        // عرض مربع حوار لرسالة النجاح
        showDialog(
          context: context,
          builder: (_) => ErrorDialog(message: S.of(context).emailSent),
        );
      },
      // في حالة الفشل يتم عرض رسالة خطأ
    ).catchError(
      (error) {
        // إغلاق مربع حوار التحميل
        Navigator.pop(context);
        // عرض مربع حوار لرسالة الخطأ
        showDialog(
          context: context,
          builder: (_) =>
              ErrorDialog(message: S.of(context).makeSureEmailIsCorrect),
        );
      },
    );
  }
}
