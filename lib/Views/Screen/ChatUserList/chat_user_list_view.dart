import 'package:FindHackathon/Views/Screen/Chat/chat_screen.dart';
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
    super.initState();
    users = mockUsers();
    newFormat = DateFormat("jm");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: appBar(context), //buildAppBar(context),
      body: buildUserList(),
    ));
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 24.0,
      actionsIconTheme: IconThemeData(color: Color(0xFF56C596)),
      centerTitle: false,
      title: Text(
        'Chats',
        style: Theme.of(context).textTheme.headline6.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
            color: Color(0xFF56C596)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  ListView buildUserList() {
    return new ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: new Card(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                leading: Container(
                  child: CircleAvatar(
                    child: Image.asset(users[index].getUserProfilePicture()),
                  ),
                ),
                title: Text(
                  users[index].getUserName(),
                  style: context.textTheme.bodyText1,
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.check),
                    Text(users[index].getLastMessage(),
                        style: context.textTheme.subtitle2),
                  ],
                ),
                trailing: Text(
                  newFormat.format(users[index].getLastMessageTime()),
                  style: context.textTheme.subtitle2,
                ),
              )),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: MediaQuery.of(context).size.height * 0.15,
      title: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
          child: SearchTextField(size: MediaQuery.of(context).size)),
    );
  }
}
