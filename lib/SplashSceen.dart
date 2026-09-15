// استيراد مكتبة dart:async للوصول إلى الأدوات المساعدة للعمليات غير المتزامنة
import 'dart:async';

// استيراد مكتبة Firebase Authentication للتعامل مع نظام المصادقة
import 'package:firebase_auth/firebase_auth.dart';

// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';

// استيراد صفحة تسجيل الدخول من مجلد المصادقة في المشروع
import 'package:rushd/Authentication/login.dart';

// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';

// استيراد صفحة البحث عن الصور من المجلد الرئيسي في المشروع
import 'package:rushd/home/searchImage.dart';
import 'package:rushd/main.dart';

// استيراد مكتبة shared_preferences لتخزين اللغة المختارة
// استيراد ملفات اللغات
import 'package:rushd/generated/l10n.dart';

// تعريف كلاس SplashScreen كـ StatefulWidget، يمثل الشاشة الافتتاحية للتطبيق
class SplashScreen extends StatefulWidget {
  // مٌنشئ الكلاس، يُعرف مفتاح الشاشة

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// تعريف الحالة الخاصة بـ SplashScreen، تمثل الحالة الداخلية للشاشة
class _SplashScreenState extends State<SplashScreen> {
  // تعريف متغير لتخزين اللغة المختارة، يتم استخدامه للتحكم في اللغة المعروضة
  String _selectedLanguage = '';

  @override
  void initState() {
    super.initState();
    // استدعاء دالة لتحميل اللغة المحفوظة عند تهيئة الحالة
    _loadLanguage();
  }

  // تحميل اللغة المحفوظة من SharedPreferences
  Future<void> _loadLanguage() async {
    setState(() {
      // الحصول على اللغة المحفوظة من SharedPreferences، وإذا لم توجد لغة محفوظة يتم استخدام اللغة الإنجليزية كافتراضي
      _selectedLanguage =
          Rushd.sharedPreferences?.getString('language') ?? 'en';
    });
  }

  // تغيير اللغة وحفظها في SharedPreferences
  Future<void> _changeLanguage(String languageCode) async {
    // حفظ اللغة الجديدة في SharedPreferences
    await Rushd.sharedPreferences?.setString('language', languageCode);
    setState(() {
      // تحديث متغير اللغة المختارة
      _selectedLanguage = languageCode;
    });
    // إعادة بناء التطبيق مع اللغة الجديدة
    MyApp.setLocale(context, Locale(languageCode));
  }

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم للشاشة باستخدام عناصر Material
    return Material(
      // عرض محتويات الشاشة في المنتصف
      child: Center(
        // حاوية تحتوي على الخلفية والمكونات الأخرى
        child: Container(
          // تعيين خلفية للصورة باستخدام BoxDecoration
          decoration: const BoxDecoration(
            image: DecorationImage(
              // تعيين صورة الخلفية
              image: AssetImage('assets/images/background.jpg'),
              // ملاءمة الصورة بحجم الحاوية
              fit: BoxFit.cover,
            ),
          ),
          // عرض المكونات في المنتصف
          child: Center(
            // استخدام عمود لترتيب العناصر عموديًا
            child: Column(
              // محاذاة العناصر أفقياً في المنتصف
              crossAxisAlignment: CrossAxisAlignment.center,
              // توزيع العناصر بالتساوي عموديًا
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // صف يحتوي على زر تغيير اللغة
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      // تعيين أيقونة زر تغيير اللغة
                      icon: const Icon(Icons.language),
                      onPressed: () {
                        // إظهار نافذة حوار لاختيار اللغة عند الضغط على الزر
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            // تعيين عنوان نافذة الحوار
                            title: const Text('Select Language'),
                            // محتوى نافذة الحوار
                            content: Column(
                              // تحديد الحد الأدنى لحجم العمود
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // عنصر قائمة لاختيار اللغة الإنجليزية
                                ListTile(
                                  title: const Text('English'),
                                  // إذا كانت اللغة المختارة هي الإنجليزية، تظهر علامة صح
                                  trailing: _selectedLanguage == 'en'
                                      ? const Icon(Icons.check,
                                          color: Colors.green)
                                      : null,
                                  // عند اختيار اللغة الإنجليزية، يتم تغيير اللغة وإغلاق نافذة الحوار
                                  onTap: () {
                                    _changeLanguage('en');
                                    Navigator.of(context).pop();
                                  },
                                ),
                                // عنصر قائمة لاختيار اللغة العربية
                                ListTile(
                                  title: const Text('Arabic'),
                                  // إذا كانت اللغة المختارة هي العربية، تظهر علامة صح
                                  trailing: _selectedLanguage == 'ar'
                                      ? const Icon(Icons.check,
                                          color: Colors.green)
                                      : null,
                                  // عند اختيار اللغة العربية، يتم تغيير اللغة وإغلاق نافذة الحوار
                                  onTap: () {
                                    _changeLanguage('ar');
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                // نص ترحيبي باللغة المختارة
                Text(
                  S.of(context).welcomeTo,
                  style: TextStyle(
                    // تعيين لون النص
                    color: Rushd.primaryColor,
                    // تعيين حجم النص
                    fontSize: 24,
                    // تعيين وزن النص إلى عريض
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // عرض شعار التطبيق
                Column(
                  children: [
                    Padding(
                      // تعيين حشوة حول الشعار
                      padding: const EdgeInsets.all(8.0),
                      // تعيين صورة الشعار
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ],
                ),
                // نص دعوة للانضمام وزر لبدء التسجيل أو تسجيل الدخول
                Column(
                  children: [
                    Text(
                      S.of(context).joinUs,
                      style: TextStyle(
                        // تعيين لون النص
                        color: Rushd.primaryColor,
                        // تعيين وزن النص إلى عريض
                        fontWeight: FontWeight.bold,
                      ),
                      // محاذاة النص إلى المنتصف
                      textAlign: TextAlign.center,
                    ),
                    // إضافة مسافة بين النص والزر
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      // عند الضغط على الزر، يتم استدعاء دالة للتحقق من حالة تسجيل الدخول للمستخدم
                      onPressed: () {
                        checkingUser();
                      },
                      // تعيين نمط الزر
                      style: ButtonStyle(
                        // تعيين شكل الزر
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // تعيين نصف قطر الحواف للزر
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        // تعيين لون خلفية الزر
                        backgroundColor: MaterialStateProperty.all(
                          Rushd.primaryColor,
                        ),
                      ),
                      // تعيين محتويات الزر
                      child: Padding(
                        // تعيين حشوة حول النص داخل الزر
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 13),
                        child: Text(
                          S.of(context).startNow,
                          // تعيين نمط النص داخل الزر
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة للتحقق من حالة تسجيل الدخول للمستخدم
  void checkingUser() {
    // الحصول على معرف المستخدم الحالي من FirebaseAuth
    String? currentUser = FirebaseAuth.instance.currentUser?.uid;
    if (currentUser != null) {
      // إذا كان المستخدم مسجلاً، يتم توجيهه إلى صفحة البحث عن الصور
      Route route = MaterialPageRoute(builder: (_) => SearchImage());
      Navigator.pushAndRemoveUntil(context, route, (_) => false);
    } else {
      // إذا لم يكن المستخدم مسجلاً، يتم توجيهه إلى صفحة تسجيل الدخول
      Route route = MaterialPageRoute(builder: (_) => const LoginPage());
      Navigator.pushAndRemoveUntil(context, route, (_) => false);
    }
  }
}
