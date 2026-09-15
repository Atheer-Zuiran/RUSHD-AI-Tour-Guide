// استيراد مكتبة Cloud Firestore من حزمة Firebase للتعامل مع قاعدة البيانات السحابية
import 'package:cloud_firestore/cloud_firestore.dart';
// استيراد مكتبة Firebase Authentication للتعامل مع نظام المصادقة
import 'package:firebase_auth/firebase_auth.dart';
// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/services.dart';
// استيراد صفحة تسجيل الدخول من مجلد المصادقة في المشروع
import 'package:rushd/Authentication/login.dart';
// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';
// استيراد مكون مربع الحوار الخاص بالأخطاء
import 'package:rushd/widgets/errorDialog.dart';
// استيراد مكون مربع الحوار الخاص بتحميل البيانات
import 'package:rushd/widgets/loadingDialog.dart';
// استيراد ملفات اللغات
import 'package:rushd/generated/l10n.dart';

// تعريف واجهة المستخدم RegisterPage كـ StatefulWidget لإدارة الحالة الداخلية
class RegisterPage extends StatefulWidget {
  // التهيئة الأولية مع مفتاح الاختيار

  // إنشاء الحالة الخاصة بـ RegisterPage
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// تعريف حالة واجهة المستخدم RegisterPage
class _RegisterPageState extends State<RegisterPage> {
  // إنشاء متحكم نصي لإدخال الاسم الكامل
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  // إنشاء متحكم نصي لإدخال البريد الإلكتروني
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  // إنشاء متحكم نصي لإدخال كلمة المرور
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  // إنشاء متحكم نصي لإدخال رقم الهاتف
  final TextEditingController _phoneNumberTextEditingController =
      TextEditingController();
  // متغير لتحديد صلاحية كلمة المرور
  bool _passwordValid = true;
  // متغير لتحديد صلاحية رقم الهاتف
  bool _phoneNumberValid = true;

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
              // استخدام SafeArea لضمان عدم تداخل المحتوى مع منطقة الإشعارات
              child: SafeArea(
                child: Container(
                  // إضافة هامش حول المحتوى الرئيسي
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    // توسيط العناصر في العمود
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
                          // نص عنوان صفحة التسجيل
                          S.of(context).registerHere,
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
                      // حقل إدخال الاسم الكامل
                      Container(
                        // إضافة هامش حول الحقل
                        margin: const EdgeInsets.all(5),
                        // مكون الإدخال النصي
                        child: TextField(
                          // ربط متحكم النص بالحقل
                          controller: _nameTextEditingController,
                          // تهيئة مظهر حقل الإدخال
                          decoration: InputDecoration(
                            // نص التلميح داخل الحقل
                            hintText: S.of(context).fullName,
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
                              Icons.person,
                              // لون الأيقونة
                              color: Color(0xFF708090),
                            ),
                            // لون أيقونة البداية
                            prefixIconColor: Colors.black,
                          ),
                        ),
                      ),
                      // حقل إدخال البريد الإلكتروني
                      Container(
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
                        // إضافة هامش حول الحقل
                        margin: const EdgeInsets.all(5),
                        // زخرفة الحقل بإضافة حواف دائرية
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // مكون الإدخال النصي
                        child: TextField(
                          // إخفاء النص المدخل داخل الحقل
                          obscureText: true,
                          // ربط متحكم النص بالحقل
                          controller: _passwordTextEditingController,
                          // تحديد لون مؤشر النص
                          cursorColor: Colors.black,
                          // تنفيذ دالة عند تغيير النص داخل الحقل
                          onChanged: (value) {
                            // تحديث حالة الصلاحية لكلمة المرور
                            setState(() {
                              _passwordValid = _validatePassword(value);
                            });
                          },
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
                            // نص الخطأ عند عدم صلاحية كلمة المرور
                            errorText: !_passwordValid
                                ? _getPasswordErrorText(
                                    _passwordTextEditingController.text)
                                : null,
                          ),
                        ),
                      ),
                      // نص توضيحي لشروط كلمة المرور
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          // شروط كلمة المرور
                          S.of(context).passwordCriteria,
                          style: const TextStyle(
                            // حجم الخط
                            fontSize: 12,
                            // لون النص
                            color: Color.fromARGB(255, 65, 54, 54),
                          ),
                        ),
                      ),
                      // حقل إدخال رقم الهاتف
                      Container(
                        // إضافة هامش حول الحقل
                        margin: const EdgeInsets.all(5),
                        // زخرفة الحقل بإضافة حواف دائرية
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // مكون الإدخال النصي
                        child: TextField(
                          // ربط متحكم النص بالحقل
                          controller: _phoneNumberTextEditingController,
                          // تحديد نوع الإدخال كنص فقط
                          keyboardType: TextInputType.phone,
                          // السماح فقط بالأرقام
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // تنفيذ دالة عند تغيير النص داخل الحقل
                          onChanged: (value) {
                            // تحديث حالة الصلاحية لرقم الهاتف
                            setState(() {
                              _phoneNumberValid = _validatePhoneNumber(value);
                            });
                          },
                          // تحديد لون مؤشر النص
                          cursorColor: Colors.black,
                          // تهيئة مظهر حقل الإدخال
                          decoration: InputDecoration(
                            // نص التلميح داخل الحقل
                            hintText: S.of(context).phoneNumber,
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
                              Icons.call,
                              // لون الأيقونة
                              color: Color(0xFF708090),
                            ),
                            // نمط النص للأيقونة
                            prefixStyle: const TextStyle(color: Colors.black),
                            // لون أيقونة البداية
                            prefixIconColor: Colors.black,
                            // نص الخطأ عند عدم صلاحية رقم الهاتف
                            errorText: !_phoneNumberValid
                                ? _getPhoneNumberErrorText(
                                    _phoneNumberTextEditingController.text)
                                : null,
                          ),
                        ),
                      ),
                      // زر التسجيل
                      ElevatedButton(
                        // تنفيذ دالة عند الضغط على الزر
                        onPressed: () {
                          // التحقق من صلاحية كلمة المرور وصلاحية رقم الهاتف قبل تنفيذ دالة التحقق من البيانات
                          if (_passwordValid && _phoneNumberValid) {
                            checkingData();
                          } else {
                            // عرض مربع حوار خطأ في حالة عدم صلاحية كلمة المرور أو رقم الهاتف
                            if (!_passwordValid) {
                              _showPasswordErrorDialog();
                            }
                            if (!_phoneNumberValid) {
                              _showPhoneNumberErrorDialog();
                            }
                          }
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
                            S.of(context).registerHere,
                            // نمط النص داخل الزر
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // زر نصي للانتقال إلى صفحة تسجيل الدخول
                      TextButton(
                        // تنفيذ دالة عند الضغط على الزر
                        onPressed: () {
                          // تعريف المسار إلى صفحة تسجيل الدخول
                          Route route = MaterialPageRoute(
                              builder: (_) => const LoginPage());
                          // الانتقال إلى صفحة تسجيل الدخول
                          Navigator.push(context, route);
                        },
                        // النص داخل الزر النصي
                        child: Text(
                          S.of(context).alreadyHaveAccount,
                          // نمط النص
                          style: TextStyle(
                            color: Rushd.primaryColor,
                          ),
                        ),
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

  // دالة للتحقق من صلاحية كلمة المرور
  bool _validatePassword(String password) {
    // نمط التحقق من صلاحية كلمة المرور
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    // استخدام تعبير منتظم للتحقق من المطابقة
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  // دالة للتحقق من صلاحية رقم الهاتف
  bool _validatePhoneNumber(String phoneNumber) {
    // نمط التحقق من صلاحية رقم الهاتف (9 أو 10 أو 11 رقم)
    String pattern = r'^\d{9,11}$';
    // استخدام تعبير منتظم للتحقق من المطابقة
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(phoneNumber);
  }

  // دالة للحصول على نص الخطأ عند عدم صلاحية كلمة المرور
  String _getPasswordErrorText(String password) {
    // التحقق من طول كلمة المرور
    if (!RegExp(r'.{8,}').hasMatch(password)) {
      return S.of(context).passwordLength;
    }
    // التحقق من وجود حرف كبير في كلمة المرور
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return S.of(context).passwordUppercase;
    }
    // التحقق من وجود حرف صغير في كلمة المرور
    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return S.of(context).passwordLowercase;
    }
    // التحقق من وجود رقم في كلمة المرور
    if (!RegExp(r'(?=.*\d)').hasMatch(password)) {
      return S.of(context).passwordNumber;
    }
    // التحقق من وجود حرف خاص في كلمة المرور
    if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(password)) {
      return S.of(context).passwordSpecialCharacter;
    }
    return S.of(context).passwordInvalid;
  }

  // دالة للحصول على نص الخطأ عند عدم صلاحية رقم الهاتف
  String _getPhoneNumberErrorText(String phoneNumber) {
    // التحقق من طول رقم الهاتف
    if (!RegExp(r'^\d{9,11}$').hasMatch(phoneNumber)) {
      return S.of(context).invalidPhoneNumber;
    }
    return '';
  }

  // دالة لعرض مربع حوار خطأ عند عدم صلاحية كلمة المرور
  void _showPasswordErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(
          // رسالة الخطأ
          message: _getPasswordErrorText(_passwordTextEditingController.text),
        );
      },
    );
  }

  // دالة لعرض مربع حوار خطأ عند عدم صلاحية رقم الهاتف
  void _showPhoneNumberErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(
          // رسالة الخطأ
          message:
              _getPhoneNumberErrorText(_phoneNumberTextEditingController.text),
        );
      },
    );
  }

  // دالة للتحقق من تعبئة الحقول
  void checkingData() async {
    // التحقق من عدم كون الحقول فارغة
    if (_emailTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&
        _phoneNumberTextEditingController.text.isNotEmpty) {
      // إذا كانت الحقول غير فارغة، يتم رفع البيانات
      uploadData();
    } else {
      // إذا كانت الحقول فارغة، يتم عرض رسالة خطأ
      displayDialog();
    }
  }

  // دالة لعرض مربع حوار خطأ عند عدم تعبئة الحقول
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

  // دالة لرفع البيانات
  void uploadData() async {
    // عرض مربع حوار التحميل أثناء رفع البيانات
    showDialog(
      context: context,
      builder: (c) {
        return loadingDialog(
          // رسالة التحميل
          message: S.of(context).savingData,
        );
      },
    );
    // تنفيذ دالة التسجيل
    registering();
  }

  // دالة للتسجيل باستخدام Firebase Authentication
  void registering() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            // استخدام البريد الإلكتروني المدخل
            email: _emailTextEditingController.text.trim(),
            // استخدام كلمة المرور المدخلة
            password: _passwordTextEditingController.text.trim())
        // في حالة النجاح يتم حفظ بيانات المستخدم
        .then((auth) {
      String currentUser = auth.user!.uid;
      saveUserInfo(currentUser);
      // في حالة الفشل يتم عرض رسالة خطأ
    }).catchError((error) {
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
    });
  }

  // دالة لحفظ بيانات المستخدم في قاعدة البيانات
  void saveUserInfo(String currentUser) async {
    await FirebaseFirestore.instance.collection("users").doc(currentUser).set({
      // تخزين معرف المستخدم
      "uid": currentUser.toString(),
      // تخزين البريد الإلكتروني
      "email": _emailTextEditingController.text.trim(),
      // تخزين الاسم الكامل
      "fullName": _nameTextEditingController.text.trim(),
      // تخزين رقم الهاتف
      "phoneNumber": _phoneNumberTextEditingController.text.trim(),
      // تخزين تاريخ التسجيل
      "registeredTime": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      // بعد حفظ البيانات يتم عرض رسالة نجاح
    }).then((value) {
      // إغلاق مربع حوار التحميل
      Navigator.pop(context);
      // عرض رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).userCreatedSuccess)),
      );
    });
  }
}
