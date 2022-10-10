import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_1/User/Login_page.dart';
import '../page/Favorite_page.dart';
import '../page/Main_page.dart';
import '../page/Playlist_page.dart';
import '../page/Profile_page.dart';
import '../page/Setting_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
              buildButton(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 1,
          left: 24,
        ),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(
                Icons.person_rounded,
                size: 26,
              ),
              title: const Text('Profile', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
              },
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(25),
        child: Wrap(
          runSpacing: 16,
          children: [
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                size: 26,
              ),
              title: const Text('Home', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                size: 26,
              ),
              title: const Text('Favorites', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FavoritePage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.playlist_play,
                size: 26,
              ),
              title: const Text('My playlist', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaylistPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 26,
              ),
              title: const Text('Setting', style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ));
              },
            ),
          ],
        ),
      );

  Widget buildButton(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: 110 + MediaQuery.of(context).padding.top,
          left: 24,
          right: 24,
        ),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 26,
              ),
              title: const Text('Logout', style: TextStyle(fontSize: 16)),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      );
}
