import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/router/app_router_config.dart';
import 'package:navigator_2/router/pages/color_page.dart';
import 'package:navigator_2/router/pages/home_page.dart';
import 'package:navigator_2/router/pages/shape_page.dart';
import 'package:navigator_2/router/pages/unknown_page.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteConfig> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Color? _selectedColor;
  ShapeBorderType? _selectedShapeBorderType;
  bool? _show404;

  set selectedColor(Color? color) {
    _selectedColor = color;
    notifyListeners();
  }

  set selectedShapeBorderType(ShapeBorderType? shapeBorderType) {
    _selectedShapeBorderType = shapeBorderType;
    notifyListeners();
  }

  set show404(bool? value) {
    _show404 = value;
    if (value == true) {
      _selectedColor = null;
      selectedShapeBorderType = null;
    }
    notifyListeners();
  }

  bool? get show404 => _show404;

  Color? get selectedColor => _selectedColor;

  ShapeBorderType? get selectedShapeBorderType => _selectedShapeBorderType;

  @override
  AppRouteConfig? get currentConfiguration {
    if (show404 == true) {
      return AppRouteConfig.unknown();
    } else if (selectedColor == null) {
      return AppRouteConfig.home();
    } else if (selectedShapeBorderType == null) {
      return AppRouteConfig.selectedColor(
          selectedColor?.value.toString() ?? "");
    } else if (selectedShapeBorderType != null) {
      return AppRouteConfig.selectedShapeBorderType(
        selectedColor?.value.toString() ?? "",
        selectedShapeBorderType,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: show404 == true
          ? [const UnknownPage()]
          : [
              HomePage(
                onColorTap: (color) {
                  selectedColor = color;
                },
              ),
              if (_selectedColor != null)
                ColorPage(
                  onShapeTap: (shape) {
                    selectedShapeBorderType = shape;
                  },
                  selectedColor: selectedColor!,
                ),
              if (selectedColor != null && selectedShapeBorderType != null)
                ShapePage(
                  color: selectedColor!,
                  shapeBorderType: selectedShapeBorderType!,
                ),
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (selectedShapeBorderType == null) {
          selectedColor = null;
        }

        selectedShapeBorderType = null;

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  // If we manually type url this will update variables according to that
  @override
  Future<void> setNewRoutePath(AppRouteConfig configuration) async {
    if (configuration.unknown) {
      show404 = true;
    } else if (configuration.isHomePage) {
      show404 = false;
      selectedColor = null;
      selectedShapeBorderType = null;
    } else if (configuration.isColorPage) {
      show404 = false;
      selectedColor = configuration.selectedColor;
      selectedShapeBorderType = null;
    } else if (configuration.isShapePage) {
      show404 = false;
      selectedColor = selectedColor;
      selectedShapeBorderType = configuration.selectedShapeBorderType;
    } else {
      print(' Could not set new route');
    }
  }
}
