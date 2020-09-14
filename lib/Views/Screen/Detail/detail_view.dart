import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool state;
  SharedPreferences prefs;

  @override
  void initState() {
    _getUserState().then((state) {
      setState(() {
        this.state = state;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GRUP2'),
        ),
        body: Column(
          children: [
            Text("state : " + prefs.getBool("isLoggedIn").toString()),
            Text("password : " + prefs.getString("password")),
            Text("email : " + prefs.get("email")),
            OutlineButton(
                child: Text("Logout"),
                onPressed: () {
                  prefs.setBool("isLoggedIn", false);
                  Navigator.pop(context);
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)))
          ],
        ));
  }

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  _getUserState() async {
    prefs = await SharedPreferences.getInstance();
    var state = prefs.getBool('isLoggedIn');
    return state;
  }
}
