import 'package:FindHackathon/Core/Base/base_model.dart';

class HomeModel extends BaseModel<HomeModel> {
  bool closed;
  String id;
  String name;
  String image;
  String description;
  List<Attendees> attendees;

  HomeModel(
      {this.closed,
      this.id,
      this.name,
      this.image,
      this.description,
      this.attendees});

  HomeModel.fromJson(Map<String, dynamic> json) {
    closed = json['closed'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    if (json['attendees'] != null) {
      attendees = new List<Attendees>();
      json['attendees'].forEach((v) {
        attendees.add(new Attendees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['closed'] = this.closed;
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    if (this.attendees != null) {
      data['attendees'] = this.attendees.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return HomeModel.fromJson(json);
  }
}

class Attendees {
  String sId;
  String subscribe;

  Attendees({this.sId, this.subscribe});

  Attendees.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subscribe = json['subscribe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['subscribe'] = this.subscribe;
    return data;
  }
}
