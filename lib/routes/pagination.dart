import 'package:flutter/material.dart';
import 'package:vocem/screens/screens_index.dart';

import '../global_vars.dart';

class Pagination extends StatefulWidget {
  @override
  _PaginationState createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: HomePage()),
    Center(child: Text("2")),
    Center(child: Text("3")),
    Center(child: Text("4")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Test"),
      //   backgroundColor: Colors.deepPurple,
      // ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
           BottomNavigationBarItem(
             icon: Icon(Icons.home_outlined),
             label: "Home",
             backgroundColor: c1, // Colors.deepPurple,
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.search),
             label: "Search",
             backgroundColor: c1, // Colors.deepPurple,
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.list_alt_outlined),
             label: "Commandes",
             backgroundColor: c1, // Colors.deepPurple
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.account_circle),
             label: "Profil",
             backgroundColor: c1, // Colors.deepPurple
           ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex= index;
          });
        },
      ),
    );
  }
}
