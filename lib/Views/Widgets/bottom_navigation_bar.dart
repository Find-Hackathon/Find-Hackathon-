import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:FindHackathon/Views/Home/home_view.dart';
import 'package:FindHackathon/Views/Screen/Detail/detail_view.dart';
import 'package:FindHackathon/Views/Screen/HackathonPage/hackathon_upload_page_view.dart';
import 'package:FindHackathon/Views/Screen/HackathonPage/hackathon_upload_page_view_model.dart';
import 'package:FindHackathon/Views/Screen/Participants/participants_view.dart';
import 'package:flutter/material.dart';

/// This Widget is the main application widget.
class NavigationBar extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
                icon: Icon(Icons.home), title: Text("Anasayfa")),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), title: Text("Chat")),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF56C596),
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
                  gradient: RadialGradient(
                      radius: 0.5,
                      colors: [Color(0xFF7BE495), Color(0xFF329D9C)])),
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
