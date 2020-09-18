import 'dart:convert';

import 'package:FindHackathon/Core/Firebase/user_firebase.dart';
import 'package:FindHackathon/Core/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../Core/Base/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  String id, name, image, username, email, password, confirmPassword, _uid;
  bool validation = false;
  UserFirebase userFirebase = UserFirebase();
  final _formKey = GlobalKey<FormState>();

  validationChange(bool val) {
    validation = val;
    notifyListeners();
  }

  Future<void> firebaseUserCreate() async {
    userFirebase.createAccountFirebase(email, password);
  }

  Future<String> firebaseLogin() async {
    _uid = await userFirebase.signinFirebase(email, password);
    return _uid;
  }

  Future<http.Response> saveUser(UserModel userModel) {
    return http.post(
      'https://find-hackathon.herokuapp.com/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': userModel.id,
        'name': userModel.name,
        'image': userModel.image,
        'description': userModel.description,
      }),
    );
  }

  Future<UserModel> addUser(UserModel userModel) async {
    await http.post(
      'https://find-hackathon.herokuapp.com/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': userModel.id,
        'name': userModel.name,
        'image': userModel.image,
        'description': userModel.description,
      }),
    );

    // print("body : " + json.decode(response.body).toString());
    // UserModel userModel2 =  UserModel.fromJson(json.decode(response.body));
    // print("userModel2: " + userModel2.id.toString());
    // return UserModel.fromJson(json.decode(response.body));
  }

  get formKey => _formKey;

  @override
  void init() {}
}
