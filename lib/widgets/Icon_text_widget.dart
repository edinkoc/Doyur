import 'package:flutter/cupertino.dart';
import 'package:myapp/widgets/small_text.dart';


class IconText extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color;
  final Color IconColor;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.IconColor, required int size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: IconColor),
        SizedBox(width: 5),
        SmallText(color: Color(0xFF7A838C), text: text, size: 12,),

      ],
    );
  }
}


