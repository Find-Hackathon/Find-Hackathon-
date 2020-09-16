import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  TextEditingController textEditingController = TextEditingController();
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
            title: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(context.constMediumValue),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.constHighValue),
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildAlignAvatarProfile(context),
                          buildExpandedDataScreen(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded buildExpandedDataScreen(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: context.constMediumValue,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          //index.toString(),
          "deneme yazısı yfdsfdsfdsfdsfds fdsf adsfd safds afdsa fdsa fdsafdas",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Align buildAlignAvatarProfile(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        radius: context.constHighValue,
        backgroundImage: NetworkImage("https://picsum.photos/200"),
        backgroundColor: Colors.transparent,
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
        controller: textEditingController,
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
