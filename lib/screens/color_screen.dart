import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/widgets/shape_border_grid_view.dart';

class ColorScreen extends StatelessWidget {
  final Color color;
  final Function(ShapeBorderType) onShapeTap;

  const ColorScreen({
    Key? key,
    required this.color,
    required this.onShapeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$color'),
        backgroundColor: color,
      ),
      body: ShapeBorderGridView(
        color: color,
        onShapeTap: onShapeTap,
      ),
    );
  }
}
