import 'package:dino_diary/widgets/my_appbar.dart';
import 'package:dino_diary/widgets/my_navbar.dart';
import 'package:flutter/material.dart';

class Dino extends StatefulWidget {
  const Dino({super.key});

  @override
  State<Dino> createState() => _DinoState();
}

class _DinoState extends State<Dino> {
  List<Widget?> gridItems = List.generate(40, (index) {
    if (index == 17) {
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
          color: Colors.blue,
          size: 40.0,
        ),
      );
    } else if (index == 2) {
      return Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(5),
        child: Center(
          child: Text(
            "Dino",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
          color: Colors.blue,
          size: 40.0,
        ),
      );
    } else if (index == 27) {
      return GestureDetector(
        onTap: () {
          print("Clicked on dino-quest.png");
        },
        child: Image.asset(
          'lib/assets/images/dino-quest.png',
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 31) {
      return GestureDetector(
        onTap: () {
          print("Clicked on dino-popcorn.png");
        },
        child: Image.asset(
          'lib/assets/images/dino-popcorn.png',
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 33) {
      return GestureDetector(
        onTap: () {
          print("Clicked on dino-shop.png");
        },
        child: Image.asset(
          'lib/assets/images/dino-shop.png',
          fit: BoxFit.cover,
        ),
      );
    } else if (index == 37) {
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
        margin: EdgeInsets.all(5),
      );
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Dino"),
      body: GridView.builder(
        itemCount: gridItems.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, index) {
          // Check if the item is null, and return an empty container if it is
          return gridItems[index] ?? Container();
        },
      ),
      bottomNavigationBar: MyNavbar(),
    );
  }
}
