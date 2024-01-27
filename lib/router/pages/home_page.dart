import 'package:flutter/material.dart';
import 'package:navigator_2/screens/home_screen.dart';

class HomePage extends Page {
  final Function(Color) onColorTap;

  const HomePage({
    required this.onColorTap,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return HomeScreen(
          onColorTap: onColorTap,
        );
      },
    );
  }
}
