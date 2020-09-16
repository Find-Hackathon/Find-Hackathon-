import 'package:FindHackathon/Views/Screen/Chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../User.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection('chat').snapshots().listen(
        (event) => event.docs.forEach((element) => print(element.get('name'))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('conversations')
        //.where('members', arrayContains: User.userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }


          return ListView(
            children: snapshot.data.docs
                .map((doc) =>
                ListTile(
                  // leading: CircleAvatar(backgroundImage: NetworkImage(doc.get("image"))),
                  title: Text('title'),
                  subtitle: Text(doc.get('displayMessage')),
                  // trailing: Text(doc.get("time")),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ChatPage(
                            userId: User.userId,
                            conversationId: doc.documentID,
                          )),
                    );
                  },
                ))
                .toList(),
          );
        },
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
