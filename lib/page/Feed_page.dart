import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Bar/MenuBar.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Feed'),
          actions: [
            IconButton(
              icon: Icon(Icons.add_comment),
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
