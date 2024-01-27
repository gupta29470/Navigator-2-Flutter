import 'package:flutter/material.dart';
import 'package:navigator_2/enums/shape_border_type.dart';
import 'package:navigator_2/utils/app_dimens_util.dart';
import 'package:navigator_2/widgets/colored_text.dart';

class ShapedButton extends StatelessWidget {
  final Color? color;
  final ShapeBorderType shapeBorderType;
  final VoidCallback? onPressed;
  final String? text;

  const ShapedButton({
    Key? key,
    required this.color,
    required this.shapeBorderType,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.SIZE_SPACING_LARGE),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: shapeBorderType.getShapeBorder() as OutlinedBorder?,
        ),
        onPressed: onPressed ?? () {},
        child: ColoredText(
          color: color,
          text: text ?? shapeBorderType.stringRepresentation(),
        ),
      ),
    );
  }
}
