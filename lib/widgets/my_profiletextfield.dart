import 'package:dino_diary/style/app_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfileTextField extends StatefulWidget {
  final String label;
  final int maxLines;
  final String text;
  final ValueChanged<String> onChanged;
  const MyProfileTextField({
    Key? key,
    required this.label,
    this.maxLines = 1,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MyProfileTextField> createState() => _MyProfileTextFieldState();
}

class _MyProfileTextFieldState extends State<MyProfileTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppStyle.textcolor),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppStyle.textcolor2, width: 2)),
              fillColor: Color(0xFFFAF3DD),
              filled: true,
            ),
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
          ),
        ],
      );
}
