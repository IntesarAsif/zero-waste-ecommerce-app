import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({
    super.key,
    this.color = const Color (0xFF333d2b),
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    this.size = 20
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: 1,
      style: TextStyle(color: color, fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: size),
    );
  }
}
