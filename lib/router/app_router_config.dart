import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/utils/app_utils.dart';

class AppRouteConfig {
  final Color? selectedColor;
  final ShapeBorderType? selectedShapeBorderType;
  final bool unknown;

  AppRouteConfig.home()
      : unknown = false,
        selectedColor = null,
        selectedShapeBorderType = null;

  AppRouteConfig.unknown()
      : unknown = true,
        selectedColor = null,
        selectedShapeBorderType = null;

  AppRouteConfig.selectedColor(String color)
      : unknown = false,
        selectedColor = AppUtils.getColorFromHex(color),
        selectedShapeBorderType = null;

  AppRouteConfig.selectedShapeBorderType(
    String color,
    ShapeBorderType? shapeBorderType,
  )   : unknown = false,
        selectedColor = AppUtils.getColorFromHex(color),
        selectedShapeBorderType = shapeBorderType;

  bool get isUnknown => unknown;
  bool get isHomePage =>
      unknown == false &&
      selectedColor == null &&
      selectedShapeBorderType == null;
  bool get isColorPage =>
      unknown == false &&
      selectedColor != null &&
      selectedShapeBorderType == null;
  bool get isShapePage =>
      unknown == false &&
      selectedColor != null &&
      selectedShapeBorderType != null;
}
