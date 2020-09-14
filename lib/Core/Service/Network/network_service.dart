import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Base/base_model.dart';
import 'Response/Error/error_message.dart';
import 'Response/IResponse_model.dart';
import 'Response/response_model.dart';

class NetworkService {
  static NetworkService _instance;
  static NetworkService get instance {
    if (_instance == null) _instance = NetworkService._init();
    return _instance;
  }

  NetworkService._init();

  Future<IResponseModel<T>> httpGet<T extends BaseModel>({
    @required String url,
    @required BaseModel model,
    Map<String, String> headers,
  }) async {
    IResponseModel<T> responseModel = ResponseModel<T>();
    try {
      final response = await http.get(url);
      return getResponseModel<T>(
          response: response, model: model, responseModel: responseModel);
    } catch (e) {
      responseModel.error = ErrorMessage(errorMessage: e.toString());
      return responseModel;
    }
  }

  Future<IResponseModel<T>> getResponseModel<T extends BaseModel>({
    @required http.Response response,
    @required BaseModel model,
    @required IResponseModel responseModel,
  }) async {
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = json.decode(response.body);
        if (responseBody is List) {
          responseModel.list =
              responseBody.map((e) => model.fromJson(e)).toList().cast<T>();
        } else if (responseBody is Map) {
          responseModel.map = model.fromJson(responseBody);
        } else {
          responseModel.error =
              ErrorMessage(errorMessage: response.statusCode.toString());
          break;
        }
        responseModel.isSucces = true;
        break;
      default:
        responseModel.error =
            ErrorMessage(errorMessage: response.statusCode.toString());
    }
    return responseModel;
  }
}
