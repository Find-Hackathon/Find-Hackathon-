import 'package:flutter/material.dart';

import '../../../Core/Base/base_view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  String email;
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
