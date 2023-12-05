import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({super.key});

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildButton(context, '50', 'Registros'),
            buildDivider(),
            buildButton(context, '20', 'Nivel dino'),
            buildDivider(),
            buildButton(context, '4', 'Amigos'),
          ],
        ),
      );

  Widget buildDivider() => Container(height: 24, child: VerticalDivider());

  buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
