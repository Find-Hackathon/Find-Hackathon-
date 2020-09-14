import 'package:FindHackathon/Core/Base/base_view_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {
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
