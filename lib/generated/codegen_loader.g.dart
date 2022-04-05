// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "screen_title": "Products",
  "change_language": "Change language"
};
static const Map<String,dynamic> ar = {
  "screen_title": "منتجات",
  "change_language": "غير اللغة"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
