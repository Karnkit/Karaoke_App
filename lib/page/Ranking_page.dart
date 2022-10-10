import 'package:flutter/material.dart';
import '../Bar/MenuBar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Rating'),
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: const NavigationDrawer(),
        body: Image.network(
          'https://designimages.appypie.com/appbackground/appbackground-23-plant-temptag.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}
