import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Bar/MenuBar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
