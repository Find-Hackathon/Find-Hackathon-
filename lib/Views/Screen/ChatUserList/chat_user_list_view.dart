import 'package:FindHackathon/Views/Widgets/search_text_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
<<<<<<< HEAD
import '../../../Core/Extension/context_extension.dart';
=======

>>>>>>> f186cc0f212a151d79758b517db5614cc5001dd8
import 'chat_user_list_view_model.dart';

class ChatUserListView extends StatefulWidget {
  ChatUserListView({Key key}) : super(key: key);

  @override
  _ChatUserListState createState() => _ChatUserListState();
}

class _ChatUserListState extends State<ChatUserListView> {
  List<ChatUserModel> users;

  Size size;
  var newFormat;
  String updatedDt;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = mockUsers();
    newFormat = DateFormat("jm");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.symmetric(vertical: context.constHighValue),
            child: SearchTextField()),
      ),
      body: new ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: new Card(
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                    child: CircleAvatar(
                      child: Image.asset(users[index].getUserProfilePicture()),
                    ),
                  ),
                  title: Text(users[index].getUserName()),
                  subtitle: Row(
                    children: [
                      Icon(Icons.check),
                      Text(users[index].getLastMessage()),
                    ],
                  ),
                  trailing:
                      Text(newFormat.format(users[index].getLastMessageTime())),
                )),
          );
        },
      ),
    ));
  }
}
