import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Bar/MenuBar.dart';
import 'Feed_page.dart';
import 'Library_page.dart';
import 'Ranking_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 1;

  final screens = [
    FeedPage(),
    LibraryPage(),
    RankingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final items = <Widget>[
      Icon(Icons.feed, size: 30, color: Colors.greenAccent),
      Icon(Icons.audiotrack, size: 30, color: Colors.lightBlueAccent),
      Icon(Icons.whatshot, size: 30, color: Colors.redAccent),
    ];
    return Scaffold(
      extendBody: true,
      drawer: const NavigationDrawer(),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        buttonBackgroundColor: Colors.white70,
        backgroundColor: Colors.transparent,
        height: 55,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 150),
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
