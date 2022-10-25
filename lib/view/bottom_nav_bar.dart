import 'package:flutter/material.dart';
import 'package:mvc_design/view/screens/home_screen.dart';
import 'package:mvc_design/view/screens/mail.dart';
import 'package:mvc_design/view/screens/profile.dart';
import 'package:mvc_design/view/screens/transaction.dart';

import '../model/app_constant.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    Mail(),
    Profile(),
    Transaction()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        unselectedLabelStyle: TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: onItemTBottomNavigationPageed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_outlined),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void onItemTBottomNavigationPageed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
