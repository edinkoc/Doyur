import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/small_text.dart';

import '../dimensions.dart';
import 'Icon_text_widget.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigText(text: text, color: Color(0xFF123650), size: Dimensions.Font26),
        SizedBox(height: Dimensions.Height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => Icon(Icons.star, color: Color(0xFFDC3A3A), size: 15),
              ),
            ),
            SizedBox(width: 10),
            SmallText(text: "4.9", color: Color(0xFF123650), size: 12),
            SizedBox(width: 10),
            SmallText(color: Color(0xFF123650), text: "16750", size: 12),
            SizedBox(width: 10),
            SmallText(color: Color(0xFF123650), text: "comments", size: 12),
          ],
        ),
        SizedBox(height: Dimensions.Height20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconText(
              icon: Icons.place,
              text: '3.8 km',
              color: Color(0xFF123650),
              IconColor: Color(0xFF322646),
              size: 1,
            ),
            SizedBox(width: 15),
            IconText(
              icon: Icons.access_time_filled,
              text: '30 min',
              color: Color(0xFF123650),
              IconColor: Color(0xFFF35921),
              size: 1,
            ),
            SizedBox(width: 15),
            IconText(
              icon: Icons.circle,
              text: 'Available',
              color: Color(0xFF123650),
              IconColor: Color(0xFF146024),
              size: 1,
            ),
          ],
        ),
      ],
    );
  }
}
