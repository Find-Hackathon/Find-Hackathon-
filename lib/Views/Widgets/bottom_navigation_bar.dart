import 'package:FindHackathon/Core/Extension/string_extension.dart';
import 'package:FindHackathon/Core/Extension/context_extension.dart';

import 'package:FindHackathon/Core/Utils/custom_linear_grediant.dart';
import 'package:FindHackathon/Views/Home/home_view.dart';
import 'package:FindHackathon/Views/Screen/Detail/detail_view.dart';
import 'package:FindHackathon/Views/Screen/HackathonPage/hackathon_upload_page_view.dart';
import 'package:flutter/material.dart';

/// This Widget is the main application widget.
class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DetailView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("homepage".locale)),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), title: Text("chat".locale)),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: context.theme.primaryColor,
          onTap: _onItemTapped,
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: customLinearGradient(context.theme.primaryColor),
              ),
              child: Icon(Icons.add)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HackathonUpload()));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
