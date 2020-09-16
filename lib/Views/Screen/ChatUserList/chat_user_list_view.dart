import 'package:FindHackathon/Views/Widgets/oval_appbar.dart';
import 'package:FindHackathon/Views/Widgets/search_text_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../Core/Extension/context_extension.dart';
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
      appBar: buildAppBar(context),
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
          return buildUsersContainer(index);
        },
      ),
    ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight:
          MediaQuery.of(context).size.height * context.constMediumValue / 130,
      title: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: SearchTextField(size: MediaQuery.of(context).size)),
    );
  }

  Container buildUsersContainer(int index) {
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
            trailing: Text(newFormat.format(users[index].getLastMessageTime())),
          )),
    );
  }
}
