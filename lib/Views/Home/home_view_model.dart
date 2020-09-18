import 'dart:convert';

import 'package:FindHackathon/Core/Base/base_view_model.dart';
import 'package:FindHackathon/Views/Home/home_model.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends BaseViewModel {
  bool isLoading = false;
  List<HomeModel> hackathonList = [];

  Future getData() async {
    final response = await http
        .get('https://find-hackathon.herokuapp.com/organizations/all');
    final jsonBody = jsonDecode(response.body);
    if (jsonBody is List) {
      jsonBody.map((e) => hackathonList.add(HomeModel.fromJson(e))).toList();
    }
    print(hackathonList);
  }

  @override
  void init() {
    print('aaa');
  }
}
