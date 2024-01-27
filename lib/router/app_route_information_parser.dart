import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/router/app_router_config.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRouteConfig> {
  // this is for in app routing
  @override
  Future<AppRouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final List<String> pathSegments = routeInformation.uri.pathSegments;
    if (pathSegments.isEmpty) {
      return AppRouteConfig.home();
    } else if (pathSegments.length == 1) {
      final String first = pathSegments[0];
      if (first == "home") {
        return AppRouteConfig.home();
      } else {
        return AppRouteConfig.unknown();
      }
    } else if (pathSegments.length == 2) {
      final String first = pathSegments[0];
      final String second = pathSegments[1];
      if (first == "colors") {
        return AppRouteConfig.selectedColor(second);
      } else {
        return AppRouteConfig.unknown();
      }
    } else if (pathSegments.length == 3) {
      final String first = pathSegments[0];
      final String second = pathSegments[1];
      final String third = pathSegments[2];
      final ShapeBorderType? shapeBorderType = extractShapeBorderType(third);
      if (first == "colors" && shapeBorderType != null) {
        return AppRouteConfig.selectedShapeBorderType(second, shapeBorderType);
      } else {
        return AppRouteConfig.unknown();
      }
    } else {
      return AppRouteConfig.unknown();
    }
  }

  // this will update url
  @override
  RouteInformation? restoreRouteInformation(AppRouteConfig configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse("/unknown"));
    } else if (configuration.isHomePage) {
      return RouteInformation(uri: Uri.parse("/home"));
    } else if (configuration.isColorPage) {
      return RouteInformation(
          uri: Uri.parse("/colors/${configuration.selectedColor.toString()}"));
    } else if (configuration.isShapePage) {
      return RouteInformation(
          uri: Uri.parse(
              "/colors/${configuration.selectedColor.toString()}/${configuration.selectedShapeBorderType?.stringRepresentation()}"));
    } else {
      return null;
    }
  }

  ShapeBorderType? extractShapeBorderType(String shapeBorderTypeValue) {
    final value = shapeBorderTypeValue.toLowerCase();
    switch (value) {
      case CONTINUOUS_SHAPE:
        return ShapeBorderType.CONTINUOUS;
      case BEVELED_SHAPE:
        return ShapeBorderType.BEVELED;
      case ROUNDED_SHAPE:
        return ShapeBorderType.ROUNDED;
      case STADIUM_SHAPE:
        return ShapeBorderType.STADIUM;
      case CIRCLE_SHAPE:
        return ShapeBorderType.CIRCLE;
      default:
        return null;
    }
  }
}
