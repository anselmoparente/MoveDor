import 'package:flutter/material.dart';
import 'package:movedor/components/bottom_nav.dart';
import 'package:movedor/screens/infographic/infographic_screen.dart';
import 'package:movedor/screens/diary/diary_screen.dart';
import 'package:movedor/screens/profile/profile_screen.dart';

import 'components/body.dart';

class BookScreen extends StatefulWidget  {
  static String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BookScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: PageView(
          physics:new NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Body(),
            Infographic(),
            Diary(),
            ProfileScreen(),
          ],
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          },
      ),
      bottomNavigationBar: BottomNav(_selectedIndex, _pageController)
    );
  }
}