import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:myapp/config/theme/colors.dart';

class WhiteBorderContainer extends StatelessWidget {
  final Widget widget;
  final double? height;
  final double? width;
  const WhiteBorderContainer({
    required this.widget,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBorder(
      borderRadius: BorderRadius.circular(4.0),
      gradientColors: [AppColors.dark, AppColors.lightGray],
      child: Container(
        width: width ?? 80,
        height: height ?? 50,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: widget,
      ),
    );
  }
}
