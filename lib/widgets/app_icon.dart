import 'package:flutter/cupertino.dart';
import 'package:myapp/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color IconColor;
  final double Size;
  final double IconSize;
  AppIcon({Key? key,
    required this.icon,
     this.backgroundColor = const Color(0xf5b0aaaa),
     this.IconColor = const Color(0xff0c2f60),
     this.Size = 40,
     this.IconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Size,
      height: Size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: IconColor,
        size: IconSize,
      )
    );
  }
}
