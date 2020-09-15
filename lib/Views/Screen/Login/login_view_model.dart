import 'package:FindHackathon/Core/Firebase/user_firebase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  UserFirebase _userFirebase = UserFirebase();

  SharedPreferences prefs;
  String email, password, _uid;
  bool validation = false;
  final _formKey = GlobalKey<FormState>();

  validationChange(bool val) {
    validation = val;
    notifyListeners();
  }

  Future<String> firebaseLogin() async {
    _uid = await _userFirebase.signinFirebase(email, password);
    return _uid;
  }

  get formKey => _formKey;
  @override
  void init() {}
}
