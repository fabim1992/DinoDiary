import 'package:dino_diary/pages/user_editprofile.dart';
import 'package:dino_diary/services/mock_user.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/info_bar.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:dino_diary/widgets/my_profile.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Scaffold(
      appBar: buildAppBar(context, "Perfil"),
      bottomNavigationBar: MyNavbar(),
      backgroundColor: AppStyle.mainColor2,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 24,
          ),
          MyProfile(
              imagePath: user.imagePath,
              onClicked: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UserEditProfile()),
                );
                setState(() {});
              }),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 24,
          ),
          InfoBar(),
          const SizedBox(
            height: 48,
          )
        ],
      ),
    );
  }

  Widget buildName(MockUser user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(color: AppStyle.textcolor, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email,
            style: TextStyle(color: AppStyle.textcolor2),
          ),
        ],
      );
}
