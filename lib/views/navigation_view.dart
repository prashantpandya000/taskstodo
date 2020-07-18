import 'package:flutter/material.dart';
//import 'package:taskstodo/models/tasklist.dart';
import 'package:taskstodo/pages.dart';
import 'package:taskstodo/views/profile_view.dart';
import 'package:taskstodo/views/home_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    Schedule(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    //final Tasklist = new Tasklist(null, null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        title: Text("navigation_view App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              );
            },
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("task"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.schedule),
              title: new Text("schedule"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text("Profile"),
            ),
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
