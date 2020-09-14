import 'package:flutter/material.dart';

import '../Theme/lighttheme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _data = lightTheme;

  ThemeData get getTheme => _data;

  void setTheme(ThemeData tm) {
    _data = tm;
    notifyListeners();
  }
}
