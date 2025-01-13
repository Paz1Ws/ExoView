import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:myapp/config/theme/colors.dart';

class WhiteBorderContainer extends StatelessWidget {
  final Widget widget;
  final double? height;
  final double? width;
  final bool withAnimation;
  final double border;
  const WhiteBorderContainer({
    required this.widget,
    this.withAnimation = true,
    this.height,
    required this.border,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return withAnimation
        ? AnimatedGradientBorder(
            animationProgress: 2.5,
            borderSize: 1,
            glowSize: 0,
            animationTime: 5,
            borderRadius: BorderRadius.circular(border),
            gradientColors: [AppColors.dark, AppColors.lightGray],
            child: widget,
          )
        : Container(
            width: width ?? 30,
            decoration: BoxDecoration(
              color: AppColors.veryDarkPurple,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: AppColors.veryLightGray,
                width: 1,
              ),
            ),
            height: height ?? 60,
            child: Center(child: widget),
          );
  }
}
