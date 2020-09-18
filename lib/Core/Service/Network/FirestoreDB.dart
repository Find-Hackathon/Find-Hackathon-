import 'package:cloud_firestore/cloud_firestore.dart';

import 'Conversation.dart';
class FireStoreDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Conversation>> getConversations(String userId) {
    var ref = _firestore
        .collection('conversations')
        .where('members', arrayContains: userId);

    return ref.snapshots().map((list) => list.docs
        .map((snapshot) => Conversation.fromSnapshot(snapshot))
        .toList());
  }
}
