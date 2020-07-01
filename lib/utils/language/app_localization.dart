import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import ''

class AppLocalization {

  final Locale locale;

  AppLocalization(this.locale);

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
    //Map<String, dynamic> jsonMap = json.
  }
}