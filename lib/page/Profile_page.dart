import 'package:flutter/material.dart';
import '../Bar/MenuBar.dart';
import '../utils/model/user.dart';
import '../utils/user_preferences.dart';
import '../widget/numbers_widget.dart';
import '../widget/profile_widget.dart';
import 'edit_Profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Profile',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://designimages.appypie.com/appbackground/appbackground-23-plant-temptag.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 30),
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            const SizedBox(height: 30),
            buildName(user),
            const SizedBox(height: 30),
            NumbersWidget(),
            const SizedBox(height: 30),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
}
