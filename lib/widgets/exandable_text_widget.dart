import 'package:flutter/material.dart';
import 'dart:math';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    print("Text length: ${widget.text.length}");

    String displayedText = isExpanded ? widget.text : widget.text.substring(0, min(widget.text.length, 200));
    print("Displayed Text: $displayedText");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayedText,
          style: TextStyle(color: Color(0xFF123650)),
        ),
        if (widget.text.length > 200)
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                Text(
                  isExpanded ? "Show less" : "Show more",
                  style: TextStyle(color: Color(0xFF123650)),
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_circle,
                  color: Color(0xFF123650),
                ),
              ],
            ),
          )
      ],
    );
  }
}
