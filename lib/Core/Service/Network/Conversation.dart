import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation {
  String id;
  String name;
  String profileImage;
  String displayMessage;
  List members;

  Conversation(
      {this.id,
      this.name,
      this.profileImage,
      this.displayMessage,
      this.members});

  factory Conversation.fromSnapshot(DocumentSnapshot snapshot) {
    return Conversation(
        id: snapshot.id,
        name: snapshot.data()['hackathonName'],
        profileImage: snapshot.data()['hackathonImage'],
        displayMessage: snapshot.data()['displayMessage'],
        members: snapshot.data()['members']);
  }
}
