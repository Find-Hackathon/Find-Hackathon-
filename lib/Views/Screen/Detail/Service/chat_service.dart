import 'dart:convert';
import 'dart:io';

import 'package:FindHackathon/Views/Screen/Detail/Model/chat_model.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static const String URL = "https://find-hackathon.herokuapp.com/";

  Future<List<ChatModel>> getMessage(args) async {
    final response = await http.get("$URL/teams/name/5afcdajd72a123325210");

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body);
        final messageList = jsonModel as List<ChatModel>;
        return messageList;
      default:
        return Future.error(response.statusCode);
    }
  }
}
