import 'package:FindHackathon/Core/Model/ChatsModel.dart';
import 'package:FindHackathon/Core/Model/chat_detail_model.dart';
import 'package:FindHackathon/Core/Service/Network/Conversation.dart';
import 'package:FindHackathon/Core/Service/Network/chat_service.dart';
import 'package:FindHackathon/Views/Screen/Chat/chat_screen.dart';
import 'package:FindHackathon/Views/Screen/Detail/detail_view_model.dart';
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
  ChatDetailModel chatModel;
  DetailViewModel viewModel;
  List<String> docIds = new List<String>();

  @override
  void initState() {
    super.initState();

    docIds.add("CIwa6ycuL5yQ3YCJg4cq");
    docIds.add("NXKRCWlAV5wDXecj72l1");
    docIds.add("fcnFP1ynxL2qn0WS7Rt9");
    docIds.add("h2S3Q35THlwdGrSQcwub");
    docIds.add("nE7XG7hGhQStfJjQXJus");
    FirebaseFirestore.instance.collection('chat').snapshots().listen(
        (event) => event.docs.forEach((element) => print(element.get('name'))));
    service = ChatService();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<DetailViewModel>(context);
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
                      DocumentReference docRef;
                      DocumentSnapshot docSnapshot;
                      int i = 0,
                          k = 0;
                      String id;

                      for (i = 0; i < 5; i++) {
                        // print("id : "+ docIds[i]);
                        chatModel = await viewModel.fetchUsers(i);
                        docRef = FirebaseFirestore
                            .instance
                            .collection('conversations')
                            .doc(docIds[i]);
                        docSnapshot = await docRef.get();
                        List members = docSnapshot.data()['members'];
                        for (k = 0; k < 5; k++) {
                          id = chatModel.attendees[k].sId;
                          print("id : " + id);
                          members.map((e) {
                            if (e == id)
                              print("already have");
                            else
                              docRef.update({
                                'members':
                                FieldValue.arrayUnion([id])
                              });
                          }).toList();
                        }
                      }


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
                          builder: (context) =>
                              ChatPage(
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
