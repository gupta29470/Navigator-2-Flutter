import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/screens/shape_screen.dart';

class ShapePage extends Page {
  final Color color;
  final ShapeBorderType shapeBorderType;

  const ShapePage({
    required this.color,
    required this.shapeBorderType,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return ShapeScreen(
          color: color,
          shapeBorderType: shapeBorderType,
        );
      },
    );
  }
}
