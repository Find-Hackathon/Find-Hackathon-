import 'dart:convert';
import 'dart:io';

import 'package:FindHackathon/Core/Base/base_model.dart';
import 'package:FindHackathon/Core/Service/Network/Response/Error/error_message.dart';
import 'package:FindHackathon/Views/Screen/Profile/Model/hackathon_model.dart';
import 'package:http/http.dart' as http;

import 'IHackathon_service.dart';

class HackathonService extends IHackathonService {
  final baseUrl = "https://city-turkey.firebaseio.com/";

  @override
  Future<List<HackModel>> getHttpList() async {
    return await _httpGet<HackModel>("$baseUrl/city.json", HackModel());
  }

  Future<dynamic> _httpGet<T extends BaseModel>(String path, T model) async {
    try {
      final response = await http.get(path);
      if (response is http.Response) {
        switch (response.statusCode) {
          case HttpStatus.ok:
            return _bodyParser<T>(response.body, model);
            break;
          default:
            throw ErrorMessage();
        }
      }
      return response;
    } catch (e) {
      return ErrorMessage();
    }
  }

  dynamic _bodyParser<T extends BaseModel>(String body, BaseModel model) {
    final jsonBody = jsonDecode(body);
    if (jsonBody is List) {
      return jsonBody.map((e) => model.fromJson(e)).cast<T>().toList();
    } else if (jsonBody is Map) {
      return model.fromJson(jsonBody);
    } else {
      return jsonBody;
    }
  }
}
