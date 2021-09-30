import 'package:betterflutterapp/screens/profil/profil.dart';
import 'package:betterflutterapp/screens/todo_list/todo_list_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final backgroundColor = Colors.indigo[900];

  // pour les BottomNavigationBarItem/////
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
  }

 final List<Widget> _children = [
    TodoList(),
    Profil(),

  ];

  @override
  Widget build(BuildContext context) {
    //base de l'appli scaffold
    return Scaffold(
      ///////APP BAR///////////
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('FlutterApp'),
        elevation: 0,
      ),
      ///////////////HOME//////////
      backgroundColor: backgroundColor,
      body: _children[_selectedIndex],
      ///////////BOTTOM APP BAR/////////////
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'ajouter une idée',
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Les idées",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}

