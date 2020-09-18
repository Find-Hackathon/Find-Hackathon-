import 'package:FindHackathon/Core/Service/Network/Conversation.dart';
import 'package:FindHackathon/Core/Service/Network/FirestoreDB.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ChatsModel with ChangeNotifier {
  final FireStoreDB _db = GetIt.instance<FireStoreDB>();

  Stream<List<Conversation>> conversations(String userId) {
    return _db.getConversations(userId);
  }
}
