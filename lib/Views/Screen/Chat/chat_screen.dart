import 'package:FindHackathon/Core/Service/Network/Conversation.dart';
import 'package:FindHackathon/Views/Screen/Detail/detail_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Core/Extension/context_extension.dart';

class ChatPage extends StatefulWidget {
  String groupId;
  String userName;
  String gorupName;
  final String conversationId;
  final String userId;
  final Conversation conversation;

  // ChatPage({Key key, this.groupId, this.userName, this.gorupName})
  //     : super(key: key);
  ChatPage({Key key, this.userId, this.conversationId, this.conversation})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  CollectionReference ref;
  final TextEditingController textEditingController = TextEditingController();
  String hackathonName;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    ref = FirebaseFirestore.instance
        .collection('conversations/${widget.conversationId}/messages');
    print(widget.userId);
    hackathonName = widget.conversation.name;
    print("hackathonName : " + hackathonName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Container(
          child: Column(
            children: <Widget>[
              buildExpandedMessageScreen(),
              buildPaddingMessageBox(context),
            ],
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => DetailView()));
        },
      )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(widget.conversation.profileImage)),
        ),
        InkWell(
          child: Icon(Icons.more_vert),
          onTap: () {},
        )
      ],
      centerTitle: true,
      elevation: 0,
      title: Text(
        hackathonName,
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  Expanded buildExpandedMessageScreen() {
    return Expanded(
      child: StreamBuilder(
          stream: ref.orderBy('timeStamp', descending: true).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return !snapshot.hasData
                ? CircularProgressIndicator()
                : ListView(
                    reverse: true,
                    shrinkWrap: true,
                    children: snapshot.data.docs
                        .map((document) => buildListTile(document, context))
                        .toList());
          }),
    );
  }

  // checkColor() {
  //
  // }

  ListTile buildListTile(document, BuildContext context) {
    Color color;
    Color textColor;
    if (widget.userId != document.get('senderId')) {
      color = Color(0xffcff4d2).withOpacity(0.5);
      // color = Theme.of(context).primaryColor.withOpacity(0.5);
      textColor = Colors.black;
    } else {
      color = Color(0xFF56C596);
      textColor = Colors.white;
    }
    // return ListTile(
    //   title: Align(
    //       alignment: widget.userId != document.get('senderId')
    //           ? Alignment.centerLeft
    //           : Alignment.centerRight,
    //       child: Container(
    //           padding: EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //               color: Theme.of(context).primaryColor,
    //               borderRadius: BorderRadius.horizontal(
    //                   left: Radius.circular(10),
    //                   right: Radius.circular(10))),
    //           child: Text(
    //             document.get('message'),
    //             style: TextStyle(color: Colors.white),
    //           ))),
    // );

    return ListTile(
      title: Align(
          alignment: widget.userId != document.get('senderId')
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    context.constMediumValue, context.constLowValue,
                    context.constMediumValue, context.constLowValue),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.constMediumValue),
                  color: color,
                ),
                child: Text(
                  document.get('message'),
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
              Text(
                getDate(document),
                style: TextStyle(color: CupertinoColors.inactiveGray),
              )
            ],
          )),
    );
  }

  getDate(document) {
    var dt = document.get('timeStamp').toDate();
    var newFormat = DateFormat("jm");
    String updatedDt = newFormat.format(dt);
    print(updatedDt);
    return updatedDt; // 20-04-03
  }

  Padding buildPaddingMessageBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(context.constMediumValue),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: buildBoxDecoration(),
                child: buildRowChatField(),
              ),
            ),
            buildContainerSendMessage()
          ],
        ));
  }

  Row buildRowChatField() {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildInkWellEmojiIcons()),
        Expanded(
          child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  hintText: "Type a message", border: InputBorder.none)),
        ),
      ],
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Color(0xFF56C596), width: 1.5),
      color: Colors.white,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(20),
        right: Radius.circular(20),
      ),
    );
  }

  buildContainerSendMessage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Container(
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF56C596),
        ),
        child: IconButton(
          icon: Icon(
            Icons.send,
            color: Colors.white,
          ),
          onPressed: () async {
            await ref.add({
              'senderId': widget.userId,
              'message': textEditingController.text,
              'timeStamp': DateTime.now()
            });

            textEditingController.text = '';
          },
        ),
      ),
    );
  }

  InkWell buildInkWellEmojiIcons() {
    return InkWell(
      child: Icon(
        Icons.tag_faces,
        color: Colors.grey,
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
        textEditingController.clear();
      },
    );
  }
}
