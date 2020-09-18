import 'dart:convert';
import 'dart:io';

import 'package:FindHackathon/Core/Base/base_view_model.dart';
import 'package:http/http.dart ' as http;

class HackatonDetailViewModel extends BaseViewModel {
  String name;
  String description;
  int stars;
  //List<String> imagePaths;
  String imagePath;
  bool isSubscribed;

  String organizationUrl =
      "https://find-hackathon.herokuapp.com/organizations/id/";
//Todo:User,Profile Pictures
  void setName(String getName) {
    name = getName;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

/*
  void setStars(int getStars) {
    stars = getStars;
  }
*/
  void setImagePath(String getImagePath) {
    //imagePaths.add(getImagePath);
    imagePath = getImagePath;
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  String getImagePath() {
    return imagePath;
  }

/*
  List<String> getImagePaths() {
    return imagePaths;
  }

  int getStars() {
    return stars;
  }
*/

  @override
  void init() {
    // TODO: implement init
  }
}

class Subscription {
  String subscribe;

  Subscription({this.subscribe});

  Subscription.fromJson(Map<String, dynamic> json) {
    subscribe = json['subscribe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscribe'] = this.subscribe;
    return data;
  }
}

Future<void> subscribeToOrganization(
    String userId, String organizationId) async {
  String subscribeUrl =
      "https://find-hackathon.herokuapp.com/organizations/organizaionSubscribe/";
  var subscription = new Subscription(subscribe: userId);
  final http.Response response = await http.post(subscribeUrl + organizationId,
      body: subscription.toJson());
  switch (response.statusCode) {
    case HttpStatus.ok:
      var decodedJson = json.decode(response.body);
      if (decodedJson["isSucces"]) {
        print(decodedJson);
      }
      break;
    default:
      print("Something went wrong");
  }
}
