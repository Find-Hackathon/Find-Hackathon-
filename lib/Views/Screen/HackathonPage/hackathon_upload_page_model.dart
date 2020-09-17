class HackathonOrganizationModel {
  String id;
  String name;
  String image;
  String description;
  List attendees;

  HackathonOrganizationModel(
      {this.id, this.name, this.image, this.description, this.attendees});

  HackathonOrganizationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = DateTime.now()
        .toIso8601String()
        .replaceAll(":", "")
        .replaceAll("-", "")
        .replaceAll(".", "");
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
