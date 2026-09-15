// استيراد مكتبة dart:convert لتحويل البيانات بين صيغتي JSON والنصوص
import 'dart:convert';
// استيراد مكتبة dart:io للوصول إلى نظام الملفات
import 'dart:io';
// استيراد مكتبة dart:math للوصول إلى العمليات الرياضية
import 'dart:math';
// استيراد مكتبة Firebase Authentication للتعامل مع نظام المصادقة
import 'package:firebase_auth/firebase_auth.dart';
// استيراد مكتبة Flutter للوصول إلى الخدمات والنصوص الأساسية
// استيراد مكتبة http لإجراء الطلبات HTTP
import 'package:http/http.dart' as http;
// استيراد مكتبة Flutter لإنشاء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد مكتبة image_picker لاختيار الصور من المعرض أو الكاميرا
import 'package:image_picker/image_picker.dart';
// استيراد صفحة تسجيل الدخول من مجلد المصادقة في المشروع
import 'package:rushd/Authentication/login.dart';
// استيراد ملف الإعدادات العامة للمشروع
import 'package:rushd/config/config.dart';
// استيراد مكتبة url_launcher لفتح الروابط في المتصفح
import 'package:url_launcher/url_launcher.dart';
// استيراد مكتبة flutter_rating_bar لإنشاء مكون تقييم النجوم
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// استيراد ملفات اللغات
import 'package:rushd/generated/l10n.dart';

// تعريف واجهة المستخدم SearchImage كـ StatefulWidget لإدارة الحالة الداخلية
class SearchImage extends StatefulWidget {
  // التهيئة الأولية مع مفتاح الاختيار

  // إنشاء الحالة الخاصة بـ SearchImage
  @override
  State<SearchImage> createState() => _SearchImageState();
}

// تعريف حالة واجهة المستخدم SearchImage
class _SearchImageState extends State<SearchImage> {
  // إنشاء متحكم لاختيار الصور من المعرض أو الكاميرا
  final ImagePicker _picker = ImagePicker();
  // متغير لتخزين الصورة المختارة كملف
  XFile? _xFile;
  // متغير لتخزين الصورة المختارة كملف من نظام الملفات
  File? _file;
  // متغير لتخزين اسم المكان
  String? placeName;
  // متغير لتخزين وصف المكان
  String? placeDescription;
  // متغير لتخزين موقع المكان
  String? placeLocation;
  // متغير لتخزين خط العرض للمكان
  String? latitude;
  // متغير لتخزين خط الطول للمكان
  String? longitude;
  // متغير لتحديد حالة التحميل
  bool isLoading = false;
  // متغير لتخزين الأماكن القريبة
  List<dynamic>? nearbyPlaces;
  // متغير لتخزين اسم المستخدم
  String? name = Rushd.sharedPreferences?.getString(Rushd.name);
  // متغير لتخزين اللغة المختارة
  String? selectedLanguage =
      Rushd.sharedPreferences?.getString('language') ?? 'en';

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم باستخدام Scaffold لتوفير البنية الأساسية
    return Scaffold(
      // محتوى الصفحة سيكون داخل Container مع زخرفة الخلفية
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // تحديد مسار صورة الخلفية
            image: AssetImage('assets/images/background.jpg'),
            // تحديد كيفية تغطية الصورة للمساحة المتاحة
            fit: BoxFit.cover,
          ),
        ),
        // استخدام SafeArea لضمان عدم تداخل المحتوى مع منطقة الإشعارات
        child: SafeArea(
          // استخدام Column لترتيب العناصر عموديًا
          child: Column(
            children: [
              // بناء رأس الصفحة
              Row(
                // توزيع العناصر بالتساوي بين بداية ونهاية الصف
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // عنصر فارغ لملء المساحة اليسرى
                  Container(width: 50),
                  // نص الترحيب بالمستخدم
                  Text(
                    "${S.of(context).welcomeTo} ${name}",
                    style: TextStyle(
                        // استخدام اللون الأساسي للتطبيق
                        color: Rushd.primaryColor,
                        // تحديد حجم الخط
                        fontSize: 18,
                        // جعل النص عريضًا
                        fontWeight: FontWeight.bold),
                  ),
                  // زر تسجيل الخروج
                  IconButton(
                    // تنفيذ دالة عند الضغط على الزر
                    onPressed: () async {
                      // تنفيذ تسجيل الخروج من Firebase

                      await FirebaseAuth.instance.signOut().then((_) {
                        // تعريف المسار إلى صفحة تسجيل الدخول
                        Route route = MaterialPageRoute(
                            builder: (_) => const LoginPage());
                        // الانتقال إلى صفحة تسجيل الدخول وإزالة جميع الصفحات السابقة من مكدس التنقل
                        Navigator.pushAndRemoveUntil(
                            context, route, (_) => false);
                      });
                    },
                    // تحديد أيقونة الزر
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),

              // استخدام Expanded لتمكين التمرير داخل المحتوى الرئيسي
              Expanded(
                // استخدام SingleChildScrollView لتمكين التمرير في حالة زيادة المحتوى
                child: SingleChildScrollView(
                  // إضافة هامش حول المحتوى الرئيسي
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    // استخدام Column لترتيب العناصر عموديًا
                    child: Column(
                      children: [
                        // بناء الشعار
                        Center(
                          // عرض الشعار
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        // بناء زر لاختيار الصورة
                        ElevatedButton(
                          // تنفيذ دالة عند الضغط على الزر
                          onPressed: () {
                            // عرض مربع حوار لاختيار مصدر الصورة
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                // تمكين التمرير داخل مربع الحوار
                                scrollable: true,
                                // محتوى مربع الحوار
                                content: Column(
                                  children: [
                                    // نص داخل مربع الحوار
                                    Text(S
                                        .of(context)
                                        .pickImageFromGalleryOrCamera),
                                    // زر لاختيار الصورة من المعرض
                                    ElevatedButton(
                                      onPressed: () {
                                        pickingImage(ImageSource.gallery);
                                      },
                                      child: Text(S.of(context).gallery),
                                    ),
                                    // زر لاختيار الصورة من الكاميرا
                                    ElevatedButton(
                                      onPressed: () {
                                        pickingImage(ImageSource.camera);
                                      },
                                      child: Text(S.of(context).camera),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          // النص داخل الزر
                          child: Text(S.of(context).startNow),
                        ),
                        // إضافة مساحة فارغة
                        const SizedBox(height: 20),
                        // عرض الصورة المختارة إذا كانت موجودة
                        if (_file != null) Image.file(_file!, width: 100),
                        // عرض مؤشر التحميل إذا كانت حالة التحميل قائمة
                        if (isLoading == true)
                          const CircularProgressIndicator(),
                        // إضافة مساحة فارغة
                        const SizedBox(height: 20),
                        // عرض معلومات المكان إذا كانت موجودة وليست في حالة تحميل
                        if (!isLoading && placeName != null) buildPlaceInfo(),
                        // إضافة مساحة فارغة
                        const SizedBox(height: 20),
                        // عرض الأماكن القريبة إذا كانت موجودة
                        if (nearbyPlaces != null) buildNearbyPlaces(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لبناء معلومات المكان
  Container buildPlaceInfo() {
    return Container(
      // إضافة حشوة حول المحتوى
      padding: const EdgeInsets.all(10),
      // زخرفة الحاوية بإضافة لون خلفية وحواف دائرية
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        // إضافة ظل للحاوية
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // استخدام Column لترتيب النصوص عموديًا
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // نص يعرض اسم المكان
          Text(
            "${S.of(context).name}: ${placeName!.split(',')[0]}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // إضافة مساحة فارغة
          const SizedBox(height: 10),
          // نص يعرض وصف المكان
          Text(
            "${S.of(context).description}: $placeDescription",
            style: const TextStyle(fontSize: 16),
          ),
          // إضافة مساحة فارغة
          const SizedBox(height: 10),
          // نص يعرض موقع المكان
          Text(
            "${S.of(context).location}: ${placeLocation ?? 'Unknown'}",
            style: const TextStyle(fontSize: 16),
          ),
          // إضافة مساحة فارغة
          const SizedBox(height: 10),
          // نص يعرض إحداثيات المكان إذا كانت موجودة
          if (latitude != null && longitude != null)
            Text(
              "Latitude: $latitude, Longitude: $longitude",
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }

  // دالة لبناء قائمة الأماكن القريبة
  Container buildNearbyPlaces() {
    return Container(
      // إضافة حشوة حول المحتوى
      padding: const EdgeInsets.all(10),
      // زخرفة الحاوية بإضافة لون خلفية وحواف دائرية
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        // إضافة ظل للحاوية
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // استخدام Column لترتيب النصوص عموديًا
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // نص يعرض عنوان الأماكن القريبة
          Text(
            "${S.of(context).nearbyPlaces}:",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // إضافة مساحة فارغة
          const SizedBox(height: 10),
          // استخدام Map لتحويل قائمة الأماكن القريبة إلى عناصر واجهة مستخدم
          ...nearbyPlaces!.map(
            (place) {
              // استخراج إحداثيات المكان القريب
              double placeLat = place['geometry']['location']['lat'];
              double placeLng = place['geometry']['location']['lng'];
              // حساب المسافة بين المكان الحالي والمكان القريب

              // متغير لتخزين تقييم المكان
              double? rating;
              // التحقق من وجود تقييم للمكان
              if (place['rating'] != null) {
                rating = (place['rating'] is int)
                    ? (place['rating'] as int).toDouble()
                    : place['rating'] as double?;
              }

              // إنشاء عنصر واجهة مستخدم لعرض تفاصيل المكان القريب
              return ListTile(
                // عرض صورة المكان إذا كانت موجودة، وإلا عرض أيقونة
                leading: place['photos'] != null
                    ? Image.network(
                        'https://maps.googleapis.com/maps/api/place/photo?maxwidth=100&photoreference=${place['photos'][0]['photo_reference']}&key=AIzaSyBpLzaDvyWfvVvxD9xO3fM1i5FfCbjJ9nE',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.place),
                // عرض اسم المكان
                title: Text(place['name']),
                // عرض تفاصيل المكان
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(place['vicinity']),
                    // عرض تقييم المكان إذا كان موجودًا
                    if (rating != null)
                      RatingBarIndicator(
                        rating: rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    // عرض المسافة بين المكان الحالي والمكان القريب
                  ],
                ),
                // تنفيذ دالة عند الضغط على العنصر لفتح الموقع في خرائط جوجل
                onTap: () {
                  openMap(place['geometry']['location']['lat'],
                      place['geometry']['location']['lng']);
                },
              );
            },
          ).toList(),
        ],
      ),
    );
  }

  // دالة لاختيار الصورة من المعرض أو الكاميرا
  pickingImage(ImageSource type) async {
    // إعادة تعيين اسم المكان والأماكن القريبة
    setState(() {
      placeName = null;
      nearbyPlaces = null;
    });
    // اختيار الصورة باستخدام ImagePicker
    _xFile = await _picker.pickImage(source: type);
    // تحويل الصورة المختارة إلى ملف وتحديث حالة التحميل
    setState(() {
      _file = File(_xFile!.path);
      isLoading = true;
    });
    // توليد المحتوى من الصورة المختارة
    generateContent(_file!).then((_) {
      // تحديث حالة التحميل
      setState(() {
        isLoading = false;
      });
      // إذا تم العثور على اسم المكان، جلب تفاصيل المكان
      if (placeName != null) {
        fetchPlaceDetails();
      }
    });
    // إغلاق مربع الحوار
    Navigator.pop(context);
  }

  // دالة لتوليد المحتوى من الصورة المختارة
  Future<void> generateContent(File _file) async {
    // مفتاح API للوصول إلى خدمة Google Cloud
    String apiKey = "AIzaSyAnQ8d2AtSFc7MFd2ZOyDEeM5yTuuODDGM";

    // قراءة الصورة كملف بايت
    final bytes = await File(_file.path).readAsBytes();
    // تحويل الصورة إلى صيغة base64
    String base64Image = base64Encode(bytes);

    // تحديد لغة الطلب بناءً على اللغة المختارة
    String systemInstruction;
    if (selectedLanguage == 'ar') {
      systemInstruction =
          "system_instruction = \"\\n\\nFollow these instructions: I will be giving you an image of a place in Saudi Arabia. I need you to provide the following details in Arabic:\\n- ${S.of(context).name} (use the label 'Name:')\\n- ${S.of(context).description} (use the label 'Description:')\\nJust show the results, nothing else.\\n\\n\"";
    } else {
      systemInstruction =
          "system_instruction = \"\\n\\nFollow these instructions: I will be giving you an image of a place in Saudi Arabia. I need you to provide the following details:\\n- ${S.of(context).name} (use the label 'Name:')\\n- ${S.of(context).description} (use the label 'Description:')\\nJust show the results, nothing else.\\n\\n\"";
    }

    // بناء عنوان URI للطلب
    final uri = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey');
    // تهيئة ترويسات الطلب
    final requestHeaders = {'Content-Type': 'application/json'};
    // بناء جسم الطلب
    final requestBody = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": "what is this image?:\n"},
            {
              "inlineData": {"mimeType": "image/jpeg", "data": base64Image}
            },
            {"text": systemInstruction}
          ]
        }
      ],
      "generationConfig": {
        "temperature": 0.4,
        "topK": 32,
        "topP": 1,
        "maxOutputTokens": 4096,
        "stopSequences": []
      }
    });
    // إرسال الطلب إلى الخادم
    final response =
        await http.post(uri, headers: requestHeaders, body: requestBody);
    print(response.body);

    // التحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // استخراج المعلومات ذات الصلة من الاستجابة
      final candidates = data['candidates'];
      if (candidates != null && candidates.isNotEmpty) {
        final contentParts = candidates[0]['content']['parts'];
        if (contentParts != null && contentParts.isNotEmpty) {
          final text = contentParts[0]['text'];

          // تسجيل النص المستلم لغرض التصحيح
          print("Response Text: $text");

          // تحليل النص المستلم لاستخراج اسم ووصف المكان
          final parsedData = parsePlaceData(text);

          setState(() {
            placeName = parsedData['name'];
            placeDescription = parsedData['description'];
            placeLocation = parsedData['location'];
          });
        }
      }
    } else {
      print("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  }

  // دالة لتحليل النص المستلم لاستخراج بيانات المكان
  Map<String, String> parsePlaceData(String text) {
    // تقسيم النص إلى أسطر
    final lines = text.split('\n');
    // خريطة لتخزين البيانات المستخرجة
    final data = <String, String>{};

    // التحقق من كل سطر لاستخراج البيانات
    for (var line in lines) {
      if (line.startsWith("Name:")) {
        data['name'] = line.replaceFirst("Name:", "").trim();
      } else if (line.startsWith("Description:")) {
        data['description'] = line.replaceFirst("Description:", "").trim();
      } else if (line.startsWith("Location:")) {
        data['location'] = line.replaceFirst("Location:", "").trim();
      }
    }

    return data;
  }

  // دالة لجلب تفاصيل المكان من Google Places API
  Future<void> fetchPlaceDetails() async {
    // مفتاح API للوصول إلى خدمة Google Maps
    String apiKey = "AIzaSyBpLzaDvyWfvVvxD9xO3fM1i5FfCbjJ9nE";
    // بناء استعلام للبحث عن المكان في السعودية
    final placeQuery = '$placeName, Saudi Arabia';
    // بناء عنوان URI للطلب
    final uri = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$placeQuery&inputtype=textquery&fields=geometry,formatted_address&key=$apiKey');
    // إرسال الطلب إلى الخادم
    final response = await http.get(uri);

    print("Google Map Response ${response.body}");

    // التحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['candidates'] != null && data['candidates'].isNotEmpty) {
        final location = data['candidates'][0]['geometry']['location'];
        final address = data['candidates'][0]['formatted_address'];
        setState(() {
          latitude = location['lat'].toString();
          longitude = location['lng'].toString();
          placeLocation = address;
        });
        fetchNearbyPlaces();
      }
    } else {
      print("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  }

  // دالة لجلب الأماكن القريبة من المكان المحدد
  Future<void> fetchNearbyPlaces() async {
    // مفتاح API للوصول إلى خدمة Google Maps
    String apiKey = "AIzaSyBpLzaDvyWfvVvxD9xO3fM1i5FfCbjJ9nE";
    // بناء عنوان URI للطلب
    final uri = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=10000&key=$apiKey');
    // إرسال الطلب إلى الخادم
    final response = await http.get(uri);

    print("Google Map Response ${response.body}");

    // التحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        nearbyPlaces = data['results'];
      });
    } else {
      print("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  }

  // دالة لفتح الموقع في خرائط جوجل
  void openMap(double lat, double lng) {
    // بناء رابط خرائط جوجل باستخدام الإحداثيات
    final googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    // إطلاق الرابط في المتصفح
    launchUrl(Uri.parse(googleMapsUrl));
  }
}
