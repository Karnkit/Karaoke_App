import 'package:flutter/material.dart';
import '../Bar/MenuBar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
