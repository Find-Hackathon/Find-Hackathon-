import 'package:FindHackathon/Core/Service/Network/ChatsModel.dart';
import 'package:FindHackathon/Core/Service/Network/Conversation.dart';
import 'package:FindHackathon/Views/Screen/Chat/chat_screen.dart';
import 'package:FindHackathon/Views/Screen/Detail/Service/chat_service.dart';
import 'package:FindHackathon/Views/Widgets/bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../User.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  ChatService service;
  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection('chat').snapshots().listen(
        (event) => event.docs.forEach((element) => print(element.get('name'))));
    service = ChatService();
  }

  @override
  Widget build(BuildContext context) {
    var model = GetIt.instance<ChatsModel>();
    return WillPopScope(
      onWillPop: backpressed,
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (BuildContext context) => model,
          child: StreamBuilder<List<Conversation>>(
            stream: model.conversations(User.userId),
            builder: (BuildContext context,
                AsyncSnapshot<List<Conversation>> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              }

              return ListView(
                children: snapshot.data
                    .map((doc) => ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(doc.profileImage)),
                          title: Text(doc.name),
                          subtitle: Text(doc.displayMessage),
                          trailing: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              DocumentReference docRef = FirebaseFirestore
                                  .instance
                                  .collection('conversations')
                                  .doc(doc.id);
                              DocumentSnapshot docSnapshot = await docRef.get();
                              List members = docSnapshot.data()['members'];
                              members.map((e) {
                                if (e == User.userId)
                                  print("already have");
                                else
                                  docRef.update({
                                    'members':
                                        FieldValue.arrayUnion([User.userId])
                                  });
                              }).toList();

                              // CollectionReference ref = FirebaseFirestore.instance
                              //     .collection('conversations');
                              // Map<String,dynamic> demoData = {
                              //   "members" : "keyvalue"
                              // };
                              // ref.add(demoData);
                              // QuerySnapshot querySnapshot = await ref.get();
                              // querySnapshot.docs[0].reference
                              //     .update({"displayMessage": "lastMessage"});
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                      userId: User.userId,
                                      conversationId: doc.id,
                                      conversation: doc)),
                            );
                          },
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("chat")
        .doc("Mdnxurl5UxXg9IUPAjFi")
        .get();
  }

  Future<bool> backpressed() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NavigationBar()),
    );
  }

// return Container(
//     child: FutureBuilder(
//   future: getData(),
//   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//     if (snapshot.connectionState == ConnectionState.done) {
//       return Column(
//         children: [
//           Container(
//             height: 27,
//             child: Text(
//               "Name: ${snapshot.data.data()['name']}",
//               overflow: TextOverflow.fade,
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ],
//       );
//     } else if (snapshot.connectionState == ConnectionState.none) {
//       return Text("No data");
//     }
//     return CircularProgressIndicator();
//   },
// )
// );

// _getUserState() async {
//   prefs = await SharedPreferences.getInstance();
//   var state = prefs.getBool('isLoggedIn');
//   return state;
// }
}
