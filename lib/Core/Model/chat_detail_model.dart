class ChatDetailModel {
  String sId;
  String id;
  String name;
  List<Attendees> attendees;
  int iV;

  ChatDetailModel({this.sId, this.id, this.name, this.attendees, this.iV});

  ChatDetailModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    if (json['attendees'] != null) {
      attendees = new List<Attendees>();
      json['attendees'].forEach((v) {
        attendees.add(new Attendees.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.attendees != null) {
      data['attendees'] = this.attendees.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
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