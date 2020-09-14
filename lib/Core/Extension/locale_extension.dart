import 'package:flutter/widgets.dart';

extension LocaleExtension on Locale {
  String get localeTag => this.toLanguageTag().split("-").last;
}
