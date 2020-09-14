import 'package:FindHackathon/Views/Screen/Login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  String email;
  SharedPreferences prefs;

  @override
  void initState() {
    getSharedPreferences();
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
            Text(prefs.getString("password")),
            OutlineButton(
                child: Text("Logout"),
                onPressed: () {
                  setState(() {
                    prefs.setBool("isLoggedIn", false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)))
          ],
        ));
  }

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}
