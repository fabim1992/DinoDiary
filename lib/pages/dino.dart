import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:flutter/material.dart';
import 'package:dino_diary/style/app_style.dart';

class Dino extends StatefulWidget {
  const Dino({super.key});

  @override
  State<Dino> createState() => _DinoState();
}
final TextEditingController _nameController = TextEditingController();
class _DinoState extends State<Dino> {
  
  List<Widget?> gridItems = List.generate(35, (index) {
    if (index == 12) {
      return GestureDetector(
        onTap: () {
          print("Clicked on cute-dino.png");
        },
        child: Image.asset(
          'lib/assets/images/cute-dino.png',
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 0) {
      return GestureDetector(
        onTap: () {
          print("Clicked on camera");
        },
        child: Icon(
          Icons.photo_camera,
          color: AppStyle.accentColor2,
          size: 40.0,
        ),
      );
    } else if (index == 2) {
      return Container(
        color: Colors.transparent,
        //margin: const EdgeInsets.all(5),
        child:  Center(
          child: TextField(
            maxLength: 5,
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: "Dino",
              
            ),
            style: TextStyle(
              color: AppStyle.textcolor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            onChanged:(value) {
              _nameController.text;
            },
          ),
          
        ),
      );
    } else if (index == 4) {
      return GestureDetector(
        onTap: () {
          print("Clicked on help.png");
        },
        child: Icon(
          Icons.help,
          color: AppStyle.accentColor2,
          size: 40.0,
        ),
      );
    } else if (index == 22) {
      return GestureDetector(
        onTap: () {
          print("Clicked on dino-quest.png");
        },
        child: Image.asset(
          'lib/assets/images/dino-quest.png',
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 26) {
      return GestureDetector(
        onTap: () {
          print("Clicked on dino-popcorn.png");
        },
        child: Image.asset(
          'lib/assets/images/dino-popcorn.png',
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 28) {
      return GestureDetector(
        onTap: () {
          print("Clicked on dino-shop.png");
        },
        child: Image.asset(
          'lib/assets/images/dino-shop.png',
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 32) {
      return GestureDetector(
        onTap: () {
          print("Clicked on dino-potion.png");
        },
        child: Image.asset(
          'lib/assets/images/dino-potion.png',
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(5),
      );
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Dino"),
      backgroundColor: AppStyle.mainColor2,
      body: GridView.builder(
        itemCount: gridItems.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, index) {
          // Check if the item is null, and return an empty container if it is
          return gridItems[index] ?? Container();
        },
      ),
      
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
