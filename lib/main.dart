// استيراد مكتبة Firebase Core لتهيئة Firebase في التطبيق
import 'package:firebase_core/firebase_core.dart';

// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';

// استيراد مكتبة Flutter Localizations لدعم الترجمة والتوطين في التطبيق
import 'package:flutter_localizations/flutter_localizations.dart';

// استيراد صفحة شاشة البداية من المشروع
import 'package:rushd/SplashSceen.dart';

// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';

// استيراد خيارات تهيئة Firebase من المشروع
import 'package:rushd/firebase_options.dart';

// استيراد ملفات اللغات المولدة تلقائياً
import 'package:rushd/generated/l10n.dart';

// استيراد مكتبة shared_preferences للوصول إلى التفضيلات المخزنة
import 'package:shared_preferences/shared_preferences.dart';

// تعريف كلاس MyApp كـ StatefulWidget، يمثل التطبيق الرئيسي
class MyApp extends StatefulWidget {
  // دالة لتغيير اللغة في التطبيق
  static void setLocale(BuildContext context, Locale newLocale) {
    // العثور على الحالة الحالية لـ _MyAppState
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    // إذا وجدت الحالة، يتم تغيير اللغة
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

// تعريف الحالة الخاصة بـ MyApp، تمثل الحالة الداخلية للتطبيق
class _MyAppState extends State<MyApp> {
  // تعريف متغير لتخزين اللغة المختارة، يتم الحصول عليها من shared_preferences أو يتم استخدام الإنجليزية كافتراضي
  Locale _locale =
      Locale(Rushd.sharedPreferences?.getString('language') ?? 'en');

  // دالة لتعيين اللغة المختارة وتحديث واجهة المستخدم
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم للتطبيق باستخدام MaterialApp
    return MaterialApp(
      // تعيين المفوضيات الخاصة بالتوطين والترجمة
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // تعيين اللغات المدعومة في التطبيق
      supportedLocales: S.delegate.supportedLocales,
      // إخفاء شريط وضع التصحيح
      debugShowCheckedModeBanner: false,
      // تعيين اللغة الحالية للتطبيق
      locale: _locale,
      // تعيين صفحة البداية للتطبيق
      home: SplashScreen(),
    );
  }
}

// الدالة الرئيسية لتشغيل التطبيق
Future<void> main() async {
  // التأكد من تهيئة أدوات Flutter
  WidgetsFlutterBinding.ensureInitialized();
  // تهيئة Firebase باستخدام الخيارات المحددة
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // الحصول على instance من shared_preferences
  Rushd.sharedPreferences = await SharedPreferences.getInstance();
  // تشغيل التطبيق باستخدام MyApp
  runApp(MyApp());
}
