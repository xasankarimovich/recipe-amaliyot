import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../profile_screen/profile_screen.dart';
import '../screens/home/home_screen.dart';
class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  _TabBoxScreenState createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          PayMe(),
          Center(child: Text('Search Screen')),
          Center(child: Text('Add Screen')),
          Center(child: Text('Notifications Screen')),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.teal,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.search, size: 30, color: Colors.black),
          Icon(Icons.add, size: 30, color: Colors.black),
          Icon(Icons.notifications, size: 30, color: Colors.black),
          Icon(Icons.person, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
