import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/widgets/shape_button.dart';

class ShapeScreen extends StatelessWidget {
  final Color color;
  final ShapeBorderType shapeBorderType;

  const ShapeScreen({
    Key? key,
    required this.color,
    required this.shapeBorderType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${shapeBorderType.stringRepresentation().toUpperCase()} $color ',
        ),
        backgroundColor: color,
      ),
      body: Center(
        child: ShapedButton(
          color: color,
          shapeBorderType: shapeBorderType,
        ),
      ),
    );
  }
}
