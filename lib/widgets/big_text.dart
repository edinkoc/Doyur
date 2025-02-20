import 'package:flutter/material.dart';
import 'package:myapp/colors.dart';
import 'package:myapp/dimensions.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow textOverflow;

  const BigText({
    Key? key,
    required this.color,
    this.size = 0,
    required this.text,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size == 0?Dimensions.Font20: size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      overflow: textOverflow,
    );
  }
}
