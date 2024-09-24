import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:myapp/config/theme/colors.dart';

class WhiteBorderContainer extends StatelessWidget {
  final Widget widget;
  final double? height;
  final double? width;
  final bool withAnimation;
  const WhiteBorderContainer({
    required this.widget,
    this.withAnimation = true,
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return withAnimation
        ? AnimatedGradientBorder(
            animationTime: 100,
            animationProgress: 2.5,
            borderSize: 1,
            glowSize: 0,
            borderRadius: BorderRadius.circular(4.0),
            gradientColors: const [AppColors.dark, AppColors.lightGray],
            child: Container(
              width: width ?? 80,
              decoration: BoxDecoration(
                color: AppColors.veryDarkPurple,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              height: height ?? 50,
              padding: const EdgeInsets.all(8.0),
              child: widget,
            ),
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
