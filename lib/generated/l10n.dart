// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To`
  String get welcomeTo {
    return Intl.message(
      'Welcome To',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `To join Us click at the bottom of the page`
  String get joinUs {
    return Intl.message(
      'To join Us click at the bottom of the page',
      name: 'joinUs',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Login Here`
  String get loginHere {
    return Intl.message(
      'Login Here',
      name: 'loginHere',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `No account? Register`
  String get noAccountRegister {
    return Intl.message(
      'No account? Register',
      name: 'noAccountRegister',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please fill up the information`
  String get pleaseFillUpInfo {
    return Intl.message(
      'Please fill up the information',
      name: 'pleaseFillUpInfo',
      desc: '',
      args: [],
    );
  }

  /// `Authenticating, please wait...`
  String get authenticatingPleaseWait {
    return Intl.message(
      'Authenticating, please wait...',
      name: 'authenticatingPleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Register Here`
  String get registerHere {
    return Intl.message(
      'Register Here',
      name: 'registerHere',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character.`
  String get passwordCriteria {
    return Intl.message(
      'Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character.',
      name: 'passwordCriteria',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter.`
  String get passwordUppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter.',
      name: 'passwordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter.`
  String get passwordLowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter.',
      name: 'passwordLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number.`
  String get passwordNumber {
    return Intl.message(
      'Password must contain at least one number.',
      name: 'passwordNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character.`
  String get passwordSpecialCharacter {
    return Intl.message(
      'Password must contain at least one special character.',
      name: 'passwordSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Password does not meet the criteria.`
  String get passwordInvalid {
    return Intl.message(
      'Password does not meet the criteria.',
      name: 'passwordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? Login`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? Login',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Saving Data, Please Wait...`
  String get savingData {
    return Intl.message(
      'Saving Data, Please Wait...',
      name: 'savingData',
      desc: '',
      args: [],
    );
  }

  /// `User Was Created Successfully`
  String get userCreatedSuccess {
    return Intl.message(
      'User Was Created Successfully',
      name: 'userCreatedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Please put your email`
  String get pleasePutEmail {
    return Intl.message(
      'Please put your email',
      name: 'pleasePutEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resetting Password`
  String get resettingPassword {
    return Intl.message(
      'Resetting Password',
      name: 'resettingPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email was sent`
  String get emailSent {
    return Intl.message(
      'Email was sent',
      name: 'emailSent',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure the email is correct`
  String get makeSureEmailIsCorrect {
    return Intl.message(
      'Please make sure the email is correct',
      name: 'makeSureEmailIsCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Pick image from Gallery or open the camera?`
  String get pickImageDialog {
    return Intl.message(
      'Pick image from Gallery or open the camera?',
      name: 'pickImageDialog',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Pick Image`
  String get pickImage {
    return Intl.message(
      'Pick Image',
      name: 'pickImage',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Nearby Places`
  String get nearbyPlaces {
    return Intl.message(
      'Nearby Places',
      name: 'nearbyPlaces',
      desc: '',
      args: [],
    );
  }

  /// `away`
  String get away {
    return Intl.message(
      'away',
      name: 'away',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone Number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid Phone Number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Pick image from Gallery or open the camera?`
  String get pickImageFromGalleryOrCamera {
    return Intl.message(
      'Pick image from Gallery or open the camera?',
      name: 'pickImageFromGalleryOrCamera',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
