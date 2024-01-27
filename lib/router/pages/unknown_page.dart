import 'package:flutter/material.dart';
import 'package:navigator_2/screens/unknown_screen.dart';

class UnknownPage extends Page {
  const UnknownPage() : super(key: const ValueKey('UnknownPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return const UnknownScreen();
        });
  }
}
