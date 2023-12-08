import 'dart:io';
import 'package:dino_diary/services/mock_user.dart';
import 'package:dino_diary/style/app_style.dart';
import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_button.dart';
import 'package:dino_diary/widgets/my_profile.dart';
import 'package:dino_diary/widgets/my_profiletextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  MockUser user = UserPreferences.myUser;

  // late MockUser user;
  //
  //@override
  // void initState() {
  // super.initState();
  //
  // user = UserPreferences.getUser();
  // }
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
              onClicked: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MyProfileTextField(
              label: 'Nome',
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(
              height: 24,
            ),
            MyProfileTextField(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(
              height: 24,
            ),
            MyButton(
                onTap: () {
                  UserPreferences.setUser(user);
                  Navigator.of(context).pop();
                },
                text: 'Salvar')
          ],
        ),
      );
}
