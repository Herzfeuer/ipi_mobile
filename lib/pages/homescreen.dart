import 'package:flutter/material.dart';

import 'package:fluttertest2/pages/menu_page.dart';
import 'package:fluttertest2/pages/profile_page.dart';
import 'package:fluttertest2/pages/news_page.dart';
import 'package:fluttertest2/pages/calendar_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variables
  int _currentIndex = 0;

  // Pages List
  final List<Widget> _pages = [
    NewsPage(),
    CalendarPage(),
    ProfilePage(),
    MenuPage(),
  ];

  void _onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
            backgroundColor: Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: "Calendar",
            backgroundColor: Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
            backgroundColor: Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
            ),
            label: "Menu",
            backgroundColor: Colors.blue,
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
