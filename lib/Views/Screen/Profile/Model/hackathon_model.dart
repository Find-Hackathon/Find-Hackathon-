import 'package:FindHackathon/Core/Base/base_model.dart';

class HackModel extends BaseModel<HackModel> {
  String description;
  String imageUrl;
  int statusCode;

  HackModel({this.description, this.imageUrl, this.statusCode});

  HackModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    imageUrl = json['imageUrl'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['statusCode'] = this.statusCode;
    return data;
  }

  @override
  HackModel fromJson(Map<String, Object> json) {
    return HackModel.fromJson(json);
  }
}
