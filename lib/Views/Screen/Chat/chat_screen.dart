import 'package:FindHackathon/Views/Screen/Detail/detail_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Core/Extension/context_extension.dart';

class ChatPage extends StatefulWidget {
  String groupId;
  String userName;
  String gorupName;
  final String conversationId;
  final String userId;

  // ChatPage({Key key, this.groupId, this.userName, this.gorupName})
  //     : super(key: key);
  ChatPage({Key key, this.userId, this.conversationId}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  CollectionReference ref;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    ref = FirebaseFirestore.instance
        .collection('conversations/${widget.conversationId}/messages');
    print(widget.userId);
    super.initState();
  }

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
        onPressed: () {
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => DetailView()));
        },
      ),
      actions: [
        InkWell(
          child: Icon(Icons.more_vert),
          onTap: () {},
        )
      ],
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
      child: StreamBuilder(
          stream: ref.orderBy('timeStamp').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return !snapshot.hasData
                ? CircularProgressIndicator()
                : ListView(
                    children: snapshot.data.docs
                        .map((document) => buildListTile(document, context))
                        .toList());
          }),
    );
  }

  ListTile buildListTile(document, BuildContext context) {
    return ListTile(
      title: Align(
        alignment: widget.userId != document.get('senderId')
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(context.constMediumValue),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.constHighValue),
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            document.get('message'),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
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
      onPressed: () async {
        await ref.add({
          "senderId": widget.userId,
          "message": textEditingController.text,
          "timeStamp": DateTime.now()
        });
        textEditingController.text = "";
      },
    );
  }
}
