import 'package:flutter/material.dart';
import 'package:navigator_2/utils/app_dimens_util.dart';
import 'package:navigator_2/widgets/colored_text.dart';

class ColorGridWidget extends StatelessWidget {
  final List<Color> colors;
  final Function(Color) onColorTap;

  const ColorGridWidget({
    Key? key,
    required this.colors,
    required this.onColorTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        var color = colors[index];
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                onColorTap(color);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
              ),
              child: ColoredText(color: color),
            ),
          ),
        );
      },
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: AppDimens.SIZE_SPACING_MEDIUM,
        mainAxisSpacing: AppDimens.SIZE_SPACING_MEDIUM,
        childAspectRatio: 1,
      ),
    );
  }
}
