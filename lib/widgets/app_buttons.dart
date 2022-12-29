import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundcolor;
  double size;
  final Color bordercolor;
  bool isIcon;
  AppButtons(
      {super.key,
      this.isIcon = false,
      this.text = "hi",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundcolor,
      required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: bordercolor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundcolor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
