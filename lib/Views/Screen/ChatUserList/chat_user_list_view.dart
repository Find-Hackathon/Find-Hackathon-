import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'chat_user_list_view_model.dart';

class ChatUserListView extends StatefulWidget {
  ChatUserListView({Key key}) : super(key: key);

  @override
  _ChatUserListState createState() => _ChatUserListState();
}

class _ChatUserListState extends State<ChatUserListView> {
  List<ChatUserModel> users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = mockUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< Updated upstream
      child: Scaffold(
        body: Container(
          child: Column(),
        ),
      ),
    );
=======
        child: Scaffold(
      body: new ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: ListTile(
            leading: CircleAvatar(
              child: Image.asset(users[index].getUserProfilePicture()),
            ),
            title: Text(users[index].getUserName()),
          ));
        },
      ),
    ));
>>>>>>> Stashed changes
  }
}
