import 'package:dino_diary/services/mock_user.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_profile.dart';
import 'package:dino_diary/widgets/my_profiletextfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  MockUser user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context, 'Editar Perfil'),
        backgroundColor: AppStyle.mainColor2,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 40),
            MyProfile(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(
              height: 24,
            ),
            MyProfileTextField(
              label: 'Nome',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(
              height: 24,
            ),
            MyProfileTextField(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
          ],
        ),
      );
}
