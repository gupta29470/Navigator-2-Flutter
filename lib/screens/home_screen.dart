import 'package:flutter/material.dart';
import 'package:navigator_2/widgets/color_grid_widget.dart';

class HomeScreen extends StatelessWidget {
  final Function(Color) onColorTap;
  final List<Color> colors = Colors.primaries.reversed.toList();

  HomeScreen({Key? key, required this.onColorTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ColorGridWidget(
        colors: Colors.primaries.reversed.toList(),
        onColorTap: onColorTap,
      ),
    );
  }
}
