// استيراد مكتبة Cloud Firestore من حزمة Firebase للتعامل مع قاعدة البيانات السحابية
import 'package:cloud_firestore/cloud_firestore.dart';
// استيراد مكتبة Firebase Authentication للتعامل مع نظام المصادقة
import 'package:firebase_auth/firebase_auth.dart';
// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد صفحة التسجيل من مجلد المصادقة في المشروع
import 'package:rushd/Authentication/register.dart';
// استيراد صفحة إعادة تعيين كلمة المرور من مجلد المصادقة في المشروع
import 'package:rushd/Authentication/resetPassword.dart';
// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';
// استيراد صفحة البحث عن الصور من المجلد الرئيسي في المشروع
import 'package:rushd/home/searchImage.dart';
// استيراد مكون مربع الحوار الخاص بالأخطاء
import 'package:rushd/widgets/errorDialog.dart';
// استيراد مكون مربع الحوار الخاص بتحميل البيانات
import 'package:rushd/widgets/loadingDialog.dart';
// استيراد ملفات اللغات
import 'package:rushd/generated/l10n.dart';

// تعريف واجهة المستخدم LoginPage كـ StatefulWidget لإدارة الحالة الداخلية
class LoginPage extends StatefulWidget {
  // التهيئة الأولية مع مفتاح الاختيار
  const LoginPage({Key? key}) : super(key: key);

  // إنشاء الحالة الخاصة بـ LoginPage
  @override
  State<LoginPage> createState() => _LoginPageState();
}

// تعريف حالة واجهة المستخدم LoginPage
class _LoginPageState extends State<LoginPage> {
  // إنشاء متحكم نصي لإدخال البريد الإلكتروني
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  // إنشاء متحكم نصي لإدخال كلمة المرور
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم باستخدام Scaffold لتوفير البنية الأساسية
    return Scaffold(
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
              child: Column(
                // توسيط العناصر في العمود
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // عرض شعار التطبيق
                  Image.asset(
                    "assets/images/logo.png",
                    // تحديد عرض الصورة
                    width: 350,
                  ),
                  // إضافة بعض الفراغات حول النص
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      // نص عنوان صفحة تسجيل الدخول
                      S.of(context).loginHere,
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
                        prefixStyle: const TextStyle(color: Colors.black),
                        // لون أيقونة البداية
                        prefixIconColor: Colors.black,
                      ),
                    ),
                  ),
                  // حقل إدخال كلمة المرور
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
                      controller: _passwordTextEditingController,
                      // تحديد لون مؤشر النص
                      cursorColor: Colors.black,
                      // إخفاء النص المدخل داخل الحقل
                      obscureText: true,
                      // تهيئة مظهر حقل الإدخال
                      decoration: InputDecoration(
                        // نص التلميح داخل الحقل
                        hintText: S.of(context).password,
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
                          Icons.lock,
                          // لون الأيقونة
                          color: Color(0xFF708090),
                        ),
                        // نمط النص للأيقونة
                        prefixStyle: const TextStyle(color: Colors.black),
                        // لون أيقونة البداية
                        prefixIconColor: Colors.black,
                      ),
                    ),
                  ),
                  // إضافة مساحة فارغة بين الحقول
                  const SizedBox(
                    height: 30,
                  ),
                  // زر تسجيل الدخول
                  ElevatedButton(
                    // تنفيذ دالة عند الضغط على الزر
                    onPressed: () {
                      loginIn();
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
                          horizontal: 15, vertical: 13),
                      // النص داخل الزر
                      child: Text(
                        S.of(context).login,
                        // نمط النص داخل الزر
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  // قسم للتنقل بين الصفحات
                  Column(
                    // توسيط العناصر في العمود
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // زر نصي للانتقال إلى صفحة التسجيل
                      TextButton(
                        // تنفيذ دالة عند الضغط على الزر
                        onPressed: () {
                          // تعريف المسار إلى صفحة التسجيل
                          Route route =
                              MaterialPageRoute(builder: (_) => RegisterPage());
                          // الانتقال إلى صفحة التسجيل
                          Navigator.push(context, route);
                        },
                        // النص داخل الزر النصي
                        child: Text(
                          S.of(context).noAccountRegister,
                          // نمط النص
                          style: TextStyle(
                            color: Rushd.primaryColor,
                          ),
                        ),
                      ),
                      // نص قابل للنقر لإعادة تعيين كلمة المرور
                      GestureDetector(
                        // تنفيذ دالة عند النقر على النص
                        onTap: () {
                          // تعريف المسار إلى صفحة إعادة تعيين كلمة المرور
                          Route route = MaterialPageRoute(
                              builder: (_) => ResetPassword());
                          // الانتقال إلى صفحة إعادة تعيين كلمة المرور
                          Navigator.push(context, route);
                        },
                        // النص القابل للنقر
                        child: Text(
                          S.of(context).forgetPassword,
                          // نمط النص
                          style: TextStyle(
                            color: Rushd.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة لتسجيل الدخول
  void loginIn() async {
    // التحقق من عدم كون الحقول فارغة
    if (_emailTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      // إذا كانت الحقول غير فارغة، يتم التحقق من البيانات
      ValidatingData();
    } else {
      // إذا كانت الحقول فارغة، يتم عرض رسالة خطأ
      displayDialog();
    }
  }

  // دالة لعرض مربع حوار خطأ
  void displayDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // بناء مربع الحوار
      builder: (c) {
        return ErrorDialog(
          // رسالة الخطأ
          message: S.of(context).pleaseFillUpInfo,
        );
      },
    );
  }

  // دالة للتحقق من البيانات
  void ValidatingData() async {
    // عرض مربع حوار التحميل أثناء التحقق
    showDialog(
      context: context,
      builder: (c) {
        return loadingDialog(
          // رسالة التحميل
          message: S.of(context).authenticatingPleaseWait,
        );
      },
    );
    // تنفيذ دالة تسجيل الدخول
    _login();
  }

  // دالة لتسجيل الدخول باستخدام Firebase Authentication
  void _login() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            // استخدام البريد الإلكتروني المدخل
            email: _emailTextEditingController.text.trim(),
            // استخدام كلمة المرور المدخلة
            password: _passwordTextEditingController.text.trim())
        // في حالة النجاح يتم التحقق من المستخدم
        .then((auth) {
      if (auth.user != null) {
        // الحصول على معرف المستخدم
        String? currentUser = auth.user?.uid;
        // جلب بيانات المستخدم من قاعدة البيانات
        gettingData(currentUser!);
      }
      // في حالة الفشل يتم عرض رسالة خطأ
    }).catchError(
      (error) {
        // إغلاق مربع حوار التحميل
        Navigator.pop(context);
        // عرض مربع حوار خطأ
        showDialog(
          context: context,
          builder: (c) => ErrorDialog(
            // رسالة الخطأ
            message: error.toString(),
          ),
        );
      },
    );
  }

  // دالة لجلب بيانات المستخدم من قاعدة البيانات
  void gettingData(String uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        // بعد الحصول على البيانات يتم تخزينها محليًا
        .then((results) {
      String nameFromDB = results['fullName'];
      Rushd.sharedPreferences?.setString(Rushd.name, nameFromDB);
    });
    // الانتقال إلى صفحة البحث عن الصور وإزالة جميع الصفحات السابقة من مكدس التنقل
    Route route = MaterialPageRoute(
      builder: (_) => SearchImage(),
    );
    Navigator.pushAndRemoveUntil(context, route, (_) => false);
  }
}
