import 'package:flutter/material.dart';

import '../../../Core/Extension/context_extension.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String userName;
  final String gorupName;

  ChatPage({Key key, this.groupId, this.userName, this.gorupName})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: [
            buildExpandedMessageScreen(),
            buildPaddingMessageBox(context),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {},
      ),
      centerTitle: true,
      elevation: 0,
      title: Text(
        "Hackathon Grup Name",
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  Expanded buildExpandedMessageScreen() {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(context.constMediumValue),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.constHighValue),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  index.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildPaddingMessageBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.constMediumValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.constHighValue,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(context.constHighValue),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildInkWellEmojiIcons(),
                  buildExpandedWriteConsoleMessage(),
                  buildIconButtonSendMessage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildInkWellEmojiIcons() {
    return InkWell(
      child: Icon(
        Icons.tag_faces,
        color: Colors.grey[900],
      ),
    );
  }

  Expanded buildExpandedWriteConsoleMessage() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: " Yazınızı yazın.",
        ),
      ),
    );
  }

  IconButton buildIconButtonSendMessage() {
    return IconButton(
      icon: Icon(
        Icons.send,
        color: Colors.grey[900],
      ),
      onPressed: () {},
    );
  }
}
