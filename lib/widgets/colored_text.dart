import 'package:flutter/material.dart';

class ColoredText extends StatelessWidget {
  final Color? color;
  final String? text;

  const ColoredText({
    Key? key,
    required this.color,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = ThemeData.estimateBrightnessForColor(
      color ?? Colors.black,
    );
    Color textColor =
        brightness == Brightness.light ? Colors.black : Colors.white;
    return Text(
      text == null ? "#$color" : text!,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: textColor),
    );
  }
}
