import 'package:flutter/material.dart';

import '../../../Core/Base/base_view_model.dart';
import 'package:http/http.dart' as http;

import 'hackathon_upload_page_model.dart';

class HackathonUploadModel extends BaseViewModel {
  final _formKeyHackathonUploadModel = GlobalKey<FormState>();
  String description, name;
  bool isSuccess;
  var resimUrl;

  get formKeyHackathonUploadModel => _formKeyHackathonUploadModel;

  void createOrganizatiom() async {
    print(name);
    print(description);
    print(resimUrl);
    bool a = await create(HackathonOrganizationModel(
        image: resimUrl, description: description, name: name));
  }

  Future<bool> create(HackathonOrganizationModel userModel) async {
    final http.Response response = await http.post(
      'https://find-hackathon.herokuapp.com/organizations/createOrganization',
      body: userModel.toJson(),
    );
    print(response.body);
    return true;
  }

  @override
  void init() {}
}
