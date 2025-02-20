import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;
  final TextOverflow textOverflow;

  const SmallText({
    Key? key,
    required this.color,
    this.size = 10,
    this.height = 1.6,
    required this.text,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.normal,
        height: height,
      ),
      overflow: textOverflow,
    );
  }
}
