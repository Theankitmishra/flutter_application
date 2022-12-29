import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppText({
    super.key,
    required this.text,
    this.color = Colors.black54,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
