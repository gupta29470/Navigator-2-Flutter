import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/screens/color_screen.dart';

class ColorPage extends Page {
  final Function(ShapeBorderType) onShapeTap;
  final Color selectedColor;

  const ColorPage({
    required this.onShapeTap,
    required this.selectedColor,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return ColorScreen(
          onShapeTap: onShapeTap,
          color: selectedColor,
        );
      },
    );
  }
}
