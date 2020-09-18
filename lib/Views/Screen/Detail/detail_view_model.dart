import 'dart:convert';

import 'package:FindHackathon/Core/Base/base_view_model.dart';
import 'package:FindHackathon/Core/Model/chat_detail_model.dart';
import 'package:http/http.dart' as http;

class DetailViewModel extends BaseViewModel {
  String email;

  @override
  void init() {
    // TODO: implement init
  }

  Future<ChatDetailModel> fetchUsers(int index) async {
    final response =
        await http.get('https://find-hackathon.herokuapp.com/teams/all');
    // print("response : " + json.decode(response.body)[index].toString());
    return ChatDetailModel.fromJson(json.decode(response.body)[index]);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
// final FirestoreDB db = GetIt.instance<FirestoreDB>();
//
// @override
// void init() {}
//
// Stream<List<Conversation>> conversations(){

}
