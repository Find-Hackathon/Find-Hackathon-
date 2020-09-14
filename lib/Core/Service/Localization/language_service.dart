import 'package:flutter/material.dart';

class LanguageService {
  static const String path = "assets/lang";

  static LanguageService _instance;
  static LanguageService get instance {
    if (_instance == null) _instance = LanguageService._init();
    return _instance;
  }

  LanguageService._init();

  final enLocale = Locale("en", "US");
  final trLocale = Locale("tr", "TR");

  List<Locale> get locales => [
        enLocale,
        trLocale,
      ];
}
