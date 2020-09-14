import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  SharedPreferences prefs;
  String email, password;
  bool validation = false;
  final _formKey = GlobalKey<FormState>();

  validationChange(bool val) {
    validation = val;
    notifyListeners();
  }

  get formKey => _formKey;
  @override
  void init() {}
}
