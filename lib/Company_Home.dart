import 'package:flutter/material.dart';

class HomePageCompany extends StatefulWidget {
  final bool isUser;

  HomePageCompany({required this.isUser});

  @override
  _HomePageCompanyState createState() => _HomePageCompanyState();
}

class _HomePageCompanyState extends State<HomePageCompany> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUser ? 'User Home' : 'Company Home'),
        // ... (customize as needed)
      ),
      body: Center(
        child: Text(widget.isUser ? 'User Home Page' : 'Company Home Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo[700],
        unselectedItemColor: Colors.black45,
        currentIndex: _currentIndex,
        onTap: (index) {
          // Update the state when the bottom navigation bar item is tapped
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
