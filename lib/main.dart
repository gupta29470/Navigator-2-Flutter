import 'package:flutter/material.dart';
import 'package:navigator_2/router/app_route_information_parser.dart';
import 'package:navigator_2/router/app_router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouterDelegate delegate = AppRouterDelegate();
  final AppRouteInformationParser informationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: delegate,
      routeInformationParser: informationParser,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
