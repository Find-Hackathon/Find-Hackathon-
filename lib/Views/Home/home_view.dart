import 'package:FindHackathon/Core/Constants/App/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarr(context),
      body: Container(
        child: Text('abc'),
      ),
    );
  }

  AppBar appBarr(BuildContext context) {
    return AppBar(
      titleSpacing: 24.0,
      actionsIconTheme: IconThemeData(color: Colors.black),
      centerTitle: false,
      title: Text(
        'Hackathons',
        style: Theme.of(context).textTheme.headline6,
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
}
